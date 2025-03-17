#include "globals.h"
struct StringCheat{
    char* code;
    u32 (*cheat)(void);};

char** cheatStrings_pointer;
u8 Cheats::check_for_cheats(char *param_1){
  s32 iVar6;
  u32 uVar7;
  u8 bVar8;
  StringCheat pcStack168 [14];
  
  bVar8 = 0;
  cheatStrings_pointer = func_romStrings(CheatStrings,0xf0);
  memset(pcStack168,0,8);
  pcStack168[0].code = *cheatStrings_pointer; //!balloon
  pcStack168[0].cheat = _balloon;
  memset(pcStack168 + 1,0,8);
  pcStack168[1].code = cheatStrings_pointer[1]; //!BigW
  pcStack168[1].cheat = _Bigw;
  memset(pcStack168 + 2,0,8);
  pcStack168[2].code = cheatStrings_pointer[2]; //!flea
  pcStack168[2].cheat = _Flea;
  memset(pcStack168 + 3,0,8);
  pcStack168[3].code = cheatStrings_pointer[3]; //!slashing
  pcStack168[3].cheat = _slashing;
  memset(pcStack168 + 4,0,8);
  pcStack168[4].code = cheatStrings_pointer[4]; //!darkside
  pcStack168[4].cheat = _darkside;
  memset(pcStack168 + 5,0,8);
  pcStack168[5].code = cheatStrings_pointer[5]; //!crawdaddy
  pcStack168[5].cheat = _crawdaddy;
  memset(pcStack168 + 6,0,8);
  pcStack168[6].code = cheatStrings_pointer[6]; //!fatboy
  pcStack168[6].cheat = _fatboy;
  memset(pcStack168 + 7,0,8);
  pcStack168[7].code = cheatStrings_pointer[7]; //Tweety
  pcStack168[7].cheat = _tweety;
  memset(pcStack168 + 8,0,8);
  pcStack168[8].code = cheatStrings_pointer[8]; //!cheater
  pcStack168[8].cheat = _Cheater;
  memset(pcStack168 + 9,0,8);
  pcStack168[9].code = cheatStrings_pointer[9]; //!bingo
  pcStack168[9].cheat = _bingo;
  memset(pcStack168 + 10,0,8);
  pcStack168[10].code = cheatStrings_pointer[10]; //imadoofus
  pcStack168[10].cheat = imadoofus;
  memset(pcStack168 + 0xb,0,8);
  pcStack168[11].code = cheatStrings_pointer[0xc]; //keepbusy
  pcStack168[11].cheat = keepbusy;
  memset(pcStack168 + 0xc,0,8);
  pcStack168[12].code = cheatStrings_pointer[0x10]; //!version
  pcStack168[12].cheat = _version;
  memset(pcStack168 + 0xd,0,8);
  //There were 2 more cheat phrases (!gene, !gotmilk) that were unimplimented
  uVar7 = 0;
  if (pcStack168) {
    do {
      if (strcmp(pcStack168[uVar7].code,param_1) == 0) {
        bVar8 = 1;
        if (gGlobals.BigAssMenu) {
          if (pcStack168[uVar7].cheat() == 0) {
            PLAYSFX(BORG12_CheatFail,0,1.0,0xb4,0);
            bVar8 = 1;}
          else {
            PLAYSFX(BORG12_CheatCorrect,0,1.0,0xb4,0);
            bVar8 = 1;}
        }
        break;
      }
      uVar7++;
    } while (pcStack168[uVar7]);
  }
  free_romstring(cheatStrings_pointer);
  return bVar8;
}
u8 Cheats::_balloon(void){ //inflates your head
  _balloon_flag = (u32)(_balloon_flag != 1);
  return true;}

u8 Cheats::_Bigw(void){ //inflates your weapons
  _bigw_flag = (u32)(_bigw_flag != 1);
  return true;}

u8 Cheats::_Flea(void){ //makes you small and jump with A.
  _flea_flag = (u32)(_flea_flag != 1);
  return true;}

