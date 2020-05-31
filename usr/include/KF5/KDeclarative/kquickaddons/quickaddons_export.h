
#ifndef QUICKADDONS_EXPORT_H
#define QUICKADDONS_EXPORT_H

#ifdef QUICKADDONS_STATIC_DEFINE
#  define QUICKADDONS_EXPORT
#  define QUICKADDONS_NO_EXPORT
#else
#  ifndef QUICKADDONS_EXPORT
#    ifdef KF5QuickAddons_EXPORTS
        /* We are building this library */
#      define QUICKADDONS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define QUICKADDONS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef QUICKADDONS_NO_EXPORT
#    define QUICKADDONS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef QUICKADDONS_DEPRECATED
#  define QUICKADDONS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef QUICKADDONS_DEPRECATED_EXPORT
#  define QUICKADDONS_DEPRECATED_EXPORT QUICKADDONS_EXPORT QUICKADDONS_DEPRECATED
#endif

#ifndef QUICKADDONS_DEPRECATED_NO_EXPORT
#  define QUICKADDONS_DEPRECATED_NO_EXPORT QUICKADDONS_NO_EXPORT QUICKADDONS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef QUICKADDONS_NO_DEPRECATED
#    define QUICKADDONS_NO_DEPRECATED
#  endif
#endif

#endif /* QUICKADDONS_EXPORT_H */
