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

#ifndef I_CAL_RECUR_ITERATOR_H
#define I_CAL_RECUR_ITERATOR_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_RECUR_ITERATOR \
    (i_cal_recur_iterator_get_type ())

#define I_CAL_RECUR_ITERATOR(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_RECUR_ITERATOR, ICalRecurIterator))

#define I_CAL_RECUR_ITERATOR_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_RECUR_ITERATOR, ICalRecurIteratorClass))

#define I_CAL_IS_RECUR_ITERATOR(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_RECUR_ITERATOR))

#define I_CAL_IS_RECUR_ITERATOR_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_RECUR_ITERATOR))

/**
 * ICalRecurIterator:
 *
 * This is the ICalRecurIterator instance.
 */

/**
 * ICalRecurIteratorClass:
 *
 * This is the ICalRecurIterator class.
 */
typedef struct _ICalRecurIteratorClass ICalRecurIteratorClass;

struct _ICalRecurIterator {
    /*< private >*/
    ICalObject parent;
};

struct _ICalRecurIteratorClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_recur_iterator_get_type	(void);

LIBICAL_ICAL_EXPORT
ICalRecurIterator *
		i_cal_recur_iterator_new	(ICalRecurrence *rule,
						 ICalTime *dtstart);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_recur_iterator_next	(ICalRecurIterator *iterator);

LIBICAL_ICAL_EXPORT
gint 		i_cal_recur_iterator_set_start	(ICalRecurIterator *iterator,
						 ICalTime *start);

LIBICAL_ICAL_EXPORT
void		i_cal_recur_iterator_free	(ICalRecurIterator *iterator);

G_END_DECLS

#endif /* I_CAL_RECUR_ITERATOR_H */
