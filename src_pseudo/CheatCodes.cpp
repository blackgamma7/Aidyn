#include "globals.h"
#include "cheats.h"
#include "romstring.h"
#include "widgets/textPopup.h"

struct StringCheat{
    char* code;
    u8 (*cheat)(void);};

char** cheatStrings_pointer=NULL;
u8 Cheats::Check(char *param_1){
  StringCheat cheatArray [14];
  
  u8 ret = false;
  cheatStrings_pointer = RomString::Load(CheatStrings,0xf0);
  CLEAR(&cheatArray[0]);
  cheatArray[0].code = *cheatStrings_pointer; //!balloon
  cheatArray[0].cheat = _balloon;
  CLEAR(&cheatArray[1]);
  cheatArray[1].code = cheatStrings_pointer[1]; //!BigW
  cheatArray[1].cheat = _Bigw;
  CLEAR(&cheatArray[2]);
  cheatArray[2].code = cheatStrings_pointer[2]; //!flea
  cheatArray[2].cheat = _Flea;
  CLEAR(&cheatArray[3]);
  cheatArray[3].code = cheatStrings_pointer[3]; //!slashing
  cheatArray[3].cheat = _slashing;
  CLEAR(&cheatArray[4]);
  cheatArray[4].code = cheatStrings_pointer[4]; //!darkside
  cheatArray[4].cheat = _darkside;
  CLEAR(&cheatArray[5]);
  cheatArray[5].code = cheatStrings_pointer[5]; //!crawdaddy
  cheatArray[5].cheat = _crawdaddy;
  CLEAR(&cheatArray[6]);
  cheatArray[6].code = cheatStrings_pointer[6]; //!fatboy
  cheatArray[6].cheat = _fatboy;
  CLEAR(&cheatArray[7]);
  cheatArray[7].code = cheatStrings_pointer[7]; //Tweety
  cheatArray[7].cheat = _tweety;
  CLEAR(&cheatArray[8]);
  cheatArray[8].code = cheatStrings_pointer[8]; //!cheater
  cheatArray[8].cheat = _Cheater;
  CLEAR(&cheatArray[9]);
  cheatArray[9].code = cheatStrings_pointer[9]; //!bingo
  cheatArray[9].cheat = _bingo;
  CLEAR(&cheatArray[10]);
  cheatArray[10].code = cheatStrings_pointer[10]; //imadoofus
  cheatArray[10].cheat = imadoofus;
  CLEAR(&cheatArray[11]);
  cheatArray[11].code = cheatStrings_pointer[12]; //keepbusy
  cheatArray[11].cheat = keepbusy;
  CLEAR(&cheatArray[12]);
  cheatArray[12].code = cheatStrings_pointer[16]; //!version
  cheatArray[12].cheat = _version;
  CLEAR(&cheatArray[13]);
  //There were 2 more cheat phrases (!gene, !gotmilk) that were unimplimented
  //there may be another array here that cheatArray gets copied into?
  for(u16 i=0;cheatArray[i].code!=NULL;i++){
    if (strcmp(cheatArray[i].code,param_1) == 0) {
     ret = true;
     if (gGlobals.BigAssMenu) {
       if (cheatArray[i].cheat()) {
        PLAYSFX(BORG12_CheatCorrect,0,1.0,180,0);
        ret = true;}
       else {
        PLAYSFX(BORG12_CheatFail,0,1.0,180,0);
        ret = true;}
        }
        break;
      }
  }
  RomString::Free(cheatStrings_pointer);
  return ret;
}
//inflates your head
u8 Cheats::_balloon(void){ 
  _balloon_flag = (u32)(_balloon_flag != 1);
  return true;}
//inflates your weapons
u8 Cheats::_Bigw(void){ 
  _bigw_flag = (u32)(_bigw_flag != 1);
  return true;}
//Scales down the player's size (and speed). can jump high with A.
u8 Cheats::_Flea(void){ 
  _flea_flag = (u32)(_flea_flag != 1);
  return true;}
