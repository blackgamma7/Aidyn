#include "globals.h"
#include "vobjects.h"

//lockpicking popup

void lockpicking_check(voxelObject *param_1) {
  BaseWidget *w;
  u16 *pmVar4;
  
  u16 VVar1 = (param_1->header).type;
  if ((VVar1 == VOXEL_Teleporter) || (VVar1 == VOXEL_Container)) {
    pmVar4 = NULL;
    if (VVar1 == VOXEL_Container) pmVar4 = (u16 *)param_1->container.LockLV;
    if (VVar1 == VOXEL_Teleporter) pmVar4 = &param_1->teleport.lock_lv;
    if (PARTY->Lockpicking(*pmVar4,gGlobals.text)) {
      //successful, show unlock message.
      w = textbox_func(gGlobals.text);
      w->BButtonFunc = lockpicking_widget_ABfunc;
      w->AButtonFunc = lockpicking_widget_ABfunc;
      w->substruct = param_1;
      *pmVar4 = 0;
    }
    //failed showed "beyond your skill" message
    else textbox_func(gGlobals.text);
  }
}

BaseWidget * lockpicking_widget_ABfunc(BaseWidget *param_1,BaseWidget *param_2) {
  param_2->SetState(5);
  voxelObject *pvVar1 = (voxelObject *)param_2->substruct;
  gGlobals.playerCharStruct.text_window = NULL;
  if (pvVar1) {
    //containers likey use "opened" flag for "unlocked" flag.
    if ((pvVar1->header).type == VOXEL_Teleporter)
      setEventFlag(pvVar1->teleport.lockpick_flag_2,true);
    run_voxelFuncs0(pvVar1,0x7fff,0);
  }
  return NULL;
}

