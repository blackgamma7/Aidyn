#include "globals.h"
#include "vobjects.h"
#include "voxelChart.h"
#include "shopdb.h"
#define FILENAME "./src/dialogmode.cpp"

void dialoug_func(u32 BorgID,u16 RefPointID,u16 MapDatA,u16 MapShortA,u16 MapShortB,u16 param_6)

{
  bool bVar2;
  char *pcVar1;
  u32 uVar3;
  u16 uVar4;
  int iVar5;
  u32 uVar6;
  u16 uStack104 []={
    BORG13_GoblinAmbush,FLAG_GoblinAmbush,BORG13_LugashIntro,FLAG_LugashFight,-1,-1};

  if (dialougemode_pointer == NULL) {
    get_some_borg13(BorgID);
    for (iVar5 = 0; uStack104[iVar5] != 0xffff; iVar5 += 2) {
      if (BorgID == uStack104[iVar5]) {
        gGlobals.EncounterDat.EncounterID = uStack104[iVar5 + 1];
        break;
      }
    }
    if (dialougmode_struct_init(BorgID,RefPointID,MapDatA,MapShortA,MapShortB,param_6)) {
      uVar4 = 0;
      if (borg_13_pointer->dat->CmdCount != 0) {
        do {
          DialougInsertPlayerName(get_borg_13_text(borg_13_pointer->dat,(u8)uVar4));          
          some_string_func(get_borg_13_text(borg_13_pointer->dat,(u8)uVar4));
          uVar4 += 1;
        } while (uVar4 < borg_13_pointer->dat->CmdCount);
      }
      (*dialougemode_pointer->funcs0[dialougemode_pointer->func_index])();
      sprintf(gGlobals.text,"Dialog #%d\n",dialougemode_pointer->borg13_dat->ID);
      N64Print::Print(gGlobals.text);
      whoDied_short = 0;
      if ((borg_short_list[0].borg_13 != 0xffffffff) &&
         (uVar3 = 2, whoDied_short = borg_short_list[0].some_num,
         BorgID != borg_short_list[0].borg_13)) {
        do {
          uVar6 = uVar3 & 0xffff;
          if ((&borg_short_list[0].borg_13)[uVar6] == 0xffffffff) {
            whoDied_short = 0;
            return;
          }
          uVar3 = uVar6 + 2;
        } while (BorgID != (&borg_short_list[0].borg_13)[uVar6]);
        whoDied_short = (&borg_short_list[0].some_num)[uVar6 * 2];
      }
    }
    else {
      passto_borg13_free(borg_13_pointer);
      borg_13_pointer = NULL;
    }
  }
  return;
}

void run_dialougemode_funcs3(void){
  freeWidgetFunc = NULL;
  if (dialougemode_pointer) {
    (*dialougemode_pointer->funcs3[dialougemode_pointer->func_index])();
  }
}

void CreateNewDialouge_(u32 param_1){
  Borg13Data *pBVar1;
  
  FREEQB13(borg_13_pointer);
  borg_13_pointer = get_borg13(param_1);
  dialougemode_pointer->borg13_dat = borg_13_pointer->dat;
  ofunc_sub_dialouge(gGlobals.diaClass,borg_13_pointer->dat);
  sprintf(gGlobals.text,"CreateNewDialogue\n");
  N64Print::Print(gGlobals.text);
  FUN_800b6cb8(&dialougemode_pointer->some_substruct,dialougemode_pointer->borg13_dat,0);
  return;
}

Gfx * FUN_80057e78(Gfx *gfx,u16 delta){
  Gfx *g = gfx;
  switch(dialougemode_pointer->borg13_dat->start_func){
    case 1:{
    g = Graphics::StartDisplay(gfx,FULL_SCREENSPACE);
    handleZoneEngineFrame(&g,delta,NULL);
    if (gGlobals.screenFadeMode) return g;
    break;}
    case 2:{
    Sky::ResetColors();
    g = Graphics::StartDisplay(g,FULL_SCREENSPACE);
    g = Graphics::SomeOtherInit(g,FULL_SCREENSPACE,0,0,0,0);
    g = FUN_800591a8(g,(u8)delta,true);
    if (gGlobals.screenFadeMode) return g;
    break;
    }
  }
  if (gGlobals.screenFadeMode) return g;
  dialougemode_pointer->unkab = 3;
  return g;
}

