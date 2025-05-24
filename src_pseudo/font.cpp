#include "font.h"
#include "heapN64.h"
#include "unkStructs.h"
#define FILENAME "./src/fontengine.cpp"
//                          A        B    
u8 extraFontColors[][3]={{0,0,164},{0,164,0},
// C buttons
{200,164,0},{200,164,0},{200,164,0},{200,164,0},
//Start     D-pad       Z          L          R
{128,0,0},{90,90,90},{90,90,90},{90,90,90},{90,90,90},{0}
};

//for the chars between 0x80 and 0x8A. used to color the button icons.
void Font::GetButtonColor(byte x,byte *r,byte *g,byte *b){
  *r = extraFontColors[x][0];
  *g = extraFontColors[x][1];
  *b = extraFontColors[x][2];
}

bool Font::Init(FontStruct *fontP,u8 param_2){
  float fVar1;
  FontSubstruct *pFVar2;
  bool bVar3;
  FontSubstruct *puVar3;
  int iVar4;
  uint uVar5;
  
  uVar5 = (uint)param_2;
  ALLOCS(pFVar2,param_2 *sizeof(FontSubstruct),0x3f);
  fontP->substruct0 = pFVar2;
  if (pFVar2 == NULL) bVar3 = false;
  else {
    if (uVar5 != 0) {
      iVar4 = 0;
      do {
        puVar3 = (FontSubstruct *)(&fontP->substruct0->borgIndex + iVar4);
        puVar3->rows = 0;
        pFVar2 = fontP->substruct0;
        uVar5 -= 1;
        puVar3->borgIndex = 0;
        puVar3->borgP = NULL;
        puVar3->charH = 0;
        puVar3->charW = 0;
        puVar3->borgH = 0;
        puVar3->borgW = 0;
        (&pFVar2->cols)[iVar4] = 0;
        iVar4 = iVar4 + 0x18;
      } while (uVar5 != 0);
    }
    bVar3 = true;
    (fontP->col).R = 0xe1;
    (fontP->col).G = 0xe1;
    (fontP->col).B = 0xe1;
    (fontP->col).A = 0xff;
    fontP->fontsLoaded = 0;
    fontP->fontTotal = param_2;
    fontP->fontIndex = 0;
    fontP->currFont = NULL;
    fontP->scale = 1.0f;
  }
  return bVar3;
}


void Font::Free(FontStruct *fontP){
  if (fontP->fontsLoaded != 0) {
    for(u32 i=0;i<fontP->fontsLoaded;i++) {
      if (fontP->substruct0[i].borgP){
        borg8_free_ofunc(fontP->substruct0[i].borgP);
        FontSubstruct* sub = &fontP->substruct0[i];
        sub->borgP=NULL;
        sub->borgIndex=0;
        HFREE(sub->rowsCols,0x72);
      }
    }
  }
  HFREE(fontP->substruct0,0x75);
}


u8 Font::LoadFace(FontStruct *fontP,u32 b8,u8 rows,u8 cols){
  ushort uVar1;
  ushort uVar2;
  u16 uVar3;
  byte bVar6;
  Borg8Header *pBVar4;
  u16 *puVar5;
  FontSubstruct *pFVar7;
  
  if (fontP->fontsLoaded < fontP->fontTotal) {
    if (fontP->fontsLoaded == 0) fontP->fontIndex = 0;
    bVar6 = fontP->fontsLoaded + 1;
    fontP->fontsLoaded = bVar6;
    pFVar7 = fontP->substruct0 + (bVar6 - 1);
    pBVar4 = loadBorg8(b8);
    fontP->currFont = pBVar4;
    if (pBVar4) {
      pFVar7->borgP = pBVar4;
      pBVar4 = fontP->currFont;
      uVar1 = (pBVar4->dat).Width;
      pFVar7->borgW = uVar1;
      uVar2 = (pBVar4->dat).Height;
      pFVar7->borgIndex = b8;
      pFVar7->borgH = uVar2;
      pFVar7->charW = uVar1 / cols;
      pFVar7->charH = uVar2 / rows;
      puVar5 = (u16 *)HALLOC(rows * cols * sizeof(u16),160);
      pFVar7->rows = rows;
      pFVar7->cols = cols;
      pBVar4 = fontP->currFont;
      pFVar7->rowsCols = puVar5;
      SetupBorg8(fontP,pBVar4,pFVar7->rowsCols,rows,cols);
      fontP->charW = pFVar7->charW;
      fontP->charH = pFVar7->charH;
      fontP->BorgW = pFVar7->borgW;
      uVar3 = pFVar7->borgH;
      fontP->kerning = pFVar7->rowsCols;
      fontP->BorgH = uVar3;
      return true;
    }
  }
  return false;
}


