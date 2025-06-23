#include "combat/CombatStruct.h"
#include "widgets/CombatRadar.h"
#include "globals.h"

#define FILENAME "./src/combatgui.cpp"

u32 gCombatGuiUnusedToggle=1;
u8 gCombatPortraitCount=0;
CombatPortrait* gCombatPortraits=NULL;
CombatRadarBlip* gCombatRadarBlips=NULL;
GuiAnimationManager* combat_gui_substruct=NULL;
u32 combat_gui_flag=true;
u8 combat_gui_incrementer=1;

extern BaseWidget* PTR_800ed504;

void combat_gui_init(void){
  ItemID IVar1;

  BaseWidget *pBVar6;
  WidgetCombatRadar *pWVar7;
  int iVar8;
  byte bVar9;
  u8 i;
  u8 uVar11;
  
  uVar11 = 0;
  combat_gui_incrementer = 0;
  PTR_800ed504 = new WidgetMenu();
  WHANDLE->AddWidget(PTR_800ed504);
 PTR_800ed504->Link(new WidgetCombatRadar());
  gCombatPortraitCount = PARTY->PartySize + 2;
  for(i=0;i<12;i++) {
    if (gCombatP->encounter_dat->enemy_entities[i]) {
      gCombatPortraitCount++;
      uVar11++;
    }
  }
  ALLOCS(gCombatPortraits,gCombatPortraitCount * sizeof(CombatPortrait),236);
  combat_gui_init_2(PTR_800ed504,uVar11,PARTY->PartySize);
  memset(gCombatPortraits,0,gCombatPortraitCount * sizeof(CombatPortrait));
  for(i=0;i<4;i++) {
    if ((PARTY->Members[i]) && (IVar1 = PARTY->Members[i]->ID, IVar1 != 0)) {
      make_combat_portrait(gCombatPortraits + combat_gui_incrementer,IVar1,combat_gui_incrementer,1);
      combat_gui_incrementer++;
    }
  }
  bVar9 = 0;
  do {
    make_combat_portrait
              (gCombatPortraits + combat_gui_incrementer,(ItemID)0x0,combat_gui_incrementer,1);
    bVar9++;
    gCombatPortraits[combat_gui_incrementer].unkb = 5;
    combat_gui_incrementer++;
  } while (bVar9 < 2);
  for(i=0;i<12;i++) {
    IVar1 = gCombatP->encounter_dat->enemy_entities[i];
    if (IVar1) {
      make_combat_portrait(gCombatPortraits + combat_gui_incrementer,IVar1,combat_gui_incrementer,0);
      combat_gui_incrementer++;
    }
  }
  CombatTextboxWidget_Init();
  gCombatGuiUnusedToggle = 1;
  combat_gui_substruct= new GuiAnimationManager(0x40);
  combat_gui_flag = 1;
}

extern void free_borg8_widget(Borg8Header*);
void combatgui_free(void){
  if (combat_gui_substruct) {
    combat_gui_substruct->~GuiAnimationManager();
    combat_gui_substruct = NULL;
  }
  CombatTextboxWidget_Free();
  for(u8 i=0;i<gCombatPortraitCount;i++){
      free_borg8_widget(gCombatPortraits[i].basePortait->borg8);
    }
  FREEPTR(gCombatPortraits,315);
  FREEPTR(gCombatRadarBlips,332);
  WHANDLE->FreeWidget(PTR_800ed504);
  FREEQW(PTR_800ed504);
  gCombatPortraitCount = 0;
  PTR_800ed504 = NULL;
}

Gfx * FUN_8008f6e4(Gfx *param_1,u8 delta){
  fadeFloatMirror = gGlobals.brightness;
  if (combat_gui_flag) {
    combat_gui_flag = 0;
    FUN_80090404();
  }
  FUN_8008fb3c(delta);
  return FUN_8008fb64(param_1,delta);
}