int ScreenFadeMode_12(Gfx **GG){
  byte bVar1;
  int iVar2;
  bool bVar4;
  Gfx *pGVar3;
  u8 delta;
  Gfx *g;
  controller_aidyn *apcStack_1c;
  
  g = *GG;
  delta = 0;
  switch(dialougemode_pointer->unkab){
    case 0:{
      DAT_800ee974 = 1;
      dialougemode_pointer->unkab = 1;
      run_dialougemode_funcs4();
      return 0xc;
    }
    case 1:{
    run_dialougemode_funcs1();
    g = Graphics::StartDisplay(g,FULL_SCREENSPACE);
    iVar2 = cutScene_control_func();
    gGlobals.delta = iVar2;
    FUN_80058b88(&g,iVar2);
    pGVar3 = FUN_800591a8(g,iVar2,false);
    break;
  }
  case 2:{
    apcStack_1c = NULL;
    ContDelta(apcStack_1c,delta);
    gGlobals.delta = (float)delta;
    pGVar3 = FUN_80057e78(g,delta);
    break;
  }
  case 3:{
      DAT_800ee970 = dialougemode_pointer->unk90;
      run_dialougemode_funcs5();
      if (DAT_800ee970 != 7) {
        DAT_800ee974 = 0;
        return DAT_800ee970;
      }
      DAT_800ee970 = 1;
      DAT_800ee974 = 0;
      DAT_800ee978 = 1;
      return 1;
  }
  }
  *GG = pGVar3;
  return 0xc;
}

void run_dialougemode_funcs1(void){
  if ((borg_13_pointer) && (dialougemode_pointer)) {
    (*dialougemode_pointer->funcs1[dialougemode_pointer->func_index])();
    dialougemode_pointer->unkac = 0;
  }
}

u8 dialougSkillCheck(u8 param_1){
  u32 uVar1;
  VoxelChartEntry *pVVar2;
  
  if (dialougemode_pointer->partySkillLvls[param_1] == 0xff) {
    uVar1 = PARTY->SkillCheck(param_1);
    dialougemode_pointer->partySkillLvls[param_1] = (u8)uVar1;
    if (param_1 == SKILL_Troubador) return dialougemode_pointer->partySkillLvls[9];
    if (dialougemode_pointer->Unk0x7C != 0x7fff) {
      pVVar2 = some_ref_obj_lookup_func
                         (dialougemode_pointer->Unk0x7C,
                          (u8)dialougemode_pointer->mapDatA,
                          (u8)dialougemode_pointer->mapShort1,
                          (u8)dialougemode_pointer->mapShort2,0x11,param_1 + 0x49);
      if (pVVar2 == NULL) {
        pVVar2 = passto_WriteTo_VoxelChart
                           (dialougemode_pointer->Unk0x7C,
                           (u8)dialougemode_pointer->mapDatA,
                           (u8)dialougemode_pointer->mapShort1,
                            (u8)dialougemode_pointer->mapShort2,0x11,param_1 + 0x49,10);
        pVVar2->unk0x8 = (float)(u32)dialougemode_pointer->partySkillLvls[param_1];
      }
      else {
        dialougemode_pointer->partySkillLvls[param_1] = *(u8 *)((int)&pVVar2->unk0x8 + 3);
        pVVar2->arg7 = 10;
      }
    }
  }
  return dialougemode_pointer->partySkillLvls[param_1];
}

void FUN_8005831c(void){
  if ((((dialougemode_pointer != NULL) && (dialougemode_pointer->controlLock)) &&
      (dialougemode_pointer->timerFlag == 0)) && (gGlobals.scriptcamera.counter1 == 0)) {
    dialougemode_pointer->controlLock = 0;
    gGlobals.diaClass->m8004f264();
  }
}

void FUN_80058370(void){ 
  if (!dialougemode_pointer->controlLock) {
    dialougemode_pointer->controlLock = true;
    WHANDLE->FreeWidget((gGlobals.diaClass)->menu);
    (gGlobals.diaClass)->unkC = 0;
    gGlobals.diaClass->SetUnk20();
  }
}

void FUN_800583d0(u16 t){
  dialougemode_pointer->timerFlag = true;
  dialougemode_pointer->timer9c = t;
  FUN_80058370();
}

void set_dialougemode_0x90(u32 param_1){
  dialougemode_pointer->unk90 = param_1;
}

