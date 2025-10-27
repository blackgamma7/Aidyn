#include "widgets/ItemDetails.h"
#include "widgets/Utilities.h"
#include "globals.h"
#include "romstring.h"

#define ItemDetailsWidth 149

extern void* romstring_potiondetails;
extern void* romstring_items;
extern void* romstring_spells;
extern void* romstring_stats;
extern void* romstring_skills;

u8 widget_left_side_fade_in(BaseWidget *w) {
  if ((w->col).A  < (0xff-60)) {
    (w->col).A+= 60;
  }
  else {
    (w->col).A = 0xff;
    w->state = 2;
  }
  Utilities::SetAlpha(w,(w->col).A);
  w->Tick();
  return w->state;
}


u8 widget_left_side_fade_out(BaseWidget *w) {
  if((w->col).A >60)(w->col).A-= 60;
  else {
    (w->col).A = 0;
    w->state = 6;
  }
  Utilities::SetAlpha(w,(w->col).A);
  w->Tick();
  return w->state;
}

WidgetClipText * WidgetItemDetail::AddLeftText(char *txt) {
  WidgetClipText *w = WClipTXT(txt);
  w->SetColor(0x82,0x50,0x50,0xff);
  w->SetCoords(this->x,this->bottom);
  this->Link(w);
  return w;
}

WidgetClipText * WidgetItemDetail::AddRightText(char *txt) {
  WidgetClipText *w = WClipTXT(txt);
  w->SetColor(0x82,0x50,0x50,0xff);
  w->SetCoords(ItemDetailsWidth-w->GetWidth(),this->bottom);
  this->Link(w);
  return w;
}


