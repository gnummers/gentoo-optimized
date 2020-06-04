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

#ifndef I_CAL_DURATION_H
#define I_CAL_DURATION_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_DURATION \
    (i_cal_duration_get_type ())

#define I_CAL_DURATION(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_DURATION, ICalDuration))

#define I_CAL_DURATION_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_DURATION, ICalDurationClass))

#define I_CAL_IS_DURATION(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_DURATION))

#define I_CAL_IS_DURATION_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_DURATION))

/**
 * ICalDuration:
 *
 * This is the ICalDuration instance.
 */

/**
 * ICalDurationClass:
 *
 * This is the ICalDuration class.
 */
typedef struct _ICalDurationClass ICalDurationClass;

struct _ICalDuration {
    /*< private >*/
    ICalObject parent;
};

struct _ICalDurationClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_duration_get_type		(void);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_duration_is_neg		(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_is_neg	(ICalDuration *duration,
						 gboolean is_neg);

LIBICAL_ICAL_EXPORT
guint 		i_cal_duration_get_days		(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_days		(ICalDuration *duration,
						 guint days);

LIBICAL_ICAL_EXPORT
guint 		i_cal_duration_get_weeks	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_weeks	(ICalDuration *duration,
						 guint weeks);

LIBICAL_ICAL_EXPORT
guint 		i_cal_duration_get_hours	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_hours	(ICalDuration *duration,
						 guint hours);

LIBICAL_ICAL_EXPORT
guint 		i_cal_duration_get_minutes	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_minutes	(ICalDuration *duration,
						 guint minutes);

LIBICAL_ICAL_EXPORT
guint 		i_cal_duration_get_seconds	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
void		i_cal_duration_set_seconds	(ICalDuration *duration,
						 guint seconds);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_duration_new_from_int	(gint t);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_duration_new_from_string	(const gchar *str);

LIBICAL_ICAL_EXPORT
gint 		i_cal_duration_as_int		(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_duration_as_ical_string	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_duration_new_null_duration
						(void);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_duration_new_bad_duration	(void);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_duration_is_null_duration	(ICalDuration *duration);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_duration_is_bad_duration	(ICalDuration *duration);

G_END_DECLS

#endif /* I_CAL_DURATION_H */
