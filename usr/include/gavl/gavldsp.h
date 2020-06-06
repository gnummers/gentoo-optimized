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

#ifndef GAVLDSP_H_INCLUDED
#define GAVLDSP_H_INCLUDED

#include <gavl/gavldefs.h>

/** \defgroup dsp DSP Context
 *  \brief DSP Context
 *
 *  In addition to the higher level gavl converters,
 *  gavl provides some low-level dsp routines.
 *  They can be used for writing filters or codecs.
 *  The DSP context is initialized with a quality parameter
 *  (see \ref quality), which selects among various versions
 *  of a function.
 *
 *  @{
 */

/** \brief Opaque DSP context
 *
 *  You don't want to know, what's inside here.
 */

typedef struct gavl_dsp_context_s gavl_dsp_context_t;

/** \brief Function table
 *
 *  This structure contains pointers to the available DSP
 *  functions.
 */

typedef struct
  {
  /** \brief Get the sum of absolute differences (RGB/BGR15)
   *  \param src_1 Plane 1
   *  \param src_2 Plane 2
   *  \param stride_1 Byte distance between scanlines for src_1
   *  \param stride_2 Byte distance between scanlines for src_2
   *  \param w Width
   *  \param h Height
   *  \returns The sum of absolute differences
   *
   *  The RGB values will be scaled to 8 bit before the
   *  differences are calculated.
   */
  
  int (*sad_rgb15)(const uint8_t * src_1, const uint8_t * src_2, 
                   int stride_1, int stride_2, 
                   int w, int h);

  /** \brief Get the sum of absolute differences (RGB/BGR16)
   *  \param src_1 Plane 1
   *  \param src_2 Plane 2
   *  \param stride_1 Byte distance between scanlines for src_1
   *  \param stride_2 Byte distance between scanlines for src_2
   *  \param w Width
   *  \param h Height
   *  \returns The sum of absolute differences
   *
   *  The RGB values will be scaled to 8 bit before the
   *  differences are calculated.
   */

  int (*sad_rgb16)(const uint8_t * src_1, const uint8_t * src_2, 
                   int stride_1, int stride_2, 
                   int w, int h);

  /** \brief Get the sum of absolute differences (8 bit)
   *  \param src_1 Plane 1
   *  \param src_2 Plane 2
   *  \param stride_1 Byte distance between scanlines for src_1
   *  \param stride_2 Byte distance between scanlines for src_2
   *  \param w Width
   *  \param h Height
   *  \returns The sum of absolute differences
   */

  int (*sad_8)(const uint8_t * src_1, const uint8_t * src_2, 
               int stride_1, int stride_2, 
               int w, int h);

  /** \brief Get the sum of absolute differences (16 bit)
   *  \param src_1 Plane 1
   *  \param src_2 Plane 2
   *  \param stride_1 Byte distance between scanlines for src_1
   *  \param stride_2 Byte distance between scanlines for src_2
   *  \param w Width
   *  \param h Height
   *  \returns The sum of absolute differences
   */

  int (*sad_16)(const uint8_t * src_1, const uint8_t * src_2, 
               int stride_1, int stride_2, 
               int w, int h);

  /** \brief Get the sum of absolute differences (float)
   *  \param src_1 Plane 1
   *  \param src_2 Plane 2
   *  \param stride_1 Byte distance between scanlines for src_1
   *  \param stride_2 Byte distance between scanlines for src_2
   *  \param w Width
   *  \param h Height
   *  \returns The sum of absolute differences
   */
  float (*sad_f)(const uint8_t * src_1, const uint8_t * src_2, 
                 int stride_1, int stride_2, 
                 int w, int h);

  /** \brief Average 2 scanlines (RGB/BGR15)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of pixels
   */
  
  void (*average_rgb15)(const uint8_t * src_1, const uint8_t * src_2, 
                        uint8_t * dst, int num);

  /** \brief Average 2 scanlines (RGB/BGR16)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of pixels
   */
  void (*average_rgb16)(const uint8_t * src_1, const uint8_t * src_2, 
                        uint8_t * dst, int num);

  /** \brief Average 2 scanlines (8 bit)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of bytes
   */
  void (*average_8)(const uint8_t * src_1, const uint8_t * src_2, 
                    uint8_t * dst, int num);

  /** \brief Average 2 scanlines (16 bit)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of shorts
   */
  void (*average_16)(const uint8_t * src_1, const uint8_t * src_2, 
                     uint8_t * dst, int num);

  /** \brief Average 2 scanlines (float)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of floats
   */
  
  void (*average_f)(const uint8_t * src_1, const uint8_t * src_2, 
                    uint8_t * dst, int num);


  /** \brief Interpolate 2 scanlines (RGB/BGR15)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of pixels
   *  \param fac Factor for src_1 (0.0 .. 1.0)
   *
   *  Sets the destination to src_1 * fac + src_2 * (1.0-fac)
   */
  
  void (*interpolate_rgb15)(const uint8_t * src_1, const uint8_t * src_2, 
                            uint8_t * dst, int num, float);

  /** \brief Interpolate 2 scanlines (RGB/BGR16)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of pixels
   *  \param fac Factor for src_1 (0.0 .. 1.0)
   *
   *  Sets the destination to src_1 * fac + src_2 * (1.0-fac)
   */
  void (*interpolate_rgb16)(const uint8_t * src_1, const uint8_t * src_2, 
                            uint8_t * dst, int num, float fac);

  /** \brief Interpolate 2 scanlines (8 bit)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of bytes
   *  \param fac Factor for src_1 (0.0 .. 1.0)
   *
   *  Sets the destination to src_1 * fac + src_2 * (1.0-fac)
   */
  void (*interpolate_8)(const uint8_t * src_1, const uint8_t * src_2, 
                        uint8_t * dst, int num, float fac);

  /** \brief Interpolate 2 scanlines (16 bit)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of shorts
   *  \param fac Factor for src_1 (0.0 .. 1.0)
   *
   *  Sets the destination to src_1 * fac + src_2 * (1.0-fac)
   */
  void (*interpolate_16)(const uint8_t * src_1, const uint8_t * src_2, 
                         uint8_t * dst, int num, float fac);

  /** \brief Interpolate 2 scanlines (float)
   *  \param src_1 Scanline 1
   *  \param src_2 Scanline 2
   *  \param dst Destination
   *  \param num Number of floats
   *  \param fac Factor for src_1 (0.0 .. 1.0)
   *
   *  Sets the destination to src_1 * fac + src_2 * (1.0-fac)
   */
  
  void (*interpolate_f)(const uint8_t * src_1, const uint8_t * src_2, 
                        uint8_t * dst, int num, float fac);

  /** \brief Do 16 bit endian swapping
   * \param ptr Pointer to the data
   * \param len Len in 16 bit words
   */
  void (*bswap_16)(void * ptr, int len);

  /** \brief Do 32 byte endian swapping
   * \param ptr Pointer to the data
   * \param len Len in 32 bit doublewords
   */
  void (*bswap_32)(void * ptr, int len);

  /** \brief Do 64 byte endian swapping
   * \param ptr Pointer to the data
   * \param len Len in 64 bit quadwords
   */
  void (*bswap_64)(void * ptr, int len);
  
  /** \brief Add 2 uint8_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  
  void (*add_u8)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 uint8_t vectors (for audio stored as unsigned)
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_u8_s)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 int8_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_s8)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 uint16_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_u16)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 uint16_t vectors (for audio stored as unsigned)
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_u16_s)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 int16_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_s16)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Add 2 int32_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_s32)(const void * src1, const void * src2, void * dst, int num);
  
  /** \brief Add 2 float vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_float)(const void * src1, const void * src2, void * dst, int num);
  
  /** \brief Add 2 float vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*add_double)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 uint8_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  
  void (*sub_u8)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 uint8_t vectors (for audio stored as unsigned)
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_u8_s)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 int8_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_s8)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 uint16_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_u16)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 uint16_t vectors (for audio stored as unsigned)
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_u16_s)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 int16_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_s16)(const void * src1, const void * src2, void * dst, int num);

  /** \brief Subtract 2 int32_t vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_s32)(const void * src1, const void * src2, void * dst, int num);
  
  /** \brief Subtract 2 float vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_float)(const void * src1, const void * src2, void * dst, int num);
  
  /** \brief Subtract 2 float vectors
   *  \param src1 Source 1
   *  \param src2 Source 2
   *  \param dst  Destination
   *  \param num  Number of entries
   *
   *  src1 and/or src2 can be identical to dst
   */
  void (*sub_double)(const void * src1, const void * src2, void * dst, int num);

  
  } gavl_dsp_funcs_t;