WidgetItemDetail::WidgetItemDetail(ItemInstance *param_2):WidgetMenu() {
  byte bVar1;
  char **ppcVar12;
  BaseWidget *pBVar13;
  ulong uVar14;
  u16 uVar16;
  uint i;
  SlimFont;
  this->var5E = param_2->id;
  SidePopup();
  PrintNameIcon(param_2->name);
  if ((ushort)param_2->id >> 8 == DB_POTION) {
    u16 potion_romstring_id[][2]={
     {Potion_Fire,0},{Potion_Inferno,1},{Potion_Sleep,2},
     {Potion_Acid,3},{Potion_Healing,4},{Potion_Stamina,5},
     {Potion_Curing,6},{Potion_Antidote,7},{Potion_Restore,8},
     //aspect ("A") and jumping ("J") potions are skipped
     {Potion_Strength,9},{Potion_Dexterity,10},{Potion_Clarity,11},
     {Potion_Charisma,12},{Potion_Defence,13},{Potion_Steath,13},{0}
    };
    for(i=0;potion_romstring_id[i][0]!=param_2->id;i++){
        if(potion_romstring_id[i][0]==0){
            Gsprintf("potion %d not found.",param_2->id);
            CRASH("itemdetail.cpp",gGlobals.text);
        }
    }
    ppcVar12 = RomString::Load(romstring_potiondetails,2688);
    pBVar13 = AddLeftText(ppcVar12[potion_romstring_id[i][1]]);
    Utilities::SetWidgetBoundsX(pBVar13,this->x,ItemDetailsWidth);
    this->bottom+=pBVar13->GetHeight();
    RomString::Free(ppcVar12);
  }
  else {
    u16 item_romstring_id[][2]={
      {0x0100, 0x0000},{0x0101, 0x0001},{0x0102, 0x0002},
      {0x0103, 0x0003},{0x0104, 0x0004},{0x010e, 0x0005},
      {0x0111, 0x0006},{0x0112, 0x0007},{0x0113, 0x0008},
      {0x0119, 0x0009},{0x011e, 0x000a},{0x0121, 0x000b},
      {0x0122, 0x000c},{0x0123, 0x000d},{0x0124, 0x000e},
      {0x1100, 0x000f},{0x1101, 0x0010},{0x1102, 0x0011},
      {0x1103, 0x0012},{0x1104, 0x0013},{0x1105, 0x0014},
      {0x1107, 0x0015},{0x1108, 0x0016},{0x1109, 0x0017},
      {0x110a, 0x0018},{0x110c, 0x0019},{0x110d, 0x001a},
      {0x110e, 0x001b},{0x110f, 0x001c},{0x1110, 0x001d},
      {0x1111, 0x001e},{0x112e, 0x001f},{0x1132, 0x0020},
      {0x1133, 0x0021},{0x1134, 0x0022},{0x1135, 0x0023},
      {0x1136, 0x0024},{0x1137, 0x0025},{0x1138, 0x0026},
      {0x1139, 0x0027},{0x113b, 0x0028},{0x113c, 0x0029},
      {0x113d, 0x002a},{0x113e, 0x002b},{0x113f, 0x002c},
      {0x1140, 0x002d},{0x1143, 0x002e},{0x1144, 0x002f},
      {0x1145, 0x0030},{0x1146, 0x0031},{0x1147, 0x0032},
      {0x1148, 0x0033},{0x1149, 0x0034},{0x114a, 0x0035},
      {0x114c, 0x0036},{0x114d, 0x0037},{0x114e, 0x0038},
      {0x1150, 0x0039},{0x1151, 0x003a},{0x1152, 0x003b},
      {0x1153, 0x003c},{0x1154, 0x003d},{0x1155, 0x003e},
      {0x1156, 0x003f},{0x1157, 0x0040},{0x1158, 0x0041},
      {0x1159, 0x0042},{0x115a, 0x0043},{0x115b, 0x0044},
      {0x115c, 0x0045},{0x115d, 0x0046},{0x115e, 0x0047},
      {0x115f, 0x0048},{0x1307, 0x0049},{0x1300, 0x004a},
      {0x1301, 0x004b},{0x1302, 0x004c},{0x1303, 0x004d},
      {0x1304, 0x004e},{0x1305, 0x004f},{0x1306, 0x0050},
      {0x1309, 0x0051},{0}};
    for(i=0;item_romstring_id[i][0]!=param_2->id;i++){
        if(item_romstring_id[i][0]==0){
            Gsprintf("item %u not found.",param_2->id);
            CRASH("itemdetail.cpp",gGlobals.text);
        }
    }
    ppcVar12 = RomString::Load(romstring_items,0xed0);
    pBVar13 = AddLeftText(ppcVar12[item_romstring_id[i][1]]);
    Utilities::SetWidgetBoundsX(pBVar13,this->x,ItemDetailsWidth);
    this->bottom+=pBVar13->GetHeight();
    RomString::Free(ppcVar12);
    if ((ushort)param_2->id >> 8 == 0x11) {
      this->bottom = 0xbb;
      bVar1 = gItemDBp->Gear[search_item_array(param_2->id)].spell;
      Gsprintf(gGlobals.CommonStrings[0x215],gSpellDBp->spells[bVar1].Name);
      AddLeftText(gGlobals.text);
    }
  }
  NormalFont;
}

