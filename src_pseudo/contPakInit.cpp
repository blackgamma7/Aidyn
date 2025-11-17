#include "ContPakInit.h"
#include "globals.h"
#include "romstring.h"

u32 appState_ContPakCheck(Gfx **GG) {
  Gfx *g = Graphics::StartDisplay(*GG,FULL_SCREENSPACE);
  g = Graphics::SomeOtherInit(g,FULL_SCREENSPACE,0,0,0,0);
   ContPakFunc controller_error_func[]={
    load_controller_romstring,Start_opens_mempak_menu,check_cont_error,
    check_mempak_freespace,check_controller_filestate,func_checking_controller,
    ret_a0_8008bd80,NULL
   };
  if (WHANDLE->GetTail() == NULL)
    g = (*controller_error_func[contCheckSwitch])(g);
  else g = appState3_TickWidgets(g);
  *GG = N64Print::Draw(g,1);
  return init_controller_data;
}

extern void*romstring_controller;
Gfx * load_controller_romstring(Gfx *g) {
  init_controller_data = 3;
  contCheckSwitch = 1;
  controller_romstring = RomString::Load(romstring_controller,0x410);
  init_controller_flag = 0;
  Controller::GetStatus(0,&init_controller_flag);
  N64Print::Init(&gGlobals.DebugQueue);
  return g;
}

Gfx * Start_opens_mempak_menu(Gfx *g) {
  bool bVar1;
  controller_aidyn *apcStack_20;
  
  bVar1 = false;
  apcStack_20 = NULL;
  contCheckSwitch = 2;
  while (Controller::GetInput(&apcStack_20,0)) {
    if (((apcStack_20->input | apcStack_20->input_2) & START_BUTTON)) {
      bVar1 = true;
    }
  }
  if (bVar1) {
    open_mempak_menu(3,2,0x39,0x17,0);
    init_controller_data = 2;
    contCheckSwitch = 5;
  }
  return g;
}

Gfx * check_cont_error(Gfx *g) {
  u8 err;
  Pfs2xCheck(err,Controller::GetPFSERR(0));
  if (err == 0) contCheckSwitch = 4;
  else run_cont_err_func(err);
  return g;
}

Gfx * check_mempak_freespace(Gfx *g) {
  u8 err;
  u8 blocks = 0;
  Pfs2xCheck(err,Controller::GetPakFreeBlocks8(&blocks,0));
  if (err == 0) {
    if (blocks < 28) not_enough_freespace(0);
    else clear_controller_romstring();
  }
  else run_cont_err_func(err);
  return g;
}

Gfx * check_controller_filestate(Gfx *g) {
  bool bVar1;
  s32 err;
  fileState_aidyn afStack_50 [2];
  
  bVar1 = false;
  for(u8 file_no=0;file_no<SaveFileMax;file_no++){
    Pfs2xCheck(err,Controller::GetPakSaveState(afStack_50,file_no,0));
    switch(err) {
    case 0:
      if ((afStack_50[0].comp_code == THQCompCode) && (afStack_50[0].game_code == AidynGameCode)) {
        clear_controller_romstring();
        return g;
      }
      break;
    case PFS_ERR_NOPACK:
    case PFS_ERR_NEW_PACK:
    case PFS_ERR_INCONSISTENT:
    case PFS_ERR_CONTRFAIL:
    case PFS_ERR_BAD_DATA:
    case PFS_DATA_FULL:
    case PFS_DIR_FULL:
    case PFS_ERR_ID_FATAL:
    case PFS_ERR_DEVICE:
      run_cont_err_func(err);
      return g;
    case PFS_ERR_INVALID:
    case PFS_ERR_EXIST:
      bVar1 = true;
      break;
    default:
      run_cont_err_func(err);
      return g;
    }
  }
  if (bVar1) contCheckSwitch = 3;
  else pfs_err_data_full(0);
  return g;
}

Gfx * func_checking_controller(Gfx *g) {;
  if (!FUN_80088e2c()) {
    init_controller_data = 3;
    contCheckSwitch = 2;
    init_controller_flag = 0;
    Controller::GetStatus(0,&init_controller_flag);
  }
  else clear_controller_romstring();
  return g;
}

Gfx * ret_a0_8008bd80(Gfx *g){return g;}

void clear_controller_romstring(void) {
  init_controller_data = 0;
  contCheckSwitch = 0;
  RomString::Free(controller_romstring);
  controller_romstring = NULL;
  N64Print::Free();
}


void FUN_8008bdc8(void) {
  BaseWidget *w;
  
  while (w = WHANDLE->RemoveWidget(), w != NULL) {
    w->BFunc();
    if (w) w->~BaseWidget();
  }
}

void set_contCheckSwitch_to_6() {contCheckSwitch = 6;}


