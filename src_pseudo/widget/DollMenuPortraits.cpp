#include "widgets/DollMenu.h"
#include "globals.h"

DollMenuPortraits::DollMenuPortraits(Party *party,u8 size,u8 selected):WidgetMenu(){
    u32 b8;
    u32 *b8P;
  
    this->partySize = size;
    this->selectedMember = selected;
    b8P = &b8;
    for(u8 i=this->selectedMember,j = i;
        i < this->selectedMember + this->partySize;
        j = ++i % this->partySize){
        CharSheet* chara=party->Members[j];
        this->names[j] = WClipTXTSafe(chara->name);
        this->names[j]->SetCoords(0x45,0x1c);
        this->names[j]->SetColor(0x82,0x50,0x50,0);
        this->Link(this->names[j]);
        u16 uVar13 = 24;
        this->portraits[j] = WidgetB8Port(chara->ID);
        if (j == this->selectedMember) uVar13 = 40;
        this->Hs[j] = uVar13;
        this->Ws[j] = uVar13;
        this->portraits[j]->SetHeight(this->Hs[j]);
        this->portraits[j]->SetWidth(this->Ws[j]);
        this->portraits[j]->var5C = (byte)j;
        this->portraits[j]->var5E = (short)(char)GETINDEX(chara->ID);
        this->Link(this->portraits[j]);
    }
    switch(this->partySize){ //uses fallthrough for party sizes?
        case 4:
        this->portraits[(this->selectedMember + 3) % 4]->SetCoords(123,37);
        this->portraits[(this->selectedMember + 3) % (uint)this->partySize]->x+=2;
        this->portraits[(this->selectedMember + 3) % (uint)this->partySize]->y+=2;
        case 3:
        this->portraits[(this->selectedMember + 2) % (uint)this->partySize]->SetCoords(94,37);
        this->portraits[(this->selectedMember + 2) % (uint)this->partySize]->x+=2;
        this->portraits[(this->selectedMember + 2) % (uint)this->partySize]->y+=2;
        case 2:
        this->portraits[(this->selectedMember + 1) % (uint)this->partySize]->SetCoords(65,37);
        this->portraits[(this->selectedMember + 1) % (uint)this->partySize]->x+=2;
        this->portraits[(this->selectedMember + 1) % (uint)this->partySize]->y+=2;
        case 1:
        this->portraits[this->selectedMember]->SetCoords(20,24);
        this->portraits[this->selectedMember]->x +=2;
        this->portraits[this->selectedMember]->y +=2;
    }
    (this->names[this->selectedMember]->col).A = 0xff;
    this->aspectIcon = NULL;
    this->schoolIcon = NULL;
    getAspectIcon(party->Members[this->selectedMember]->EXP->GetAspect(),b8P);
    this->aspectIcon = WidgetB8(b8);
    this->aspectIcon->SetCoords(this->portraits[this->selectedMember]->x,this->portraits[this->selectedMember]->y + this->portraits[this->selectedMember]->GetHeight() + 4);
    this->aspectIcon->var5E = party->Members[this->selectedMember]->EXP->GetAspect();
    this->Link(this->aspectIcon);
    getSchoolIcon(party->Members[this->selectedMember]->EXP->school,b8P);
    if (b8) {
      this->schoolIcon = WidgetB8(b8);
      this->schoolIcon->SetCoords(this->aspectIcon->x + (short)this->aspectIcon->GetWidth() + 2,this->aspectIcon->y);
      this->schoolIcon->var5E = (ushort)party->Members[this->selectedMember]->EXP->school;
      this->Link(this->schoolIcon);
    }
}
DollMenuPortraits::~DollMenuPortraits(){
    this->unkb8.~UnkGuiSubstruct();
    WidgetMenu::~WidgetMenu();
}

u32 DollMenuPortraits::m80042c04(){return unkb8.present;}


