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
 
#ifndef GAVLTIME_H_INCLUDED
#define GAVLTIME_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <inttypes.h>
#include <gavl/gavldefs.h>

/*! \defgroup time Time
 */

/*! \ingroup time
 */

#define GAVL_TIME_SCALE     1000000 /*!< Generic time scale: Microsecond tics */

/*! \ingroup time
 */

#define GAVL_TIME_UNDEFINED 0x8000000000000000LL /*!< Unknown or undefined time */
/*! \ingroup time
 */
#define GAVL_TIME_MAX       0x7fffffffffffffffLL /*!< Maximum possible value */

/*! \ingroup time
 * \brief Times in gavl are 64 bit signed integers
 * 
 */

typedef int64_t gavl_time_t;

/* Utility functions */

/*! \ingroup time
 * \brief Convert a number of samples to a time for a given samplerate
 */

GAVL_PUBLIC
gavl_time_t gavl_samples_to_time(int samplerate, int64_t samples);

/*! \ingroup time
 * \brief Convert a time to a number of audio samples for a given samplerate
 * \param samplerate Samplerate
 * \param time Time
 * \returns Number of audio samples
 */

GAVL_PUBLIC
int64_t gavl_time_to_samples(int samplerate, gavl_time_t time);

/*! \ingroup time
 * \brief Convert a number of video frames to a time for a given framerate
 */

GAVL_PUBLIC
gavl_time_t gavl_frames_to_time(int rate_num, int rate_den, int64_t frames);


/*! \ingroup time
 * \brief Convert a time to a number of video frames for a given framerate
 * \param rate_num Numerator of the framerate
 * \param rate_den Denominator of the framerate
 * \param time Time
 * \returns Number of frames
 */

GAVL_PUBLIC
int64_t gavl_time_to_frames(int rate_num, int rate_den, gavl_time_t time); 

/*! \ingroup time
 * \brief Convert a gavl time to a time scaled by another base 
 * \param scale Time scale
 * \param time Time scaled by \ref GAVL_TIME_SCALE
 * \returns Time scaled by scale
 */

GAVL_PUBLIC
int64_t gavl_time_scale(int scale, gavl_time_t time);

/*! \ingroup time
 * \brief Convert a time scaled by another base to a gavl time
 * \param scale Time scale
 * \param time Time scaled by scale
 * \returns Time scaled by \ref GAVL_TIME_SCALE
 */

GAVL_PUBLIC
gavl_time_t gavl_time_unscale(int scale, int64_t time);

/*! \ingroup time
 * \brief Convert a time scaled by one base to a time scaled by another base
 * \param scale1 Initial time base
 * \param scale2 New time base
 * \param time Time scaled by scale1
 * \returns Time scaled by scale2
 */

GAVL_PUBLIC
int64_t gavl_time_rescale(int scale1, int scale2, int64_t time);

/*! \ingroup time
 * \brief Convert seconds (as double) to a gavl time
 * \param s Seconds as double
 * \returns Integer time scaled by \ref GAVL_TIME_SCALE
 */

#define gavl_seconds_to_time(s) (gavl_time_t)((s)*(double)(GAVL_TIME_SCALE))

/*! \ingroup time
 * \brief Convert a gavl time to seconds (as double)
 * \param t Integer time scaled by \ref GAVL_TIME_SCALE
 * \returns Seconds as double
 */

#define gavl_time_to_seconds(t) ((double)(t)/(double)(GAVL_TIME_SCALE))

/*! \ingroup time
 * \brief Sleep for a specified time
 * \param time Time after which execution of the current thread is resumed
 */

GAVL_PUBLIC
void gavl_time_delay(gavl_time_t * time);

/*! \ingroup time
 * \brief Length of the string passed to \ref gavl_time_prettyprint
 */

#define GAVL_TIME_STRING_LEN 11

/*! \ingroup time
 * \brief Convert a time to a string
 * \param time Time to print
 * \param str String
 *
 * This prints a gavl_time into ASCII string if a format suitable for player displays.
 * The format is: -hhh:mm:ss
 */

GAVL_PUBLIC void
gavl_time_prettyprint(gavl_time_t time, char str[GAVL_TIME_STRING_LEN]);

/*! \ingroup time
 * \brief Length of the string passed to \ref gavl_time_prettyprint_ms
 */

#define GAVL_TIME_STRING_LEN_MS 15

/*! \ingroup time
 * \brief Convert a time to a string with millisecond precision
 * \param time Time to print
 * \param str String
 *
 * This prints a gavl_time into ASCII string if a format suitable for player displays.
 * The format is: -hhh:mm:ss.MMM
 *
 * Since 1.1.1
 */

GAVL_PUBLIC void
gavl_time_prettyprint_ms(gavl_time_t time, char str[GAVL_TIME_STRING_LEN_MS]);
  

/* Scan time: format is hhh:mm:ss with hh: hours, mm: minutes, ss: seconds. Seconds can be a fractional
   value (i.e. with decimal point) */

GAVL_PUBLIC
int gavl_time_parse(const char * str, gavl_time_t * ret);


/* Simple software timer */

/*! \defgroup timer Software timer
 * \ingroup time
 *
 *  This is a simple software timer, which can be used for synchronization
 *  purposes for cases wherer there is no synchronization with hardware devices
 *  available.
 */

/*! \ingroup timer
 * \brief Opaque timer structure
 *
 * You don't want to know what's inside.
 */

typedef struct gavl_timer_s gavl_timer_t;

/*! \ingroup timer
 * \brief Create a timer
 * \returns A newly allocated timer
 */

GAVL_PUBLIC
gavl_timer_t * gavl_timer_create();

/*! \ingroup timer
 * \brief Destroy a timer
 * \param timer A timer
 *
 * Destroys a timer and frees all associated memory
 */

GAVL_PUBLIC
void gavl_timer_destroy(gavl_timer_t * timer);

/*! \ingroup timer
 * \brief Start a timer
 * \param timer A timer
 */

GAVL_PUBLIC
void gavl_timer_start(gavl_timer_t * timer);

/*! \ingroup timer
 * \brief Stop a timer
 * \param timer A timer
 */

GAVL_PUBLIC
void gavl_timer_stop(gavl_timer_t * timer);

/*! \ingroup timer
 * \brief Get the current time of the timer
 * \param timer A timer
 * \returns Current time
 */

GAVL_PUBLIC
gavl_time_t gavl_timer_get(gavl_timer_t * timer);

/*! \ingroup timer
 * \brief Set the current time of the timer
 * \param timer A timer
 * \param t New time
 */

GAVL_PUBLIC
void gavl_timer_set(gavl_timer_t * timer, gavl_time_t t);

/*! \ingroup timer
 * \brief Get the current time for benchmarking
 * \param flags Flags returned by \ref gavl_accel_supported
 * \returns The time in arbitrary units
 *
 * The returned value itself is meaningless since the
 * timescale depends on the system. Use this only for relative comparisons
 * for benchmarks. A textual description on how the values can be
 * interpreted can be ontained with \ref gavl_benchmark_get_desc
 */

GAVL_PUBLIC
uint64_t gavl_benchmark_get_time(int flags);

/*! \ingroup timer
 * \brief Get a description about the value returned by
 *        \ref gavl_benchmark_get_time
 * \param flags Flags returned by \ref gavl_accel_supported
 * \returns A string describing what the time value means
 *
 */

GAVL_PUBLIC
const char * gavl_benchmark_get_desc(int flags);
  
  
#ifdef __cplusplus
}
#endif

#endif /* GAVLTIME_H_INCLUDED */

