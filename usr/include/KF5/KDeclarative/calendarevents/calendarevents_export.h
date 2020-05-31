
#ifndef CALENDAREVENTS_EXPORT_H
#define CALENDAREVENTS_EXPORT_H

#ifdef CALENDAREVENTS_STATIC_DEFINE
#  define CALENDAREVENTS_EXPORT
#  define CALENDAREVENTS_NO_EXPORT
#else
#  ifndef CALENDAREVENTS_EXPORT
#    ifdef KF5CalendarEvents_EXPORTS
        /* We are building this library */
#      define CALENDAREVENTS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define CALENDAREVENTS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef CALENDAREVENTS_NO_EXPORT
#    define CALENDAREVENTS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef CALENDAREVENTS_DEPRECATED
#  define CALENDAREVENTS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef CALENDAREVENTS_DEPRECATED_EXPORT
#  define CALENDAREVENTS_DEPRECATED_EXPORT CALENDAREVENTS_EXPORT CALENDAREVENTS_DEPRECATED
#endif

#ifndef CALENDAREVENTS_DEPRECATED_NO_EXPORT
#  define CALENDAREVENTS_DEPRECATED_NO_EXPORT CALENDAREVENTS_NO_EXPORT CALENDAREVENTS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef CALENDAREVENTS_NO_DEPRECATED
#    define CALENDAREVENTS_NO_DEPRECATED
#  endif
#endif

#endif /* CALENDAREVENTS_EXPORT_H */
