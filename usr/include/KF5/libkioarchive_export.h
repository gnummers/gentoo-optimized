
#ifndef LIBKIOARCHIVE_EXPORT_H
#define LIBKIOARCHIVE_EXPORT_H

#ifdef LIBKIOARCHIVE_STATIC_DEFINE
#  define LIBKIOARCHIVE_EXPORT
#  define LIBKIOARCHIVE_NO_EXPORT
#else
#  ifndef LIBKIOARCHIVE_EXPORT
#    ifdef kioarchive_EXPORTS
        /* We are building this library */
#      define LIBKIOARCHIVE_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define LIBKIOARCHIVE_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef LIBKIOARCHIVE_NO_EXPORT
#    define LIBKIOARCHIVE_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef LIBKIOARCHIVE_DEPRECATED
#  define LIBKIOARCHIVE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef LIBKIOARCHIVE_DEPRECATED_EXPORT
#  define LIBKIOARCHIVE_DEPRECATED_EXPORT LIBKIOARCHIVE_EXPORT LIBKIOARCHIVE_DEPRECATED
#endif

#ifndef LIBKIOARCHIVE_DEPRECATED_NO_EXPORT
#  define LIBKIOARCHIVE_DEPRECATED_NO_EXPORT LIBKIOARCHIVE_NO_EXPORT LIBKIOARCHIVE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef LIBKIOARCHIVE_NO_DEPRECATED
#    define LIBKIOARCHIVE_NO_DEPRECATED
#  endif
#endif

#endif /* LIBKIOARCHIVE_EXPORT_H */
