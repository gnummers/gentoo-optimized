/*****************************************************************
 * gavl - a general purpose audio/video processing library
 *
 * Copyright (c) 2001 - 2011 Members of the Gmerlin project
 * gmerlin-general@lists.sourceforge.net
 * http://gmerlin.sourceforge.net
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * *****************************************************************/
 
#ifndef TIMECODE_H_INCLUDED
#define TIMECODE_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <gavl/gavldefs.h>

/** \defgroup timecode Timecodes
 *  \brief Timecode definitions
 *
 *  Timecodes are usually associated with video frames
 *  and represent a unique time (e.g. Wall clock time) within
 *  the whole footage.
 *
 *  Since 1.1.0
 *
 * @{
 */

typedef uint64_t gavl_timecode_t; //!< Typedef for timecodes

#define GAVL_TIMECODE_SIGN_MASK     (0x1LL<<62) //!< If 1, timecode is negative
#define GAVL_TIMECODE_INVALID_MASK  (0x1LL<<63) //!< If 1, timecode is invalid

#define GAVL_TIMECODE_DROP_FRAME (1<<0) //!< NTSC drop frame is used

#define GAVL_TIMECODE_UNDEFINED GAVL_TIMECODE_INVALID_MASK //!< Convenience macro
  
/** \brief Timecode format
 *
 *  The timecode format should always be associated with
 *  a video format. Some functions require the timecode *and* the
 *  video format.
 */
  
typedef struct
  {
  int int_framerate; //!< Integer framerate. A value of zero signals, that no timecodes are available.
  int flags;         //!< Zero or more of the flags defined above
  } gavl_timecode_format_t;

/*!
  \brief Copy one timecode format to another
  \param dst Destination format 
  \param src Source format 
 */
  
GAVL_PUBLIC
void gavl_timecode_format_copy(gavl_timecode_format_t * dst,
                               const gavl_timecode_format_t * src);

  
/** \brief Extract the time part of the timecode
 *  \param tc A timecode
 *  \param hours If non NULL, returns the hours
 *  \param minutes If non NULL, returns the minutes
 *  \param seconds If non NULL, returns the seconds
 *  \param frames If non NULL, returns the frames
 */
  
GAVL_PUBLIC
void gavl_timecode_to_hmsf(gavl_timecode_t tc,
                           int * hours,
                           int * minutes,
                           int * seconds,
                           int * frames);

/** \brief Extract the date part of the timecode
 *  \param tc A timecode
 *  \param year If non NULL, returns the year
 *  \param month If non NULL, returns the month
 *  \param day If non NULL, returns the day
 */
  
GAVL_PUBLIC
void gavl_timecode_to_ymd(gavl_timecode_t tc,
                          int * year,
                          int * month,
                          int * day);

/** \brief Set the time part of the timecode
 *  \param tc A timecode
 *  \param hours The hours
 *  \param minutes The minutes
 *  \param seconds The seconds
 *  \param frames The frames
 */
  
GAVL_PUBLIC
void gavl_timecode_from_hmsf(gavl_timecode_t * tc,
                            int hours,
                            int minutes,
                            int seconds,
                            int frames);

/** \brief Set the date part of the timecode
 *  \param tc A timecode
 *  \param year The year
 *  \param month The month
 *  \param day The day
 */
  
GAVL_PUBLIC
void gavl_timecode_from_ymd(gavl_timecode_t * tc,
                            int year,
                            int month,
                            int day);

/** \brief Get the frame count from the timecode
 *  \param tf The timecode format
 *  \param tc A timecode
 *  \returns The frame count
 *
 *  If the time is larger than 24 hours, the framecount is calculated from
 *  00:00:00, January 1, 1970
 */
  
GAVL_PUBLIC
int64_t gavl_timecode_to_framecount(const gavl_timecode_format_t * tf,
                                    gavl_timecode_t tc);

/** \brief Get a timecode from the frame count
 *  \param tf The timecode format
 *  \param fc The frame count
 *  \returns The timecode corresponding to the framecount
 *
 *  If the date fields are non-zero, the framecount is calculated from
 *  00:00:00, January 1, 1970
 */

GAVL_PUBLIC
gavl_timecode_t gavl_timecode_from_framecount(const gavl_timecode_format_t * tf,
                                              int64_t fc);

/** \brief Dump a timecode to stderr
 *  \param tf The timecode format
 *  \param tc A timecode
 *
 *  This is used mainly for debugging
 */
  
GAVL_PUBLIC
void gavl_timecode_dump(const gavl_timecode_format_t * tf,
                        gavl_timecode_t tc);
  

/* -YYYY-MM-DD-HH:MM:SS.FFFF */

#define GAVL_TIMECODE_STRING_LEN 26 /*!< Length for a string into
                                      which a timecode will be printed */

/** \brief Print a full timecode into a string
 *  \param tf The timecode format
 *  \param tc A timecode
 *  \param str String where the timecode will be printed
 *
 *  This prints the full timecode (including calendar date if available).
 *  For real-life applications, you might want to try
 *  \ref gavl_timecode_prettyprint_short instead.
 */
  
GAVL_PUBLIC
void gavl_timecode_prettyprint(const gavl_timecode_format_t * tf,
                               gavl_timecode_t tc,
                               char str[GAVL_TIMECODE_STRING_LEN]);
 
/* -HH:MM:SS:FF */

#define GAVL_TIMECODE_STRING_LEN_SHORT 13 /*!< Length for a string into
                                            which a short timecode will be printed */

/** \brief Print a short timecode into a string
 *  \param tc A timecode
 *  \param str String where the timecode will be printed
 *
 *  Since 1.1.1
 */
  
GAVL_PUBLIC
void gavl_timecode_prettyprint_short(gavl_timecode_t tc,
                                     char str[GAVL_TIMECODE_STRING_LEN_SHORT]);

  
/**
 * @}
 */

#ifdef __cplusplus
}
#endif

#endif /* TIMECODE_H_INCLUDED */

