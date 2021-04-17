void set_boss_flag(void){
  ItemID id;
  byte index;
  Event_flag_offset flg;
  uint i=0;
  do {
    id = gGlobals.EncounterDat.enemy_entities[i];
    if (id == null) goto next;
    index = GetIDIndex(id);
    switch(index) {
    case 0xa8:
      flg = 0x9a;
      break;
    case 0xad:
      flg = 0xc84;
      break;
    case 0xac:
      flg = 0x1ca;
      break;
    case 0xaf:
      flg = 0xe9a;
      break;
    case 0xb0:
      flg = 0xe99;
      break;
    case 0xb1:
      flg = 0xe98;
      break;
    case 0xb2:
      flg = 0xe97;
      break;
    case 0xb3:
      flg = 0xe96;
      break;
    case 0xb4:
      flg = 0xe95;
      break;
    case 0xb5:
      setEventFlag(0xe9b,true);
      goto next;
    case 0xba:
      flg = 0x215;
      break;
    default:
      goto next;
    }
    setEventFlag(flg,true);
next:
    i++;
    if (3 < i) {
      return;
    }
  } while(true);
}

