/*
 * Copyright (c) 2018 Balabit
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

#ifndef NVHANDLE_DESCRIPTORS_H_INCLUDED
#define NVHANDLE_DESCRIPTORS_H_INCLUDED

#include "syslog-ng.h"

typedef struct _NVHandleDesc NVHandleDesc;
struct _NVHandleDesc
{
  gchar *name;
  guint16 flags;
  guint8 name_len;
};

typedef struct
{
  NVHandleDesc *data;
  guint   len;
  guint   allocated_len;
  GPtrArray *old_buffers;
} NVHandleDescArray;

#define NVHANDLE_DESC_ARRAY_INITIAL_SIZE 256

NVHandleDescArray *nvhandle_desc_array_new(guint reserved_size);
void nvhandle_desc_array_free(NVHandleDescArray *self);
void nvhandle_desc_array_append(NVHandleDescArray *self, NVHandleDesc *desc);
#define nvhandle_desc_array_index(self, i)      (((NVHandleDesc*) (self)->data) [(i)])

/* Does not free *self*. */
void nvhandle_desc_free(NVHandleDesc *self);

#endif