void Font::SetFace(FontStruct *fontP,u32 param_2){
  if (fontP->fontsLoaded != 0) {
    for(u8 i=0;i<fontP->fontsLoaded;i++){
        FontSubstruct *sub=&fontP->substruct0[i];
        if(sub->borgIndex==param_2){
        fontP->charW = sub->charW;
        fontP->charH = sub->charH;
        fontP->BorgW = sub->borgW;
        fontP->BorgH = sub->borgH;
        fontP->currFont = sub->borgP;
        fontP->kerning = sub->rowsCols;
        return;
        }
    }
  }
}

//used in the copyright information on the spash screen.
void Font::print800b44dc(FontStruct *fontP,Gfx **gg,char *txt,s32 x,s32 y){
  printSimple(fontP,gg,txt,x,y,fontP->scale,fontP->scale);
}


int Font::printSimple(FontStruct *fontP,Gfx **gg,char *txt,int x,int y,float scalex,float scaley)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  int iVar9;
  int xCurr;
  Color32 col;
  
  sVar4 = fontP->charW;
  sVar5 = fontP->charH;
  xCurr = x;
  if ((fontP->currFont != NULL) && (*txt)) {
    bVar1 = *txt;
    while( true ) {
      if (bVar1 == '\n') {
        y += (fontP->charH * scaley);
        xCurr = x;
      }
      else if (struct_unk_.textIndexies[(byte)*txt - ' '] != 0x2b) {
        bVar2 = struct_unk_.textIndexies[(byte)*txt - ' '];
        bVar3 = fontP->substruct0[fontP->fontIndex].rows;
        col.R = (fontP->col).R;
        col.G = (fontP->col).G;
        col.B = (fontP->col).B;
        if ('~' < bVar1) GetButtonColor(bVar1 -0x7F,&col.R,&col.G,&col.B);
        sVar6 = ((ushort)bVar2 / (ushort)bVar3) * sVar4;
        sVar7 = ((ushort)bVar2 % (ushort)bVar3) * sVar5;
        *gg = N64BorgImageDraw(*gg,fontP->currFont,xCurr,y,sVar6,sVar7,
                                  fontP->kerning[bVar2] + sVar6,sVar7 + sVar5,scalex,scaley,col.R,
                                  col.G,col.B,(fontP->col).A);
        xCurr += GetCharWidthScaled(fontP,*txt,scalex);
      }
      txt++;
      if (*txt == 0) break;
      bVar1 = *txt;
    }
  }
  return xCurr;
}

int Font::printUnused(FontStruct *fontP,Gfx **GG,char *txt,int param_4,u32 param_5
                     ,u32 param_6,u32 param_7,u32 param_8,u32 param_9){
  return PrintWapperA(fontP,GG,txt,param_4,param_5,param_6,param_7,param_8,param_9,
                       fontP->scale,fontP->scale);
}

//used by WidgetText::Render()
int Font::PrintWapperA(FontStruct *fontP,Gfx **gg,char *txt,int posX,int posY,u16 param_6,int param_7
                      ,u16 param_8,int param_9,float param_10,float param_11){
  return PrintMain(fontP,gg,txt,posX,posY,param_6,param_8,param_6,param_7,param_8,
                    param_9,param_10,param_11);
}

int Font::PrintWapperUnused
              (FontStruct *font,Gfx **gg,char *txt,int posX,int posY,short param_6,short param_7,
              int param_8,int param_9,int param_10,int param_11){
  return PrintMain(font,gg,txt,posX,posY,param_6,param_7,param_8,param_9,param_10,param_11,
                    font->scale,font->scale);
}

int Font::PrintMain(FontStruct *font,Gfx **gg,char *txt,int posX,int posY,short param_6,
                   short param_7,int param_8,int param_9,int param_10,int param_11,float scaleX,
                   float scaleY)

