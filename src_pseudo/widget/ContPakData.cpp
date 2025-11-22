#include "globals.h"
#include "widgets/ContPakData.h"
#include "widgets/widgetGroup.h"
#include "CRC.h"
#include "QuestData.h"

#define FILENAME "./src/controllerpakdata.cpp"

WidgetContPakData *
WContPakData_Save(u16 param_1,u16 param_2,void *param_3,Color32 *param_4,Color32 *param_5,
                 Color32 *param_6){
  contPakDat = new WidgetContPakDataSave(param_1,param_2,param_3,param_3,param_4,param_5,param_6);
  Controller::GetDelay(0);
  return contPakDat;
}

WidgetContPakData *
WContPakData_Load(u16 param_1,u16 param_2,void *param_3,void *param_4,Color32 * param_5,
                 Color32 *param_6,Color32* param_7){
  contPakDat = new WidgetContPakDataLoad(param_1,param_2,param_3,param_4,param_5,param_6,param_7);
  Controller::GetDelay(0);
  return contPakDat;
}

BaseWidget * FUN_80085d64(BaseWidget *wo,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->GetPFSErr();
  return 0;
}

BaseWidget * FUN_80085da0(BaseWidget *wo,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->m80086bd0();
  return 0;
}

BaseWidget * FUN_80085dcc(BaseWidget *wo,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->TryRepair();
  return 0;
}

BaseWidget * FUN_80085e08(BaseWidget *wo,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->m80086d78();
  return 0;
}

BaseWidget * FUN_80085e44(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,2,gGlobals.CommonStrings[0x174],0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0x175],FUN_80086018,0x80);
  pBVar2->varU16 = w1->varU16;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x176],NULL,0x80));
  pWVar1->Update();
  return NULL;
}

BaseWidget * FUN_80085f08(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,2,gGlobals.CommonStrings[0x174],0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0x19b],FUN_80085fcc,0x80);
  pBVar2->varU16 = w1->varU16;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x176],NULL,0x80));
  pWVar1->Update();
  return NULL;
}

BaseWidget * FUN_80085fcc(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->LoadSaveFile((u8)w1->varU16);
  return NULL;
}

BaseWidget * FUN_80086018(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->EraseFile((u8)w1->varU16);
  return NULL;
}

BaseWidget * FUN_80086054(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->m80086d30();
  return 0;
}

BaseWidget * FUN_80086080(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->ClearScrollMenu();
  return FUN_80086054(w0,w1);
}

BaseWidget * FUN_800860cc(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->FreeWaitPrompt();
  return FUN_80086080(w0,w1);
}

BaseWidget *  FUN_80086118(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->m80086d3c();
  return NULL;
}

BaseWidget *  FUN_80086144(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->vmE8();
  return NULL;
}

BaseWidget * FUN_80086180(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,1,gGlobals.CommonStrings[0x18a],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->Update();
  return NULL;
}

BaseWidget * repeated_space_warning(BaseWidget * w0,BaseWidget * w1){  
  Controller::GetDelay(0);
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,1,gGlobals.CommonStrings[0x189],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->Update();
  return NULL;
}

void FUN_80086290(BaseWidget *param_1){
  Controller::GetDelay(0);
  contPakDat->FreeWidget(param_1);
}

BaseWidget * FUN_800862c8(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->m80086e08();
  return NULL;
}

WidgetClipText * FUN_800862f4(u8 param_1,u16 param_2,char *txt,BaseWidget * (*param_4)(BaseWidget *,BaseWidget *)){
  WidgetClipText* w = WClipTXTSafe(txt);
  w->varU8 = param_1;
  w->varU16 = param_2;
  w->AButtonFunc = param_4;
  return w;
}


WidgetContPakData::WidgetContPakData(u16 param_2,u16 param_3,void (*param_4)(),
          void (*param_5)(),u32 b8,Color32 *col0,Color32 *col1,Color32 *col2):WidgetMenu(){

  (this->col0).R = col0->R;
  (this->col0).G = col0->G;
  (this->col0).B = col0->B;
  (this->col0).A = col0->A;
  (this->col1).R = col1->R;
  (this->col1).G = col1->G;
  (this->col1).B = col1->B;
  (this->col1).A = col1->A;
  (this->col2).R = col2->R;
  (this->col2).G = col2->G;
  (this->col2).B = col2->B;
  (this->col2).A = col2->A;
  this->attemptedRepair = true;
  this->col.A = 0;
  CLEAR(&this->saveDatsP);
  this->sliders = NULL;
  this->scroll = NULL;
  this->OtherState = 0;
  this->pfsErr = 0;
  this->saveSlot = 0;
  this->AidynSaveSlots = 0;
  this->unk290 = 0;
  this->funcA = param_4;
  this->funcB = param_5;
  this->unk290 = 0;
  this->unk292 = param_2;
  this->unk294 = param_3;
  this->titleIndex = b8;
  this->waitPrompt = NULL;
  this->showingSaveFiles = false;
  this->titleWidget = NULL;
  this->contStatus = 0;
  Controller::GetStatus(0,&this->contStatus);
  this->wHandler.Init(font_pointer);
  CRCTable::Init();
  ReadPakPrompt();
}

WidgetContPakData::~WidgetContPakData(){
  CRCTable::Free();
  for(u8 i=0;i<SaveFileMax;i++){
    FREEPTR(this->saveDatsP[i].datStart,513);
  }
  this->FreeWaitPrompt();
  if ((this->titleWidget) && (this->titleWidget->borg8))
     FREEQB8(this->titleWidget->borg8);
  ClearScrollMenu();
  this->wHandler.Free(2);
  WidgetMenu::~WidgetMenu();
}

u8 WidgetContPakData::Tick(){
  u8 ret;
  
  if (this->wHandler.GetTail()) {
    CheckContStatus();
    return this->wHandler.Tick(1);
  }
  Utilities::SetAlpha(this,this->col.A);
  ret = false;
  if (this->attemptedRepair){
    if (gGlobals.BigAssMenu == NULL)
      ret = this->WidgetMenu::Tick();
    else{
        for(u32 i=0;i<gGlobals.delta;i++){
            ret = this->WidgetMenu::Tick();
        }
    }
  }
  switch(this->OtherState) {
  case 0:
    TestPak2();
    break;
  case 1:
    PfsErrAction();
    break;
  case 2:
    m80086F40();
    break;
  case 3:
    ReadSaveFile();
    break;
  case 4:
    m800871c8();
    break;
  case 5:
    m800873ac();
    break;
  case 6:
    m800873f0();
    break;
  case 8:
    m80087424();
    break;
  case 9:
    SavingPrompt();
    break;
  case 10:
    m80087548();
    break;
  case 0xb:
    m8008759c();
  }
  if (this->waitPrompt) Utilities::SetAlpha(this->waitPrompt,0xff);
  return ret;
}

