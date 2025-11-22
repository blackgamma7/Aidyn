#include "globals.h"
#include "cheats.h"


BaseWidget * InputMenu_LeftButton(BaseWidget *w0,BaseWidget *w1){
  InputWidgetSubStruct *IMSub = (InputWidgetSubStruct *)w1->substruct;
  WAMSub *AMSub = (WAMSub *)IMSub->arrayMenu->substruct;
  IMSub->entry[IMSub->entryIndex] = (u8)IMSub->arrayMenu->LeftFunc()->varU16;
  UpdateCursorPos(IMSub,AMSub);
  PlayAudioSound(&gGlobals.SFXStruct,BORG12_CursorChirp,0,1.0,30,0);
  return NULL;
}

BaseWidget * InputMenu_RightButton(BaseWidget *w0,BaseWidget *w1){
  InputWidgetSubStruct *IMSub = (InputWidgetSubStruct *)w1->substruct;
  WAMSub *AMSub = (WAMSub *)IMSub->arrayMenu->substruct;
  IMSub->entry[IMSub->entryIndex] = (u8)IMSub->arrayMenu->RightFunc()->varU16;
  BaseWidget* entry=AMSub->entries[AMSub->entryPos];
  UpdateCursorPos(IMSub,AMSub);
  PlayAudioSound(&gGlobals.SFXStruct,BORG12_CursorChirp,0,1.0,30,0);
  return NULL;
}

BaseWidget * InputMenu_UpButton(BaseWidget *w0,BaseWidget *w1){
  InputWidgetSubStruct *IMSub = (InputWidgetSubStruct *)w1->substruct;
  WAMSub *AMSub = (WAMSub *)IMSub->arrayMenu->substruct;
  IMSub->entry[IMSub->entryIndex] = (u8)IMSub->arrayMenu->UpFunc()->varU16;
  BaseWidget* entry=AMSub->entries[AMSub->entryPos];
  UpdateCursorPos(IMSub,AMSub);
  return NULL;
}

BaseWidget * InputMenu_DownButton(BaseWidget *w0,BaseWidget *w1){
  InputWidgetSubStruct *IMSub = (InputWidgetSubStruct *)w1->substruct;
  WAMSub *AMSub = (WAMSub *)IMSub->arrayMenu->substruct;
  IMSub->entry[IMSub->entryIndex] = (u8)IMSub->arrayMenu->DownFunc()->varU16;
  BaseWidget* entry=AMSub->entries[AMSub->entryPos];
  UpdateCursorPos(IMSub,AMSub);
  return NULL;
}

BaseWidget * InputMenu_BButton(BaseWidget *w0,BaseWidget *w1){
    w1->varU8=0;
    return w1;
}


BaseWidget * InputMenu_AButton(BaseWidget* param_1,BaseWidget *w1){
  s16 sVar1;
  char *pcVar3;
  WidgetDollMenu *pWVar4;
  BaseWidget *pBVar6;
  BaseWidget *uVar10;
  u32 uVar7;
  u8 uVar8;
  byte bVar16;
  byte *pbVar17;
  InputWidgetSubStruct *piVar2;
  WAMSub *piVar7;
  
  piVar2 = (InputWidgetSubStruct *)w1->substruct;
  uVar10 = piVar2->arrayMenu->AFunc();
  if (uVar10->GetNumber() != WidgetN_ClipText) return NULL;
  u16 uVar14 = uVar10->varU16;
  if (uVar14 == '~') {//backspace
    piVar2->entry[piVar2->entryIndex] = '\0';
    if (piVar2->entryIndex != 0) piVar2->entryIndex--;
    piVar2->entry[piVar2->entryIndex] = (char)uVar10->varU16;
  }
  else {
    if (uVar14 == '`') {//"X"
      w1->varU8 = 0;
      return w1;
    }
    if (uVar14 == '\\') {//"Ok"
      if (piVar2->entry[piVar2->entryIndex] == '\\') {
        if (piVar2->entryIndex != 0) {
          piVar2->entry[piVar2->entryIndex] = '\0';
        }
      }
      pbVar17 = (byte *)(piVar2->entry + 1);
      if (piVar2->entry[1] != '\0') {
        bVar16 = *pbVar17;
        while( true ) {
          if ((bVar16 - 'A' < 26) && (pbVar17[-1] != ' ')) {
            *pbVar17 = bVar16 + 0x20;
          }
          pbVar17++;
          if (*pbVar17 == 0) break;
          bVar16 = *pbVar17;
        }
      }
      if (piVar2->entryIndex == 0) return NULL;
      //if correct cheat, reset name entry
      if (Cheats::Check(piVar2->entry)) {
        strcpy(piVar2->entry,piVar2->output);
        uVar8 = strlen(piVar2->entry);
        piVar2->entryIndex = uVar8;
        if (uVar8 >= IMNameLength)piVar2->entryIndex = IMNameLength-1;
        piVar2->entry[piVar2->entryIndex] = (char)uVar10->varU16;
        piVar2->entry[piVar2->entryIndex + 1] = '\0';
        return NULL;
      }
      sprintf(piVar2->output,piVar2->entry);
      if (gGlobals.BigAssMenu){
        pWVar4 = PauseSub->dollmenu;
        if (pWVar4) {
          for (uVar8 = 0; uVar8 < pWVar4->portraits->partySize; uVar8++) {
            if (pWVar4->portraits->portraits[uVar8]->varU16 == EntInd_Alaron) {
              Utilities::ChangeWidgetText(pWVar4->portraits->names[uVar8],piVar2->entry,true);
              break;
            }
          }
        }
      }
      w1->varU8 = piVar2->entryIndex;
      return w1;
    }
    if ((piVar2->entryIndex == 0) && (uVar14 == ' ')) {
      return NULL;
    }
    if (piVar2->entryIndex < IMNameLength-1) {
      piVar2->entry[++piVar2->entryIndex] = (char)uVar10->varU16;
    }
    else {
      piVar7 = (WAMSub *)piVar2->arrayMenu->substruct;
      piVar7->entryCount--;
      UpdateCursorPos(piVar2,piVar7);
    }
  }
  return NULL;
}


