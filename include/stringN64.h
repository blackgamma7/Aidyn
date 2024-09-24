#ifdef PORTING
//for future porting - use available string libraries where applicable. 
#include <string.h>
#else
#include "typedefs.h"
#define NULL (void*)0x0
typedef size_t u32;
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
s32 Ofunc_80099030(byte *c1,byte *c2,size_t i);
u8 * uppercase(u8 *x);
inline u8 * uppercase(char *x){return uppercase((u8*)x);}
u8 * lowercase(u8 *x);
inline u8 * lowercase(char *x){return lowercase((u8*)x);}
#define CLEAR(x) memset(x,0,sizeof(*x))

extern void sprintf(char* buff, char* fmt,...);