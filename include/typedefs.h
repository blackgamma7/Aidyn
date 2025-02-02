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

#define OFFWHITE 0xe1,0xe1,0xe1,0xff
#define DARKGRAY 0x32,0x32,0x32,0xff
#define DARKGRAY_T 0x32,0x32,0x32,0x96
#define YELLOW_T 0xc8,0xc8,0,0xe1

#define FLOOR(x,lo) if(x<lo) x=lo
#define CIEL(x,hi) if(x>hi) x=hi
#define CLAMP(x,lo,hi) FLOOR(x,lo); CIEL(x,hi)

//Ghidra concatonating 2 32-bit values into 2 "low" registers
#define CONCAT44(x,y) (u64)((x)<<32|y)