Gfx * WidgetContPakData::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y){
  if (!this->wHandler.GetTail()) {
    if (this->waitPrompt == NULL) {
      if (this->showingSaveFiles) {
        g = this->WidgetMenu::Render(g,x0,y0,x1,y);
      }
    }
    else g = this->waitPrompt->Render(g,x0,y0,x1,y);
  }
  else {
    if (this->titleWidget) {
      g = this->titleWidget->Render(g,x0,y0,x1,y);
    }
    g = this->wHandler.Render(g,x0,y0,x1,y);
  }
  return g;
}

BaseWidget * WidgetContPakData::AFunc(){
  BaseWidget *w;
  
  if ((this->scroll) &&
     (w = Utilities::GetHighlightedEntry(this->scroll), w != NULL)) {
    return w->AFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::BFunc(){
  this->OtherState = 6;
  return NULL;
}

BaseWidget * WidgetContPakData::UpFunc(){
  if (this->scroll) {
    PlayAudioSound(&gGlobals.SFXStruct,0x73B,0,1.0,0x1e,0);
    this->scroll->UpFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::DownFunc(){
  if (this->scroll) {
    PlayAudioSound(&gGlobals.SFXStruct,0x73B,0,1.0,0x1e,0);
    this->scroll->DownFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::LeftFunc(){
  if (this->sliders) {
    this->sliders->ShiftLeft();
    this->vmF0();
    PlayAudioSound(&gGlobals.SFXStruct,0x73d,0,1.0,0x1e,0);
  }
  return NULL;
}


BaseWidget * WidgetContPakData::RightFunc(){
  
  if (this->sliders) {
    this->sliders->ShiftRight();
    this->vmF0();
    PlayAudioSound(&gGlobals.SFXStruct,0x73d,0,1.0,0x1e,0);
  }
  return NULL;
}


BaseWidget * WidgetContPakData::Control(controller_aidyn *param_2){
  BaseWidget *pBVar2;
  if (!this->wHandler.GetTail()) {
    if (((this->sliders == NULL) ||
        (this->sliders->HasPrevFile())) ||
       (this->OtherState != 4)) {
      pBVar2 = NULL;
    }
    else pBVar2 = this->BaseWidget::Control(param_2);
  }
  else {
    pBVar2 = this->wHandler.Control((ControllerFull*)param_2);
  }
  return pBVar2;
}

void WidgetContPakData::m80086bd0(){
  open_mempak_menu(1,0,0x57,0x17,true);
  this->unk290 = 1;
  this->OtherState = 4;
}

void WidgetContPakData::GetPFSErr(){
  Pfs2xCheck(this->pfsErr,Controller::GetPFSERR(0));
  this->OtherState = 0;
}

void WidgetContPakData::TryRepair(){  
  this->attemptedRepair = true;
  if (Controller::RepairPak(0) == 0) RepairOK();
  else RepairFail();
}

void WidgetContPakData::EraseFile(u8 param_2){
  Pfs2xCheck(this->pfsErr,Controller::ErasePakSave(param_2,0));
  if (this->pfsErr == 0) this->OtherState = 0;
  else this->OtherState = 1;
}

void WidgetContPakData::m80086d30(){this->OtherState=6;}


BaseWidget * WidgetContPakData::m80086d3c(){
  BaseWidget *w = this->sliders->getCurrFile();
  if (w) w = w->AFunc();
  return w;
}

void WidgetContPakData::m80086d78(){
  this->wHandler.AddWidget(new WidgetTimed(60,FUN_80085dcc));
  this->attemptedRepair = 0;
}


void WidgetContPakData::FreeWidget(BaseWidget *param_2){
  this->wHandler.FreeWidget(param_2);
  if (param_2) param_2->~BaseWidget();
}

void WidgetContPakData::m80086e08(){
  ClearScrollMenu();
  m80086d30();
}

void WidgetContPakData::TestPak2(){
  Pfs2xCheck(this->pfsErr,Controller::GetPFSERR(0));
  this->OtherState = 1;
}

void WidgetContPakData::PfsErrAction(){
  this->OtherState = 4;
  switch(this->pfsErr) {
  case 0:
    this->PfsErrOK();
    break;
  case PFS_ERR_NOPACK:
    this->PfsErrNoPak();
    break;
  case PFS_ERR_NEW_PACK:
    this->NewContPak();
    break;
  case PFS_ERR_INCONSISTENT:
  case PFS_ERR_ID_FATAL:
    this->PfsErrBadPak();
    break;
  case PFS_ERR_CONTRFAIL:
  case PFS_ERR_INVALID:
  case PFS_ERR_BAD_DATA:
  case PFS_DATA_FULL:
  case PFS_DIR_FULL:
  case PFS_ERR_EXIST:
    this->PfsErrBadRead();
    break;
  case PFS_ERR_DEVICE:
    this->PfsErrDevice();
    break;
  default:
    this->PfsErrBadRead();
  }
}

void WidgetContPakData::m80086F40(){
  ReadPakPrompt();
  if (9 < gContPakDatTimer++) {
    gContPakDatTimer = 0;
    this->saveSlot = 0;
    this->AidynSaveSlots = 0;
    this->OtherState = 3;
    if (!this->scrollInited) m80087c88();
    else ClearScrollMenu();
    Utilities::SetAlpha(this,this->col.A);
    this->unk();
  }
}

void WidgetContPakData::ReadSaveFile(){
  fileState_aidyn filestate;
  
  u8 index = this->saveSlot++;
  if (this->saveSlot>=SaveFileMax) {
    this->showingSaveFiles = true;
    this->ShowSaveFiles();
    this->OtherState = 4;
    return;
  }
  this->pfsErr = Controller::GetPakSaveState(&filestate,(u32)index,0);
  if (this->pfsErr == PFS_ERR_BAD_DATA) {
    this->pfsErr = Controller::GetPakSaveState(&filestate,(u32)index,0);
    if (this->pfsErr == PFS_ERR_BAD_DATA) goto LAB_80087164;
  }
  if (this->pfsErr) return;
  if (filestate.comp_code != THQCompCode) return;
  if (filestate.game_code != AidynGameCode) return;
  SaveDatStruct *buff = this->saveDatsP[index].datStart;
  if (buff == NULL){
    ALLOC(buff,988);
    this->saveDatsP[index].datStart = buff;
  }
  this->pfsErr = Controller::ReadPakSave((u8 *)buff,(u16)index,0,sizeof(SaveDatStruct),0);
  if (this->pfsErr == PFS_ERR_BAD_DATA) {
    this->pfsErr = Controller::ReadPakSave((u8 *)buff,(u16)index,0,sizeof(SaveDatStruct),0);
    this->OtherState = 4;
    CorruptSaveFile(index);
    return;
  }
  if (this->pfsErr) {
    this->OtherState = 1;
    return;
  }
  if (QuestData::VerifyChecksum(buff)) {
    QuestData::SetPointers(buff,this->saveDatsP + index);
    LoadSliders(this->saveDatsP + index,index);
    this->AidynSaveSlots++;
    return;
  }
LAB_80087164:
  this->OtherState = 4;
  CorruptSaveFile(index);
  return;
}

void WidgetContPakData::m800871c8(){
  FreeWaitPrompt();
  if (this->unk290 == 0) CheckContStatus();
  else {
    if (FUN_80088d80()) {
      this->OtherState = 0;
      this->unk290 = 0;
      if (FUN_80088e2c()) this->OtherState = 5;
    }
  }
}


void WidgetContPakData::m80087230(){
  m80087ec0();
  this->OtherState = 0;
  TestPak2();
}

void WidgetContPakData::m80087260(){this->OtherState = 8;}

void WidgetContPakData::CheckContStatus(){
  u8 CVar1;
  u8 CVar2;
  u8 PVar4;
  
  if (this->OtherState != 8) {
    CVar1 = this->contStatus;
    if (Controller::GetStatus(0,&this->contStatus)) CVar2 = this->contStatus;
    else {
      if (!Controller::GetStatus(0,&this->contStatus)) {
        m80087260();
        return;
      }
      CVar2 = this->contStatus;
    }
    if (((CVar2 != CONT_CARD_ON) || (CVar1 != CONT_CARD_ON)) && (CVar2 != CVar1)) {
      if ((CVar2 == (CONT_CARD_PULL|CONT_CARD_ON)) && (CVar1 == CONT_CARD_PULL)) {
        Pfs2xCheck(PVar4,Controller::GetPFSERR(0));
        m80087ec0();
        if (PVar4 == PFS_ERR_NEW_PACK) this->pfsErr = PFS_ERR_NEW_PACK;
        else {
          if (PVar4) {
            this->pfsErr = PVar4;
            this->OtherState = 1;
            return;
          }
          this->pfsErr = PFS_ERR_NEW_PACK;
        }
        this->OtherState = 1;
      }
      else if (CVar2 == CONT_CARD_PULL) {
        if (CVar1 == CONT_CARD_ON) m80087230();
        else if (CVar1 != CONT_CARD_PULL) m80087230();
      }
    }
  }
}

void WidgetContPakData::m800873ac(){
  if (this->funcA) (*this->funcA)();
  contPakDat = NULL;
  this->OtherState = 7;
}

void WidgetContPakData::m800873f0(){
  this->OtherState = 7;
  if (this->funcB) (*this->funcB)();
  contPakDat = NULL;
}

void WidgetContPakData::m80087424(){if (Controller::CheckStatus(0)) m80087230();}


void WidgetContPakData::SavingPrompt(){
  bool bVar1;
  WidgetChoiceDia *pWVar2;
  BaseWidget *pBVar3;
  Color32 aCStack_88;
  Color32 aCStack_48;
  
  this->unk2b9 = 20;
  FreeWaitPrompt();
  aCStack_88.R = 0xe1;
  aCStack_88.G = 0xe1;
  aCStack_88.B = 0xe1;
  aCStack_88.A = 0xff;
  aCStack_48.R = 0;
  aCStack_48.G = 0;
  aCStack_48.B = 0;
  aCStack_48.A = 0;
  this->waitPrompt = new WidgetChoiceDia(1,"Saving. Do not turn the power OFF until the save is complete.",
                             100,&aCStack_88,&aCStack_48,1,0,0);
  if (gGlobals.BigAssMenu) Utilities::MoveWidget(this->waitPrompt,0x19,0);
  this->waitPrompt->AppendScrollMenu(new WidgetText("...",4));
  this->waitPrompt->Update();
  this->OtherState = 10;
}

void WidgetContPakData::m80087548(){
  if (!this->unk2b9) {
    this->OtherState = 11;
    this->unk2b9 = 20;
    this->WriteSaveFile(this->unk2ba);
  }
  else this->unk2b9--;
}

void WidgetContPakData::m8008759c(){
  if (!this->unk2b9) {
    FreeWaitPrompt();
    this->vm100();
  }
  else this->unk2b9--;
}

u32 WidgetContPakData::WriteSaveFile(u8 slot){}

void WidgetContPakData::vm100(){}

void WidgetContPakData::PfsErrOK(){this->OtherState=2;}

void WidgetContPakData::PfsErrNoPak(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0xca],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xcc],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakData::NewContPak(){
  u8 PVar3;
  Pfs2xCheck(PVar3,Controller::GetPFSERR(0));
  if (PVar3 == 0) {
    WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0xae],0);
    pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
    pWVar1->Update();
  }
  else {
    this->pfsErr = PVar3;
    PfsErrAction();
  }
}

void WidgetContPakData::PfsErrDevice(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1e3],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xcc],FUN_800860cc,0x80));
  pWVar1->Update();
}

