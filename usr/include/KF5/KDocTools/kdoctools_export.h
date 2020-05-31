
#ifndef KDOCTOOLS_EXPORT_H
#define KDOCTOOLS_EXPORT_H

#ifdef KDOCTOOLS_STATIC_DEFINE
#  define KDOCTOOLS_EXPORT
#  define KDOCTOOLS_NO_EXPORT
#else
#  ifndef KDOCTOOLS_EXPORT
#    ifdef KF5DocTools_EXPORTS
        /* We are building this library */
#      define KDOCTOOLS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KDOCTOOLS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KDOCTOOLS_NO_EXPORT
#    define KDOCTOOLS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KDOCTOOLS_DEPRECATED
#  define KDOCTOOLS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KDOCTOOLS_DEPRECATED_EXPORT
#  define KDOCTOOLS_DEPRECATED_EXPORT KDOCTOOLS_EXPORT KDOCTOOLS_DEPRECATED
#endif

#ifndef KDOCTOOLS_DEPRECATED_NO_EXPORT
#  define KDOCTOOLS_DEPRECATED_NO_EXPORT KDOCTOOLS_NO_EXPORT KDOCTOOLS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KDOCTOOLS_NO_DEPRECATED
#    define KDOCTOOLS_NO_DEPRECATED
#  endif
#endif

#endif /* KDOCTOOLS_EXPORT_H */
