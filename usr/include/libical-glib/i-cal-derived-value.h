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

#ifndef I_CAL_DERIVED_VALUE_H
#define I_CAL_DERIVED_VALUE_H

#include <libical-glib/i-cal-forward-declarations.h>
#include <libical-glib/i-cal-object.h>

G_BEGIN_DECLS

typedef enum {
	I_CAL_ANY_VALUE = ICAL_ANY_VALUE,
	I_CAL_ACTION_VALUE = ICAL_ACTION_VALUE,
	I_CAL_ATTACH_VALUE = ICAL_ATTACH_VALUE,
	I_CAL_BINARY_VALUE = ICAL_BINARY_VALUE,
	I_CAL_BOOLEAN_VALUE = ICAL_BOOLEAN_VALUE,
	I_CAL_BUSYTYPE_VALUE = ICAL_BUSYTYPE_VALUE,
	I_CAL_CALADDRESS_VALUE = ICAL_CALADDRESS_VALUE,
	I_CAL_CARLEVEL_VALUE = ICAL_CARLEVEL_VALUE,
	I_CAL_CLASS_VALUE = ICAL_CLASS_VALUE,
	I_CAL_CMD_VALUE = ICAL_CMD_VALUE,
	I_CAL_DATE_VALUE = ICAL_DATE_VALUE,
	I_CAL_DATETIME_VALUE = ICAL_DATETIME_VALUE,
	I_CAL_DATETIMEDATE_VALUE = ICAL_DATETIMEDATE_VALUE,
	I_CAL_DATETIMEPERIOD_VALUE = ICAL_DATETIMEPERIOD_VALUE,
	I_CAL_DURATION_VALUE = ICAL_DURATION_VALUE,
	I_CAL_FLOAT_VALUE = ICAL_FLOAT_VALUE,
	I_CAL_GEO_VALUE = ICAL_GEO_VALUE,
	I_CAL_INTEGER_VALUE = ICAL_INTEGER_VALUE,
	I_CAL_METHOD_VALUE = ICAL_METHOD_VALUE,
	I_CAL_PERIOD_VALUE = ICAL_PERIOD_VALUE,
	I_CAL_POLLCOMPLETION_VALUE = ICAL_POLLCOMPLETION_VALUE,
	I_CAL_POLLMODE_VALUE = ICAL_POLLMODE_VALUE,
	I_CAL_QUERY_VALUE = ICAL_QUERY_VALUE,
	I_CAL_QUERYLEVEL_VALUE = ICAL_QUERYLEVEL_VALUE,
	I_CAL_RECUR_VALUE = ICAL_RECUR_VALUE,
	I_CAL_REQUESTSTATUS_VALUE = ICAL_REQUESTSTATUS_VALUE,
	I_CAL_STATUS_VALUE = ICAL_STATUS_VALUE,
	I_CAL_STRING_VALUE = ICAL_STRING_VALUE,
	I_CAL_TASKMODE_VALUE = ICAL_TASKMODE_VALUE,
	I_CAL_TEXT_VALUE = ICAL_TEXT_VALUE,
	I_CAL_TRANSP_VALUE = ICAL_TRANSP_VALUE,
	I_CAL_TRIGGER_VALUE = ICAL_TRIGGER_VALUE,
	I_CAL_URI_VALUE = ICAL_URI_VALUE,
	I_CAL_UTCOFFSET_VALUE = ICAL_UTCOFFSET_VALUE,
	I_CAL_X_VALUE = ICAL_X_VALUE,
	I_CAL_XLICCLASS_VALUE = ICAL_XLICCLASS_VALUE,
	I_CAL_NO_VALUE = ICAL_NO_VALUE
} ICalValueKind;

typedef enum {
	I_CAL_ACTION_X = ICAL_ACTION_X,
	I_CAL_ACTION_AUDIO = ICAL_ACTION_AUDIO,
	I_CAL_ACTION_DISPLAY = ICAL_ACTION_DISPLAY,
	I_CAL_ACTION_EMAIL = ICAL_ACTION_EMAIL,
	I_CAL_ACTION_PROCEDURE = ICAL_ACTION_PROCEDURE,
	I_CAL_ACTION_NONE = ICAL_ACTION_NONE
} ICalPropertyAction;

typedef enum {
	I_CAL_BUSYTYPE_X = ICAL_BUSYTYPE_X,
	I_CAL_BUSYTYPE_BUSY = ICAL_BUSYTYPE_BUSY,
	I_CAL_BUSYTYPE_BUSYUNAVAILABLE = ICAL_BUSYTYPE_BUSYUNAVAILABLE,
	I_CAL_BUSYTYPE_BUSYTENTATIVE = ICAL_BUSYTYPE_BUSYTENTATIVE,
	I_CAL_BUSYTYPE_NONE = ICAL_BUSYTYPE_NONE
} ICalPropertyBusytype;

