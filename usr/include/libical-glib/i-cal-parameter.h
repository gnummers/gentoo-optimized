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

#ifndef I_CAL_PARAMETER_H
#define I_CAL_PARAMETER_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>
#include <libical-glib/i-cal-derived-parameter.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_PARAMETER \
    (i_cal_parameter_get_type ())

#define I_CAL_PARAMETER(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_PARAMETER, ICalParameter))

#define I_CAL_PARAMETER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_PARAMETER, ICalParameterClass))

#define I_CAL_IS_PARAMETER(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_PARAMETER))

#define I_CAL_IS_PARAMETER_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_PARAMETER))

/**
 * ICalParameter:
 *
 * This is the ICalParameter instance.
 */

/**
 * ICalParameterClass:
 *
 * This is the ICalParameter class.
 */
typedef struct _ICalParameterClass ICalParameterClass;

struct _ICalParameter {
    /*< private >*/
    ICalObject parent;
};

struct _ICalParameterClass {
    /*< private >*/
    ICalObjectClass parent;
};

LIBICAL_ICAL_EXPORT
GType 		i_cal_parameter_get_type	(void);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new		(ICalParameterKind v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_clone		(ICalParameter *p);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_from_string	(const gchar *value);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_from_value_string
						(ICalParameterKind kind,
						 const gchar *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_free		(ICalParameter *parameter);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_parameter_as_ical_string	(ICalParameter *parameter);

LIBICAL_ICAL_EXPORT
ICalParameterKind 
		i_cal_parameter_isa		(ICalParameter *parameter);

LIBICAL_ICAL_EXPORT
gint 		i_cal_parameter_isa_parameter	(ICalParameter *param);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_xname	(ICalParameter *param,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_xname	(ICalParameter *param);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_xvalue	(ICalParameter *param,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_xvalue	(ICalParameter *param);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_iana_name	(ICalParameter *param,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_iana_name	(ICalParameter *param);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_iana_value	(ICalParameter *param,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_iana_value	(ICalParameter *param);

LIBICAL_ICAL_EXPORT
gint 		i_cal_parameter_has_same_name	(ICalParameter *param1,
						 ICalParameter *param2);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_kind_to_string	(ICalParameterKind kind);

LIBICAL_ICAL_EXPORT
ICalParameterKind 
		i_cal_parameter_kind_from_string
						(const gchar *string);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_parameter_kind_is_valid	(const ICalParameterKind kind);

G_END_DECLS

#endif /* I_CAL_PARAMETER_H */
