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

#ifndef I_CAL_GEO_H
#define I_CAL_GEO_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_GEO \
    (i_cal_geo_get_type ())

#define I_CAL_GEO(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_GEO, ICalGeo))

#define I_CAL_GEO_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_GEO, ICalGeoClass))

#define I_CAL_IS_GEO(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_GEO))

#define I_CAL_IS_GEO_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_GEO))

/**
 * ICalGeo:
 *
 * This is the ICalGeo instance.
 */

/**
 * ICalGeoClass:
 *
 * This is the ICalGeo class.
 */
typedef struct _ICalGeoClass ICalGeoClass;

struct _ICalGeo {
    /*< private >*/
    ICalObject parent;
};

struct _ICalGeoClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_geo_get_type		(void);

LIBICAL_ICAL_EXPORT
ICalGeo *	i_cal_geo_new			(gdouble lat,
						 gdouble lon);

LIBICAL_ICAL_EXPORT
ICalGeo *	i_cal_geo_clone			(const ICalGeo *geo);

LIBICAL_ICAL_EXPORT
gdouble 		i_cal_geo_get_lat		(ICalGeo *geo);

LIBICAL_ICAL_EXPORT
void		i_cal_geo_set_lat		(ICalGeo *geo,
						 gdouble lat);

LIBICAL_ICAL_EXPORT
gdouble 		i_cal_geo_get_lon		(ICalGeo *geo);

LIBICAL_ICAL_EXPORT
void		i_cal_geo_set_lon		(ICalGeo *geo,
						 gdouble lon);

G_END_DECLS

#endif /* I_CAL_GEO_H */
