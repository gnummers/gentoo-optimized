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

#ifndef I_CAL_ATTACH_H
#define I_CAL_ATTACH_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_ATTACH \
    (i_cal_attach_get_type ())

#define I_CAL_ATTACH(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_ATTACH, ICalAttach))

#define I_CAL_ATTACH_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_ATTACH, ICalAttachClass))

#define I_CAL_IS_ATTACH(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_ATTACH))

#define I_CAL_IS_ATTACH_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_ATTACH))

/**
 * ICalAttach:
 *
 * This is the ICalAttach instance.
 */

/**
 * ICalAttachClass:
 *
 * This is the ICalAttach class.
 */
typedef struct _ICalAttachClass ICalAttachClass;

struct _ICalAttach {
    /*< private >*/
    ICalObject parent;
};

struct _ICalAttachClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_attach_get_type		(void);

LIBICAL_ICAL_EXPORT
ICalAttach *	i_cal_attach_new_from_url	(const gchar *url);

LIBICAL_ICAL_EXPORT
ICalAttach *	i_cal_attach_new_from_data	(const gchar *data,
						 GFunc free_fn,
						 void *free_fn_data);

LIBICAL_ICAL_EXPORT
ICalAttach *	i_cal_attach_new_from_bytes	(GBytes *bytes);

LIBICAL_ICAL_EXPORT
void		i_cal_attach_ref		(ICalAttach *attach);

LIBICAL_ICAL_EXPORT
void		i_cal_attach_unref		(ICalAttach *attach);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_attach_get_is_url		(ICalAttach *attach);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_attach_get_url		(ICalAttach *attach);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_attach_get_data		(ICalAttach *attach);

G_END_DECLS

#endif /* I_CAL_ATTACH_H */
