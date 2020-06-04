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

#ifndef I_CAL_COMP_ITER_H
#define I_CAL_COMP_ITER_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_COMP_ITER \
    (i_cal_comp_iter_get_type ())

#define I_CAL_COMP_ITER(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_COMP_ITER, ICalCompIter))

#define I_CAL_COMP_ITER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_COMP_ITER, ICalCompIterClass))

#define I_CAL_IS_COMP_ITER(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_COMP_ITER))

#define I_CAL_IS_COMP_ITER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_COMP_ITER))

/**
 * ICalCompIter:
 *
 * This is the ICalCompIter instance.
 */

/**
 * ICalCompIterClass:
 *
 * This is the ICalCompIter class.
 */
typedef struct _ICalCompIterClass ICalCompIterClass;

struct _ICalCompIter {
    /*< private >*/
    ICalObject parent;
};

struct _ICalCompIterClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_comp_iter_get_type	(void);

G_END_DECLS

#endif /* I_CAL_COMP_ITER_H */
