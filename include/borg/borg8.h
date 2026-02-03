#include "borg/borgHead.h"

typedef enum Borg8Format {
    BORG8_RBGA32=1,
    BORG8_RGBA16,
    BORG8_IA16,
    BORG8_CI8,
    BORG8_IA8,
    BORG8_I8,
    BORG8_CI4,
    BORG8_IA4,
    BORG8_I4,
} Borg8Format;

struct Borg8Data {
    u16 format; //uses "Borg8Format"
    u16 Width;
    u16 Height;
    u16 unk06;
    u16* palette; //for CI8/4
    void* offset; //offset to bitmap
};

typedef struct Borg8Header {
    borgHeader head;
    Borg8Data dat;
}Borg8Header;


//n64borg/image.cpp

u8 borg8_func_b(void *,void *);
void borg8_func_a(Borg8Header *);
void borg8_free_ofunc(Borg8Header *);
Borg8Header* loadBorg8(u32);
Gfx * borg8DlistInit(Gfx *,u8 ,u16,u16);
Gfx * N64BorgImageDraw(Gfx *g,Borg8Header *borg8,float x,float y,u16 xOff,u16 yOff,u16 h,u16 v,
                      float xScale,float yScale,u8 red,u8 green,u8 blue,u8 alpha);
Gfx* Borg8_DrawSimple(Gfx*g,Borg8Header *borg8,float x,float y,float Hscale,float Vscale,u8 R,u8 G,u8 B,u8 A);
void borg8_free(Borg8Header *);
Gfx * DrawRectangle(Gfx *gfx,u16 x,u16 y,u16 H,u16 V,u8 R,u8 G,u8 B,u8 A);


#define G_IM_SIZ_4b_MUL >>1
#define G_IM_SIZ_8b_MUL *1
#define G_IM_SIZ_16b_MUL *2
#define G_IM_SIZ_32b_MUL *2

#define Borg8LoadTextureBlock(pkt,timg,fmt,siz,b8Width,hVis,xOff,yOff,width0,width1)\
_DW({\
        gDPSetTextureImage(pkt,fmt,siz##_LOAD_BLOCK,b8Width,timg);\
        gDPSetTile(pkt,fmt,siz##_LOAD_BLOCK,(((((xOff - 1) + hVis) - xOff) siz##_MUL + (7+siz##_LINE_BYTES)) >> 3),\
           0,G_TX_LOADTILE,0,2,0,0,2,0,0);\
        gDPLoadSync(pkt);\
        gDPLoadTile(pkt,0,(xOff << 2),(yOff << 2),((xOff - 1) + hVis)<<2,width0);\
        gDPPipeSync(pkt);\
        gDPSetTile(pkt,fmt,siz,((((xOff - 1) + hVis) - xOff) siz##_MUL + (7+siz##_LINE_BYTES)) >> 3,0,\
          G_TX_RENDERTILE,0,2,0,0,2,0,0);\
        gDPSetTileSize(pkt,G_TX_RENDERTILE,(xOff << 2),(yOff<<2),\
            ((xOff - 1) + hVis)<<2,((yOff) << 2));\
        gDPSetTileSize(pkt,G_TX_RENDERTILE,0,0,\
          (hVis - 1)<<G_TEXTURE_IMAGE_FRAC,(width1)<<G_TEXTURE_IMAGE_FRAC);\
})

#define RSPFUNC(g,flag) g=borg8DlistInit(g,flag,Graphics::GetHRes(),Graphics::GetVRes())
#define RSPFUNC6(g) RSPFUNC(g,6)
#define RSPFUNC5(g) RSPFUNC(g,5)