{
  byte bVar1;
  ushort uVar2;
  ushort uVar3;
  bool bVar4;
  short sVar5;
  short sVar6;
  Gfx *pGVar7;
  int iVar8;
  u16 *puVar9;
  byte bVar10;
  char *iVar16;
  int iVar11;
  byte *pbVar12;
  byte *pbVar13;
  int iVar14;
  int iVar15;
  int iVar17;
  u8 red;
  u8 green;
  byte blue;
  int iStack_64;
  int iStack_60;
  int iStack_5c;
  uint uStack_58;
  uint uStack_54;
  int iStack_50;
  int iStack_4c;
  uint uStack_48;
  uint uStack_44;
  char *pcStack_40;
  int iStack_3c;
  
  iStack_5c = posY;
  iStack_64 = param_7;
  uStack_58 = (u16)font->charW;
  iVar11 = 0;
  uStack_54 = (u16)font->charH;
  if ((((font->currFont == NULL) || (iStack_64 <= param_6)) ||
      (param_10 <= param_8)) || (param_11 <= param_9)) {
    iStack_5c = 0;
  }
  else {
    iStack_50 = (uStack_54 * scaleY + 2.0f);
    if (*txt != '\0') {
      bVar10 = *txt;
      pbVar13 = (byte *)txt;
      iStack_60 = posX;
      do {
        iStack_3c = iVar11;
        iStack_4c = GetCharWidthScaled(font,bVar10,scaleX);
        if (*pbVar13 == '\n') {
LAB_800b49c0:
          iVar11 = iStack_3c + 1;
          posY += iStack_50;
          posX = iStack_60;
        }
        else {
          if (struct_unk_.textIndexies[*pbVar13 - ' '] != 0x2b) {
            if (*pbVar13 != ' ') {
              uVar2 = font->charH;
              bVar10 = struct_unk_.textIndexies[*pbVar13 - ' '];
              if ((param_9 < (posY + (uint)uVar2)) && (posY < param_11)) {
                bVar1 = font->substruct0[font->fontIndex].rows;
                uStack_48 = (uint)bVar10 / (uint)bVar1;
                uStack_44 = (uint)bVar10 % (uint)bVar1;

                iVar15 = 0;
                iVar17 = 0;
                iVar11 = 0;
                iVar14 = 0;
                if (posX < param_8) {
                  puVar9 = font->kerning;
                  iVar11 = ((param_8 - posX) / scaleX);
                  uVar3 = puVar9[bVar10];
LAB_800b4b54:
                  if (param_10 < (posX + (uint)uVar3)) {
                    iVar14 = (((posX + (uint)uVar3) - param_10) / scaleX);
                  }
                }
                else {
                  puVar9 = font->kerning;
                  if (param_10 < (posX + (uint)puVar9[bVar10])) {
                    uVar3 = puVar9[bVar10];
                    goto LAB_800b4b54;
                  }
                }
                if (posY < param_9) {
                  iVar15 = ((param_9 - posY) / scaleY);
LAB_800b4bc4:
                  iVar8 = posY + (uint)uVar2;
                  if (param_11 < iVar8) {
                    iVar17 = ((iVar8 - param_11) / scaleY);
                  }
                }
                else if (param_11 < (posY + (uint)uVar2)) goto LAB_800b4bc4;
                if ((iVar11 < ((uint)puVar9[bVar10] - iVar14)) &&
                   (iVar15 < (uStack_54 - iVar17))) {
                  red = (font->col).R;
                  green = (font->col).G;
                  blue = (font->col).B;
                  if (0x7e < *pbVar13) GetButtonColor(*pbVar13 + 0x81,&red,&green,&blue);
                  sVar5 = (short)uStack_48 * (short)uStack_58;
                  sVar6 = (short)uStack_44 * (short)uStack_54;
                  pGVar7 = N64BorgImageDraw(*gg,font->currFont,(posX + iVar11),
                                            (posY + iVar15),sVar5 + (short)iVar11,
                                            sVar6 + (short)iVar15,
                                            (font->kerning[bVar10] + sVar5) - (short)iVar14,
                                            (sVar6 + (short)uStack_54) - (short)iVar17,scaleX,scaleY
                                            ,red,green,blue,(font->col).A);
                  *gg = pGVar7;
                }
              }
              iVar11 = iStack_3c + 1;
              posX += iStack_4c;
              goto LAB_800b4d2c;
            }
            if (posX != iStack_60) {
              posX += iStack_4c;
              iVar11 = iStack_3c + 1;
              if (iStack_64 < posX) goto LAB_800b49c0;
              bVar10 = pbVar13[1];
              iVar15 = posX;
              if (((bVar10 != 0) && (bVar10 != ' ')) && (bVar10 != 10)) {
                iVar16 = (char *)struct_unk_.textIndexies;
                pbVar12 = (byte *)(txt + iVar11);
                bVar10 = *pbVar12;
                while( true ) {
                  if (iVar16[bVar10 - ' '] != '+') {
                    pcStack_40 = iVar16;
                    iStack_3c = iVar11;
                    iVar11 = GetCharWidthScaled(font,bVar10,scaleX);
                    iVar15 += iVar11;
                    iVar11 = iStack_3c;
                    iVar16 = pcStack_40;
                  }
                  pbVar12 = pbVar12 + 1;
                  bVar10 = *pbVar12;
                  if (bVar10 == 0) break;
                  if (bVar10 == ' ') {
                    bVar4 = iStack_64 < iVar15;
                    goto LAB_800b4a5c;
                  }
                  if (bVar10 == 10) break;
                  bVar10 = *pbVar12;
                }
              }
              bVar4 = iStack_64 < iVar15;
LAB_800b4a5c:
              if (bVar4) {
                posY += iStack_50;
                posX = iStack_60;
              }
              goto LAB_800b4d2c;
            }
          }
          iVar11 = iStack_3c + 1;
        }
LAB_800b4d2c:
        pbVar13 = pbVar13 + 1;
        if (*pbVar13 == 0) break;
        bVar10 = *pbVar13;
      } while( true );
    }
    iStack_5c = (posY + iStack_50) - iStack_5c;
  }
  return iStack_5c;
}

