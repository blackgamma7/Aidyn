struct Potion_effect{
    POTION ID;
    byte unk1;
    byte pad[2];
    u32 timer;
    u32 unk2; //might have to do with spell visuals. unused?
}
char** potion_names;
void make_charsheet_potion(Potion_effect *param_1,POTION ID,byte param_3,uint Timer){
  param_1->ID = ID;
  param_1->unk1 = param_3;
  param_1->timer = Timer;
  param_1->unk2 = 0xffff;
}

void func_with_potion_unk2(Potion_effect *param_1){
  if ((param_1->unk2 != 0xffff) && (gGlobals.screenFadeModeSwitch == 2)) {
    func_8009420c(param_1->unk2);}
}


bool check_charsheet_potion_timer(Potion_effect *param_1,uint param_2,int param_3){
  uint uVar1;
  uint uVar2;
  
  uVar1 = param_1->timer;
  if (uVar1 == 0) {return true;}
  uVar2 = param_2 * param_3;
  if ((param_2 == 0) {
    if (uVar1 < 0x259) {param_1->timer = 0;}
    else {param_1->timer-= 600;}
  }
  else {
    if (uVar2 < uVar1) {param_1->timer-= uVar2;}
    else {param_1->timer = 0;}
  }
  return false;
}

void load_potion_romstring(void){potion_names = func_romStrings(RomstringPotion,0x100);}

void clear_potion_romstrings(void){free_romstring(potion_names);}

//there's an identical on of these elsewhere.
void set_2byte_array(byte *x,byte y,byte z){*x = y;x[1] = z;}