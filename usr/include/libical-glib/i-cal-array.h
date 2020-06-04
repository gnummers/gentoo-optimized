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

#ifndef I_CAL_ARRAY_H
#define I_CAL_ARRAY_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_ARRAY \
    (i_cal_array_get_type ())

#define I_CAL_ARRAY(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_ARRAY, ICalArray))

#define I_CAL_ARRAY_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_ARRAY, ICalArrayClass))

#define I_CAL_IS_ARRAY(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_ARRAY))

#define I_CAL_IS_ARRAY_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_ARRAY))

/**
 * ICalArray:
 *
 * This is the ICalArray instance.
 */

/**
 * ICalArrayClass:
 *
 * This is the ICalArray class.
 */
typedef struct _ICalArrayClass ICalArrayClass;

struct _ICalArray {
    /*< private >*/
    ICalObject parent;
};

struct _ICalArrayClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_array_get_type		(void);

LIBICAL_ICAL_EXPORT
gint 		i_cal_array_size		(ICalArray *array);

LIBICAL_ICAL_EXPORT
ICalArray *	i_cal_array_copy		(ICalArray *array);

LIBICAL_ICAL_EXPORT
void		i_cal_array_free		(ICalArray *array);

LIBICAL_ICAL_EXPORT
void		i_cal_array_remove_element_at	(ICalArray *array,
						 gint position);

LIBICAL_ICAL_EXPORT
void		i_cal_array_sort		(ICalArray *array,
						 gint (*compare) (const void *, const void *));

G_END_DECLS

#endif /* I_CAL_ARRAY_H */