void Font::PrintCharaWapper
               (FontStruct *param_1,Gfx **param_2,uint param_3,u32 param_4,int param_5,short param_6
               ,short param_7,short param_8,short param_9){
  PrintChara(param_1,param_2,(u8)param_3,param_4,param_5,param_6,param_7,param_8,param_9,
             param_1->scale,param_1->scale);
}

void Font::PrintChara(FontStruct *fontP,Gfx **gg,u8 chara,s32 param_4,int param_5,short param_6,
                     short param_7,short param_8,short param_9,float param_10,float param_11)

{
  byte bVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  ushort uVar5;
  short sVar6;
  Gfx *pGVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  Color32 col;
  
  bVar1 = struct_unk_.textIndexies[chara - ' '];
  bVar2 = fontP->substruct0[fontP->fontIndex].rows;
  iVar8 = 0;
  iVar9 = 0;
  sVar3 = fontP->charW;
  iVar10 = 0;
  uVar4 = fontP->charH;
  iVar11 = 0;

  if (fontP->currFont == NULL) return;
  if (bVar1 == '+') return;
  if (chara == '\n') return;
  if (param_5 < param_7) {
    iVar8 = ((param_7 - param_5) / param_11);
    uVar5 = fontP->charH;
LAB_800b4ef8:
    if (param_9 < (param_5 + (uint)uVar5)) {
      iVar9 = (((param_5 + (uint)uVar5) - param_9) / param_11);
    }
  }
  else if (param_9 < (param_5 + (uint)uVar4)) {
    uVar5 = fontP->charH;
    goto LAB_800b4ef8;
  }
  if (param_4 < param_6) {
    iVar10 = ((param_6 - param_4) / param_10);
    uVar5 = fontP->kerning[bVar1];
  }
  else {
    if ((param_4 + (uint)fontP->kerning[bVar1]) <= param_8)
    goto LAB_800b4f9c;
    uVar5 = fontP->kerning[bVar1];
  }
  if (param_8 < (param_4 + (uint)uVar5)) {
    iVar11 = (((param_4 + (uint)uVar5) - param_8) / param_10);
  }
LAB_800b4f9c:
  if ((iVar10 < ((uint)fontP->kerning[bVar1] - iVar11)) &&
     (iVar8 < ((uint)uVar4 - iVar9))) {
    col.R = (fontP->col).R;
    col.G = (fontP->col).G;
    col.B = (fontP->col).B;
    if ('~' < chara) GetButtonColor(chara -0x7F,&col.R,&col.G,&col.B);
    sVar3 = ((ushort)bVar1 / (ushort)bVar2) * sVar3;
    sVar6 = ((ushort)bVar1 % (ushort)bVar2) * uVar4;
    pGVar7 = N64BorgImageDraw(*gg,fontP->currFont,(param_4 + iVar10),(param_5 + iVar8)
                              ,sVar3 + (short)iVar10,sVar6 + (short)iVar8,
                              (fontP->kerning[bVar1] + sVar3) - (short)iVar11,
                              (sVar6 + uVar4) - (short)iVar9,param_10,param_11,col.R,col.G,col.B,
                              (fontP->col).A);
    *gg = pGVar7;
  }
}

