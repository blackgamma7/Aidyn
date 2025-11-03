#include "widgets/credits.h"
#include "globals.h"
#include "romstring.h"

#ifdef DEBUGVER
#define CreditsSpeed 5
#else
#define CreditsSpeed 2
#endif

u32 DAT_800ed510=0;
extern void* romstring_credits;
WidgetCredits::WidgetCredits():WidgetMenu(){
  short sVar1;
  ulong uVar8;
  BaseWidget *pBVar9;
  ulong uVar10;
  Borg12Header *pBVar11;
  u16 uVar12;
  u8 *puVar12;
  byte *pbVar13;
  ushort posY;
  u8 uVar14;
  float fVar15;

  this->unk8a = 5;
  this->creditState = 0;
  this->clipText = NULL;
  this->unk88 = 1;

  uVar14 = 0;
  u8 credits_linebreaks[]={
    0,1,4,6,8,10,12,14,16,18,20,22,24,19,36,38,44,52,58,
    60,68,76,77,79,82,84,86,89,92,96,111,112,116,0};
  char** creditStrings = RomString::Load(romstring_credits,1776);
  for(u16 count=0;count<128;count++){
    WidgetClipText* pBVar7 = WClipTXT(creditStrings[count]);
    this->Link(pBVar7);
    pBVar7->SetColor(0xe1,0xe1,0,0xff);
    pBVar7->SetCoords((short)((int)(SCREEN_WIDTH - pBVar7->GetWidth()) / 2),SCREEN_HEIGHT);
    pBVar7->SetSomeBounds(pBVar7->posY,0,SCREEN_WIDTH,pBVar7->posY + pBVar7->GetHeight());
    uVar14++;
    uVar12 = (ushort)pBVar7->posY + pBVar7->GetHeight();
    posY = (ushort)uVar12;
    if (count != credits_linebreaks[uVar14]) {
      do {
        posY = (ushort)uVar12;
        if (128 < count) break;
        pBVar9 = WClipTXT(creditStrings[count]);
        pBVar9->SetColor(0xe1,0xe1,0xe1,0xff);
        pBVar9->SetCoords(((SCREEN_WIDTH - pBVar9->GetWidth()) / 2),posY);
        pBVar7->Link(pBVar9);
        uVar12 += pBVar9->GetHeight();
        posY = (ushort)uVar12;
        count++;
        pBVar9->SetSomeBounds(pBVar9->posY,0,SCREEN_WIDTH,posY);
      } while (count != credits_linebreaks[uVar14]);
    }
    pBVar7->varU8 = (byte)count;
    pBVar7->varU16 = posY - pBVar7->posY;
}
 this->clipText = WClipTXT(creditStrings[0x81]);
 this->clipText->SetColor(0xff,0xff,0xff,0);
 this->clipText->SetCoords((SCREEN_WIDTH - this->clipText->GetWidth()) / 2,((SCREEN_HEIGHT - this->clipText->GetHeight()) / 2));
 RomString::Free(creditStrings);
 pBVar11 = gGlobals.gameVars.BGM;
 this->BGMVol = gGlobals.VolBGM;
 this->field5_0x80 = this->child;
 this->SFXVol = gGlobals.VolSFX;
 gGlobals.VolBGM = 0.0;
 gGlobals.VolSFX = 0.0;
 if (gGlobals.gameVars.BGM) DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,0);
 this->bgm = load_borg_12(BORG12_Intro_NoExp);
 DCM::Add((byte *)&this->indecies0,(s32 *)&this->indecies1,&this->bgm->dat->sub,this->BGMVol * 255.0f,0x80,1,-1,0);
}

WidgetCredits::~WidgetCredits(){
  gGlobals.VolBGM = this->BGMVol;
  gGlobals.VolSFX = this->SFXVol;
  if (gGlobals.gameVars.BGM) DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,gGlobals.VolBGM * 255.0f);
  if (this->clipText){
    this->Unlink(this->clipText);
    if (this->clipText) this->clipText->~BaseWidget();
  }
  DCM::Remove(*this->indecies0,*this->indecies1);
  free_borg_12(this->bgm);
  WidgetMenu::~WidgetMenu();
}

Gfx* WidgetCredits::Render(Gfx* g, u16 x0,u16 y0,u16 x1, u16 y1){RENDERCHILDREN();}

u8 WidgetCredits::Tick(){
  switch(this->creditState){
    case 0: State0();break;
    case 1: State1();break;
    case 2: State2();break;
    case 3: State3();break;
  }
  if (gPlayer) {
    ProcessAudioBubbles(&gGlobals.SFXStruct,&((gPlayer)->collision).pos,gGlobals.delta);
  }
  return TickChildren();
}

void WidgetCredits::State0(){this->creditState++;}