WidgetItemDetail::WidgetItemDetail(SpellInstance *param_2):WidgetMenu() {

  uint i;
  ItemID IVar20;
  ItemID IStack_1b8;
  ushort uStack_1b6;
  char acStack_b8 [128];
  u32 BStack_38;
  u32 BStack_34;
  u32 aBStack_30;
  
  SlimFont;
  SidePopup();
  IVar20 = (param_2->base).id;
  this->var5E = (ushort)IVar20;
  GetSpellIcons(IVar20,&BStack_38,&BStack_34,&aBStack_30);
  BaseWidget* pBVar9 =WidgetB8(aBStack_30);
  pBVar9->SetCoords(this->x,this->bottom);
  this->Link(pBVar9);
  this->bottom = (short)pBVar9->GetHeight() + this->bottom + 2;
  BaseWidget* pBVar12 = AddLeftText((param_2->base).name);
  pBVar12->SetCoords(this->x + pBVar9->GetWidth() + 2,this->bottom - (short)pBVar12->GetHeight());
  this->bottom+= 4;
  u16 RomstringSpellIndecies[][2]={
   {0x0300, 0x0000},{0x0301, 0x0001},{0x0302, 0x0002},
   {0x0303, 0x0003},{0x0304, 0x0004},{0x0305, 0x0005},
   {0x0306, 0x0006},{0x0308, 0x0007},{0x0309, 0x0008},
   {0x030a, 0x0009},{0x030c, 0x000a},{0x030d, 0x000b},
   {0x0310, 0x000c},{0x0312, 0x000d},{0x0313, 0x000e},
   {0x0314, 0x000f},{0x0315, 0x0010},{0x0316, 0x0011},
   {0x0317, 0x0012},{0x0318, 0x0013},{0x0319, 0x0014},
   {0x031a, 0x0015},{0x031b, 0x0016},{0x031c, 0x0017},
   {0x031d, 0x0018},{0x031e, 0x0019},{0x031f, 0x001a},
   {0x0320, 0x001b},{0x0321, 0x001c},{0x0322, 0x001d},
   {0x0323, 0x001e},{0x0324, 0x001f},{0x0326, 0x0020},
   {0x0329, 0x0021},{0x032a, 0x0022},{0x032b, 0x0023},
   {0x032d, 0x0024},{0x032e, 0x0025},{0x032f, 0x0026},
   {0x0330, 0x0027},{0x0331, 0x0028},{0x0332, 0x0029},
   {0x0333, 0x002a},{0x0334, 0x002b},{0x0335, 0x002c},
   {0x0336, 0x002d},{0x0337, 0x002e},{0x0338, 0x002f},
   {0x0339, 0x0030},{0x033a, 0x0031},{0x033b, 0x0032},
   {0x033c, 0x0033},{0x033d, 0x0034},{0x033e, 0x0035},
   {0x033f, 0x0036},{0}
  };
  for(i=0;RomstringSpellIndecies[i][0]!=param_2->base.id;i++){
    if(RomstringSpellIndecies[i][0]==0){
      Gsprintf("spell %d not found.",(param_2->base).id);
      CRASH("itemdetail.cpp",gGlobals.text);
      }
    }
  char** ppcVar15 = RomString::Load(romstring_spells,0x13a0);
  pBVar9 = AddLeftText(ppcVar15[RomstringSpellIndecies[i][1]]);
  Utilities::SetWidgetBoundsX(pBVar9,this->x,ItemDetailsWidth);
  this->bottom +=pBVar9->GetHeight();
  RomString::Free(ppcVar15);
  if (param_2->wizard != 0) {
    this->bottom = 0xbb;
    sprintf(acStack_b8,gGlobals.CommonStrings[0x215],param_2->wizard);
    AddLeftText(acStack_b8);
  }
  u8 MVar1 = param_2->cost;
  if (MVar1 != SPELLUSE_NONE) {
    IVar20 = itemID_array[0x1f];
    if ((MVar1 != SPELLUSE_Herb) &&
       ((SPELLUSE_Herb < MVar1 || (IVar20 = itemID_array[0x1e], MVar1 != SPELLUSE_Spice)))) {
      IVar20 = itemID_array[0x20];
    }
    strcpy(acStack_b8,gGlobals.CommonStrings[0x216]);
    pBVar9 = WClipTXT(acStack_b8);
    s16 uVar11=pBVar9->GetHeight();
    this->bottom = uVar11 + 187;
    pBVar9->SetColor(0x82,0x50,0x50,0xff);
    pBVar9->SetCoords(this->x,this->bottom);
    this->Link(pBVar9);
    GetItemImage(IVar20,&aBStack_30);
    pBVar12 = WidgetB8(aBStack_30);
    pBVar12->SetCoords(this->x + pBVar9->GetWidth(),this->bottom);
    s16 sVar18 = uVar11 + -2;
    pBVar12->SetWidth(sVar18);
    pBVar12->SetHeight(sVar18);
    this->Link(pBVar12);
    pBVar9 = WClipTXT(gItemDBp->Gear[(s16)search_item_array(IVar20)].name);
    pBVar9->SetColor(0x82,0x50,0x50,0xff);
    pBVar9->SetCoords(pBVar12->x + pBVar12->GetWidth() + 2,this->bottom);
    this->Link(pBVar9);
    this->bottom+=pBVar9->GetHeight();
  }
  NormalFont;
}

