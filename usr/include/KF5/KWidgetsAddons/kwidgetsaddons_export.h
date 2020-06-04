
#ifndef KWIDGETSADDONS_EXPORT_H
#define KWIDGETSADDONS_EXPORT_H

#ifdef KWIDGETSADDONS_STATIC_DEFINE
#  define KWIDGETSADDONS_EXPORT
#  define KWIDGETSADDONS_NO_EXPORT
#else
#  ifndef KWIDGETSADDONS_EXPORT
#    ifdef KF5WidgetsAddons_EXPORTS
        /* We are building this library */
#      define KWIDGETSADDONS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KWIDGETSADDONS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KWIDGETSADDONS_NO_EXPORT
#    define KWIDGETSADDONS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KWIDGETSADDONS_DECL_DEPRECATED
#  define KWIDGETSADDONS_DECL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KWIDGETSADDONS_DECL_DEPRECATED_EXPORT
#  define KWIDGETSADDONS_DECL_DEPRECATED_EXPORT KWIDGETSADDONS_EXPORT KWIDGETSADDONS_DECL_DEPRECATED
#endif

#ifndef KWIDGETSADDONS_DECL_DEPRECATED_NO_EXPORT
#  define KWIDGETSADDONS_DECL_DEPRECATED_NO_EXPORT KWIDGETSADDONS_NO_EXPORT KWIDGETSADDONS_DECL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KWIDGETSADDONS_NO_DEPRECATED
#    define KWIDGETSADDONS_NO_DEPRECATED
#  endif
#endif

#define KWIDGETSADDONS_DECL_DEPRECATED_TEXT(text) __attribute__ ((__deprecated__(text)))

#define ECM_GENERATEEXPORTHEADER_VERSION_VALUE(major, minor, patch) ((major<<16)|(minor<<8)|(patch))

/* Take any defaults from group settings */
#if !defined(KWIDGETSADDONS_NO_DEPRECATED) && !defined(KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT)
#  ifdef KF_NO_DEPRECATED
#    define KWIDGETSADDONS_NO_DEPRECATED
#  elif defined(KF_DISABLE_DEPRECATED_BEFORE_AND_AT)
#    define KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT KF_DISABLE_DEPRECATED_BEFORE_AND_AT
#  endif
#endif
#if !defined(KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT) && defined(KF_DISABLE_DEPRECATED_BEFORE_AND_AT)
#  define KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT KF_DISABLE_DEPRECATED_BEFORE_AND_AT
#endif

#if !defined(KWIDGETSADDONS_NO_DEPRECATED_WARNINGS) && !defined(KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE)
#  ifdef KF_NO_DEPRECATED_WARNINGS
#    define KWIDGETSADDONS_NO_DEPRECATED_WARNINGS
#  elif defined(KF_DEPRECATED_WARNINGS_SINCE)
#    define KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE KF_DEPRECATED_WARNINGS_SINCE
#  endif
#endif
#if !defined(KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE) && defined(KF_DEPRECATED_WARNINGS_SINCE)
#  define KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE KF_DEPRECATED_WARNINGS_SINCE
#endif

#if defined(KWIDGETSADDONS_NO_DEPRECATED)
#  undef KWIDGETSADDONS_DEPRECATED
#  define KWIDGETSADDONS_DEPRECATED_EXPORT KWIDGETSADDONS_EXPORT
#  define KWIDGETSADDONS_DEPRECATED_NO_EXPORT KWIDGETSADDONS_NO_EXPORT
#elif defined(KWIDGETSADDONS_NO_DEPRECATED_WARNINGS)
#  define KWIDGETSADDONS_DEPRECATED
#  define KWIDGETSADDONS_DEPRECATED_EXPORT KWIDGETSADDONS_EXPORT
#  define KWIDGETSADDONS_DEPRECATED_NO_EXPORT KWIDGETSADDONS_NO_EXPORT
#else
#  define KWIDGETSADDONS_DEPRECATED KWIDGETSADDONS_DECL_DEPRECATED
#  define KWIDGETSADDONS_DEPRECATED_EXPORT KWIDGETSADDONS_DECL_DEPRECATED_EXPORT
#  define KWIDGETSADDONS_DEPRECATED_NO_EXPORT KWIDGETSADDONS_DECL_DEPRECATED_NO_EXPORT
#endif

/* No deprecated API had been removed from build */
#define KWIDGETSADDONS_EXCLUDE_DEPRECATED_BEFORE_AND_AT 0

#define KWIDGETSADDONS_BUILD_DEPRECATED_SINCE(major, minor) 1

#ifdef KWIDGETSADDONS_NO_DEPRECATED
#  define KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT 0x54600
#endif
#ifdef KWIDGETSADDONS_NO_DEPRECATED_WARNINGS
#  define KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE 0
#endif

#ifndef KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE
#  ifdef KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT
#    define KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT
#  else
#    define KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE 0x54600
#  endif
#endif

#ifndef KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT
#  define KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT 0
#endif

#ifdef KWIDGETSADDONS_DEPRECATED
#  define KWIDGETSADDONS_ENABLE_DEPRECATED_SINCE(major, minor) (ECM_GENERATEEXPORTHEADER_VERSION_VALUE(major, minor, 0) > KWIDGETSADDONS_DISABLE_DEPRECATED_BEFORE_AND_AT)
#else
#  define KWIDGETSADDONS_ENABLE_DEPRECATED_SINCE(major, minor) 0
#endif

#if KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE >= 0x50000
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_0(text) KWIDGETSADDONS_DECL_DEPRECATED_TEXT(text)
#else
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_0(text)
#endif

#if KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE >= 0x50d00
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_13(text) KWIDGETSADDONS_DECL_DEPRECATED_TEXT(text)
#else
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_13(text)
#endif

#if KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE >= 0x53f00
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_63(text) KWIDGETSADDONS_DECL_DEPRECATED_TEXT(text)
#else
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_63(text)
#endif

#if KWIDGETSADDONS_DEPRECATED_WARNINGS_SINCE >= 0x54100
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_65(text) KWIDGETSADDONS_DECL_DEPRECATED_TEXT(text)
#else
#  define KWIDGETSADDONS_DEPRECATED_VERSION_5_65(text)
#endif
#define KWIDGETSADDONS_DEPRECATED_VERSION_5(minor, text)      KWIDGETSADDONS_DEPRECATED_VERSION_5_##minor(text)
#define KWIDGETSADDONS_DEPRECATED_VERSION(major, minor, text) KWIDGETSADDONS_DEPRECATED_VERSION_##major(minor, "Since "#major"."#minor". " text)

#endif /* KWIDGETSADDONS_EXPORT_H */