void init_combatgui_struct(ItemID param_1,u8 param_2,u8 param_3){
  u8 i;
  byte bVar5;
  int iVar4;
  u8 uVar6;
  uint uVar7;
  CombatPortrait *pCVar8;
  CombatPortrait *pCVar9;
  
  for (i = 0;
      (uVar7 = (uint)gCombatPortraitCount, pCVar9 = NULL, i < uVar7 &&
      ((pCVar9 = gCombatPortraits + i, pCVar9->unkb != 0 || (pCVar9->Owner != param_1))));
      i++) {
  }
  if (pCVar9 == NULL) {
    if ((uVar7 != 0) && (pCVar9 = gCombatPortraits, gCombatPortraits->unkb != 5)) {
      i = 1;
      do {
        if (uVar7 <= i) break;
        pCVar9 = gCombatPortraits + i;
        i += 1;
      } while (pCVar9->unkb != 5);
    }
    pCVar9->basePortait->borg8 = loadBorg8(gEntityDB->GetPortrait(param_1));
    if (param_3) bVar5 = 3;
    else bVar5 = 2;
    pCVar9->unkb = bVar5;
    pCVar9->cEntIndex = param_2;
    i = 0;
    if (gCombatPortraitCount != 0) {
      iVar4 = 0;
      do {
        if ((&gCombatRadarBlips->unk14)[(iVar4 + i) * 2] != 0) {
          uVar6 = (u8)i;
          goto LAB_8008f8f8;
        }
        i++;
        iVar4 = i << 1;
      } while (i < gCombatPortraitCount);
    }
  }
  bVar5 = 3;
  if (!param_3) bVar5 = 2;
  pCVar9->unkb = bVar5;
  pCVar9->cEntIndex = param_2;
  uVar6 = get_combat_gui_index_((int)param_3);
  if ((longlong)(char)uVar6 == 0xff) {
    if (param_3) {
      pCVar8 = NULL;
      if ((gCombatPortraitCount != 0) && (pCVar8 = gCombatPortraits, gCombatPortraits->unkb != 4)) {
        i = 1;
        while ((pCVar8 = NULL, i < gCombatPortraitCount &&
               (pCVar8 = gCombatPortraits + i, gCombatPortraits[i].unkb != 4))) {
          i++;
        }
      }
      if (pCVar8 != NULL) {
        pCVar8->unkb = 1;
        uVar6 = pCVar8->blipIndex;
        FUN_80090174(pCVar9->blipIndex,pCVar8);
        FUN_80090174(uVar6,pCVar9);
      }
    }
  }
  else {
LAB_8008f8f8:
    FUN_80090174(uVar6,pCVar9);
  }
}

void pass_to_draw_crossbones(ItemID param_1,char param_2){
  draw_crossbones_2(param_1,param_2,BORG8_PortraitCrossbone,0);
}

void flee_draw_crossbones(ItemID param_1,char param_2){
  draw_crossbones_2(param_1,param_2,BORG8_PortraitCrossbone,1);
}


void draw_crossbones_2(ItemID param_1,char param_2,u32 borgId,int param_4){
  byte bVar1;
  int iVar2;
  u8 i;
  CombatPortrait *ppWVar4;
  
  i = 0;
  ppWVar4 = NULL;
  if (gCombatPortraitCount != 0) {
    iVar2 = 0;
    do {
      ppWVar4 = &gCombatPortraits[i];
      if ((((ppWVar4->cEntIndex == param_2) && (bVar1 = ppWVar4->unkb, bVar1 != 0)) && (bVar1 != 1))
         && ((bVar1 != 4 && (bVar1 != 5)))) break;
      i++;
      ppWVar4 = NULL;
    } while (i < gCombatPortraitCount);
  }
  draw_crossbone(ppWVar4,borgId);
  if (ppWVar4->unkb == 3) {
    ppWVar4->unkb = 4;
    ppWVar4->unk14 = param_4;
  }
  else ppWVar4->unkb = 1;
}

void draw_dead_crossbones(ItemID param_1){
  for(u32 i=0;i<gCombatPortraitCount;i++){
      CombatPortrait *pCVar1 = &gCombatPortraits[i];
      if ((pCVar1->unkb == 0) && (pCVar1->Owner == param_1)) {
        pCVar1->unkb = 1;
        pCVar1->unk14 = 1;
        draw_crossbone(pCVar1,BORG8_PortraitCrossbone);
        return;
      }
  }
}

void FUN_8008fb3c(u8 delta){combat_gui_substruct->Tick(delta);}

Gfx * FUN_8008fb64(Gfx *g,byte delta){
  RSPFUNC6(g);
  three_combat_gui_funcs();
  g = CombatTextboxWidget_Tick(g,delta);
  g = tick_and_render_widgets(g);
  return CombatDrawHealthbar(g,delta);
}