WidgetItemDetail::WidgetItemDetail(u16 stat):WidgetMenu() {
  SlimFont;
  SidePopup();
  this->var5E = stat;
  char **ppcVar3 = RomString::Load(romstring_stats,0x2f0);
  BaseWidget *pBVar4 = AddLeftText(ppcVar3[this->var5E]);
  Utilities::SetWidgetBoundsX(pBVar4,this->x,ItemDetailsWidth);
    this->bottom+=pBVar4->GetHeight();
  RomString::Free(ppcVar3);
  NormalFont;
}

WidgetItemDetail::WidgetItemDetail(CharSkills *sk,u16 type):WidgetMenu() {
  ushort uVar1;
  uint uVar7;
  uint index;
  
  SlimFont;
  SidePopup();
  uVar1 = type >> 8;
  uVar7 = type & 0xff;
  this->var5E = type;
  switch(uVar1){
    case 0:
      index = uVar7; break;
    case 1:{
      u16 weaponSkDescs[]={0,0,0,12,13,14,0,0,15,16};
      if(!weaponSkDescs[uVar7]){
        Gsprintf("weapon skill %d has no description",uVar7);
        CRASH("itemdetail.cpp",gGlobals.text);
      }
      index = weaponSkDescs[uVar7]; break;
    }
    case 2:
    index=17; break;
    default:
    CRASH("itemdetail.cpp","unknown skill type.\n");
  }
  char **ppcVar4 = RomString::Load(romstring_skills,0x790);
  BaseWidget *pBVar5 = AddLeftText(ppcVar4[index]);
  Utilities::SetWidgetBoundsX(pBVar5,this->x,ItemDetailsWidth);
  this->bottom+=pBVar5->GetHeight();
  RomString::Free(ppcVar4);
  NormalFont;
}

void WidgetMenuPopup(BaseWidget *w) {
  (w->col).A = 0;
  w->x = 23;
  w->y = 70;
  WidgetBorg8* w0=WidgetB8(228);
  w0->SetCoords(5,60);
  w->Link(w0);
  WidgetBorg8* w0=WidgetB8(226);
  w0->SetCoords(0,58);
  w->Link(w0);
  w->SetWidth(140);
  w->fadeIn = widget_left_side_fade_in;
  w->fadeOut = widget_left_side_fade_out;
  PlayAudioSound(&gGlobals.SFXStruct,0x7d4,0,1.0,0x3c,0);
}

void WidgetItemDetail::SidePopup(){
  WidgetMenuPopup(this);
  this->bottom=70;
}

void WidgetItemDetail::PrintNameIcon(char *txt) {
  u32 index;
  
  GetItemImage((ItemID)this->var5E,&index);
  WidgetBorg8* wicon = WidgetB8(&index);
  wicon->SetCoords(this->x,this->bottom);
  this->Link(wicon);
  this->bottom+= this->GetHeight()+2;
  WidgetClipText*wtxt = WClipTXTSafe(txt);
  wtxt->SetCoords(this->x + wicon->GetWidth() + 2,this->bottom - wtxt->GetHeight());
  wtxt->SetColor(0x82,0x50,0x50,0xff);
  this->Link(wtxt);
  this->bottom+=4;
}

void WidgetItemDetail::PrintWeaponType(char *name) {
  AddLeftText(gGlobals.CommonStrings[0x217]);
  this->bottom+=AddRightText(name)->GetHeight();
}


