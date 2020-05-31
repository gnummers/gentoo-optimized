# Copyright (c) 2014, 2015, Oracle and/or its affiliates. All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# We want boost 1.59.0 in order to build our boost/geometry code.
# The boost tarball is fairly big, and takes several minutes
# to download. So we recommend downloading/unpacking it
# only once, in a place visible from any bzr sandbox.
# We use only header files, so there should be no binary dependencies.

# Downloading the tarball takes about 5 minutes here at the office.
# Here are some size/time data for unpacking the tarball on my desktop:
#  size tarball-name
#  67M boost_1_55_0.tar.gz  unzipping headers    ~2 seconds 117M
#                           unzipping everything ~3 seconds 485M
# 8,8M boost_headers.tar.gz unzipping everything <1 second

# Invoke with -DWITH_BOOST=<directory> or set WITH_BOOST in environment.
# If WITH_BOOST is *not* set, or is set to the special value "system",
# we assume that the correct version (see below)
# is installed on the compile host in the standard location.

UNSET(WITH_BOOST)
UNSET(WITH_BOOST CACHE)

# Update the cache, to make it visible in cmake-gui.
SET(WITH_BOOST ${WITH_BOOST} CACHE PATH
  "Path to boost sources: a directory, or a tarball to be unzipped.")

# Search for the version file, first in LOCAL_BOOST_DIR or WITH_BOOST
FIND_PATH(BOOST_INCLUDE_DIR
  NAMES boost/version.hpp
  NO_DEFAULT_PATH
  PATHS ${LOCAL_BOOST_DIR}
        ${LOCAL_BOOST_DIR}/${BOOST_PACKAGE_NAME}
        ${WITH_BOOST}
)
# Then search in standard places (if not found above).
FIND_PATH(BOOST_INCLUDE_DIR
  NAMES boost/version.hpp
)

IF(NOT BOOST_INCLUDE_DIR)
  MESSAGE(FATAL_ERROR "Could not find (the correct version of) boost.")
ELSE()
  MESSAGE(STATUS "Found ${BOOST_INCLUDE_DIR}/boost/version.hpp ")
ENDIF()

MESSAGE(STATUS "BOOST_INCLUDE_DIR ${BOOST_INCLUDE_DIR}")

# Bug in sqrt(NaN) on 32bit platforms
IF(SIZEOF_VOIDP EQUAL 4)
  ADD_DEFINITIONS(-DBOOST_GEOMETRY_SQRT_CHECK_FINITENESS)
ENDIF()

SET(USING_SYSTEM_BOOST 1)