void make_combat_portrait(CombatPortrait *portrait,ItemID id,u8 count,u32 param_4){
  Borg8Header *img;
  WidgetBorg8Combat *pWVar2;
  
  img = NULL;
  if (id) img = loadBorg8(gEntityDB->GetPortrait(id));
  WidgetBorg8Combat *pWVar2 = ConstructWidgetBorg8Combat(PTR_800ed504,img,0xa0,0x78,1);
  portrait->unkc = param_4;
  portrait->basePortait = pWVar2;
  portrait->Owner = id;
  portrait->cEntIndex = 0xff;
  portrait->blipIndex = 0xff;
}


void combat_gui_init_2(BaseWidget *param_1,u8 param_2,u8 param_3)

{
  uint uVar1;
  byte bVar4;
  uint uVar2;
  u8 uVar3;
  short sVar5;
  short sVar6;
  uint uVar7;
  
  sVar5 = 0x12;
  uVar7 = 0;
  uVar1 = (param_2 + param_3) * sizeof(CombatRadarBlip);
  ALLOCS(gCombatRadarBlips,uVar1,652);
  memset(gCombatRadarBlips,0,uVar1);
  bVar4 = 0;
  if (param_3 != 0) {
    uVar1 = 0;
    do {
      uVar7 = uVar1 + 1 & 0xffff;
      draw_radar_blip((u16)uVar1,param_1,0x10e,sVar5,2,0x1c6,0x17,0x17,0,2,1);
      sVar5 += 0x1c;
      bVar4 += 1;
      uVar1 = uVar7;
    } while (bVar4 < param_3);
  }
  bVar4 = 0;
  do {
    uVar1 = uVar7 + 1 & 0xffff;
    draw_radar_blip((u16)uVar7,param_1,0x10e,sVar5,2,0x1c6,0x17,0x17,0,2,0);
    sVar5 += 0x1c;
    bVar4 += 1;
    gCombatRadarBlips[uVar1 - 1].unk14 = 1;
    uVar7 = uVar1;
  } while (bVar4 < 2);
  sVar5 = 0x12;
  uVar2 = 0;
  if (param_2 != 0) {
    do {
      uVar1 = uVar7 + 1 & 0xffff;
      draw_radar_blip((u16)uVar7,param_1,0x15,sVar5,2,0x1c6,0x17,0x17,1,0,1);
      sVar5 += 0x1c;
      uVar2++;
      if (param_2 <= uVar2) break;
      uVar7 = uVar1;
    } while (uVar2 < 4);
  }
  uVar3 = 0;
  uVar2 = param_2 - uVar2 & 0xffff;
  sVar6 = sVar5;
  uVar7 = uVar1;
  if (uVar2 != 0) {
    do {
      uVar7 = uVar1 + 1 & 0xffff;
      draw_radar_blip((u16)uVar1,param_1,0x15,sVar6,1,0x1c7,0xb,10,1,0,1);
      uVar3++;
      if (uVar2 <= uVar3) break;
      uVar1 = uVar7;
      sVar6 = sVar6 + 0xc;
    } while (uVar3 < 4);
  }
  for (; uVar3 < uVar2; uVar3++) {
    draw_radar_blip((u16)uVar7,param_1,0x23,sVar5,1,0x1c7,0xb,10,1,0,1);
    sVar5 += 0xc;
    uVar7 = uVar7 + 1 & 0xffff;
  }
}

void draw_radar_blip(u16 param_1,BaseWidget *param_2,short param_3,short param_4,short param_5,
                    u32 param_6,short param_7,short param_8,u32 param_9,short param_10,u32 param_11){
  CombatRadarBlip *blip = gCombatRadarBlips + param_1;
  blip->unkc = 1;
  blip->unk4 = param_10 + param_3 + param_5;
  blip->unk6 = param_4 + param_5;
  blip->unk8 = param_7;
  blip->unka = param_8;
  blip->unk10 = param_9;
  blip->unk14 = 0;
  blip->widget = ConstructWidgetBorg8Combat(param_2,loadBorg8(param_6),param_3,param_4,param_11);
}


