#include "typedefs.h"
#include "stringN64.h"

struct MemMon_struct {
    void * memRegionStart;
    void * memRegionNext;
    void * memRegionMaxCurr;
    u32 memFreeMax;
    u32 memUsed;
    u32 memFree;
    u32 obj_count;
    u32 obj_count_2;
    u32 obj_free;
    u32 memFree_2;
    char text[256];
    u8 flag;
    u8 pad[7];
};

struct HeapBlock{
    u32 size;
    #if DEBUGVER
    char filename[24]; //ommited in retail version
    #endif
};

typedef void (*memPrint)(u16 * , char *, s32 , int, int, int, int, s32, int);
MemMon_struct gMemMonitor={0};

void HeapInit(void *start,size_t size);
void * HeapAlloc(size_t size,char *file,u32 line);
void HeapFree(void *X,char *cpp,u32 line);
u32 Ofunc_80098200(void *param_1);
u32 Ofunc_get_MemFreeMax(void);
u32 get_memUsed(void);
u32 get_MemFree(void);
u32 Ofunc_get_objCount(void);
u32 Ofunc_get_obj_count_2(void);
u32 get_obj_free();
u32 get_memFree_2(void);
void print_mem_allocated(memPrint *func_,u16 *param_2);
void malloc_update_mem_mon(HeapBlock *h,u32 param_2);
void* operator new(size_t size);
void operator delete(void* x);

//discern from debug keeping filename and line of script, and retail ommiting both
#if DEBUGVER
#define HALLOC(x,line) HeapAlloc(x,FILENAME,line)
#define HFREE(x,line) HeapFree(x,FILENAME,line)
#else
#define HALLOC(x,line) HeapAlloc(x,"",0)
#define HFREE(x,line) HeapFree(x,"",0)
#endif
#define ALLOCS(x,s,line) x=static_cast<decltype(x)>(HALLOC(s,line))
#define ALLOC(x,line) ALLOCS(x,sizeof(*x),line)
//lvalue alloc
#define ALLOCL(x,line) {void* p=HALLOC(sizeof(*x),line);\
                       x=(decltype(x))(p);}
#define FREE(x,line) HFREE(x,line); x=NULL
//lvalue free
#define FREEL(x,line) {void* p = x;HFREE(p,line); p=(NULL);}
#define FREEPTR(x,line) if(x!=NULL) {FREE(x,line);}