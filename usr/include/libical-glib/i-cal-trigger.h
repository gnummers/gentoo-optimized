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

#ifndef I_CAL_TRIGGER_H
#define I_CAL_TRIGGER_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_TRIGGER \
    (i_cal_trigger_get_type ())

#define I_CAL_TRIGGER(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_TRIGGER, ICalTrigger))

#define I_CAL_TRIGGER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_TRIGGER, ICalTriggerClass))

#define I_CAL_IS_TRIGGER(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_TRIGGER))

#define I_CAL_IS_TRIGGER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_TRIGGER))

/**
 * ICalTrigger:
 *
 * This is the ICalTrigger instance.
 */

/**
 * ICalTriggerClass:
 *
 * This is the ICalTrigger class.
 */
typedef struct _ICalTriggerClass ICalTriggerClass;

struct _ICalTrigger {
    /*< private >*/
    ICalObject parent;
};

struct _ICalTriggerClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_trigger_get_type		(void);

LIBICAL_ICAL_EXPORT
ICalTrigger *	i_cal_trigger_new_from_int	(const gint reltime);

LIBICAL_ICAL_EXPORT
ICalTrigger *	i_cal_trigger_new_from_string	(const gchar *str);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_trigger_is_null_trigger	(ICalTrigger *tr);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_trigger_is_bad_trigger	(ICalTrigger *tr);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_trigger_get_time		(ICalTrigger *trigger);

LIBICAL_ICAL_EXPORT
void		i_cal_trigger_set_time		(ICalTrigger *trigger,
						 ICalTime *time);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_trigger_get_duration	(ICalTrigger *trigger);

LIBICAL_ICAL_EXPORT
void		i_cal_trigger_set_duration	(ICalTrigger *trigger,
						 ICalDuration *duration);

G_END_DECLS

#endif /* I_CAL_TRIGGER_H */
