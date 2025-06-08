#include "gameStateMod.h"
#include "quicksort.h"
#include "romcopy.h"

#define FILENAME "./src/gamestatemod.cpp"

u8 debug_gamestatefunnel_sub(void){
  gamestatemod_byte = 4;
  return true;
}

extern BaseWidget * WidgetBorg8At(BaseWidget *param_1,Borg8Enum Index,short X,short Y,short H,short W);
u8 ScreenFademode_10(Gfx **GG){
  char cVar2;
  Gfx *pGVar5;
  s16 uStack416 [2];
  short asStack_160 [2];
  s16 uStack348 [2];
  Color32 uStack288;
  Color32 uStack224;
  Color32 uStack160;
  Color32 uStack96;
  controller_aidyn *cont;
  
  if (gamestatemod_byte == 2) {
    cVar2 = DAT_800e61cc + -1;
    if (DAT_800e61cc == '\0') {
      gamestatemod_byte = 1;
      cVar2 = DAT_800e61cc;
    }
  }
  else {
    if (gamestatemod_byte < 3) {
      if (gamestatemod_byte != 1) {
        return 10;
      }
      gamestatemod_free();
      if (gBufferedMenuP) {
        gBufferedMenuP->~WBMGSM();
        gBufferedMenuP = NULL;
      }
      if (gGSMClassP == NULL) return 1;
      delete(gGSMClassP);
      gGSMClassP = NULL;
      return 1;
    }
    if (gamestatemod_byte != 3) {
      if (gamestatemod_byte != 4) {
        return 10;
      }
      FUN_80005610();
      gGSMClassP =new GSMClass();
      uStack416[0] = 0x28;
      uStack416[1] = 0x28;
      asStack_160[0] = 0xa0;
      asStack_160[1] = 0x28;
      uStack288.A = 0xff;
      uStack224.A = 0xff;
      uStack160.A = 0xff;
      uStack288.R = 0xe1;
      uStack288.G = 0xe1;
      uStack288.B = 0xe1;
      uStack224.R = 0xe1;
      uStack224.G = 0xe1;
      uStack224.B = 0xe1;
      uStack160.R = 0xe1;
      uStack160.G = 0xe1;
      uStack160.B = 0xe1;
      uStack96.R = 0xe1;
      uStack348[0] = 300;
      uStack348[1] = 200;
      uStack96.G = 0;
      uStack96.B = 0;
      uStack96.A = 0;
      gBufferedMenuP= new WBMGSM(gGSMClassP,0xe,gameStates->flagTotal,(ushort *)uStack416,
                          asStack_160,&uStack288,&uStack224,&uStack160,&uStack96);
      WidgetBorg8At(gBufferedMenuP,BORG8_2x2Pixel,0x14,0x14,300,200);
      return 10;
    }
    pGVar5 = *GG;
    while ( Controller::GetInput(&cont,0)) {
      if ((cont->input_2 & L_BUTTON) != 0) cont->input|= L_BUTTON;
      if (gBufferedMenuP->Control(cont)) {
        gamestatemod_byte = 2;
        DAT_800e61cc = 6;
      }
    }
    pGVar5 = Graphics::SomeOtherInit(pGVar5,0,0,0x140,0xf0,0,0,0,0);
    RSPFUNC6(pGVar5);
    gBufferedMenuP->Tick();
    *GG = gBufferedMenuP->Render(pGVar5,0,0,0x140,0xf0);
    cVar2 = DAT_800e61cc;
  }
  DAT_800e61cc = cVar2;
  return 10;
}


s32 FUN_80005500(EventFlag *param_1,EventFlag *param_2){
  if (param_2[1] <= param_1[1]) {
    return (s32)(param_1[1] != param_2[1]);
  }
  return -1;
}

void quicksort_gamestatemod(void **toSort,uint arraySize){
    Quicksort::Sort(toSort,arraySize,sizeof(EventFlagPair),(Sorter)FUN_80005500);}


#define GSMSize 0x57f0
extern void *gameStatemod_dat;
void load_gamestatemod_dat(void){
  ALLOCS(PTR_800e61c0,GSMSize,615);
  if (PTR_800e61c0) {
    ROMCOPYS(PTR_800e61c0,gameStatemod_dat,GSMSize,621);
    //seems redundant. Why not alloc once?
    ALLOCS(gamestatemod_pointer,GSMSize,624);
    memcpy(gamestatemod_pointer,PTR_800e61c0,GSMSize);
    quicksort_gamestatemod((void**)gamestatemod_pointer,(uint)gameStates->flagTotal);
  }
}


void FUN_80005610(void){
  load_gamestatemod_dat();
  gamestatemod_byte = 3;
}

void gamestatemod_free(void){
  FREE(PTR_800e61c0,646);
  gamestatemod_byte = 0;
  FREEPTR(gamestatemod_pointer,660);
}

void GSMClass::vMethA(u16 i,char *str){
  sprintf(str,"%5d:%5d = %s",
    gamestatemod_pointer[i][1],gamestatemod_pointer[i][0],
    boolean_labels[getEventFlag(gamestatemod_pointer[i][0])]);
}

void GSMClass::vMethB(u16 i,char *str){
  Passto_State_typeA_branch(gamestatemod_pointer[i][0]);
    sprintf(str,"%5d:%5d = %s",
    gamestatemod_pointer[i][1],gamestatemod_pointer[i][0],
    boolean_labels[getEventFlag(gamestatemod_pointer[i][0])]);
}

void GSMClass::vMethC(u16 i,char *str){
  s32 sVar1;
  int iVar2;
  byte bVar3;
  u16 i;
  Struct_State *pSVar5;
  char *pcVar6;
  
  if (str) {
    if (gamestatemod_pointer[i][0] < gameStates->bitFlags) sprintf(str,"Simple Bit");
    else {
      bVar3 = 0;
      pSVar5 = gameStates->States_pointer + gamestatemod_pointer[i][0];
      sVar1 = sprintf(str,"type: %s, command: %s, N: %d\n",
                          eventflag_types1 + pSVar5->type,eventflag_types2 + pSVar5->command,
                          (uint)pSVar5->shortA);
      pcVar6 = str + sVar1;
      i = pSVar5->shortB;
      if (pSVar5->length != 0) {
        do {
          pcVar6+= sprintf(pcVar6,"%d, ",gameStates->other_pointer[i]);
          bVar3++;
          i++;
        } while (bVar3 < pSVar5->length);
      }
    }
  }
  return;
}

WBMGSM::WBMGSM(GSMClass *obj,u16 param_3,u16 param_4,ushort *bounds,
              short *titleBounds,Color32 *colA,Color32 *ColB,Color32 *colC,Color32 *colD)
        :WidgetBufferedMenu(obj,param_3,param_4,bounds,titleBounds,colA,ColB,colC,colD){}


u32 Ofunc_ret0(void){return 0;}

WBMGSM::~WBMGSM(){WidgetBufferedMenu::~WidgetBufferedMenu();}