void encounterDat_func(void){
  dialougemode_struct *pdVar1;
  u32 uVar2;
  u32 uVar3;
  
  pdVar1 = dialougemode_pointer;
  memset(&gGlobals.EncounterDat,0,0x18);
  uVar2 = 0;
  do {
    uVar3 = uVar2 + 1 & 0xff;
    gGlobals.EncounterDat.enemy_entities[uVar2] =
         *(ItemID *)((pdVar1->some_substruct).encounterEnemies + uVar2);
    uVar2 = uVar3;
  } while (uVar3 < 0xc);
  gGlobals.EncounterDat.battlefield = (pdVar1->some_substruct).battlefeild;
  gGlobals.EncounterDat.collisionByte = (pdVar1->some_substruct).collisionByte;
  gGlobals.EncounterDat.aniByte = (pdVar1->some_substruct).aniByte;
  if (0x1b < gGlobals.EncounterDat.battlefield) {
    gGlobals.EncounterDat.battlefield = 0;
  }
  gGlobals.combatBytes[2] = 1;
  gGlobals.EncounterDat.canFlee = dialougemode_pointer->func_index != 1;
}

void monsterparty_wanderstruct(Wanderer *param_1){
  playerData *ppVar1;
  playerData *ppVar2;
  vec3f afStack80;
  
  dialougemode_pointer->Wanderers = param_1;
  WanderSubstruct_setFlag1(param_1);
  ppVar1 = param_1->playerDat;
  Actor::SetFlag(ppVar1,ACTOR_800|ACTOR_40);
  ppVar2 = gPlayer;
  ppVar1->ani_type = 0;
  ppVar2->ani_type = 0;
  Vec3Sub(&afStack80,&(ppVar1->collision).pos,&(ppVar2->collision).pos);
  Vec3Normalize(&afStack80);
  Actor::SetFacing(ppVar1,afStack80.x,afStack80.z);
  Actor::SetFacing(ppVar2,-afStack80.x,-afStack80.z);
}
bool DialougeAddPartyMember(ItemID param_1){
  bool bVar1 = PARTY->AddMember(param_1);
  if (bVar1) {
    bVar1 = true;
    if (dialougemode_pointer->borg13_dat->start_func == 0) {
      dialougemode_pointer->unka8 = 1;
      bVar1 = true;
    }
  }
  else {
    bVar1 = false;
  }
  return bVar1;
}

void FUN_800585d0(u16 param_1){
  if (dialougemode_pointer->borg13_dat->start_func == 0)
    ApplyStimulus(FUN_800591e4(),param_1);
  else ApplyStimulus(FUN_80059ae8(),param_1);
}

void some_debug_func_3(void){
  if (dialougemode_pointer->borg13_dat->start_func == 1)
    debug_sub_3();
}

ItemID set_shopkeep(void){
  playerData *ppVar1;
  
  gGlobals.playerCharStruct.current_shopkeep = (dialougemode_pointer->some_substruct).Entid;
  if (((dialougemode_pointer->func_index == 0) && (dialougemode_pointer->Wanderers != NULL)) &&
     (ppVar1 = dialougemode_pointer->Wanderers->playerDat, ppVar1 != NULL)) {
    gGlobals.playerCharStruct.current_shopkeep = ppVar1->ent_ID;
  }
  return gGlobals.playerCharStruct.current_shopkeep;
}

void init_skill_trainer(void){
  EntityRAM *pEVar1;
  ItemID IVar5;
  byte index;
  CharSkills *sk;
  int iVar2;
  SpellBook *pSVar3;
  SpellInstance *pSVar4;
  ItemID *pIVar7;
  u16 i;
  s16 spellCount;
  u8 uVar9;
  
  IVar5 = set_shopkeep();
  if (IVar5) {
    index = GETINDEX(IVar5);
    pSVar3 = NULL;
    spellCount = 0;
    i = 0;
    pEVar1 = gEntityDB->entities;
    ALLOC(sk,663);
    sk->Init(IVar5);
    for(i=0;i<5;i++){
      if (gEntityDB->entities[index].Spell_levels[i] != -1) spellCount++;
    }
    if (spellCount != 0) {
      ALLOC(pSVar3,674);
      pSVar3->Reset((u8)spellCount);
      pSVar3->count = (u8)spellCount;
      for(i=0,uVar9=0;i<5;i++){
        pIVar7 = &gEntityDB->entities[index].spells[i];
        if (*pIVar7 != -1) {
          ALLOC(pSVar4,682);
          IVar5 = *pIVar7;
          pSVar3->spells[uVar9] = pSVar4;
          TempSpell::Init(pSVar4,IVar5,pEVar1[(char)index].Spell_levels[i]);
          uVar9++;
        }
      }
    }
    set_shopkeep_skills(sk,pSVar3);
  }
}

