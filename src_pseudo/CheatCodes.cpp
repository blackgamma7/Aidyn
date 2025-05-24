#include "globals.h"
#include "cheats.h"
#include "romstring.h"
#include "widgets/textPopup.h"

struct StringCheat{
    char* code;
    u8 (*cheat)(void);};

char** cheatStrings_pointer;
u8 Cheats::Check(char *param_1){
  s32 iVar6;
  u32 uVar7;
  u8 bVar8;
  StringCheat pcStack168 [14];
  
  bVar8 = 0;
  cheatStrings_pointer = RomString::Load(CheatStrings,0xf0);
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
    } while (pcStack168[uVar7].code);
  }
  RomString::Free(cheatStrings_pointer);
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


u8 Cheats::fatboy_crawdaddy_tweety(u32 b7){ //the 3 transform cheats go here.
  if (!gGlobals.playerCharStruct.playerDat) return false; //fails if used on title screen.
  Actor::FreePlayerActor(gGlobals.playerCharStruct.playerDat);
  if (gGlobals.playerCharStruct.player_form == b7) b7 = BORG7_Alaron;
  gGlobals.playerCharStruct.player_form = b7;
  Actor::ChangeAppearance(gGlobals.playerCharStruct.playerDat,b7);
  return true;
}

u8 Cheats::_crawdaddy(void){return fatboy_crawdaddy_tweety(BORG7_ChaosTrooper);}
u8 Cheats::_fatboy(void){return fatboy_crawdaddy_tweety(BORG7_Ogre);}
u8 Cheats::_tweety(void){return fatboy_crawdaddy_tweety(BORG7_Gryphon);}

extern u8 gPartyPicker;
u8 Cheats::_Cheater(void){ // +750000 EXP to party
  pause_Substruct *ppVar1;
  CharSheet *pCVar2;
  
  #ifndef DEBUGVER
  if(getEventFlag(FLAG_Cheater))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_Cheater,true);
  if ((PARTY)->PartySize) {
    for(u8 i=0;i < (PARTY)->PartySize;i++) {
      if ((PARTY)->Members[i]) {Entity::AddExp((PARTY)->Members[i],500000);}
    }
  }
  ppVar1 = PauseSub; //Pause menu update, crashes game if used on title screen
  pCVar2 = (PARTY)->Members[gPartyPicker]; //update stats for char. selected on menu
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->LevelText),"%u",Entity::GetLevel(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->CurrHPText),"%u",Entity::getHPCurrent(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->MaxHPText),"%u",Entity::getHPMax(pCVar2));
  ppVar1->dollmenu->lists->m80038bdc(gPartyPicker);
  return true;
}

u8 Cheats::_bingo(void){ //+100000 gold
  BaseWidget *pwVar1;
  char *pcVar2;
  #ifndef DEBUGVER
  if(getEventFlag(FLAG_Bingo))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_Bingo,true);
  //Another menu update, crashing the title screen
  BaseWidget *pwVar1 = PauseSub->dollmenu->charStats_widget->GoldText;
  (PARTY)->Gold+=100000;
  sprintf(Utilities::GetWidgetText(pwVar1),"%ld",(PARTY)->Gold);
  return true;
}

extern BaseWidget *
TextPopup_New(char *txt,u16 x,u16 y,u8 red0,u8 green0,u8 blue0,u8 alpha0,u8 alph1,u32 addToHandler);

u8 Cheats::imadoofus(void){
  //asks you to enter "keepbusy"
  TextPopup_New(cheatStrings_pointer[11],200,0x1e,0xff,0xff,0xff,0xff,0x96,1);
  return true;}

u8 Cheats::keepbusy(void){
  //asks you to enter "imadoofus"
  TextPopup_New(cheatStrings_pointer[12],200,0x1e,0xff,0xff,0xff,0xff,0x96,1);
  return true;}

u8 Cheats::_version(void){
  #ifdef DEBUGVER
  #define VERSIONNAME 02.01d-PRERELEASE
  #define COMPILEDATE "Feb  1 2001" //there's a few minutes difference
  #define COMPILETIME "23:55:49" //between debug splashscreen's and this one's
  #elif VERNA10
  #define VERSIONNAME 02.02a-LOT-CHECK
  #define COMPILEDATE "Feb  2 2001" 
  #define COMPILETIME "06:04:39" 
  #elif VERNA11
  #define VERSIONNAME 02.16a-LOT-CHECK
  #define COMPILEDATE "Feb 16 2001" 
  #define COMPILETIME "16:35:25" 
  #endif
  //dirty hack to show version name
  #define STR(x) #x
  #define STR2(x) STR(x)


  #define FMT "Aidyn Chronicles\nVersion: " STR2(VERSIONNAME) "\nCompile: %s-%s\nCode: %lu"
  Gsprintf(FMT,COMPILEDATE,COMPILETIME,0xffa50/*1MB-boot segment size */);
  TextPopup_New(gGlobals.text,200,0x32,0xff,0xff,0xff,0xff,0x96,1);
  #ifndef DEBUGVER
  version_flag=1; //activates coord print in retail during AppProc()
  #endif
  #undef STR
  #undef STR2
  #undef FMT

  return true;
}