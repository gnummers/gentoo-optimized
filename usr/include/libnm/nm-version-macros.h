/* -*- Mode: C; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*- */
/*
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Copyright 2011, 2015 Red Hat, Inc.
 */

#ifndef __NM_VERSION_MACROS_H__
#define __NM_VERSION_MACROS_H__

/* This header must not include glib or libnm. */

/**
 * NM_MAJOR_VERSION:
 *
 * Evaluates to the major version number of NetworkManager which this source
 * is compiled against.
 */
#define NM_MAJOR_VERSION (1)

/**
 * NM_MINOR_VERSION:
 *
 * Evaluates to the minor version number of NetworkManager which this source
 * is compiled against.
 */
#define NM_MINOR_VERSION (18)

/**
 * NM_MICRO_VERSION:
 *
 * Evaluates to the micro version number of NetworkManager which this source
 * compiled against.
 */
#define NM_MICRO_VERSION (6)

/**
 * NM_CHECK_VERSION:
 * @major: major version (e.g. 1 for version 1.2.5)
 * @minor: minor version (e.g. 2 for version 1.2.5)
 * @micro: micro version (e.g. 5 for version 1.2.5)
 *
 * Returns: %TRUE if the version of the NetworkManager header files
 * is the same as or newer than the passed-in version.
 */
#define NM_CHECK_VERSION(major,minor,micro)                         \
    (NM_MAJOR_VERSION > (major) ||                                  \
     (NM_MAJOR_VERSION == (major) && NM_MINOR_VERSION > (minor)) || \
     (NM_MAJOR_VERSION == (major) && NM_MINOR_VERSION == (minor) && NM_MICRO_VERSION >= (micro)))


#define NM_ENCODE_VERSION(major,minor,micro) ((major) << 16 | (minor) << 8 | (micro))

#define NM_VERSION_0_9_8  (NM_ENCODE_VERSION (0, 9, 8))
#define NM_VERSION_0_9_10 (NM_ENCODE_VERSION (0, 9, 10))
#define NM_VERSION_1_0    (NM_ENCODE_VERSION (1, 0, 0))
#define NM_VERSION_1_2    (NM_ENCODE_VERSION (1, 2, 0))
#define NM_VERSION_1_4    (NM_ENCODE_VERSION (1, 4, 0))
#define NM_VERSION_1_6    (NM_ENCODE_VERSION (1, 6, 0))
#define NM_VERSION_1_8    (NM_ENCODE_VERSION (1, 8, 0))
#define NM_VERSION_1_10   (NM_ENCODE_VERSION (1, 10, 0))
#define NM_VERSION_1_12   (NM_ENCODE_VERSION (1, 12, 0))
#define NM_VERSION_1_14   (NM_ENCODE_VERSION (1, 14, 0))
#define NM_VERSION_1_16   (NM_ENCODE_VERSION (1, 16, 0))
#define NM_VERSION_1_18   (NM_ENCODE_VERSION (1, 18, 0))
#define NM_VERSION_1_18_2 (NM_ENCODE_VERSION (1, 18, 2))
#define NM_VERSION_1_18_4 (NM_ENCODE_VERSION (1, 18, 4))
#define NM_VERSION_1_18_6 (NM_ENCODE_VERSION (1, 18, 6))

/* For releases, NM_API_VERSION is equal to NM_VERSION.
 *
 * For development builds, NM_API_VERSION is the next
 * stable API after NM_VERSION. When you run a development
 * version, you are already using the future API, even if
 * it is not yet release. Hence, the currently used API
 * version is the future one.  */
#define NM_API_VERSION \
    (((NM_MINOR_VERSION % 2) == 1) \
        ? NM_ENCODE_VERSION (NM_MAJOR_VERSION, NM_MINOR_VERSION + 1, 0                               ) \
        : NM_ENCODE_VERSION (NM_MAJOR_VERSION, NM_MINOR_VERSION    , ((NM_MICRO_VERSION + 1) / 2) * 2))

/* deprecated. */
#define NM_VERSION_CUR_STABLE  NM_API_VERSION

/* deprecated. */
#define NM_VERSION_NEXT_STABLE NM_API_VERSION

#define NM_VERSION NM_ENCODE_VERSION (NM_MAJOR_VERSION, NM_MINOR_VERSION, NM_MICRO_VERSION)

#endif  /* __NM_VERSION_MACROS_H__ */