/** \brief Create a DSP context
 *  \returns A newly allocated DSP context
 *
 *  This initialized a DSP context with all functions
 *  chosen according to the default quality value.
 */

GAVL_PUBLIC
gavl_dsp_context_t * gavl_dsp_context_create();

/** \brief Set the quality for a DSP context
 *  \param ctx A DSP context
 *  \param q A quality level
 *
 *  See \ref quality.
 */

GAVL_PUBLIC
void gavl_dsp_context_set_quality(gavl_dsp_context_t * ctx,
                                  int q);

/** \brief Set the acceleration flags for a DSP context
 *  \param ctx A DSP context
 *  \param flags Flags
 *
 *  By default the flags are detected automatically and
 *  functions are chosen based on the quality
 */

GAVL_PUBLIC
void gavl_dsp_context_set_accel_flags(gavl_dsp_context_t * ctx,
                                      int flags);


/** \brief Get the functions
 *  \param ctx A DSP context
 *  \returns The function table
 *
 *  The address of the table itself won't change by a call
 *  to \ref gavl_dsp_context_set_quality, but the contained
 *  functions will.
 */

GAVL_PUBLIC gavl_dsp_funcs_t * 
gavl_dsp_context_get_funcs(gavl_dsp_context_t * ctx);

/** \brief Destroy a DSP context
 *  \param ctx A DSP context
 */

