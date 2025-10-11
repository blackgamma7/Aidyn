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
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,2,gGlobals.CommonStrings[0x174],0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0x175],FUN_80086018,0x80);
  pBVar2->var5E = w1->var5E;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x176],NULL,0x80));
  pWVar1->m8004de18();
  return NULL;
}

BaseWidget * FUN_80085f08(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,2,gGlobals.CommonStrings[0x174],0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0x19b],FUN_80085fcc,0x80);
  pBVar2->var5E = w1->var5E;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x176],NULL,0x80));
  pWVar1->m8004de18();
  return NULL;
}

BaseWidget * FUN_80085fcc(BaseWidget * w0,BaseWidget * w1){
  Controller::GetDelay(0);
  contPakDat->LoadSaveFile((u8)w1->var5E);
  return NULL;
}

BaseWidget * FUN_80086018(BaseWidget *w0,BaseWidget *w1){
  Controller::GetDelay(0);
  contPakDat->EraseFile((u8)w1->var5E);
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
  contPakDat->m80087c40();
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
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,1,gGlobals.CommonStrings[0x18a],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->m8004de18();
  return NULL;
}

BaseWidget * repeated_space_warning(BaseWidget * w0,BaseWidget * w1){  
  Controller::GetDelay(0);
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&contPakDat->wHandler,1,gGlobals.CommonStrings[0x189],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->m8004de18();
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
  w->var5C = param_1;
  w->var5E = param_2;
  w->AButtonFunc = param_4;
  return w;
}


WidgetContPakData::WidgetContPakData(u16 param_2,u16 param_3,void *param_4,
          void *param_5,u32 param_6,Color32 *col0,Color32 *col1,Color32 *col2):WidgetMenu(){

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
  this->unk2B4 = 1;
  this->col.A = 0;
  CLEAR(&this->saveDatsP);
  this->unk27c = NULL;
  this->field3_0x280 = NULL;
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
  this->borg8 = param_6;
  this->unk2a0 = NULL;
  this->unk2a4 = 0;
  this->field17_0x29c = NULL;
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
  this->m80087c40();
  if ((this->field17_0x29c) && (this->field17_0x29c->borg8))
     FREEQB8(this->field17_0x29c->borg8);
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
  if (this->unk2B4){
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
  if (this->unk2a0) Utilities::SetAlpha(this->unk2a0,0xff);
  return ret;
}

Gfx * WidgetContPakData::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y){
  if (!this->wHandler.GetTail()) {
    if (this->unk2a0 == NULL) {
      if (this->unk2a4) {
        g = this->WidgetMenu::Render(g,x0,y0,x1,y);
      }
    }
    else g = this->unk2a0->Render(g,x0,y0,x1,y);
  }
  else {
    if (this->field17_0x29c) {
      g = this->field17_0x29c->Render(g,x0,y0,x1,y);
    }
    g = this->wHandler.Render(g,x0,y0,x1,y);
  }
  return g;
}

