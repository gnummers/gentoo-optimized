#!/bin/bash

# requires app-portage/portage-utils and app-portage/gentoolkit-dev

: ${SOURCE_REPO:="$(realpath $(dirname $0)/../../../)"}

# @FUNCTION: bump_packages_from_set
# @USAGE: <set name> <source version> <target version>
# @DESCRIPTION:
# Using packages listed in <set name>, bump new <target version> ebuilds based on
# <source version>
bump_packages_from_set() {
	local setname="${1}"
	local sourceversion="${2}"
	local targetversion="${3}"

	local packages=$(get_package_list_from_set ${setname})

	for cp in ${packages} ; do
		trap "echo Exited without finishing!; exit;" SIGINT SIGTERM
		pushd "${cp}" > /dev/null

		local pn=$(basename $(pwd))
		local source=${pn}-${sourceversion}.ebuild
		local destination=${pn}-${targetversion}.ebuild

		cp ${source} ${destination}
		ekeyword ^all ${destination} > /dev/null

		if [[ ${destination} != *9999* ]] ; then
			ekeyword $(get_main_tree_keyword ${cp}) ${destination} > /dev/null
		fi

		repoman manifest

        	popd > /dev/null
	done
}

# @FUNCTION: bump_set_from_live
# @USAGE: <base set name> <new version>
# @DESCRIPTION:
# Creates new set <base setname>-<new version> based on <base setname>-live.
bump_set_from_live() {
	local target="${1}"
	local destination="${2}"

	cp sets/${target}-live sets/${target}-${destination}
	sed -i -e "s/~/</" -e "s/9999/${VERSION}/" -e "s/0/50:5/" sets/${target}-${destination}

}

# @FUNCTION: bump_set_from_live
# @USAGE: <base set name> <new version>
# @DESCRIPTION:
# Creates new set <base setname>-<new version> based on <base setname>-live.
create_keywords_files() {
	local setname="${1}"
	local target="${2}"

	pushd Documentation > /dev/null
	pushd package.unmask > /dev/null
	cp -r .${setname} .${target}
	pushd .${target} > /dev/null
	rm ${setname}
	ln -s  ../../../sets/${target} ${target}
	echo "# You can use this file to mask/unmask the $(pretty_setname ${target}) release." > _HEADER_
	echo "# Edit Documentation/package.unmask/.${target}/ files instead." >> _HEADER_
	popd > /dev/null
	popd > /dev/null

	pushd package.accept_keywords > /dev/null
	cp -r .${setname}.base .${target}
	pushd .${target} > /dev/null
	rm ${setname}
	ln -s  ../../../sets/${target} ${target}
	echo "# You can use this file to keyword/unkeyword the $(pretty_setname ${target}) release." > _HEADER_
	echo "# Edit Documentation/package.accept_keywords/.${target}/ files instead." >> _HEADER_
	popd > /dev/null
	popd > /dev/null
	popd > /dev/null
}

# @FUNCTION: get_main_tree_keyword
# @USAGE: <cp>
# @DESCRIPTION:
# Given a <cp>, get the keywords from the highest ebuild version in the gentoo repo.
get_main_tree_keyword() {
	local portdir="$(portageq get_repo_path / gentoo)"
	local cp="${1}"

	echo $(sed -ne 's/^KEYWORDS="\(.*\)"/\1/p' "$(ls ${portdir}/${cp}/*.ebuild | sort | tail -n 1)")
}

# @FUNCTION: get_package_list_from_set
# @USAGE: <set name>
# @DESCRIPTION:
# Given a <set name>, return all atoms with the version stripped.
get_package_list_from_set() {
	local set="${1}"

	for entry in $(grep -v ^[#@] "${SOURCE_REPO}/sets/${set}") ; do
		echo $(qatom ${entry} | cut -d " " -f 1-2 | tr " " "/")
	done

	for entry in $(grep ^@ "${SOURCE_REPO}/sets/${set}") ; do
		get_package_list_from_set ${entry/@/}
	done
}

# @FUNCTION: mark_unreleased
# @USAGE: <category-version>
# @DESCRIPTION:
# Marks a <category-version> pair as unreleased in kde5.eclass.
mark_unreleased() {
	local cv="${1}"
	sed -i -e "/^KDE_UNRELEASED/s/ )/ ${cv}&/" eclass/kde5.eclass
}

# @FUNCTION: mask_from_live_set
# @USAGE: <base set name> <target version> <filename>
# @DESCRIPTION:
# Takes sets/<base set name>-live, transforming it a profiles/package.mask/<filename>
# list of atoms with <target version>.
mask_from_live_set() {
	local set="${1}"
	local version="${2}"
	local filename="${3}"

	echo "#" >> profiles/package.mask/${filename}
	echo "# UNRELEASED" >> profiles/package.mask/${filename}
	echo "#" >> profiles/package.mask/${filename}
	cat sets/${set}-live >> profiles/package.mask/${filename}
	sed -i -e "s/9999/${version}/" profiles/package.mask/${filename}
}

# @FUNCTION: pretty_setname
# @USAGE: <setname>
# @DESCRIPTION:
# Turns a basic set name into a pretty one.
#
# For example, "kde-frameworks-5.20" turns into "KDE Frameworks 5.20".
pretty_setname() {
	local set="${1}"
	echo ${set} | tr "-" " " | sed -e "s/\b\(.\)/\u\1/g" -e "s/kde/KDE/i"
}
