/* port/cpl_config.h.  Generated from cpl_config.h.in by configure.  */
/* port/cpl_config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Define if you want to use pthreads based multiprocessing support */
#define CPL_MULTIPROC_PTHREAD 1

/* --prefix directory for GDAL install */
#define GDAL_PREFIX "/usr"

/* Define to 1 if you have the 5 args `mremap' function. */
#define HAVE_5ARGS_MREMAP 1

/* Define to 1 if you have the <assert.h> header file. */
#define HAVE_ASSERT_H 1

/* Define to 1 if you have the `atoll' function. */
#define HAVE_ATOLL 1

/* Define to 1 if you have the <CharLS/charls.h> header file. */
/* #undef HAVE_CHARLS_CHARLS_H */

/* Define to 1 if you have the <CharLS/interface.h> header file. */
/* #undef HAVE_CHARLS_INTERFACE_H */

/* Define to 1 if you have the <CL/opencl.h> header file. */
#define HAVE_CL_OPENCL_H 1

/* Define to 1 if you have the <csf.h> header file. */
/* #undef HAVE_CSF_H */

/* define if the compiler supports basic C++11 syntax */
/* #undef HAVE_CXX11 */

/* define if the compiler supports basic C++14 syntax */
#define HAVE_CXX14 1

/* Define to 1 if you have the <dbmalloc.h> header file. */
/* #undef HAVE_DBMALLOC_H */

/* Define to 1 if you have the declaration of `strtof', and to 0 if you don't.
   */
#define HAVE_DECL_STRTOF 1

/* Define to 1 if you have the <direct.h> header file. */
/* #undef HAVE_DIRECT_H */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */
/* #undef HAVE_DOPRNT */

/* Define to 1 if you have the <ecs.h> header file. */
/* #undef HAVE_ECS_H */

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to 1 if you have the <fcntl.h> header file. */
#define HAVE_FCNTL_H 1

/* Define to 1 if you have the <float.h> header file. */
#define HAVE_FLOAT_H 1

/* Define to 1 if you have the <freexl.h> header file. */
/* #undef HAVE_FREEXL_H */

/* Define to 1 if GCC atomic builtins are available */
#define HAVE_GCC_ATOMIC_BUILTINS 1

/* Define to 1 if GCC bswap builtins are available */
#define HAVE_GCC_BSWAP 1

/* Define to 1 if the compiler supports -Wzero-as-null-pointer-constant */
#define HAVE_GCC_WARNING_ZERO_AS_NULL_POINTER_CONSTANT 1

/* Define to 1 if you have the <geotiff.h> header file. */
/* #undef HAVE_GEOTIFF_H */

/* Define to 1 if you have the `getaddrinfo' function. */
#define HAVE_GETADDRINFO 1

/* Define to 1 if you have the `getcwd' function. */
#define HAVE_GETCWD 1

/* Define to 1 if you have the `getrlimit' function. */
#define HAVE_GETRLIMIT 1

/* Define to 1 if you have the <gif_lib.h> header file. */
#define HAVE_GIF_LIB_H 1

/* Define if you have the iconv() function and it works. */
#define HAVE_ICONV 1

/* Define as 0 or 1 according to the floating point format supported by the
   machine */
#define HAVE_IEEEFP 1

/* Define to 1 if the system has the type `int16'. */
/* #undef HAVE_INT16 */

/* Define to 1 if the system has the type `int32'. */
/* #undef HAVE_INT32 */

/* Define to 1 if the system has the type `int8'. */
/* #undef HAVE_INT8 */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <jpeglib.h> header file. */
#define HAVE_JPEGLIB_H 1

/* Define to 1 if you have the `dl' library (-ldl). */
#define HAVE_LIBDL 1

/* Define to 1 if you have the `m' library (-lm). */
#define HAVE_LIBM 1

/* Define to 1 if you have the <libqhull/libqhull.h> header file. */
/* #undef HAVE_LIBQHULL_LIBQHULL_H */

/* Define to 1 if you have the `rt' library (-lrt). */
#define HAVE_LIBRT 1

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* Define to 1 if you have the <linux/userfaultfd.h> header file. */
#define HAVE_LINUX_USERFAULTFD_H 1

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1, if your compiler supports long long data type */
#define HAVE_LONG_LONG 1

/* Define to 1 if you have the `lstat' function. */
#define HAVE_LSTAT 1

/* Define to 1 if you have the <lzma.h> header file. */
#define HAVE_LZMA_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the <openssl/bio.h> header file. */
#define HAVE_OPENSSL_BIO_H 1

/* Define to 1 if you have the <pcre.h> header file. */
#define HAVE_PCRE_H 1

/* Define to 1 if you have the <png.h> header file. */
#define HAVE_PNG_H 1