typedef enum {
	I_CAL_CARLEVEL_X = ICAL_CARLEVEL_X,
	I_CAL_CARLEVEL_CARNONE = ICAL_CARLEVEL_CARNONE,
	I_CAL_CARLEVEL_CARMIN = ICAL_CARLEVEL_CARMIN,
	I_CAL_CARLEVEL_CARFULL1 = ICAL_CARLEVEL_CARFULL1,
	I_CAL_CARLEVEL_NONE = ICAL_CARLEVEL_NONE
} ICalPropertyCarlevel;

typedef enum {
	I_CAL_CLASS_X = ICAL_CLASS_X,
	I_CAL_CLASS_PUBLIC = ICAL_CLASS_PUBLIC,
	I_CAL_CLASS_PRIVATE = ICAL_CLASS_PRIVATE,
	I_CAL_CLASS_CONFIDENTIAL = ICAL_CLASS_CONFIDENTIAL,
	I_CAL_CLASS_NONE = ICAL_CLASS_NONE
} ICalProperty_Class;

typedef enum {
	I_CAL_CMD_X = ICAL_CMD_X,
	I_CAL_CMD_ABORT = ICAL_CMD_ABORT,
	I_CAL_CMD_CONTINUE = ICAL_CMD_CONTINUE,
	I_CAL_CMD_CREATE = ICAL_CMD_CREATE,
	I_CAL_CMD_DELETE = ICAL_CMD_DELETE,
	I_CAL_CMD_GENERATEUID = ICAL_CMD_GENERATEUID,
	I_CAL_CMD_GETCAPABILITY = ICAL_CMD_GETCAPABILITY,
	I_CAL_CMD_IDENTIFY = ICAL_CMD_IDENTIFY,
	I_CAL_CMD_MODIFY = ICAL_CMD_MODIFY,
	I_CAL_CMD_MOVE = ICAL_CMD_MOVE,
	I_CAL_CMD_REPLY = ICAL_CMD_REPLY,
	I_CAL_CMD_SEARCH = ICAL_CMD_SEARCH,
	I_CAL_CMD_SETLOCALE = ICAL_CMD_SETLOCALE,
	I_CAL_CMD_NONE = ICAL_CMD_NONE
} ICalPropertyCmd;

typedef enum {
	I_CAL_METHOD_X = ICAL_METHOD_X,
	I_CAL_METHOD_PUBLISH = ICAL_METHOD_PUBLISH,
	I_CAL_METHOD_REQUEST = ICAL_METHOD_REQUEST,
	I_CAL_METHOD_REPLY = ICAL_METHOD_REPLY,
	I_CAL_METHOD_ADD = ICAL_METHOD_ADD,
	I_CAL_METHOD_CANCEL = ICAL_METHOD_CANCEL,
	I_CAL_METHOD_REFRESH = ICAL_METHOD_REFRESH,
	I_CAL_METHOD_COUNTER = ICAL_METHOD_COUNTER,
	I_CAL_METHOD_DECLINECOUNTER = ICAL_METHOD_DECLINECOUNTER,
	I_CAL_METHOD_CREATE = ICAL_METHOD_CREATE,
	I_CAL_METHOD_READ = ICAL_METHOD_READ,
	I_CAL_METHOD_RESPONSE = ICAL_METHOD_RESPONSE,
	I_CAL_METHOD_MOVE = ICAL_METHOD_MOVE,
	I_CAL_METHOD_MODIFY = ICAL_METHOD_MODIFY,
	I_CAL_METHOD_GENERATEUID = ICAL_METHOD_GENERATEUID,
	I_CAL_METHOD_DELETE = ICAL_METHOD_DELETE,
	I_CAL_METHOD_NONE = ICAL_METHOD_NONE
} ICalPropertyMethod;

typedef enum {
	I_CAL_POLLCOMPLETION_X = ICAL_POLLCOMPLETION_X,
	I_CAL_POLLCOMPLETION_SERVER = ICAL_POLLCOMPLETION_SERVER,
	I_CAL_POLLCOMPLETION_SERVERSUBMIT = ICAL_POLLCOMPLETION_SERVERSUBMIT,
	I_CAL_POLLCOMPLETION_SERVERCHOICE = ICAL_POLLCOMPLETION_SERVERCHOICE,
	I_CAL_POLLCOMPLETION_CLIENT = ICAL_POLLCOMPLETION_CLIENT,
	I_CAL_POLLCOMPLETION_NONE = ICAL_POLLCOMPLETION_NONE
} ICalPropertyPollcompletion;

