#include "globals.h"
#include "combat/CombatStruct.h"
#ifdef DEBUGVER
DebugMapLabel debugMapLabels[]={
    {0,0,0,"Starting Point (I08)"},{0,19,0,"Old Starting Point (E14)"},
    {6,0,0,"Oriana the Hutt"},{0,1,0,"Goblin Stronghold (A04)"},
    {0,2,0,"Lighthouse (A15)"},{0,10,0,"Erromon (C08)"},{0,11,0,"Port Saiid (C15)"},
    {0,5,0,"Desert (P26)"},{0,6,0,"Chaos Isle (F23)"},{0,7,0,"Namers Isle (A22)"},
    {0,17,0,"Castle Doors (M06)"},{0,8,0,"MAP_ELRYN_B22"},{0,6,0,"MAP_ELRYN_D22"},
    {0,29,0,"MAP_ELRYN_F08"},{0,3,0,"MAP_ELRYN_H13"},{0,4,0,"MAP_ELRYN_I09"},
    {0,12,0,"MAP_ELRYN_I18"},{0,27,0,"MAP_ELRYN_L16"},{0,14,0,"MAP_ELRYN_M08"},
    {0,15,0,"MAP_ELRYN_M20"},{0,28,0,"MAP_ELRYN_N27"},{0,13,0,"MAP_ELRYN_Q16"},
    {0,9,0,"MAP_ELRYN_Q21"},{0,26,0,"MAP_ELRYN_R21"},{0,25,0,"MAP_ELRYN_S16"},
    {0,16,0,"MAP_ELRYN_S26"},{0,18,0,"T28 Stage Test"},{0,20,0,"G12 Dryad Forest"},
    {6,1,0,"Yorwood Namers"},{7,0,0,"Erromon Tunnels"},{0,22,0,"Maxxen (F27)"},
    {0,24,0,"Barrows (O25)"},{9,0,0,"Barrows Underground"},{0,23,0,"Ehud's Tower (P17)"},
    {12,0,0,"Ehud Underground"},{13,0,0,"Ugarit OUTER_RING"},{11,0,0,"Talewok - Mageschool"},
    {0}
};
DebugCharChanger debugCharacters[]={
    {BORG7_Alaron,0.5,"Alaron"},{BORG7_Chicken,0.25,"Chicken"},{BORG7_Guard1,0.5,"Guard"},{0}
};

#define  FreeDebugMenu(w) WHANDLE->FreeWidget(w);\
        if (w) \
          w->~WidgetMenu();\
        w = NULL

#define  FreeSmallDebug FreeDebugMenu(gGlobals.playerCharStruct.smallerDebugWindow)
#define DebugBG(w) {\
  WidgetBorg8* BG = WidgetB8(BORG8_DebugBG);\
  w->Link(BG);\
  BG->SetCoords(0,0);\
  BG->SetHeight(SCREEN_HEIGHT);\
  BG->SetWidth(SCREEN_WIDTH);\
}

BaseWidget * SmallerDebugWidgetUpFunc(BaseWidget *param_1,BaseWidget *param_2){
    return ((BaseWidget*)param_2->substruct)->UpFunc();
}

BaseWidget * SmallerDebugWidgetLeftFunc(BaseWidget *param_1,BaseWidget *param_2){
    for(u32 i=4;i>=0;i++){
        ((BaseWidget*)param_2->substruct)->UpFunc();
    }
    return NULL;
}

BaseWidget * SmallerDebugWidgetDownFunc(BaseWidget *param_1,BaseWidget *param_2){
    return ((BaseWidget*)param_2->substruct)->DownFunc();
}


BaseWidget * SmallerDebugWidgetRightFunc(BaseWidget *param_1,BaseWidget *param_2){
    for(u32 i=4;i>=0;i--){
        ((BaseWidget*)param_2->substruct)->DownFunc();
    }
    return NULL;
}

BaseWidget * SmallerDebugWidgetAFunc(BaseWidget *param_1,BaseWidget *param_2){
    return ((BaseWidget*)param_2->substruct)->AFunc();
}

BaseWidget * SmallerDebugWidget_ret_a1(BaseWidget *param_1,BaseWidget *param_2){return param_2;}

u16 gDebugGameTimeSpeeds[]={0,1,2,5,10,15,30,60,120,300,600,900,1800,3600,57600};
u8 gDebugGameTime=1;