void WidgetContPakData::CourrputPak(){ConfirmOverwrite(gGlobals.CommonStrings[0x19c]);}

void WidgetContPakData::DamagedPak(){ConfirmOverwrite(gGlobals.CommonStrings[0x19d]);}

void WidgetContPakData::ConfirmOverwrite(char *txt){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,txt,0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19e],FUN_80085dcc,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80085dcc,0x80));
  pWVar1->Update();
}

void WidgetContPakData::PfsErrBadRead(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a1],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakData::PfsErrBadPak(){
  if (Controller::GetStatus2(0)) CourrputPak();
  else DamagedPak();
}

void WidgetContPakData::CorruptSaveFile(u8 param_2){
  Gsprintf(gGlobals.CommonStrings[0xbd],param_2 + 1);
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,gGlobals.text,0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0xbe],FUN_80086018,0x80);
  pBVar2->varU16 = (u16)param_2;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakData::RepairFail(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,gGlobals.CommonStrings[0x1a2],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x1a4],FUN_80085e08,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakData::RepairOK(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a3],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->Update();
}

void WidgetContPakData::LoadSliders(SaveDatPointers *param_2,u8 param_3){
  s16 bounds [4];
  
  bounds[0] = this->unk292;
  bounds[1] = this->unk294;
  bounds[2] = bounds[0] + 0xdb;
  bounds[3] = bounds[1] + 0xc0;
  ControllerPakSliders *pCVar1 = new ControllerPakSliders(param_2,bounds,&this->col0);
  s32 ind = this->sliders->AddFileWidget(pCVar1);
  pCVar1->varU16 = (u16)param_3;
  Utilities::SetAlpha(this,this->col.A);
  if (this->vmE0(pCVar1)) this->sliders->SetIndex(ind);
}

