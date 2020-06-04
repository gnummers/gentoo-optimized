/* Generated file (by generator) */

/*
 * Copyright (C) 2015 William Yu <williamyu@gnome.org>
 *
 * This library is free software: you can redistribute it and/or modify it
 * under the terms of version 2.1. of the GNU Lesser General Public License
 * as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
 * for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library. If not, see <https://www.gnu.org/licenses/>.
 */

#if !defined (__LIBICAL_GLIB_H_INSIDE__) && !defined (LIBICAL_GLIB_COMPILATION)
#error "Only <libical-glib/libical-glib.h> can be included directly."
#endif

#ifndef I_CAL_MIME_H
#define I_CAL_MIME_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

/**
 * ICalMimeParseFunc:
 * @bytes: (array length=size) (element-type gchar): the bytes to process
 * @size: the length of the bytes array
 * @user_data: the user data
 *
 * Returns: A #ICalComponent as a string
 */
typedef gchar *(*ICalMimeParseFunc)(gchar *bytes, size_t size, gpointer user_data);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_mime_parse		(ICalMimeParseFunc func,
						 gpointer user_data);

G_END_DECLS

#endif /* I_CAL_MIME_H */