BaseWidget * DebugTerrainChangePlus(BaseWidget * param_1,BaseWidget *param_2){
  u8 PVar3;
  WSMSub *iVar1 = *(WSMSub **)(((BaseWidget*)param_2->substruct)->substruct);
  BaseWidget *pBVar1 = iVar1->items[iVar1->highlight]->child;
  float *pfVar4 = NULL;
  if (pBVar1) {
    char **puVar2 = (char **)pBVar1->substruct;
    switch(pBVar1->varU16) {
    case 0:
      TerrainPointer->rainByte++;
      if (TerrainPointer->rainByte > PRECIP_SNOW) PVar3 = PRECIP_CLEAR;
      sprintf(*puVar2,precip_labels[TerrainPointer->rainByte]);
      break;
    case 1:
      pfVar4 = &TerrainPointer->PrecipScale;
      break;
    case 2:
      pfVar4 = &TerrainPointer->FogFloat;
      break;
    case 3:
      pfVar4 = &TerrainPointer->ThunderFloat;
      break;
    case 4:
      gDebugGameTime++;
      if (gDebugGameTime >0xe) gDebugGameTime = 0;
      TerrainPointer->daySpeed = gDebugGameTimeSpeeds[gDebugGameTime];
      sprintf(*puVar2,"%dx",gDebugGameTimeSpeeds[gDebugGameTime]);
      break;
    case 5:
      World::ShiftTimeOfDay(TerrainPointer,1);
      sprintf(*puVar2,"%s",timeofday_labels[TerrainPointer->partOfDay]);
    }
    if (pfVar4) {
      *pfVar4+=.1;
      if (*pfVar4 > 1.0) *pfVar4 = 0.0f;
      sprintf(*puVar2,"%.3f",*pfVar4);
    }
  }
  return NULL;
}

BaseWidget * DebugTerrainChangeMinus(BaseWidget * param_1,BaseWidget *param_2){
  WSMSub *sub = *(WSMSub **)(((BaseWidget*)param_2->substruct)->substruct);
  BaseWidget *pBVar1 = sub->items[sub->highlight]->child;
  float *pfVar4 = NULL;
  if (pBVar1) {
    char **puVar2 = (char **)pBVar1->substruct;
    switch(pBVar1->varU16) {
    case 0:
      if (TerrainPointer->rainByte == PRECIP_CLEAR) TerrainPointer->rainByte = PRECIP_SNOW;
      else TerrainPointer->rainByte--;
      sprintf(*puVar2,precip_labels[TerrainPointer->rainByte]);
      break;
    case 1:
      pfVar4 = &TerrainPointer->PrecipScale;
      break;
    case 2:
      pfVar4 = &TerrainPointer->FogFloat;
      break;
    case 3:
      pfVar4 = &TerrainPointer->ThunderFloat;
      break;
    case 4:
      if (gDebugGameTime == 0) gDebugGameTime = 0xe;
      else gDebugGameTime--;
      TerrainPointer->daySpeed = gDebugGameTimeSpeeds[gDebugGameTime];
      sprintf(*puVar2,"%dx",gDebugGameTimeSpeeds[gDebugGameTime]);
      break;
    case 5:
      World::ShiftTimeOfDay(TerrainPointer,-1);
      sprintf(*puVar2,"%s",timeofday_labels[TerrainPointer->partOfDay]);
    }
    if (pfVar4) {
      *pfVar4-=.1;
      if (*pfVar4 < 1.0) *pfVar4 = 1.0f;
      sprintf(*puVar2,"%.3f",*pfVar4);
    }
  }
  return NULL;
}

void smaller_debug_menu(void){
  gGlobals.playerCharStruct.smallerDebugWindow = new WidgetMenu();
  DebugBG(gGlobals.playerCharStruct.smallerDebugWindow);
  WidgetText* Title = WText("PAUSED");
  Title->SetColor(200,200,100,200);
  Title->SetCoords(130,40);
  gGlobals.playerCharStruct.smallerDebugWindow->Link(Title);
  WidgetScrollMenu* WSM = new WidgetScrollMenu(10);
  gGlobals.playerCharStruct.smallerDebugWindow->Link(WSM);
  WSM->SetCoords(120,65);
  WSM->SetColor(150,150,150,150);
  WSMSub *pvVar1 = (WSMSub *)WSM->substruct;
  pvVar1->reds[0] = 150;
  pvVar1->reds[1] = 250;
  pvVar1->greens[0] = 150;
  pvVar1->greens[1] = 250;
  pvVar1->blues[0] = 150;
  pvVar1->blues[1] = 250;
  pvVar1->alphas[0] = 150;
  pvVar1->alphas[1] = 250;
  pvVar1->blendA = 10;
  WSM->Append(WText("Teleporter"));
  WSM->Append(WText("Actor"));
  WSM->Append(WText("Combat"));
  WSM->Append(WText("Combat Arena Random Test"));
  WSM->Append(WText("Combat Arena Enemy Test"));
  gGlobals.playerCharStruct.smallerDebugWindow->UpButtonFunc = SmallerDebugWidgetUpFunc;
  gGlobals.playerCharStruct.smallerDebugWindow->DownButtonFunc = SmallerDebugWidgetDownFunc;
  gGlobals.playerCharStruct.smallerDebugWindow->AButtonFunc = SmallerDebugWidgetAFunc;
  gGlobals.playerCharStruct.smallerDebugWindow->BButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.smallerDebugWindow->StartButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.smallerDebugWindow->substruct = WSM;
  WHANDLE->AddWidget(gGlobals.playerCharStruct.smallerDebugWindow);
}

