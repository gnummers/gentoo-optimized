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

#ifndef I_CAL_DERIVED_PARAMETER_H
#define I_CAL_DERIVED_PARAMETER_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

typedef enum {
	I_CAL_ANY_PARAMETER = ICAL_ANY_PARAMETER,
	I_CAL_ACTIONPARAM_PARAMETER = ICAL_ACTIONPARAM_PARAMETER,
	I_CAL_ALTREP_PARAMETER = ICAL_ALTREP_PARAMETER,
	I_CAL_CHARSET_PARAMETER = ICAL_CHARSET_PARAMETER,
	I_CAL_CN_PARAMETER = ICAL_CN_PARAMETER,
	I_CAL_CUTYPE_PARAMETER = ICAL_CUTYPE_PARAMETER,
	I_CAL_DELEGATEDFROM_PARAMETER = ICAL_DELEGATEDFROM_PARAMETER,
	I_CAL_DELEGATEDTO_PARAMETER = ICAL_DELEGATEDTO_PARAMETER,
	I_CAL_DIR_PARAMETER = ICAL_DIR_PARAMETER,
	I_CAL_ENABLE_PARAMETER = ICAL_ENABLE_PARAMETER,
	I_CAL_ENCODING_PARAMETER = ICAL_ENCODING_PARAMETER,
	I_CAL_FBTYPE_PARAMETER = ICAL_FBTYPE_PARAMETER,
	I_CAL_FILENAME_PARAMETER = ICAL_FILENAME_PARAMETER,
	I_CAL_FMTTYPE_PARAMETER = ICAL_FMTTYPE_PARAMETER,
	I_CAL_IANA_PARAMETER = ICAL_IANA_PARAMETER,
	I_CAL_ID_PARAMETER = ICAL_ID_PARAMETER,
	I_CAL_LANGUAGE_PARAMETER = ICAL_LANGUAGE_PARAMETER,
	I_CAL_LATENCY_PARAMETER = ICAL_LATENCY_PARAMETER,
	I_CAL_LOCAL_PARAMETER = ICAL_LOCAL_PARAMETER,
	I_CAL_LOCALIZE_PARAMETER = ICAL_LOCALIZE_PARAMETER,
	I_CAL_MANAGEDID_PARAMETER = ICAL_MANAGEDID_PARAMETER,
	I_CAL_MEMBER_PARAMETER = ICAL_MEMBER_PARAMETER,
	I_CAL_MODIFIED_PARAMETER = ICAL_MODIFIED_PARAMETER,
	I_CAL_OPTIONS_PARAMETER = ICAL_OPTIONS_PARAMETER,
	I_CAL_PARTSTAT_PARAMETER = ICAL_PARTSTAT_PARAMETER,
	I_CAL_PUBLICCOMMENT_PARAMETER = ICAL_PUBLICCOMMENT_PARAMETER,
	I_CAL_RANGE_PARAMETER = ICAL_RANGE_PARAMETER,
	I_CAL_REASON_PARAMETER = ICAL_REASON_PARAMETER,
	I_CAL_RELATED_PARAMETER = ICAL_RELATED_PARAMETER,
	I_CAL_RELTYPE_PARAMETER = ICAL_RELTYPE_PARAMETER,
	I_CAL_REQUIRED_PARAMETER = ICAL_REQUIRED_PARAMETER,
	I_CAL_RESPONSE_PARAMETER = ICAL_RESPONSE_PARAMETER,
	I_CAL_ROLE_PARAMETER = ICAL_ROLE_PARAMETER,
	I_CAL_RSVP_PARAMETER = ICAL_RSVP_PARAMETER,
	I_CAL_SCHEDULEAGENT_PARAMETER = ICAL_SCHEDULEAGENT_PARAMETER,
	I_CAL_SCHEDULEFORCESEND_PARAMETER = ICAL_SCHEDULEFORCESEND_PARAMETER,
	I_CAL_SCHEDULESTATUS_PARAMETER = ICAL_SCHEDULESTATUS_PARAMETER,
	I_CAL_SENTBY_PARAMETER = ICAL_SENTBY_PARAMETER,
	I_CAL_SIZE_PARAMETER = ICAL_SIZE_PARAMETER,
	I_CAL_STAYINFORMED_PARAMETER = ICAL_STAYINFORMED_PARAMETER,
	I_CAL_SUBSTATE_PARAMETER = ICAL_SUBSTATE_PARAMETER,
	I_CAL_TZID_PARAMETER = ICAL_TZID_PARAMETER,
	I_CAL_VALUE_PARAMETER = ICAL_VALUE_PARAMETER,
	I_CAL_X_PARAMETER = ICAL_X_PARAMETER,
	I_CAL_XLICCOMPARETYPE_PARAMETER = ICAL_XLICCOMPARETYPE_PARAMETER,
	I_CAL_XLICERRORTYPE_PARAMETER = ICAL_XLICERRORTYPE_PARAMETER,
	I_CAL_NO_PARAMETER = ICAL_NO_PARAMETER
} ICalParameterKind;

