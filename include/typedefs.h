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
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;

typedef unsigned char u8;
typedef char s8;
typedef unsigned short u16;
typedef short s16;
typedef int s32;
typedef unsigned int u32;
typedef long long s64;
typedef unsigned long long u64;

typedef union Color32 {
    struct {u8 R, G, B, A;};
    u32 W;
} Color32;

#define NULL (void*)0x0