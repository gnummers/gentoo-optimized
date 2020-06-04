/*
 * Copyright (C) 2004-2018 ZNC, see the NOTICE file for details.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ZNCCONFIG_H
#define ZNCCONFIG_H

#define BUILD_WITH_CMAKE 1

#define VERSION_MAJOR 1
#define VERSION_MINOR 7
#define VERSION_PATCH 5
#define VERSION_STR "1.7.5"
#define VERSION_EXTRA ""

/* #undef _GLIBCXX_DEBUG */
/* #undef _GLIBCXX_DEBUG_PEDANTIC */

#define HAVE_PTHREAD 1
#define HAVE_THREADED_DNS 1
#define HAVE_LIBSSL 1
/* #undef HAVE_IPV6 */
#define HAVE_ZLIB 1
#define HAVE_I18N 1
#define CSOCK_USE_POLL 1

#define HAVE_GETOPT_LONG 1
#define HAVE_LSTAT 1
#define HAVE_TCSETATTR 1
/* #undef HAVE_GETPASSPHRASE */
#define HAVE_CLOCK_GETTIME 1

#define HAVE_ICU 1
#define U_USING_ICU_NAMESPACE 1

/* #undef _LARGE_FILES */
/* #undef _LARGEFILE_SOURCE */
/* #undef _FILE_OFFSET_BITS */

#define _MODDIR_ "/usr/lib64/znc"
#define _DATADIR_ "/usr/share/znc"
#define LOCALE_DIR "/usr/share/locale"

#endif /* ZNCCONFIG_H */