void DollMenuPortraits::SchoolAspectIcons(u8 param_2){
  byte bVar1;
  CharSheet *pCVar4;
  int iVar6;
  BaseWidget *pBVar10;
  BaseWidget *pBVar12;
  ulong uVar14;
  uint uVar16;
  uint uVar17;
  ushort uStack_50;
  u16 uStack_4e;
  byte abStack_4c [4];
  u32 BStack_48;
  byte abStack_44 [4];
  ushort *puStack_40;
  int iStack_3c;
  BaseWidget **ppBStack_38;
  byte *pbStack_34;
  byte *pbStack_30;
  
  if ((!m80042c04()) && (1 < this->partySize)) {
    if (param_2 == 0) {
      puStack_40 = &uStack_50;
      iStack_3c = -1;
      uStack_4e = (ushort)(((uint)this->selectedMember + this->partySize + 1) % (uint)this->partySize);
      uStack_50 = (ushort)this->selectedMember;
    }
    else {
      puStack_40 = &uStack_4e;
      iStack_3c = 1;
      uStack_4e = (ushort)((int)((uint)this->selectedMember + (this->partySize - 1)) % (int)(uint)this->partySize);
    }
    pbStack_34 = abStack_4c;
    pbStack_30 = abStack_4c + 1;
    if (this->partySize != 0) {
        for(u8 i=0;i<this->partySize;i++) {
          u8 uVar16 = (int)(i + iStack_3c + (uint)this->partySize) % (int)(uint)this->partySize;
          this->unkb8.AddItem(new UnkGuiClassU2(&this->portraits[i]->x,&this->portraits[uVar16]->x,0xf,&double_array_0));
          this->unkb8.AddItem(new UnkGuiClassU2(&this->portraits[i]->y,&this->portraits[uVar16]->y,0xf,&double_array_0));
          this->unkb8.AddItem(new UnkGuiClassU2(&this->Ws[i],&this->Ws[uVar16],0xf,&double_array_0));
          this->unkb8.AddItem(new UnkGuiClassU2(&this->Hs[i],&this->Hs[uVar16],0xf,&double_array_0));
        }
      }
    abStack_4c[0] = 0;
    this->unkb8.AddItem(new UnkGuiClassU3(&(this->names[this->selectedMember]->col).A,pbStack_34,0xf,&double_array_0));
    abStack_4c[1] = 0xff;
    this->unkb8.AddItem(new UnkGuiClassU3(&(this->names[uStack_4e]->col).A,pbStack_30,0xf,&double_array_0));
    if (this->partySize != 0) {
        for(u8 i=0;i<this->partySize;i++)  {
        if (i != *puStack_40) {
          this->Unlink(this->portraits[i]);
          this->Link(this->portraits[i]);
        }
      }
    }
    this->selectedMember = (byte)uStack_4e;
    pCVar4 = (gGlobals.party)->Members[(byte)uStack_4e];
    u8 AVar15 = pCVar4->EXP->GetAspect();
    pBVar12 = this->aspectIcon;
    if (pBVar12->var5E != AVar15){
      abStack_4c[2] = 0;
      this->unkb8.AddItem(new UnkGuiClassL(new UnkGuiClassU3(&(pBVar12->col).A,abStack_4c + 2,0xf,&double_array_0),pBVar12));
      getAspectIcon(AVar15,&BStack_48);
      this->aspectIcon = WidgetB8(BStack_48);
      this->aspectIcon->SetCoords(pBVar12->x,pBVar12->y);
      (this->aspectIcon->col).A = 0;
      this->aspectIcon->var5E = AVar15;
      this->Link(this->aspectIcon);
      this->unkb8.AddItem(new UnkGuiClassU3(&(this->aspectIcon->col).A,abStack_44,0xf,&double_array_0));
    }
    pBVar12 = this->schoolIcon;
    u8 MVar2 = pCVar4->EXP->school;
    if (pBVar12) {
      if (pBVar12->var5E == (ushort)MVar2) return;
      this->unkb8.AddItem(new UnkGuiClassL(new UnkGuiClassU3(&(pBVar12->col).A,abStack_44 + 1,0xf,&double_array_0),pBVar12));
    }
    getSchoolIcon(MVar2,&BStack_48);
    if (BStack_48 == 0) this->schoolIcon = NULL;
    else {
      this->schoolIcon = WidgetB8(BStack_48);
      this->schoolIcon->SetCoords(this->aspectIcon->x + this->aspectIcon->GetWidth() + 2,this->aspectIcon->y);
      (this->schoolIcon->col).A = 0;
      pBVar12->var5E = (ushort)MVar2;
      this->Link(this->schoolIcon);
      abStack_44[2] = 0xff;
      this->unkb8.AddItem(new UnkGuiClassU3(&(this->schoolIcon->col).A,abStack_44 + 2,0xf,&double_array_0));
    }
  }
}

Gfx * DollMenuPortraits::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  SlimFont;
  Gfx* pGVar1 = RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  return pGVar1;
}


u8 DollMenuPortraits::Tick(){
  
  unkb8.Tick(1);
  if (this->partySize != 0) {
    for(u8 i=0;i<this->partySize;i++) {
      this->portraits[i]->SetHeight(this->Hs[i]);
      this->portraits[i]->SetWidth(this->Ws[i]);
    }
  }
  return TickChildren();
}