typedef enum {
	I_CAL_POLLMODE_X = ICAL_POLLMODE_X,
	I_CAL_POLLMODE_BASIC = ICAL_POLLMODE_BASIC,
	I_CAL_POLLMODE_NONE = ICAL_POLLMODE_NONE
} ICalPropertyPollmode;

typedef enum {
	I_CAL_QUERYLEVEL_X = ICAL_QUERYLEVEL_X,
	I_CAL_QUERYLEVEL_CALQL1 = ICAL_QUERYLEVEL_CALQL1,
	I_CAL_QUERYLEVEL_CALQLNONE = ICAL_QUERYLEVEL_CALQLNONE,
	I_CAL_QUERYLEVEL_NONE = ICAL_QUERYLEVEL_NONE
} ICalPropertyQuerylevel;

typedef enum {
	I_CAL_STATUS_X = ICAL_STATUS_X,
	I_CAL_STATUS_TENTATIVE = ICAL_STATUS_TENTATIVE,
	I_CAL_STATUS_CONFIRMED = ICAL_STATUS_CONFIRMED,
	I_CAL_STATUS_COMPLETED = ICAL_STATUS_COMPLETED,
	I_CAL_STATUS_NEEDSACTION = ICAL_STATUS_NEEDSACTION,
	I_CAL_STATUS_CANCELLED = ICAL_STATUS_CANCELLED,
	I_CAL_STATUS_INPROCESS = ICAL_STATUS_INPROCESS,
	I_CAL_STATUS_DRAFT = ICAL_STATUS_DRAFT,
	I_CAL_STATUS_FINAL = ICAL_STATUS_FINAL,
	I_CAL_STATUS_SUBMITTED = ICAL_STATUS_SUBMITTED,
	I_CAL_STATUS_PENDING = ICAL_STATUS_PENDING,
	I_CAL_STATUS_FAILED = ICAL_STATUS_FAILED,
	I_CAL_STATUS_DELETED = ICAL_STATUS_DELETED,
	I_CAL_STATUS_NONE = ICAL_STATUS_NONE
} ICalPropertyStatus;

typedef enum {
	I_CAL_TASKMODE_X = ICAL_TASKMODE_X,
	I_CAL_TASKMODE_AUTOMATICCOMPLETION = ICAL_TASKMODE_AUTOMATICCOMPLETION,
	I_CAL_TASKMODE_AUTOMATICFAILURE = ICAL_TASKMODE_AUTOMATICFAILURE,
	I_CAL_TASKMODE_AUTOMATICSTATUS = ICAL_TASKMODE_AUTOMATICSTATUS,
	I_CAL_TASKMODE_NONE = ICAL_TASKMODE_NONE
} ICalPropertyTaskmode;

typedef enum {
	I_CAL_TRANSP_X = ICAL_TRANSP_X,
	I_CAL_TRANSP_OPAQUE = ICAL_TRANSP_OPAQUE,
	I_CAL_TRANSP_OPAQUENOCONFLICT = ICAL_TRANSP_OPAQUENOCONFLICT,
	I_CAL_TRANSP_TRANSPARENT = ICAL_TRANSP_TRANSPARENT,
	I_CAL_TRANSP_TRANSPARENTNOCONFLICT = ICAL_TRANSP_TRANSPARENTNOCONFLICT,
	I_CAL_TRANSP_NONE = ICAL_TRANSP_NONE
} ICalPropertyTransp;