typedef enum {
	I_CAL_ACTIONPARAM_X = ICAL_ACTIONPARAM_X,
	I_CAL_ACTIONPARAM_ASK = ICAL_ACTIONPARAM_ASK,
	I_CAL_ACTIONPARAM_ABORT = ICAL_ACTIONPARAM_ABORT,
	I_CAL_ACTIONPARAM_NONE = ICAL_ACTIONPARAM_NONE
} ICalParameterAction;

typedef enum {
	I_CAL_CUTYPE_X = ICAL_CUTYPE_X,
	I_CAL_CUTYPE_INDIVIDUAL = ICAL_CUTYPE_INDIVIDUAL,
	I_CAL_CUTYPE_GROUP = ICAL_CUTYPE_GROUP,
	I_CAL_CUTYPE_RESOURCE = ICAL_CUTYPE_RESOURCE,
	I_CAL_CUTYPE_ROOM = ICAL_CUTYPE_ROOM,
	I_CAL_CUTYPE_UNKNOWN = ICAL_CUTYPE_UNKNOWN,
	I_CAL_CUTYPE_NONE = ICAL_CUTYPE_NONE
} ICalParameterCutype;

typedef enum {
	I_CAL_ENABLE_X = ICAL_ENABLE_X,
	I_CAL_ENABLE_TRUE = ICAL_ENABLE_TRUE,
	I_CAL_ENABLE_FALSE = ICAL_ENABLE_FALSE,
	I_CAL_ENABLE_NONE = ICAL_ENABLE_NONE
} ICalParameterEnable;

typedef enum {
	I_CAL_ENCODING_X = ICAL_ENCODING_X,
	I_CAL_ENCODING_8BIT = ICAL_ENCODING_8BIT,
	I_CAL_ENCODING_BASE64 = ICAL_ENCODING_BASE64,
	I_CAL_ENCODING_NONE = ICAL_ENCODING_NONE
} ICalParameterEncoding;

typedef enum {
	I_CAL_FBTYPE_X = ICAL_FBTYPE_X,
	I_CAL_FBTYPE_FREE = ICAL_FBTYPE_FREE,
	I_CAL_FBTYPE_BUSY = ICAL_FBTYPE_BUSY,
	I_CAL_FBTYPE_BUSYUNAVAILABLE = ICAL_FBTYPE_BUSYUNAVAILABLE,
	I_CAL_FBTYPE_BUSYTENTATIVE = ICAL_FBTYPE_BUSYTENTATIVE,
	I_CAL_FBTYPE_NONE = ICAL_FBTYPE_NONE
} ICalParameterFbtype;

typedef enum {
	I_CAL_LOCAL_X = ICAL_LOCAL_X,
	I_CAL_LOCAL_TRUE = ICAL_LOCAL_TRUE,
	I_CAL_LOCAL_FALSE = ICAL_LOCAL_FALSE,
	I_CAL_LOCAL_NONE = ICAL_LOCAL_NONE
} ICalParameterLocal;