void WidgetCredits::State1(){
  BaseWidget *pBVar2;
  float fVar3;
  char cVar4;
  
  pBVar2 = this->field5_0x80;
  this->col.A = (this->field5_0x80->col).A;
  if (this->field5_0x80->posY < SCREEN_HEIGHT) {
    if (this->unk89 == 0) {
      if ((u8)(gGlobals.delta * CreditsSpeed) << 1 < this->col.A) {
        this->col.A+= gGlobals.delta * CreditsSpeed * -2;
      }
      else this->col.A = 0;
    }
    else {
      if (this->col.A < (u8)((u8)(gGlobals.delta * CreditsSpeed) * -2)) {
        this->col.A += (u8)(gGlobals.delta * CreditsSpeed) << 1;
      }
      else {
        this->col.A = 0xff;
        if (this->unk88 == 0) this->unk89 = 0;
        else this->unk88--;
      }
    }
  }
  else {
    Utilities::MoveWidget(this->field5_0x80,0,((this->field5_0x80->varU16 + SCREEN_HEIGHT) >> 1));
    this->col.A = 0;
    this->unk89 = 1;
    this->unk88 = 10.0f / gGlobals.delta;
  }
  Utilities::SetAlpha(this->field5_0x80,this->col.A);
  if (this->col.A == 0) {
    if (this->unk89 == 0) {
      this->field5_0x80 = this->field5_0x80->siblingR;
    }
  }
  if (this->field5_0x80->varU8 == 0x1d) {
    this->unk88 = 1;
    this->creditState++;
  }

}

void WidgetCredits::State2(){
  BaseWidget *pBVar1;
  byte bVar2;
  BaseWidget *pBVar3;
  
  bVar2 = this->unk88 - 1;
  if (this->unk88 == 0) {
    pBVar3 = this->field5_0x80;
    if ((int)((int)pBVar3->posY + (uint)pBVar3->varU16) < 0) {
      this->field5_0x80 = pBVar3->siblingR;
      pBVar3 = this->field5_0x80;
    }
    if (pBVar3 == NULL) {
      this->creditState++;
      bVar2 = 1;
    }
    else {
      pBVar1 = pBVar3->siblingL;
      if ((pBVar1 == NULL) || (bVar2 = 1, (int)((int)pBVar1->posY + (uint)pBVar1->varU16 + 0x20) < SCREEN_HEIGHT)
         ) {
        do {
          bVar2 = this->unk8a;
          while( true ) {
            Utilities::MoveWidget(pBVar3,0,-(ushort)bVar2);
            pBVar3 = pBVar3->siblingR;
            bVar2 = 1;
            if (pBVar3 == NULL) goto LAB_800340fc;
            pBVar1 = pBVar3->siblingL;
            if (pBVar1 == NULL) break;
            if (0xef < (int)((int)pBVar1->posY + (uint)pBVar1->varU16 + 0x20)) {
              bVar2 = 1;
              goto LAB_800340fc;
            }
            bVar2 = this->unk8a;
          }
        } while( true );
      }
    }
  }
LAB_800340fc:
  this->unk88 = bVar2;
  return;
}


void WidgetCredits::State3(){
  byte bVar1;
  u8 uVar2;
  BaseWidget *pBVar4;
  float fVar5;
  char cVar6;
  
  if (gGlobals.creditsByte == 2) {
    if (DAT_800ed510 == 0) {
      this->Link(this->clipText);
      this->unk88 = SCREEN_HEIGHT;
      this->unk89 = 1;
      DAT_800ed510 = 1;
    }
    if (this->unk89 == 0) {
      if (this->unk88 == 0) {
        if ((u8)(gGlobals.delta * CreditsSpeed) < (this->clipText->col).A)
          (this->clipText->col).A -= gGlobals.delta * CreditsSpeed;
        else {
          (this->clipText->col).A = 0;
          this->creditState++;
          Sky::ResetColors();
          DAT_800ed510 = 0;
        }
      }
      else this->unk88--;
    }
    else {
      if ((this->clipText->col).A < (0xff - (u8)(gGlobals.delta * CreditsSpeed))) {
        (this->clipText->col).A+= gGlobals.delta * CreditsSpeed;
      }
      else {
        (this->clipText->col).A = 0xff;
        this->unk89 = 0;
      }
    }
  }
  else this->creditState++;
}

BaseWidget* WidgetCredits::BFunc(){
      if (gGlobals.creditsByte != 2) this->creditState = 4;
      return NULL;
}

BaseWidget* WidgetCredits::AFunc(){return this->BFunc();}

BaseWidget* WidgetCredits::StartFunc(){return this->BFunc();}

u32 WidgetCredits::GetNumber(){return WidgetN_Other;}