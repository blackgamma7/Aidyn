#include "trapMenu.h"
#include "globals.h"

voxelObject* gCurrentTrapVoxel=NULL;

bool TrapMenu::InitMenu(voxelObject *v){
  char *pcVar1;
  u16 *iVar2;
  WidgetChild8 *pWVar2;
  uint uVar4;
  BaseWidget *iVar3;
  bool bVar5;
  Color32 acStack88;
  
  gCurrentTrapVoxel = v;
  iVar2 = GetTrapLV(v);
  if (iVar2[1] < 3) {
    Gsprintf(Cstring(TrapMenuLevel),Cstring(TrapMenuLevel0));
  }
  else if(iVar2[1] < 6){
    Gsprintf(Cstring(TrapMenuLevel),Cstring(TrapMenuLevel1));
  }
  else Gsprintf(Cstring(TrapMenuLevel),Cstring(TrapMenuLevel2));
  acStack88.R = 0xe1;
  acStack88.G = 0xff;
  acStack88.B = 0xe1;
  acStack88.A = 0xff;
  pWVar2 = new WidgetChild8(2,gGlobals.text,180,&acStack88,&acStack88,1,10,0);
  iVar3 = WTextSafe(Cstring(TrapMenuDisarm));
  iVar3->AButtonFunc = AttemptDisarm;
  pWVar2->AppendScrollMenu(iVar3);
  pWVar2->AppendScrollMenu(WTextSafe(Cstring(TrapMenuExit)));
  pWVar2->m8004de18();
  return WHANDLE->AddWidget(pWVar2);
}

BaseWidget* TrapMenu::AttemptDisarm(BaseWidget* A,BaseWidget* B){
    if (gCurrentTrapVoxel) {
        u16 *iVar1 = GetTrapLV(gCurrentTrapVoxel);
      if (PARTY->DisarmSkill(*(byte *)((int)iVar1 + 3)))
        TrapDisarmed();
      else TrapExploded();
    }
    return 0;
  }

  BaseWidget* TrapMenu::CloseMenu(BaseWidget*A ,BaseWidget*B ){
    B->SetState(5);
    gGlobals.playerCharStruct.text_window = NULL;
    if (gCurrentTrapVoxel) {
      if ((gCurrentTrapVoxel->header).type == VOXEL_Teleporter) {
        setEventFlag(gCurrentTrapVoxel->teleport.trapDisarmFlag,true);
      }
      run_voxelFuncs0(gCurrentTrapVoxel);
      gCurrentTrapVoxel = NULL;
    }
    return 0;
  }

  
void TrapMenu::TrapDisarmed(void){
  voxelObject *pvVar1;
  u16 *puVar2;
  Color32 uStack144={COLOR_OFFWHITE};
  Color32 uStack80={COLOR_BLACK};
  gGlobals.playerCharStruct.text_window =some_textbox_func(Cstring(TrapMenuSuccess),120,&uStack144,&uStack80,1);
  (gGlobals.playerCharStruct.text_window)->AButtonFunc = CloseMenu;
  (gGlobals.playerCharStruct.text_window)->BButtonFunc = CloseMenu;
  (gGlobals.playerCharStruct.text_window)->CDownButtonFunc = NULL;
  (gGlobals.playerCharStruct.text_window)->CUpButtonFunc = NULL;
  puVar2 = GetTrapLV(gCurrentTrapVoxel);
  *puVar2 = 0xff;
  puVar2[1] = 0;
}


void TrapMenu::TrapExploded(void){
  u16 uVar2;
  voxelObject *pvVar3;
  u16 *puVar4;
  BaseWidget *pBVar5;
  
  puVar4 = GetTrapLV(gCurrentTrapVoxel);
  pvVar3 = gCurrentTrapVoxel;
  uVar2 = puVar4[1];
  puVar4[1] = 0;
  *puVar4 = 0xff;
  if ((pvVar3->header).type == VOXEL_Container) 
    open_explosive_chest(pvVar3,gGlobals.Sub.borg9DatPointer);
  pBVar5 = TakeDamage(uVar2,Cstring(TrapMenuBoom));
  if (pBVar5) {
    pBVar5->AButtonFunc = textbox_func_AB;
    pBVar5->BButtonFunc = textbox_func_AB;
    if ((gCurrentTrapVoxel->header).type == VOXEL_Teleporter) {
      pBVar5->BButtonFunc = CloseMenu;
      pBVar5->AButtonFunc = CloseMenu;
    }
    else gCurrentTrapVoxel = NULL;
  }
}

BaseWidget * TrapMenu::TakeDamage(short param_1,char *param_2){
  CharSheet *pCVar1;
  uint txtWidth;
  int iVar3;
  uint txtWNew;
  BaseWidget *pBVar5;
  char abStack1080 [512];
  char acStack_238 [256];
  char acStack_138 [256];
  int txtStarted;
  u32 txtHeight;
  int txtLines;
  
  txtWidth = 0;
  txtStarted = 0;
  txtHeight = 0;
  txtLines = 0;
  if (param_2) {
    strcpy(abStack1080,param_2);
    txtStarted = 1;
    txtLines = 1;
    txtHeight = Font::GetHeight(gGlobals.font,abStack1080,0,SCREEN_WIDTH);
    txtWidth = Font::GetWidthScaled(gGlobals.font,abStack1080,1.0);
  }
  for(u32 i=0;i<4;i++) {
    CharSheet *pCVar1 = gGlobals.party->Members[i];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      s16 dmg = MAX(param_1 * RollD(1,4),1); //Bug(?): causes 2 "rolls" - first checks, second sets.
      if (dmg < CharStats::getModded(pCVar1->Stats,STAT_END)) //endurance damage
        CharStats::addModdedHealth(pCVar1->Stats,STAT_END,-(char)dmg);
      else //endurance to 1
        CharStats::addModdedHealth(pCVar1->Stats,STAT_END,1 - (char)CharStats::getModded(pCVar1->Stats,STAT_END));
      sprintf(acStack_238,Cstring(TrapMenuDamage),pCVar1->name,dmg);
      txtWNew = Font::GetWidthScaled(gGlobals.font,acStack_238,1.0);
      if (txtWidth < txtWNew) txtWidth = txtWNew;
      if (!txtStarted) {
        strcpy(abStack1080,acStack_238);
        txtStarted = 1;
        txtHeight = Font::GetHeight(gGlobals.font,abStack1080,0,SCREEN_WIDTH);
      }
      else {
        sprintf(acStack_138,"%s\n%s",abStack1080,acStack_238);
        strcpy(abStack1080,acStack_138);
      }
      txtLines++;
    }
  }
  BaseWidget *pBVar5 = TextPopup_New(abStack1080,(short)txtWidth + 0x10,((short)txtHeight + 2) * (short)txtLines,
                         0xff,0xff,0xff,0xff,0x96,1);
  gGlobals.playerCharStruct.text_window = pBVar5;
  pBVar5->CDownButtonFunc = NULL;
  pBVar5->CUpButtonFunc = NULL;
  return pBVar5;
}

u16 * TrapMenu::GetTrapLV(voxelObject *param_1){
  short *psVar2;
  
  switch((param_1->header).type){
    case VOXEL_Container:
    psVar2= &param_1->container.trap_lv;
    break;
    case VOXEL_Teleporter:
    psVar2 = &param_1->teleport.trap_value;
    break;
    default:
    CRASH("Invalid Voxel Object for trap","./menus/trapmenu.cpp");
  }
  return (u16 *)psVar2;
}