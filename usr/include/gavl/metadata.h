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

#ifndef GAVL_METADATA_H_INCLUDED
#define GAVL_METADATA_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <gavl/gavldefs.h>

/** \defgroup metadata Metadata
 *  \brief Metadata support
 *
 *  This is a simple dictionary structure, which is
 *  used my gmerlin applications and libraries to
 *  associate metadata with a media file or a single
 *  media stream.
 *
 *  Metadata are defined as all data, which are not directly
 *  related to the decoding process, but might be of interest
 *  for the user.
 *
 *  The tag types are completely generic so applications can
 *  define their own tags. For compatibility it is, however
 *  recommended to use the tags defined in \ref metatags.h
 *
 *  Since 1.4.0
 *
 * @{
 */

/** Length of a date string of the format YYYY-MM-DD
 */
#define GAVL_METADATA_DATE_STRING_LEN 11

/** Length of a date/time string of the format YYYY-MM-DD HH:MM:SS
 */
  
#define GAVL_METADATA_DATE_TIME_STRING_LEN 20 

/** \brief Single metadata tag
 */

typedef struct
  {
  char * key; //!< Key
  char * val; //!< Value
  } gavl_metadata_tag_t;

/** \brief Single metadata structure
 */

  
typedef struct
  {
  gavl_metadata_tag_t * tags;  //!< Array of tags
  int tags_alloc;              //!< Number of allocated tags (never touch this)
  int num_tags;                //!< Number of valid tags
  } gavl_metadata_t;

/** \brief Free all metadata tags 
 *  \arg m A metadata structure
 */
  
GAVL_PUBLIC void
gavl_metadata_free(gavl_metadata_t * m);

/** \brief Initialize structre
 *  \arg m A metadata structure
 *
 *  Use this if you define a \ref gavl_metadata_t
 *  structure in unintialized memory (e.g. on the stack)
 *  before using it.
 */
  
GAVL_PUBLIC void
gavl_metadata_init(gavl_metadata_t * m);

/** \brief Set a tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg val Value
 *
 *  Set a metadata tag. The value is copied.
 */

GAVL_PUBLIC void
gavl_metadata_set(gavl_metadata_t * m,
                  const char * key,
                  const char * val);

/** \brief Set a tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg val Value
 *
 *  Like \ref gavl_metadata_set except that the
 *  value is not copied.
 */

GAVL_PUBLIC void
gavl_metadata_set_nocpy(gavl_metadata_t * m,
                        const char * key,
                        char * val);

/** \brief Get the value of a tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \returns Value of the tag or NULL if the tag doesn't exist
 */

GAVL_PUBLIC 
const char * gavl_metadata_get(const gavl_metadata_t * m,
                               const char * key);

/** \brief Set an integer tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg val Value
 */
  
GAVL_PUBLIC void
gavl_metadata_set_int(gavl_metadata_t * m,
                      const char * key,
                      int val);

/** \brief Get an integer tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg ret Returns the value
 *  \returns 1 if ret contains a valid tag, 0 if the tag doesn't exist or is not numeric
 */
  
GAVL_PUBLIC 
int gavl_metadata_get_int(const gavl_metadata_t * m,
                          const char * key, int * ret);

/** \brief Set a date tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg year Year
 *  \arg month Month
 *  \arg day Day
 */
  
GAVL_PUBLIC void
gavl_metadata_set_date(gavl_metadata_t * m,
                       const char * key,
                       int year,
                       int month,
                       int day);

/** \brief Get a date tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg year Returns year
 *  \arg month Returns month
 *  \arg day Returns day
 *  \returns 1 if a valid date was returned, 0 else
 */
  
GAVL_PUBLIC int
gavl_metadata_get_date(gavl_metadata_t * m,
                       const char * key,
                       int * year,
                       int * month,
                       int * day);

/** \brief Set a date/time tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg year Year
 *  \arg month Month
 *  \arg day Day
 *  \arg hour Hour
 *  \arg minute Minute
 *  \arg second Second
 */
  
GAVL_PUBLIC void
gavl_metadata_set_date_time(gavl_metadata_t * m,
                            const char * key,
                            int year,
                            int month,
                            int day,
                            int hour,
                            int minute,
                            int second);

/** \brief Get a date/time tag
 *  \arg m A metadata structure
 *  \arg key Key
 *  \arg year Returns year
 *  \arg month Returns month
 *  \arg day Returns day
 *  \arg hour Returns hour
 *  \arg minute Returns minute
 *  \arg second Returns second
 *  \returns 1 if a valid date/time was returned, 0 else
 */
  
GAVL_PUBLIC int
gavl_metadata_get_date_time(gavl_metadata_t * m,
                            const char * key,
                            int * year,
                            int * month,
                            int * day,
                            int * hour,
                            int * minute,
                            int * second);

/** \brief Format a date string
 *  \arg year Year
 *  \arg month Month
 *  \arg day Day
 *  \arg ret String to be formatted
 *
 *  The string needs to be at least  \ref GAVL_METADATA_DATE_STRING_LEN
 *  bytes long.
 */

GAVL_PUBLIC void
gavl_metadata_date_to_string(int year,
                             int month,
                             int day, char * ret);

/** \brief Format a date string
 *  \arg year Year
 *  \arg month Month
 *  \arg day Day
 *  \arg ret String to be formatted
 *  \arg hour Hour
 *  \arg minute Minute
 *  \arg second Second
 *
 *  The string needs to be at least
 *  \ref GAVL_METADATA_DATE_TIME_STRING_LEN bytes long.
 */

GAVL_PUBLIC void
gavl_metadata_date_time_to_string(int year,
                                  int month,
                                  int day,
                                  int hour,
                                  int minute,
                                  int second,
                                  char * ret);

/** \brief Merge two metadata structures
 *  \arg dst Destination
 *  \arg src1 First source
 *  \arg src2 Second source
 *
 *  Copy all tags from src1 and src2 to dst. If a tag
 *  is available in src1 and src2, the one from src1 is
 *  taken.
 */
  
GAVL_PUBLIC 
void gavl_metadata_merge(gavl_metadata_t * dst,
                         const gavl_metadata_t * src1,
                         const gavl_metadata_t * src2);

/** \brief Merge two metadata structures
 *  \arg dst Destination
 *  \arg src Source
 *
 *  Copy tags from src to dst, which are not
 *  already contained in dst.
 */
  
GAVL_PUBLIC
void gavl_metadata_merge2(gavl_metadata_t * dst,
                          const gavl_metadata_t * src);

/** \brief Copy metadata structure
 *  \arg dst Destination
 *  \arg src Source
 *
 *  Copy all tags from src to dst
 */
  
GAVL_PUBLIC void
gavl_metadata_copy(gavl_metadata_t * dst,
                   const gavl_metadata_t * src);

/** \brief Dump metadata structure to stderr
 *  \arg m Metadata
 *  \arg indent Spaces to append to each line
 */

GAVL_PUBLIC void
gavl_metadata_dump(const gavl_metadata_t * m, int indent);

/** \brief Check if 2 metadata structures are equal
 *  \arg m1 Metadata 1
 *  \arg m2 Metadata 2
 *  \returns 1 if the 2 metadata structures are identical, 0 else
 */

GAVL_PUBLIC int
gavl_metadata_equal(const gavl_metadata_t * m1,
                    const gavl_metadata_t * m2);

/**
 * @}
 */

#ifdef __cplusplus
}
#endif

#endif // GAVL_METADATA_H_INCLUDED
