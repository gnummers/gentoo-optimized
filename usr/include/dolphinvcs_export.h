
#ifndef DOLPHINVCS_EXPORT_H
#define DOLPHINVCS_EXPORT_H

#ifdef DOLPHINVCS_STATIC_DEFINE
#  define DOLPHINVCS_EXPORT
#  define DOLPHINVCS_NO_EXPORT
#else
#  ifndef DOLPHINVCS_EXPORT
#    ifdef dolphinvcs_EXPORTS
        /* We are building this library */
#      define DOLPHINVCS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define DOLPHINVCS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef DOLPHINVCS_NO_EXPORT
#    define DOLPHINVCS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef DOLPHINVCS_DEPRECATED
#  define DOLPHINVCS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef DOLPHINVCS_DEPRECATED_EXPORT
#  define DOLPHINVCS_DEPRECATED_EXPORT DOLPHINVCS_EXPORT DOLPHINVCS_DEPRECATED
#endif

#ifndef DOLPHINVCS_DEPRECATED_NO_EXPORT
#  define DOLPHINVCS_DEPRECATED_NO_EXPORT DOLPHINVCS_NO_EXPORT DOLPHINVCS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef DOLPHINVCS_NO_DEPRECATED
#    define DOLPHINVCS_NO_DEPRECATED
#  endif
#endif

#endif /* DOLPHINVCS_EXPORT_H */