BaseWidget * WidgetContPakData::AFunc(){
  BaseWidget *w;
  
  if ((this->field3_0x280) &&
     (w = Utilities::GetHighlightedEntry(this->field3_0x280), w != NULL)) {
    return w->AFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::BFunc(){
  this->OtherState = 6;
  return NULL;
}

BaseWidget * WidgetContPakData::UpFunc(){
  if (this->field3_0x280) {
    PlayAudioSound(&gGlobals.SFXStruct,0x73B,0,1.0,0x1e,0);
    this->field3_0x280->UpFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::DownFunc(){
  if (this->field3_0x280) {
    PlayAudioSound(&gGlobals.SFXStruct,0x73B,0,1.0,0x1e,0);
    this->field3_0x280->DownFunc();
  }
  return NULL;
}

BaseWidget * WidgetContPakData::LeftFunc(){
  if (this->unk27c) {
    this->unk27c->m80032dc4();
    this->vmF0();
    PlayAudioSound(&gGlobals.SFXStruct,0x73d,0,1.0,0x1e,0);
  }
  return NULL;
}


BaseWidget * WidgetContPakData::RightFunc(){
  
  if (this->unk27c) {
    this->unk27c->m80032c98();
    this->vmF0();
    PlayAudioSound(&gGlobals.SFXStruct,0x73d,0,1.0,0x1e,0);
  }
  return NULL;
}


BaseWidget * WidgetContPakData::Control(controller_aidyn *param_2){
  BaseWidget *pBVar2;
  if (!this->wHandler.GetTail()) {
    if (((this->unk27c == NULL) ||
        (this->unk27c->m80032f00())) ||
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
  open_mempak_menu(1,0,0x57,0x17,1);
  this->unk290 = 1;
  this->OtherState = 4;
}

void WidgetContPakData::GetPFSErr(){
  Pfs2xCheck(this->pfsErr,Controller::GetPSFERR(0));
  this->OtherState = 0;
}

void WidgetContPakData::TryRepair(){  
  this->unk2B4 = 1;
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
  BaseWidget *w = this->unk27c->m80032ef8();
  if (w) w = w->AFunc();
  return w;
}

void WidgetContPakData::m80086d78(){
  this->wHandler.AddWidget(new WidgetChild9(60,FUN_80085dcc));
  this->unk2B4 = 0;
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
  Pfs2xCheck(this->pfsErr,Controller::GetPSFERR(0));
  this->OtherState = 1;
}

void WidgetContPakData::PfsErrAction(){
  this->OtherState = 4;
  switch(this->pfsErr) {
  case 0:
    PfsErrOK();
    break;
  case PFS_ERR_NOPACK:
    PfsErrNoPak();
    break;
  case PFS_ERR_NEW_PACK:
    this->NewContPak();
    break;
  case PFS_ERR_INCONSISTENT:
  case PFS_ERR_ID_FATAL:
    PfsErrBadPak();
    break;
  case PFS_ERR_CONTRFAIL:
  case PFS_ERR_INVALID:
  case PFS_ERR_BAD_DATA:
  case PFS_DATA_FULL:
  case PFS_DIR_FULL:
  case PFS_ERR_EXIST:
    PfsErrBadRead();
    break;
  case PFS_ERR_DEVICE:
    PfsErrDevice();
    break;
  default:
    PfsErrBadRead();
  }
}

void WidgetContPakData::m80086F40(){
  ReadPakPrompt();
  if (9 < gContPakDatTimer++) {
    gContPakDatTimer = 0;
    this->saveSlot = 0;
    this->AidynSaveSlots = 0;
    this->OtherState = 3;
    if (this->unk291 == 0) m80087c88();
    else ClearScrollMenu();
    Utilities::SetAlpha(this,this->col.A);
    this->unk();
  }
}

void WidgetContPakData::ReadSaveFile(){
  byte bVar1;
  SaveDatStruct *buff;
  bool bVar3;
  fileState_aidyn filestate;
  
  bVar1 = this->saveSlot++;
  if (15 < this->saveSlot) {
    this->unk2a4 = 1;
    this->ShowSaveFiles();
    this->OtherState = 4;
    return;
  }
  this->pfsErr = Controller::GetPakSaveState(&filestate,(uint)bVar1,0);
  if (this->pfsErr == PFS_ERR_BAD_DATA) {
    this->pfsErr = Controller::GetPakSaveState(&filestate,(uint)bVar1,0);
    if (this->pfsErr == PFS_ERR_BAD_DATA) goto LAB_80087164;
  }
  if (this->pfsErr) return;
  if (filestate.comp_code != THQCompCode) return;
  if (filestate.game_code != AidynGameCode) return;
  buff = this->saveDatsP[bVar1].datStart;
  if (buff == NULL){
     buff= (SaveDatStruct *)HALLOC(sizeof(SaveDatStruct),988);
    this->saveDatsP[bVar1].datStart = buff;
  }
  this->pfsErr = Controller::ReadPakSave((u8 *)buff,(ushort)bVar1,0,sizeof(SaveDatStruct),0);
  if (this->pfsErr == PFS_ERR_BAD_DATA) {
    this->pfsErr = Controller::ReadPakSave((u8 *)buff,(ushort)bVar1,0,sizeof(SaveDatStruct),0);
    this->OtherState = 4;
    CorruptSaveFile(bVar1);
    return;
  }
  if (this->pfsErr) {
    this->OtherState = 1;
    return;
  }
  if (QuestData::VerifyChecksum(buff)) {
    QuestData::SetPointers(buff,this->saveDatsP + bVar1);
    LoadSliders(this->saveDatsP + bVar1,bVar1);
    this->AidynSaveSlots++;
    return;
  }
LAB_80087164:
  this->OtherState = 4;
  CorruptSaveFile(bVar1);
  return;
}

void WidgetContPakData::m800871c8(){
  m80087c40();
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
        Pfs2xCheck(PVar4,Controller::GetPSFERR(0));
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
  WidgetChild8 *pWVar2;
  BaseWidget *pBVar3;
  Color32 aCStack_88;
  Color32 aCStack_48;
  
  this->unk2b9 = 20;
  m80087c40();
  aCStack_88.R = 0xe1;
  aCStack_88.G = 0xe1;
  aCStack_88.B = 0xe1;
  aCStack_88.A = 0xff;
  aCStack_48.R = 0;
  aCStack_48.G = 0;
  aCStack_48.B = 0;
  aCStack_48.A = 0;
  this->unk2a0 = new WidgetChild8(1,"Saving. Do not turn the power OFF until the save is complete.",
                             100,&aCStack_88,&aCStack_48,1,0,0);
  if (gGlobals.BigAssMenu) Utilities::MoveWidget(this->unk2a0,0x19,0);
  this->unk2a0->AppendScrollMenu(new WidgetText("...",4));
  this->unk2a0->m8004de18();
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
    m80087c40();
    this->vm100();
  }
  else this->unk2b9--;
}

u32 WidgetContPakData::WriteSaveFile(u8 slot){}

void WidgetContPakData::vm100(){}

void WidgetContPakData::PfsErrOK(){this->OtherState=2;}

void WidgetContPakData::PfsErrNoPak(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0xca],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xcc],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::NewContPak(){
  u8 PVar3;
  Pfs2xCheck(PVar3,Controller::GetPSFERR(0));
  if (PVar3 == 0) {
    WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0xae],0);
    pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
    pWVar1->m8004de18();
  }
  else {
    this->pfsErr = PVar3;
    PfsErrAction();
  }
}

void WidgetContPakData::PfsErrDevice(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1e3],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xcc],FUN_800860cc,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::CourrputPak(){ConfirmOverwrite(gGlobals.CommonStrings[0x19c]);}

void WidgetContPakData::DamagedPak(){ConfirmOverwrite(gGlobals.CommonStrings[0x19d]);}

void WidgetContPakData::ConfirmOverwrite(char *txt){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,txt,0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19e],FUN_80085dcc,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80085dcc,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::PfsErrBadRead(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a1],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::PfsErrBadPak(){
  if (Controller::GetStatus2(0)) CourrputPak();
  else DamagedPak();
}

void WidgetContPakData::CorruptSaveFile(u8 param_2){
  Gsprintf(gGlobals.CommonStrings[0xbd],param_2 + 1);
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,gGlobals.text,0);
  BaseWidget *pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0xbe],FUN_80086018,0x80);
  pBVar2->var5E = (ushort)param_2;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::RepairFail(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,2,gGlobals.CommonStrings[0x1a2],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x1a4],FUN_80085e08,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x19f],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::RepairOK(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a3],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80085d64,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakData::LoadSliders(SaveDatPointers *param_2,u8 param_3){
  ControllerPakSliders *pCVar1;
  s32 ind;
  s16 sStack_50 [4];
  
  sStack_50[0] = this->unk292;
  sStack_50[1] = this->unk294;
  sStack_50[2] = sStack_50[0] + 0xdb;
  sStack_50[3] = sStack_50[1] + 0xc0;
  pCVar1 = new ControllerPakSliders(param_2,sStack_50,&this->col0);
  ind = this->unk27c->AddChild10(pCVar1);
  pCVar1->var5E = (ushort)param_3;
  Utilities::SetAlpha(this,this->col.A);
  if (this->vmE0(pCVar1)) this->unk27c->m80033018(ind);
}