u8 Cheats::_slashing(void){ //hockey stick in Gwen castle
  setEventFlag(FLAG_Slashing,true);
  return true;}

u8 Cheats::_darkside(void){ //lightsaber in oriana's hut.
  setEventFlag(FLAG_Darkside,true);
  return true;}


u8 Cheats::fatboy_crawdaddy_tweety(Borg7Enum param_1){ //the 3 transform cheats go here.
  u8 bVar1;
  
  if (gGlobals.playerCharStruct.playerDat == NULL) {bVar1 = false;} //fails if used on title screen.
  else {
    FreePlayerActor(gGlobals.playerCharStruct.playerDat);
    if (gGlobals.playerCharStruct.player_form == param_1) {param_1 = BORG7_Alaron;}
    gGlobals.playerCharStruct.player_form = param_1;
    init_playerActor(gGlobals.playerCharStruct.playerDat,param_1);
    bVar1 = true;
  }
  return bVar1;
}

u8 Cheats::_crawdaddy(void){return fatboy_crawdaddy_tweety(BORG7_ChaosTrooper);}
u8 Cheats::_fatboy(void){return fatboy_crawdaddy_tweety(BORG7_Ogre);}
u8 Cheats::_tweety(void){return fatboy_crawdaddy_tweety(BORG7_Gryphon);}

u8 Cheats::_Cheater(void){ // +750000 EXP to party
  pause_Substruct *ppVar1;
  CharSheet *pCVar2;
  u32 uVar3;
  u32 uVar5;
  
  #ifndef DEBUGVER
  if(getEventFlag(FLAG_cheater))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_cheater,true);
  if ((PARTY)->PartySize) {
    for(uVar5=0;uVar5 < (PARTY)->PartySize;uVar5++) {
      if ((PARTY)->Members[uVar5]) {Entity::AddExp((PARTY)->Members[uVar5],500000);}
    }
  }
  ppVar1 = (gGlobals.BigAssMenu)->base.substruct; //Pause menu update, crashes game if used on title screen
  pCVar2 = (PARTY)->Members[partypicker]; //update stats for char. selected on menu
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->Level_widget),"%u",Entity::GetLevel(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->CurrHP_Widget),"%u",getHPCurrent(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->MaxHP_widget),"%u",getHPMax(pCVar2));
  FUN_80038bdc(ppVar1->dollmenu->unk0x88,partypicker);
  return true;
}

u8 Cheats::_bingo(void){ //+100000 gold
  BaseWidget *pwVar1;
  char *pcVar2;
  #ifndef DEBUGVER
  if(getEventFlag(FLAG_bingo))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_bingo,true);
  //Another menu update, crashing the title screen
  pwVar1 = (((gGlobals.BigAssMenu)->widget).substruct)->dollmenu->charStats_widget->gold_widget;
  (PARTY)->Gold+=100000;
  sprintf(Utilities::GetWidgetText(pwVar1),"%ld",(PARTY)->Gold);
  return true;
}

u8 Cheats::imadoofus(void){
  //asks you to enter "keepbusy"
  another_textbox_func(cheatStrings_pointer[11],200,0x1e,0xff,0xff,0xff,0xff,0x96,1);
  return true;}

u8 Cheats::keepbusy(void){
  //asks you to enter "imadoofus"
  another_textbox_func(cheatStrings_pointer[12],200,0x1e,0xff,0xff,0xff,0xff,0x96,1);
  return true;}

u8 Cheats::_version(void){
  #define VERSIONNAME "02.01d-PRERELEASE"
  #define COMPILEDATE "Feb  1 2001" //there's a few minutes difference
  #define COMPILETIME "23:55:49" //between debug splashscreen's and this one's
  Gsprintf("Aidyn Chronicles\nVersion: "+VERSIONNAME+"\nCompile: %s-%s\nCode: %lu",COMPILEDATE,COMPILETIME);
  another_textbox_func(gGlobals.text,200,0x32,0xff,0xff,0xff,0xff,0x96,1);
  #ifndef DEBUGVER
  version_flag=1; //activates coord print in retail during AppProc()
  #endif
  return true;
}