typedef enum {
	I_CAL_PARTSTAT_X = ICAL_PARTSTAT_X,
	I_CAL_PARTSTAT_NEEDSACTION = ICAL_PARTSTAT_NEEDSACTION,
	I_CAL_PARTSTAT_ACCEPTED = ICAL_PARTSTAT_ACCEPTED,
	I_CAL_PARTSTAT_DECLINED = ICAL_PARTSTAT_DECLINED,
	I_CAL_PARTSTAT_TENTATIVE = ICAL_PARTSTAT_TENTATIVE,
	I_CAL_PARTSTAT_DELEGATED = ICAL_PARTSTAT_DELEGATED,
	I_CAL_PARTSTAT_COMPLETED = ICAL_PARTSTAT_COMPLETED,
	I_CAL_PARTSTAT_INPROCESS = ICAL_PARTSTAT_INPROCESS,
	I_CAL_PARTSTAT_FAILED = ICAL_PARTSTAT_FAILED,
	I_CAL_PARTSTAT_NONE = ICAL_PARTSTAT_NONE
} ICalParameterPartstat;

typedef enum {
	I_CAL_RANGE_X = ICAL_RANGE_X,
	I_CAL_RANGE_THISANDPRIOR = ICAL_RANGE_THISANDPRIOR,
	I_CAL_RANGE_THISANDFUTURE = ICAL_RANGE_THISANDFUTURE,
	I_CAL_RANGE_NONE = ICAL_RANGE_NONE
} ICalParameterRange;

typedef enum {
	I_CAL_RELATED_X = ICAL_RELATED_X,
	I_CAL_RELATED_START = ICAL_RELATED_START,
	I_CAL_RELATED_END = ICAL_RELATED_END,
	I_CAL_RELATED_NONE = ICAL_RELATED_NONE
} ICalParameterRelated;

typedef enum {
	I_CAL_RELTYPE_X = ICAL_RELTYPE_X,
	I_CAL_RELTYPE_PARENT = ICAL_RELTYPE_PARENT,
	I_CAL_RELTYPE_CHILD = ICAL_RELTYPE_CHILD,
	I_CAL_RELTYPE_SIBLING = ICAL_RELTYPE_SIBLING,
	I_CAL_RELTYPE_POLL = ICAL_RELTYPE_POLL,
	I_CAL_RELTYPE_NONE = ICAL_RELTYPE_NONE
} ICalParameterReltype;

typedef enum {
	I_CAL_REQUIRED_X = ICAL_REQUIRED_X,
	I_CAL_REQUIRED_TRUE = ICAL_REQUIRED_TRUE,
	I_CAL_REQUIRED_FALSE = ICAL_REQUIRED_FALSE,
	I_CAL_REQUIRED_NONE = ICAL_REQUIRED_NONE
} ICalParameterRequired;

typedef enum {
	I_CAL_ROLE_X = ICAL_ROLE_X,
	I_CAL_ROLE_CHAIR = ICAL_ROLE_CHAIR,
	I_CAL_ROLE_REQPARTICIPANT = ICAL_ROLE_REQPARTICIPANT,
	I_CAL_ROLE_OPTPARTICIPANT = ICAL_ROLE_OPTPARTICIPANT,
	I_CAL_ROLE_NONPARTICIPANT = ICAL_ROLE_NONPARTICIPANT,
	I_CAL_ROLE_NONE = ICAL_ROLE_NONE
} ICalParameterRole;

typedef enum {
	I_CAL_RSVP_X = ICAL_RSVP_X,
	I_CAL_RSVP_TRUE = ICAL_RSVP_TRUE,
	I_CAL_RSVP_FALSE = ICAL_RSVP_FALSE,
	I_CAL_RSVP_NONE = ICAL_RSVP_NONE
} ICalParameterRsvp;

typedef enum {
	I_CAL_SCHEDULEAGENT_X = ICAL_SCHEDULEAGENT_X,
	I_CAL_SCHEDULEAGENT_SERVER = ICAL_SCHEDULEAGENT_SERVER,
	I_CAL_SCHEDULEAGENT_CLIENT = ICAL_SCHEDULEAGENT_CLIENT,
	I_CAL_SCHEDULEAGENT_NONE = ICAL_SCHEDULEAGENT_NONE
} ICalParameterScheduleagent;