void WidgetContPakData::ClearScrollMenu(){
  if (this->unk291) {
    this->unk27c->FreeMenu();
    Utilities::ClearScrollMenu2(this->field3_0x280);
  }
}

void WidgetContPakData::m80087c40(){
  if (this->unk2a0) {
    this->unk2a0->~WidgetChild8();
    this->unk2a0 = NULL;
  }
}

void WidgetContPakData::m80087c88(){
  this->field17_0x29c = Utilities::AddBorg8Widget(this,loadBorg8(this->borg8),this->unk292 + 0x41,this->unk294);
  this->unk27c = new WidgetMenuChild(this->unk292,this->unk294,this->unk292 + 0xdb,this->unk294 + 0xc0);
  this->Link(this->unk27c);
  this->field3_0x280 = Utilities::AddScrollMenu(this,4,this->unk292 + 0xaa,this->unk294 + 0x9c,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,
                      (this->col0).R,(this->col0).G,(this->col0).B,(this->col0).A,0);
  this->field3_0x280->SetFlags(1);
  Utilities::SetScrollMenuColors(this->field3_0x280,(this->col1).R,(this->col1).G,(this->col1).B,
             (this->col1).A,(this->col2).R,(this->col2).G,(this->col2).B,
             (this->col2).A,0xf);
  this->unk291 = 1;
}