void WidgetContPakData::ClearScrollMenu(){
  if (this->scrollInited) {
    this->sliders->FreeMenu();
    Utilities::ClearScrollMenu2(this->scroll);
  }
}

void WidgetContPakData::FreeWaitPrompt(){
  if (this->waitPrompt) {
    this->waitPrompt->~WidgetChoiceDia();
    this->waitPrompt = NULL;
  }
}

void WidgetContPakData::m80087c88(){
  this->titleWidget = Utilities::AddBorg8Widget(this,loadBorg8(this->borg8),this->unk292 + 0x41,this->unk294);
  this->sliders = new WidgetMenuChild(this->unk292,this->unk294,this->unk292 + 0xdb,this->unk294 + 0xc0);
  this->Link(this->sliders);
  this->scroll = Utilities::AddScrollMenu(this,4,this->unk292 + 0xaa,this->unk294 + 0x9c,FULL_SCREENSPACE,
                      (this->col0).R,(this->col0).G,(this->col0).B,(this->col0).A,0);
  this->scroll->SetFlags(1);
  Utilities::SetScrollMenuColors(this->scroll,(this->col1).R,(this->col1).G,(this->col1).B,
             (this->col1).A,(this->col2).R,(this->col2).G,(this->col2).B,
             (this->col2).A,0xf);
  this->scrollInited = true;
}

void WidgetContPakData::ReadPakPrompt(){
  if (this->waitPrompt == NULL) {
    Color32 col0={COLOR_OFFWHITE};
    Color32 col1={0,0,0,0};
    this->waitPrompt = new WidgetChoiceDia(1,"Reading from Controller Pak",100,&col0,&col1,1,0,0);
    if (gGlobals.BigAssMenu) Utilities::MoveWidget(this->waitPrompt,25,0);
    this->waitPrompt->AppendScrollMenu(new WidgetText("...",4));
    this->waitPrompt->Update();
  }
}

void WidgetContPakData::m80087ec0(){
  Controller::GetDelay(0);
  ClearScrollMenu();
  BaseWidget *w;
  while (w = this->wHandler.RemoveWidget(), w != NULL) {
    this->BFunc();
    if (w) w->~BaseWidget();
  }
}

WidgetContPakDataSave::WidgetContPakDataSave(u16 param_2,u16 param_3,void* param_4,
      void* param_5,Color32 *param_6,Color32 *param_7,Color32 *param_8):
      WidgetContPakData(param_2,param_3,param_4,param_5,BORG8_SaveGameTitle,param_6,param_7,param_8){
  ALLOC(this->dataBuffer,1536);
  QuestData::InitSaveFile(this->dataBuffer);
  this->filenum = -1;
}

WidgetContPakDataSave::~WidgetContPakDataSave(){
  HFREE(this->dataBuffer,1548);
  WidgetContPakData::~WidgetContPakData();
}

void WidgetContPakDataSave::unk(){}

u32 WidgetContPakDataSave::ShowSaveFiles(){
  WidgetBlankFile *pWVar3;
  ulong uVar4;
  u16 uStack136 [4];
  Color32 aCStack_48 [18];
  uStack136[0] = this->unk292;
  uStack136[1] = this->unk294;
  uStack136[2] = uStack136[0] + 200;
  uStack136[3] = uStack136[1] + 120;
  aCStack_48[0].R = 0x67;
  aCStack_48[0].G = 0x46;
  aCStack_48[0].B = 0x3c;
  aCStack_48[0].A = 0xff;
  pWVar3 = new WidgetBlankFile("Create New Save",&uStack136,aCStack_48,0,0x1c);
  pWVar3->varU8 = 2;
  pWVar3->AButtonFunc = FUN_80086144;
  this->sliders->AddFileWidget(pWVar3);
  Utilities::SetAlpha(this,this->col.A);
  this->sliders->m80032f0c();
  return this->vmF0();
}

void WidgetContPakDataSave::LoadSaveFile(u8 param_2){
  this->unk2ba = param_2;
  this->OtherState = 9;
}

u32 WidgetContPakDataSave::vmE0(BaseWidget *param_2){
  param_2->varU8 = 3;
  param_2->AButtonFunc = FUN_80085f08;
  if (this->filenum == -1) return false;
  if (param_2->varU16 == this->filenum) {
    this->filenum = -1;
    return true;
  }
  return false;
}
void WidgetContPakDataSave::NewSaveFile(){
  u8 PVar1;
  char *c1;
  u8 j;
  u8 i;
  int iVar4;
  u32 uVar5;
  fileState_aidyn filestate [2];
  char acStack_b0 [64];
  char acStack_70 [64];
  byte freespace;
  u8 auStack_2f [47];
  
  uVar5 = 0;
  iVar4 = 0;
  auStack_2f[0] = 0;
  freespace = 0;
  Pfs2xCheck(this->pfsErr,Controller::GetPakFreeBlocks8(&freespace,0));

  if (this->pfsErr == 0) {
    for(i=0,c1 = acStack_b0;i<SaveFileMax;i++) {
      Pfs2xCheck(PVar1,Controller::GetPakSaveState(filestate,i,0));
      if (((PVar1 == 0) && (iVar4++, filestate[0].comp_code == THQCompCode)) &&
         (filestate[0].game_code == AidynGameCode)) {
        strcpy(c1,filestate[0].ext_name);
        c1+=4;
        uVar5++;
      }
    }
    if (iVar4 == SaveFileMax) {
      FullWarning();
      return;
    }
    i = 0;
    if (freespace < (sizeof(SaveDatStruct)/(PFS_ONE_PAGE * BLOCKSIZE))) {
      LowSpaceWarn();
      return;
    }
    do {
      sprintf(acStack_70,"%c",i + 'A');
      for (j = 0; j < uVar5; j++) {
        if (!strcmp(acStack_b0 + j * 4,acStack_70)) break;
      }
    } while ((j != uVar5) && (i++, i < SaveFileMax));

    this->pfsErr = Controller::NewPakSave(auStack_2f,"CHRONICLES",acStack_70,THQCompCode,AidynGameCode,sizeof(SaveDatStruct),0);;
    if (this->pfsErr == 0) {
      this->OtherState = 9;
      this->unk2ba = auStack_2f[0];
      return;
    }
  }
  this->OtherState = 1;
  return;
}

