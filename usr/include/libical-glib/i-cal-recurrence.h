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

#ifndef I_CAL_RECURRENCE_H
#define I_CAL_RECURRENCE_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_RECURRENCE \
    (i_cal_recurrence_get_type ())

#define I_CAL_RECURRENCE(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_RECURRENCE, ICalRecurrence))

#define I_CAL_RECURRENCE_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_RECURRENCE, ICalRecurrenceClass))

#define I_CAL_IS_RECURRENCE(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_RECURRENCE))

#define I_CAL_IS_RECURRENCE_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_RECURRENCE))

/**
 * ICalRecurrence:
 *
 * This is the ICalRecurrence instance.
 */

/**
 * ICalRecurrenceClass:
 *
 * This is the ICalRecurrence class.
 */
typedef struct _ICalRecurrenceClass ICalRecurrenceClass;

struct _ICalRecurrence {
    /*< private >*/
    ICalObject parent;
};

struct _ICalRecurrenceClass {
    /*< private >*/
    ICalObjectClass parent;
};
typedef enum {
	I_CAL_SECONDLY_RECURRENCE = ICAL_SECONDLY_RECURRENCE,
	I_CAL_MINUTELY_RECURRENCE = ICAL_MINUTELY_RECURRENCE,
	I_CAL_HOURLY_RECURRENCE = ICAL_HOURLY_RECURRENCE,
	I_CAL_DAILY_RECURRENCE = ICAL_DAILY_RECURRENCE,
	I_CAL_WEEKLY_RECURRENCE = ICAL_WEEKLY_RECURRENCE,
	I_CAL_MONTHLY_RECURRENCE = ICAL_MONTHLY_RECURRENCE,
	I_CAL_YEARLY_RECURRENCE = ICAL_YEARLY_RECURRENCE,
	I_CAL_NO_RECURRENCE = ICAL_NO_RECURRENCE
} ICalRecurrenceFrequency;

typedef enum {
	I_CAL_NO_WEEKDAY = ICAL_NO_WEEKDAY,
	I_CAL_SUNDAY_WEEKDAY = ICAL_SUNDAY_WEEKDAY,
	I_CAL_MONDAY_WEEKDAY = ICAL_MONDAY_WEEKDAY,
	I_CAL_TUESDAY_WEEKDAY = ICAL_TUESDAY_WEEKDAY,
	I_CAL_WEDNESDAY_WEEKDAY = ICAL_WEDNESDAY_WEEKDAY,
	I_CAL_THURSDAY_WEEKDAY = ICAL_THURSDAY_WEEKDAY,
	I_CAL_FRIDAY_WEEKDAY = ICAL_FRIDAY_WEEKDAY,
	I_CAL_SATURDAY_WEEKDAY = ICAL_SATURDAY_WEEKDAY
} ICalRecurrenceWeekday;

typedef enum {
	I_CAL_SKIP_BACKWARD = ICAL_SKIP_BACKWARD,
	I_CAL_SKIP_FORWARD = ICAL_SKIP_FORWARD,
	I_CAL_SKIP_OMIT = ICAL_SKIP_OMIT,
	I_CAL_SKIP_UNDEFINED = ICAL_SKIP_UNDEFINED
} ICalRecurrenceSkip;

typedef enum {
	I_CAL_RECURRENCE_ARRAY_MAX = ICAL_RECURRENCE_ARRAY_MAX
} ICalRecurrenceArrayMaxValues;

typedef enum {
	I_CAL_BY_SECOND_SIZE = ICAL_BY_SECOND_SIZE,
	I_CAL_BY_MINUTE_SIZE = ICAL_BY_MINUTE_SIZE,
	I_CAL_BY_HOUR_SIZE = ICAL_BY_HOUR_SIZE,
	I_CAL_BY_MONTH_SIZE = ICAL_BY_MONTH_SIZE,
	I_CAL_BY_MONTHDAY_SIZE = ICAL_BY_MONTHDAY_SIZE,
	I_CAL_BY_WEEKNO_SIZE = ICAL_BY_WEEKNO_SIZE,
	I_CAL_BY_YEARDAY_SIZE = ICAL_BY_YEARDAY_SIZE,
	I_CAL_BY_SETPOS_SIZE = ICAL_BY_SETPOS_SIZE,
	I_CAL_BY_DAY_SIZE = ICAL_BY_DAY_SIZE
} ICalRecurrenceArraySizes;


LIBICAL_ICAL_EXPORT
GType 		i_cal_recurrence_get_type	(void);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_recurrence_rscale_is_supported
						(void);

LIBICAL_ICAL_EXPORT
ICalArray *	i_cal_recurrence_rscale_supported_calendars
						(void);

LIBICAL_ICAL_EXPORT
ICalRecurrence *
		i_cal_recurrence_new		(void);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_clear		(ICalRecurrence *r);

LIBICAL_ICAL_EXPORT
ICalRecurrenceWeekday 
		i_cal_recurrence_day_day_of_week
						(gshort day);

LIBICAL_ICAL_EXPORT
gint 		i_cal_recurrence_day_position	(gshort day);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_recurrence_month_is_leap	(gshort month);

LIBICAL_ICAL_EXPORT
gint 		i_cal_recurrence_month_month	(gshort month);

LIBICAL_ICAL_EXPORT
ICalRecurrence *
		i_cal_recurrence_new_from_string
						(const gchar *str);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_recurrence_to_string	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_recurrence_get_until	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_until	(ICalRecurrence *recur,
						 ICalTime *until);

LIBICAL_ICAL_EXPORT
ICalRecurrenceFrequency 
		i_cal_recurrence_get_freq	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_freq	(ICalRecurrence *recur,
						 ICalRecurrenceFrequency freq);

LIBICAL_ICAL_EXPORT
gint 		i_cal_recurrence_get_count	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_count	(ICalRecurrence *recur,
						 gint count);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_interval	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_interval	(ICalRecurrence *recur,
						 gshort interval);

LIBICAL_ICAL_EXPORT
ICalRecurrenceWeekday 
		i_cal_recurrence_get_week_start	(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_week_start	(ICalRecurrence *recur,
						 ICalRecurrenceWeekday week_start);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_second_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_second_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_second	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_second	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_minute_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_minute_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_minute	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_minute	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_hour_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_hour_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_hour	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_hour	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_day_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_day_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_day	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_day	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_month_day_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_month_day_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_month_day
						(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_month_day
						(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_year_day_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_year_day_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_year_day
						(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_year_day
						(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_week_no_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_week_no_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_week_no	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_week_no	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_month_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_month_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_month	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_month	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

LIBICAL_ICAL_EXPORT
GArray *	i_cal_recurrence_get_by_set_pos_array
						(ICalRecurrence *recur);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_set_pos_array
						(ICalRecurrence *recur,
						 GArray *values);

LIBICAL_ICAL_EXPORT
gshort 		i_cal_recurrence_get_by_set_pos	(ICalRecurrence *recur,
						 guint index);

LIBICAL_ICAL_EXPORT
void		i_cal_recurrence_set_by_set_pos	(ICalRecurrence *recur,
						 guint index,
						 gshort value);

G_END_DECLS

#endif /* I_CAL_RECURRENCE_H */