void WidgetContPakData::ReadPakPrompt(){
  Color32 acStack136;
  Color32 acStack72;
  
  if (this->unk2a0 == NULL) {
    acStack136.R = 0xe1;
    acStack136.G = 0xe1;
    acStack136.B = 0xe1;
    acStack136.A = 0xff;
    acStack72.R = 0;
    acStack72.G = 0;
    acStack72.B = 0;
    acStack72.A = 0;
    this->unk2a0 = new WidgetChild8(1,"Reading from Controller Pak",100,&acStack136,&acStack72,1,0,0);
    if (gGlobals.BigAssMenu) Utilities::MoveWidget(this->unk2a0,25,0);
    this->unk2a0->AppendScrollMenu(new WidgetText("...",4));
    this->unk2a0->m8004de18();
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
      WidgetContPakData(param_2,param_3,param_4,param_5,0xff,param_6,param_7,param_8){
  ALLOCS(this->dataBuffer,sizeof(SaveDatStruct),1536);
  QuestData::InitSaveFile(this->dataBuffer);
  this->filenum = -1;
}

WidgetContPakDataSave::~WidgetContPakDataSave(){
  HFREE(this->dataBuffer,1548);
  WidgetContPakData::~WidgetContPakData();
}

void WidgetContPakDataSave::unk(){}

u32 WidgetContPakDataSave::ShowSaveFiles(){
  WidgetChild6 *pWVar3;
  ulong uVar4;
  u16 uStack136 [4];
  Color32 aCStack_48 [18];
  uStack136[0] = this->unk292;
  uStack136[1] = this->unk294;
  uStack136[2] = uStack136[0] + 200;
  uStack136[3] = uStack136[1] + 0x78;
  aCStack_48[0].R = 0x67;
  aCStack_48[0].G = 0x46;
  aCStack_48[0].B = 0x3c;
  aCStack_48[0].A = 0xff;
  pWVar3 = new WidgetChild6("Create New Save",&uStack136,aCStack_48,0,0x1c);
  pWVar3->var5C = 2;
  pWVar3->AButtonFunc = FUN_80086144;
  this->unk27c->AddChild10(pWVar3);
  Utilities::SetAlpha(this,this->col.A);
  this->unk27c->m80032f0c();
  return this->vmF0();
}

void WidgetContPakDataSave::LoadSaveFile(u8 param_2){
  this->unk2ba = param_2;
  this->OtherState = 9;
}

u32 WidgetContPakDataSave::vmE0(BaseWidget *param_2){
  param_2->var5C = 3;
  param_2->AButtonFunc = FUN_80085f08;
  if (this->filenum == -1) return false;
  if (param_2->var5E == this->filenum) {
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
  uint uVar5;
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
  BaseWidget *pBVar2 = this->unk27c->m80032ef8();
  u8 bVar1 = pBVar2->var5C;
  Utilities::ClearScrollMenu2(this->field3_0x280);
  if ((bVar1 & 2))
    this->field3_0x280->Append(FUN_800862f4(0,pBVar2->var5E,gGlobals.CommonStrings[0x1a8],FUN_80086118));
  if ((bVar1 & 1))
    this->field3_0x280->Append(FUN_800862f4(0,pBVar2->var5E,gGlobals.CommonStrings[0x1a9],FUN_80085e44));
  return this->field3_0x280->Append(FUN_800862f4(0,0,gGlobals.CommonStrings[0x1aa],FUN_80086054));
}

u32 WidgetContPakDataSave::WriteSaveFile(u8 filenum){
  Pfs2xCheck(this->pfsErr,Controller::WritePakSave((u8 *)this->dataBuffer,filenum,0,sizeof(SaveDatStruct),0));
  if (this->pfsErr == 0) this->filenum = (uint)filenum;
  else this->OtherState = 1;
  return true;
}

void WidgetContPakDataSave::vm100(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,1,gGlobals.CommonStrings[0x1a6],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb0],FUN_80086080,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakDataSave::FullWarning(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,3,gGlobals.CommonStrings[0xb7],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb6],FUN_80086180,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb9],FUN_80085da0,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xba],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakDataSave::LowSpaceWarn(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_80086290,&this->wHandler,3,gGlobals.CommonStrings[0x188],0);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb6],repeated_space_warning,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xb9],FUN_80085da0,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0xba],FUN_80086054,0x80));
  pWVar1->m8004de18();
}

void WidgetContPakDataSave::NewContPak(){
  this->filenum = -1;
  WidgetContPakData::NewContPak();
}

WidgetContPakDataLoad::WidgetContPakDataLoad(u16 param_2,u16 param_3,void *param_4,void *param_5,
          Color32 *param_6,Color32 *param_7,Color32 *param_8):
          WidgetContPakData(param_2,param_3,param_4,param_5,0xf1,param_6,param_7,param_8){}

void WidgetContPakDataLoad::unk(){}

u32 WidgetContPakDataLoad::ShowSaveFiles(){
  u16 uStack_48[4];
  if (this->AidynSaveSlots == 0) {
    uStack_48[0] = this->unk292;
    uStack_48[1] = this->unk294;
    uStack_48[2] = uStack_48[0] + 200;
    uStack_48[3] = uStack_48[1] + 0x78;
    this->unk27c->AddChild10(new WidgetChild6("There are currently no games saved on this Controller Pak.",(u16 (*) [4])&uStack_48,
                        &this->col0,0,0x1c));
    Utilities::SetAlpha(this,this->col.A);
    this->unk27c->m80032f0c();
    return this->vmF0();
  }
  else {
    this->unk27c->m80032f0c();
    return this->vmF0();
  }
}