void FUN_8008be48(void) {
  u8 CVar1;
  BaseWidget *w;
  u8 err;
  
  w = WHANDLE->GetTail();
  CVar1 = init_controller_flag;
  if (w) {
    if (contCheckSwitch == 6) {
      if (Controller::CheckStatus(0)) {
        contCheckSwitch = 2;
        init_controller_flag = 0;
        Controller::GetStatus(0,&init_controller_flag);
        FUN_8008bdc8();
      }
    }
    else {
      if ((Controller::GetStatus(0,&init_controller_flag)) || (Controller::GetStatus(0,&init_controller_flag))) {
        if (((init_controller_flag != CONT_CARD_ON) || (CVar1 != CONT_CARD_ON)) &&
           (init_controller_flag != CVar1)) {
          if ((init_controller_flag == (CONT_CARD_PULL|CONT_CARD_ON)) && (CVar1 == CONT_CARD_PULL))
          {
            Pfs2xCheck(err,Controller::GetPFSERR(0));
            FUN_8008bdc8();
            if ((err == PFS_ERR_NEW_PACK) || (err == 0))
              run_cont_err_func(PFS_ERR_NEW_PACK);
            else
              run_cont_err_func(err);
          }
          else if ((init_controller_flag == CONT_CARD_PULL) &&
                  ((CVar1 == CONT_CARD_ON || (CVar1 != CONT_CARD_PULL)))) {
            FUN_8008bdc8();
            contCheckSwitch = 2;
          }
        }
      }
      else set_contCheckSwitch_to_6();
    }
  }
}

Gfx * appState3_TickWidgets(Gfx *g) {
  u8 delta = 0;
  ControllerFull *cont = NULL;
  FUN_8008be48();
  while (Controller::GetInput((controller_aidyn **)&cont,0)) {
    BaseWidget *w = WHANDLE->Control(cont);
    delta++;
    if ((w) && (freeWidgetFunc)) (*freeWidgetFunc)(w);
  }
  DeltaCap(delta);
  gGlobals.delta = (float)delta;
  return tick_and_render_widgets(g);
}

void run_cont_err_func(u8 err) {
  contCheckSwitch = 2;
  ContPakErrFunc cont_err_funcs[]={NULL,pfs_err_Nopak,pfs_err_new_pak,psf_err_inconsistent,
    psf_err_contrfail,psf_err_contrfail,psf_err_contrfail,pfs_err_data_full,pfs_err_data_full,
    psf_err_contrfail,pfs_err_id_fatal,pfs_err_err_device,pfs_err_err_device,psf_err_contrfail,
    psf_err_contrfail,NULL,NULL
  };
  if (err) {
    if (err < 14) (*cont_err_funcs[err])(err);
    else psf_err_contrfail(err);
  }
}

BaseWidget* continue_without_saving_(BaseWidget*w0,BaseWidget*w1){
    clear_controller_romstring();
    return NULL;
}

BaseWidget * FUN_8008c15c(BaseWidget*w0,BaseWidget*w1) {
  contCheckSwitch = 0;
  open_mempak_menu(3,2,0x39,0x17,0);
  contCheckSwitch = 5;
  init_controller_data = 2;
  return NULL;
}

BaseWidget * FUN_8008c1b0(BaseWidget *w0,BaseWidget *w1) {
  w1->AButtonFunc = NULL;
  return NULL;
}

BaseWidget * ret0_8008c1bc(BaseWidget *w0,BaseWidget *w1) {return NULL;}

BaseWidget * FUN_8008c1c4(BaseWidget *param_1,BaseWidget *param_2) {
  if ((Controller::RepairPak(0) == 0) && (Controller::GetPFSERR(0) == 0))
    contpakwidget_repairOk((u8)param_2->varU16);
  else FUN_8008c80c((u8)param_2->varU16);
  return NULL;
}

u32 FUN_8008c220(void) {return 0;}


BaseWidget * FUN_8008c228(BaseWidget *param_1,BaseWidget *param_2) {
  WidgetTimed *w = new WidgetTimed(60,FUN_8008c1c4);
  w->BButtonFunc = FUN_8008c1b0;
  w->varU16 = param_2->varU16;
  WHANDLE->AddWidget(w);
  return NULL;
}

void pfs_err_new_pak(u8 err) {
  u8 err2;
  Pfs2xCheck(err2,Controller::GetPFSERR(0));
  if (err2 == 0) {
    WidgetChoiceDia *pWVar1 = FUN_80088a78(1,controller_romstring[10]);
    BaseWidget *pBVar2 = ContPakTextWidget(controller_romstring[0xb],ret0_8008c1bc,0x80);
    pWVar1->AppendScrollMenu(pBVar2);
    pBVar2->varU16 = err;
    pWVar1->Update();
    pWVar1->varU16 = err;
  }
  else run_cont_err_func(err2);
}

void pfs_err_Nopak(u8 err) {
  WidgetChoiceDia *pWVar1 = FUN_80088a78(1,controller_romstring[6]);
  BaseWidget *pBVar2 = ContPakTextWidget(controller_romstring[7],continue_without_saving_,0x80);
  pWVar1->AppendScrollMenu(pBVar2);
  pBVar2->varU16 = err;
  pWVar1->Update();
  pWVar1->varU16 = err;
  pWVar1->SetHighlight(1);
}

