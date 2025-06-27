#include "widgets/DollMenu.h"
#include "combat/CombatStruct.h"
#include "globals.h"
#include "menuImages.h"

u32 gItemSlotBorg8Indecies[]={
    BORG8_IconSlotSword,BORG8_IconSlotGlove,BORG8_IconSlotRing1,
    BORG8_IconSlotHelmet,BORG8_IconSlotAmulet,BORG8_IconSlotCloak,
    BORG8_IconSlotChest,BORG8_IconSlotCirclet,BORG8_IconSlotBoot,
    BORG8_IconSlotShield,BORG8_IconSlotStaff,BORG8_IconSlotRing2,
    BORG8_IconSlotScroll1,BORG8_IconSlotScroll2,BORG8_IconSlotScroll3};

DollEquipmentMenu::DollEquipmentMenu(CharSheet *param_2):WidgetMenu(){
  CLEAR(&this->icons);
  CLEAR(&this->icon_item_ids);
  for(u32 i=0;i<15;i++){
    this->icons[i] = WidgetB8(gItemSlotBorg8Indecies[i]);
    SetSlotCoords(i,this->icons[i]);
    this->Link(this->icons[i]);
  }
  GetSlotIcons(param_2);
}

DollEquipmentMenu::~DollEquipmentMenu(){
    this->unk7c.~GuiAnimationManager();
    WidgetMenu::~WidgetMenu();
}


void DollEquipmentMenu::GetSlotIcons(CharSheet *param_2){
  for(u32 i=0;i<15;i++) {
    ItemID id = GetEntityItemId(param_2,i);
    if (this->icon_item_ids[i] != id) GetSlotIcon(i,id);
  }
}

void DollEquipmentMenu::GetSlotIcon(u32 param_2,ItemID param_3){
  u8 abStack_38;
  u32 iconIndex;
  u8 abStack_30;
  
  if (this->icon_item_ids[param_2] != param_3) {
    if ((this->unk7c).present != 0) { // why not just Tick(10020)?
      this->unk7c.Tick(10000);
      this->unk7c.Tick(10);
      this->unk7c.Tick(10);
    }
    if (this->icons[param_2]) {
      abStack_38 = 0;
      this->unk7c.AddItem(new GuiAnimatorL(new GuiAnimatorU3(&(this->icons[param_2]->col).A,&abStack_38,0xf,&double_array_0),this->icons[param_2]));
      this->icons[param_2] = NULL;
    }
    this->icon_item_ids[param_2] = param_3;
    if (!param_3) iconIndex = gItemSlotBorg8Indecies[param_2];
    else GetItemImage(param_3,&iconIndex);
    WidgetBorg8* pBVar6 = WidgetB8(iconIndex);
    SetSlotCoords(param_2,pBVar6);
    this->Link(pBVar6);
    (pBVar6->col).A = 0;
    abStack_30 = 0xff;
    this->unk7c.AddItem(new GuiAnimatorU3(&(pBVar6->col).A,&abStack_30,0xf,&double_array_0));
    this->icons[param_2] = pBVar6;
  }
}

CombatEntity * DollGetCombatEntity(CharSheet *param_1){
  if (!gCombatP) return NULL;
  if (gCombatP->EntCount != 0) {
    for(u32 i=0;i<gCombatP->EntCount;i++){
        CombatEntity* cEnt=&gCombatP->combatEnts[i];
        if((cEnt)&&(cEnt->charSheetP == param_1))return cEnt;
    }
  }
  return NULL;
}
ItemID CharGear::GetEquippedOfType(CharGear *,u8 ,int );

ItemID DollEquipmentMenu::GetEntityItemId(CharSheet *chara,u8 slot){
    ItemID ret;
    switch(slot){
        case 0:
        ret=0;
        if(chara->weapons) ret=chara->weapons->base.id;
        if(gGlobals.SomeCase==3){
            CombatEntity* cEnt=DollGetCombatEntity(chara);
            if((cEnt)&&(cEnt->AtkType==3))ret=Potion_Fire;
        }
        break;
        case 1:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_GLOVE,1);
        break;
        case 2:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_RING,1);
        break;
        case 3:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_CLOAK,1);
        break;
        case 4:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_AMULET,1);
        break;
        case 5:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_CLOAK,1);
        break;
        case 6:
        if(chara->armor[0]) ret=chara->armor[0]->base.id;
        break;
        case 7:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_BELT,1);
        break;
        case 8:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_BOOTS,1);
        break;
        case 9:
        ret=0;
        if(chara->armor[1]) ret=chara->armor[1]->base.id;
        break;
        case 10:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_WAND,1);
        break;        
        case 11:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_RING,2);
        break;
        case 12:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_SCROLL,1);
        break;
        case 13:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_SCROLL,2);
        break;
        case 14:
        ret=CharGear::GetEquippedOfType(chara->pItemList,DB_SCROLL,3);
        break;
        default: CRASH("DollEquipmentMenu::GetEntityItemId","Invalid Equipment Slot.");
    }
    return ret;
}

void DollEquipmentMenu::SetSlotCoords(u32 slot,BaseWidget *w){
    u32 newX,newY;
    switch(slot){
        case 0:
        newX=28,newY=119;
        break;
        case 1:
        newX=28,newY=138;
        break;
        case 2:
        newX=28,newY=157;
        break;
        case 3:
        newX=58,newY=74;
        break;
        case 4:
        newX=58,newY=96;
        break;
        case 5:
        newX=48,newY=115;
        break;
        case 6:
        newX=68,newY=115;
        break;
        case 7:
        newX=58,newY=134;
        break;
        case 8:
        newX=58,newY=192;
        break;
        case 9:
        newX=88,newY=117;
        break;
        case 10:
        newX=88,newY=138;
        break;
        case 11:
        newX=88,newY=157;
        break;
        case 12:
        newX=108,newY=119;
        break;
        case 13:
        newX=108,newY=138;
        break;
        case 14:
        newX=108,newY=157;
        break;

    }
    w->SetWidth(16);
    w->SetHeight(16);
    w->SetCoords(newX,newY);
}

u8 DollEquipmentMenu::Tick(){
    this->unk7c.Tick(1);
    return TickChildren();
}

u32 DollEquipmentMenu::unkGetter(){return this->unk7c.present;}