typedef enum {
	I_CAL_XLICCLASS_X = ICAL_XLICCLASS_X,
	I_CAL_XLICCLASS_PUBLISHNEW = ICAL_XLICCLASS_PUBLISHNEW,
	I_CAL_XLICCLASS_PUBLISHUPDATE = ICAL_XLICCLASS_PUBLISHUPDATE,
	I_CAL_XLICCLASS_PUBLISHFREEBUSY = ICAL_XLICCLASS_PUBLISHFREEBUSY,
	I_CAL_XLICCLASS_REQUESTNEW = ICAL_XLICCLASS_REQUESTNEW,
	I_CAL_XLICCLASS_REQUESTUPDATE = ICAL_XLICCLASS_REQUESTUPDATE,
	I_CAL_XLICCLASS_REQUESTRESCHEDULE = ICAL_XLICCLASS_REQUESTRESCHEDULE,
	I_CAL_XLICCLASS_REQUESTDELEGATE = ICAL_XLICCLASS_REQUESTDELEGATE,
	I_CAL_XLICCLASS_REQUESTNEWORGANIZER = ICAL_XLICCLASS_REQUESTNEWORGANIZER,
	I_CAL_XLICCLASS_REQUESTFORWARD = ICAL_XLICCLASS_REQUESTFORWARD,
	I_CAL_XLICCLASS_REQUESTSTATUS = ICAL_XLICCLASS_REQUESTSTATUS,
	I_CAL_XLICCLASS_REQUESTFREEBUSY = ICAL_XLICCLASS_REQUESTFREEBUSY,
	I_CAL_XLICCLASS_REPLYACCEPT = ICAL_XLICCLASS_REPLYACCEPT,
	I_CAL_XLICCLASS_REPLYDECLINE = ICAL_XLICCLASS_REPLYDECLINE,
	I_CAL_XLICCLASS_REPLYDELEGATE = ICAL_XLICCLASS_REPLYDELEGATE,
	I_CAL_XLICCLASS_REPLYCRASHERACCEPT = ICAL_XLICCLASS_REPLYCRASHERACCEPT,
	I_CAL_XLICCLASS_REPLYCRASHERDECLINE = ICAL_XLICCLASS_REPLYCRASHERDECLINE,
	I_CAL_XLICCLASS_ADDINSTANCE = ICAL_XLICCLASS_ADDINSTANCE,
	I_CAL_XLICCLASS_CANCELEVENT = ICAL_XLICCLASS_CANCELEVENT,
	I_CAL_XLICCLASS_CANCELINSTANCE = ICAL_XLICCLASS_CANCELINSTANCE,
	I_CAL_XLICCLASS_CANCELALL = ICAL_XLICCLASS_CANCELALL,
	I_CAL_XLICCLASS_REFRESH = ICAL_XLICCLASS_REFRESH,
	I_CAL_XLICCLASS_COUNTER = ICAL_XLICCLASS_COUNTER,
	I_CAL_XLICCLASS_DECLINECOUNTER = ICAL_XLICCLASS_DECLINECOUNTER,
	I_CAL_XLICCLASS_MALFORMED = ICAL_XLICCLASS_MALFORMED,
	I_CAL_XLICCLASS_OBSOLETE = ICAL_XLICCLASS_OBSOLETE,
	I_CAL_XLICCLASS_MISSEQUENCED = ICAL_XLICCLASS_MISSEQUENCED,
	I_CAL_XLICCLASS_UNKNOWN = ICAL_XLICCLASS_UNKNOWN,
	I_CAL_XLICCLASS_NONE = ICAL_XLICCLASS_NONE
} ICalPropertyXlicclass;


