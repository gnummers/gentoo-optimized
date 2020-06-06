#ifndef __GAVL_VERSION_H_
#define __GAVL_VERSION_H_

#define GAVL_VERSION "1.4.0"

#define GAVL_VERSION_MAJOR 1
#define GAVL_VERSION_MINOR 4
#define GAVL_VERSION_MICRO 0

#define GAVL_MAKE_BUILD(a,b,c) ((a << 16) + (b << 8) + c)

#define GAVL_BUILD \
GAVL_MAKE_BUILD(GAVL_VERSION_MAJOR, \
                GAVL_VERSION_MINOR, \
                GAVL_VERSION_MICRO)

#endif // __GAVL_VERSION_H_