void shop_func(void){
  ItemID keep = set_shopkeep();
  if (keep) {
    GenericInventory *inv = new GenericInventory();
    shop_ram *puVar4 = NULL;
    u8 i;
    for(i=0;i<gShopDBP->total;i++){
        puVar4 = &gShopDBP->shops[i];
        if (puVar4->shopkeep == keep) break;
        puVar4 = NULL;
      }
    for(i=0;i<20;i++){
      ItemID uVar6 = puVar4->stock[i];
      if ((uVar6) && (puVar4->multi[2][i])) {
        inv->AddItem(uVar6,1);
        Inventory_item *uVar5 = inv->GetItemEntry(inv->GetItemIndex(uVar6));
        f32 price_multis[]={0.5,0.75,1.0,1.25,1.5,2.0,3.0,5.0};
        (uVar5->base).price = (float)(uVar5->base).price * price_multis[puVar4->multi[1][i]];
      }
    }
    for (; i < 23; i++) {
      if (puVar4->stock[i])
        inv->AddItem(puVar4->stock[i],1);
    }
    build_loot_menu(inv,0,keep);
  }
}


void set_some_borg13_flag(void){
  if (borg13_flag == 0) {
    borg13_flag = 1;
    FUN_80058370();
  }
}

void FUN_80058ad4(void){
  Borg7Header *pBVar1;
  
  if (dialougemode_pointer->unkad != 0) {
    dialougemode_pointer->unkad = 0;
    if ((dialougemode_pointer->playerDat != NULL) &&
       (pBVar1 = dialougemode_pointer->playerDat->borg7P, pBVar1 != NULL)) {
      FUN_800583d0(pBVar1->unk1c->b6->dat->aniLength);
    }
  }
}

void FUN_80058b30(u16 delta){
  if (dialougemode_pointer->timerFlag) {
    if (delta < dialougemode_pointer->timer9c) {
      dialougemode_pointer->timer9c-= delta;
    }
    else {
      dialougemode_pointer->timer9c = 0;
      dialougemode_pointer->timerFlag = false;
      dialougemode_pointer->controlLock = 0;
      gGlobals.diaClass->m8004f264();
    }
  }
}

void FUN_80058b88(Gfx **param_1,u16 delta){
  u8 b = dialougemode_pointer->borg13_dat->start_func;
  if (b == 1) {
    handleZoneEngineFrame(param_1,delta,NULL);
    ProcessAudioBubbles(&gGlobals.SFXStruct,&gCamera.pos,delta);
  }
  else if ((1 < b) && (b < 5)) {
    gGlobals.scriptcamera.counter0 = 0;
    gGlobals.scriptcamera.counter1 = 0;
    return;
  }
  FUN_80058ad4();
  FUN_80058b30(delta);
  return;
}


void ApplyStimulus(playerData *param_1,u16 param_2){
  if (param_1) {
    sprintf(gGlobals.text,"ApplyStimulus(%d)\n",param_2);
    N64Print::Print(gGlobals.text);
    param_1->ani_type = param_2;
    dialougemode_pointer->unkac = 1;
    dialougemode_pointer->unkad = 1;
    dialougemode_pointer->playerDat = param_1;
  }
}

void get_dialougemode_funcs(void)

{
  dialougemode_struct *pdVar1;
  
  pdVar1 = dialougemode_pointer;
  dialougemode_pointer->funcs0[0] = FUN_80059888;
  pdVar1->funcs0[1] = FUN_80059b28;
  pdVar1->funcs0[3] = FUN_80059d38;
  pdVar1->funcs0[2] = SetUnkState11;
  pdVar1->funcs0[4] = SetUnkState11;
  pdVar1->funcs1[0] = FUN_800598fc;
  pdVar1->funcs1[3] = NOOP_80059d7c;
  pdVar1->funcs1[1] = FUN_80059b50;
  pdVar1->funcs1[2] = NOOP_80059D08;
  pdVar1->funcs1[4] = NOOP_80059D08;
  pdVar1->funcs2[0] = FUN_80059970;
  pdVar1->funcs2[3] = FUN_80059d84;
  pdVar1->funcs2[1] = FUN_80059bf8;
  pdVar1->funcs3[0] = FUN_800599f0;
  pdVar1->funcs2[2] = FUN_80059d10;
  pdVar1->funcs2[4] = FUN_80059d10;
  pdVar1->funcs3[3] = FUN_80059dac;
  pdVar1->funcs3[1] = FUN_80059c70;
  pdVar1->funcs3[2] = FUN_80059c70;
  pdVar1->funcs3[4] = FUN_80059c70;
  pdVar1->funcs4[2] = FUN_80059628;
  pdVar1->funcs4[4] = FUN_80059628;
  pdVar1->funcs4[0] = DialogueModeInitPrescripted;
  pdVar1->funcs4[1] = DialogueModeInitPrescripted;
  pdVar1->funcs4[3] = DialogueModeInitPrescripted;
  pdVar1->unk0x64[0] = load_one_of_two_cinematics;
  pdVar1->unk0x64[1] = load_one_of_two_cinematics;
  pdVar1->unk0x64[2] = FUN_80059674;
  pdVar1->unk0x64[3] = load_one_of_two_cinematics;
  pdVar1->unk0x64[4] = FUN_80059674;
  return;
}