//hockey stick in Gwernia castle
u8 Cheats::_slashing(void){ 
  setEventFlag(FLAG_Slashing,true);
  return true;}
//lightsaber in oriana's hut.
u8 Cheats::_darkside(void){ 
  setEventFlag(FLAG_Darkside,true);
  return true;}

//the 3 transform cheats go here.
u8 Cheats::fatboy_crawdaddy_tweety(u32 b7){ 
  if (!gPlayer) return false; //fails if used on title screen.
  Actor::FreePlayerActor(gPlayer);
  if (gGlobals.playerCharStruct.player_form == b7) b7 = BORG7_Alaron;
  gGlobals.playerCharStruct.player_form = b7;
  Actor::ChangeAppearance(gPlayer,b7);
  return true;
}
//Transform into Chaos Trooper
u8 Cheats::_crawdaddy(){return fatboy_crawdaddy_tweety(BORG7_ChaosTrooper);}
//Transform into Ogre
u8 Cheats::_fatboy(){return fatboy_crawdaddy_tweety(BORG7_Ogre);}
//Transform into Gryphon
u8 Cheats::_tweety(){return fatboy_crawdaddy_tweety(BORG7_Gryphon);}
// +750000 EXP to party
u8 Cheats::_Cheater(){ 

  #if !DEBUGVER
  if(getEventFlag(FLAG_Cheater))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_Cheater,true);
  if ((PARTY)->PartySize) {
    for(u8 i=0;i < (PARTY)->PartySize;i++) {
      if ((PARTY)->Members[i]) Entity::AddExp((PARTY)->Members[i],500000);
    }
  }
  pause_Substruct *ppVar1 = PauseSub; //Pause menu update, crashes game if used on title screen
  CharSheet *pCVar2 = (PARTY)->Members[gPartyPicker]; //update stats for char. selected on menu
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->LevelText),"%u",Entity::GetLevel(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->CurrHPText),"%u",Entity::getHPCurrent(pCVar2));
  sprintf(Utilities::GetWidgetText(ppVar1->dollmenu->charStats_widget->MaxHPText),"%u",Entity::getHPMax(pCVar2));
  ppVar1->dollmenu->lists->UpdateMenus(gPartyPicker);
  return true;
}
 //+100000 gold
u8 Cheats::_bingo(void){
  #if !DEBUGVER
  if(getEventFlag(FLAG_Bingo))return false; //no double-dipping in retail
  #endif
  setEventFlag(FLAG_Bingo,true);
  //Another menu update, crashing the title screen
  BaseWidget *pwVar1 = PauseSub->dollmenu->charStats_widget->GoldText;
  (PARTY)->Gold+=100000;
  sprintf(Utilities::GetWidgetText(pwVar1),"%ld",(PARTY)->Gold);
  return true;
}

//asks you to enter "keepbusy"
u8 Cheats::imadoofus(void){
  TextPopup_New(cheatStrings_pointer[11],200,30,COLOR_WHITE,150,true);
  return true;}
//asks you to enter "imadoofus"
u8 Cheats::keepbusy(void){
  TextPopup_New(cheatStrings_pointer[13],200,30,COLOR_WHITE,150,true);
  return true;}

u8 Cheats::_version(void){
  #if DEBUGVER
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
  #endif//TODO: add EU versions
  //dirty hack to show version name
  #define STR(x) #x
  #define STR2(x) STR(x)


  #define FMT "Aidyn Chronicles\nVersion: " STR2(VERSIONNAME) "\nCompile: %s-%s\nCode: %lu"
  Gsprintf(FMT,COMPILEDATE,COMPILETIME,CODESIZE);
  TextPopup_New(gGlobals.text,200,0x32,COLOR_WHITE,0x96,true);
  #if !DEBUGVER
  version_flag=1; //activates coord print in retail during AppProc()
  #endif
  #undef STR
  #undef STR2
  #undef FMT

  return true;
}