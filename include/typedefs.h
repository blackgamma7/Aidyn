#include "../ultra/include/2.0I/ultra64.h"
#include "../ultra/include/2.0I/PR/sched.h"

#include "versions.h"

extern s32 osAfterPreNMI(void); //not in libreultra

typedef long long    longlong;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned long long    undefined8;

#ifndef uintptr_t
typedef unsigned long uintptr_t;
#endif

typedef union Color32 {
    struct {u8 R, G, B, A;};
    u32 W;
};

#define ASCIIRange 94 //('~'-' ')

//common colors used by Color32

#define COLOR_WHITE 0xff,0xff,0xff,0xff
#define COLOR_OFFWHITE 0xe1,0xe1,0xe1,0xff
#define COLOR_OFFWHITE2 0xe1,0xe1,0xe1,200
#define COLOR_DARKGRAY 0x32,0x32,0x32,0xff
#define COLOR_DARKGRAY_T 0x32,0x32,0x32,0x96
#define COLOR_RED1 0x82,0x50,0x50,0xff
#define COLOR_YELLOW_T 200,200,0,0xe1
#define COLOR_GREEN0 0,0xff,0,0xff
#define COLOR_GREENDARK 0x36,0x40,0,0xff
#define COLOR_BROWN1 0x67,0x46,0x3c,0xff
#define COLOR_BLACK 0,0,0,0xff
#define COLOR_BLACK2 0x1e,0x1a,0,0xff

#define IABS(x) if(x<0) x=-x

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
//memcpy Mtx(F)
#define MTXCPY(dst,src) *(Mtx*)dst=*(Mtx*)src

#define FLOOR(x,lo) if(x<lo) x=lo
#define CIEL(x,hi) if(x>hi) x=hi
#define CLAMP(x,lo,hi) FLOOR(x,lo); CIEL(x,hi)
//clamp a value to 0-1
#define CLAMP01(x) CLAMP(x,0.0,1.0)
//clamp a vec3's values to 0-1
#define CLAMP01V3(v) CLAMP01(v.x); CLAMP01(v.y); CLAMP01(v.z)
//turn a Vec3f or vec4f(v) into 32-bit RGB values for Color32*(c).
#define V3ToRGB(c,v) c->R=v.x*255; c->G=v.y*255; c->B=v.z*255

#undef OS_CYCLES_TO_USEC
// dirty workaround to use "udivdi3" func instead
// should be the same formula, just simplified.
#define OS_CYCLES_TO_USEC(c) udivdi3(c>>6,3000)
#define TIME_USEC OS_CYCLES_TO_USEC(osGetTime()) //clock time in microseconds

#undef OS_CYCLES_TO_NSEC
// dirty workaround to use "udivdi3" func instead
// should be the same formula, just simplified.
#define OS_CYCLES_TO_NSEC(c) udivdi3(c>>6,3)
#define TIME_NSEC OS_CYCLES_TO_NSEC(osGetTime()) //clock time in nanoseconds

//Ghidra concatonating 2 32-bit values into 2 "lo" registers as a 64-bit value
#define CONCAT44(x,y) (u64)((x)<<32|y)