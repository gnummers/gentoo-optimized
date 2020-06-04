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

#ifndef I_CAL_DATETIMEPERIOD_H
#define I_CAL_DATETIMEPERIOD_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-time.h>
#include <libical-glib/i-cal-period.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_DATETIMEPERIOD \
    (i_cal_datetimeperiod_get_type ())

#define I_CAL_DATETIMEPERIOD(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_DATETIMEPERIOD, ICalDatetimeperiod))

#define I_CAL_DATETIMEPERIOD_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_DATETIMEPERIOD, ICalDatetimeperiodClass))

#define I_CAL_IS_DATETIMEPERIOD(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_DATETIMEPERIOD))

#define I_CAL_IS_DATETIMEPERIOD_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_DATETIMEPERIOD))

/**
 * ICalDatetimeperiod:
 *
 * This is the ICalDatetimeperiod instance.
 */

/**
 * ICalDatetimeperiodClass:
 *
 * This is the ICalDatetimeperiod class.
 */
typedef struct _ICalDatetimeperiodClass ICalDatetimeperiodClass;

struct _ICalDatetimeperiod {
    /*< private >*/
    ICalObject parent;
};

struct _ICalDatetimeperiodClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_datetimeperiod_get_type	(void);

LIBICAL_ICAL_EXPORT
ICalDatetimeperiod *
		i_cal_datetimeperiod_new	(void);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_datetimeperiod_get_time	(ICalDatetimeperiod *dtp);

LIBICAL_ICAL_EXPORT
void		i_cal_datetimeperiod_set_time	(ICalDatetimeperiod *dtp,
						 ICalTime *time);

LIBICAL_ICAL_EXPORT
ICalPeriod *	i_cal_datetimeperiod_get_period	(ICalDatetimeperiod *dtp);

LIBICAL_ICAL_EXPORT
void		i_cal_datetimeperiod_set_period	(ICalDatetimeperiod *dtp,
						 ICalPeriod *period);

G_END_DECLS

#endif /* I_CAL_DATETIMEPERIOD_H */