u32 WidgetContPakDataSave::vmF0(){
  BaseWidget *pBVar2 = this->sliders->getCurrFile();
  u8 bVar1 = pBVar2->varU8;
  Utilities::ClearScrollMenu2(this->scroll);
  if ((bVar1 & 2))
    this->scroll->Append(FUN_800862f4(0,pBVar2->varU16,gGlobals.CommonStrings[0x1a8],FUN_80086118));
  if ((bVar1 & 1))
    this->scroll->Append(FUN_800862f4(0,pBVar2->varU16,gGlobals.CommonStrings[0x1a9],FUN_80085e44));
  return this->scroll->Append(FUN_800862f4(0,0,gGlobals.CommonStrings[0x1aa],FUN_80086054));
}

u32 WidgetContPakDataSave::WriteSaveFile(u8 filenum){
  Pfs2xCheck(this->pfsErr,Controller::WritePakSave((u8 *)this->dataBuffer,filenum,0,sizeof(SaveDatStruct),0));
  if (this->pfsErr == 0) this->filenum = (u32)filenum;
  else this->OtherState = 1;
  return true;
}

void WidgetContPakDataSave::vm100(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a6],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80086080,0x80));
  pWVar1->Update();
}

void WidgetContPakDataSave::FullWarning(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,3,gGlobals.CommonStrings[0xb7],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb6],FUN_80086180,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb9],FUN_80085da0,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xba],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakDataSave::LowSpaceWarn(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,3,gGlobals.CommonStrings[0x188],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb6],repeated_space_warning,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb9],FUN_80085da0,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xba],FUN_80086054,0x80));
  pWVar1->Update();
}

void WidgetContPakDataSave::NewContPak(){
  this->filenum = -1;
  WidgetContPakData::NewContPak();
}

WidgetContPakDataLoad::WidgetContPakDataLoad(u16 param_2,u16 param_3,void *param_4,void *param_5,
          Color32 *param_6,Color32 *param_7,Color32 *param_8):
          WidgetContPakData(param_2,param_3,param_4,param_5,BORG8_LoadGameTitle,param_6,param_7,param_8){}

void WidgetContPakDataLoad::unk(){}

u32 WidgetContPakDataLoad::ShowSaveFiles(){
  u16 uStack_48[4];
  if (this->AidynSaveSlots == 0) {
    uStack_48[0] = this->unk292;
    uStack_48[1] = this->unk294;
    uStack_48[2] = uStack_48[0] + 200;
    uStack_48[3] = uStack_48[1] + 120;
    this->sliders->AddFileWidget(new WidgetBlankFile("There are currently no games saved on this Controller Pak.",(u16 (*) [4])&uStack_48,
                        &this->col0,0,0x1c));
    Utilities::SetAlpha(this,this->col.A);
    this->sliders->m80032f0c();
    return this->vmF0();
  }
  else {
    this->sliders->m80032f0c();
    return this->vmF0();
  }
}

void WidgetContPakDataLoad::LoadSaveFile(u8 param_2){
  
  u8 PVar1;
  Pfs2xCheck(PVar1,Controller::GetPFSERR(0));
  if (PVar1 == 0) {
    QuestData::LoadFromMemPak(this->saveDatsP[param_2].datStart);
    this->OtherState = 5;
  }
  else this->OtherState = 0;
}

u32 WidgetContPakDataLoad::vmE0(BaseWidget *w){
    w->AButtonFunc=FUN_80085fcc;
    w->varU8=3;
    return 0;
}
u32 WidgetContPakDataLoad::vmF0(){
  BaseWidget *pBVar2 = this->sliders->getCurrFile();
  u8 bVar1 = pBVar2->varU8;
  Utilities::ClearScrollMenu2(this->scroll);
  if ((bVar1 & 2))
    this->scroll->Append(FUN_800862f4(0,pBVar2->varU16,gGlobals.CommonStrings[0x1a7],FUN_80086118));
  if ((bVar1 & 1))
    this->scroll->Append(FUN_800862f4(0,pBVar2->varU16,gGlobals.CommonStrings[0x1a9],FUN_80085e44));
  return this->scroll->Append(FUN_800862f4(0,0,gGlobals.CommonStrings[0x1aa],FUN_80086054));
}

u32 WidgetContPakData::vmE8(){}

WidgetContPakDataLoad::~WidgetContPakDataLoad(){WidgetContPakData::~WidgetContPakData();}

WidgetText * ContPakTextWidget(char *txt,BaseWidget *(*AFunc)(BaseWidget *,BaseWidget *),u16 length){
  WidgetText* w = new WidgetText(txt,length);
  w->AButtonFunc = AFunc;
  return w;
}

WidgetText * ContPakTextWidget2(u16 param_1,char *txt,BaseWidget *(*AFunc)(BaseWidget *,BaseWidget *)){
  WidgetText *pBVar1 = ContPakTextWidget(txt,AFunc,0x80);
  pBVar1->varU16 = param_1;
  return pBVar1;
}

WidgetChoiceDia * FUN_80088a78(u16 param_1,char *param_2){ 
  return FUN_80088aac(FUN_8004cfd0,gGlobals.widgetHandler,param_1,param_2,0);
}

WidgetChoiceDia *FUN_80088aac(void (*func)(BaseWidget*),WidgetHandler *handler,u16 choices,char *title,u16 var){
  WidgetChoiceDia *pWVar1;
  u16 uVar2;
  Color32 colA={COLOR_OFFWHITE};
  Color32 colB={COLOR_OFFWHITE};
  
  uVar2 = 200;
  if (gGlobals.BigAssMenu) uVar2 = 150;
  WidgetChoiceDia *pWVar1 = new WidgetChoiceDia(choices,title,uVar2,&colA,&colB,0,10,0);
  if (gGlobals.BigAssMenu) Utilities::MoveWidget(pWVar1,25,0);
  handler->AddWidget(pWVar1);
  freeWidgetFunc = func;
  pWVar1->varU16 = var;
  return pWVar1;
}

//file break?

char* sContPakBlank=" ";
u32 DAT_800f1c74=1;
u32 DAT_800f1c78=0;
void(*DAT_800f1c7c)(BaseWidget*)=NULL;
ContPakWidget* contpak_widget=NULL;
u32 u32_800f1c84=0;

void open_mempak_menu(u32 param_1,u32 param_2,u16 param_3,u16 param_4,u32 shadow){
  DAT_800f1c74 = param_1;
  DAT_800f1c78 = param_2;
  make_mempak_menu(param_3,param_4,shadow);
}