void WidgetItemDetail::PrintAspect(u8 param_2) {
  u32 aBStack_18;
  
  if (param_2) {
    AddLeftText(gGlobals.CommonStrings[0x218]);
    getAspectIcon(param_2,&aBStack_18);
    BaseWidget *pBVar2 = WidgetB8(aBStack_18);
    pBVar2->SetCoords(ItemDetailsWidth - pBVar2->GetWidth(),this->bottom + -2);
    this->Link(pBVar2);
    this->bottom = pBVar2->GetHeight() + this->bottom + 1;
  }
}

void WidgetItemDetail::PrintStrReq(byte param_2) {
  char buff [272];  
  if (param_2) {
    AddLeftText(gGlobals.CommonStrings[0x219]);
    sprintf(buff,"%u",param_2);
    this->bottom+= AddRightText(buff)->GetHeight();
  }
}

void WidgetItemDetail::PrintBaseHit(byte param_2) {
  char buff [272];  
    AddLeftText(gGlobals.CommonStrings[0x21a]);
    sprintf(buff,"%u",param_2);
    this->bottom+= AddRightText(buff)->GetHeight();
}

void WidgetItemDetail::PrintDamage(byte param_2) {
  char buff [272];  
    AddLeftText(gGlobals.CommonStrings[0x21b]);
    sprintf(buff,"%u",param_2);
    this->bottom+= AddRightText(buff)->GetHeight();
}

void WidgetItemDetail::PrintStatMod(StatMod *mod) {
  char buff [272];
  if (mod) {
    if (mod->stat == STAT_STAM) 
      strcpy(buff,gGlobals.CommonStrings[0x21c]);
    else strcpy(buff,Stat_labels[mod->stat]);
    AddLeftText(buff);
    PrintPlus(mod->mod,buff);
    this->bottom+=AddRightText(buff)->GetHeight();
  }
}

void WidgetItemDetail::PrintSkillInfo(StatMod *mod) {
  char buff [272];
  if (mod) {
    strcpy(buff,skill_strings[mod->stat]);
    AddLeftText(buff);
    PrintPlus(mod->mod,buff);
    this->bottom+=AddRightText(buff)->GetHeight();
  }
}

void WidgetItemDetail::PrintEnchantment(SpellCharges *charges) {
  if (charges) {
    WidgetClipText *pBVar2 = AddLeftText(gGlobals.CommonStrings[0x21e]);
    this->bottom+=pBVar2->GetHeight();
    pBVar2 = AddLeftText(charges->Spell->base.name);
    pBVar2->SetCoords(this->x + 0x10,this->bottom);
    this->bottom+=(short)pBVar2->GetHeight();
  }
}
extern char** element_labels;
void WidgetItemDetail::PrintResistance(resist_float *resist) {
  char buff [272];
  
  if ((resist) && (resist->element != ELEMENT_NONE)) {
    BaseWidget *pBVar1 = AddLeftText(gGlobals.CommonStrings[0x21f]);
    this->bottom+=pBVar1->GetHeight();
    pBVar1 = AddLeftText(element_labels[resist->element]);
    pBVar1->SetCoords(this->x + 0x10,this->bottom);
    sprintf(buff,"%.0f",(1.0f - resist->percent) *100.0f);
    pBVar1 = AddRightText(buff);
    this->bottom+=pBVar1->GetHeight();
  }
}

WidgetItemDetail::WidgetItemDetail(WeaponInstance *wep):WidgetMenu() {
  SlimFont;
  SidePopup();
  this->var5E = (wep->base).id;
  PrintNameIcon((wep->base).name);
  PrintWeaponType(weapon_strings[wep->weaponType]);
  PrintAspect((wep->base).aspect);
  PrintStrReq(wep->reqStr);
  PrintBaseHit(wep->hit);
  PrintDamage(wep->damage);
  PrintStatMod((wep->base).statMod);
  PrintSkillInfo(wep->SkillMod);
  PrintMagicInfo((u8*)wep->enchantment);
  PrintEnchantment((wep->base).spellCharge);
  PrintResistance(wep->resist);
  NormalFont;
}