void WidgetContPakDataLoad::LoadSaveFile(u8 param_2){
  
  u8 PVar1;
  Pfs2xCheck(PVar1,Controller::GetPSFERR(0));
  if (PVar1 == 0) {
    QuestData::LoadFromMemPak(this->saveDatsP[param_2].datStart);
    this->OtherState = 5;
  }
  else this->OtherState = 0;
}

u32 WidgetContPakDataLoad::vmE0(BaseWidget *w){
    w->AButtonFunc=FUN_80085fcc;
    w->var5C=3;
    return 0;
}
u32 WidgetContPakDataLoad::vmF0(){
  BaseWidget *pBVar2 = this->unk27c->m80032ef8();
  u8 bVar1 = pBVar2->var5C;
  Utilities::ClearScrollMenu2(this->field3_0x280);
  if ((bVar1 & 2) != 0)
    this->field3_0x280->Append(FUN_800862f4(0,pBVar2->var5E,gGlobals.CommonStrings[0x1a7],FUN_80086118));
  if ((bVar1 & 1) != 0)
    this->field3_0x280->Append(FUN_800862f4(0,pBVar2->var5E,gGlobals.CommonStrings[0x1a9],FUN_80085e44));
  return this->field3_0x280->Append(FUN_800862f4(0,0,gGlobals.CommonStrings[0x1aa],FUN_80086054));
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
  pBVar1->var5E = param_1;
  return pBVar1;
}

WidgetChild8 * FUN_80088a78(u16 param_1,char *param_2){ 
  return FUN_80088aac(FUN_8004cfd0,gGlobals.widgetHandler,param_1,param_2,0);
}

WidgetChild8 *FUN_80088aac(void (*func)(BaseWidget*),WidgetHandler *handler,u16 choices,char *title,ushort var){
  WidgetChild8 *pWVar1;
  u16 uVar2;
  Color32 colA;
  Color32 colB;
  
  uVar2 = 200;
  colA.R = 0xe1;
  colA.G = 0xe1;
  colA.B = 0xe1;
  colA.A = 0xff;
  colB.R = 0xe1;
  colB.G = 0xe1;
  colB.B = 0xe1;
  colB.A = 0xff;
  if (gGlobals.BigAssMenu) uVar2 = 150;
  WidgetChild8 *pWVar1 = new WidgetChild8(choices,title,uVar2,&colA,&colB,0,10,0);
  if (gGlobals.BigAssMenu) Utilities::MoveWidget(pWVar1,0x19,0);
  handler->AddWidget(pWVar1);
  freeWidgetFunc = func;
  pWVar1->var5E = var;
  return pWVar1;
}

//file break?

char* sContPakBlank=" ";
u32 DAT_800f1c74=1;
u32 DAT_800f1c78=0;
void(*DAT_800f1c7c)(BaseWidget*)=NULL;
ContPakWidget* contpak_widget=NULL;
u32 u32_800f1c84=0;

void open_mempak_menu(u32 param_1,u32 param_2,u16 param_3,u16 param_4,u32 param_5){
  DAT_800f1c74 = param_1;
  DAT_800f1c78 = param_2;
  make_mempak_menu(param_3,param_4,param_5);
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
  g = Graphics::StartDisplay(*GG,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  g = Graphics::SomeOtherInit(g,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0,0,0,0);
  g = tick_and_render_widgets(g);
  g = N64Print::Draw(g,delta);
  *GG = g;
}

u32 FUN_80088d80(void){return DAT_800f1c78;}


void make_mempak_menu(short x,short y,u32 param_3){
  if (contpak_widget == NULL) {
    contpak_widget = new ContPakWidget(param_3);
    contpak_widget->SetCoords(x,y);
    DAT_800f1c7c = freeWidgetFunc;
    freeWidgetFunc = FUN_8008a7b8;
    WHANDLE->AddWidget(contpak_widget);
  }
}

u32 FUN_80088e2c(void){return u32_800f1c84;}

ContPakWidget::ContPakWidget(u32 param_2):WidgetMenu(){
  this->field3_0x84 = 0;
  this->pfserr = 0;
  this->fileNum = 0;
  this->field6_0x87 = 0;
  this->contStat = 0;
  this->field1_0x7c = 0;
  this->w80 = NULL;
  this->field7_0x88 = param_2;
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

void ContPakWidget::m80088f44(){this->field3_0x84 = 0;}

BaseWidget * ContPakWidget::AFunc(){
  BaseWidget *w = NULL;
  if (this->field6_0x87) w = Utilities::GetHighlightedEntry(this->w80);
  return w;
}

BaseWidget * ContPakWidget::AFunc(){return this;}

BaseWidget * ContPakWidget::UpFunc(){
  if (this->field6_0x87) this->w80->UpFunc();
  return NULL;
}

BaseWidget * ContPakWidget::DownFunc(){
  if (this->field6_0x87) this->w80->DownFunc();
  return NULL;
}


u8 ContPakWidget::Tick(){

  u8 bVar2;
  
  if (this->handler.GetTail() == NULL) {
    switch(this->field3_0x84) {
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
    Font::SetFace(gGlobals.font,font_face[1].borg8);
    bVar2 = WidgetMenu::Tick();
    Font::SetFace(gGlobals.font,font_face[0].borg8);
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
  
  Font::SetFace(gGlobals.font,font_face[1].borg8);
  g = RenderChildren(g,x0,y0,x1,y1);
  Font::SetFace(gGlobals.font,font_face[0].borg8);
  g = this->handler.Render(g,x0,y0,x1,y1);
  return g;
}

BaseWidget * ContPakWidget::Control(controller_aidyn *param_2){
  if (this->handler.GetTail() == NULL) return BaseWidget::Control(param_2);
  else return this->handler.Control((ControllerFull *)param_2);
}

void ContPakWidget::ConfirmDelete(BaseWidget *w){
  WidgetChild8 *pWVar1;
  BaseWidget *pBVar2;
  
  pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0xcd],0);
  pBVar2 = ContPakTextWidget(gGlobals.CommonStrings[0xce],ContPak_EraseMenu,0x80);
  pBVar2->var5E = w->var5E;
  pWVar1->AppendScrollMenu(pBVar2);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x20],FUN_8008a87c,0x80));
  pWVar1->m8004de18();
}

