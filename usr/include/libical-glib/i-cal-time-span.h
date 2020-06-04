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

#ifndef I_CAL_TIME_SPAN_H
#define I_CAL_TIME_SPAN_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-time.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_TIME_SPAN \
    (i_cal_time_span_get_type ())

#define I_CAL_TIME_SPAN(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_TIME_SPAN, ICalTimeSpan))

#define I_CAL_TIME_SPAN_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_TIME_SPAN, ICalTimeSpanClass))

#define I_CAL_IS_TIME_SPAN(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_TIME_SPAN))

#define I_CAL_IS_TIME_SPAN_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_TIME_SPAN))

/**
 * ICalTimeSpan:
 *
 * This is the ICalTimeSpan instance.
 */

/**
 * ICalTimeSpanClass:
 *
 * This is the ICalTimeSpan class.
 */
typedef struct _ICalTimeSpanClass ICalTimeSpanClass;

struct _ICalTimeSpan {
    /*< private >*/
    ICalObject parent;
};

struct _ICalTimeSpanClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_time_span_get_type	(void);

LIBICAL_ICAL_EXPORT
ICalTimeSpan *	i_cal_time_span_new_timet	(time_t start,
						 time_t end,
						 gboolean is_busy);

LIBICAL_ICAL_EXPORT
ICalTimeSpan *	i_cal_time_span_clone		(const ICalTimeSpan *src);

LIBICAL_ICAL_EXPORT
time_t 		i_cal_time_span_get_start	(ICalTimeSpan *timespan);

LIBICAL_ICAL_EXPORT
void		i_cal_time_span_set_start	(ICalTimeSpan *timespan,
						 time_t start);

LIBICAL_ICAL_EXPORT
time_t 		i_cal_time_span_get_end		(ICalTimeSpan *timespan);

LIBICAL_ICAL_EXPORT
void		i_cal_time_span_set_end		(ICalTimeSpan *timespan,
						 time_t end);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_time_span_get_is_busy	(ICalTimeSpan *timespan);

LIBICAL_ICAL_EXPORT
void		i_cal_time_span_set_is_busy	(ICalTimeSpan *timespan,
						 gboolean is_busy);

G_END_DECLS

#endif /* I_CAL_TIME_SPAN_H */
