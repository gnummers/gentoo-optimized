#!/bin/bash
#
# Copyright (c) 2008 Voltaire, Inc. All rights reserved.
# Copyright (c) 2006 Mellanox Technologies. All rights reserved.
#
# This Software is licensed under one of the following licenses:
#
# 1) under the terms of the "Common Public License 1.0" a copy of which is
#    available from the Open Source Initiative, see
#    http://www.opensource.org/licenses/cpl.php.
#
# 2) under the terms of the "The BSD License" a copy of which is
#    available from the Open Source Initiative, see
#    http://www.opensource.org/licenses/bsd-license.php.
#
# 3) under the terms of the "GNU General Public License (GPL) Version 2" a
#    copy of which is available from the Open Source Initiative, see
#    http://www.opensource.org/licenses/gpl-license.php.
#
# Licensee has the right to choose one of the above licenses.
#
# Redistributions of source code must retain the above copyright
# notice and one of the license notices.
#
# Redistributions in binary form must reproduce both the above copyright
# notice, one of the license notices in the documentation
# and/or other materials provided with the distribution.
#
#

# OpenSM found to have the following problem
# when handover is performed:
# If some of the cluster nodes are rebooted during the handover they loose their LID assignment.
# The reason for it is that the standby SM does not obey its own Guid to LID table
# and simply uses the discovered LIDs. If some nodes are not available for it
# their previous LID assignment is lost forever.

# The idea is to use an external daemon that will distribute
# the semi-static LID assignment table from the master SM to all standby SMs.
# A standby SM, becoming a master . needs to obey the copied semi static LID assignment table.

prefix=/usr
exec_prefix=${prefix}

CONFIG=/etc/conf.d/sldd
if [ -f $CONFIG ]; then
	. $CONFIG
fi

SLDD_DEBUG=${SLDD_DEBUG:-0}

CACHE_FILE=${CACHE_FILE:-/var/cache/opensm/guid2lid:/var/cache/opensm/guid2mkey:/var/cache/opensm/neighbors}
declare -a arr_CACHE_FILES
arr_CACHE_FILES=(`echo $CACHE_FILE| sed 's/:/\n/g' | sort | uniq`)

PING='ping -w 1 -c 1'

RCP=${RCP:-/usr/bin/scp}
RSH=${RSH:-/usr/bin/ssh}
IFCONFIG=${IFCONFIG:-'/bin/ifconfig -a'}

declare -i SLDD_DEBUG
RESCAN_TIME=${RESCAN_TIME:-60}

if [ -z "${OSM_HOSTS}" ]; then
	[ $SLDD_DEBUG -eq 1 ] &&
	echo "No OpenSM servers (OSM_HOSTS) configured for the IB subnet."
	exit 0
fi


declare -a arr_OSM_HOSTS
arr_OSM_HOSTS=(${OSM_HOSTS})

