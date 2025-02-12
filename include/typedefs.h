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
};

#define ASCIIRange 94 //('~'-' ')

//common colors used by Color32

#define OFFWHITE 0xe1,0xe1,0xe1,0xff
#define DARKGRAY 0x32,0x32,0x32,0xff
#define DARKGRAY_T 0x32,0x32,0x32,0x96
#define YELLOW_T 0xc8,0xc8,0,0xe1

#define FLOOR(x,lo) if(x<lo) x=lo
#define CIEL(x,hi) if(x>hi) x=hi
#define CLAMP(x,lo,hi) FLOOR(x,lo); CIEL(x,hi)
//clamp a value to 0-1
#define CLAMP01(x) CLAMP(x,0.0,1.0)
//clamp a vec3's values to 0-1
#define CLAMP01V3(v) CLAMP01(v.x); CLAMP01(v.y); CLAMP01(v.z)
//turn a Vec3f(v) into 32-bit RGB values for Color32*(c).
#define V3ToRGB(c,v) c->R=v.x*255; c->G=v.y*255; c->B=v.z*255

//Ghidra concatonating 2 32-bit values into 2 "lo" registers
#define CONCAT44(x,y) (u64)((x)<<32|y)