GAVL_PUBLIC
void gavl_dsp_context_destroy(gavl_dsp_context_t * ctx);

/** @}
 */

/** \defgroup dsputils DSP Utilities
 *  \ingroup dsp
 *  \brief DSP Utilities
 *
 *  These are some utility functions, which use a DSP context but
 *  operate on higher level structures like video frames.
 *  As usual, these are supported for any format.
 *
 *  @{
 */

/** \brief Do a linear interpolation of a video frame
 *  \param ctx A DSP context
 *  \param format Video format
 *  \param src_1 Frame 1
 *  \param src_2 Frame 2
 *  \param dst  Destination frame
 *  \param factor Interpolation factor
 *  \returns 1 on success, 0 if an error occurred
 *
 *  If factor is 1.0, dst will be equal to src1,
 *  if factor is 0.0, dst will be equal to src2.
 *
 *  If the quality is at least GAVL_QUALITY_MIN, this function
 *  never fails.
 */

GAVL_PUBLIC
int gavl_dsp_interpolate_video_frame(gavl_dsp_context_t * ctx,
                                      gavl_video_format_t * format,
                                      gavl_video_frame_t * src_1,
                                      gavl_video_frame_t * src_2,
                                      gavl_video_frame_t * dst,
                                      float factor);

/*!
  \brief Swap endianess an audio frame.
  \param ctx An initialized dsp context
  \param frame An audio frame
  \param format The format of the frame
  \returns 1 on success, 0 if an error occurred

  If the quality is at least GAVL_QUALITY_MIN, this function
  never fails.

*/

GAVL_PUBLIC
int gavl_dsp_audio_frame_swap_endian(gavl_dsp_context_t * ctx,
                                      gavl_audio_frame_t * frame,
                                      const gavl_audio_format_t * format);

/*!
  \brief Swap endianess a video frame.
  \param ctx An initialized dsp context
  \param frame A video frame
  \param format The format of the frame
  \returns 1 on success, 0 if an error occurred

  This function swaps endianess for pixelformats, which
  have multibyte numbers as components.
  For 32 bit long formats with 8 bit components, it swaps the
  pixels as if they were 32 bit integers.
  For all other formats, it does nothing.

  If the quality is at least GAVL_QUALITY_MIN, this function
  never fails.

*/

GAVL_PUBLIC
int gavl_dsp_video_frame_swap_endian(gavl_dsp_context_t * ctx,
                                      gavl_video_frame_t * frame,
                                      const gavl_video_format_t * format);

/**
 * @}
 */

#endif // GAVLDSP_H_INCLUDED