num_of_osm_hosts=${#arr_OSM_HOSTS[@]}

if [ ${num_of_osm_hosts} -eq 1 ]; then
	[ $SLDD_DEBUG -eq 1 ] &&
	echo "One OpenSM server configured in the IB subnet." &&
	echo "Nothing to be done for SLDD"

	exit 0
fi

trap 'trap_handler' 15

trap_handler()
{
	logger -i "SLDD: Exiting."
	exit 0
}

is_alive()
{
	$PING $1 > /dev/null 2>&1
	return $?
}

is_local()
{
	$IFCONFIG | grep -w "$1" > /dev/null 2>&1
	return $?
}

update_remote_cache()
{
	/bin/rm -f "$1.upd"
	/bin/cp -a "$1" "$1.upd"

	[ $SLDD_DEBUG -eq 1 ] &&
	echo "Updating remote cache file"

	for host in ${OSM_HOSTS}
	do
		# Skip local host update
		if [ "${host}" == "${local_host}" ]; then
			continue
		fi

		if is_alive $host; then
			cache_dir=$(dirname "$1")
			stat=$($RSH $host "/bin/mkdir -p ${cache_dir} > /dev/null 2>&1; /bin/rm -f "$1.${local_host}" > /dev/null 2>&1; echo \$?" | tr -d '[:space:]')
			if [ "X${stat}" == "X0" ]; then
				[ $SLDD_DEBUG -eq 1 ] &&
				echo "Updating $host"
				logger -i "SLDD: updating $host with $1"
				$RCP "$1.upd" "${host}:$1.${local_host}"
				/bin/cp "$1.upd" "$1.${host}"
			else
				[ $SLDD_DEBUG -eq 1 ] &&
				echo "$RSH to $host failed."
				logger -i "SLDD: Failed to update $host with $1. $RSH without password should be enabled"
				exit 5
			fi
		else
			[ $SLDD_DEBUG -eq 1 ] &&
			echo "$host is down."
			continue
		fi
	done
}

get_latest_remote_cache()
{
	# Find most updated remote cache file (the suffix should be like ip address: *.*.*.*)
	echo -n "$(/bin/ls -1t $1.*.* 2> /dev/null | head -1)"
}

get_largest_remote_cache()
{
	# Find largest (size) remote cache file (the suffix should be like ip address: *.*.*.*)
	echo -n "$(/bin/ls -1S $1.*.* 2> /dev/null | head -1)"
}

swap_cache_files()
{
	/bin/rm -f "$1.old"
	/bin/mv "$1" "$1.old"
	/bin/cp "$2" "$1"
	touch "$1.tmp"
}

# Find local host in the osm hosts list
local_host=""
for host in ${OSM_HOSTS}
do
	if is_local $host; then
		local_host=${host}
	fi
done

# Get cache file info
declare -i new_size=0
declare -ai arr_last_size
for i in  ${!arr_CACHE_FILES[@]}
do
	arr_last_size[$i]=0
done
declare -i largest_remote_cache_size=0

for i in ${!arr_CACHE_FILES[@]}
do
	cache_file=${arr_CACHE_FILES[$i]}
	if [ -e ${cache_file} ]; then
		arr_last_size[$i]=$(du -b ${cache_file} | awk '{print$1}' | tr -d '[:space:]')
	else
		touch ${cache_file} ${cache_file}.tmp
	fi

#	if [ ${arr_last_size[$i]} -gt 0 ]; then
#		# First time update
#		update_remote_cache ${cache_file}
#	fi
done

while true
do
	for i in ${!arr_CACHE_FILES[@]}
	do
		cache_file=${arr_CACHE_FILES[$i]}
		if [ -s "${cache_file}" ]; then
			new_size=$(du -b ${cache_file} | awk '{print$1}' | tr -d '[:space:]')
			# Check if local cache file grew from its last version or the time stamp changed
			if [ ${new_size} -gt ${arr_last_size[$i]} ]
			   [ "$(/bin/ls -1t ${cache_file} ${cache_file}.tmp 2> /dev/null | head -1)"  != "${cache_file}.tmp" ]; then
				largest_remote_cache=$(get_largest_remote_cache ${cache_file})
				if [[ -n "${largest_remote_cache}" && -s "${largest_remote_cache}" ]]; then
					largest_remote_cache_size=$(du -b ${largest_remote_cache} 2> /dev/null | awk '{print$1}' | tr -d '[:space:]')
				else
					largest_remote_cache_size=0
				fi

				# Check if local cache file larger than remote chache file
				if [ ${new_size} -gt ${largest_remote_cache_size} ]; then
					[ $SLDD_DEBUG -eq 1 ] &&
					echo "Local cache file larger then remote. Update remote cache files"
					arr_last_size[$i]=${new_size}
					update_remote_cache ${cache_file}
					continue
				fi
			fi

			largest_remote_cache=$(get_largest_remote_cache ${cache_file})
			if [[ -n "${largest_remote_cache}" && -s "${largest_remote_cache}" ]]; then
				largest_remote_cache_size=$(du -b ${largest_remote_cache} 2> /dev/null | awk '{print$1}' | tr -d '[:space:]')
			else
				largest_remote_cache_size=0
			fi

			# Update local cache file from remote
			if [ ${largest_remote_cache_size} -gt ${new_size} ]; then
				[ $SLDD_DEBUG -eq 1 ] &&
				echo "Local cache file shorter then remote. Use ${largest_remote_cache}"
				logger -i "SLDD: updating local cache file with ${largest_remote_cache}"
				swap_cache_files ${cache_file} ${largest_remote_cache}
				arr_last_size[$i]=${largest_remote_cache_size}
			fi

		else # The local cache file is empty
			[ $SLDD_DEBUG -eq 1 ] &&
			echo "${cache_file} is empty"

			largest_remote_cache=$(get_largest_remote_cache ${cache_file})
			if [[ -n "${largest_remote_cache}" && -s "${largest_remote_cache}" ]]; then
				# Copy it to the current cache
				[ $SLDD_DEBUG -eq 1 ] &&
				echo "Local cache file is empty. Use ${largest_remote_cache}"
				logger -i "SLDD: updating local cache file with ${largest_remote_cache}"
				swap_cache_files ${cache_file} ${largest_remote_cache}
			fi

		fi
	done

	[ $SLDD_DEBUG -eq 1 ] &&
	echo "Sleeping ${RESCAN_TIME} seconds."
	sleep ${RESCAN_TIME}

done
