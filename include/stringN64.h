#pragma once
/* On Linux (native port), always use standard C library headers.
 * The N64 libultra had different signatures (e.g., sprintf returns void),
 * which would conflict with Linux glibc. */
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include "../ultra/include/2.0I/ultra64.h"

#ifndef PORTING
#define PORTING 1
#endif

/* N64-specific string utility functions implemented in src_pseudo/ */
u8 * Ofunc_80098e84(u8 *c1,u8 *c2,size_t i);
s32 Ofunc_80099030(u8 *c1,u8 *c2,size_t i);
u8 * Ofunc_80098a34(u8 *c1,u8 *c2);
u8 * Ofunc_80098a80(u8 *c1,u8 *c2,size_t l);
s32 Ofunc_80098c4c(u8 *c1,u8 *c2);
s32 Ofunc_80098d18(u8 *c1,u8 *c2,size_t i);

u8 * uppercase(u8 *x);
inline char * uppercase(char *x){return (char*) uppercase((u8*)x);}
u8 * lowercase(u8 *x);
inline char * lowercase(char *x){return (char*) lowercase((u8*)x);}

#undef CLEAR
#define CLEAR(x) memset(x,0,sizeof(*x))

//copy the string and a null terminator to end of destination.
#define STRCPYSafe(dst,src) strncpy(dst,src,sizeof(dst)); \
                            dst[sizeof(dst)-1]='\0'
//copying macro
#undef COPY
#define COPY(dst,src) memcpy(dst,src,sizeof(*dst))
