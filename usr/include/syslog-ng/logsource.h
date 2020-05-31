/*
 * Copyright (c) 2002-2011 Balabit
 * Copyright (c) 1998-2011 Balázs Scheidler
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

#ifndef LOGSOURCE_H_INCLUDED
#define LOGSOURCE_H_INCLUDED

#include "logpipe.h"
#include "stats/stats-registry.h"
#include "window-size-counter.h"
#include "dynamic-window.h"

typedef struct _LogSourceOptions
{
  gint init_window_size;
  const gchar *group_name;
  gboolean keep_timestamp;
  gboolean keep_hostname;
  gboolean chain_hostnames;
  HostResolveOptions host_resolve_options;
  gchar *program_override;
  gint program_override_len;
  gchar *host_override;
  gint host_override_len;
  LogTagId source_group_tag;
  gboolean read_old_records;
  GArray *tags;
  GList *source_queue_callbacks;
  gint stats_level;
  gint stats_source;
} LogSourceOptions;

typedef struct _LogSource LogSource;

/**
 * LogSource:
 *
 * This structure encapsulates an object which generates messages without
 * defining how those messages are accepted by peers. The most prominent
 * derived class is LogReader which is an extended RFC3164 capable syslog
 * message processor used everywhere.
 **/
struct _LogSource
{
  LogPipe super;
  LogSourceOptions *options;
  gboolean threaded;
  gboolean pos_tracked;
  gchar *name;
  gchar *stats_id;
  gchar *stats_instance;
  WindowSizeCounter window_size;
  DynamicWindow dynamic_window;
  gboolean window_initialized;
  /* full_window_size = static + dynamic */
  gsize full_window_size;
  atomic_gssize window_size_to_be_reclaimed;
  atomic_gssize pending_reclaimed;
  StatsCounterItem *stat_window_size;
  StatsCounterItem *stat_full_window;
  StatsCounterItem *last_message_seen;
  StatsCounterItem *recvd_messages;
  StatsCluster *stat_window_size_cluster;
  StatsCluster *stat_full_window_cluster;

  guint32 last_ack_count;
  guint32 ack_count;
  glong window_full_sleep_nsec;
  struct timespec last_ack_rate_time;
  AckTracker *ack_tracker;

  void (*wakeup)(LogSource *s);
  void (*schedule_dynamic_window_realloc)(LogSource *s);
};

static inline gboolean
log_source_free_to_send(LogSource *self)
{
  return !window_size_counter_suspended(&self->window_size);
}

static inline gint
log_source_get_init_window_size(LogSource *self)
{
  return self->options->init_window_size;
}

static inline void
log_source_schedule_dynamic_window_realloc(LogSource *s)
{
  if (!s || !s->schedule_dynamic_window_realloc)
    return;
  s->schedule_dynamic_window_realloc(s);
}

gboolean log_source_init(LogPipe *s);
gboolean log_source_deinit(LogPipe *s);

void log_source_post(LogSource *self, LogMessage *msg);

void log_source_set_options(LogSource *self, LogSourceOptions *options, const gchar *stats_id,
                            const gchar *stats_instance, gboolean threaded, gboolean pos_tracked, LogExprNode *expr_node);
void log_source_set_name(LogSource *self, const gchar *name);
void log_source_mangle_hostname(LogSource *self, LogMessage *msg);
void log_source_init_instance(LogSource *self, GlobalConfig *cfg);
void log_source_options_defaults(LogSourceOptions *options);
void log_source_options_init(LogSourceOptions *options, GlobalConfig *cfg, const gchar *group_name);
void log_source_options_destroy(LogSourceOptions *options);
void log_source_options_set_tags(LogSourceOptions *options, GList *tags);
void log_source_free(LogPipe *s);
void log_source_wakeup(LogSource *self);
void log_source_flow_control_adjust(LogSource *self, guint32 window_size_increment);
void log_source_flow_control_adjust_when_suspended(LogSource *self, guint32 window_size_increment);
void log_source_flow_control_suspend(LogSource *self);
void log_source_disable_bookmark_saving(LogSource *self);
void log_source_enable_dynamic_window(LogSource *self, DynamicWindowPool *window_ctr);
void log_source_dynamic_window_update_statistics(LogSource *self);
gboolean log_source_is_dynamic_window_enabled(LogSource *self);

void log_source_global_init(void);

/* protected */
void log_source_dynamic_window_realloc(LogSource *self);

#endif