void NOOP_80058dc8(void){}

void get_some_borg13(u32 param_1){
  borg_13_pointer = get_borg13(param_1);
  if (borg_13_pointer == NULL)
    gGlobals.EncounterDat.EncounterID = 0;
}

bool dialougmode_struct_init(u32 BorgID,u16 RefPointID,u16 MapDatA,u16 MapShortA,u16 MapShortB,u16 param_6){

  ALLOC(dialougemode_pointer,931);
  CLEAR(dialougemode_pointer);
  dialougemode_pointer->unkab = 0;
  dialougemode_pointer->borg13 = BorgID;
  dialougemode_pointer->mapDatA = MapDatA;
  dialougemode_pointer->mapShort1 = MapShortA;
  dialougemode_pointer->mapShort2 = MapShortB;
  dialougemode_pointer->RefPointID = RefPointID;
  dialougemode_pointer->unk90 = 1;
  dialougemode_pointer->borg13_dat = borg_13_pointer->dat;
  dialougemode_pointer->Unk0x7C = param_6;
  ALLOCS(dialougemode_pointer->partySkillLvls,12,946);
  memset(dialougemode_pointer->partySkillLvls,0xff,0xc);
  FUN_800b6c38(&dialougemode_pointer->some_substruct,dialougemode_pointer->RefPointID);
  dialougemode_pointer->func_index = dialougemode_pointer->borg13_dat->start_func;
  get_dialougemode_funcs();
  return true;
}

void clear_borg13_pointer(void){
  if (borg_13_pointer) {
    FREEQB13(borg_13_pointer);
    borg_13_pointer = NULL;
  }
}


void dialougmode_free(void){
  if (dialougemode_pointer) {
    if (dialougemode_pointer->camp_flag)
      World::Lapse8Hours(TerrainPointer);
    FREE(dialougemode_pointer->partySkillLvls,973);
    FREE(dialougemode_pointer,976);
    NOOP_80058dc8();
  }
  return;
}

byte cutScene_control_func(void)

{
  BaseWidget *pBVar1;
  bool bVar2;
  byte bVar3;
  byte delta;
  controller_aidyn *acStack32;
  
  acStack32 = NULL;
  delta = 0;
  do {
    do {
      bVar3 = delta + 1;
      if (!Controller::GetInput(&acStack32,0)) goto LAB_80059174;
      delta = bVar3;
    } while (gGlobals.screenFadeMode != 0);
    if ((acStack32->input & B_BUTTON) != 0) unusedDialougToggle ^= 1;
    #ifdef DEBUGVER
    if (((gDebugFlag != 0) && (dialougemode_pointer->controlLock == 0)) &&
       ((acStack32->input & START_BUTTON) != 0))
      build_camera_debug(dialougemode_pointer->RefPointID);
    #endif
    u32 buttons = acStack32->input_2;
    if ((((buttons & R_BUTTON) != 0) && (buttons != 0)) &&
       (((buttons & (A_BUTTON|Z_BUTTON)) == (A_BUTTON|Z_BUTTON) &&
        ((acStack32->input & B_BUTTON) != 0)))) {
      DialogCallbackC((gGlobals.diaClass)->dialouge_substruct,borg_13_pointer->dat,B13Com_EndDialoug,0);
    }
    N64Print::Toggle(&gGlobals.DebugQueue,acStack32);
  } while (((dialougemode_pointer->controlLock) || (dialougemode_pointer->timerFlag)) ||
          ((gGlobals.scriptcamera.counter1 ||
           (((!WHANDLE->Control((ControllerFull *)acStack32)|| (freeWidgetFunc == NULL)) ||
            ((*freeWidgetFunc)(), dialougemode_pointer->unkab != 2))))));
LAB_80059174:
  DeltaCap(delta);
  return delta;
}


Gfx * FUN_800591a8(Gfx *g,u8 delta,bool param_3){
  if ((gGlobals.screenFadeMode == 0) || (param_3)) {
    g = tick_and_render_widgets(N64Print::Draw(g,(u16)delta));
  }
  return g;
}

