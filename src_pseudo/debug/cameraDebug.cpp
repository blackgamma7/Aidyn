#include "debug.h"
#include "globals.h"

#if DEBUGVER

WidgetCameraDebug* camera_debug_pointer=NULL;
void build_camera_debug(u16 param_1) {
  if (camera_debug_pointer == NULL)
    camera_debug_pointer = new WidgetCameraDebug(param_1);
}

void camera_debug_clear(BaseWidget *param_1) {
  if (param_1 != NULL) param_1->~BaseWidget();
  freeWidgetFunc = run_dialougemode_funcs2;
  camera_debug_pointer = NULL;
}

WidgetCameraDebug::WidgetCameraDebug(u16 ind):WidgetMenu() {
  BaseWidget *pBVar5;
  
  this->currRefpoint = ind;
  WidgetScrollMenu* pBVar3 = Utilities::AddScrollMenu(
      Utilities::DebugBackground(this,0x28,10,200,200,0,0,0,0xff)
        ,0xe,0x32,0x14,0x32,0x14,300,0xdc,COLOR_OFFWHITE,0);
  this->Arr[0].unk2 = 4;
  this->Arr[0].unk3 = 1;
  this->Arr[0].unk4 = 0;
  this->scrollMenu = pBVar3;
  this->Arr[0].stringIndex = 0x86;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x86]);
  pBVar5->varU16 = 0;
  this->scrollMenu->Append(pBVar5);
  this->Arr[1].stringIndex = 0x87;
  this->Arr[1].unk2 = 0xc;
  this->Arr[1].unk3 = 1;
  this->Arr[1].unk4 = 0;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x87]);
  pBVar5->varU16 = 1;
  this->scrollMenu->Append(pBVar5);
  this->Arr[2].stringIndex = 0x88;
  this->Arr[2].unk2 = 8;
  this->Arr[2].unk3 = 1;
  this->Arr[2].unk4 = 0;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x88]);
  pBVar5->varU16 = 2;
  this->scrollMenu->Append(pBVar5);
  this->Arr[3].stringIndex = 0x89;
  this->Arr[3].unk2 = 10;
  this->Arr[3].unk3 = 1;
  this->Arr[3].unk4 = 0;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x89]);
  pBVar5->varU16 = 3;
  this->scrollMenu->Append(pBVar5);
  this->Arr[4].stringIndex = 0x8a;
  this->Arr[4].unk2 = 6;
  this->Arr[4].unk3 = 1;
  this->Arr[4].unk4 = 0;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8a]);
  pBVar5->varU16 = 4;
  this->scrollMenu->Append(pBVar5);
  this->Arr[5].stringIndex = 0x90;
  this->Arr[5].unk2 = 0x11;
  this->Arr[5].unk3 = 1;
  this->Arr[5].unk4 = 0;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x90]);
  pBVar5->varU16 = 5;
  this->scrollMenu->Append(pBVar5);
  this->Arr[6].stringIndex = 0x8b;
  this->Arr[6].unk2 = 5;
  this->Arr[6].unk3 = 1;
  this->Arr[6].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8b]);
  pBVar5->varU16 = 6;
  this->scrollMenu->Append(pBVar5);
  this->Arr[7].stringIndex = 0x8c;
  this->Arr[7].unk2 = 0xd;
  this->Arr[7].unk3 = 1;
  this->Arr[7].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8c]);
  pBVar5->varU16 = 7;
  this->scrollMenu->Append(pBVar5);
  this->Arr[8].stringIndex = 0x8d;
  this->Arr[8].unk2 = 9;
  this->Arr[8].unk3 = 1;
  this->Arr[8].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8d]);
  pBVar5->varU16 = 8;
  this->scrollMenu->Append(pBVar5);
  this->Arr[9].stringIndex = 0x8e;
  this->Arr[9].unk2 = 0xb;
  this->Arr[9].unk3 = 1;
  this->Arr[9].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8e]);
  pBVar5->varU16 = 9;
  this->scrollMenu->Append(pBVar5);
  this->Arr[10].stringIndex = 0x8f;
  this->Arr[10].unk2 = 7;
  this->Arr[10].unk3 = 1;
  this->Arr[10].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x8f]);
  pBVar5->varU16 = 10;
  this->scrollMenu->Append(pBVar5);
  this->Arr[0xb].stringIndex = 0x91;
  this->Arr[0xb].unk2 = 0xe;
  this->Arr[0xb].unk3 = 1;
  this->Arr[0xb].unk4 = 1;
  pBVar5 = WTextSafe(gGlobals.CommonStrings[0x91]);
  pBVar5->varU16 = 11;
  this->scrollMenu->Append(pBVar5);
  freeWidgetFunc = camera_debug_clear;
  WHANDLE->AddWidget(this);
}

WidgetCameraDebug::~WidgetCameraDebug(){
    WHANDLE->FreeWidget(this);
    WidgetMenu::~WidgetMenu();
}

BaseWidget * WidgetCameraDebug::AFunc() {
  BaseWidget *pBVar3 = Utilities::GetHighlightedEntry(this->scrollMenu);
  u16 uVar1 = pBVar3->varU16;
  if (this->Arr[uVar1].unk4 == 0) {
    new WidgetCDMenuB(this->Arr[uVar1].unk2,this->Arr[uVar1].unk3,this->currRefpoint);
  }
  else new WidgetCDMenuActor(this->Arr[uVar1].unk2,this->Arr[uVar1].unk3);
  if (this) this->~WidgetCameraDebug();
  return NULL;
}

