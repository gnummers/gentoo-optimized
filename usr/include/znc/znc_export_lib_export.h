
#ifndef ZNC_EXPORT_LIB_EXPORT_H
#define ZNC_EXPORT_LIB_EXPORT_H

#ifdef ZNC_EXPORT_LIB_STATIC_DEFINE
#  define ZNC_EXPORT_LIB_EXPORT
#  define ZNC_EXPORT_LIB_NO_EXPORT
#else
#  ifndef ZNC_EXPORT_LIB_EXPORT
#    ifdef znc_export_lib_EXPORTS
        /* We are building this library */
#      define ZNC_EXPORT_LIB_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ZNC_EXPORT_LIB_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ZNC_EXPORT_LIB_NO_EXPORT
#    define ZNC_EXPORT_LIB_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ZNC_EXPORT_LIB_DEPRECATED
#  define ZNC_EXPORT_LIB_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ZNC_EXPORT_LIB_DEPRECATED_EXPORT
#  define ZNC_EXPORT_LIB_DEPRECATED_EXPORT ZNC_EXPORT_LIB_EXPORT ZNC_EXPORT_LIB_DEPRECATED
#endif

#ifndef ZNC_EXPORT_LIB_DEPRECATED_NO_EXPORT
#  define ZNC_EXPORT_LIB_DEPRECATED_NO_EXPORT ZNC_EXPORT_LIB_NO_EXPORT ZNC_EXPORT_LIB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ZNC_EXPORT_LIB_NO_DEPRECATED
#    define ZNC_EXPORT_LIB_NO_DEPRECATED
#  endif
#endif

#endif /* ZNC_EXPORT_LIB_EXPORT_H */
