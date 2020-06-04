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

#ifndef I_CAL_ERROR_H
#define I_CAL_ERROR_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

typedef enum {
	I_CAL_NO_ERROR = ICAL_NO_ERROR,
	I_CAL_BADARG_ERROR = ICAL_BADARG_ERROR,
	I_CAL_NEWFAILED_ERROR = ICAL_NEWFAILED_ERROR,
	I_CAL_ALLOCATION_ERROR = ICAL_ALLOCATION_ERROR,
	I_CAL_MALFORMEDDATA_ERROR = ICAL_MALFORMEDDATA_ERROR,
	I_CAL_PARSE_ERROR = ICAL_PARSE_ERROR,
	I_CAL_INTERNAL_ERROR = ICAL_INTERNAL_ERROR,
	I_CAL_FILE_ERROR = ICAL_FILE_ERROR,
	I_CAL_USAGE_ERROR = ICAL_USAGE_ERROR,
	I_CAL_UNIMPLEMENTED_ERROR = ICAL_UNIMPLEMENTED_ERROR,
	I_CAL_UNKNOWN_ERROR = ICAL_UNKNOWN_ERROR
} ICalErrorEnum;

typedef enum {
	I_CAL_ERROR_FATAL = ICAL_ERROR_FATAL,
	I_CAL_ERROR_NONFATAL = ICAL_ERROR_NONFATAL,
	I_CAL_ERROR_DEFAULT = ICAL_ERROR_DEFAULT,
	I_CAL_ERROR_UNKNOWN = ICAL_ERROR_UNKNOWN
} ICalErrorState;


LIBICAL_ICAL_EXPORT
void		i_cal_error_stop_here		(void);

LIBICAL_ICAL_EXPORT
void		i_cal_error_crash_here		(void);

LIBICAL_ICAL_EXPORT
ICalErrorEnum 	i_cal_errno_return		(void);

LIBICAL_ICAL_EXPORT
void		i_cal_error_clear_errno		(void);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_error_strerror		(ICalErrorEnum e);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_error_perror		(void);

LIBICAL_ICAL_EXPORT
void		i_cal_bt			(void);

LIBICAL_ICAL_EXPORT
void		i_cal_error_set_error_state	(ICalErrorEnum error,
						 ICalErrorState state);

LIBICAL_ICAL_EXPORT
ICalErrorState 	i_cal_error_get_error_state	(ICalErrorEnum error);

LIBICAL_ICAL_EXPORT
void		i_cal_error_set_errno		(ICalErrorEnum x);

LIBICAL_ICAL_EXPORT
ICalErrorState 	i_cal_error_supress		(const gchar *error);

LIBICAL_ICAL_EXPORT
void		i_cal_error_restore		(const gchar *error,
						 ICalErrorState es);

G_END_DECLS

#endif /* I_CAL_ERROR_H */