WidgetItemDetail::WidgetItemDetail(ArmorInstance *armor)
:WidgetMenu(){
  char *pcVar1;
  StatMod *pSVar2;
  CharSheet *pCVar3;
  short sVar5;
  FontStruct *pFVar6;
  Borg8Enum BVar7;
  BaseWidget *pBVar10;
  ulong uVar11;
  byte bVar12;
  byte bVar13;
  u8 uVar14;
  u8 uVar15;
  char acStack_128 [296];
  SlimFont;
  SidePopup();
  pcVar1 = (armor->base).name;
  this->var5E = (ushort)(armor->base).id;
  PrintNameIcon(pcVar1);
  PrintAspect((armor->base).aspect);
  AddLeftText(gGlobals.CommonStrings[0x220]);
  sprintf(acStack_128,"%u",armor->Protect);
  pBVar10 = AddRightText(acStack_128);
  this->bottom+=pBVar10->GetHeight();
  if ((ushort)(armor->base).id >> 8 == 6) {
    AddLeftText(gGlobals.CommonStrings[0x221]);
    sprintf(acStack_128,"%u",armor->DEF);
  pBVar10 = AddRightText(acStack_128);
  this->bottom+=pBVar10->GetHeight();
  }
  AddLeftText(gGlobals.CommonStrings[0x222]);
  PrintPlus(armor->dex,acStack_128);
  pBVar10 = AddRightText(acStack_128);
  pBVar10 = AddRightText(acStack_128);
  this->bottom+=pBVar10->GetHeight();
  AddLeftText(pcVar1);
  PrintPlus(armor->stealth,acStack_128);
  pBVar10 = AddRightText(acStack_128);
  this->bottom+=pBVar10->GetHeight();
  PrintStatMod((armor->base).statMod);
  PrintSkillInfo((StatMod *)armor->skillmod);
  PrintMagicInfo((u8*)armor->enchantment);
  PrintEnchantment((armor->base).spellCharge);
  PrintResistance(armor->resist);
  pCVar3 = (gGlobals.party)->Members[gPartyPicker];
  if (pCVar3){
  this->bottom = 0xd5;
  bVar12 = Entity::GetShieldDefence(pCVar3,(ItemID)0x0);
  bVar13 = Entity::GetShieldDefence(pCVar3,(ItemID)this->var5E);
  sprintf(acStack_128,"(%ld)",bVar13);
  pBVar10 = WClipTXT(acStack_128);
  this->bottom -= pBVar10->GetHeight();
  sVar5 = ItemDetailsWidth - (short)pBVar10->GetWidth();
  pBVar10->SetCoords(sVar5,this->bottom);
  this->Link(pBVar10);
  uVar14 = 0;
  if ((char)bVar12 < (char)bVar13) {
    uVar15 = 0x80;
LAB_8003bbe8:
    pBVar10->SetColor(uVar14,uVar15,0,0xff);
  }
  else {
    if ((char)bVar13 < (char)bVar12) {
      uVar14 = 0x80;
      uVar15 = 0;
      goto LAB_8003bbe8;
    }
    pBVar10->SetColor(0x82,0x50,0x50,0xff);
  }
  sprintf(acStack_128,"%ld",bVar12);
  pBVar10 = WClipTXT(acStack_128);
  pBVar10->SetColor(0x82,0x50,0x50,0xff);
  pBVar10->SetCoords(sVar5 - pBVar10->GetWidth(),this->bottom);
  this->Link(pBVar10);
  pBVar10 =  WClipTXT(gGlobals.CommonStrings[0x224]);
  pBVar10->SetColor(0x82,0x50,0x50,0xff);
  pBVar10->SetCoords(this->x,this->bottom);
  this->Link(pBVar10);
  u8 lVar8 = Entity::GetArmorProtect(pCVar3,0);
  u8 lVar9 = Entity::GetArmorProtect(pCVar3,this->var5E);
  sprintf(acStack_128,"(%ld)",lVar9);
  pBVar10 = WClipTXT(acStack_128);
  this->bottom-=pBVar10->GetHeight();
  sVar5 = ItemDetailsWidth -pBVar10->GetWidth();
  pBVar10->SetCoords(sVar5,this->bottom);
  this->Link(pBVar10);
  uVar14 = 0;
  if (lVar8 < lVar9) {
    uVar15 = 0x80;
LAB_8003be00:
    pBVar10->SetColor(uVar14,uVar15,0,0xff);
  }
  else {
    if (lVar9 < lVar8) {
      uVar14 = 0x80;
      uVar15 = 0;
      goto LAB_8003be00;
    }
    pBVar10->SetColor(0x82,0x50,0x50,0xff);
  }
  sprintf(acStack_128,"%ld",lVar8);
  pBVar10 = WClipTXT(acStack_128);
  pBVar10->SetColor(0x82,0x50,0x50,0xff);
  pBVar10->SetCoords(sVar5 - (short)pBVar10->GetWidth(),this->bottom);
  this->Link(pBVar10);
  pBVar10 = WClipTXT(gGlobals.CommonStrings[0x225]);
  pBVar10->SetColor(0x82,0x50,0x50,0xff);
  pBVar10->SetCoords(this->x,this->bottom);
  this->Link(pBVar10);
  }
  NormalFont;
}

