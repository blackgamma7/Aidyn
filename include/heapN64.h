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
    #ifdef DEBUGVER
    char filename[24]; //ommited in retail version
    #endif
};

extern struct MemMon_struct gMemMonitor;

void HeapInit(void *start,u32 size);
void * HeapAlloc(uint size,char *file,uint line);
void HeapFree(void *X,char *cpp,int line);
uint Ofunc_80098200(void *param_1);
u32 Ofunc_get_MemFreeMax(void);
u32 get_memUsed(void);
u32 get_MemFree(void);
u32 Ofunc_get_objCount(void);
u32 Ofunc_get_obj_count_2(void);
u32 get_memFree_2(void);
void print_mem_allocated(void *func_,void *param_2);
void malloc_update_mem_mon(HeapBlock *h,int param_2);

//discern from debug keeping filename and line of script, and retail ommiting both
#ifdef DEBUGVER
#define HALLOC(x,line) HeapAlloc(x,FILENAME,line)
#define HFREE(x,line) HeapFree(x,FILENAME,line)
#else
#define HALLOC(x,line) HeapAlloc(x,"",0)
#define HFREE(x,line) HeapFree(x,"",0)
#endif
#define ALLOCS(x,s,line) x=static_cast<decltype(x)>(HALLOC(s,line))
#define ALLOC(x,line) ALLOCS(x,sizeof(*x),line)
//lvalue alloc
#define ALLOCL(x,line) void* p=HALLOC(sizeof(*x),line);\
                       x=(decltype(x))(p)
#define FREE(x,line) HFREE(x,line); x=decltype(x)(NULL)
#define FREEPTR(x,line) if(x) {FREE(x,line);}