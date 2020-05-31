
#ifndef KIRIGAMI2_EXPORT_H
#define KIRIGAMI2_EXPORT_H

#ifdef KIRIGAMI2_STATIC_DEFINE
#  define KIRIGAMI2_EXPORT
#  define KIRIGAMI2_NO_EXPORT
#else
#  ifndef KIRIGAMI2_EXPORT
#    ifdef KF5Kirigami2_EXPORTS
        /* We are building this library */
#      define KIRIGAMI2_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KIRIGAMI2_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KIRIGAMI2_NO_EXPORT
#    define KIRIGAMI2_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KIRIGAMI2_DEPRECATED
#  define KIRIGAMI2_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KIRIGAMI2_DEPRECATED_EXPORT
#  define KIRIGAMI2_DEPRECATED_EXPORT KIRIGAMI2_EXPORT KIRIGAMI2_DEPRECATED
#endif

#ifndef KIRIGAMI2_DEPRECATED_NO_EXPORT
#  define KIRIGAMI2_DEPRECATED_NO_EXPORT KIRIGAMI2_NO_EXPORT KIRIGAMI2_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KIRIGAMI2_NO_DEPRECATED
#    define KIRIGAMI2_NO_DEPRECATED
#  endif
#endif

#endif /* KIRIGAMI2_EXPORT_H */
