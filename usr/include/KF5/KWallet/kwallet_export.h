
#ifndef KWALLET_EXPORT_H
#define KWALLET_EXPORT_H

#ifdef KWALLET_STATIC_DEFINE
#  define KWALLET_EXPORT
#  define KWALLET_NO_EXPORT
#else
#  ifndef KWALLET_EXPORT
#    ifdef KF5Wallet_EXPORTS
        /* We are building this library */
#      define KWALLET_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KWALLET_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KWALLET_NO_EXPORT
#    define KWALLET_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KWALLET_DEPRECATED
#  define KWALLET_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KWALLET_DEPRECATED_EXPORT
#  define KWALLET_DEPRECATED_EXPORT KWALLET_EXPORT KWALLET_DEPRECATED
#endif

#ifndef KWALLET_DEPRECATED_NO_EXPORT
#  define KWALLET_DEPRECATED_NO_EXPORT KWALLET_NO_EXPORT KWALLET_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KWALLET_NO_DEPRECATED
#    define KWALLET_NO_DEPRECATED
#  endif
#endif

#endif /* KWALLET_EXPORT_H */
