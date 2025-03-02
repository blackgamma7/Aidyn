#include "globals.h"
#include "eventFlag.h"
//sets the event flag of a killed boss. 
void set_boss_flag(void){
  ItemID id;
  for(u32 i=0;i<4;i++) {
    id = gGlobals.EncounterDat.enemy_entities[i];
    if (!id) continue;
    switch(GetIDIndex(id)) {
    case 0xa8: //Kitarak
      setEventFlag(FLAG_KilledKitarak,true);
      break;
    case 0xad: //Ehud
      setEventFlag(FLAG_KilledEhud,true);
      break;
    case 0xac: //Shadow
      setEventFlag(0x1ca,true);
      break;
    case 0xaf: //Ksathra
      setEventFlag(FLAG_KilledKsathra,true);
      break;
    case 0xb0: //Shatrevar
      setEventFlag(FLAG_KilledShatrevar,true);
      break;
    case 0xb1: //Mehrdad
      setEventFlag(FLAG_KilledMehrdad,true);
      break;
    case 0xb2: // Golnar
      setEventFlag(FLAG_KilledGolnar,true);
      break;
    case 0xb3: //Nasim
      setEventFlag(FLAG_KilledNasim,true);
      break;
    case 0xb4: //Behrooz
      setEventFlag(FLAG_KilledBehrooz,true);
      break;
    case 0xb5: //Assim
      setEventFlag(FLAG_KilledAssim,true);
      break;
    case 0xba: //Lugash
      setEventFlag(FLAG_KilledLugash,true);
      break;
    default:
    break;
    }
  }
}

