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

#ifndef I_CAL_TIMEZONE_H
#define I_CAL_TIMEZONE_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_TIMEZONE \
    (i_cal_timezone_get_type ())

#define I_CAL_TIMEZONE(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_TIMEZONE, ICalTimezone))

#define I_CAL_TIMEZONE_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_TIMEZONE, ICalTimezoneClass))

#define I_CAL_IS_TIMEZONE(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_TIMEZONE))

#define I_CAL_IS_TIMEZONE_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_TIMEZONE))

/**
 * ICalTimezone:
 *
 * This is the ICalTimezone instance.
 */

/**
 * ICalTimezoneClass:
 *
 * This is the ICalTimezone class.
 */
typedef struct _ICalTimezoneClass ICalTimezoneClass;

struct _ICalTimezone {
    /*< private >*/
    ICalObject parent;
};

struct _ICalTimezoneClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_timezone_get_type		(void);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_new		(void);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_copy		(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_free		(ICalTimezone *zone,
						 gint free_struct);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_set_tzid_prefix	(const gchar *new_prefix);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_free_builtin_timezones
						(void);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_get_builtin_timezone
						(const gchar *location);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_get_builtin_timezone_from_offset
						(gint offset,
						 const gchar *tzname);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_get_builtin_timezone_from_tzid
						(const gchar *tzid);

LIBICAL_ICAL_EXPORT
ICalArray *	i_cal_timezone_get_builtin_timezones
						(void);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_get_utc_timezone	(void);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_timezone_get_tzid		(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_timezone_get_location	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_timezone_get_tznames	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
gdouble 		i_cal_timezone_get_latitude	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
gdouble 		i_cal_timezone_get_longitude	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_timezone_get_component	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
gint 		i_cal_timezone_set_component	(ICalTimezone *zone,
						 ICalComponent *comp);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_timezone_get_display_name	(const ICalTimezone *zone);

LIBICAL_ICAL_EXPORT
void		i_cal_time_convert_timezone	(ICalTime *tt,
						 ICalTimezone *from_zone,
						 ICalTimezone *to_zone);

LIBICAL_ICAL_EXPORT
gint 		i_cal_timezone_get_utc_offset	(ICalTimezone *zone,
						 ICalTime *tt,
						 gint *is_daylight);

LIBICAL_ICAL_EXPORT
gint 		i_cal_timezone_get_utc_offset_of_utc_time
						(ICalTimezone *zone,
						 ICalTime *tt,
						 gint *is_daylight);

LIBICAL_ICAL_EXPORT
ICalArray *	i_cal_timezone_array_new	(void);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_array_append_from_vtimezone
						(ICalArray *timezones,
						 ICalComponent *child);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_array_free	(ICalArray *timezones);

LIBICAL_ICAL_EXPORT
void		i_cal_time_timezone_expand_vtimezone
						(ICalComponent *comp,
						 gint end_year,
						 ICalArray *changes);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_timezone_get_location_from_vtimezone
						(ICalComponent *component);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_timezone_get_tznames_from_vtimezone
						(ICalComponent *component);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_set_zone_directory
						(const gchar *path);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_free_zone_directory
						(void);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_release_zone_tab	(void);

LIBICAL_ICAL_EXPORT
void		i_cal_timezone_set_builtin_tzdata
						(gboolean set);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_timezone_get_builtin_tzdata
						(void);

LIBICAL_ICAL_EXPORT
gint 		i_cal_timezone_dump_changes	(ICalTimezone *zone,
						 gint max_year,
						 FILE *fp);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_timezone_array_element_at	(ICalArray *timezones,
						 guint index);

G_END_DECLS

#endif /* I_CAL_TIMEZONE_H */
