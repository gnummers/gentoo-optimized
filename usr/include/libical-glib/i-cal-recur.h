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

#ifndef I_CAL_RECUR_H
#define I_CAL_RECUR_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>
#include <libical-glib/i-cal-recurrence.h>

G_BEGIN_DECLS


LIBICAL_ICAL_EXPORT
GArray *	i_cal_recur_expand_recurrence	(const gchar *rule,
						 time_t start,
						 gint count);

LIBICAL_ICAL_EXPORT
ICalRecurrenceWeekday 
		i_cal_recurrence_weekday_from_string
						(const gchar *str);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_recurrence_weekday_to_string
						(ICalRecurrenceWeekday kind);

LIBICAL_ICAL_EXPORT
ICalRecurrenceFrequency 
		i_cal_recurrence_frequency_from_string
						(const gchar *str);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_recurrence_frequency_to_string
						(ICalRecurrenceFrequency kind);

LIBICAL_ICAL_EXPORT
ICalRecurrenceSkip 
		i_cal_recurrence_skip_from_string
						(const gchar *str);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_recurrence_skip_to_string	(ICalRecurrenceSkip kind);

G_END_DECLS

#endif /* I_CAL_RECUR_H */
