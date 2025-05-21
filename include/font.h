#include "n64Borg.h"

struct FontSubstruct{
    u32 borgIndex;
    Borg8header* borgP;
    u16 charW;
    u16 charH;
    u16 borgW;
    u16 borgH;
    u16* rowsCols;
    u8 rows;
    u8 cols;
    u16 unk16; //align?
};

struct FontStruct {
    FontSubstruct *substruct0;
    Borg8header *currFont;
    char field2_0x8;
    u8 fontsLoaded;
    u8 fontTotal;
    undefined field5_0xb;
    u16 charW;
    u16 charH;
    u16 borgW;
    u16 borgH;
    float scale;
    u16 *rowsCols;
    Color32 col;
};
struct FontFace{
    u32 borg8;
    u8 rows;
    u8 cols;
    u16 align;
};
extern FontFace font_face[3];
u8 extraFontColors[12][3];

namespace Font{
void GetButtonColor(u8 x,u8 *r,u8 *g,u8 *b);
bool Init(FontStruct *font,u8 param_2);
void Free(FontStruct *font);
u8 LoadFace(FontStruct *font,u32 b8,u8 rows,u8 cols);
void SetFace(FontStruct *font,u32 param_2);
void print800b44dc(FontStruct *font,Gfx **gg,char *txt,s32 x,s32 y);
int printSimple(FontStruct *font,Gfx **gg,char *txt,int x,int y,float scalex,float scaley);
int printUnused(FontStruct *font,Gfx **gg,char *txt,int param_4,undefined4 param_5,
                  undefined4 param_6,undefined4 param_7,undefined4 param_8,undefined4 param_9);
int PrintWapperA(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,int param_6,
              int param_7,int param_8,int param_9,float param_10,float param_11);
int PrintWapperUnused(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,
                      short param_6,short param_7,int param_8,int param_9,int param_10,int param_11);                       
int PrintMain(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,short param_6,
                       short param_7,int param_8,int param_9,int param_10,int param_11,
                       float param_12,float param_13);
void PrintCharaWapper(FontStruct *font,Gfx **gg,uint param_3,u32 param_4,int param_5,
                 short param_6,short param_7,short param_8,short param_9);

void PrintChara(FontStruct *fontP,Gfx **gg,u8 chara,s32 param_4,int param_5,short param_6,
                        short param_7,short param_8,short param_9,float param_10,float param_11);
int GetWidth(FontStruct *font,char *str);
int GetWidthScaled(FontStruct *font,char *str,float scale);
u16 GetCharWidth(FontStruct *font,u8 param_2);
int GetCharWidthScaled(FontStruct *font,char param_2,float param_3);
int GetHeight(FontStruct *f,char *str,int h,int w);
int GetHeightScaled(FontStruct *font,char *str,int h,int w,float scaleX,float scaleY);
u8 SetupBorg8(FontStruct *font,Borg8header *b8,int chars,u16 rows,u16 cols);
};