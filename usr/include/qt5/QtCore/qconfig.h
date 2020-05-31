#include <Gentoo/gentoo-qconfig.h>

#define QT_FEATURE_shared 1
#define QT_FEATURE_cross_compile -1
#define QT_FEATURE_framework -1
#define QT_FEATURE_rpath -1
#define QT_COMPILER_SUPPORTS_SSE2 1
#define QT_COMPILER_SUPPORTS_AES 1
#define QT_FEATURE_appstore_compliant -1
#define QT_COMPILER_SUPPORTS_SSE3 1
#define QT_COMPILER_SUPPORTS_SSSE3 1
#define QT_COMPILER_SUPPORTS_SSE4_1 1
#define QT_COMPILER_SUPPORTS_SSE4_2 1
#define QT_COMPILER_SUPPORTS_AVX 1
#define QT_COMPILER_SUPPORTS_AVX2 1
#define QT_COMPILER_SUPPORTS_AVX512F 1
#define QT_COMPILER_SUPPORTS_AVX512BW 1
#define QT_COMPILER_SUPPORTS_AVX512CD 1
#define QT_COMPILER_SUPPORTS_AVX512DQ 1
#define QT_COMPILER_SUPPORTS_AVX512ER 1
#define QT_COMPILER_SUPPORTS_AVX512IFMA 1
#define QT_COMPILER_SUPPORTS_AVX512PF 1
#define QT_COMPILER_SUPPORTS_AVX512VBMI 1
#define QT_COMPILER_SUPPORTS_AVX512VL 1
#define QT_FEATURE_debug_and_release -1
#define QT_FEATURE_simulator_and_device -1
#define QT_FEATURE_build_all -1
#define QT_FEATURE_c__11 1
#define QT_FEATURE_c__14 1
#define QT_FEATURE_c__17 1
#define QT_FEATURE_c__1z 1
#define QT_FEATURE_c__2a -1
#define QT_FEATURE_c99 1
#define QT_FEATURE_c11 1
#define QT_FEATURE_thread 1
#define QT_FEATURE_future 1
#define QT_FEATURE_concurrent 1
#define QT_NO_DBUS 
#define QT_FEATURE_pkg_config 1
#define QT_COMPILER_SUPPORTS_F16C 1
#define QT_FEATURE_force_asserts -1
#define QT_LARGEFILE_SUPPORT 64
#define QT_COMPILER_SUPPORTS_RDRND 1
#define QT_COMPILER_SUPPORTS_RDSEED 1
#define QT_VISIBILITY_AVAILABLE true
#define QT_REDUCE_RELOCATIONS true
#define QT_FEATURE_separate_debug_info -1
#define QT_COMPILER_SUPPORTS_SHA 1
#define QT_FEATURE_signaling_nan 1
#define QT_FEATURE_static -1
#define QT_NO_WIDGETS true
#define QT_COMPILER_SUPPORTS_SIMD_ALWAYS 1
#define QT_VERSION_STR "5.15.0"
#define QT_VERSION_MAJOR 5
#define QT_VERSION_MINOR 15
#define QT_VERSION_PATCH 0

#if defined(QT_NO_DBUS) && defined(QT_DBUS)
# undef QT_NO_DBUS
#elif !defined(QT_NO_DBUS) && !defined(QT_DBUS)
# define QT_NO_DBUS
#endif

#if defined(QT_NO_FREETYPE) && defined(QT_FREETYPE)
# undef QT_NO_FREETYPE
#elif !defined(QT_NO_FREETYPE) && !defined(QT_FREETYPE)
# define QT_NO_FREETYPE
#endif

#if defined(QT_NO_IMAGEFORMAT_JPEG) && defined(QT_IMAGEFORMAT_JPEG)
# undef QT_NO_IMAGEFORMAT_JPEG
#elif !defined(QT_NO_IMAGEFORMAT_JPEG) && !defined(QT_IMAGEFORMAT_JPEG)
# define QT_NO_IMAGEFORMAT_JPEG
#endif

#if defined(QT_NO_IMAGEFORMAT_PNG) && defined(QT_IMAGEFORMAT_PNG)
# undef QT_NO_IMAGEFORMAT_PNG
#elif !defined(QT_NO_IMAGEFORMAT_PNG) && !defined(QT_IMAGEFORMAT_PNG)
# define QT_NO_IMAGEFORMAT_PNG
#endif

#if defined(QT_NO_OPENGL) && defined(QT_OPENGL)
# undef QT_NO_OPENGL
#elif !defined(QT_NO_OPENGL) && !defined(QT_OPENGL)
# define QT_NO_OPENGL
#endif

#if defined(QT_NO_OPENSSL) && defined(QT_OPENSSL)
# undef QT_NO_OPENSSL
#elif !defined(QT_NO_OPENSSL) && !defined(QT_OPENSSL)
# define QT_NO_OPENSSL
#endif

#if defined(QT_NO_SSL) && defined(QT_SSL)
# undef QT_NO_SSL
#elif !defined(QT_NO_SSL) && !defined(QT_SSL)
# define QT_NO_SSL
#endif

#if defined(QT_NO_WIDGETS) && defined(QT_WIDGETS)
# undef QT_NO_WIDGETS
#elif !defined(QT_NO_WIDGETS) && !defined(QT_WIDGETS)
# define QT_NO_WIDGETS
#endif