/* Define to 1 if you have the `posix_memalign' function. */
#define HAVE_POSIX_MEMALIGN 1

/* Define to 1 if you have the `posix_spawnp' function. */
#define HAVE_POSIX_SPAWNP 1

/* Define to 1 if you have the <proj.h> header file. */
#define HAVE_PROJ_H 1

/* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
#define HAVE_PTHREAD_MUTEX_ADAPTIVE_NP 1

/* Define to 1 if you have the `PTHREAD_MUTEX_RECURSIVE' constant. */
#define HAVE_PTHREAD_MUTEX_RECURSIVE 1

/* Define to 1 if you have the `pthread_spinlock_t' type. */
#define HAVE_PTHREAD_SPINLOCK 1

/* Define to 1 if you have the <qhull/libqhull.h> header file. */
/* #undef HAVE_QHULL_LIBQHULL_H */

/* Define to 1 if you have the <rasterlite2/rasterlite2.h> header file. */
/* #undef HAVE_RASTERLITE2_RASTERLITE2_H */

/* Define to 1 if you have the `readlink' function. */
#define HAVE_READLINK 1

/* Define to 1 if you have the `RLIMIT_AS' constant. */
#define HAVE_RLIMIT_AS 1

/* Define to 1 if you have the _SC_PHYS_PAGES' constant. */
#define HAVE_SC_PHYS_PAGES 1

/* Define to 1 if you have the `sigaction' function. */
#define HAVE_SIGACTION 1

/* Define to 1 if you have the `snprintf' function. */
#define HAVE_SNPRINTF 1

/* Define to 1 if you have the <sqlite3.h> header file. */
/* #undef HAVE_SQLITE3_H */

/* Define to 1 if you have the <sql.h> header file. */
/* #undef HAVE_SQL_H */

/* Define to 1 if you have the `statvfs' function. */
#define HAVE_STATVFS 1

/* Define to 1 if you have the `statvfs64' function. */
#define HAVE_STATVFS64 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `std::isnan' function. */
#define HAVE_STD_IS_NAN 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strtof' function. */
#define HAVE_STRTOF 1

/* Define to 1 if you have the `strtoull' function. */
#define HAVE_STRTOULL 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if the system has the type __uint128_t */
#define HAVE_UINT128_T 1

/* Define to 1 if the system has the type `uintptr_t'. */
#define HAVE_UINTPTR_T 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the `uselocale' function. */
#define HAVE_USELOCALE 1

/* Define to 1 if you have the <values.h> header file. */
#define HAVE_VALUES_H 1

/* Define to 1 if you have the `vfork' function. */
#define HAVE_VFORK 1

/* Define to 1 if you have the `vprintf' function. */
#define HAVE_VPRINTF 1

/* Define to 1 if you have the `vsnprintf' function. */
#define HAVE_VSNPRINTF 1

/* Set the native cpu bit order (FILLORDER_LSB2MSB or FILLORDER_MSB2LSB) */
#define HOST_FILLORDER FILLORDER_LSB2MSB

/* Define as const if the declaration of iconv() needs const. */
#define ICONV_CONST 

/* For.cpp files, define as const if the declaration of iconv() needs const.
   */
#define ICONV_CPP_CONST 

/* Define to 1 if libjvm.so should be dlopen'd */
/* #undef JVM_LIB_DLOPEN */

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Define for Mac OSX Framework build */
/* #undef MACOSX_FRAMEWORK */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME ""

/* Define to the full name and version of this package. */
#define PACKAGE_STRING ""

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME ""

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION ""

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 8

/* The size of `void*', as computed by sizeof. */
#define SIZEOF_VOIDP 8

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you have fseek64, ftell64 */
#define UNIX_STDIO_64 1

/* Define to 1 if you want to use the -fvisibility GCC flag */
#define USE_GCC_VISIBILITY_FLAG 1

/* Define to name of 64bit fopen function */
#define VSI_FOPEN64 fopen64

/* Define to name of 64bit fseek func */
#define VSI_FSEEK64 fseeko64

/* Define to name of 64bit ftell func */
#define VSI_FTELL64 ftello64

/* Define to name of 64bit ftruncate function */
#define VSI_FTRUNCATE64 ftruncate64

/* Define to 1, if you have 64 bit STDIO API */
#define VSI_LARGE_API_SUPPORTED 1

/* Define to 1, if you have LARGEFILE64_SOURCE */
/* #undef VSI_NEED_LARGEFILE64_SOURCE */

/* Define to name of 64bit stat function */
#define VSI_STAT64 stat64

/* Define to name of 64bit stat structure */
#define VSI_STAT64_T stat64

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

#include "cpl_config_extras.h"