BaseWidget * InputMenu_StartButton(BaseWidget *w0,BaseWidget *w1){
  byte bVar1;
  s16 sVar2;
  WidgetDollMenu *pWVar4;
  BaseWidget *pBVar6;
  u8 uVar12;
  byte *pbVar13;
  WAMSub *piVar4;
  InputWidgetSubStruct *piVar3;
  
  piVar3 = (InputWidgetSubStruct *)w1->substruct;
  pBVar6 = piVar3->arrayMenu->AFunc();
  if (pBVar6->GetNumber() == WidgetN_ClipText) {
    piVar4 = (WAMSub *)piVar3->arrayMenu->substruct;
    uVar12 = piVar4->entryCount - 1;
    if (piVar4->entryPos == uVar12) {
      pbVar13 = (byte *)(piVar3->entry + 1);
      if (piVar3->entry[1] != '\0') {
        bVar1 = *pbVar13;
        while( true ) {
          if ((bVar1 - 'A' < 26) && (pbVar13[-1] != ' ')) {
            *pbVar13 = bVar1 + 0x20;
          }
          pbVar13++;
          if (*pbVar13 == 0) break;
          bVar1 = *pbVar13;
        }
      }
      if (piVar3->entryIndex != 0) {
        if (piVar3->entry[piVar3->entryIndex] == '\\') {
          piVar3->entry[piVar3->entryIndex] = '\0';
        }
        if (Cheats::Check(piVar3->entry)) {
          strcpy(piVar3->entry,piVar3->output);
          uVar12 = strlen(piVar3->entry);
          piVar3->entryIndex = uVar12;
          if (uVar12 >= IMNameLength) piVar3->entryIndex = IMNameLength-1;
          piVar3->entry[piVar3->entryIndex] = (char)pBVar6->varU16;
          piVar3->entry[piVar3->entryIndex + 1] = '\0';
          return NULL;
        }
        sprintf(piVar3->output,piVar3->entry);
        w1->varU8 = piVar3->entryIndex;
        if (gGlobals.BigAssMenu == NULL) return w1;
        pWVar4 = PauseSub->dollmenu;
        if (pWVar4) {
          for(uVar12 = 0;uVar12<pWVar4->portraits->partySize;uVar12++) {
            if (pWVar4->portraits->portraits[uVar12]->varU16 == EntInd_Alaron){
            Utilities::ChangeWidgetText(pWVar4->portraits->names[uVar12],piVar3->entry,true);
            break;
            }
          }
          return w1;
        }
        return w1;
      }
    }
    else {
      piVar4->entryPos = (u16)uVar12;
      UpdateCursorPos(piVar3,piVar4);
      piVar3->entry[piVar3->entryIndex] = '\\';
    }
  }
  return NULL;
}