u32 appState_2(Gfx **param_1){
  appState2_Tick(param_1,appState2_control());
  return DAT_800f1c78;
}

byte appState2_control(void){
  BaseWidget *pBVar1;
  bool bVar2;
  byte bVar3;
  byte bVar4;
  ControllerFull *apCStack_18 [6];
  
  apCStack_18[0] = NULL;
  bVar4 = 0;
  while( true ) {
    bVar2 = Controller::GetInput((controller_aidyn **)apCStack_18,0);
    bVar3 = bVar4 + 1;
    if (!bVar2) break;
    N64Print::Toggle(&gGlobals.DebugQueue,&apCStack_18[0]->contAidyn);
    pBVar1 = WHANDLE->Control(apCStack_18[0]);
    bVar4 = bVar3;
    if ((pBVar1 != NULL) && (freeWidgetFunc != NULL)) {
      (*freeWidgetFunc)(pBVar1);
    }
  }
  DeltaCap(bVar4);
  return bVar4;
}

void appState2_Tick(Gfx **GG,u8 delta){
  Gfx *g;  
  gGlobals.delta = (float)delta;
  g = Graphics::StartDisplay(*GG,FULL_SCREENSPACE);
  g = Graphics::SomeOtherInit(g,FULL_SCREENSPACE,0,0,0,0);
  g = tick_and_render_widgets(g);
  g = N64Print::Draw(g,delta);
  *GG = g;
}

u32 FUN_80088d80(void){return DAT_800f1c78;}


void make_mempak_menu(s16 x,s16 y,u32 shadow){
  if (!contpak_widget) {
    contpak_widget = new ContPakWidget(shadow);
    contpak_widget->SetCoords(x,y);
    DAT_800f1c7c = freeWidgetFunc;
    freeWidgetFunc = FUN_8008a7b8;
    WHANDLE->AddWidget(contpak_widget);
  }
}

u32 FUN_80088e2c(void){return u32_800f1c84;}

ContPakWidget::ContPakWidget(u32 shadow):WidgetMenu(){
  this->menuState = 0;
  this->pfserr = 0;
  this->fileNum = 0;
  this->windowLoaded = false;
  this->contStat = 0;
  this->field1_0x7c = 0;
  this->w80 = NULL;
  this->BgShadow = shadow;
  u32_800f1c84 = 0;
  this->handler.Init(font_pointer);
  Controller::GetStatus(0,&this->contStat);
}

ContPakWidget::~ContPakWidget(){
  this->handler.Free(2);
  WidgetMenu::~WidgetMenu();
}

u8 ContPakWidget::m80088f0c(BaseWidget *w){
  if (w != this) w->AFunc();
  return w == this;
}

void ContPakWidget::m80088f44(){this->menuState = 0;}

BaseWidget * ContPakWidget::AFunc(){
  BaseWidget *w = NULL;
  if (this->windowLoaded) w = Utilities::GetHighlightedEntry(this->w80);
  return w;
}

BaseWidget * ContPakWidget::AFunc(){return this;}

BaseWidget * ContPakWidget::UpFunc(){
  if (this->windowLoaded) this->w80->UpFunc();
  return NULL;
}

BaseWidget * ContPakWidget::DownFunc(){
  if (this->windowLoaded) this->w80->DownFunc();
  return NULL;
}


u8 ContPakWidget::Tick(){

  u8 bVar2;
  
  if (this->handler.GetTail() == NULL) {
    switch(this->menuState) {
    case 0:
      GetPfsErr();
      break;
    case 1:
      ErrSwitch();
      break;
    case 2:
      LoadWindowCheck();
      break;
    case 3:
      PrintMemcardFiles();
      break;
    case 4:
      m800895d8();
      break;
    case 5:
      m800895f4();
    }
    SlimFont;
    bVar2 = WidgetMenu::Tick();
    NormalFont;
  }
  else {
    this->handler.Tick(1);
    m80089668();
    bVar2 = false;
  }
  return bVar2;
}

Gfx * ContPakWidget::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  Gfx *pGVar1;
  
  SlimFont;
  g = RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  g = this->handler.Render(g,x0,y0,x1,y1);
  return g;
}

BaseWidget * ContPakWidget::Control(controller_aidyn *param_2){
  if (this->handler.GetTail() == NULL) return BaseWidget::Control(param_2);
  else return this->handler.Control((ControllerFull *)param_2);
}

void ContPakWidget::ConfirmDelete(BaseWidget *w){
  WidgetChoiceDia *pWVar1;
  BaseWidget *pBVar2;
  
  pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0xcd],0);
  pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0xce],ContPak_EraseMenu,0x80);
  pBVar2->varU16 = w->varU16;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x20],FUN_8008a87c,0x80));
  pWVar1->Update();
}

void ContPakWidget::ErasePakSave(BaseWidget *param_2){
  this->menuState = 2;
  this->pfserr = Controller::ErasePakSave((u8)param_2->varU16,0);
  if (this->pfserr) {
    if (this->pfserr == PFS_ERR_BAD_DATA) {
      this->pfserr = Controller::ErasePakSave((u8)param_2->varU16,0);
      if (this->pfserr == 0) return;
    }
    this->menuState = 1;
  }
}

void ContPakWidget::m8008937c(){this->menuState=0;}

void ContPakWidget::m80089384(BaseWidget *w){
  if (Controller::RepairPak(0) == 0) m80089b0c((u8)w->varU16);
  else m80089a64((u8)w->varU16);
}

void ContPakWidget::GetPfsErr(){
  this->pfserr = Controller::GetPFSERR(0);
  this->menuState = 1;
  if (this->pfserr == PFS_ERR_BAD_DATA) {
    this->pfserr = Controller::GetPFSERR(0);
  }
}

void ContPakWidget::ErrSwitch(){
  this->menuState = 4;
  switch(this->pfserr) {
  case 0:
    PfsOK();
    break;
  case PFS_ERR_NOPACK:
    PfsNoPak();
    break;
  case PFS_ERR_NEW_PACK:
    PfsNewPak();
    break;
  case PFS_ERR_INCONSISTENT:
  case PFS_ERR_ID_FATAL:
    FatalErr();
    break;
  case PFS_ERR_CONTRFAIL:
  case PFS_ERR_INVALID:
  case PFS_ERR_BAD_DATA:
  case PFS_DATA_FULL:
  case PFS_DIR_FULL:
  case PFS_ERR_EXIST:
    PfsErr();
    break;
  case PFS_ERR_DEVICE:
    DeviceErr();
    break;
  default:
    PfsErr();
  }
}