WidgetItemDetail::WidgetItemDetail(GearInstance *gear):WidgetMenu() {
  BaseWidget *pBVar6;
  char buff [280];
  
  SlimFont;
  SidePopup();
  this->var5E = (ushort)(gear->base).id;
  PrintNameIcon((gear->base).name);
  PrintAspect((gear->base).aspect);
  AddLeftText(gGlobals.CommonStrings[0x226]);
  sprintf(buff,"%u",(uint)gear->STR);
  BaseWidget *pBVar6 = AddRightText(buff);
  this->bottom+=pBVar6->GetHeight();
  PrintStrReq(gear->INT);
  AddLeftText(gGlobals.CommonStrings[0x21b]);
  PrintPlus2(gear->damage,buff);
  pBVar6 = AddRightText(buff);
  this->bottom+=pBVar6->GetHeight();
  AddLeftText(gGlobals.CommonStrings[0x220]);
  PrintPlus2(gear->Protection,buff);
  pBVar6 = AddRightText(buff);
  this->bottom +=pBVar6->GetHeight();
  PrintStatMod((gear->base).statMod);
  PrintSkillInfo((StatMod *)gear->skillMod);
  PrintMagicInfo((u8*)gear->enchantment);
  PrintEnchantment((gear->base).spellCharge);
  if ((ushort)(gear->base).id >> 8 == 0xd) {
    SpellCharges *pSVar3 = (gear->base).spellCharge;
    if (pSVar3){
      if (pSVar3->Charges) {
        AddLeftText(gGlobals.CommonStrings[0x227]);
        sprintf(buff,"%d",gear->base.spellCharge->Charges);
        pBVar6 = AddRightText(buff);
        this->bottom+=pBVar6->GetHeight();
      }
    }
  }
  PrintResistance(gear->resist);
  NormalFont;
}

Gfx* WidgetItemDetail::Render(Gfx *param_2,u16 param_3,u16 param_4,u16 param_5,u16 param_6) {
  SlimFont;
  param_2= RenderChildren(param_2,param_3,param_4,param_5,param_6);
  NormalFont;
  return param_2;
}

u8 WidgetItemDetail::Tick() {
  SlimFont;
  u8 ret = TickChildren();
  NormalFont;
  return ret;
}

BaseWidget* WidgetItemDetail::Control(controller_aidyn*cont){
  if((cont->input_2&C_DOWN)==0){
    PlayAudioSound(&gGlobals.SFXStruct,0x74e,0,1.0,0x3c,0);
    this->state = 5;
  }
  return NULL;
}
WidgetItemDetail::~WidgetItemDetail(){WidgetMenu::~WidgetMenu();}

u32 WidgetItemDetail::GetNumber(){return WidgetN_Other;}