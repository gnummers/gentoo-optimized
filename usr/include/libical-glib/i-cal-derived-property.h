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

#ifndef I_CAL_DERIVED_PROPERTY_H
#define I_CAL_DERIVED_PROPERTY_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>
#include <libical-glib/i-cal-derived-value.h>

G_BEGIN_DECLS

typedef enum {
	I_CAL_ANY_PROPERTY = ICAL_ANY_PROPERTY,
	I_CAL_ACCEPTRESPONSE_PROPERTY = ICAL_ACCEPTRESPONSE_PROPERTY,
	I_CAL_ACKNOWLEDGED_PROPERTY = ICAL_ACKNOWLEDGED_PROPERTY,
	I_CAL_ACTION_PROPERTY = ICAL_ACTION_PROPERTY,
	I_CAL_ALLOWCONFLICT_PROPERTY = ICAL_ALLOWCONFLICT_PROPERTY,
	I_CAL_ATTACH_PROPERTY = ICAL_ATTACH_PROPERTY,
	I_CAL_ATTENDEE_PROPERTY = ICAL_ATTENDEE_PROPERTY,
	I_CAL_BUSYTYPE_PROPERTY = ICAL_BUSYTYPE_PROPERTY,
	I_CAL_CALID_PROPERTY = ICAL_CALID_PROPERTY,
	I_CAL_CALMASTER_PROPERTY = ICAL_CALMASTER_PROPERTY,
	I_CAL_CALSCALE_PROPERTY = ICAL_CALSCALE_PROPERTY,
	I_CAL_CAPVERSION_PROPERTY = ICAL_CAPVERSION_PROPERTY,
	I_CAL_CARLEVEL_PROPERTY = ICAL_CARLEVEL_PROPERTY,
	I_CAL_CARID_PROPERTY = ICAL_CARID_PROPERTY,
	I_CAL_CATEGORIES_PROPERTY = ICAL_CATEGORIES_PROPERTY,
	I_CAL_CLASS_PROPERTY = ICAL_CLASS_PROPERTY,
	I_CAL_CMD_PROPERTY = ICAL_CMD_PROPERTY,
	I_CAL_COLOR_PROPERTY = ICAL_COLOR_PROPERTY,
	I_CAL_COMMENT_PROPERTY = ICAL_COMMENT_PROPERTY,
	I_CAL_COMPLETED_PROPERTY = ICAL_COMPLETED_PROPERTY,
	I_CAL_COMPONENTS_PROPERTY = ICAL_COMPONENTS_PROPERTY,
	I_CAL_CONTACT_PROPERTY = ICAL_CONTACT_PROPERTY,
	I_CAL_CREATED_PROPERTY = ICAL_CREATED_PROPERTY,
	I_CAL_CSID_PROPERTY = ICAL_CSID_PROPERTY,
	I_CAL_DATEMAX_PROPERTY = ICAL_DATEMAX_PROPERTY,
	I_CAL_DATEMIN_PROPERTY = ICAL_DATEMIN_PROPERTY,
	I_CAL_DECREED_PROPERTY = ICAL_DECREED_PROPERTY,
	I_CAL_DEFAULTCHARSET_PROPERTY = ICAL_DEFAULTCHARSET_PROPERTY,
	I_CAL_DEFAULTLOCALE_PROPERTY = ICAL_DEFAULTLOCALE_PROPERTY,
	I_CAL_DEFAULTTZID_PROPERTY = ICAL_DEFAULTTZID_PROPERTY,
	I_CAL_DEFAULTVCARS_PROPERTY = ICAL_DEFAULTVCARS_PROPERTY,
	I_CAL_DENY_PROPERTY = ICAL_DENY_PROPERTY,
	I_CAL_DESCRIPTION_PROPERTY = ICAL_DESCRIPTION_PROPERTY,
	I_CAL_DTEND_PROPERTY = ICAL_DTEND_PROPERTY,
	I_CAL_DTSTAMP_PROPERTY = ICAL_DTSTAMP_PROPERTY,
	I_CAL_DTSTART_PROPERTY = ICAL_DTSTART_PROPERTY,
	I_CAL_DUE_PROPERTY = ICAL_DUE_PROPERTY,
	I_CAL_DURATION_PROPERTY = ICAL_DURATION_PROPERTY,
	I_CAL_ESTIMATEDDURATION_PROPERTY = ICAL_ESTIMATEDDURATION_PROPERTY,
	I_CAL_EXDATE_PROPERTY = ICAL_EXDATE_PROPERTY,
	I_CAL_EXPAND_PROPERTY = ICAL_EXPAND_PROPERTY,
	I_CAL_EXRULE_PROPERTY = ICAL_EXRULE_PROPERTY,
	I_CAL_FREEBUSY_PROPERTY = ICAL_FREEBUSY_PROPERTY,
	I_CAL_GEO_PROPERTY = ICAL_GEO_PROPERTY,
	I_CAL_GRANT_PROPERTY = ICAL_GRANT_PROPERTY,
	I_CAL_ITIPVERSION_PROPERTY = ICAL_ITIPVERSION_PROPERTY,
	I_CAL_LASTMODIFIED_PROPERTY = ICAL_LASTMODIFIED_PROPERTY,
	I_CAL_LOCATION_PROPERTY = ICAL_LOCATION_PROPERTY,
	I_CAL_MAXCOMPONENTSIZE_PROPERTY = ICAL_MAXCOMPONENTSIZE_PROPERTY,
	I_CAL_MAXDATE_PROPERTY = ICAL_MAXDATE_PROPERTY,
	I_CAL_MAXRESULTS_PROPERTY = ICAL_MAXRESULTS_PROPERTY,
	I_CAL_MAXRESULTSSIZE_PROPERTY = ICAL_MAXRESULTSSIZE_PROPERTY,
	I_CAL_METHOD_PROPERTY = ICAL_METHOD_PROPERTY,
	I_CAL_MINDATE_PROPERTY = ICAL_MINDATE_PROPERTY,
	I_CAL_MULTIPART_PROPERTY = ICAL_MULTIPART_PROPERTY,
	I_CAL_NAME_PROPERTY = ICAL_NAME_PROPERTY,
	I_CAL_ORGANIZER_PROPERTY = ICAL_ORGANIZER_PROPERTY,
	I_CAL_OWNER_PROPERTY = ICAL_OWNER_PROPERTY,
	I_CAL_PERCENTCOMPLETE_PROPERTY = ICAL_PERCENTCOMPLETE_PROPERTY,
	I_CAL_PERMISSION_PROPERTY = ICAL_PERMISSION_PROPERTY,
	I_CAL_POLLCOMPLETION_PROPERTY = ICAL_POLLCOMPLETION_PROPERTY,
	I_CAL_POLLITEMID_PROPERTY = ICAL_POLLITEMID_PROPERTY,
	I_CAL_POLLMODE_PROPERTY = ICAL_POLLMODE_PROPERTY,
	I_CAL_POLLPROPERTIES_PROPERTY = ICAL_POLLPROPERTIES_PROPERTY,
	I_CAL_POLLWINNER_PROPERTY = ICAL_POLLWINNER_PROPERTY,
	I_CAL_PRIORITY_PROPERTY = ICAL_PRIORITY_PROPERTY,
	I_CAL_PRODID_PROPERTY = ICAL_PRODID_PROPERTY,
	I_CAL_QUERY_PROPERTY = ICAL_QUERY_PROPERTY,
	I_CAL_QUERYLEVEL_PROPERTY = ICAL_QUERYLEVEL_PROPERTY,
	I_CAL_QUERYID_PROPERTY = ICAL_QUERYID_PROPERTY,
	I_CAL_QUERYNAME_PROPERTY = ICAL_QUERYNAME_PROPERTY,
	I_CAL_RDATE_PROPERTY = ICAL_RDATE_PROPERTY,
	I_CAL_RECURACCEPTED_PROPERTY = ICAL_RECURACCEPTED_PROPERTY,
	I_CAL_RECUREXPAND_PROPERTY = ICAL_RECUREXPAND_PROPERTY,
	I_CAL_RECURLIMIT_PROPERTY = ICAL_RECURLIMIT_PROPERTY,
	I_CAL_RECURRENCEID_PROPERTY = ICAL_RECURRENCEID_PROPERTY,
	I_CAL_RELATEDTO_PROPERTY = ICAL_RELATEDTO_PROPERTY,
	I_CAL_RELCALID_PROPERTY = ICAL_RELCALID_PROPERTY,
	I_CAL_REPEAT_PROPERTY = ICAL_REPEAT_PROPERTY,
	I_CAL_REPLYURL_PROPERTY = ICAL_REPLYURL_PROPERTY,
	I_CAL_REQUESTSTATUS_PROPERTY = ICAL_REQUESTSTATUS_PROPERTY,
	I_CAL_RESOURCES_PROPERTY = ICAL_RESOURCES_PROPERTY,
	I_CAL_RESPONSE_PROPERTY = ICAL_RESPONSE_PROPERTY,
	I_CAL_RESTRICTION_PROPERTY = ICAL_RESTRICTION_PROPERTY,
	I_CAL_RRULE_PROPERTY = ICAL_RRULE_PROPERTY,
	I_CAL_SCOPE_PROPERTY = ICAL_SCOPE_PROPERTY,
	I_CAL_SEQUENCE_PROPERTY = ICAL_SEQUENCE_PROPERTY,
	I_CAL_STATUS_PROPERTY = ICAL_STATUS_PROPERTY,
	I_CAL_STORESEXPANDED_PROPERTY = ICAL_STORESEXPANDED_PROPERTY,
	I_CAL_SUMMARY_PROPERTY = ICAL_SUMMARY_PROPERTY,
	I_CAL_TARGET_PROPERTY = ICAL_TARGET_PROPERTY,
	I_CAL_TASKMODE_PROPERTY = ICAL_TASKMODE_PROPERTY,
	I_CAL_TRANSP_PROPERTY = ICAL_TRANSP_PROPERTY,
	I_CAL_TRIGGER_PROPERTY = ICAL_TRIGGER_PROPERTY,
	I_CAL_TZID_PROPERTY = ICAL_TZID_PROPERTY,
	I_CAL_TZIDALIASOF_PROPERTY = ICAL_TZIDALIASOF_PROPERTY,
	I_CAL_TZNAME_PROPERTY = ICAL_TZNAME_PROPERTY,
	I_CAL_TZOFFSETFROM_PROPERTY = ICAL_TZOFFSETFROM_PROPERTY,
	I_CAL_TZOFFSETTO_PROPERTY = ICAL_TZOFFSETTO_PROPERTY,
	I_CAL_TZUNTIL_PROPERTY = ICAL_TZUNTIL_PROPERTY,
	I_CAL_TZURL_PROPERTY = ICAL_TZURL_PROPERTY,
	I_CAL_UID_PROPERTY = ICAL_UID_PROPERTY,
	I_CAL_URL_PROPERTY = ICAL_URL_PROPERTY,
	I_CAL_VERSION_PROPERTY = ICAL_VERSION_PROPERTY,
	I_CAL_VOTER_PROPERTY = ICAL_VOTER_PROPERTY,
	I_CAL_X_PROPERTY = ICAL_X_PROPERTY,
	I_CAL_XLICCLASS_PROPERTY = ICAL_XLICCLASS_PROPERTY,
	I_CAL_XLICCLUSTERCOUNT_PROPERTY = ICAL_XLICCLUSTERCOUNT_PROPERTY,
	I_CAL_XLICERROR_PROPERTY = ICAL_XLICERROR_PROPERTY,
	I_CAL_XLICMIMECHARSET_PROPERTY = ICAL_XLICMIMECHARSET_PROPERTY,
	I_CAL_XLICMIMECID_PROPERTY = ICAL_XLICMIMECID_PROPERTY,
	I_CAL_XLICMIMECONTENTTYPE_PROPERTY = ICAL_XLICMIMECONTENTTYPE_PROPERTY,
	I_CAL_XLICMIMEENCODING_PROPERTY = ICAL_XLICMIMEENCODING_PROPERTY,
	I_CAL_XLICMIMEFILENAME_PROPERTY = ICAL_XLICMIMEFILENAME_PROPERTY,
	I_CAL_XLICMIMEOPTINFO_PROPERTY = ICAL_XLICMIMEOPTINFO_PROPERTY,
	I_CAL_NO_PROPERTY = ICAL_NO_PROPERTY
} ICalPropertyKind;


LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_acceptresponse
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_acceptresponse
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_acceptresponse
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_acknowledged	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_acknowledged	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_acknowledged	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_action	(ICalPropertyAction v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_action	(ICalProperty *prop,
						 ICalPropertyAction v);

LIBICAL_ICAL_EXPORT
ICalPropertyAction 
		i_cal_property_get_action	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_allowconflict
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_allowconflict
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_allowconflict
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_attach	(ICalAttach *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_attach	(ICalProperty *prop,
						 ICalAttach *v);

LIBICAL_ICAL_EXPORT
ICalAttach *	i_cal_property_get_attach	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_attendee	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_attendee	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_attendee	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_busytype	(ICalPropertyBusytype v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_busytype	(ICalProperty *prop,
						 ICalPropertyBusytype v);

LIBICAL_ICAL_EXPORT
ICalPropertyBusytype 
		i_cal_property_get_busytype	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_calid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_calid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_calid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_calmaster	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_calmaster	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_calmaster	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_calscale	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_calscale	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_calscale	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_capversion	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_capversion	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_capversion	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_carlevel	(ICalPropertyCarlevel v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_carlevel	(ICalProperty *prop,
						 ICalPropertyCarlevel v);

LIBICAL_ICAL_EXPORT
ICalPropertyCarlevel 
		i_cal_property_get_carlevel	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_carid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_carid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_carid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_categories	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_categories	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_categories	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_class	(ICalProperty_Class v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_class	(ICalProperty *prop,
						 ICalProperty_Class v);

LIBICAL_ICAL_EXPORT
ICalProperty_Class 
		i_cal_property_get_class	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_cmd		(ICalPropertyCmd v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_cmd		(ICalProperty *prop,
						 ICalPropertyCmd v);

LIBICAL_ICAL_EXPORT
ICalPropertyCmd 	i_cal_property_get_cmd		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_comment	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_comment	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_color	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_color	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_color	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_comment	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_completed	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_completed	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_completed	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_components	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_components	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_components	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_contact	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_contact	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_contact	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_created	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_created	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_created	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_csid		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_csid		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_csid		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_datemax	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_datemax	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_datemax	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_datemin	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_datemin	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_datemin	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_decreed	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_decreed	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_decreed	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_defaultcharset
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_defaultcharset
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_defaultcharset
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_defaultlocale
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_defaultlocale
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_defaultlocale
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_defaulttzid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_defaulttzid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_defaulttzid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_defaultvcars	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_defaultvcars	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_defaultvcars	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_deny		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_deny		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_deny		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_description	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_description	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_description	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_dtend	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_dtend	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_dtend	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_dtstamp	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_dtstamp	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_dtstamp	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_dtstart	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_dtstart	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_dtstart	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_due		(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_due		(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_due		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_duration	(ICalDuration *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_duration	(ICalProperty *prop,
						 ICalDuration *v);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_property_get_duration	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_estimatedduration
						(ICalDuration *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_estimatedduration
						(ICalProperty *prop,
						 ICalDuration *v);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_property_get_estimatedduration
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_exdate	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_exdate	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_exdate	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_expand	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_expand	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_expand	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_exrule	(ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_exrule	(ICalProperty *prop,
						 ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
ICalRecurrence *
		i_cal_property_get_exrule	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_freebusy	(ICalPeriod *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_freebusy	(ICalProperty *prop,
						 ICalPeriod *v);

LIBICAL_ICAL_EXPORT
ICalPeriod *	i_cal_property_get_freebusy	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_geo		(ICalGeo *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_geo		(ICalProperty *prop,
						 ICalGeo *v);

LIBICAL_ICAL_EXPORT
ICalGeo *	i_cal_property_get_geo		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_grant	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_grant	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_grant	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_itipversion	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_itipversion	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_itipversion	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_lastmodified	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_lastmodified	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_lastmodified	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_location	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_location	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_location	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_maxcomponentsize
						(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_maxcomponentsize
						(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_maxcomponentsize
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_maxdate	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_maxdate	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_maxdate	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_maxresults	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_maxresults	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_maxresults	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_maxresultssize
						(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_maxresultssize
						(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_maxresultssize
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_method	(ICalPropertyMethod v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_method	(ICalProperty *prop,
						 ICalPropertyMethod v);

LIBICAL_ICAL_EXPORT
ICalPropertyMethod 
		i_cal_property_get_method	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_mindate	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_mindate	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_mindate	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_multipart	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_multipart	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_multipart	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_name		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_name		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_name		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_organizer	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_organizer	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_organizer	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_owner	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_owner	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_owner	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_percentcomplete
						(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_percentcomplete
						(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_percentcomplete
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_permission	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_permission	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_permission	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_pollcompletion
						(ICalPropertyPollcompletion v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_pollcompletion
						(ICalProperty *prop,
						 ICalPropertyPollcompletion v);

LIBICAL_ICAL_EXPORT
ICalPropertyPollcompletion 
		i_cal_property_get_pollcompletion
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_pollitemid	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_pollitemid	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_pollitemid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_pollmode	(ICalPropertyPollmode v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_pollmode	(ICalProperty *prop,
						 ICalPropertyPollmode v);

LIBICAL_ICAL_EXPORT
ICalPropertyPollmode 
		i_cal_property_get_pollmode	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_pollproperties
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_pollproperties
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_pollproperties
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_pollwinner	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_pollwinner	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_pollwinner	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_priority	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_priority	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_priority	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_prodid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_prodid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_prodid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_query	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_query	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_query	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_querylevel	(ICalPropertyQuerylevel v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_querylevel	(ICalProperty *prop,
						 ICalPropertyQuerylevel v);

LIBICAL_ICAL_EXPORT
ICalPropertyQuerylevel 
		i_cal_property_get_querylevel	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_queryid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_queryid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_queryid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_queryname	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_queryname	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_queryname	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_rdate	(ICalDatetimeperiod *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_rdate	(ICalProperty *prop,
						 ICalDatetimeperiod *v);

LIBICAL_ICAL_EXPORT
ICalDatetimeperiod *
		i_cal_property_get_rdate	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_recuraccepted
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_recuraccepted
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_recuraccepted
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_recurexpand	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_recurexpand	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_recurexpand	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_recurlimit	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_recurlimit	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_recurlimit	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_recurrenceid	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_recurrenceid	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_recurrenceid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_relatedto	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_relatedto	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_relatedto	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_relcalid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_relcalid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_relcalid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_repeat	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_repeat	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_repeat	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_replyurl	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_replyurl	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_replyurl	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_requeststatus
						(ICalReqstat *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_requeststatus
						(ICalProperty *prop,
						 ICalReqstat *v);

LIBICAL_ICAL_EXPORT
ICalReqstat *	i_cal_property_get_requeststatus
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_resources	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_resources	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_resources	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_response	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_response	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_response	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_restriction	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_restriction	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_restriction	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_rrule	(ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_rrule	(ICalProperty *prop,
						 ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
ICalRecurrence *
		i_cal_property_get_rrule	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_scope	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_scope	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_scope	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_sequence	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_sequence	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_sequence	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_status	(ICalPropertyStatus v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_status	(ICalProperty *prop,
						 ICalPropertyStatus v);

LIBICAL_ICAL_EXPORT
ICalPropertyStatus 
		i_cal_property_get_status	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_storesexpanded
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_storesexpanded
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_storesexpanded
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_summary	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_summary	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_summary	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_target	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_target	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_target	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_taskmode	(ICalPropertyTaskmode v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_taskmode	(ICalProperty *prop,
						 ICalPropertyTaskmode v);

LIBICAL_ICAL_EXPORT
ICalPropertyTaskmode 
		i_cal_property_get_taskmode	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_transp	(ICalPropertyTransp v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_transp	(ICalProperty *prop,
						 ICalPropertyTransp v);

LIBICAL_ICAL_EXPORT
ICalPropertyTransp 
		i_cal_property_get_transp	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_trigger	(ICalTrigger *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_trigger	(ICalProperty *prop,
						 ICalTrigger *v);

LIBICAL_ICAL_EXPORT
ICalTrigger *	i_cal_property_get_trigger	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzid		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzid		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_tzid		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzidaliasof	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzidaliasof	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_tzidaliasof	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzname	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzname	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_tzname	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzoffsetfrom	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzoffsetfrom	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_tzoffsetfrom	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzoffsetto	(gint v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzoffsetto	(ICalProperty *prop,
						 gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_property_get_tzoffsetto	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzuntil	(ICalTime *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzuntil	(ICalProperty *prop,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_property_get_tzuntil	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_tzurl	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_tzurl	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_tzurl	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_uid		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_uid		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_uid		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_url		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_url		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_url		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_version	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_version	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_version	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_voter	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_voter	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_voter	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_x		(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_x		(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_x		(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicclass	(ICalPropertyXlicclass v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicclass	(ICalProperty *prop,
						 ICalPropertyXlicclass v);

LIBICAL_ICAL_EXPORT
ICalPropertyXlicclass 
		i_cal_property_get_xlicclass	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicclustercount
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicclustercount
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicclustercount
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicerror	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicerror	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicerror	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimecharset
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimecharset
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimecharset
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimecid	(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimecid	(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimecid	(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimecontenttype
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimecontenttype
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimecontenttype
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimeencoding
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimeencoding
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimeencoding
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimefilename
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimefilename
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimefilename
						(ICalProperty *prop);

LIBICAL_ICAL_EXPORT
ICalProperty *	i_cal_property_new_xlicmimeoptinfo
						(const gchar *v);

LIBICAL_ICAL_EXPORT
void		i_cal_property_set_xlicmimeoptinfo
						(ICalProperty *prop,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_property_get_xlicmimeoptinfo
						(ICalProperty *prop);

G_END_DECLS

#endif /* I_CAL_DERIVED_PROPERTY_H */
