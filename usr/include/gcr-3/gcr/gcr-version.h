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

#ifndef __GCR_VERSION_H__
#define __GCR_VERSION_H__

#if !defined (__GCR_INSIDE_HEADER__) && !defined (GCR_COMPILATION)
#error "Only <gcr/gcr.h> or <gcr/gcr-base.h> can be included directly."
#endif

/* compile time version
 */
#define GCR_MAJOR_VERSION (3)
#define GCR_MINOR_VERSION (34)
#define GCR_MICRO_VERSION (0)

/* check whether a Gcr version equal to or greater than
 * major.minor.micro.
 */
#define GCR_CHECK_VERSION(major,minor,micro)    \
	(GCR_MAJOR_VERSION > (major) || \
	 (GCR_MAJOR_VERSION == (major) && GCR_MINOR_VERSION > (minor)) || \
	 (GCR_MAJOR_VERSION == (major) && GCR_MINOR_VERSION == (minor) && \
	  GCR_MICRO_VERSION >= (micro)))

#endif /* __GCR_VERSION_H__ */