typedef enum {
	I_CAL_SCHEDULEFORCESEND_X = ICAL_SCHEDULEFORCESEND_X,
	I_CAL_SCHEDULEFORCESEND_REQUEST = ICAL_SCHEDULEFORCESEND_REQUEST,
	I_CAL_SCHEDULEFORCESEND_REPLY = ICAL_SCHEDULEFORCESEND_REPLY,
	I_CAL_SCHEDULEFORCESEND_NONE = ICAL_SCHEDULEFORCESEND_NONE
} ICalParameterScheduleforcesend;

typedef enum {
	I_CAL_STAYINFORMED_X = ICAL_STAYINFORMED_X,
	I_CAL_STAYINFORMED_TRUE = ICAL_STAYINFORMED_TRUE,
	I_CAL_STAYINFORMED_FALSE = ICAL_STAYINFORMED_FALSE,
	I_CAL_STAYINFORMED_NONE = ICAL_STAYINFORMED_NONE
} ICalParameterStayinformed;

typedef enum {
	I_CAL_SUBSTATE_X = ICAL_SUBSTATE_X,
	I_CAL_SUBSTATE_OK = ICAL_SUBSTATE_OK,
	I_CAL_SUBSTATE_ERROR = ICAL_SUBSTATE_ERROR,
	I_CAL_SUBSTATE_SUSPENDED = ICAL_SUBSTATE_SUSPENDED,
	I_CAL_SUBSTATE_NONE = ICAL_SUBSTATE_NONE
} ICalParameterSubstate;

typedef enum {
	I_CAL_VALUE_X = ICAL_VALUE_X,
	I_CAL_VALUE_BINARY = ICAL_VALUE_BINARY,
	I_CAL_VALUE_BOOLEAN = ICAL_VALUE_BOOLEAN,
	I_CAL_VALUE_DATE = ICAL_VALUE_DATE,
	I_CAL_VALUE_DURATION = ICAL_VALUE_DURATION,
	I_CAL_VALUE_FLOAT = ICAL_VALUE_FLOAT,
	I_CAL_VALUE_INTEGER = ICAL_VALUE_INTEGER,
	I_CAL_VALUE_PERIOD = ICAL_VALUE_PERIOD,
	I_CAL_VALUE_RECUR = ICAL_VALUE_RECUR,
	I_CAL_VALUE_TEXT = ICAL_VALUE_TEXT,
	I_CAL_VALUE_URI = ICAL_VALUE_URI,
	I_CAL_VALUE_ERROR = ICAL_VALUE_ERROR,
	I_CAL_VALUE_DATETIME = ICAL_VALUE_DATETIME,
	I_CAL_VALUE_UTCOFFSET = ICAL_VALUE_UTCOFFSET,
	I_CAL_VALUE_CALADDRESS = ICAL_VALUE_CALADDRESS,
	I_CAL_VALUE_NONE = ICAL_VALUE_NONE
} ICalParameterValue;

typedef enum {
	I_CAL_XLICCOMPARETYPE_X = ICAL_XLICCOMPARETYPE_X,
	I_CAL_XLICCOMPARETYPE_EQUAL = ICAL_XLICCOMPARETYPE_EQUAL,
	I_CAL_XLICCOMPARETYPE_NOTEQUAL = ICAL_XLICCOMPARETYPE_NOTEQUAL,
	I_CAL_XLICCOMPARETYPE_LESS = ICAL_XLICCOMPARETYPE_LESS,
	I_CAL_XLICCOMPARETYPE_GREATER = ICAL_XLICCOMPARETYPE_GREATER,
	I_CAL_XLICCOMPARETYPE_LESSEQUAL = ICAL_XLICCOMPARETYPE_LESSEQUAL,
	I_CAL_XLICCOMPARETYPE_GREATEREQUAL = ICAL_XLICCOMPARETYPE_GREATEREQUAL,
	I_CAL_XLICCOMPARETYPE_REGEX = ICAL_XLICCOMPARETYPE_REGEX,
	I_CAL_XLICCOMPARETYPE_ISNULL = ICAL_XLICCOMPARETYPE_ISNULL,
	I_CAL_XLICCOMPARETYPE_ISNOTNULL = ICAL_XLICCOMPARETYPE_ISNOTNULL,
	I_CAL_XLICCOMPARETYPE_NONE = ICAL_XLICCOMPARETYPE_NONE
} ICalParameterXliccomparetype;

