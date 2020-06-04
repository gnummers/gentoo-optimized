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

#ifndef I_CAL_COMPONENT_H
#define I_CAL_COMPONENT_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-parameter.h>
#include <libical-glib/i-cal-object.h>
#include <libical-glib/i-cal-enums.h>
#include <libical-glib/i-cal-derived-property.h>
#include <libical-glib/i-cal-derived-value.h>

G_BEGIN_DECLS

#define I_CAL_TYPE_COMPONENT \
    (i_cal_component_get_type ())

#define I_CAL_COMPONENT(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST \
    ((obj), I_CAL_TYPE_COMPONENT, ICalComponent))

#define I_CAL_COMPONENT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST \
    ((klass), I_CAL_TYPE_COMPONENT, ICalComponentClass))

#define I_CAL_IS_COMPONENT(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE \
    ((obj), I_CAL_TYPE_COMPONENT))

#define I_CAL_IS_COMPONENT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE \
    ((klass), I_CAL_TYPE_COMPONENT))

/**
 * ICalComponent:
 *
 * This is the ICalComponent instance.
 */

/**
 * ICalComponentClass:
 *
 * This is the ICalComponent class.
 */
typedef struct _ICalComponentClass ICalComponentClass;

struct _ICalComponent {
    /*< private >*/
    ICalObject parent;
};

struct _ICalComponentClass {
    /*< private >*/
    ICalObjectClass parent;
};
typedef void (*ICalComponentForeachTZIDFunc)(ICalParameter *param, gpointer user_data);
typedef void (*ICalComponentForeachRecurrenceFunc)(ICalComponent *comp, ICalTimeSpan *span, gpointer user_data);

LIBICAL_ICAL_EXPORT
GType 		i_cal_component_get_type	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new		(ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_clone		(ICalComponent *component);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_from_string	(const gchar *str);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_x		(const gchar *x_name);

LIBICAL_ICAL_EXPORT
void		i_cal_component_free		(ICalComponent *component);

LIBICAL_ICAL_EXPORT
gchar *		i_cal_component_as_ical_string	(ICalComponent *component);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_component_is_valid	(ICalComponent *component);

LIBICAL_ICAL_EXPORT
ICalComponentKind 
		i_cal_component_isa		(const ICalComponent *component);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_isa_component	(ICalComponent *component);

LIBICAL_ICAL_EXPORT
void		i_cal_component_add_property	(ICalComponent *component,
						 ICalProperty *property);

LIBICAL_ICAL_EXPORT
void		i_cal_component_take_property	(ICalComponent *component,
						 ICalProperty *property);

LIBICAL_ICAL_EXPORT
void		i_cal_component_remove_property	(ICalComponent *component,
						 ICalProperty *property);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_count_properties
						(ICalComponent *component,
						 ICalPropertyKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_property_get_parent	(ICalProperty *property);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_parent	(ICalProperty *property,
						 ICalComponent *component);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_datetime_with_component
						(ICalProperty *prop,
						 ICalComponent *comp);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_component_get_current_property
						(ICalComponent *component);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_component_get_first_property
						(ICalComponent *component,
						 ICalPropertyKind kind);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_component_get_next_property
						(ICalComponent *component,
						 ICalPropertyKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_inner	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_add_component	(ICalComponent *parent,
						 ICalComponent *child);

LIBICAL_ICAL_EXPORT
void		i_cal_component_take_component	(ICalComponent *parent,
						 ICalComponent *child);

LIBICAL_ICAL_EXPORT
void		i_cal_component_remove_component
						(ICalComponent *parent,
						 ICalComponent *child);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_count_components
						(ICalComponent *component,
						 ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_parent	(ICalComponent *component);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_parent	(ICalComponent *component,
						 ICalComponent *parent);

LIBICAL_ICAL_EXPORT
void		i_cal_component_merge_component	(ICalComponent *comp,
						 ICalComponent *comp_to_merge);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_current_component
						(ICalComponent *component);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_first_component
						(ICalComponent *component,
						 ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_next_component
						(ICalComponent *component,
						 ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalCompIter *	i_cal_component_begin_component	(ICalComponent *component,
						 ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalCompIter *	i_cal_component_end_component	(ICalComponent *component,
						 ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_comp_iter_next		(ICalCompIter *i);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_comp_iter_prior		(ICalCompIter *i);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_comp_iter_deref		(ICalCompIter *i);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_check_restrictions
						(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_count_errors	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_strip_errors	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_convert_errors	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_component_kind_is_valid	(const ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponentKind 
		i_cal_component_kind_from_string
						(const gchar *string);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_kind_to_string	(ICalComponentKind kind);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_get_first_real_component
						(ICalComponent *c);

LIBICAL_ICAL_EXPORT
ICalTimeSpan *	i_cal_component_get_span	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_dtstart	(ICalComponent *comp,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_component_get_dtstart	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_dtend	(ICalComponent *comp,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_component_get_dtend	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_due		(ICalComponent *comp,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_component_get_due		(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_duration	(ICalComponent *comp,
						 ICalDuration *v);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_component_get_duration	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_method	(ICalComponent *comp,
						 ICalPropertyMethod method);

LIBICAL_ICAL_EXPORT
ICalPropertyMethod 
		i_cal_component_get_method	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_dtstamp	(ICalComponent *comp,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_component_get_dtstamp	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_summary	(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_summary	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_comment	(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_comment	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_uid		(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_uid		(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_relcalid	(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_relcalid	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_recurrenceid
						(ICalComponent *comp,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_component_get_recurrenceid
						(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_description	(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_description	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_location	(ICalComponent *comp,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_component_get_location	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_sequence	(ICalComponent *comp,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_component_get_sequence	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_set_status	(ICalComponent *comp,
						 ICalPropertyStatus status);

LIBICAL_ICAL_EXPORT
ICalPropertyStatus 
		i_cal_component_get_status	(ICalComponent *comp);

LIBICAL_ICAL_EXPORT
void		i_cal_component_foreach_tzid	(ICalComponent *comp,
						 ICalComponentForeachTZIDFunc callback,
						 gpointer user_data);

LIBICAL_ICAL_EXPORT
void		i_cal_component_foreach_recurrence
						(ICalComponent *comp,
						 ICalTime *start,
						 ICalTime *end,
						 ICalComponentForeachRecurrenceFunc callback,
						 gpointer user_data);

LIBICAL_ICAL_EXPORT
ICalTimezone *	i_cal_component_get_timezone	(ICalComponent *comp,
						 const gchar *tzid);

LIBICAL_ICAL_EXPORT
gboolean 	i_cal_property_recurrence_is_excluded
						(ICalComponent *comp,
						 ICalTime *dtstart,
						 ICalTime *recurtime);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vcalendar	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vevent	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vtodo	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vjournal	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_valarm	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vfreebusy	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vtimezone	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_xstandard	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_xdaylight	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vagenda	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vquery	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vavailability
						(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_xavailable	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vpoll	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_vvoter	(void);

LIBICAL_ICAL_EXPORT
ICalComponent *	i_cal_component_new_xvote	(void);

G_END_DECLS

#endif /* I_CAL_COMPONENT_H */