void psf_err_contrfail(u8 err) {
  WidgetChoiceDia *pWVar2 = FUN_80088a78(2,controller_romstring[3]);
  BaseWidget *pBVar3 = ContPakTextWidget(controller_romstring[0],continue_without_saving_,0x80);
  pWVar2->AppendScrollMenu(pBVar3);
  pBVar3->varU16 = (ushort)err;
  pBVar3 = ContPakTextWidget(controller_romstring[4],ret0_8008c1bc,0x80);
  pWVar2->AppendScrollMenu(pBVar3);
  pBVar3->varU16 = (ushort)err;
  pWVar2->Update();
  pWVar2->varU16 = (ushort)err;
}


void pfs_err_err_device(u8 err) {
  WidgetChoiceDia *pWVar1 = FUN_80088a78(1,controller_romstring[0x13]);
  BaseWidget *w = ContPakTextWidget(controller_romstring[7],continue_without_saving_,0x80);
  pWVar1->AppendScrollMenu(w);
  w->varU16 = err;
  pWVar1->Update();
  pWVar1->varU16 = err;
  pWVar1->SetHighlight(1);
}

void pfs_err_id_fatal(u8 err) {
  if (Controller::GetStatus2(0)) psf_err_inconsistent(err);
  else FUN_8008c73c(err);
}


void FUN_8008c558(char *txt,u8 err) {
  WidgetChoiceDia *pWVar2;
  BaseWidget *w;
  
  pWVar2 = FUN_80088a78(3,txt);
  w = ContPakTextWidget(controller_romstring[4],ret0_8008c1bc,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  w = ContPakTextWidget(controller_romstring[9],FUN_8008c15c,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  w = ContPakTextWidget(controller_romstring[0],continue_without_saving_,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  pWVar2->Update();
  pWVar2->varU16 = (ushort)err;
}

void pfs_err_data_full(u8 err) {FUN_8008c558(controller_romstring[1],err);}

void not_enough_freespace(u8 err) {FUN_8008c558(controller_romstring[2],err);}

void FUN_8008c688(char *txt,u8 err) {
  WidgetChoiceDia *pWVar2 = FUN_80088a78(2,txt);
  BaseWidget *w = ContPakTextWidget(controller_romstring[0xf],FUN_8008c1c4,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  w = ContPakTextWidget(controller_romstring[0],continue_without_saving_,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  pWVar2->Update();
  pWVar2->varU16 = (ushort)err;
}

void FUN_8008c73c(u8 err) {FUN_8008c688(controller_romstring[0xd],err);}

void psf_err_inconsistent(u8 err) {FUN_8008c688(controller_romstring[0xc],err);}

void contpakwidget_repairOk(u8 err) {
  WidgetChoiceDia *pWVar1 = FUN_80088a78(1,controller_romstring[0x10]);
  BaseWidget *pBVar2 = ContPakTextWidget(controller_romstring[0xb],ret0_8008c1bc,0x80);
  pWVar1->AppendScrollMenu(pBVar2);
  pBVar2->varU16 = (ushort)err;
  pWVar1->Update();
  pWVar1->varU16 = (ushort)err;
}

void FUN_8008c80c(u8 err) {
  WidgetChoiceDia *pWVar2;
  BaseWidget *w;
  
  pWVar2 = FUN_80088a78(2,controller_romstring[0x11]);
  w = ContPakTextWidget(controller_romstring[4],FUN_8008c228,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  w = ContPakTextWidget(controller_romstring[0],continue_without_saving_,0x80);
  pWVar2->AppendScrollMenu(w);
  w->varU16 = (ushort)err;
  pWVar2->Update();
  pWVar2->varU16 = (ushort)err;
}

int appState_4(Gfx **gg) {
  Gfx *g = Sky::RenderSky(*gg,1);
  g = Graphics::StartDisplay(g,FULL_SCREENSPACE);
  g = ret_a0_8008C9BC(g);
  RSPFUNC6(g);
  WHANDLE->Tick(1);
  *gg = WHANDLE->Render(g,FULL_SCREENSPACE);
  return 4;
}


bool check_for_controller(void) {
  bool bVar2 = true;
  if (!Controller::CheckStatus(0)) {
    no_controller_warning();
    bVar2 = false;
  }
  return bVar2;
}

Gfx * ret_a0_8008C9BC(Gfx *g) {return g;}

bool no_controller_warning(void) {
  WidgetBorg8* w = WidgetB8(BORG8_WarningNoController);
  w->SetCoords(SCREEN_CENTERW - (w->GetWidth() >> 1),
            (SCREEN_HEIGHT/2) - (w->GetHeight() >> 1));
  return WHANDLE->AddWidget(w);
}