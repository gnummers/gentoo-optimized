#ifndef FILEINFO_H
#define FILEINFO_H

/*!
 * \file
 *
 * \brief UpnpFileInfo object declararion.
 *
 * Detailed description of this class should go here
 *
 * \author Marcelo Roberto Jimenez
 */

#include "upnpconfig.h"
#include "UpnpInet.h" /* for struct sockaddr_storage */

#include <sys/types.h>  /* for off_t */
#include <time.h>       /* for time_t */

#if defined UPNP_LARGEFILE_SENSITIVE && _FILE_OFFSET_BITS+0 != 64
#error libupnp uses large file support, so users must do that, too
#endif

#define CLASS UpnpFileInfo

#define EXPAND_CLASS_MEMBERS(CLASS) \
	EXPAND_CLASS_MEMBER_INT(CLASS, FileLength, off_t) \
	EXPAND_CLASS_MEMBER_INT(CLASS, LastModified, time_t) \
	EXPAND_CLASS_MEMBER_INT(CLASS, IsDirectory, int) \
	EXPAND_CLASS_MEMBER_INT(CLASS, IsReadable, int) \
	EXPAND_CLASS_MEMBER_DOMSTRING(CLASS, ContentType) \
	EXPAND_CLASS_MEMBER_LIST(CLASS, ExtraHeadersList) \
	EXPAND_CLASS_MEMBER_BUFFER(CLASS, CtrlPtIPAddr, struct sockaddr_storage) \
	EXPAND_CLASS_MEMBER_STRING(CLASS, Os) \

#include "TemplateInclude.h"

#endif /* FILEINFO_H */