WidgetBorg8Combat *
ConstructWidgetBorg8Combat(BaseWidget *parent,Borg8Header *img,short x,short y,u32 param_5){
    //constructor appears to be inline'd.
  WidgetBorg8Combat *pwVar1 = new WidgetBorg8Combat(img,param_5);
  if (pwVar1 == NULL) pwVar1 = NULL;
  else {
    pwVar1->SetCoords(x,y);
    if (parent) parent->Link(pwVar1);
  }
  return pwVar1;
}

u8 get_combat_gui_index_(int param_1){
  
  for(u8 i=0;i<gCombatPortraitCount;i++){
    if((gCombatRadarBlips[i].unk10==param_1)&&
      (gCombatRadarBlips[i].unkc)&&(gCombatRadarBlips[i].unk14))return i;
  }
  return 0xff;
}


void FUN_80090174(u8 param_1,CombatPortrait *param_2){
  CombatRadarBlip *pCVar9 = gCombatRadarBlips + param_1;
  pCVar9->unkc = 0;
  param_2->blipIndex = param_1;
  pCVar9->widget->visible = 1;
  pCVar9->unk14 = 0;

  combat_gui_substruct->AddItem(new GuiAnimatorBlip(&param_2->basePortait->x,&pCVar9->unk4,60));
  combat_gui_substruct->AddItem(new GuiAnimatorU2(&param_2->basePortait->y,&pCVar9->unk6,60,&double_array_1));
  combat_gui_substruct->AddItem(new GuiAnimatorU4(&param_2->basePortait->width,(u16 *)&pCVar9->unk8,60,&double_array_0));
  combat_gui_substruct->AddItem(new GuiAnimatorU4(&param_2->basePortait->height,(u16 *)&pCVar9->unka,60,&double_array_0));
  if (param_2->Overlay) {
    combat_gui_substruct->AddItem(new GuiAnimatorBlip(&param_2->Overlay->x,&pCVar9->unk4,60));
    combat_gui_substruct->AddItem(new GuiAnimatorU2(&param_2->Overlay->y,&pCVar9->unk6,60,&double_array_1));
    combat_gui_substruct->AddItem(new GuiAnimatorU4(&param_2->Overlay->width,(u16 *)&pCVar9->unk8,60,&double_array_0));
    combat_gui_substruct->AddItem(new GuiAnimatorU4(&param_2->Overlay->height,(u16 *)&pCVar9->unka,60,&double_array_0));
  }
}


void FUN_80090404(void){
  for(u16 i=0;i<gCombatPortraitCount;i++){
      CombatPortrait *ppwVar3 = &gCombatPortraits[i];
      if ((ppwVar3->blipIndex == 0xff) && (ppwVar3->unkb != 5)) {
        u8 uVar2 = get_combat_gui_index_(ppwVar3->unkc ^ 1);
        ppwVar3->blipIndex = uVar2;
        FUN_80090174(uVar2,ppwVar3);
      }
  }
}


void FUN_800904c8(void){
    for(u32 i=0;i<gCombatPortraitCount;i++){
        gCombatRadarBlips[i].widget->SetColor(0,0,0,200);
    }
}

void FUN_80090568(void){
    for(u32 i=0;i<gCombatPortraitCount;i++){
        if((gCombatPortraits[i].unk14)&&(gCombatPortraits[i].blipIndex!=0xFF))
        gCombatRadarBlips[gCombatPortraits[i].blipIndex].widget->SetColor(200,164,0,255);
    }
}