void ContPakWidget::ErasePakSave(BaseWidget *param_2){
  this->field3_0x84 = 2;
  this->pfserr = Controller::ErasePakSave((u8)param_2->var5E,0);
  if (this->pfserr) {
    if (this->pfserr == PFS_ERR_BAD_DATA) {
      this->pfserr = Controller::ErasePakSave((u8)param_2->var5E,0);
      if (this->pfserr == 0) return;
    }
    this->field3_0x84 = 1;
  }
}

void ContPakWidget::m8008937c(){this->field3_0x84=0;}

void ContPakWidget::m80089384(BaseWidget *w){
  if (Controller::RepairPak(0) == 0) m80089b0c((u8)w->var5E);
  else m80089a64((u8)w->var5E);
}

void ContPakWidget::GetPfsErr(){
  this->pfserr = Controller::GetPSFERR(0);
  this->field3_0x84 = 1;
  if (this->pfserr == PFS_ERR_BAD_DATA) {
    this->pfserr = Controller::GetPSFERR(0);
  }
}

void ContPakWidget::ErrSwitch(){
  this->field3_0x84 = 4;
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
  this->field3_0x84 = 3;
  if (!this->field6_0x87) LoadWindow();
  else Utilities::ClearScrollMenu2(this->w80);
}

void ContPakWidget::PrintMemcardFiles(){
  fileState_aidyn afStack_50 [2];
  
  u8 fileno = this->fileNum++;
  if (this->fileNum <= SaveFileMax) {
    Pfs2xCheck(this->pfserr,Controller::GetPakSaveState(afStack_50,(uint)fileno,0));
    if (this->pfserr == 0) {
      PrintFile(fileno,afStack_50[0].game_name,afStack_50[0].ext_name,afStack_50[0].filesize);
    }
    else PrintBlankFile(fileno);
  }
  else PrintFreeSpace();
}

void ContPakWidget::m800895d8(){m8008a554();}

void ContPakWidget::m800895f4(){
  if (Controller::CheckStatus(0)) {
    BaseWidget*w=this->handler.GetTail();
    if (!w) this->field3_0x84 = 0;
    else if (w->var5E == 2) {
      if (Controller::GetPSFERR(0) == 0) {
        this->field3_0x84 = 4;
        return;
      }
      this->field3_0x84 = 0;
    }
    else {
      this->field3_0x84 = 0;
    }
    m8008a4e0();
  }
}

void ContPakWidget::m80089668(){
  BaseWidget *w = this->handler.GetTail();
  if (((w) && (w->state != 5)) && (w->state != 6)) m8008a554();
}

void ContPakWidget::PfsOK(){this->field3_0x84 = 2;}

void ContPakWidget::PfsNoPak(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x195],this->pfserr);
  pWVar1->AppendScrollMenu(pWVar1,ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->m8004de18();
  pWVar1->SetHighlight(1);
}

void ContPakWidget::PfsNewPak(){
  u8 PVar3;
  Pfs2xCheck(PVar3,Controller::GetPSFERR(0));
  if (PVar3 == 0) {
    WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x18b],this->pfserr);
    pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x18c],ContPak_8008a768,0x80));
    pWVar1->m8004de18();
  }
  else {
    this->pfserr = PVar3;
    ErrSwitch();
  }
}

