void set_boss_flag(void){
  ItemID id;
  byte index;
  Event_flag_offset flg;
  uint i=0;
  do {
    id = gGlobals.EncounterDat.enemy_entities[i];
    if (id == NULL) goto next;
    index = GetIDIndex(id);
    switch(index) {
    case 0xa8: //Kitarak
      flg = 0x9a;
      break;
    case 0xad: //Ehud
      flg = 0xc84;
      break;
    case 0xac: //Shadow
      flg = 0x1ca;
      break;
    case 0xaf: //Ksathra
      flg = 0xe9a;
      break;
    case 0xb0: //Shatrevar
      flg = 0xe99;
      break;
    case 0xb1: //Mehrdad
      flg = 0xe98;
      break;
    case 0xb2: // Golnar
      flg = 0xe97;
      break;
    case 0xb3: //Nasim
      flg = 0xe96;
      break;
    case 0xb4: //Behrooz
      flg = 0xe95;
      break;
    case 0xb5: //Assim
      setEventFlag(0xe9b,true);
      goto next;
    case 0xba: //Lugash
      flg = 0x215;
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

