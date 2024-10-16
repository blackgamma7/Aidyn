#include "../ultra/include/2.0I/ultra64.h"
#include "../ultra/include/2.0I/PR/sched.h"


typedef unsigned char   undefined;
typedef unsigned char    byte;
typedef unsigned int    dword;
typedef long long    longlong;
typedef char    sbyte;
typedef unsigned char    uchar;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned char    undefined1;
typedef unsigned long undefined4;
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;

typedef union Color32 {
    struct {u8 R, G, B, A;};
    u32 W;
} Color32;