void FUN_80090634(void){
  WidgetBorg8Combat *pWVar1;
  int iVar5;
  byte bVar6;
  for(u8 i=0;i<gCombatPortraitCount;i++){
      CombatPortrait *pCVar4 = &gCombatPortraits[i];
      byte bVar6 = pCVar4->unkb;
      if ((((bVar6 != 0) && (bVar6 != 1)) && (bVar6 != 4)) &&
         ((bVar6 != 5 && (pCVar4->blipIndex != 0xff)))) {
        WidgetBorg8Combat *pWVar1 = gCombatRadarBlips[pCVar4->blipIndex].widget;
        if ((&gCombatP->combatEnts)[pCVar4->cEntIndex]){
          CombatAI_s *pCVar2 = (&gCombatP->combatEnts)[pCVar4->cEntIndex]->aiP;
          if (pCVar2) {
            if (CombatAIInfo::IsAlly(pCVar2)) pWVar1->SetColor(200,164,0,0xff);
          }
        }
        if (gCombatP->substruct2[0].arrayA[pCVar4->cEntIndex])
          pWVar1->SetColor(0,200,0,0x96);
        if (gCombatP->substruct2[1].arrayA[pCVar4->cEntIndex])
          pWVar1->SetColor(200,0,0,0x96);
        if ((gCombatP->substruct2[0].arrayB[pCVar4->cEntIndex] == 0) ||
           (gCombatP->substruct2[0].arrayA[pCVar4->cEntIndex] == 0)) {
        }
        else {
          if ((gGlobals.combatBytes[0] == 9) || (gGlobals.combatBytes[0] == 0x12)) {
            pWVar1->SetColor(0,0xff,0,0xff);
          }
        }   //???
        if (((*(int *)((int)(gCombatP->textboxes + -1) + (pCVar4->cEntIndex + 0x24) * 4) != 0) &&
            (gCombatP->substruct2[1].arrayA[pCVar4->cEntIndex] != 0)) && (gGlobals.combatBytes[0] - 10 < 2)) {
          pWVar1->SetColor(0xff,0,0,0xff);
        }
      }
  }
}


void three_combat_gui_funcs(void){
  FUN_800904c8();
  FUN_80090568();
  FUN_80090634();
}

extern void getHPColor(Color32*,CharSheet*);
Gfx * CombatDrawHealthbar(Gfx *g,u32 param_2){
  uint uVar6;
  u16 uVar7;
  ushort V;
  u16 x;
  float fVar8;
  s16 afStack_e8[2]={-4,24};
  Color32 hpColBlended;
  Color32 hpCol;
  
  for(u16 i=0;i<gCombatPortraitCount;i++){
      CombatPortrait *pCVar3 = &gCombatPortraits[i];
      u8 bVar1 = pCVar3->unkb;
      if ((((bVar1 != 0) && (bVar1 != 1)) && (bVar1 != 4)) && (bVar1 != 5)) {
        CharSheet *pCVar2 = (&gCombatP->combatEnts)[pCVar3->cEntIndex]->charSheetP;
        getHPColor(&hpCol,pCVar2);
        Portraits::BlendColors(&hpCol,&hpColBlended,gGlobals.brightness);
        CombatRadarBlip *pCVar4 = gCombatRadarBlips;
        bVar1 = pCVar3->blipIndex;
        x = gCombatRadarBlips[bVar1].unk4 + afStack_e8[pCVar3->unkb != 2];
        uVar6 = Entity::getHPCurrent(pCVar2);
        uVar7 = Entity::getHPMax(pCVar2);
        fVar8 = (float)uVar6 / (float)uVar7;
        if (1.0f < (float)uVar6 / (float)uVar7) fVar8 = 1.0f;
        uVar7 = (u16)(pCVar4[bVar1].unk6 + pCVar4[bVar1].unka) - (int)(pCVar4[bVar1].unka * fVar8);
        V = pCVar4[bVar1].unk6 + pCVar4[bVar1].unka;
        if (uVar7 == V) uVar7--;
        Gfx *gfx = DrawRectangle(g,x,pCVar4[bVar1].unk6,x + 3,V,0,0,0,0xff);
        g = DrawRectangle(gfx,x,uVar7,x + 3,V,hpColBlended.R,hpColBlended.G,hpColBlended.B,0xff);
      }
  }
  return g;
}

void draw_crossbone(CombatPortrait *param_1,u32 param_2){
  param_1->Overlay = ConstructWidgetBorg8Combat(param_1->basePortait,loadBorg8(param_2),param_1->basePortait->x,param_1->basePortait->y,1);
  param_1->Overlay->SetWidth(param_1->basePortait->GetWidth());
  param_1->Overlay->SetHeight(param_1->basePortait->GetHeight());
  param_1->Overlay->col.A = 0;
  //inline'd constructor(?)
  combat_gui_substruct->AddItem(new GuiAnimatorCB(&param_1->Overlay->col.A,255,60.0));
}

WidgetBorg8Combat::~WidgetBorg8Combat(){WidgetBorg8::~WidgetBorg8();}

Gfx * WidgetBorg8Combat::Render(Gfx *g,u16 param_3,u16 param_4,u16 param_5,u16 param_6){
  if (this->visible)
    g = WidgetBorg8::Render(g,param_3,param_4,param_5,param_6);
  return g;
}