playerData * FUN_800591e4(void){
  ItemID x;
  byte bVar2;
  playerData *ppVar1;
  
  x = (dialougemode_pointer->some_substruct).diags[0].ent_ID;
  ppVar1 = NULL;
  if (((u16)x >> 8 == 2) &&
     (bVar2 = GETINDEX(x), ppVar1 = gPlayer,
     bVar2 != EntInd_Alaron)) {
    if (dialougemode_pointer->Wanderers == NULL) ppVar1 = NULL;
    else ppVar1 = dialougemode_pointer->Wanderers->playerDat;
  }
  return ppVar1;
}

void run_dialougemode_funcs4(void){
  if (dialougemode_pointer)
    (*dialougemode_pointer->funcs4[dialougemode_pointer->func_index])();
}

void run_dialougemode_funcs5(void){
  if (dialougemode_pointer)
    (*dialougemode_pointer->unk0x64[dialougemode_pointer->func_index])();
}

void DialogueModeInitPrescripted(void){
  vec3f afStack80;
  
  N64Print::Print("DialogueModeInitPrescripted\n");
  freeWidgetFunc = run_dialougemode_funcs2;
  WanderHead(&gGlobals.wander,8);
  InitZoneEngine(0,0);
  DialogueModeInitPrescripted_set_map
            (dialougemode_pointer->mapDatA,dialougemode_pointer->mapShort1,
             dialougemode_pointer->mapShort2);
  memset(&afStack80,0,0xc);
  Camera::SetPos(gGlobals.gameVars.PlayerHandler.camera,&afStack80);
  afStack80.x += 100.0f;
  Camera::SetAim(gGlobals.gameVars.PlayerHandler.camera,&afStack80);
  gGlobals.diaClass->StartDialoug(dialougemode_pointer->borg13_dat,
             &dialougemode_pointer->some_substruct,dialougemode_pointer->func_index,
             dialougemode_pointer->borg13_dat->libraryType);
  gGlobals.screenFadeMode = 2;
  gGlobals.brightness = 0.0;
  gGlobals.screenFadeSpeed = (1.0/60);
}

void load_one_of_two_cinematics(void){


  DialougFreeActors(&dialougemode_pointer->some_substruct,dialougemode_pointer->borg13_dat);
  Process_queue_B(&gGlobals.QueueB,1);
  FreeZoneEngine(true);
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  FreeWanderHead(&gGlobals.wander);
  gGlobals.diaClass->FreeWidgets();
  if (isCampfireScene(dialougemode_pointer->borg13))
    World::Lapse8Hours(TerrainPointer);
  dialougmode_free();
  clear_borg13_pointer();
  switch (whoDied_short){
    case 1:{
      Cinematic::Load(Cinematic_End,CSwitch_Credits,0);
      DAT_800ee970 = 0xe;
      return;
    }
    case 2:{
      DAT_800ee970 = 0;
      return;
    }
    case 3:{
    if (getEventFlag(3442)) {
      Cinematic::Load(Cinematic_Roog,CSwitch_TrueName,1);
      DAT_800ee970 = 0xe;
      return;
    }
   }
   default:break;
  }
  if ((DAT_800ee970 == 1) && (gGlobals.gameVars.MapFloatDatEntry.mapDatB != -1)) {
    Borg9Header *pBVar2 = loadBorg9(BorgMaps::GetMapList(gGlobals.gameVars.MapFloatDatEntry.mapDatA,gGlobals.gameVars.MapFloatDatEntry.MapShort1
                       ,gGlobals.gameVars.MapFloatDatEntry.MapShort2));
    if ((pBVar2->dat).voxelObjCount != 0) {
      for(s16 i=0;i<(pBVar2->dat).voxelObjCount;i++) {
        voxelObject* obj = &pBVar2->dat.voxelObjs[i];
        if ((((obj->header).type == VOXEL_Dialouge) &&
            (((obj->header).Bitfeild & VOXEL_tangible))) &&
           (dialouge_trigger_check(obj,&gGlobals.gameVars.MapFloatDatEntry.playerVec3,true))) {
          DAT_800ee96c = 1;
          dialoug_func((u32)(obj->dialoug).borg_13,(obj->dialoug).RefPointID,
                       (obj->dialoug).MapDatA,(obj->dialoug).MapShortA,
                       (obj->dialoug).MapShortB,i);
          DAT_800ee96c = 0;
          DAT_800ee970 = 0xc;
          break;
        }
      }
    }
    remove_borg_9(pBVar2);
  }
  return;
}

