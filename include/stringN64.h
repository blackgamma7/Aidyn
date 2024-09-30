#ifdef PORTING
//for future porting - use available string libraries where applicable. 
#include <string.h>
#else

#include "typedefs.h"
#define NULL (void*)0x0
typedef u32 size_t;
char* strcpy(char* c1,char* c2);
char* strncpy(char *c1,char *c2,size_t l);
char* Ofunc_80098a34(char *c1,char *c2);
char* Ofunc_80098a80(char *c1,char *c2,size_t l);
s32 strcmp(char *A,char *B);
s32 strncmp(char *c1,char *c2,size_t i);
s32 Ofunc_80098c4c(u8 *c1,u8 *c2);
s32 Ofunc_80098d18(byte *c1,byte *c2,size_t i);
void * memset(void *x,u8 m,size_t i);
#endif
u8 * Ofunc_80098e84(u8 *c1,u8 *c2,size_t i);
s32 Ofunc_80099030(u8 *c1,u8 *c2,size_t i);
u8 * uppercase(u8 *x);
inline char * uppercase(char *x){return (char*) uppercase((u8*)x);}
u8 * lowercase(u8 *x);
inline char * lowercase(char *x){return (char*) lowercase((u8*)x);}
#define CLEAR(x) memset(x,0,sizeof(*x))

extern void sprintf(char* buff, char* fmt,...);

//many sprintfs use "gGlobals.text" as the buffer.
#define Gsprintf(fmt,...)  sprintf(gGlobals.text,fmt,__VA_ARGS__)
//copy the string and a a null terminator to end of destination.
#define STRCPYSafe(dst,src) strncpy(dst,src,sizeof(dst)); \
                            dst[sizeof(dst)-1]='\0';