void ContPakWidget::PfsErr(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0x191],this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x194],ContPak_8008a768,0x80));
  pWVar1->m8004de18();
  return;
}

void ContPakWidget::DeviceErr(){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x1e3],
                        (ushort)this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->m8004de18();
}

void ContPakWidget::FatalErr(){
  if (Controller::GetStatus2(0)) m80089a1c();
  else m80089a40();
}


void ContPakWidget::m80089978(char *param_2){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,param_2,(ushort)this->pfserr);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((ushort)this->pfserr,gGlobals.CommonStrings[399],ContPak_8008a790));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->m8004de18();
  return;
}

void ContPakWidget::m80089a1c(){m80089978(gGlobals.CommonStrings[0x18d]);}

void ContPakWidget::m80089a40(){m80089978(gGlobals.CommonStrings[0x18e]);}

void ContPakWidget::m80089a64(u8 param_2){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,2,gGlobals.CommonStrings[0x198],(ushort)param_2);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((ushort)param_2,gGlobals.CommonStrings[0x193],FUN_8008a8a4));
  pWVar1->AppendScrollMenu(ContPakTextWidget(gGlobals.CommonStrings[0x192],ContPak_8008a738,0x80));
  pWVar1->m8004de18();
}


void ContPakWidget::m80089b0c(u8 param_2){
  WidgetChild8 *pWVar1 = FUN_80088aac(FUN_8008a848,&this->handler,1,gGlobals.CommonStrings[0x197],(ushort)param_2);
  pWVar1->AppendScrollMenu(ContPakTextWidget2((ushort)param_2,gGlobals.CommonStrings[0x18c],ContPak_8008a768));
  pWVar1->m8004de18();
  this->field3_0x84 = 0;
}

void ContPakWidget::m80089b9c(u8 param_2){
  WidgetChild9 *pWVar1 = new WidgetChild9(60,ContPak_8008a790);
  pWVar1->var5E = (ushort)param_2;
  pWVar1->BButtonFunc = FUN_8008c1b0;
  this->handler.AddWidget(pWVar1);
}

void ContPakWidget::LoadWindow(){
  int iVar2;
  ushort uVar3;
  Borg8Header *pBVar4;
  BaseWidget *pBVar5;
  ulong uVar6;
  short sVar7;
  short x;
  short sVar8;
  short sVar9;
  short y;
  
  this->field6_0x87 = 1;
  if (this->field7_0x88) {
    pBVar4 = loadBorg8(0xe5);
    Utilities::AddBorg8Widget2
              (this,pBVar4,this->x + -0xc,this->y + -7,
               (pBVar4->dat).Width + -0xc,(pBVar4->dat).Height + -7);
  }
  pBVar4 = loadBorg8(0xe3);
  sVar9 = this->x;
  Utilities::AddBorg8Widget2(this,pBVar4,sVar9,this->y,sVar9 + (pBVar4->dat).Width,
             this->y + (pBVar4->dat).Height);
  sVar8 = this->y + (pBVar4->dat).Height;
  pBVar4 = loadBorg8(BORG8_CONTROLLER_PAK);
  sVar9 = this->y;
  sVar7 = this->x + 0x67;
  uVar3 = (ushort)(pBVar4->dat).Width >> 1;
  Utilities::AddBorg8Widget2
            (this,pBVar4,sVar7 - uVar3,sVar9 + 0xd,uVar3 + sVar7,
             (pBVar4->dat).Height + sVar9 + 0xd);
  y = (pBVar4->dat).Height + this->y + 0x16;
  Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x17c],this->x + 10,y,0x67,0x46,0x3c,0xff);
  Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x187],this->x + 0x26,y,0x67,0x46,0x3c,0xff);
  Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x17d],this->x + 0x92,y,0x67,0x46,0x3c,0xff);
  Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x17e],this->x + 0xa5,y,0x67,0x46,0x3c,0xff);
  sVar9 = sVar8 + -0x14;
  pBVar5 = Utilities::AddTextWidget
                     (this,gGlobals.CommonStrings[0x17f],0,sVar9,0x67,0x46,0x3c,0xff);
  uVar6 = pBVar5->GetWidth();
  pBVar5->x = (this->x - (short)uVar6) + 0xb3;
  uVar6 = pBVar5->GetWidth();
  pBVar5 = Utilities::AddTextWidget
                     (this,sContPakBlank,pBVar5->x + (short)uVar6 + -5,sVar9,0x67,0x46,0x3c,
                      0xff);
  this->field1_0x7c = Utilities::AddTextWidget
                     (this,sContPakBlank,pBVar5->x + (short)uVar6 + -5,sVar9,0x67,0x46,0x3c,
                      0xff);
  uVar6 = pBVar5->GetHeight();
  sVar7 = this->field1_0x7c->GetHeight();
  sVar9 = this->x;
  x = sVar9 + 5;
  this->w80 = Utilities::AddScrollMenu(this,SaveFileMax,x,y + (short)uVar6 + 2,x,y + sVar7 + 2,sVar9 + 199,
                      this->field1_0x7c->y + -7,0x67,0x46,0x3c,0xff,0);
  Utilities::SetScrollMenuColors(this->w80,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  sVar8 += -0x1b;
  sVar9 = this->x + 10;
  pBVar5 = Utilities::AddTextWidget(this,"{ ",sVar9,sVar8,0,0,0xa4,0xff);
  Utilities::AddTextWidget(this," Delete",(short)pBVar5->GetWidth() + sVar9,sVar8,0x67,0x46,0x3c,0xff);
  sVar8 = pBVar5->GetHeight() + sVar8;
  pBVar5 = Utilities::AddTextWidget(this,"} ",sVar9,sVar8,0,0xa4,0,0xff);
  Utilities::AddTextWidget(this,"Exit",pBVar5->GetWidth() + sVar9,sVar8,0x67,0x46,0x3c,0xff);
}

