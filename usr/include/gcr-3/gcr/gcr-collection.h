/*
 * gnome-keyring
 *
 * Copyright (C) 2010 Stefan Walter
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __GCR_COLLECTION_H__
#define __GCR_COLLECTION_H__

#include "gcr-types.h"

#include <glib-object.h>

G_BEGIN_DECLS

#define GCR_TYPE_COLLECTION                 (gcr_collection_get_type())
#define GCR_COLLECTION(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GCR_TYPE_COLLECTION, GcrCollection))
#define GCR_IS_COLLECTION(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GCR_TYPE_COLLECTION))
#define GCR_COLLECTION_GET_INTERFACE(inst)  (G_TYPE_INSTANCE_GET_INTERFACE ((inst), GCR_TYPE_COLLECTION, GcrCollectionIface))

typedef struct _GcrCollection      GcrCollection;
typedef struct _GcrCollectionIface GcrCollectionIface;

struct _GcrCollectionIface {
	GTypeInterface parent;

	/* signals */
	void (*added) (GcrCollection *self, GObject *object);

	void (*removed) (GcrCollection *self, GObject *object);

	/* virtual */
	guint    (*get_length)  (GcrCollection *self);

	GList*   (*get_objects) (GcrCollection *self);

	gboolean (*contains)    (GcrCollection *self,
	                         GObject *object);

	/*< private >*/
	gpointer dummy1;
	gpointer dummy2;
	gpointer dummy3;
	gpointer dummy5;
	gpointer dummy6;
	gpointer dummy7;
	gpointer dummy8;
};

GType               gcr_collection_get_type               (void);

guint               gcr_collection_get_length             (GcrCollection *self);

GList*              gcr_collection_get_objects            (GcrCollection *self);

gboolean            gcr_collection_contains               (GcrCollection *self,
                                                           GObject *object);

void                gcr_collection_emit_added             (GcrCollection *self,
                                                           GObject *object);

void                gcr_collection_emit_removed           (GcrCollection *self,
                                                           GObject *object);

G_END_DECLS

#endif /* __GCR_COLLECTION_H__ */
