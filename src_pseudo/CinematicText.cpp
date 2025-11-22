#include "globals.h"
#include "stringDecrypt.h"
#define FILENAME "./src/cinematictext.cpp"

cinematictext_struct *gCinematicTextP=NULL;
u32 cinematic_runtime=0;

WidgetText *Ofunc_8005d330(char *txt,s16 len,u16 x,u16 y,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a){
    WidgetText* w =  new WidgetText(txt,len);
    w->SetCoords(x,y);
    w->SetSomeBounds(y,x,x1,y1);
    w->SetColor(r,g,b,a);
    return w;
  }
  
namespace CinematicText{
    
void Init(char *name){
  ALLOC(gCinematicTextP,86);
  if (gCinematicTextP) {
    CLEAR(gCinematicTextP);
    if (name) strcpy(gCinematicTextP->AlaronName,name);
    gCinematicTextP->showCaptionTimer = 0;
    gCinematicTextP->runtime = 0xffff;
    u16 uStack144[4]={0,200,300,230};
    Color32 acStack80={COLOR_OFFWHITE2};
    gCinematicTextP->widget = new WidgetCinematicText(&uStack144,0x19,5,&acStack80,1);
    AllocPointer8();
  }
}

void Free(void){
  if (gCinematicTextP) {
    FreePointer8();
    if (gCinematicTextP->widget) gCinematicTextP->widget->~WidgetCinematicText();
    FREE(gCinematicTextP,0x71);
  }
}

void SetText(char *txt,int time){
  if (((txt) && (time)) && (gCinematicTextP)) {
    gCinematicTextP->widget->SetText(txt);
    gCinematicTextP->showCaptionTimer = time;
  }
}

void Render(Gfx **GG,int delta){
  Gfx *pGVar2;
  int iVar3;
  
  if (gCinematicTextP) {
    gCinematicTextP->widget->Tick();
    iVar3 = gCinematicTextP->showCaptionTimer - delta;
    pGVar2 = *GG;
    if (iVar3 < 0) gCinematicTextP->showCaptionTimer = 0;
    else {
      RSPFUNC6(pGVar2);
      fadeFloatMirror = 1.0f;
      pGVar2 = gCinematicTextP->widget->Render(pGVar2,FULL_SCREENSPACE);
      gCinematicTextP->showCaptionTimer-= delta;
    }
    NOOP_8005d704(iVar3);
    *GG = pGVar2;
  }
}

void ResetTimer(void){
  if (gCinematicTextP) gCinematicTextP->showCaptionTimer = 0;
}

void NOOP_8005d704(s16 x){}

bool StringEquals(char *param_1,char *alaron){
  char cVar1 = *alaron;
  while( true ) {
    if (cVar1 == '\0') return true;
    alaron++;
    if (cVar1 != *param_1) break;
    cVar1 = *alaron;
    param_1++;
  }
  return false;
}


void InsertPlayerName(char *param_1,char *param_2,char *newname,char *alaron){  
  u8 uVar2 = strlen(alaron);
  u8 uVar3 = strlen(newname);
  char cVar1 = *param_2;
  while (cVar1) {
    if (StringEquals(param_2,alaron)) {
      strcpy(param_1,newname);
      param_1+= uVar3;
      param_2+= uVar2;
    }
    else {
      cVar1 = *param_2;
      param_2++;
      *param_1 = cVar1;
      param_1++;
    }
    cVar1 = *param_2;
  }
  *param_1 = '\0';
}

void NextLine(void){
  char acStack_310 [256];
  char acStack_210 [256];
  char acStack_110 [272];
  
  if (gCinematicTextP->runtime <= cinematic_runtime) {
    strcpy(acStack_310,gCinematicTextP->nextCaption);
    strcpy(acStack_110,gCinematicTextP->AlaronName);
    InsertPlayerName(acStack_210,gCinematicTextP->nextCaption,acStack_110,"Alaron");
    uppercase(acStack_110);
    InsertPlayerName(acStack_310,acStack_210,acStack_110,"ALARON");
    SetText(acStack_310,(u32)gCinematicTextP->captionTime);
    LoadNextLine();
  }
}

void ClearRuntime(void){cinematic_runtime = 0;}

void IncRuntime(int param_1){cinematic_runtime+= param_1;}

void LoadNextLine(void){
  u16 uVar1;
  u16 uVar2;
  u16 (*pauVar3) [3];
  cinematictext_struct *pcVar4;
  u32 len;
  int len_00;
  u8 auStack_418 [512];
  s16 sStack_218;
  s16 sStack_216;
  undefined1 auStack_214 [508];
  u32 auStack_18 [6];
  
  pcVar4 = gCinematicTextP;
  if (gCinematicTextP->caption_index < gCinematicTextP->caption_scene_max) {
    pauVar3 = gCinematicTextP->shortsPointer;
    uVar1 = (*pauVar3)[0];
    gCinematicTextP->shortsPointer = (u16 (*) [3])(*pauVar3 + 2);
    uVar2 = (*pauVar3)[2];
    pcVar4->shortsPointer = pauVar3 + 1;
    auStack_18[0] = 0;
    len = uVar2 + 1 & 0xfffe;
    ROMCOPYS(auStack_418,cinematic_text + uVar1,len,0x107);
    decompress_LZ01(auStack_418,len,(u8 *)&sStack_218,auStack_18);
    len_00 = (auStack_18[0] & 0xffff) - 4;
    memcpy(gCinematicTextP->nextCaption,auStack_214,len_00);
    decrypt_string(gCinematicTextP->nextCaption,0x10,0x103,(s16)len_00);
    pcVar4 = gCinematicTextP;
    gCinematicTextP->runtime = sStack_218 << 1;
    pcVar4->captionTime = (sStack_216 - sStack_218) * 2;
    pcVar4->caption_index = pcVar4->caption_index + 1;
  }
  else gCinematicTextP->runtime = -1;
}

void AllocPointer8(void){
  u16 uVar1;
  cinematictext_struct *pcVar2;
  
  void* pauVar3 = HALLOC(0x210,285);
  pcVar2 = gCinematicTextP;
  gCinematicTextP->field2_0x8 = pauVar3;
  pcVar2->shortsPointer = pauVar3;
  ROMCOPYS(pcVar2->shortsPointer,cinematic_text_dat,0x210,287);
  pcVar2 = gCinematicTextP;
  uVar1 = (*gCinematicTextP->shortsPointer)[0];
  gCinematicTextP->shortsPointer = (u16 (*) [3])(*gCinematicTextP->shortsPointer + 1);
  pcVar2->caption_index = 0;
  pcVar2->caption_scene_max = 0;
  pcVar2->field4_0x10 = uVar1;
}

void FreePointer8(void){
  FREE(gCinematicTextP->field2_0x8,297);
}

void Sequence(u32 param_1){
  u16 uVar1;
  cinematictext_struct *pcVar2;
  u16 (*pauVar3) [3];
  u16 uVar4;
  u32 uVar5;
  
  pcVar2 = gCinematicTextP;
  if ((param_1 != 0xffff) && (param_1 <= gCinematicTextP->field4_0x10)) {
    uVar5 = 0;
    gCinematicTextP->shortsPointer = (u16 (*) [3])(gCinematicTextP->field2_0x8 + 2);
    if (param_1 != 0) {
      do {
        uVar4 = 0;
        uVar5 += 1;
        uVar1 = (*pcVar2->shortsPointer)[0];
        pcVar2->shortsPointer = (u16 (*) [3])(*pcVar2->shortsPointer + 1);
        if (uVar1 != 0) {
          pauVar3 = pcVar2->shortsPointer;
          do {
            uVar4 += 1;
            pauVar3 = pauVar3 + 1;
          } while (uVar4 < uVar1);
          pcVar2->shortsPointer = pauVar3;
        }
      } while (uVar5 < param_1);
    }
    pcVar2 = gCinematicTextP;
    uVar1 = (*gCinematicTextP->shortsPointer)[0];
    gCinematicTextP->shortsPointer = (u16 (*) [3])(*gCinematicTextP->shortsPointer + 1);
    pcVar2->caption_index = 0;
    pcVar2->caption_scene_max = uVar1;
    LoadNextLine();
    cinematic_runtime = 0;
  }
}
}