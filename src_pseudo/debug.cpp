#include "globals.h"
#include "debug.h"
#include "armordb.h"
#include "chestdb.h"
#include "weapondb.h"
#include "gamestatemod.h"
#include "gamestateCheats.h"
#include "widgets/credits.h"

#ifdef DEBUGVER
u32 gZoneEngineHide=0;
WidgetDebugBig* WidgetDebugBigPointer=NULL;
extern void(*debug_menu_funcs[])(void)={
    debug_gamestatefunnel,
    NULL,
    gamestste_cheats,
    debug_add_party_member,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    debug_clear_inventory,
    load_credits_instead,
    debug_placebo_toggle,
    toggle_enemies_hostile,
    toggle_only_tp_active,
    debug_accessDB,
    bad_ref_obj_hunt,
};

void init_big_debug_menu(void){
  WidgetDebugBigPointer = new WidgetDebugBig();
  gZoneEngineHide = 1;
}

void WDBBigExecOption(BaseWidget *param_1){
  gZoneEngineHide = 0;
  freeWidgetFunc = NULL;
  WidgetDebugBigPointer->ExecOption(param_1);
  if (WidgetDebugBigPointer) WidgetDebugBigPointer->~WidgetDebugBig();
  WidgetDebugBigPointer = NULL;
}

WidgetDebugBig::WidgetDebugBig():WidgetMenu(){
  BaseWidget *pBVar1 = Utilities::DebugBackground(this,0x28,10,0xfa,200,0,0,0,0xff);
  this->scrollMenu = Utilities::AddScrollMenu(pBVar1,0x15,0x32,0x14,0x32,0x14,300,0xdc,0xe1,0xe1,0xe1,0xff,0);
  for(u16 i=0;i<21;i++) {AddEntry(i);}
  freeWidgetFunc = WDBBigExecOption;
  WHANDLE->AddWidget(this);
}

WidgetDebugBig::~WidgetDebugBig(){
  WHANDLE->FreeWidget(this);
  WidgetMenu::~WidgetMenu();
}

BaseWidget * WidgetDebugBig::AFunc(){return Utilities::GetHighlightedEntry(this->scrollMenu);}

BaseWidget * WidgetDebugBig::BFunc(){return this;}

BaseWidget * WidgetDebugBig::UpFunc(){
    this->scrollMenu->UpFunc();
    return NULL;
}

BaseWidget * WidgetDebugBig::UpFunc(){
    this->scrollMenu->DownFunc();
    return NULL;
}
void WidgetDebugBig::AddEntry(u16 i){
    WidgetText* t=WTextSafe(gGlobals.CommonStrings[COMMONSTRING_DebugBigMenu00+i]);
    this->scrollMenu->Append(t);
    t->var5E=i;
}

void WidgetDebugBig::ExecOption(BaseWidget *param_2){
  if ((param_2 != this) && (debug_menu_funcs[param_2->var5E]))
    (*debug_menu_funcs[param_2->var5E])();
}

void debug_gamestatefunnel(void){
  if (debug_gamestatefunnel_sub()) gGlobals.playerCharStruct.unkState = 9;
}

void debug_clear_inventory(void){PARTY->ClearInventory();}

extern u16 enemyHostileFlag;
void toggle_enemies_hostile(void){enemyHostileFlag^= 1;}

extern u32 only_TP_active;
void toggle_only_tp_active(void){only_TP_active^= 1;}

void bad_ref_obj_hunt(void){voxel_index = (ushort)(voxel_index == 0);}

void load_credits_instead(void){WHANDLE->AddWidget(new WidgetCredits());}

void debug_accessDB(void){
  WHANDLE->AddWidget(new WidgetItemDB());
  freeWidgetFunc = debug_freeDBMenu;
  gZoneEngineHide = 1;
}

void debug_freeDBMenu(BaseWidget *param_1){
  freeWidgetFunc = NULL;
  gZoneEngineHide = 0;
  WHANDLE->FreeWidget(param_1);
  if (param_1) param_1->~BaseWidget();
}

BaseWidget * UnkWidget::UpFunc(){
    this->scrollMenu->UpFunc();
    return NULL;
}

BaseWidget * UnkWidget::DownFunc(){
    this->scrollMenu->DownFunc();
    return NULL;
}

WidgetItemDB::WidgetItemDB(){
    WidgetMenu();
    char* titles[]={"ARMOR","SHIELD","ITEM","WEAPON","POTION"};
    FUN_8004ce14(this,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0,0,0,200);
    this->scrollMenu=Utilities::AddScrollMenu(this,5,0x14,0x14,0x14,0x14,300,0xdc,0xe1,0xe1,0xe1,0xff,0);
    for(u16 i=0;i<5;i++){
        WidgetText* title=WText(titles[i]);
        title->var5E=i;
        this->scrollMenu->Append(title);
    }
}

