#include "globals.h"
#include "vobjects.h"

//lockpicking popup

void lockpicking_check(voxelObject *param_1) {
  u16 VVar1 = (param_1->header).type;
  if ((VVar1 == VOXEL_Teleporter) || (VVar1 == VOXEL_Container)) {
    u16 *LV = NULL;
    if (VVar1 == VOXEL_Container) LV = (u16 *)param_1->container.LockLV;
    if (VVar1 == VOXEL_Teleporter) LV = &param_1->teleport.lock_lv;
    if (PARTY->Lockpicking(*LV,gGlobals.text)) {
      //successful, show unlock message.
      BaseWidget *w = textbox_func(gGlobals.text);
      w->BButtonFunc = lockpicking_widget_ABfunc;
      w->AButtonFunc = lockpicking_widget_ABfunc;
      w->substruct = param_1;
      *LV = 0;
    }
    //failed showed "beyond your skill" message
    else textbox_func(gGlobals.text);
  }
}

BaseWidget * lockpicking_widget_ABfunc(BaseWidget *w0,BaseWidget *w1) {
  w1->SetState(WidgetS_Closing);
  voxelObject *v = (voxelObject *)w1->substruct;
  gGlobals.playerCharStruct.text_window = NULL;
  if (v) {
    //containers likey use "opened" flag for "unlocked" flag.
    if ((v->header).type == VOXEL_Teleporter)
      setEventFlag(v->teleport.lockpick_flag_2,true);
    run_voxelFuncs0(v,0x7fff,0);
  }
  return NULL;
}

