#include "globals.h"
#include "eventFlag.h"
//sets the event flag of a killed boss. 
void set_boss_flag(){
  for(u8 i=0;i<4;i++) {
    ItemID id = gGlobals.EncounterDat.enemy_entities[i];
    if (!id) continue;
    switch(GETINDEX(id)) {
    case EntInd_Kitarak:
      setEventFlag(FLAG_KilledKitarak,true);
      break;
    case EntInd_Pochanargat:
      setEventFlag(FLAG_KilledPochanargat,true);
      break;
    case EntInd_Ehud:
      setEventFlag(FLAG_KilledShamsuk,true);
      break;
    case EntInd_Ksathra:
      setEventFlag(FLAG_KilledKsathra,true);
      break;
    case EntInd_Shatrevar:
      setEventFlag(FLAG_KilledShatrevar,true);
      break;
    case EntInd_Mehrdad:
      setEventFlag(FLAG_KilledMehrdad,true);
      break;
    case EntInd_Golnar:
      setEventFlag(FLAG_KilledGolnar,true);
      break;
    case EntInd_Nasim:
      setEventFlag(FLAG_KilledNasim,true);
      break;
    case EntInd_Behrooz:
      setEventFlag(FLAG_KilledBehrooz,true);
      break;
    case EntInd_Assim:
      setEventFlag(FLAG_KilledAssim,true);
      break;
    case EntInd_Lugash:
      setEventFlag(FLAG_KilledLugash,true);
      break;
    default:
    break;
    }
  }
}