void ContPakWidget::LoadWindowCheck(){
  this->fileNum = 0;
  this->menuState = 3;
  if (!this->windowLoaded) LoadWindow();
  else Utilities::ClearScrollMenu2(this->w80);
}

void ContPakWidget::PrintMemcardFiles(){
  fileState_aidyn afStack_50 [2];
  
  u8 fileno = this->fileNum++;
  if (this->fileNum <= SaveFileMax) {
    Pfs2xCheck(this->pfserr,Controller::GetPakSaveState(afStack_50,(u32)fileno,0));
    if (this->pfserr == 0) {
      PrintFile(fileno,afStack_50[0].game_name,afStack_50[0].ext_name,afStack_50[0].filesize);
    }
    else PrintBlankFile(fileno);
  }
  else PrintFreeSpace();
}

void ContPakWidget::m800895d8(){CheckContStatus2();}

void ContPakWidget::m800895f4(){
  if (Controller::CheckStatus(0)) {
    BaseWidget*w=this->handler.GetTail();
    if (!w) this->menuState = 0;
    else if (w->varU16 == 2) {
      if (Controller::GetPFSERR(0) == 0) {
        this->menuState = 4;
        return;
      }
      this->menuState = 0;
    }
    else {
      this->menuState = 0;
    }
    RunHandlerBFuncs();
  }
}

void ContPakWidget::m80089668(){
  BaseWidget *w = this->handler.GetTail();
  if (((w) && (w->state != WidgetS_Closing)) && (w->state != WidgetS_Closed)) CheckContStatus2();
}

void ContPakWidget::PfsOK(){this->menuState = 2;}

void ContPakWidget::PfsNoPak(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x195],this->pfserr);
  pWVar1->AppendScrollMenu(pWVar1,ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->Update();
  pWVar1->SetHighlight(1);
}

void ContPakWidget::PfsNewPak(){
  u8 PVar3;
  Pfs2xCheck(PVar3,Controller::GetPFSERR(0));
  if (PVar3 == 0) {
    WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x18b],this->pfserr);
    pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x18c],ContPak_8008a768,0x80));
    pWVar1->Update();
  }
  else {
    this->pfserr = PVar3;
    ErrSwitch();
  }
}

void ContPakWidget::PfsErr(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0x191],this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x194],ContPak_8008a768,0x80));
  pWVar1->Update();
  return;
}

void ContPakWidget::DeviceErr(){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x1e3],
                        (u16)this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->Update();
}

void ContPakWidget::FatalErr(){
  if (Controller::GetStatus2(0)) m80089a1c();
  else m80089a40();
}


void ContPakWidget::m80089978(char *param_2){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,param_2,(u16)this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((u16)this->pfserr,gGlobals.CommonStrings[399],ContPak_8008a790));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->Update();
  return;
}

void ContPakWidget::m80089a1c(){m80089978(gGlobals.CommonStrings[0x18d]);}

void ContPakWidget::m80089a40(){m80089978(gGlobals.CommonStrings[0x18e]);}

void ContPakWidget::m80089a64(u8 param_2){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0x198],(u16)param_2);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((u16)param_2,gGlobals.CommonStrings[0x193],FUN_8008a8a4));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->Update();
}


void ContPakWidget::m80089b0c(u8 param_2){
  WidgetChoiceDia *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x197],(u16)param_2);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((u16)param_2,gGlobals.CommonStrings[0x18c],ContPak_8008a768));
  pWVar1->Update();
  this->menuState = 0;
}

void ContPakWidget::m80089b9c(u8 param_2){
  WidgetTimed *pWVar1 = new WidgetTimed(60,ContPak_8008a790);
  pWVar1->varU16 = (u16)param_2;
  pWVar1->BButtonFunc = FUN_8008c1b0;
  this->handler.AddWidget(pWVar1);
}