typedef enum {
	I_CAL_XLICERRORTYPE_X = ICAL_XLICERRORTYPE_X,
	I_CAL_XLICERRORTYPE_COMPONENTPARSEERROR = ICAL_XLICERRORTYPE_COMPONENTPARSEERROR,
	I_CAL_XLICERRORTYPE_PROPERTYPARSEERROR = ICAL_XLICERRORTYPE_PROPERTYPARSEERROR,
	I_CAL_XLICERRORTYPE_PARAMETERNAMEPARSEERROR = ICAL_XLICERRORTYPE_PARAMETERNAMEPARSEERROR,
	I_CAL_XLICERRORTYPE_PARAMETERVALUEPARSEERROR = ICAL_XLICERRORTYPE_PARAMETERVALUEPARSEERROR,
	I_CAL_XLICERRORTYPE_VALUEPARSEERROR = ICAL_XLICERRORTYPE_VALUEPARSEERROR,
	I_CAL_XLICERRORTYPE_INVALIDITIP = ICAL_XLICERRORTYPE_INVALIDITIP,
	I_CAL_XLICERRORTYPE_UNKNOWNVCALPROPERROR = ICAL_XLICERRORTYPE_UNKNOWNVCALPROPERROR,
	I_CAL_XLICERRORTYPE_MIMEPARSEERROR = ICAL_XLICERRORTYPE_MIMEPARSEERROR,
	I_CAL_XLICERRORTYPE_VCALPROPPARSEERROR = ICAL_XLICERRORTYPE_VCALPROPPARSEERROR,
	I_CAL_XLICERRORTYPE_NONE = ICAL_XLICERRORTYPE_NONE
} ICalParameterXlicerrortype;


LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_actionparam	(ICalParameterAction v);

