/*
 * The MIT License (MIT)
 *
 * Copyright © 2015-2016 Franklin "Snaipe" Mathieu <http://snai.pe/>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#ifndef CRITERION_ASPRINTF_COMPAT_H_
#define CRITERION_ASPRINTF_COMPAT_H_

#ifdef __cplusplus
# include <cstdarg>
#else
# include <stdarg.h>
#endif

#include <stddef.h>

#include "common.h"

/* MinGW makes the distinction between the printf and gnu_printf archetypes,
   because they provide a C99-compliant implementation of printf when
   the __USE_MINGW_ANSI_STDIO macro is defined. Since cr_asprintf calls
   the vsnprintf function and is compiled in libcriterion, we need to make
   the choice of which printf function to use.

   Naturally, we use the C99-compliant implementation. */
#ifdef __MINGW32__
# define CRI_PRINTF_FORMAT gnu_printf
#else
# define CRI_PRINTF_FORMAT printf
#endif

CR_BEGIN_C_API

CR_FORMAT(CRI_PRINTF_FORMAT, 2, 3)
CR_API int cr_asprintf(char **strp, const char *fmt, ...);
CR_API int cr_vasprintf(char **strp, const char *fmt, va_list ap);
CR_API void cr_asprintf_free(char *buf);

CR_API int cri_fmt_bprintf(char **buf, size_t *offset, size_t *sz,
        const char *fmt, ...);
CR_API int cri_fmt_vbprintf(char **buf, size_t *offset, size_t *sz,
        const char *fmt, va_list ap);

CR_API char *cri_strtok_r(char *str, const char *delim, char **saveptr);

CR_END_C_API

#endif /* !CRITERION_ASPRINTF_COMPAT_H_ */
