/*
 * gnome-keyring
 *
 * Copyright (C) 2013 Stef Walter
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Stef Walter <stefw@gnome.org>
 */

#ifndef __GCK_VERSION_H__
#define __GCK_VERSION_H__

#if !defined (__GCK_INSIDE_HEADER__) && !defined (GCK_COMPILATION)
#error "Only <gck.h> can be included directly."
#endif

/* compile time version
 */
#define GCK_MAJOR_VERSION (3)
#define GCK_MINOR_VERSION (34)
#define GCK_MICRO_VERSION (0)

/* check whether a Gcr version equal to or greater than
 * major.minor.micro.
 */
#define GCK_CHECK_VERSION(major,minor,micro)    \
	(GCK_MAJOR_VERSION > (major) || \
	 (GCK_MAJOR_VERSION == (major) && GCK_MINOR_VERSION > (minor)) || \
	 (GCK_MAJOR_VERSION == (major) && GCK_MINOR_VERSION == (minor) && \
	  GCK_MICRO_VERSION >= (micro)))

#endif /* __GCK_VERSION_H__ */
