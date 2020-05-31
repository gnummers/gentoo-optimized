/*
 * Copyright (c) 2002-2013 Balabit
 * Copyright (c) 1998-2013 Balázs Scheidler
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

#ifndef REWRITE_SUBST_H_INCLUDED
#define REWRITE_SUBST_H_INCLUDED

#include "rewrite-expr.h"
#include "logmatcher.h"

/* LogRewriteSubst */
LogMatcherOptions *log_rewrite_subst_get_matcher_options(LogRewrite *s);

gboolean log_rewrite_subst_compile_pattern(LogRewrite *s, const gchar *regexp, GError **error);

LogRewrite *log_rewrite_subst_new(LogTemplate *replacement, GlobalConfig *cfg);

#endif
