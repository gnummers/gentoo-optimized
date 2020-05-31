
#ifndef DOLPHIN_EXPORT_H
#define DOLPHIN_EXPORT_H

#ifdef DOLPHIN_STATIC_DEFINE
#  define DOLPHIN_EXPORT
#  define DOLPHIN_NO_EXPORT
#else
#  ifndef DOLPHIN_EXPORT
#    ifdef dolphinprivate_EXPORTS
        /* We are building this library */
#      define DOLPHIN_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define DOLPHIN_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef DOLPHIN_NO_EXPORT
#    define DOLPHIN_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef DOLPHIN_DEPRECATED
#  define DOLPHIN_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef DOLPHIN_DEPRECATED_EXPORT
#  define DOLPHIN_DEPRECATED_EXPORT DOLPHIN_EXPORT DOLPHIN_DEPRECATED
#endif

#ifndef DOLPHIN_DEPRECATED_NO_EXPORT
#  define DOLPHIN_DEPRECATED_NO_EXPORT DOLPHIN_NO_EXPORT DOLPHIN_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef DOLPHIN_NO_DEPRECATED
#    define DOLPHIN_NO_DEPRECATED
#  endif
#endif

#endif /* DOLPHIN_EXPORT_H */
