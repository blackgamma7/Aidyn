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
    float kerningMulti;
    u16 *rowsCols;
    Color32 col;
};

void get_extra_font_color(u8 x,u8 *r,u8 *g,u8 *b);
bool Init_font(FontStruct *param_1,u8 param_2);
void Ofunc_fontEngine(FontStruct *param_1);
u8 load_font_face(FontStruct *param_1,u32 b8,u8 rows,u8 cols);
void font_func(FontStruct *param_1,u32 param_2);
void print_func_80044dc(FontStruct *param_1,Gfx **gg,char *txt,s32 x,s32 y);
int FUN_800b4508(FontStruct *font,Gfx **gg,char *txt,int x,int y,float scalex,float scaley);
int Ofunc_800b4740(FontStruct *param_1,Gfx **gg,char *param_3,int param_4,undefined4 param_5,
                  undefined4 param_6,undefined4 param_7,undefined4 param_8,undefined4 param_9);
int passto_display_text_func_A(FontStruct *param_1,Gfx **gg,char *param_3,int param_4,int param_5,int param_6,
              int param_7,int param_8,int param_9,float param_10,float param_11);
int Ofunc_display_text(FontStruct *param_1,Gfx **gg,char *param_3,int param_4,int param_5,
                      short param_6,short param_7,int param_8,int param_9,int param_10,int param_11);                       
int display_text_func_A(FontStruct *font,Gfx **gg,char *txt,int param_4,int param_5,short param_6,
                       short param_7,int param_8,int param_9,int param_10,int param_11,
                       float param_12,float param_13);
void FUN_800b4d80(FontStruct *param_1,Gfx **gg,uint param_3,u32 param_4,int param_5,
                 short param_6,short param_7,short param_8,short param_9);

void text_rendering_func(FontStruct *fontP,Gfx **gg,u8 chara,s32 param_4,int param_5,short param_6,
                        short param_7,short param_8,short param_9,float param_10,float param_11);
int passto_get_text_kerning(FontStruct *param_1,char *str);
int get_text_kerning(FontStruct *font,char *str,float scale);
u16 FUN_800b51bc(FontStruct *param_1,u8 param_2);
int FUN_800b5218(FontStruct *param_1,char param_2,float param_3);
int FUN_800b5290(FontStruct *f,char *str,int h,int w);
int Font_GetHeight(FontStruct *param_1,char *str,int h,int w,float scaleX,float scaleY);
u8 FUN_800b54cc(FontStruct *param_1,Borg8header *param_2,int param_3,u16 param_4,u16 param_5);
