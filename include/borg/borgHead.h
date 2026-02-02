#include "typedefs.h"


enum CompressType{
    Compress_None, //no compression, as is
    Compress_LZ01x, //used by text in ROM
    Compress_LZB   //used by most of Borg assets.
};

struct BorgListing {
    s16 Type; /* Borg type */
    s16 Compression; //uses CompressType.
    s32 compressed; /* size in ROM */
    s32 uncompressed; /* size in RAM */
    s32 Offset; /* index in in ROM DB */
};

struct borgHeader {
    s32 index;
    u32 unk;
};

//borgmain.cpp

void setBorgFlag(void);
void clearBorgFlag(void);
u32 Ofunc_getBorgTotal(void);
void SetBorgListing(void *,void *);
u8 decompressBorg(void *,u32 ,u8 *,u32 ,u32 );
s16 get_borg_listing_type(s32);
s16 GetBorgItemInfo(BorgListing *,s32);
borgHeader* getLoadedBorg(s32);
borgHeader * getBorgItem(s32);
void FUN_800a2de0(void);
u8 get_borg_index_count(s32);
void dec_borg_count(s32);
void borg0_func_a(void**);
u8 borg0_func_b(void**,void*);
void Ofunc_borg0_free(void**);
void * Ofunc_getborg(s32);