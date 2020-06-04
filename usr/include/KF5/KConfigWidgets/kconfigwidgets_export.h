
#ifndef KCONFIGWIDGETS_EXPORT_H
#define KCONFIGWIDGETS_EXPORT_H

#ifdef KCONFIGWIDGETS_STATIC_DEFINE
#  define KCONFIGWIDGETS_EXPORT
#  define KCONFIGWIDGETS_NO_EXPORT
#else
#  ifndef KCONFIGWIDGETS_EXPORT
#    ifdef KF5ConfigWidgets_EXPORTS
        /* We are building this library */
#      define KCONFIGWIDGETS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define KCONFIGWIDGETS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef KCONFIGWIDGETS_NO_EXPORT
#    define KCONFIGWIDGETS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef KCONFIGWIDGETS_DECL_DEPRECATED
#  define KCONFIGWIDGETS_DECL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef KCONFIGWIDGETS_DECL_DEPRECATED_EXPORT
#  define KCONFIGWIDGETS_DECL_DEPRECATED_EXPORT KCONFIGWIDGETS_EXPORT KCONFIGWIDGETS_DECL_DEPRECATED
#endif

#ifndef KCONFIGWIDGETS_DECL_DEPRECATED_NO_EXPORT
#  define KCONFIGWIDGETS_DECL_DEPRECATED_NO_EXPORT KCONFIGWIDGETS_NO_EXPORT KCONFIGWIDGETS_DECL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef KCONFIGWIDGETS_NO_DEPRECATED
#    define KCONFIGWIDGETS_NO_DEPRECATED
#  endif
#endif

#define KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text) __attribute__ ((__deprecated__(text)))

#define ECM_GENERATEEXPORTHEADER_VERSION_VALUE(major, minor, patch) ((major<<16)|(minor<<8)|(patch))

/* Take any defaults from group settings */
#if !defined(KCONFIGWIDGETS_NO_DEPRECATED) && !defined(KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT)
#  ifdef KF_NO_DEPRECATED
#    define KCONFIGWIDGETS_NO_DEPRECATED
#  elif defined(KF_DISABLE_DEPRECATED_BEFORE_AND_AT)
#    define KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT KF_DISABLE_DEPRECATED_BEFORE_AND_AT
#  endif
#endif
#if !defined(KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT) && defined(KF_DISABLE_DEPRECATED_BEFORE_AND_AT)
#  define KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT KF_DISABLE_DEPRECATED_BEFORE_AND_AT
#endif

#if !defined(KCONFIGWIDGETS_NO_DEPRECATED_WARNINGS) && !defined(KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE)
#  ifdef KF_NO_DEPRECATED_WARNINGS
#    define KCONFIGWIDGETS_NO_DEPRECATED_WARNINGS
#  elif defined(KF_DEPRECATED_WARNINGS_SINCE)
#    define KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE KF_DEPRECATED_WARNINGS_SINCE
#  endif
#endif
#if !defined(KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE) && defined(KF_DEPRECATED_WARNINGS_SINCE)
#  define KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE KF_DEPRECATED_WARNINGS_SINCE
#endif

#if defined(KCONFIGWIDGETS_NO_DEPRECATED)
#  undef KCONFIGWIDGETS_DEPRECATED
#  define KCONFIGWIDGETS_DEPRECATED_EXPORT KCONFIGWIDGETS_EXPORT
#  define KCONFIGWIDGETS_DEPRECATED_NO_EXPORT KCONFIGWIDGETS_NO_EXPORT
#elif defined(KCONFIGWIDGETS_NO_DEPRECATED_WARNINGS)
#  define KCONFIGWIDGETS_DEPRECATED
#  define KCONFIGWIDGETS_DEPRECATED_EXPORT KCONFIGWIDGETS_EXPORT
#  define KCONFIGWIDGETS_DEPRECATED_NO_EXPORT KCONFIGWIDGETS_NO_EXPORT
#else
#  define KCONFIGWIDGETS_DEPRECATED KCONFIGWIDGETS_DECL_DEPRECATED
#  define KCONFIGWIDGETS_DEPRECATED_EXPORT KCONFIGWIDGETS_DECL_DEPRECATED_EXPORT
#  define KCONFIGWIDGETS_DEPRECATED_NO_EXPORT KCONFIGWIDGETS_DECL_DEPRECATED_NO_EXPORT
#endif

/* No deprecated API had been removed from build */
#define KCONFIGWIDGETS_EXCLUDE_DEPRECATED_BEFORE_AND_AT 0

#define KCONFIGWIDGETS_BUILD_DEPRECATED_SINCE(major, minor) 1

#ifdef KCONFIGWIDGETS_NO_DEPRECATED
#  define KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT 0x54600
#endif
#ifdef KCONFIGWIDGETS_NO_DEPRECATED_WARNINGS
#  define KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE 0
#endif

#ifndef KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE
#  ifdef KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT
#    define KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT
#  else
#    define KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE 0x54600
#  endif
#endif

#ifndef KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT
#  define KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT 0
#endif

#ifdef KCONFIGWIDGETS_DEPRECATED
#  define KCONFIGWIDGETS_ENABLE_DEPRECATED_SINCE(major, minor) (ECM_GENERATEEXPORTHEADER_VERSION_VALUE(major, minor, 0) > KCONFIGWIDGETS_DISABLE_DEPRECATED_BEFORE_AND_AT)
#else
#  define KCONFIGWIDGETS_ENABLE_DEPRECATED_SINCE(major, minor) 0
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x40000
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_4_0(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_4_0(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x50000
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_0(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_0(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x51700
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_23(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_23(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x52000
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_32(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_32(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x52600
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_38(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_38(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x52700
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_39(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_39(text)
#endif

#if KCONFIGWIDGETS_DEPRECATED_WARNINGS_SINCE >= 0x54000
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_64(text) KCONFIGWIDGETS_DECL_DEPRECATED_TEXT(text)
#else
#  define KCONFIGWIDGETS_DEPRECATED_VERSION_5_64(text)
#endif
#define KCONFIGWIDGETS_DEPRECATED_VERSION_4(minor, text)      KCONFIGWIDGETS_DEPRECATED_VERSION_4_##minor(text)
#define KCONFIGWIDGETS_DEPRECATED_VERSION_5(minor, text)      KCONFIGWIDGETS_DEPRECATED_VERSION_5_##minor(text)
#define KCONFIGWIDGETS_DEPRECATED_VERSION(major, minor, text) KCONFIGWIDGETS_DEPRECATED_VERSION_##major(minor, "Since "#major"."#minor". " text)

#endif /* KCONFIGWIDGETS_EXPORT_H */