void debug_combat_options(BaseWidget *param_1){
  if (param_1->GetNumber() == WidgetN_Text) {
    char** txt = (char **)param_1->substruct;
    if(strcmp(*txt,"Combat")==0){
        FreeSmallDebug;
        gGlobals.playerCharStruct.unkState = 2;
        return;
    }
    if (strcmp(*txt,"Combat Arena Random Test") == 0) {
        FreeSmallDebug;
        random_enemy_generator();
        DebugCombatSelectArena();
        return;
      }
    if (strcmp(*txt,"Combat Arena Enemy Test") == 0) {
        FreeSmallDebug;
        create_enemy_list();
        return;
      }
    if (strcmp(*txt,"Teleporter") == 0) {
        FreeSmallDebug;
        DebugTeleportMenu();
        return;
      }
    if (strcmp(*txt,"Actor") == 0){
        FreeSmallDebug;
        change_actor_menu();
        return;
      }
  }
  else {
    if (param_1 == gGlobals.playerCharStruct.smallerDebugWindow) {
      WHANDLE->StopWidget(param_1);
      gGlobals.playerCharStruct.smallerDebugWindow = NULL;
    }
  }
}
#define DebugMenuInit(w,txt) w=new WidgetMenu();\
DebugBG(w);\
 {\
  WidgetText* title = WText(txt);\
  title->SetColor(200,200,200,200);\
  title->SetCoords(40,50);\
  w->Link(title);\
}


bool create_enemy_list(){
  DebugMenuInit(gGlobals.playerCharStruct.debugMenuEnemy,"ENEMY");
  WidgetScrollMenu* scrollMenu = new WidgetScrollMenu(gEntityDB->total);
  scrollMenu->SetCoords(40,75);
  if (gEntityDB->total != 0) {
    for(s32 i=0;i<gEntityDB->total;i++) {
      EntityRAM *ent = gEntityDB->entities + i;
      if (!EntityCannotFight(ent->ID)) {
        WidgetText* name = WText(ent->Name);
        name->varU16 = ent->ID;
        scrollMenu->Append(name);
      }
    }
  }
  scrollMenu->boundY0 = 0x4b;
  scrollMenu->boundY1 = 200;
  scrollMenu->SetColor(0x96,0x96,0x96,0x96);
  ((WSMSub*)scrollMenu->substruct)->scrollSpeed = 20;
  (gGlobals.playerCharStruct.debugMenuEnemy)->substruct = scrollMenu;
  gGlobals.playerCharStruct.debugMenuEnemy->Link(scrollMenu);
  (gGlobals.playerCharStruct.debugMenuEnemy)->UpButtonFunc = SmallerDebugWidgetUpFunc;
  gGlobals.playerCharStruct.debugMenuEnemy->DownButtonFunc = SmallerDebugWidgetDownFunc;
  gGlobals.playerCharStruct.debugMenuEnemy->LeftButtonFunc = SmallerDebugWidgetLeftFunc;
  gGlobals.playerCharStruct.debugMenuEnemy->RightButtonFunc = SmallerDebugWidgetRightFunc;
  gGlobals.playerCharStruct.debugMenuEnemy->AButtonFunc = SmallerDebugWidgetAFunc;
  gGlobals.playerCharStruct.debugMenuEnemy->BButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.debugMenuEnemy->StartButtonFunc = SmallerDebugWidget_ret_a1;
  return WHANDLE->AddWidget(gGlobals.playerCharStruct.debugMenuEnemy);
}