LIBICAL_ICAL_EXPORT
void		i_cal_value_set_x		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_x		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_x		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_recur		(ICalValue *value,
						 ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_recur		(ICalRecurrence *v);

LIBICAL_ICAL_EXPORT
ICalRecurrence *
		i_cal_value_get_recur		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_trigger		(ICalValue *value,
						 ICalTrigger *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_trigger		(ICalTrigger *v);

LIBICAL_ICAL_EXPORT
ICalTrigger *	i_cal_value_get_trigger		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_datetime	(ICalValue *value,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_datetime	(ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_value_get_datetime	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_datetimedate	(ICalValue *value,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_datetimedate	(ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_value_get_datetimedate	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_datetimeperiod	(ICalValue *value,
						 ICalDatetimeperiod *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_datetimeperiod	(ICalDatetimeperiod *v);

LIBICAL_ICAL_EXPORT
ICalDatetimeperiod *
		i_cal_value_get_datetimeperiod	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_geo		(ICalValue *value,
						 ICalGeo *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_geo		(ICalGeo *v);

LIBICAL_ICAL_EXPORT
ICalGeo *	i_cal_value_get_geo		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_attach		(ICalValue *value,
						 ICalAttach *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_attach		(ICalAttach *v);

LIBICAL_ICAL_EXPORT
ICalAttach *	i_cal_value_get_attach		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_reset_kind		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_xlicclass	(ICalValue *value,
						 ICalPropertyXlicclass v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_xlicclass	(ICalPropertyXlicclass v);

LIBICAL_ICAL_EXPORT
ICalPropertyXlicclass 
		i_cal_value_get_xlicclass	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_boolean		(ICalValue *value,
						 gint v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_boolean		(gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_value_get_boolean		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_busytype	(ICalValue *value,
						 ICalPropertyBusytype v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_busytype	(ICalPropertyBusytype v);

LIBICAL_ICAL_EXPORT
ICalPropertyBusytype 
		i_cal_value_get_busytype	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_pollcompletion	(ICalValue *value,
						 ICalPropertyPollcompletion v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_pollcompletion	(ICalPropertyPollcompletion v);

LIBICAL_ICAL_EXPORT
ICalPropertyPollcompletion 
		i_cal_value_get_pollcompletion	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_taskmode	(ICalValue *value,
						 ICalPropertyTaskmode v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_taskmode	(ICalPropertyTaskmode v);

LIBICAL_ICAL_EXPORT
ICalPropertyTaskmode 
		i_cal_value_get_taskmode	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_pollmode	(ICalValue *value,
						 ICalPropertyPollmode v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_pollmode	(ICalPropertyPollmode v);

LIBICAL_ICAL_EXPORT
ICalPropertyPollmode 
		i_cal_value_get_pollmode	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_utcoffset	(ICalValue *value,
						 gint v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_utcoffset	(gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_value_get_utcoffset	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_method		(ICalValue *value,
						 ICalPropertyMethod v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_method		(ICalPropertyMethod v);

LIBICAL_ICAL_EXPORT
ICalPropertyMethod 
		i_cal_value_get_method		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_caladdress	(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_caladdress	(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_caladdress	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_period		(ICalValue *value,
						 ICalPeriod *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_period		(ICalPeriod *v);

LIBICAL_ICAL_EXPORT
ICalPeriod *	i_cal_value_get_period		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_status		(ICalValue *value,
						 ICalPropertyStatus v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_status		(ICalPropertyStatus v);

LIBICAL_ICAL_EXPORT
ICalPropertyStatus 
		i_cal_value_get_status		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_binary		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_binary		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_binary		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_text		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_text		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_text		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_duration	(ICalValue *value,
						 ICalDuration *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_duration	(ICalDuration *v);

LIBICAL_ICAL_EXPORT
ICalDuration *	i_cal_value_get_duration	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_integer		(ICalValue *value,
						 gint v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_integer		(gint v);

LIBICAL_ICAL_EXPORT
gint 		i_cal_value_get_integer		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_uri		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_uri		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_uri		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_class		(ICalValue *value,
						 ICalProperty_Class v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_class		(ICalProperty_Class v);

LIBICAL_ICAL_EXPORT
ICalProperty_Class 
		i_cal_value_get_class		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_float		(ICalValue *value,
						 gdouble v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_float		(gdouble v);

LIBICAL_ICAL_EXPORT
gdouble 		i_cal_value_get_float		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_query		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_query		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_query		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_string		(ICalValue *value,
						 const gchar *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_string		(const gchar *v);

LIBICAL_ICAL_EXPORT
const gchar *	i_cal_value_get_string		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_transp		(ICalValue *value,
						 ICalPropertyTransp v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_transp		(ICalPropertyTransp v);

LIBICAL_ICAL_EXPORT
ICalPropertyTransp 
		i_cal_value_get_transp		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_requeststatus	(ICalValue *value,
						 ICalReqstat *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_requeststatus	(ICalReqstat *v);

LIBICAL_ICAL_EXPORT
ICalReqstat *	i_cal_value_get_requeststatus	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_date		(ICalValue *value,
						 ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_date		(ICalTime *v);

LIBICAL_ICAL_EXPORT
ICalTime *	i_cal_value_get_date		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_action		(ICalValue *value,
						 ICalPropertyAction v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_action		(ICalPropertyAction v);

LIBICAL_ICAL_EXPORT
ICalPropertyAction 
		i_cal_value_get_action		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_cmd		(ICalValue *value,
						 ICalPropertyCmd v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_cmd		(ICalPropertyCmd v);

LIBICAL_ICAL_EXPORT
ICalPropertyCmd 	i_cal_value_get_cmd		(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_querylevel	(ICalValue *value,
						 ICalPropertyQuerylevel v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_querylevel	(ICalPropertyQuerylevel v);

LIBICAL_ICAL_EXPORT
ICalPropertyQuerylevel 
		i_cal_value_get_querylevel	(ICalValue *value);

LIBICAL_ICAL_EXPORT
void		i_cal_value_set_carlevel	(ICalValue *value,
						 ICalPropertyCarlevel v);

LIBICAL_ICAL_EXPORT
ICalValue *	i_cal_value_new_carlevel	(ICalPropertyCarlevel v);

LIBICAL_ICAL_EXPORT
ICalPropertyCarlevel 
		i_cal_value_get_carlevel	(ICalValue *value);

G_END_DECLS

#endif /* I_CAL_DERIVED_VALUE_H */
