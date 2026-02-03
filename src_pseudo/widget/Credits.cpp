#include "widgets/credits.h"
#include "globals.h"
#include "romstring.h"

#if DEBUGVER
#define CreditsSpeed 5
#else
#define CreditsSpeed 2
#endif

u32 DAT_800ed510=false;
extern void* romstring_credits;
WidgetCredits::WidgetCredits():WidgetMenu(){
  u16 uVar12;
  u16 yOff;
  u8 uVar14;

  #if DEBUGVER
  this->scrollSpeed = 5;
  #else
  this->scrollSpeed = 1;
  #endif
  this->creditState = 0;
  this->THEEND = NULL;
  this->timer = 1;

  uVar14 = 0;
  u8 credits_linebreaks[]={
    0,1,4,6,8,10,12,14,16,18,20,22,24,19,36,38,44,52,58,
    60,68,76,77,79,82,84,86,89,92,96,111,112,116,0};
  char** creditStrings = RomString::Load(romstring_credits,1776);
  for(u16 count=0;count<128;count++){
    WidgetClipText* pBVar7 = WClipTXT(creditStrings[count]);
    this->Link(pBVar7);
    pBVar7->SetColor(0xe1,0xe1,0,0xff);
    pBVar7->SetCoords((s16)((int)(SCREEN_WIDTH - pBVar7->GetWidth()) / 2),SCREEN_HEIGHT);
    pBVar7->SetBounds(pBVar7->posY,0,SCREEN_WIDTH,pBVar7->posY + pBVar7->GetHeight());
    uVar14++;
    uVar12 = (u16)pBVar7->posY + pBVar7->GetHeight();
    yOff = (u16)uVar12;
    if (count != credits_linebreaks[uVar14]) {
      do {
        yOff = (u16)uVar12;
        if (128 < count) break;
        WidgetClipText*w = WClipTXT(creditStrings[count]);
        w->SetColor(0xe1,0xe1,0xe1,0xff);
        w->SetCoords(((SCREEN_WIDTH - w->GetWidth()) / 2),yOff);
        pBVar7->Link(w);
        uVar12 += w->GetHeight();
        yOff = (u16)uVar12;
        count++;
        w->SetBounds(w->posY,0,SCREEN_WIDTH,yOff);
      } while (count != credits_linebreaks[uVar14]);
    }
    pBVar7->varU8 = (u8)count;
    pBVar7->varU16 = yOff - pBVar7->posY;
}
 this->THEEND = WClipTXT(creditStrings[0x81]);
 this->THEEND->SetColor(0xff,0xff,0xff,0);
 this->THEEND->SetCoords((SCREEN_WIDTH - this->THEEND->GetWidth()) / 2,((SCREEN_HEIGHT - this->THEEND->GetHeight()) / 2));
 RomString::Free(creditStrings);
 this->BGMVol = gGlobals.VolBGM;
 this->currChild = this->child;
 this->SFXVol = gGlobals.VolSFX;
 gGlobals.VolBGM = 0.0;
 gGlobals.VolSFX = 0.0;
 if (gGlobals.gameVars.BGM) DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,0);
 this->bgm = loadBorg12(BORG12_Intro_NoExp);
 DCM::Add(&this->bgmIndex,&this->bgmID,&this->bgm->dat->sub,this->BGMVol * 255.0f,0x80,1,-1,0);
}

WidgetCredits::~WidgetCredits(){
  gGlobals.VolBGM = this->BGMVol;
  gGlobals.VolSFX = this->SFXVol;
  if (gGlobals.gameVars.BGM) DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,gGlobals.VolBGM * 255.0f);
  if (this->THEEND){
    this->Unlink(this->THEEND);
    if (this->THEEND) this->THEEND->~BaseWidget();
  }
  DCM::Remove(this->bgmIndex,this->bgmID);
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
    ProcessAudioBubbles(&gGlobals.SFXStruct,&gPlayer->collision.pos,gGlobals.delta);
  }
  return TickChildren();
}

void WidgetCredits::State0(){this->creditState++;}

void WidgetCredits::State1(){
  BaseWidget *pBVar2 = this->currChild;
  this->col.A = (this->currChild->col).A;
  if (this->currChild->posY < SCREEN_HEIGHT) {
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
        if (this->timer == 0) this->unk89 = 0;
        else this->timer--;
      }
    }
  }
  else {
    Utilities::MoveWidget(this->currChild,0,((this->currChild->varU16 + SCREEN_HEIGHT) >> 1));
    this->col.A = 0;
    this->unk89 = 1;
    #if DEBUGVER
    this->timer = 10.0f / gGlobals.delta;
    #else
    this->timer = 120.0f / gGlobals.delta;
    #endif
  }
  Utilities::SetAlpha(this->currChild,this->col.A);
  if (this->col.A == 0) {
    if (this->unk89 == 0) {
      this->currChild = this->currChild->siblingR;
    }
  }
  if (this->currChild->varU8 == 0x1d) {
    this->timer = 1;
    this->creditState++;
  }

}

void WidgetCredits::State2(){
  BaseWidget *pBVar1;
  u8 bVar2;
  BaseWidget *pBVar3;
  
  bVar2 = this->timer - 1;
  if (this->timer == 0) {
    pBVar3 = this->currChild;
    if ((int)((int)pBVar3->posY + (u32)pBVar3->varU16) < 0) {
      this->currChild = pBVar3->siblingR;
      pBVar3 = this->currChild;
    }
    if (pBVar3 == NULL) {
      this->creditState++;
      bVar2 = 1;
    }
    else {
      pBVar1 = pBVar3->siblingL;
      if ((pBVar1 == NULL) || (bVar2 = 1, (int)((int)pBVar1->posY + (u32)pBVar1->varU16 + 0x20) < SCREEN_HEIGHT)
         ) {
        do {
          while( true ) {
            Utilities::MoveWidget(pBVar3,0,-this->scrollSpeed);
            pBVar3 = pBVar3->siblingR;
            bVar2 = 1;
            if (pBVar3 == NULL) goto LAB_800340fc;
            pBVar1 = pBVar3->siblingL;
            if (pBVar1 == NULL) break;
            if (0xef < (int)((int)pBVar1->posY + (u32)pBVar1->varU16 + 0x20)) {
              bVar2 = 1;
              goto LAB_800340fc;
            }
          }
        } while( true );
      }
    }
  }
LAB_800340fc:
  this->timer = bVar2;
  return;
}


void WidgetCredits::State3(){
  u8 bVar1;
  u8 uVar2;
  BaseWidget *pBVar4;
  float fVar5;
  char cVar6;
  
  if (gGlobals.creditsByte == 2) {
    if (!DAT_800ed510) {
      this->Link(this->THEEND);
      this->timer = 240;
      this->unk89 = 1;
      DAT_800ed510 = true;
    }
    if (this->unk89 == 0) {
      if (this->timer == 0) {
        if ((u8)(gGlobals.delta * CreditsSpeed) < (this->THEEND->col).A)
          (this->THEEND->col).A -= gGlobals.delta * CreditsSpeed;
        else {
          (this->THEEND->col).A = 0;
          this->creditState++;
          Sky::ResetColors();
          DAT_800ed510 = false;
        }
      }
      else this->timer--;
    }
    else {
      if ((this->THEEND->col).A < (0xff - (u8)(gGlobals.delta * CreditsSpeed))) {
        (this->THEEND->col).A+= gGlobals.delta * CreditsSpeed;
      }
      else {
        (this->THEEND->col).A = 0xff;
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