LIBICAL_ICAL_EXPORT
ICalParameterAction 
		i_cal_parameter_get_actionparam	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_actionparam	(ICalParameter *value,
						 ICalParameterAction v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_altrep	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_altrep	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_altrep	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_charset	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_charset	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_charset	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_cn		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_cn		(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_cn		(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_cutype	(ICalParameterCutype v);

LIBICAL_ICAL_EXPORT
ICalParameterCutype 
		i_cal_parameter_get_cutype	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_cutype	(ICalParameter *value,
						 ICalParameterCutype v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_delegatedfrom
						(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_delegatedfrom
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_delegatedfrom
						(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_delegatedto	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_delegatedto	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_delegatedto	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_dir		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_dir		(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_dir		(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_enable	(ICalParameterEnable v);

LIBICAL_ICAL_EXPORT
ICalParameterEnable 
		i_cal_parameter_get_enable	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_enable	(ICalParameter *value,
						 ICalParameterEnable v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_encoding	(ICalParameterEncoding v);

LIBICAL_ICAL_EXPORT
ICalParameterEncoding 
		i_cal_parameter_get_encoding	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_encoding	(ICalParameter *value,
						 ICalParameterEncoding v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_fbtype	(ICalParameterFbtype v);

LIBICAL_ICAL_EXPORT
ICalParameterFbtype 
		i_cal_parameter_get_fbtype	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_fbtype	(ICalParameter *value,
						 ICalParameterFbtype v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_filename	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_filename	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_filename	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_fmttype	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_fmttype	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_fmttype	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_iana	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_iana	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_iana	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_id		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_id		(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_id		(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_language	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_language	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_language	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_latency	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_latency	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_latency	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_local	(ICalParameterLocal v);

LIBICAL_ICAL_EXPORT
ICalParameterLocal 
		i_cal_parameter_get_local	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_local	(ICalParameter *value,
						 ICalParameterLocal v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_localize	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_localize	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_localize	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_managedid	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_managedid	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_managedid	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_member	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_member	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_member	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_modified	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_modified	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_modified	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_options	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_options	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_options	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_partstat	(ICalParameterPartstat v);

LIBICAL_ICAL_EXPORT
ICalParameterPartstat 
		i_cal_parameter_get_partstat	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_partstat	(ICalParameter *value,
						 ICalParameterPartstat v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_publiccomment
						(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_publiccomment
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_publiccomment
						(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_range	(ICalParameterRange v);

LIBICAL_ICAL_EXPORT
ICalParameterRange 
		i_cal_parameter_get_range	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_range	(ICalParameter *value,
						 ICalParameterRange v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_reason	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_reason	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_reason	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_related	(ICalParameterRelated v);

LIBICAL_ICAL_EXPORT
ICalParameterRelated 
		i_cal_parameter_get_related	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_related	(ICalParameter *value,
						 ICalParameterRelated v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_reltype	(ICalParameterReltype v);

LIBICAL_ICAL_EXPORT
ICalParameterReltype 
		i_cal_parameter_get_reltype	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_reltype	(ICalParameter *value,
						 ICalParameterReltype v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_required	(ICalParameterRequired v);

LIBICAL_ICAL_EXPORT
ICalParameterRequired 
		i_cal_parameter_get_required	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_required	(ICalParameter *value,
						 ICalParameterRequired v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_response	(gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_parameter_get_response	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_response	(ICalParameter *value,
						 gint v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_role	(ICalParameterRole v);

LIBICAL_ICAL_EXPORT
ICalParameterRole 
		i_cal_parameter_get_role	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_role	(ICalParameter *value,
						 ICalParameterRole v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_rsvp	(ICalParameterRsvp v);

LIBICAL_ICAL_EXPORT
ICalParameterRsvp 
		i_cal_parameter_get_rsvp	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_rsvp	(ICalParameter *value,
						 ICalParameterRsvp v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_scheduleagent
						(ICalParameterScheduleagent v);

LIBICAL_ICAL_EXPORT
ICalParameterScheduleagent 
		i_cal_parameter_get_scheduleagent
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_scheduleagent
						(ICalParameter *value,
						 ICalParameterScheduleagent v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_scheduleforcesend
						(ICalParameterScheduleforcesend v);

LIBICAL_ICAL_EXPORT
ICalParameterScheduleforcesend 
		i_cal_parameter_get_scheduleforcesend
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_scheduleforcesend
						(ICalParameter *value,
						 ICalParameterScheduleforcesend v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_schedulestatus
						(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_schedulestatus
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_schedulestatus
						(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_sentby	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_sentby	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_sentby	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_size	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_size	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_size	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_stayinformed
						(ICalParameterStayinformed v);

LIBICAL_ICAL_EXPORT
ICalParameterStayinformed 
		i_cal_parameter_get_stayinformed
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_stayinformed
						(ICalParameter *value,
						 ICalParameterStayinformed v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_substate	(ICalParameterSubstate v);

LIBICAL_ICAL_EXPORT
ICalParameterSubstate 
		i_cal_parameter_get_substate	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_substate	(ICalParameter *value,
						 ICalParameterSubstate v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_tzid	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_tzid	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_tzid	(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_value	(ICalParameterValue v);

LIBICAL_ICAL_EXPORT
ICalParameterValue 
		i_cal_parameter_get_value	(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_value	(ICalParameter *value,
						 ICalParameterValue v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_x		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_parameter_get_x		(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_x		(ICalParameter *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_xliccomparetype
						(ICalParameterXliccomparetype v);

LIBICAL_ICAL_EXPORT
ICalParameterXliccomparetype 
		i_cal_parameter_get_xliccomparetype
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_xliccomparetype
						(ICalParameter *value,
						 ICalParameterXliccomparetype v);

LIBICAL_ICAL_EXPORT
ICalParameter *	i_cal_parameter_new_xlicerrortype
						(ICalParameterXlicerrortype v);

LIBICAL_ICAL_EXPORT
ICalParameterXlicerrortype 
		i_cal_parameter_get_xlicerrortype
						(const ICalParameter *value);

LIBICAL_ICAL_EXPORT
void		i_cal_parameter_set_xlicerrortype
						(ICalParameter *value,
						 ICalParameterXlicerrortype v);

G_END_DECLS

#endif /* I_CAL_DERIVED_PARAMETER_H */