bool FUN_80059628(void){
  freeWidgetFunc = run_dialougemode_funcs2;
  Borg13Data *pBVar1 = dialougemode_pointer->borg13_dat;
  return gGlobals.diaClass->StartDialoug(pBVar1,&dialougemode_pointer->some_substruct,
                     pBVar1->start_func,pBVar1->libraryType);
}

void FUN_80059674(void){
  gGlobals.diaClass->FreeWidgets();
  dialougmode_free();
  clear_borg13_pointer();
}

void DialogueModeInitPrescripted_set_map(EnumMapDatA mapdatA,u16 short1,u16 short2){
  set_playerdata_zoneDatByte(short1,short2);
  set_SFX_ZoneDatByte(&gGlobals.SFXStruct,short1,short2);
  gGlobals.gameVars.mapDatB = 0xffff;
  gGlobals.gameVars.mapDatC = 0xffff;
  gGlobals.gameVars.mapShort1 = short1;
  gGlobals.gameVars.mapShort2 = short2;
  gGlobals.gameVars.mapDatA = mapdatA;
  BorgMaps::LoadMap(mapdatA,-1,-1,false);
  no_TP_vec3 = 1;
  loadGameBorgScenes(short1,short2);
  BorgMaps::GetMapTerrain(short1,short2);
  gCamera.unk80 = 5;
}

void FUN_80059770(void){
  Wanderer *pwVar1 = dialougemode_pointer->Wanderers;
  if ((pwVar1) && (pwVar1->playerDat)) {
    Borg9Data *pBVar2 = GetCollisionZone(pwVar1->playerDat->zoneDatByte);
    gGlobals.playerCharStruct.unkState = 2;
    gGlobals.EncounterDat.collisionByte = 0;
    gGlobals.EncounterDat.aniByte = 0;
    voxelObject* pmVar3 = &pBVar2->voxelObjs[pwVar1->VoxelIndex];
    battle_setup_func(pmVar3,(pmVar3->header).flagC,pwVar1->VoxelIndex);
  }
}

void FUN_800597f8(void){
  u32 uVar1;
  u16 lVar2;
  
  uVar1 = dialougemode_pointer->unk90;
  lVar2 = 0xffff;
  if (uVar1 == 5) lVar2 = 5;
  else if (uVar1 < 6) {
    if (uVar1 == 2) FUN_80059770();
  }
  else if (uVar1 == 7) lVar2 = 7;
  if (lVar2 != 0xffff) {
    gGlobals.playerCharStruct.unkState = (u8)lVar2;
  }
}

void FUN_80059888(void){
  playerData *ppVar1 = gPlayer;
  (gPlayer)->ani_type = 0;
  Actor::SetFlag(ppVar1,ACTOR_800);
  gGlobals.diaClass->StartDialoug(dialougemode_pointer->borg13_dat,
             &dialougemode_pointer->some_substruct,0,0);
  clear_some_playerHandler_field();
  Camera::SetFeild70(gGlobals.gameVars.PlayerHandler.camera,&(ppVar1->collision).pos);
}

void FUN_800598fc(void){
  playerData *ppVar1;
  playerData *ppVar2;
  
  if (dialougemode_pointer->Wanderers != NULL) {
    WanderSubstruct_setFlag1(dialougemode_pointer->Wanderers);
    ppVar2 = gPlayer;
    ppVar1 = dialougemode_pointer->Wanderers->playerDat;
    Actor::SetFlag(ppVar1,ACTOR_800|ACTOR_40);
    Actor::SetFlag(ppVar2,ACTOR_800);
    ppVar2->ani_type = 0;
    ppVar1->ani_type = 0;
  }
}

void FUN_80059970(BaseWidget *param_1){
  playerData *ppVar1 = gPlayer;
  if (dialougemode_pointer->Wanderers) {
    dialougemode_pointer->Wanderers->playerDat->ani_type = 0;
  }
  ppVar1->ani_type = 0;
  gGlobals.diaClass->m8004ea94(param_1);
  if (((dialougemode_pointer) && (dialougemode_pointer->unkac == 0)) &&
     (ppVar1 = FUN_800591e4(), ppVar1)) {
    ppVar1->ani_type = AniType_4;
  }
  return;
}


void FUN_80059970(BaseWidget *param_1)

{
  playerData *ppVar1 = gPlayer;
  if (dialougemode_pointer->Wanderers)
    dialougemode_pointer->Wanderers->playerDat->ani_type = 0;
  ppVar1->ani_type = 0;
  gGlobals.diaClass->m8004ea94(param_1);
  if (((dialougemode_pointer) && (dialougemode_pointer->unkac == 0)) &&
     (ppVar1 = FUN_800591e4(), ppVar1 != NULL)) {
    ppVar1->ani_type = AniType_4;
  }
  return;
}

