void set_boss_flag(void){
  ItemID id;
  byte index;
  EventFlag flg;
  uint i=0;
  do {
    id = gGlobals.EncounterDat.enemy_entities[i];
    if (id == NULL) goto next;
    index = GetIDIndex(id);
    switch(index) {
    case 0xa8: //Kitarak
      flg = FLAG_KilledKitarak;
      break;
    case 0xad: //Ehud
      flg = FLAG_KilledEhud;
      break;
    case 0xac: //Shadow
      flg = 0x1ca;
      break;
    case 0xaf: //Ksathra
      flg = FLAG_KilledKsathra;
      break;
    case 0xb0: //Shatrevar
      flg = FLAG_KilledShatrevar;
      break;
    case 0xb1: //Mehrdad
      flg = FLAG_KilledMehrdad;
      break;
    case 0xb2: // Golnar
      flg = FLAG_KilledGolnar;
      break;
    case 0xb3: //Nasim
      flg = FLAG_KilledNasim;
      break;
    case 0xb4: //Behrooz
      flg = FLAG_KilledBehrooz;
      break;
    case 0xb5: //Assim
      setEventFlag(FLAG_KilledAssim,true);
      goto next;
    case 0xba: //Lugash
      flg = FLAG_KilledLugash;
      break;
    default:
      goto next;
    }
    setEventFlag(flg,true);
next:
    i++;
    if (3 < i) {return;}
  } while(true);
}