void DebugSingleEnemyFight(BaseWidget *param_1){
  ulong uVar1;
  int iVar2;
  
  if (param_1 == gGlobals.playerCharStruct.debugMenuEnemy) {
    WHANDLE->FreeWidget(param_1);
    if (gGlobals.playerCharStruct.debugMenuEnemy)
      gGlobals.playerCharStruct.debugMenuEnemy->~WidgetMenu();
    gGlobals.playerCharStruct.debugMenuEnemy = NULL;
    smaller_debug_menu();
  }
  else {
    if (param_1->GetNumber() == WidgetN_Text) {
      gGlobals.EncounterDat.enemy_entities[0] = param_1->varU16;
      for(u8 i=1;i<12;i++){
        gGlobals.EncounterDat.enemy_entities[i] = 0;
      }
      FreeDebugMenu(gGlobals.playerCharStruct.debugMenuEnemy);
      DebugCombatSelectArena();
    }
  }
}

char* arena_name_list[]={
  "FOREST_1","FOREST_2","HILLS_1","HILLS_2","MOUNTAIN_1","MOUNTAIN_2",
  "PLAINS_1","PLAINS_2","ROAD_1","ROAD_2","ROAD_3","ROAD_4","CAVES_1",
  "CAVES_2","DESERT_1","DESERT_2","CHAOS_1","CHAOS_INT_1","BARROW_1",
  "SWAMP_1","SHIP_1","ARENA_1","BATTLEMENTS_1","EHUD_TOWER_1","TILE_INT_1",
  "TILE_INT_2","WOOD_INT_1","COBB_INT_1"
};
bool DebugCombatSelectArena(){
  DebugMenuInit(gGlobals.playerCharStruct.debugMenuArena,"ARENA");
  WidgetScrollMenu* scrollMenu =new WidgetScrollMenu(28);
  scrollMenu->SetCoords(40,75);
  for(u32 i=0;i<28;i++){
    if(arena_name_list[i]){
        WidgetText* txt=WText(arena_name_list[i]);
        txt->varU16=i;
        scrollMenu->Append(txt);
    }
  }
  scrollMenu->boundY0 = 0x4b;
  scrollMenu->boundY1 = 200;
  scrollMenu->SetColor(0x96,0x96,0x96,0x96);
  ((WSMSub*)scrollMenu->substruct)->scrollSpeed = 20;
  (gGlobals.playerCharStruct.debugMenuArena)->substruct = scrollMenu;
  gGlobals.playerCharStruct.debugMenuArena->Link(scrollMenu);
  (gGlobals.playerCharStruct.debugMenuArena)->UpButtonFunc = SmallerDebugWidgetUpFunc;
  gGlobals.playerCharStruct.debugMenuArena->DownButtonFunc = SmallerDebugWidgetDownFunc;
  gGlobals.playerCharStruct.debugMenuArena->AButtonFunc = SmallerDebugWidgetAFunc;
  gGlobals.playerCharStruct.debugMenuArena->BButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.debugMenuArena->StartButtonFunc = SmallerDebugWidget_ret_a1;
  return WHANDLE->AddWidget(gGlobals.playerCharStruct.debugMenuArena);
}

void set_debug_combat_battlefeild(BaseWidget *param_1){
  if (param_1 == gGlobals.playerCharStruct.debugMenuArena) {
    WHANDLE->FreeWidget(param_1);
    if (gGlobals.playerCharStruct.debugMenuArena)
      gGlobals.playerCharStruct.debugMenuArena->~WidgetMenu();
    gGlobals.playerCharStruct.debugMenuArena = NULL;
    smaller_debug_menu();
  }
  else {
    if (param_1->GetNumber() == WidgetN_Text) {
      gGlobals.EncounterDat.battlefield = param_1->varU16;
      gGlobals.EncounterDat.collisionByte = rand_range(1,2);
      gGlobals.EncounterDat.aniByte = 0;
      gGlobals.EncounterDat.EncounterID = 0;
      gGlobals.EncounterDat.canFlee = true;
      gGlobals.combatBytes[2] = true;
      FreeDebugMenu(gGlobals.playerCharStruct.debugMenuArena);
      gGlobals.playerCharStruct.unkState = 2;
    }
  }
}