void ContPakWidget::PrintFreeSpace(){
  byte abStack_10 [16];
  this->field3_0x84 = 4;
  this->fileNum = 0;
  abStack_10[0] = 0;
  Pfs2xCheck(this->pfserr,Controller::GetPakFreeBlocks8(abStack_10,0));
  if (this->pfserr == 0) sprintf(Utilities::GetWidgetText(this->field1_0x7c),"%d",(uint)abStack_10[0]);
  else this->field3_0x84 = 1;
}

void ContPakWidget::PrintFile(u8 fileno,char *param_3,char *param_4,ushort param_5){
  WidgetGroup *w = new WidgetGroup(4);
  Gsprintf("%d",fileno + 1);
  w->AddToGroup(WText(gGlobals.text),15,0,1);
  w->AddToGroup(WText(param_3),33,0,1);
  w->AddToGroup(WText(param_4),150,0,1);
  Gsprintf("%d",(uint)(param_5 >> 8));
  w->AddToGroup(WText(gGlobals.text),169,0,1);
  this->w80->Append(w);
  w->var5E = (ushort)fileno;
  w->AButtonFunc = ContPak_DeleteMenu;
}
void ContPakWidget::PrintBlankFile(u8 fileno){
  WidgetGroup *w = new WidgetGroup(4);
  Gsprintf("%d",fileno + 1);
  w->AddToGroup(WText(gGlobals.text),15,0,1);
  w->AddToGroup(WTextSafe(gGlobals.CommonStrings[0x199]),33,0,1);
  w->AddToGroup(WText(sContPakBlank),150,0,1);
  w->AddToGroup(WText(0),0xa9,0,1);
  this->w80->Append(w);
  w->var5E = (ushort)fileno;
}


void ContPakWidget::m8008a4e0(){
  BaseWidget *w;
  
  while (w = this->handler.RemoveWidget(), w != NULL) {
    w->BFunc();
    if (w) w->~BaseWidget();
  }
}
void ContPakWidget::m8008a554(){
  u8 CVar1;
  u8 CVar2;
  bool bVar3;
  u8 PVar4;
  
  if (this->field3_0x84 == 5) m800895f4();
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
        Pfs2xCheck(PVar4,Controller::GetPSFERR(0));
        m8008a4e0();
        if (PVar4 == PFS_ERR_NEW_PACK) {
          this->pfserr = PFS_ERR_NEW_PACK;
        }
        else {
          if (PVar4 != 0) {
            this->pfserr = PVar4;
            this->field3_0x84 = 1;
            return;
          }
          this->pfserr = PFS_ERR_NEW_PACK;
        }
        this->field3_0x84 = 1;
      }
      else if ((CVar2 == CONT_CARD_PULL) && ((CVar1 == CONT_CARD_ON || (CVar1 != CONT_CARD_PULL))))
      {
        m8008a4e0();
        this->field3_0x84 = 0;
      }
    }
  }
}

void ContPakWidget::m8008a698(BaseWidget *w){
  this->handler.FreeWidget(w);
  if (w) w->~BaseWidget();
}


void ContPakWidget::m8008a6dc(){
  this->field3_0x84 = 5;
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
  if ((param_1) && (contpak_widget)) contpak_widget->m8008a698(param_1);
}

BaseWidget * FUN_8008a87c(BaseWidget *param_1,BaseWidget *param_2){
  contpak_widget->m80088f44();
  return NULL;
}

BaseWidget * FUN_8008a8a4(BaseWidget * param_1,BaseWidget *param_2){
  contpak_widget->m80089b9c((u8)param_2->var5E);
  return NULL;
}
