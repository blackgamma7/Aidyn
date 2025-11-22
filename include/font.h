#include "n64Borg.h"

/*Note on font: some ASCII characters are replaced with icons:
'<' Skull
'>' Heart
'|' Infinity
'_' Diamond
'\' ok
'`' X
'~' <<
'#', '[', ']' are ommitted and will not show
0x7f A Button
0x80 B Button
0x81 C-Left
0x82 C-Right
0x83 C-Down
0x84 C-Up
0x85 Start Button
0x86 Directional Pad
0x87 Z Trigger
0x88 Should be L Button, but is not visible (error in Font::SetupBorg8()?)
0x89 Should be R Button, but is not visible (error in Font::SetupBorg8()?)
*/

struct FontSubstruct{
    u32 borgIndex;
    Borg8Header* borgP;
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
    Borg8Header *currFont;
    u8 fontIndex;
    u8 fontsLoaded;
    u8 fontTotal;
    undefined field5_0xb;
    u16 charW;
    u16 charH;
    u16 BorgW;
    u16 BorgH;
    float scale;
    u16 *kerning;
    Color32 col;
};
struct FontFace{
    u32 borg8;
    u8 rows;
    u8 cols;
    u16 align;
};
extern FontFace font_face[3];

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
int PrintWapperA(FontStruct *fontP,Gfx **gg,char *txt,int posX,int posY,u16 param_6,int param_7
                      ,u16 param_8,int param_9,float param_10,float param_11);
int PrintWapperUnused(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,
                      short param_6,short param_7,int param_8,int param_9,int param_10,int param_11);                       
int PrintMain(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,short param_6,
                       short param_7,int param_8,int param_9,int param_10,int param_11,
                       float param_12,float param_13);
void PrintCharaWapper(FontStruct *font,Gfx **gg,u32 param_3,u32 param_4,int param_5,
                 short param_6,short param_7,short param_8,short param_9);

void PrintChara(FontStruct *fontP,Gfx **gg,u8 chara,s32 param_4,int param_5,short param_6,
                        short param_7,short param_8,short param_9,float param_10,float param_11);
int GetWidth(FontStruct *font,char *str);
int GetWidthScaled(FontStruct *font,char *str,float scale);
u16 GetCharWidth(FontStruct *font,u8 param_2);
int GetCharWidthScaled(FontStruct *font,char param_2,float param_3);
int GetHeight(FontStruct *f,char *str,int h,int w);
int GetHeightScaled(FontStruct *font,char *str,int h,int w,float scaleX,float scaleY);
u8 SetupBorg8(FontStruct *font,Borg8Header *b8,u16* sizes,u16 rows,u16 cols);
};

//switch to slightly smaller font for certain text
#define SlimFont Font::SetFace(gGlobals.font,font_face[1].borg8)

//use "normal-sized" font
#define NormalFont Font::SetFace(gGlobals.font,font_face[0].borg8)