BaseWidget * WidgetCameraDebug::BFunc(){return this;}

BaseWidget * WidgetCameraDebug::UpFunc(){
  this->scrollMenu->UpFunc();  
  return NULL;
}

BaseWidget * WidgetCameraDebug::DownFunc(){
  this->scrollMenu->DownFunc();  
  return NULL;
}

BaseWidget * WidgetCameraDebug::CUpFunc(){
  this->scrollMenu->UpFunc(); 
  this->scrollMenu->UpFunc(); 
  this->scrollMenu->UpFunc();  
  this->scrollMenu->UpFunc(); 
  this->scrollMenu->UpFunc(); 
  return NULL;
}

  BaseWidget * WidgetCameraDebug::CDownFunc(){
  this->scrollMenu->DownFunc(); 
  this->scrollMenu->DownFunc(); 
  this->scrollMenu->DownFunc();  
  this->scrollMenu->DownFunc(); 
  this->scrollMenu->DownFunc(); 
  return NULL;
}

WidgetCDMenuB::WidgetCDMenuB(u8 C,u8 B,u16 V):WidgetMenu() {
  this->val = V;
  this->txt = NULL;
  this->cmd = C;
  this->b = B;
  this->txt = Utilities::AddTextWidget(Utilities::DebugBackground(this,0x28,10,200,200,0,0,0,0xff),"1",0x32,0x14,COLOR_OFFWHITE);
  this->txt->varU16 = 1;
  WHANDLE->AddWidget(this);
}

WidgetCDMenuB::~WidgetCDMenuB(){
    WHANDLE->FreeWidget(this);
    WidgetMenu::~WidgetMenu();
}

BaseWidget * WidgetCDMenuB::AFunc() {
  if (this->b == 1)
   DialoguePreCallback(&dialougemode_pointer->inst,dialougemode_pointer->borg13_dat,
                    this->cmd,this->txt->varU16 + this->val);
  else
   DialogCallbackC(&dialougemode_pointer->inst,dialougemode_pointer->borg13_dat,
               this->cmd,this->txt->varU16 + this->val);
  return this;
}

BaseWidget * WidgetCDMenuB::BFunc(){return this;}

BaseWidget* WidgetCDMenuB::UpFunc() {
  this->txt->varU16++;
  sprintf(Utilities::GetWidgetText(this->txt),"%d",this->txt->varU16);
  return 0;
}

BaseWidget* WidgetCDMenuB::DownFunc() {
  if (this->txt->varU16 != 0) this->txt->varU16--;
  sprintf(Utilities::GetWidgetText(this->txt),"%d",this->txt->varU16);
  return 0;
}

BaseWidget* WidgetCDMenuB::CUpFunc(){
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    return NULL;
}

BaseWidget* WidgetCDMenuB::CDownFunc(){
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    return NULL;
}

WidgetCDMenuActor::WidgetCDMenuActor(u8 CMD,u8 VAL):WidgetMenu() {
  this->val = VAL;
  this->cmd = CMD;
  Borg13Data *pBVar1 = dialougemode_pointer->borg13_dat;
  this->scrollMenu = Utilities::AddScrollMenu(
         Utilities::DebugBackground(this,0x28,10,200,200,COLOR_BLACK),
         pBVar1->ActorCount,50,20,50,20,300,220,COLOR_OFFWHITE,0);
  for(u16 i=0;i<pBVar1->ActorCount;i++){
      WidgetText* entry = WTextSafe(gEntityDB->entities[GETINDEX((dialougemode_pointer->inst).actors[i].id)].Name);
      entry->varU16 = (dialougemode_pointer->inst).actors[i].id;
      this->scrollMenu->Append(entry);
  }
  WHANDLE->AddWidget(this);
}

WidgetCDMenuActor::~WidgetCDMenuActor(){
    WHANDLE->FreeWidget(this);
    WidgetMenu::~WidgetMenu();
}

BaseWidget * WidgetCDMenuActor::AFunc() {
  BaseWidget *w = Utilities::GetHighlightedEntry(this->scrollMenu);
  if (this->val == 1)
    DialoguePreCallback(&dialougemode_pointer->inst,dialougemode_pointer->borg13_dat,
                        this->cmd,w->varU16);
  else
    DialogCallbackC(&dialougemode_pointer->inst,dialougemode_pointer->borg13_dat,
               this->cmd,w->varU16);
  return this;
}

BaseWidget * WidgetCDMenuActor::BFunc(){return this;}

BaseWidget * WidgetCDMenuActor::UpFunc(){
  this->scrollMenu->UpFunc();  
  return NULL;
}

BaseWidget * WidgetCDMenuActor::DownFunc(){
  this->scrollMenu->DownFunc();  
  return NULL;
}

BaseWidget* WidgetCDMenuActor::CUpFunc(){
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    this->UpFunc();
    return NULL;
}

BaseWidget* WidgetCDMenuActor::CDownFunc(){
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    this->DownFunc();
    return NULL;
}

void WidgetCameraDebug::AddEntry(u8 ind,u16 strInd,u8 param_4,u8 param_5,u8 param_6){
  this->Arr[ind].stringIndex = strInd;
  this->Arr[ind].unk2 = param_4;
  this->Arr[ind].unk3 = param_5;
  this->Arr[ind].unk4 = param_6;
  WidgetText* entry = WTextSafe(gGlobals.CommonStrings[strInd]);
  entry->varU16 = ind;
  this->scrollMenu->Append(entry);
}

#endif