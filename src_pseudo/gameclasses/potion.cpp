struct Potion_effect{
    u8 ID;
    u8 unk1;
    u8 pad[2];
    u32 timer;
    u32 unk2; //might have to do with spell visuals. unused?
};
char** potion_names;

void make_charsheet_potion(Potion_effect *param_1,u8 ID,u8 param_3,u32 Timer){
  param_1->ID = ID;
  param_1->unk1 = param_3;
  param_1->timer = Timer;
  param_1->unk2 = 0xffff;
}

void func_with_potion_unk2(Potion_effect *param_1){
  if ((param_1->unk2 != 0xffff) && (gGlobals.screenFadeModeSwitch == 2)) {
    FUN_8009420c(param_1->unk2);}
}


u8 check_charsheet_potion_timer(Potion_effect *param_1,u32 param_2,s32 param_3){
  u32 uVar1;
  u32 uVar2;
  
  uVar1 = param_1->timer;
  if (uVar1 == 0) return true;
  uVar2 = param_2 * param_3;
  if ((param_2 == 0) {
    if (uVar1 =< 600) param_1->timer = 0;
    else param_1->timer-= 600;
  }
  else {
    if (uVar2 < uVar1) param_1->timer-= uVar2;
    else param_1->timer = 0;
  }
  return false;
}

void load_potion_romstring(void){potion_names = func_romStrings(RomstringPotion,0x100);}

void clear_potion_romstrings(void){free_romstring(potion_names);}

//there's an identical one of these elsewhere.
void set_2byte_array(u8 *x,u8 y,u8 z){*x = y;x[1] = z;}