int Font::GetWidth(FontStruct *param_1,char *txt){
  return GetWidthScaled(param_1,txt,param_1->scale);
}

int Font::GetWidthScaled(FontStruct *font,char *txt,float scale){
  int w = 0;
  if (font->currFont) {
    while(*txt) {
      u8 c = *txt;
      if ((struct_unk_.textIndexies[c - ' '] != 43) && (c != '\n'))
          w += (font->kerning[struct_unk_.textIndexies[c - ' ']] * scale);
      txt++;
    }
    return w;
  }
  return 0;
}


u16 Font::GetCharWidth(FontStruct *param_1,u8 chara){
  if (param_1->currFont == NULL) return 0;
  if ((struct_unk_.textIndexies[chara - ' '] != 43) && (chara != '\n')) {
    return param_1->kerning[struct_unk_.textIndexies[chara - ' ']];
  }
  return 0;
}


int Font::GetCharWidthScaled(FontStruct *param_1,char chara,float scale){
  if (param_1->currFont == NULL) return 0;
  if ((struct_unk_.textIndexies[(byte)chara - ' '] != 43) && (chara != '\n')) {
    return (param_1->kerning[struct_unk_.textIndexies[(byte)chara - ' ']] * scale);
  }
  return 0;
}



int Font::GetHeight(FontStruct *f,char *str,int h,int w){
  return GetHeightScaled(f,str,h,w,f->scale,f->scale);
}


int Font::GetHeightScaled(FontStruct *font,char *str,int h,int w,float scaleX,float scaleY){
  int iVar1;
  int iVar2;
  byte bVar3;
  int iVar4;
  byte *pbVar5;
  byte *pbVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  
  iVar8 = 0;
  iVar4 = 0;
  if ((font->currFont != NULL) && (str != NULL)) {
    if (w <= h) return 0;
    if (*str != '\0') {
      iVar9 = ((ushort)font->charH * scaleY + 2.0f);
      bVar3 = *str;
      iVar7 = h;
      pbVar6 = (byte *)str;
      do {
        iVar1 = GetCharWidthScaled(font,bVar3,scaleX);
        if (*pbVar6 == '\n') {
          iVar4 += iVar9;
          iVar7 = h;
LAB_800b5488:
          bVar3 = pbVar6[1];
        }
        else {
          if (struct_unk_.textIndexies[*pbVar6 - ' '] == 43) goto LAB_800b5488;
          if (*pbVar6 != ' ') {
            iVar7 += iVar1;
            goto LAB_800b5488;
          }
          if (iVar7 == h) goto LAB_800b5488;
          iVar7 += iVar1;
          if (w < iVar7) {
LAB_800b5474:
            iVar4 += iVar9;
            iVar7 = h;
            goto LAB_800b5488;
          }
          bVar3 = pbVar6[1];
          iVar1 = iVar7;
          if (((bVar3 != 0) && (bVar3 != ' ')) && (bVar3 != '\n')) {
            pbVar5 = (byte *)(str + iVar8 + 1);
            bVar3 = *pbVar5;
            while( true ) {
              if (struct_unk_.textIndexies[bVar3 - ' '] != 43) {
                iVar2 = GetCharWidthScaled(font,bVar3,scaleX);
                iVar1 += iVar2;
              }
              pbVar5 = pbVar5 + 1;
              bVar3 = *pbVar5;
              if (((bVar3 == 0) || (bVar3 == ' ')) || (bVar3 == '\n')) break;
              bVar3 = *pbVar5;
            }
          }
          if (w < iVar1) goto LAB_800b5474;
          bVar3 = pbVar6[1];
        }
        pbVar6 = pbVar6 + 1;
        iVar8 += 1;
        if (bVar3 == 0) {
          return iVar4 + iVar9;
        }
        bVar3 = *pbVar6;
      } while( true );
    }
  }
  return 0;
}