void ContPakWidget::LoadWindow(){
  int iVar2;
  u16 uVar3;
  Borg8Header *pBVar4;
  BaseWidget *pBVar5;
  ulong uVar6;
  s16 sVar7;
  s16 x;
  s16 sVar8;
  s16 sVar9;
  s16 y;
  
  this->windowLoaded = true;
  if (this->BgShadow) {
    pBVar4 = loadBorg8(BORG8_ContPakBGShad);
    Utilities::AddBorg8Widget2
              (this,pBVar4,this->posX + -0xc,this->posY + -7,
               (pBVar4->dat).Width + -0xc,(pBVar4->dat).Height + -7);
  }
  pBVar4 = loadBorg8(BORG8_ContPakBG);
  sVar9 = this->posX;
  Utilities::AddBorg8Widget2(this,pBVar4,sVar9,this->posY,sVar9 + (pBVar4->dat).Width,
             this->posY + (pBVar4->dat).Height);
  sVar8 = this->posY + (pBVar4->dat).Height;
  pBVar4 = loadBorg8(BORG8_CONTROLLER_PAK);
  sVar9 = this->posY;
  sVar7 = this->posX + 0x67;
  uVar3 = (u16)(pBVar4->dat).Width >> 1;
  Utilities::AddBorg8Widget2
            (this,pBVar4,sVar7 - uVar3,sVar9 + 0xd,uVar3 + sVar7,
             (pBVar4->dat).Height + sVar9 + 0xd);
  y = (pBVar4->dat).Height + this->posY + 0x16;
  Utilities::AddTextWidget(this,Cstring(ContPakNote),this->posX + 10,y,COLOR_BROWN1);
  Utilities::AddTextWidget(this,Cstring(ContPakName),this->posX + 0x26,y,COLOR_BROWN1);
  Utilities::AddTextWidget(this,Cstring(ContPakExt),this->posX + 0x92,y,COLOR_BROWN1);
  Utilities::AddTextWidget(this,Cstring(ContPakPages),this->posX + 0xa5,y,COLOR_BROWN1);
  sVar9 = sVar8 + -0x14;
  pBVar5 = Utilities::AddTextWidget(this,Cstring(ContPakPagesFree),0,sVar9,COLOR_BROWN1);
  pBVar5->posX = (this->posX - (s16)pBVar5->GetWidth()) + 0xb3;
  this->field1_0x7c = Utilities::AddTextWidget
                     (this,sContPakBlank,pBVar5->posX + (s16)pBVar5->GetWidth() + -5,sVar9,0x67,0x46,0x3c,
                      0xff);
  uVar6 = pBVar5->GetHeight();
  sVar7 = this->field1_0x7c->GetHeight();
  sVar9 = this->posX;
  x = sVar9 + 5;
  this->w80 = Utilities::AddScrollMenu(this,SaveFileMax,x,y + (s16)uVar6 + 2,x,y + sVar7 + 2,sVar9 + 199,
                      this->field1_0x7c->posY + -7,COLOR_BROWN1,0);
  Utilities::SetScrollMenuColors(this->w80,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  sVar8 -=27;
  sVar9 = this->posX + 10;
  pBVar5 = Utilities::AddTextWidget(this,"{ ",sVar9,sVar8,0,0,0xa4,0xff);
  Utilities::AddTextWidget(this," Delete",(s16)pBVar5->GetWidth() + sVar9,sVar8,COLOR_BROWN1);
  sVar8 = pBVar5->GetHeight() + sVar8;
  pBVar5 = Utilities::AddTextWidget(this,"} ",sVar9,sVar8,0,0xa4,0,0xff);
  Utilities::AddTextWidget(this,"Exit",pBVar5->GetWidth() + sVar9,sVar8,COLOR_BROWN1);
}

void ContPakWidget::PrintFreeSpace(){
  byte abStack_10 [16];
  this->menuState = 4;
  this->fileNum = 0;
  abStack_10[0] = 0;
  Pfs2xCheck(this->pfserr,Controller::GetPakFreeBlocks8(abStack_10,0));
  if (this->pfserr == 0) sprintf(Utilities::GetWidgetText(this->field1_0x7c),"%d",(u32)abStack_10[0]);
  else this->menuState = 1;
}

void ContPakWidget::PrintFile(u8 fileno,char *param_3,char *param_4,u16 param_5){
  WidgetGroup *w = new WidgetGroup(4);
  Gsprintf("%d",fileno + 1);
  w->AddToGroup(WText(gGlobals.text),15,0,true);
  w->AddToGroup(WText(param_3),33,0,true);
  w->AddToGroup(WText(param_4),150,0,true);
  Gsprintf("%d",(u32)(param_5 >> 8));
  w->AddToGroup(WText(gGlobals.text),169,0,true);
  this->w80->Append(w);
  w->varU16 = (u16)fileno;
  w->AButtonFunc = ContPak_DeleteMenu;
}
void ContPakWidget::PrintBlankFile(u8 fileno){
  WidgetGroup *w = new WidgetGroup(4);
  Gsprintf("%d",fileno + 1);
  w->AddToGroup(WText(gGlobals.text),15,0,true);
  w->AddToGroup(WTextSafe(gGlobals.CommonStrings[0x199]),33,0,true);
  w->AddToGroup(WText(sContPakBlank),150,0,true);
  w->AddToGroup(WText(0),0xa9,0,true);
  this->w80->Append(w);
  w->varU16 = (u16)fileno;
}


void ContPakWidget::RunHandlerBFuncs(){
  BaseWidget *w;
  
  while (w = this->handler.RemoveWidget(), w != NULL) {
    w->BFunc();
    if (w) w->~BaseWidget();
  }
}
void ContPakWidget::CheckContStatus2(){
  u8 CVar1;
  u8 CVar2;
  bool bVar3;
  u8 PVar4;
  
  if (this->menuState == 5) m800895f4();
  else {
    CVar1 = this->contStat;
    if (Controller::GetStatus(0,&this->contStat)) CVar2 = this->contStat;
    else {
      if (!Controller::GetStatus(0,&this->contStat)) {
        m8008a6dc();
        return;
      }
      CVar2 = this->contStat;
    }
    if (((CVar2 != CONT_CARD_ON) || (CVar1 != CONT_CARD_ON)) && (CVar2 != CVar1)) {
      if ((CVar2 == (CONT_CARD_PULL|CONT_CARD_ON)) && (CVar1 == CONT_CARD_PULL)) {
        Pfs2xCheck(PVar4,Controller::GetPFSERR(0));
        RunHandlerBFuncs();
        if (PVar4 == PFS_ERR_NEW_PACK) {
          this->pfserr = PFS_ERR_NEW_PACK;
        }
        else {
          if (PVar4 != 0) {
            this->pfserr = PVar4;
            this->menuState = 1;
            return;
          }
          this->pfserr = PFS_ERR_NEW_PACK;
        }
        this->menuState = 1;
      }
      else if ((CVar2 == CONT_CARD_PULL) && ((CVar1 == CONT_CARD_ON || (CVar1 != CONT_CARD_PULL))))
      {
        RunHandlerBFuncs();
        this->menuState = 0;
      }
    }
  }
}

void ContPakWidget::RemoveWidget(BaseWidget *w){
  this->handler.FreeWidget(w);
  if (w) w->~BaseWidget();
}


void ContPakWidget::m8008a6dc(){
  this->menuState = 5;
}

BaseWidget * ContPak_DeleteMenu(BaseWidget *param_1,BaseWidget *w){
  contpak_widget->ConfirmDelete(w);
  return NULL;
}


BaseWidget * ContPak_EraseMenu(BaseWidget * param_1,BaseWidget *param_2){
  contpak_widget->ErasePakSave(param_2);
  return NULL;
}

BaseWidget * ContPak_8008a738(BaseWidget *param_1,BaseWidget *param_2){
  u32_800f1c84 = 1;
  FUN_8008a7b8(contpak_widget);
  return NULL;
}

BaseWidget * ContPak_8008a768(void){
  contpak_widget->m8008937c();
  return NULL;
}

BaseWidget * ContPak_8008a790(BaseWidget *param_1,BaseWidget *param_2){
  contpak_widget->m80089384(param_2);
  return NULL;
}

void FUN_8008a7b8(BaseWidget *param_1){
  ContPakWidget *apCStack_18; 
  void(*pfVar1)(BaseWidget*) = DAT_800f1c7c;
  if (contpak_widget->m80088f0c(param_1)) {
    DAT_800f1c7c = NULL;
    freeWidgetFunc = pfVar1;
    WHANDLE->FreeWidget(contpak_widget);
    apCStack_18 = contpak_widget;
    FREEQW(apCStack_18);
    contpak_widget = NULL;
    DAT_800f1c78 = DAT_800f1c74;
  }
}


void FUN_8008a848(BaseWidget *param_1){
  if ((param_1) && (contpak_widget)) contpak_widget->RemoveWidget(param_1);
}

BaseWidget * FUN_8008a87c(BaseWidget *param_1,BaseWidget *param_2){
  contpak_widget->m80088f44();
  return NULL;
}

BaseWidget * FUN_8008a8a4(BaseWidget * param_1,BaseWidget *param_2){
  contpak_widget->m80089b9c((u8)param_2->varU16);
  return NULL;
}
