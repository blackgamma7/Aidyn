#include "widgets/InputMenu.h"
#include "globals.h"

#define FILENAME "./menus/inputmenu.cpp"

InputMenu::InputMenu(char* txt):WidgetMenu(){InitMenu(txt);}

InputMenu::~InputMenu(){
  InputWidgetSubStruct *sub = (InputWidgetSubStruct *)this->substruct;
  FREEPTR(sub->entry,48)
  delete(sub);
  this->substruct = NULL;
  WidgetMenu::~WidgetMenu();
}

void InputMenu::InitMenu(char *txt){  
  this->col.R = 0x96;
  this->col.G = 0x96;
  this->col.B = 0x96;
  this->unk7c = 5;
  InputWidgetSubStruct *sub = new InputWidgetSubStruct;
  this->substruct = sub;
  sub->entryIndex = 0;
  this->LeftButtonFunc = InputMenu_LeftButton;
  this->RightButtonFunc = InputMenu_RightButton;
  this->UpButtonFunc = InputMenu_UpButton;
  this->DownButtonFunc = InputMenu_DownButton;
  this->AButtonFunc = InputMenu_AButton;
  this->BButtonFunc = InputMenu_BButton;
  this->StartButtonFunc = InputMenu_StartButton;
  WidgetBorg8* title = WidgetB8(BORG8_TitleEnterName);
  title->SetCoords(SCREEN_CENTERW - (title->GetWidth() >> 1),50);
  this->Link(title);
  char keys[]="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789<>|*_^\"'()!- ~`\\\0";
  sub->arrayMenu = new WidgetArrayMenu(strlen(keys));
  sub->arrayMenu->SetCoords(60,110);
  sub->arrayMenu->boundX0 = 60;
  sub->arrayMenu->boundX1 = 260;
  if (gGlobals.BigAssMenu == NULL) sub->arrayMenu->SetColor(0xe1,0xe1,0xe1,this->col.A);
  else sub->arrayMenu->SetColor(0x82,0x50,0x50,this->col.A);
  ((WAMSub*)sub->arrayMenu->substruct)->rowSize=13;
  u8* keyP=(u8*)&keys;
  while (*keyP) {
    sprintf(gGlobals.text,"%c",*keyP);
    WidgetClipText* entry = WClipTXT(gGlobals.text);
    u8 bVar1 = *keyP;
    keyP++;
    entry->varU16 = bVar1;
    sub->arrayMenu->AddEntry(entry);
  }
  sub->arrayMenu->Tick();
  ALLOCS(sub->entry,IMNameLength+1,0x77);
  sub->cursor = WidgetB8(BORG8_WhiteSquare15px);
  SetCurrentName(txt);
  this->Link(sub->cursor);
  this->Link(sub->arrayMenu);
  Controller::GetDelay(0);
}


void InputMenu::SetCurrentName(char *txt){
  s16 sVar1;
  BaseWidget *pBVar3;
  u16 i;
  InputWidgetSubStruct *sub;
  WAMSub *piVar3;
  
  sub = (InputWidgetSubStruct *)this->substruct;
  piVar3 = (WAMSub *)sub->arrayMenu->substruct;
  piVar3->entryPos = 0;
  memset(sub->entry,0,IMNameLength+1);
  sub->output = txt;
  if (txt) {
    i = 0;
    if (*txt) {
      for(bool bVar4 = true;sub->output[i]!=0;i++,bVar4 = i < IMNameLength) {
        if (!bVar4) CRASH("inputmenu.cpp","source text is too long!");
        sub->entry[i] = sub->output[i];
      }
    }
    if (i < IMNameLength-1) {
      sub->entryIndex = (u8)i;
      sub->entry[(u8)i] = (char)piVar3->entries[piVar3->entryPos]->varU16;
    }
    else {
      sub->entryIndex = IMNameLength-1;
      piVar3->entryPos = piVar3->entryCount - 1;
    }
  }
  UpdateCursorPos(sub,piVar3);
}

Gfx * InputMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  byte bVar1;

  s16 iVar3;
  u8 uVar4;
  int iVar5;
  Gfx *pGVar6;
  u32 uVar7;
  u32 i;
  float fVar9;

  float fVar14;
  float fVar15;
  float fVar16;
  Gfx *apGStackX_4 [3];
  InputWidgetSubStruct *piVar1;
  WAMSub *piVar2;
  
  piVar1 = (InputWidgetSubStruct *)this->substruct;
  i = 0;
  piVar2 = (WAMSub *)piVar1->arrayMenu->substruct;
  (piVar2->entries[piVar2->entryPos]->col).R = 0;
  (piVar2->entries[piVar2->entryPos]->col).G = 0;
  (piVar2->entries[piVar2->entryPos]->col).B = 0;
  (piVar2->entries[piVar2->entryPos]->col).A = this->col.A;
  apGStackX_4[0] = g;
  iVar3 = Font::GetWidth(gGlobals.font,piVar1->entry);
  iVar3 = SCREEN_CENTERW - Font::GetWidth(gGlobals.font,piVar1->entry) / 2;
  uVar7 = 0;
  do {
    iVar3 = iVar3;
    fVar9 = (float)this->col.R;
    fVar14 = (float)this->col.G;
    fVar15 = (float)this->col.B;
    if(i!=piVar1->entryIndex){
      fVar9 = 130.0f, fVar14 = 80.0f, fVar15 = 80.0f;
      if(!gGlobals.BigAssMenu){
        fVar9 = 225.0f, fVar14 = 225.0f, fVar15 = 225.0f;
        }
    }
    fVar9 *= fadeFloatMirror;
    fVar14 *= fadeFloatMirror;
    fVar15 *= fadeFloatMirror;
    fVar16 = (float)this->col.A * fadeFloatMirror;
    gGlobals.font->col.R = fVar9;
    gGlobals.font->col.G = fVar14;
    gGlobals.font->col.B = fVar15;
    gGlobals.font->col.A = fVar16;
    bVar1 = piVar1->entry[i];
    uVar4 = bVar1;
    if (uVar4 == 0) break;
    if (uVar7 != 0) { //only first letter is uppercase
      if ((uVar7 != ' ') && (bVar1 - 'A' < 26)) {
        uVar4 = bVar1 + ' ';
      }
    }
    i++;
    Font::PrintCharaWapper(gGlobals.font,apGStackX_4,uVar4,iVar3 + this->posX,this->posY + 85,x0,y0,x1,y1);
    iVar3 += Font::GetCharWidth(gGlobals.font,(u8)uVar4);
    uVar7 = uVar4;
  } while ((int)i < IMNameLength);
  return RenderChildren(apGStackX_4[0],x0,y0,x1,y1);
}

u8 InputMenu::Tick(){
  if (this->col.R - 100 >= 125) this->unk7c = -this->unk7c;
  this->col.R+= this->unk7c;
  this->col.G+= this->unk7c;
  this->col.B+= this->unk7c;
  return TickChildren();
}

u32 InputMenu::GetNumber(){return WidgetN_Other;}