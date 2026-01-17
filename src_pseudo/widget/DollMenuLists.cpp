#include "globals.h"

DollMenuLists::DollMenuLists(DollEquipmentMenu *menu,u8 sel):WidgetMenu(){
    InitMenu(menu,sel);
}

DollMenuLists::~DollMenuLists(){
  if (this->unk8c) {
    this->Unlink(this->unk8c);
    this->unk8c = NULL;
  }
  this->Unlink(this->menus[this->menuIndex]);
  if (this->menuCount) {
    for(u8 i=0;i< this->menuCount;i++) {
      if (this->menus[i])
        this->menus[i]->~WidgetTrainShop();
    }
  }
  this->unkb0.~GuiAnimationManager();
  WidgetMenu::~WidgetMenu();
}


void DollMenuLists::InitMenu(DollEquipmentMenu *menu,u8 sel){
  
  this->menuIndex = sel;
  u8 bVar14 = gPartyPicker;
  this->menuCount = 0;
  this->invMenu = NULL;
  this->skillMenu = NULL;
  this->spellMenu = 0;
  this->statMenu = NULL;
  this->unk8c = NULL;
  this->partyPicker = bVar14;

  CLEAR(&this->menus);
  if (((gGlobals.SomeCase == 7) || (gGlobals.SomeCase == 3)) || (gGlobals.SomeCase == 6)) {
    this->invMenu = new WidgetInvShop(PARTY->Inventory,menu);
    this->menus[this->menuCount++] = this->invMenu;
    if (gGlobals.SomeCase == 6) goto LAB_80038434;
  }
  this->spellMenu = new WidgetSpellTrain();
  this->menus[this->menuCount++] = this->spellMenu;
  this->skillMenu = new WidgetSkillTrain(false);
  this->menus[this->menuCount++] = this->skillMenu;
  if (gGlobals.SomeCase != 4){
    this->statMenu = new WidgetStatTrain();
    this->menus[this->menuCount++] = this->statMenu;
  }
LAB_80038434:
  if (this->menuIndex >= this->menuCount) this->menuIndex--;
  this->menus[this->menuIndex]->SetCoords(160,101);
  this->Link(this->menus[this->menuIndex]);
  if (this->menuCount) {
    for(u32 i=0;i<this->menuCount;i++){
      WidgetTrainShop* w=this->menus[i];
      if(w){
        if(i!=this->menuIndex)w->SetCoords(20,0x65);
        w->boundX0 = SCREEN_CENTERW;
        w->boundX1 = (SCREEN_WIDTH-20);
        w->boundY0 = 0x65;
        w->boundY1 = 0xcd;
        w->Tick();
        w->scrollMenu->Update();
      }
    }
  }
  this->background = NULL;
  this->expCost = NULL;
  this->expRemain = NULL;
  if (gGlobals.SomeCase == 5) {
    BaseWidget* pBVar8 =WidgetB8(BORG8_BarterBGShadow);
    pBVar8->SetCoords(5,0x3c);
    this->Link(pBVar8);
    this->background = WidgetB8(BORG8_BarterBG);
    this->background->SetCoords(0,0x3a);
    this->Link(this->background);
    pBVar8 = WidgetB8(BORG8_TitleTrain);
    pBVar8->SetCoords(0x5a - (pBVar8->GetHeight() >> 1),0x58 - pBVar8->GetWidth());
    this->Link(pBVar8);
    u16 uVar16 = (u16)pBVar8->posY + pBVar8->GetHeight() + 4;
    Gsprintf(Cstring(EarnedExp),(gGlobals.expGained * 1.5f));
    pBVar8 = WClipTXT(gGlobals.text);
    pBVar8->SetColor(COLOR_RED1);
    pBVar8->SetCoords(0x14,uVar16);
    Utilities::SetTextWidgetBoundsX(pBVar8,0x14,0x96);
    this->Link(pBVar8);
    uVar16 = pBVar8->GetHeight() + uVar16 + 4;
    SlimFont;
    u8 bVar3 = false;
    if (PARTY->PartySize) {
      for(u8 i=0;i<PARTY->PartySize;i++) {
        if (PARTY->Members[i]) {
          Entity::ModExpTotal(PARTY->Members[i],-gGlobals.expGained);
          u32 lvPre = Entity::GetLevel(PARTY->Members[i]);
          Entity::ModExpTotal(PARTY->Members[i],gGlobals.expGained);
          u32 lvPost = Entity::GetLevel(PARTY->Members[i]);
          if (lvPre < lvPost) {
            Gsprintf(Cstring(LevelUp),PARTY->Members[i]->name);
            pBVar8 = WClipTXT(gGlobals.text);
            pBVar8->SetColor(COLOR_RED1);
            pBVar8->SetCoords(0x14,(s16)uVar16);
            Utilities::SetTextWidgetBoundsX(pBVar8,0x14,0x9b);
            this->Link(pBVar8);
            bVar3 = true;
            uVar16+=pBVar8->GetHeight();
          }
        }
      }
    }
    if (bVar3) PlayAudioSound(&gGlobals.SFXStruct,BORG12_LevelUp,0,gGlobals.VolSFX,300,0x3c);
    NormalFont;
    this->expCost = new WidgetClipText(NULL,20);
    this->expCost->SetColor(COLOR_RED1);
    this->expCost->SetCoords(0x14,0xc5 - (s16)this->expCost->GetHeight());
    this->Link(this->expCost);
    this->expRemain = new WidgetClipText(NULL,20);
    this->expRemain->SetColor(COLOR_RED1);
    this->expRemain->SetCoords(0x14,this->expCost->posY + this->expCost->GetHeight());
    this-Link(this->expRemain);
    ShowEXPCosts();
  }
}
Gfx * DollMenuLists::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  SlimFont;
  Gfx* G = RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  return G;
}

