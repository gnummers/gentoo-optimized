/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/*
 * Copyright (C) 2012 David Zeuthen <zeuthen@gmail.com>
 *
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#if !defined (__UDISKS_INSIDE_UDISKS_H__) && !defined (UDISKS_COMPILATION)
#error "Only <udisks/udisks.h> can be included directly."
#endif

#ifndef __UDISKS_VERSION_H__
#define __UDISKS_VERSION_H__

#include <gio/gio.h>

G_BEGIN_DECLS

/**
 * UDISKS_MAJOR_VERSION:
 *
 * The major version of the libudisks2 header files.
 */
#define UDISKS_MAJOR_VERSION 2

/**
 * UDISKS_MINOR_VERSION:
 *
 * The minor version of the libudisks2 header files.
 */
#define UDISKS_MINOR_VERSION 8

/**
 * UDISKS_MICRO_VERSION:
 *
 * The micro version of the libudisks2 header files.
 */
#define UDISKS_MICRO_VERSION 4

/**
 * UDISKS_CHECK_VERSION:
 * @major: The major version to check for.
 * @minor: the minor version to check for.
 * @micro: The micro version to check for.
 *
 * Macro to check against the version of the libudisks2 library that
 * is being compiled against.
 *
 * Returns: %TRUE if the version of the libudisks2 header files is the
 * same as or newer than the passed in version.
 */
#define UDISKS_CHECK_VERSION(major,minor,micro)    \
    (UDISKS_MAJOR_VERSION > (major) || \
     (UDISKS_MAJOR_VERSION == (major) && UDISKS_MINOR_VERSION > (minor)) || \
     (UDISKS_MAJOR_VERSION == (major) && UDISKS_MINOR_VERSION == (minor) && \
      UDISKS_MICRO_VERSION >= (micro)))


G_END_DECLS

#endif /* __UDISKS_VERSION_H__ */
