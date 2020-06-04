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

#ifndef I_CAL_TIME_H
#define I_CAL_TIME_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_TIME \
    (i_cal_time_get_type ())

#define I_CAL_TIME(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_TIME, ICalTime))

#define I_CAL_TIME_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_TIME, ICalTimeClass))

#define I_CAL_IS_TIME(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_TIME))

#define I_CAL_IS_TIME_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_TIME))

/**
 * ICalTime:
 *
 * This is the ICalTime instance.
 */

/**
 * ICalTimeClass:
 *
 * This is the ICalTime class.
 */
typedef struct _ICalTimeClass ICalTimeClass;

struct _ICalTime {
    /*< private >*/
    ICalObject parent;
};

struct _ICalTimeClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_time_get_type		(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new			(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_clone		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_null_time	(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_null_date	(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_current_with_zone
						(ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_today		(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_from_timet_with_zone
						(const time_t v,
						 gint is_date,
						 ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_from_string	(const gchar *str);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_new_from_day_of_year	(const gint day,
						 const gint year);

LIBICAL_ICAL_EXPORT
time_t 		i_cal_time_as_timet		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
time_t 		i_cal_time_as_timet_with_zone	(const ICalTime *tt,
						 const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_time_as_ical_string	(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_time_get_timezone		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_timezone		(ICalTime *tt,
						 const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_time_get_tzid		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_day_of_year		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_day_of_week		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_start_doy_week	(const ICalTime *tt,
						 gint fdow);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_week_number		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_is_null_time		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_is_valid_time	(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_is_date		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_is_utc		(const ICalTime *tt);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_compare		(const ICalTime *a,
						 const ICalTime *b);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_compare_date_only	(const ICalTime *a,
						 const ICalTime *b);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_compare_date_only_tz	(const ICalTime *a,
						 const ICalTime *b,
						 ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
void		i_cal_time_adjust		(ICalTime *tt,
						 const gint days,
						 const gint hours,
						 const gint minutes,
						 const gint seconds);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_normalize		(const ICalTime *t);

LIBICAL_ICAL_EXPORT
void		i_cal_time_normalize_inplace	(ICalTime *tt);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_convert_to_zone	(const ICalTime *tt,
						 ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
void		i_cal_time_convert_to_zone_inplace
						(ICalTime *tt,
						 ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_days_in_month	(gint month,
						 gint year);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_days_is_leap_year	(gint year);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_days_in_year		(gint year);

LIBICAL_ICAL_EXPORT
ICalTimeSpan *	i_cal_time_span_new		(ICalTime *dtstart,
						 ICalTime *dtend,
						 gint is_busy);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_span_overlaps	(ICalTimeSpan *s1,
						 ICalTimeSpan *s2);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_span_contains	(ICalTimeSpan *s,
						 ICalTimeSpan *container);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_time_add			(ICalTime *t,
						 ICalDuration *d);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_time_subtract		(ICalTime *t1,
						 ICalTime *t2);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_year		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_year		(ICalTime *timetype,
						 gint year);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_month		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_month		(ICalTime *timetype,
						 gint month);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_day		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_day		(ICalTime *timetype,
						 gint day);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_hour		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_hour		(ICalTime *timetype,
						 gint hour);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_minute		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_minute		(ICalTime *timetype,
						 gint minute);

LIBICAL_ICAL_EXPORT
gint 		i_cal_time_get_second		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_second		(ICalTime *timetype,
						 gint second);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_is_date		(ICalTime *timetype,
						 gboolean is_date);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_is_daylight		(const ICalTime *timetype);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_is_daylight	(ICalTime *timetype,
						 gboolean is_daylight);

LIBICAL_ICAL_EXPORT
void		i_cal_time_get_date		(const ICalTime *timetype,
						 gint *year,
						 gint *month,
						 gint *day);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_date		(ICalTime *timetype,
						 gint year,
						 gint month,
						 gint day);

LIBICAL_ICAL_EXPORT
void		i_cal_time_get_time		(const ICalTime *timetype,
						 gint *hour,
						 gint *minute,
						 gint *second);

LIBICAL_ICAL_EXPORT
void		i_cal_time_set_time		(ICalTime *timetype,
						 gint hour,
						 gint minute,
						 gint second);

G_END_DECLS

#endif /* I_CAL_TIME_H */
