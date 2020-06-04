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

#ifndef I_CAL_UNKNOWNTOKENHANDLING_H
#define I_CAL_UNKNOWNTOKENHANDLING_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

typedef enum {
	I_CAL_ASSUME_IANA_TOKEN = ICAL_ASSUME_IANA_TOKEN,
	I_CAL_DISCARD_TOKEN = ICAL_DISCARD_TOKEN,
	I_CAL_TREAT_AS_ERROR = ICAL_TREAT_AS_ERROR
} ICalUnknowntokenhandling;


LIBICAL_ICAL_EXPORT
ICalUnknowntokenhandling 
		i_cal_get_unknown_token_handling_setting
						(void);

LIBICAL_ICAL_EXPORT
void		i_cal_set_unknown_token_handling_setting
						(ICalUnknowntokenhandling newSetting);

G_END_DECLS

#endif /* I_CAL_UNKNOWNTOKENHANDLING_H */