bool change_actor_menu(void){
  DebugMenuInit(gGlobals.playerCharStruct.debugMenuActor,"ACTOR");
  u32 length;
  for(length=0;debugCharacters[length].label!=NULL;length++){}
  WidgetScrollMenu* scrollMenu=new WidgetScrollMenu(length);
  scrollMenu->SetCoords(40,75);
  for(u32 i=0;debugCharacters[i].label!=NULL;i++){
    WidgetText* txt=WText(debugCharacters[i].label);
    txt->varU16 = i;
    scrollMenu->Append(txt);
  }
  scrollMenu->boundY0 = 75;
  scrollMenu->boundY1 = 200;
  scrollMenu->SetColor(150,150,150,150);
  ((WSMSub*)scrollMenu->substruct)->scrollSpeed = 20;
  scrollMenu->Tick();
  (gGlobals.playerCharStruct.debugMenuActor)->substruct = scrollMenu;
  (gGlobals.playerCharStruct.debugMenuActor)->Link(scrollMenu);
  (gGlobals.playerCharStruct.debugMenuActor)->UpButtonFunc = SmallerDebugWidgetUpFunc;
  gGlobals.playerCharStruct.debugMenuActor->DownButtonFunc = SmallerDebugWidgetDownFunc;
  gGlobals.playerCharStruct.debugMenuActor->LeftButtonFunc = SmallerDebugWidgetLeftFunc;
  gGlobals.playerCharStruct.debugMenuActor->RightButtonFunc = SmallerDebugWidgetRightFunc;
  gGlobals.playerCharStruct.debugMenuActor->AButtonFunc = SmallerDebugWidgetAFunc;
  gGlobals.playerCharStruct.debugMenuActor->BButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.debugMenuActor->StartButtonFunc = SmallerDebugWidget_ret_a1;
  return WHANDLE->AddWidget(gGlobals.playerCharStruct.debugMenuActor);
}


void debug_change_form(BaseWidget *param_1){
  if (param_1 == gGlobals.playerCharStruct.debugMenuActor) {
    FreeDebugMenu(gGlobals.playerCharStruct.debugMenuActor);
    smaller_debug_menu();
  }
  else {
    gGlobals.playerCharStruct.player_form = debugCharacters[param_1->varU16].borg7;
    gGlobals.playerCharStruct.collisionRadius = debugCharacters[param_1->varU16].f;
    FreeDebugMenu(gGlobals.playerCharStruct.debugMenuActor);
    gGlobals.playerCharStruct.unkState = 4;
  }
}


bool DebugTeleportMenu(void){
  DebugMenuInit(gGlobals.playerCharStruct.debugMenuTP,"TELEPORTER");
  u16 length;
  for(length=0;debugMapLabels[length].label!=NULL;length++) {}
  WidgetScrollMenu* scrollMenu  =  new WidgetScrollMenu(length);
  scrollMenu->SetCoords(40,75);
  for(u32 i=0;debugMapLabels[i].label!=NULL;i++){
    WidgetText* txt = WText(debugMapLabels[i].label);
    scrollMenu->Append(txt);
    txt->varU16=i;
  }
  scrollMenu->boundY0 = 75;
  scrollMenu->boundY1 = 200;
  gGlobals.playerCharStruct.debugMenuTP->Link(scrollMenu);
  gGlobals.playerCharStruct.debugMenuTP->UpButtonFunc = SmallerDebugWidgetUpFunc;
  gGlobals.playerCharStruct.debugMenuTP->DownButtonFunc = SmallerDebugWidgetDownFunc;
  gGlobals.playerCharStruct.debugMenuTP->LeftButtonFunc = SmallerDebugWidgetLeftFunc;
  gGlobals.playerCharStruct.debugMenuTP->RightButtonFunc = SmallerDebugWidgetRightFunc;
  gGlobals.playerCharStruct.debugMenuTP->AButtonFunc = SmallerDebugWidgetAFunc;
  gGlobals.playerCharStruct.debugMenuTP->BButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.debugMenuTP->StartButtonFunc = SmallerDebugWidget_ret_a1;
  gGlobals.playerCharStruct.debugMenuTP->substruct = scrollMenu;
  return WHANDLE->AddWidget(gGlobals.playerCharStruct.debugMenuTP);
}


void debug_teleport(BaseWidget *param_1){
  if (param_1 == gGlobals.playerCharStruct.debugMenuTP) {
    FreeDebugMenu(gGlobals.playerCharStruct.debugMenuTP);
    smaller_debug_menu();
  }
  else {
    gGlobals.gameVars.mapDatA = debugMapLabels[param_1->varU16].a;
    gGlobals.gameVars.mapDatB = debugMapLabels[param_1->varU16].b;
    gGlobals.gameVars.mapDatC = debugMapLabels[param_1->varU16].c;
    gGlobals.playerCharStruct.some_sound_var = 0;
    FreeDebugMenu(gGlobals.playerCharStruct.debugMenuTP);
    gGlobals.playerCharStruct.unkState = 4;
  }
}

#endif //none of this script remains in retail version.