WidgetItemDB::~WidgetItemDB(){
  ItemID IVar1;
  u32 uVar2;
  BaseWidget *iVar3;
  WidgetItemDBItem *pBVar4;
  u16 i;
  char *pcVar7;
  
  uVar2 = this->unk80;
  if ((uVar2) && (iVar3 = this->scrollMenu->AFunc(),iVar3 != NULL)) {
    pBVar4 = NULL;
    switch(iVar3->var5E) {
    case 0:
      pBVar4 = new WidgetItemDBItem(gArmorDBp->armors);
      for(i=0;i<gArmorDBp->armors;i++){
                  IVar1 = gArmorDBp->Armor[i].ID;
          sprintf(gGlobals.text,"%u %s %u (%u %u)   %u",(ulonglong)(ushort)IVar1,
                      &gArmorDBp->Armor[i].name,i,(uint)((ushort)IVar1 >> 8),
                      (ushort)IVar1 & 0xff,ArmorList[i] + 0x500);
          pBVar4->Append(gGlobals.text,IVar1);
      }
      break;
    case 1:
      pBVar4 = new WidgetItemDBItem(gArmorDBp->sheilds);
      for(i=gArmorDBp->armors;i<gArmorDBp->total;i++){
          IVar1 = gArmorDBp->Armor[i].ID;
          sprintf(gGlobals.text,"%u %s %u (%u %u)   %u",(ushort)IVar1,
                      &gArmorDBp->Armor[i].name,i,(uint)((ushort)IVar1 >> 8),
                      (ushort)IVar1 & 0xff,ArmorList[i] + 0x600);
          pBVar4->Append(gGlobals.text,IVar1);
      }
      break;
    case 2:
      pBVar4 = new WidgetItemDBItem(gItemDBp->total);
      for(i=0;i<gItemDBp->total;i++){
                  IVar1 = gItemDBp->Gear[i].ID;
          sprintf(gGlobals.text,"%u %s %u (%u %u)   %u",IVar1,
                      gItemDBp->Gear[i].name,i,IVar1 >> 8,
                      IVar1 & 0xff,itemID_array[i]);
          pBVar4->Append(gGlobals.text,IVar1);
      }
      break;
    case 3:
      pBVar4 = new WidgetItemDBItem((ushort)gWeaponsDB->Total);
      for(i=0;i<gWeaponsDB->Total;i++){
        IVar1 = gWeaponsDB->weapons[i].ID;
        sprintf(gGlobals.text,"%u %s %u (%u %u)   %u",IVar1,
                      gWeaponsDB->weapons[i].name,pcVar7,
                      ((ushort)IVar1 >> 8),(ushort)IVar1 & 0xff,
                      weaponList[i] + 0x700);
          pBVar4->Append(gGlobals.text,IVar1);
      }
      break;
    case 4:
      pBVar4 = new WidgetItemDBItem(17);
      for(i=0;i<17;i++) {
        ItemID uVar5 = i + 0x1000;
        sprintf(gGlobals.text,"%u %s %u (%u %u)   %u",uVar5,potion_names[i],
                    i,(uVar5 & 0xffff) >> 8,uVar5 & 0xff,uVar5);
        pBVar4->Append(gGlobals.text,uVar5);
      }
    }
    WHANDLE->AddWidget(pBVar4);
    freeWidgetFunc = debug_freeDBMenu;
    gZoneEngineHide = 1;
  }
  WidgetMenu::~WidgetMenu();
}

BaseWidget* WidgetItemDB::AFunc(){this->unk80=1;return this;}

BaseWidget* WidgetItemDB::BFunc(){this->unk80=0;return this;}

WidgetItemDBItem::WidgetItemDBItem(u16 length){
    WidgetMenu();
    FUN_8004ce14(this,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0,0,0,200);
    this->scrollMenu=Utilities::AddScrollMenu(this,length,0x14,0x14,0x14,0x14,300,0xdc,0xe1,0xe1,0xe1,0xff,0);
}

BaseWidget* WidgetItemDBItem::AFunc(){
    BaseWidget* w=this->scrollMenu->AFunc();
    if(w) PARTY->Inventory->AddItem(w->var5E,1);
    return NULL;
}

BaseWidget* WidgetItemDBItem::BFunc(){return this;}

void WidgetItemDBItem::Append(char *name,ushort id){
    WidgetText* w=new WidgetText(name,60);
    w->var5E=id;
    this->scrollMenu->Append(w);
}

UnkWidget::~UnkWidget(){WidgetMenu::~WidgetMenu();}

WidgetItemDBItem::~WidgetItemDBItem(){WidgetMenu::~WidgetMenu();}

#endif