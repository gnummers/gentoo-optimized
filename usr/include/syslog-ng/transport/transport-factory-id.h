/*
 * Copyright (c) 2002-2018 Balabit
 * Copyright (c) 2018 Laszlo Budai <laszlo.budai@balabit.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * As an additional exemption you are allowed to compile & link against the
 * OpenSSL libraries as published by the OpenSSL project. See the file
 * COPYING for details.
 *
 */

#ifndef TRANSPORT_FACTORY_ID_INCLUDED
#define TRANSPORT_FACTORY_ID_INCLUDED

#include "syslog-ng.h"

typedef struct _TransportFactoryId TransportFactoryId;

/*
 * public API
 * */
void transport_factory_id_global_init(void);
void transport_factory_id_global_deinit(void);
const gchar *transport_factory_id_get_transport_name(const TransportFactoryId *);
void transport_factory_id_free(TransportFactoryId *);
guint transport_factory_id_hash(gconstpointer);
gboolean transport_factory_id_equal(const TransportFactoryId *, const TransportFactoryId *);

/**
 * private API (for internal usage and test)
 */
TransportFactoryId *_transport_factory_id_new(const gchar *transport_name);
void _transport_factory_id_register(TransportFactoryId *);
GList *_transport_factory_id_clone_registered_ids(void);
TransportFactoryId *_transport_factory_id_clone(const TransportFactoryId *);

void _transport_factory_id_lock(void);
void _transport_factory_id_unlock(void);

#define DEFINE_TRANSPORT_FACTORY_ID_FUN(transport_name, func_name) \
  const TransportFactoryId* func_name(void) \
  {\
    static TransportFactoryId *id;\
    _transport_factory_id_lock(); \
    if (!id)\
      {\
        id = _transport_factory_id_new(transport_name);\
        _transport_factory_id_register(id);\
      }\
    _transport_factory_id_unlock(); \
    return id;\
  }

#endif
