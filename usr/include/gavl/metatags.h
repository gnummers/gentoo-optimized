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

#ifndef GAVL_METATAGS_H_INCLUDED
#define GAVL_METATAGS_H_INCLUDED

/** \defgroup metatags Defined metadata keys
 *  \ingroup metadata
 *
 *  For interoperabiolity reasons, try to use these macros
 *  as metadata keys whenever possible.
 *
 *  Since 1.4.0
 *
 * @{
 */

/** \brief Title of the song/movie... */

#define GAVL_META_TITLE       "Title"

/** \brief Performing artist */

#define GAVL_META_ARTIST      "Artist"

/** \brief Artist of the Album */

#define GAVL_META_ALBUMARTIST "Albumartist"

/** \brief Author */

#define GAVL_META_AUTHOR      "Author"

/** \brief Copyright */

#define GAVL_META_COPYRIGHT   "Copyright"

/** \brief Album */

#define GAVL_META_ALBUM       "Album"

/** \brief Genre */

#define GAVL_META_GENRE       "Genre"

/** \brief Tracknumber within the album
 *
 *  Integer starting with 1
 */

#define GAVL_META_TRACKNUMBER "Tracknumber"

/** \brief Generic date
 *
 *  YYYY-MM-DD [HH:MM:SS]
 */

#define GAVL_META_DATE        "Date"

/** \brief Creation date
 *
 *  YYYY-MM-DD [HH:MM:SS]
 */

#define GAVL_META_DATE_CREATE "CreationDate"     // YYYY-MM-DD [HH:MM:SS]

/** \brief Modification date
 *
 *  YYYY-MM-DD [HH:MM:SS]
 */

#define GAVL_META_DATE_MODIFY "ModificationDate" // YYYY-MM-DD [HH:MM:SS]

/** \brief Generic year
 */

#define GAVL_META_YEAR        "Year"        // YYYY

/** \brief Language
 *
 *  Use this for subtitles or audio streams
 */

#define GAVL_META_LANGUAGE    "Language"    // ISO 639-2/B 3 letter code

/** \brief Comment
 */

#define GAVL_META_COMMENT     "Comment"

/** \brief Related URL
 */

#define GAVL_META_URL         "URL"

/** \brief Software
 *
 *  For media files, this is the multiplexer software.
 *  For single stream this is the encoder software
 */

#define GAVL_META_SOFTWARE    "Software"

/** \brief Person, who created the file
 */

#define GAVL_META_CREATOR     "Creator"

/** \brief Format
 *
 *  For media files, this is the container format.
 *  For single stream this is the name of the codec
 */
#define GAVL_META_FORMAT      "Format"

/** \brief Label
 *
 * Stream label (e.g. "Directors comments")
 */

#define GAVL_META_LABEL       "Label"

/** \brief Bitrate
 *
 *  Bitrate as integer in bits/s. Can also be a
 *  string (like VBR)
 */

#define GAVL_META_BITRATE     "Bitrate"

/** \brief Valid bits per audio sample
 */

#define GAVL_META_AUDIO_BITS  "BitsPerSample"

/** \brief Valid bits per pixel
 */

#define GAVL_META_VIDEO_BPP   "BitsPerPixel"

/** \brief Vendor of the device/software, which created the file
 */

#define GAVL_META_VENDOR      "Vendor"

/** \brief Model name of the device, which created the file
 */

#define GAVL_META_DEVICE      "Device"

/**
 * @}
 */

#endif //  GAVL_METATAGS_H_INCLUDED
