/*
 * Copyright (C) 2008 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * Author: David Zeuthen <davidz@redhat.com>
 */

#if !defined (_POLKIT_COMPILATION) && !defined(_POLKIT_INSIDE_POLKIT_H)
#error "Only <polkit/polkit.h> can be included directly, this file may disappear or change contents."
#endif

#ifndef __POLKIT_SYSTEM_BUS_NAME_H
#define __POLKIT_SYSTEM_BUS_NAME_H

#include <unistd.h>
#include <sys/types.h>
#include <glib-object.h>
#include <gio/gio.h>
#include <polkit/polkittypes.h>

G_BEGIN_DECLS

#define POLKIT_TYPE_SYSTEM_BUS_NAME          (polkit_system_bus_name_get_type())
#define POLKIT_SYSTEM_BUS_NAME(o)            (G_TYPE_CHECK_INSTANCE_CAST ((o), POLKIT_TYPE_SYSTEM_BUS_NAME, PolkitSystemBusName))
#define POLKIT_SYSTEM_BUS_NAME_CLASS(k)      (G_TYPE_CHECK_CLASS_CAST((k), POLKIT_TYPE_SYSTEM_BUS_NAME, PolkitSystemBusNameClass))
#define POLKIT_SYSTEM_BUS_NAME_GET_CLASS(o)  (G_TYPE_INSTANCE_GET_CLASS ((o), POLKIT_TYPE_SYSTEM_BUS_NAME, PolkitSystemBusNameClass))
#define POLKIT_IS_SYSTEM_BUS_NAME(o)         (G_TYPE_CHECK_INSTANCE_TYPE ((o), POLKIT_TYPE_SYSTEM_BUS_NAME))
#define POLKIT_IS_SYSTEM_BUS_NAME_CLASS(k)   (G_TYPE_CHECK_CLASS_TYPE ((k), POLKIT_TYPE_SYSTEM_BUS_NAME))

#if 0
typedef struct _PolkitSystemBusName PolkitSystemBusName;
#endif
typedef struct _PolkitSystemBusNameClass PolkitSystemBusNameClass;

GType           polkit_system_bus_name_get_type           (void) G_GNUC_CONST;
PolkitSubject  *polkit_system_bus_name_new                (const gchar          *name);
const gchar    *polkit_system_bus_name_get_name           (PolkitSystemBusName  *system_bus_name);
void            polkit_system_bus_name_set_name           (PolkitSystemBusName  *system_bus_name,
                                                           const gchar          *name);
/* TODO: add async version of get_process() method */
PolkitSubject  *polkit_system_bus_name_get_process_sync   (PolkitSystemBusName  *system_bus_name,
                                                           GCancellable         *cancellable,
                                                           GError              **error);

PolkitUnixUser * polkit_system_bus_name_get_user_sync     (PolkitSystemBusName  *system_bus_name,
							   GCancellable         *cancellable,
							   GError              **error);

G_END_DECLS

#endif /* __POLKIT_SYSTEM_BUS_NAME_H */