u8 DollMenuLists::Tick(){
  SlimFont;
  this->unkb0.Tick(1);
  if (((this->unkb0).present == 0) && (this->unk8c)) {
    this->Unlink(this->unk8c);
    this->unk8c = NULL;
  }
  u8 bVar2 = this->TickChildren();
  NormalFont;
  return bVar2;
}

u32 DollMenuLists::m80038bc0(){
  if (this->unk8c == NULL) return (this->unkb0).present;
  return 1;
}

void DollMenuLists::UpdateMenus(u8 ind){
  this->partyPicker=ind;
  for(u8 i=0;i<this->menuCount;i++){
    if(this->menus[i])this->menus[i]->InitMenu();
  }
}

void DollMenuLists::LRToggle(u8 param_2){
  WidgetTrainShop *pWVar3;
  u8 newIndex;
  s16 sVar9;
  s16 asStack_28 [20];
  
  if (!m80038bc0()) {
    sVar9 = 0x8c;
    if (param_2 == 0) {
      newIndex = (this->menuIndex + this->menuCount +1) % this->menuCount;
    }
    else {
      newIndex = (this->menuIndex + this->menuCount -1) % this->menuCount;
      sVar9 = -0x8c;
    }
    if (newIndex!= this->menuIndex) {
      WidgetTrainShop* w=this->menus[newIndex];
      w->posX = SCREEN_CENTERW - sVar9;
      this->unkb0.AddItem(new GuiAnimatorS16(&w->posX,&this->menus[this->menuIndex]->posX,0x14,&double_array_0));
      asStack_28[0] = sVar9 + this->menus[this->menuIndex]->posX;
      this->unkb0.AddItem(new GuiAnimatorS16(&this->menus[this->menuIndex]->posX,asStack_28,0x14,&double_array_0));
      this->Link(w);
      pWVar3 = this->menus[this->menuIndex];
      this->menuIndex = (byte)newIndex;
      this->unk8c = pWVar3;
    }
    ShowEXPCosts();
    PlayAudioSound(&gGlobals.SFXStruct,0x73d,0,1.0,0x1e,0);
  }
}

void DollMenuLists::ShowEXPCosts(){
  if (gGlobals.SomeCase == 5) {
    BaseWidget* w = this->menus[this->menuIndex]->AFunc();
    if (!w) strcpy(Utilities::GetWidgetText(this->expCost)," ");
    else {
      s32 price = this->menus[this->menuIndex]->GetExpPrice(w->varU16);
      if (price == -1) strcpy(Utilities::GetWidgetText(this->expCost),Cstring(ExpCostMax));
      else sprintf(Utilities::GetWidgetText(this->expCost),Cstring(ExpCost),price);
    }
    this->partyPicker = gPartyPicker;
    sprintf(Utilities::GetWidgetText(this->expRemain),Cstring(ExpRemain),PARTY->Members[this->partyPicker]->EXP->spending);
  }
}

u32 DollMenuLists::GetNumber(){return WidgetN_Other;}