void FUN_800599f0(void){
  Wanderer *pwVar1;
  playerData *ppVar2;
  Camera_struct *pCVar3;
  
  gGlobals.diaClass->FreeWidgets();
  pwVar1 = dialougemode_pointer->Wanderers;
  FUN_800597f8();
  pCVar3 = gGlobals.gameVars.PlayerHandler.camera;
  ppVar2 = gPlayer;
  if ((gPlayer != NULL) && (gGlobals.gameVars.PlayerHandler.camera != NULL))
  {
    Camera::SetFeild70(gGlobals.gameVars.PlayerHandler.camera,&((gPlayer)->collision).pos);
    pCVar3->unk80 = 5;
  }
  if (pwVar1) {
    if (!dialougemode_pointer->unka8) {
      Actor::UnsetFlag(dialougemode_pointer->Wanderers->playerDat,ACTOR_800|ACTOR_40);
      FUN_80012d44(dialougemode_pointer->Wanderers);
    }
    else FreeWanderer(&gGlobals.wander,dialougemode_pointer->Wanderers);
  }
  if (ppVar2) {
    Actor::UnsetFlag(ppVar2,ACTOR_800);
    clear_some_playerHandler_field();
    GiveCameraToPlayer(ppVar2);
  }
  dialougmode_free();
  clear_borg13_pointer();
}

playerData * FUN_80059ae8(void){
  ActorAndID* pAVar1 = DialougGetActorAndID(&dialougemode_pointer->some_substruct,borg_13_pointer->dat,
                       (dialougemode_pointer->some_substruct).Entid);
  if (pAVar1 == NULL) return NULL;
  else return pAVar1->actor;
}


void FUN_80059b28(void){
  if (DAT_800ee96c == 0)
    FUN_80024c54(0xb);
}


void FUN_80059b50(void){
  if (dialougemode_pointer->borg13_dat->ActorCount != 0) {
    for(u8 i=0;i<dialougemode_pointer->borg13_dat->ActorCount;i++){
      playerData *ppVar2 = dialougemode_pointer->some_substruct.actors[i].actor;
      if (ppVar2) {
        if (dialougemode_pointer->unkac == 0) ppVar2->ani_type = 0;
        else if (ppVar2 != dialougemode_pointer->playerDat) ppVar2->ani_type = 0;
      }
    }
  }
  if ((gGlobals.scriptcamera.counter1 == 0) && (borg13_flag)) {
    borg13_flag = 0;
    FUN_8005831c();
  }
}


void FUN_80059bf8(BaseWidget *param_1){
  playerData *ppVar1;
  
  if ((((gGlobals.scriptcamera.counter1 == 0) &&
       (gGlobals.diaClass->m8004ea94(param_1), dialougemode_pointer->unkab == 1))
      && (ppVar1 = FUN_80059ae8(), ppVar1 != NULL)) && (dialougemode_pointer->unkac == 0)) {
    ppVar1->ani_type = AniType_4;
  }
}


void FUN_80059c70(void){
  setEventFlag(dialougemode_pointer->borg13_dat->flag,true);
  gGlobals.screenFadeSpeed = (1.0/60);
  dialougemode_pointer->unkab = 2;
  dialougemode_pointer->unka8 = 1;
  gGlobals.screenFadeMode = 1;
  if (dialougemode_pointer->borg13_dat->start_func == 2) {
    gGlobals.screenFadeSpeed = (1.0/30);
  }
}

void SetUnkState11(void){
  gGlobals.playerCharStruct.unkState = 0xb;
}

void NOOP_80059D08(void){}

bool FUN_80059d10(BaseWidget *param_1){
  return gGlobals.diaClass->m8004ea94(param_1);
}


bool FUN_80059d38(void){
  (gPlayer)->ani_type = 0;
  return gGlobals.diaClass->StartDialoug(dialougemode_pointer->borg13_dat,&dialougemode_pointer->some_substruct,3,0);
}

void NOOP_80059d7c(void){}

bool FUN_80059d84(BaseWidget *param_1){
  return gGlobals.diaClass->m8004ea94(param_1);
}

void FUN_80059dac(void){
  gGlobals.diaClass->FreeWidgets();
  dialougmode_free();
  clear_borg13_pointer();
}

bool isDialougeMode(void){
  if (gGlobals.screenFadeModeSwitch == 0xc)
    return true;
  return dialougemode_pointer != NULL;
}
