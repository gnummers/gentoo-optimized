
#ifndef KPTY_EXPORT_H
#define KPTY_EXPORT_H

#ifdef KPTY_STATIC_DEFINE
#  define KPTY_EXPORT
#  define KPTY_NO_EXPORT
#else
#  ifndef KPTY_EXPORT
#    ifdef KF5Pty_EXPORTS
        /* We are building this library */
#      define KPTY_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KPTY_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KPTY_NO_EXPORT
#    define KPTY_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KPTY_DEPRECATED
#  define KPTY_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KPTY_DEPRECATED_EXPORT
#  define KPTY_DEPRECATED_EXPORT KPTY_EXPORT KPTY_DEPRECATED
#endif

#ifndef KPTY_DEPRECATED_NO_EXPORT
#  define KPTY_DEPRECATED_NO_EXPORT KPTY_NO_EXPORT KPTY_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KPTY_NO_DEPRECATED
#    define KPTY_NO_DEPRECATED
#  endif
#endif

#endif /* KPTY_EXPORT_H */