//scan image for character sizes
u8 Font::SetupBorg8(FontStruct *font,Borg8Header *param_2,u16 *sizes,u16 rows,u16 cols){
  u8 uVar1;
  u16 uVar3;
  uint charW;
  uint charH;
  byte bVar7;
  uint rows32_;
  ushort uVar8;
  int iVar9;
  uint rows32;
  uint cols32;
  ushort *sizeOut;
  int iVar13;
  u16 uVar14;
  int i;
  byte bVar16;
  int iVar17;
  ushort uVar18;
  uint uVar19;
  
  charW = (uint)(param_2->dat).Width / (uint)cols;
  charH = (uint)(param_2->dat).Height / (uint)rows;

  if (8 < ((param_2->dat).format - 1)) return false;
  cols32 = (uint)cols;
  rows32_ = (uint)rows;
  rows32 = (uint)rows;
  uVar19 = (uint)(param_2->dat).Width;
  uVar18 = (ushort)charW;
  switch((param_2->dat).format) {
  case BORG8_RBGA32:
  //32-bit image
    i = 0;
    if (0 < (int)(rows32 * cols32)) {
      Color32* p32 = (Color32 *)(param_2->dat).offset;
      iVar9 = 0;
      uVar14 = 0 % rows32;
      do {
        sizeOut = sizes + i;
        *sizeOut = uVar18;
        iVar9 = iVar9 * charW + uVar19 * uVar14 * charH;
        i++;
        uVar14 = charW;
        if (p32[iVar9 + charW + -1].W == p32[iVar9 + charW].W) {
          do {
            uVar14--;
          } while (p32[iVar9 + uVar14 + -1].W == p32[iVar9 + charW].W);
          *sizeOut = (ushort)uVar14;
        }
        iVar9 = i / (int)rows32;
        uVar14 = i % (int)rows32_;
      } while (i < (int)(rows32 * cols32));
      return true;
    }
    break;
  case BORG8_RGBA16:
  case 3:
  //16-bit image
    i = 0;
    if (0 < (int)(rows32_ * cols32)) {
      u16* p16 = (u16 *)(param_2->dat).offset;
      iVar9 = 0;
      uVar14 = 0 % rows32;
      do {
        sizeOut = sizes + i;
        *sizeOut = uVar18;
        iVar9 = iVar9 * charW + uVar19 * uVar14 * charH;
        uVar3 = p16[iVar9 + charW];
        i++;
        if (p16[iVar9 + charW + -1] == uVar3) {
          uVar8 = *sizeOut;
          while (*sizeOut = uVar8 - 1, p16[iVar9 + (u16)(uVar8 - 1) + -1] == uVar3) {
            uVar8 = *sizeOut;
          }
        }
        iVar9 = i / (int)rows32;
        uVar14 = i % (int)rows32;
      } while (i < (int)(rows32_ * cols32));
      return true;
    }
    break;
  default:
  //8-bit image
    i = 0;
    if (0 < (int)(rows32 * cols32)) {
      u8* p8 = (u8 *)(param_2->dat).offset;
      iVar9 = 0;
      uVar14 = 0 % rows32;
      do {
        sizeOut = sizes + i;
        *sizeOut = uVar18;
        iVar9 = iVar9 * charW + uVar19 * uVar14 * charH;
        uVar1 = p8[iVar9 + charW + -1];
        i += 1;
        if (p8[iVar9 + charW + -1] == uVar1) {
          uVar8 = *sizeOut;
          while (*sizeOut = uVar8 - 1, p8[iVar9 + (u16)(uVar8 - 1) + -1] == uVar1) {
            uVar8 = *sizeOut;
          }
        }
        iVar9 = i / (int)rows32;
        uVar14 = i % (int)rows32_;
      } while (i < (int)(rows32 * cols32));
      return true;
    }
    break;
  case BORG8_CI4:
  case 8:
  case 9:
  //4-bit image
    i = (uint)rows * (uint)cols;
    if (0 < i) {
      u8* p4 = (u8 *)(param_2->dat).offset;
      iVar9 = 0;
      rows32_ = 0 % rows32;
      iVar13 = 0;
      do {
        sizes[iVar13] = uVar18;
        iVar9 = iVar9 * charW + uVar19 * rows32_ * charH;
        iVar17 = iVar13 + 1;
        bVar16 = p4[charW] & 7;
        bVar7 = bVar16;
        while (sizeOut = sizes + iVar13, bVar7 == bVar16) {
          uVar8 = *sizeOut - 1;
          *sizeOut = uVar8;
          rows32_ = uVar8 - 1;
          if ((p4[iVar9 + (uint)uVar8 + -1] >> 4 & 7) != bVar16) break;
          *sizeOut = (u16)rows32_;
          bVar7 = p4[iVar9 + (u16)rows32_ + -1] >> 4 & 7;
        }
        iVar9 = iVar17 / (int)rows32;
        rows32_ = iVar17 % (int)rows32;
        iVar13 = iVar17;
      } while(iVar17<i);
      return true;
    }
  }
  return true;
}



