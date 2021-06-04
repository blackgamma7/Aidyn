
struct CombatEntity {
    Vec2 coord;
    Vec2 coord2;
    uint unk0x10;
    s8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    Vec2 unk0x18;
    byte index;
    byte move_length;
    u8 unk0x22;
    byte unk0x23;
    byte unk0x24;
    byte rangeMulti;
    byte unk0x26;
    enum PotionEnum item;
    byte unk0x28;
    byte damage;
    byte unk0x2a;
    u8 unk0x2b;
    enum Struct_char_flags flags;
    u8 unk0x2e;
    u8 unk0x2f;
    struct resist_float resists[2];
    struct CharSheet * CharSheet;
    struct combat_ai * combat_ai_pointer;
    float E[3];
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
    u8 unk0x6c;
    u8 unk0x6d;
    u8 unk0x6e;
    u8 unk0x6f;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    u8 unk0x74;
    u8 unk0x75;
    u8 unk0x76;
    u8 unk0x77;
    u8 unk0x78;
    u8 unk0x79;
    u8 unk0x7a;
    u8 unk0x7b;
    u8 unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    undefined4 notboss;
    byte unk0x88;
    byte unk0x89;
    byte throwingFlag;
    u8 unk0x8b;
};


void Ofunc_NOOP_80067c70(void){}
void Ofunc_NOOP_(void){}

void combatentity_init(CombatEntity *param_1,CharSheet *charsheet,int param_3,uint startx,
                      byte starty,s8 param_6,byte param_7,int isAI,byte index){
  ItemID IVar1;
  spellbook *psVar2;
  Entity_Ram *pEVar3;
  byte bVar7;
  bool bVar8;
  char X;
  char Y;
  ElementEnum *pEVar4;
  combat_ai *pcVar5;
  int iVar6;
  float *pfVar9;
  uint uVar10;
  uint uVar11;
  resist_float *prVar12;
  float *pfVar13;
  float fVar14;
  
  memset(param_1,0,0x8c);
  IVar1 = charsheet->ID;
  param_1->CharSheet = charsheet;
  bVar7 = GetIDIndex(IVar1);
  param_1->coord2[0] = (float)startx;
  param_1->coord[0] = (float)startx;
  param_1->coord2[1] = (float)starty;
  param_1->coord[1] = (float)starty;
  param_1->unk0x14 = param_6;
  param_1->unk0x23 = param_7;
  set_combatEnt_vec2(param_1,param_6);
  param_1->notboss = (int)isNotBoss(charsheet->ID);
  X = get_combatEnt_x(param_1);
  Y = get_combatEnt_y(param_1);
  func_800713fc(&combatPointer->substruct,X,Y,(uint)param_1->unk0x23);
  psVar2 = charsheet->spellbook;
  if (((psVar2 != (spellbook *)0x0) && (psVar2->spells != (Temp_spell *)0x0)) &&
     (psVar2->spell_count != 0)) {
    if (*(int *)psVar2->spells == 0) {
      psVar2 = charsheet->spellbook;
      uVar11 = 0;
      while (uVar10 = uVar11 + 1, uVar10 < psVar2->spell_count) {
        if ((&psVar2->spells->name)[uVar11] != (char *)0x0) {
          param_1->CharSheet->spellSwitch = 1;
          param_1->CharSheet->currSpell = (byte)uVar10;
          break;
        }
        uVar11 = uVar10;
        psVar2 = charsheet->spellbook;
      }
    }
    else {
      param_1->CharSheet->spellSwitch = 1;
      param_1->CharSheet->currSpell = 0;
    }
  }
  pfVar13 = &param_1->resists[0].percent;
  uVar11 = 0;
  prVar12 = param_1->resists;
  pEVar3 = EntityPointer->entities;
  pfVar9 = pEVar3[(char)bVar7].resistAmmount;
  do { //copy charsheet element resitances
    pEVar4 = pEVar3[(char)bVar7].Resist + uVar11;
    uVar11++;
    prVar12->element = *pEVar4;
    fVar14 = *pfVar9;
    pfVar9++;
    prVar12++;
    *pfVar13 = fVar14;
    pfVar13+=2;
  } while (uVar11 < 2);
  param_1->flags = flag2;
  if (isAI) {param_1->flags = flag2|flag5|flag6;}
  param_1->index = index;
  if (isAI) {
    pcVar5 = (combat_ai *)Malloc(0x1c,FILENAME,0xcc);
    IVar1 = param_1->CharSheet->ID;
    param_1->combat_ai_pointer = pcVar5;
    combat_aiinfo_func(pcVar5,IVar1,param_1);
  }
  param_1->unk0x89 = 2;
  param_1->unk0x10 = 0xffffffff;
                    /* check for Shadow */
  if (((ItemID)(entityList[172] + 0x200) == param_1->CharSheet->ID) &&(HasHornOfKynon())) {
    iVar6 = getBaseStat(param_1->CharSheet->Stats,DEX);
    if (0 < 30 - iVar6) {addBaseStat(param_1->CharSheet->Stats,DEX,30 - iVar6);}
  }
  return;
}


void combatEntity_free(CombatEntity *param_1){
  if (param_1->combat_ai_pointer != NULL) {
    combataiInfo_free(param_1->combat_ai_pointer);
    Free(param_1->combat_ai_pointer,FILENAME,0xf0);
    param_1->combat_ai_pointer = NULL;
  }
}

void get_combatEnt_x_y(CombatEntity *param_1,s8 *x,s8 *y){
  *x = get_combatEnt_x(param_1);
  *y = get_combatEnt_y(param_1);}

void ofunc_getcombatent_z_f3(CombatEntity *param_1,s8 *z,s8 *f3){
  *z = get_combatEnt_z(param_1);
  *f3 = get_combatEnt_f3(param_1);}

void Ofunc_get_combatEnt_x_y_f(CombatEntity *param_1,float *x,float *y){
  *x = param_1->coord[0];
  *y = param_1->coord[1];}

void Ofunc_get_combatEnt_z_f3_f(CombatEntity *param_1,float *param_2,float *param_3){
  *param_2 = param_1->coord2[0];
  *param_3 = param_1->coord2[1];
}

char get_combatEnt_x(CombatEntity *param_1){
  double dVar1;
  
  dVar1 = (double)param_1->coord[0];
  if (param_1->coord[0] <= 0.0) {return -(char)(int)(0.5d - dVar1);}
  return (char)(int)(dVar1 + 0.5d);
}


char get_combatEnt_y(CombatEntity *param_1){
  double dVar1;
  
  dVar1 = (double)param_1->coord[1];
  if (param_1->coord[1] <= 0.0) {return -(int)(0.5d - dVar1) & 0xff;}
  return (char)(int)(dVar1 + 0.5d) & 0xff;
}

uint get_combatEnt_z(CombatEntity *param_1){
  double dVar1;
  
  dVar1 = (double)param_1->coord2[0];
  if (param_1->coord2[0] <= 0.0) {return -(int)(0.5d - dVar1) & 0xff;}
  return (int)(dVar1 + 0.5d) & 0xff;
}

uint get_combatEnt_f3(CombatEntity *param_1){
  double dVar1;
  
  dVar1 = (double)param_1->coord2[1];
  if (param_1->coord2[1] <= 0.0) {return -(int)(0.5d - dVar1) & 0xff;}
  return (int)(dVar1 + 0.5d) & 0xff;
}


float get_combatEnt_x_f(CombatEntity *param_1){return param_1->coord[0];}
float get_combatEnt_y_f(CombatEntity *param_1){return param_1->coord[1];}
float get_combatEnt_z_f(CombatEntity *param_1){return param_1->coord2[0];}
float get_combatEnt_f3_f(CombatEntity *param_1){return param_1->coord2[1];}

void set_combatEnt_x_y(CombatEntity *param_1,float x,float y){
  param_1->coord[0] = x;
  param_1->coord[1] = y;}

void set_combatEnt_z_f3(CombatEntity *param_1,float x,float y){
  param_1->coord2[0] = x;
  param_1->coord2[1] = y;}


/* Used for Casting Magic */
bool CombatEnt_flag_0(CombatEntity *param_1){return (bool)((byte)param_1->flags & 1);}
//the rest, mostly no clue
ushort CombatEnt_flag_1(CombatEntity *param_1){return param_1->flags >> 1 & 1;}
ushort CombatEnt_flag_2(CombatEntity *param_1){return param_1->flags >> 2 & 1;}
ushort CombatEnt_flag_3(CombatEntity *param_1){return param_1->flags >> 3 & 1;}
//this one is friend-or-foe, i think
ushort CombatEnt_flag_4(CombatEntity *param_1){return param_1->flags >> 4 & 1;}
ushort CombatEnt_flag_5(CombatEntity *param_1){return param_1->flags >> 5 & 1;}
ushort CombatEnt_flag_6(CombatEntity *param_1){return param_1->flags >> 6 & 1;}
ushort CombatEnt_flag_7(CombatEntity *param_1){return param_1->flags >> 7 & 1;}

bool CombatEnt_flag_check(CombatEntity *param_1){return (param_1->flags & (flag9|flag10)) !=0;}
void CombatEnt_OR_flags(CombatEntity *x,Struct_char_flags f){x->flags |= f;}
void CombatEnt_NAND_flags(CombatEntity *x,Struct_char_flags f){x->flags = x->flags& ~f;}
void CombatEnt_XOR_flags(CombatEntity *x,Struct_char_flags f){x->flags ^= f;}

int Ofunc_combatEnt_movement(CombatEntity *x){
  short sVar2;
  uint uVar1;
  
  sVar2 = sub_square_add_sqrt(get_combatEnt_x(x),get_combatEnt_y(x),get_combatEnt_z(x),get_combatEnt_f3(x));
  if (x->move_length - sVar2)) < 1) {uVar1 = 0;}
  else {
    sVar2 = sub_square_add_sqrt(get_combatEnt_x(x),get_combatEnt_y(x),get_combatEnt_z(x),get_combatEnt_f3(x));
    uVar1 = x->move_length - sVar2 & 0xff;
  }
  return uVar1;}

void NOOP_80068350(void){}


bool func_80068358(CombatEntity *param_1){
  CombatEntity *pCVar1;
  uint uVar5;
  
  uVar5 = 0;
  if (combatPointer->EntCount != 0) {
    do {
      pCVar1 = (&combatPointer->combatEnts)[uVar5];
      if ((((pCVar1 != NULL) && (param_1 != pCVar1)) &&
          (!isDead(pCVar1->CharSheet))) && (CombatEnt_flag_1(pCVar1))) {
        if ((CombatEnt_flag_4(pCVar1) != CombatEnt_flag_4(param_1))
         && (func_800692bc(param_1,pCVar1))) {return false;}
      }
      uVar5++;
    } while (uVar5 < combatPointer->EntCount);
  }
  return true;
}

void set_combat_movement(CombatEntity *param_1){
  Temp_enchant *pTVar1;
  int iVar3;
  byte bVar4;
  bool bVar5;
  longlong lVar2;
  effects *peVar6;
  uint uVar7;
  byte DEX_steps[16]{0,0,0,3,7,12,16,21,26,28,30,33,36,38,0,0};


  NOOP_80068350();
  param_1->move_length = 0;
  while (param_1->move_length < 0xe) {
    iVar3 = getModdedStat(param_1->CharSheet->Stats,DEX);
    if (iVar3 <= (int)(uint)DEX_steps[param_1->move_length]) break;
    param_1->move_length++;
  }
  uVar7 = 0;
  peVar6 = param_1->CharSheet->effects;
  do {
    pTVar1 = peVar6->list[uVar7];
    if (pTVar1 != (Temp_enchant *)0x0) {
      if (pTVar1->index == stellarGravity) {
        bVar4 = param_1->move_length - pTVar1->lv;
        if (pTVar1->lv < param_1->move_length) {
LAB_80068514:
          param_1->move_length = bVar4;
        }
        else {param_1->move_length = 1;}
      }
      else {
        if (pTVar1->index == haste) {
          bVar4 = param_1->move_length + pTVar1->lv;
          goto LAB_80068514;
        }
      }
    }
    uVar7++;
    if (0xe < uVar7) {
      CombatEnt_NAND_flags(param_1,flag8);
      bVar5 = func_80068358(param_1);
      if (bVar5 == false) {
        CombatEnt_OR_flags(param_1,flag8);
        bVar4 = param_1->move_length;
        if (1 < bVar4) {bVar4 = 1;}
        param_1->move_length = bVar4;
        lVar2 = CombatEnt_flag_2(param_1);
        if (lVar2 == 0) {bVar4 = param_1->move_length;}
        else {
          func_8006f2cc(param_1);
          bVar4 = param_1->move_length;
        }
      }
      else {
        lVar2 = CombatEnt_flag_2(param_1);
        if (lVar2 == 0) {
          if (some_shadow_func(param_1)) {
            if ((param_1 == combatPointer->current_Ent) && (param_1->index != gGlobals.ShadowIndex)){
              sprintf(gGlobals.text,combatPointer->textArray->shadows vortex,param_1->CharSheet->name);
              copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
              print_combat_textbox(combatPointer,gGlobals.text,0);
            }
            param_1->move_length = 1;
          }
        }
        else {
          bVar4 = param_1->move_length;
          if (1 < bVar4) {bVar4 = 1;}
          param_1->move_length = bVar4;
        }
        bVar4 = param_1->move_length;
      }
      if (0xd < bVar4) {
        param_1->move_length = 0xd;
      }
                    /* pocho no move */
      if (param_1->CharSheet->ID == (ItemID)(entityList[171] + 0x200)) {
        param_1->move_length = 0;
      }
      return;
    }
    peVar6 = param_1->CharSheet->effects;
  } while( true );
}

byte check_combatent_dex(CombatEntity *param_1){
  int iVar1;
  s8 cVar3;
  byte bVar4;
  
  iVar1 = combatPointer->unk0x34;
  NOOP_80068350();
  cVar3 = getBaseStat(param_1->CharSheet->Stats,DEX);
  bVar4 = 0;
  if ((0 < cVar3) && (bVar4 = 1, 18 < cVar3)) {
    if (cVar3 < 25) {
      bVar4 = 1;
      if (iVar1 != 0) {bVar4 = 2;}
    }
    else {
      bVar4 = 2;
      if (((30 < cVar3) && (bVar4 = 3, cVar3 < 35)) && (bVar4 = 2, iVar1 != 0)) {
        bVar4 = 3;
      }
    }
  }
  return bVar4;
}

uint get_combatEnt_protection(CombatEntity *param_1){
  CharSheet *pCVar1;
  int iVar3;
  uint uVar4;
  uint uVar6;
  uint uVar7;
  int iVar8;
  Potion_effect *pcVar2;
  temp_armor *iVar2;
  
  uVar7 = 0;
  iVar8 = 0;
  uVar6 = 0;
  pCVar1 = param_1->CharSheet;
  iVar3 = 0;
  do {
    pcVar2 = pCVar1->potion_effects[uVar6];
    if (pcVar2 != (Potion_effect *)0x0) {
      if (pcVar2->ID == ACID) {uVar7+= pcVar2->unk1;}
      if (pcVar2->ID == DEFENCE) {iVar8 = 0xf;}
    }
    uVar6++;
  } while (uVar6 < 7);
  iVar2 = *(temp_armor **)pCVar1->armor;
  uVar6 = 0;
  if (iVar2 != (temp_armor *)0x0) {
    uVar6 = (uint)iVar2->Protect;
  }
  uVar4 = warrior_dividing(getModdedSkill(pCVar1->Skills,Warrior),5,false,0,0);
  if ((int)(((param_1->CharSheet->EXP->protection + uVar6) - uVar7) + uVar4 + iVar8) < 1) {uVar6 = 0;}
  else {
    uVar4 = warrior_dividing(getModdedSkill(param_1->CharSheet->Skills,Warrior),5,false,0,0);
    uVar6 = uVar4 + ((uVar6 + param_1->CharSheet->EXP->protection) - uVar7) + iVar8 & 0xff;
  }
  return uVar6;
}


char get_sheild_warrior_skill(CombatEntity *param_1){
  temp_armor *ptVar1;

  byte bVar4;
  
  ptVar1 = param_1->CharSheet->armor[1];
  bVar4 = 0;
  if (ptVar1 != NULL) {bVar4 = ptVar1->DEF;}
  return getModdedSkill(param_1->CharSheet->Skills,Warrior) + bVar4 * getModdedSheild(param_1->CharSheet->Skills);
}

uint get_protection_level(CombatEntity *param_1,bool backStab){
  uint uVar1;
  temp_armor *pcVar1 = param_1->CharSheet->armor[1];
  uVar1 = get_combatEnt_protection(param_1);
  if ((pcVar1 != NULL) && (!backStab)) {uVar1 += pcVar1->Protect;}
  return uVar1;
}

void combatEnt_coords2_is_coords(CombatEntity *param_1){
  param_1->coord2[0] = param_1->coord[0];
  param_1->coord2[1] = param_1->coord[1];}

void func_80068924(CombatEntity *param_1){
  playerData *ppVar1;
  CombatStruct *pCVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  Vec2 fStack144;
  Vec2 fStack80;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1 != NULL) {
    setVec2((Vec2 *)fStack144,param_1->coord[0],param_1->coord[1]);
    func_80070234(param_1);
    pCVar2 = combatPointer;
    combatPointer->floatA = param_1->coord[0];
    pCVar2->floatB = param_1->coord[1];
    copyVec2((Vec2 *)param_1->unk0x18,(Vec2 *)fStack80);
    fVar3 = ppVar1->facing[0];
    param_1->unk0x18[0] = -fVar3;
    fVar4 = param_1->coord[0];
    fVar5 = ppVar1->facing[1];
    param_1->unk0x18[1] = -fVar5;
    if ((((fStack144[0] != fVar4) || (fStack144[1] != param_1->coord[1])) || (fStack80[0] != -fVar3)) || (fStack80[1] != -fVar5)) {
      if (param_1->unk0x22 < 3) {param_1->unk0x22++;}
      else {CombatEnt_OR_flags(param_1,flag4);}
      func_80072454(combatPointer->substruct2,param_1);
      func_80072454(combatPointer->substruct2 + 1,param_1);
    }
  }
  return;
}

void set_combatEnt_vec2(CombatEntity *param_1,s8 param_2){
  s8 uStack72 [8][2]={
      {0,-1},{1,-1},{1,0},{1,1},
      {0,1},{-1,1},{-1,0},{-1,-1}};

  setVec2((Vec2 *)param_1->unk0x18,(float)uStack72[param_2][0],(float)uStack72[param_2][1]);
  vec2_normalize((Vec2 *)param_1->unk0x18);
}

bool func_80068b0c(CombatEntity *param_1,uint param_2,uint param_3){
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar1 = param_1->unk0x18[0];
  fVar2 = param_1->unk0x18[1];
  param_1->unk0x18[0] = (float)(param_2 & 0xff) - param_1->coord[0];
  param_1->unk0x18[1] = (float)(param_3 & 0xff) - param_1->coord[1];
  vec2_normalize((Vec2 *)param_1->unk0x18);
  fVar1 = param_1->unk0x18[0] - fVar1;
  if (fVar1 <= 0.0) {fVar1 = -fVar1;}
  if ((double)fVar1 <= 1.0E-4d) {
    fVar2 = param_1->unk0x18[1] - fVar2;
    if (fVar2 <= 0.0) {fVar2 = -fVar2;}
    if ((double)fVar2 <= 1.0E-4d) {
      return false;
    }
  }
  return true;
}

bool check_combatents_facings(CombatEntity *param_1,float param_2,float param_3){
  bool bVar1;
  float fVar2;
  float fVar3;
  Vec2 afStack160;
  Vec2 afStack96;
  
  setVec2((Vec2 *)afStack160,param_1->coord[0],param_1->coord[1]);
  setVec2((Vec2 *)afStack96,param_2,param_3);
  fVar2 = get_vec2_proximity((Vec2 *)afStack160,(Vec2 *)afStack96);
  bVar1 = true;
  if (fVar2 != 0.0) {
    fVar3 = param_1->unk0x18[0] * fVar2 + param_1->coord[0];
    fVar2 = param_1->unk0x18[1] * fVar2 + param_1->coord[1];
    if (param_2 - 0.5f <= fVar3) {
      if (param_2 + 0.5f < fVar3) {return false;}
      if (fVar2 < param_3 - 0.5f) {return false;}
      if (fVar2 <= param_3 + 0.5f) {return true;}
    }
    bVar1 = false;
  }
  return bVar1;
}

bool check_for_backstab(CombatEntity *param_1,CombatEntity *param_2){
  bool bVar1;
  int iVar2;
  double dVar3;
  float fVar4;
  
  
  if (!check_combatents_facings(param_1,param_2->coord[0],param_2->coord[1])) {bVar1 = false;}
  else {
    fVar4 = (param_1->unk0x18[0] * param_2->unk0x18[0] +
            param_1->unk0x18[1] * param_2->unk0x18[1]) * 1000000.0f;
    dVar3 = (double)fVar4;
    if (0.0 < fVar4) {iVar2 = (int)(dVar3 + 0.5d);}
    else {iVar2 = -(int)(0.5d - dVar3);}
    bVar1 = true;
    if ((float)iVar2 / 1000000.0f < cos_pi_over_4) {bVar1 = false;}
  }
  return bVar1;
}


void func_80068dd8(CombatEntity *param_1){
  playerData *ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1 != NULL) {
    enemy_proximity_check(ppVar1,param_1->coord[0] + ppVar1->scale_floatB,
      param_1->coord[1] + ppVar1->scale_floatB,ppVar1->scale_floatB,0);
  }
}

void func_80068e38(CombatEntity *param_1){
  if (gGlobals.playerDataArray[param_1->index] != NULL) {
    if ((param_1->unk0x18[0] != 0.0) || (param_1->unk0x18[1] != 0.0)) {
      playerdata_set_facing
                (gGlobals.playerDataArray[param_1->index],-param_1->unk0x18[0],
                 -param_1->unk0x18[1]);
    }
    gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
    gGlobals.combatBytes[0] = 6;
  }
  return;
}

void adjust_combatent_facing(CombatEntity *param_1,CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  float fVar3;
  
  gGlobals.combatBytes[0] = 6;
  gGlobals.combatBytes[1] = 6;
  if (param_2 != param_1) {
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    if ((ppVar1 != NULL) && (ppVar2 != NULL)) {
      param_1->unk0x18[0] = (ppVar2->collision).position[0] - (ppVar1->collision).position[0];
      param_1->unk0x18[1] = (ppVar2->collision).position[2] - (ppVar1->collision).position[2];
      vec2_normalize((Vec2 *)param_1->unk0x18);
      fVar3 = param_1->unk0x18[1];
      if (param_1->unk0x18[0] == 0.0) {
        if (fVar3 == 0.0) {return;}
        fVar3 = param_1->unk0x18[1];
      }
      playerdata_set_facing(ppVar1,-param_1->unk0x18[0],-fVar3);
    }
  }
  return;
}

void teleport_spell_sub(CombatEntity *param_1){
  playerData *ppVar1;
  float fVar2;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1 != NULL) {
    fVar2 = ppVar1->scale_floatB;
    (ppVar1->collision).position[0] = param_1->coord[0] + fVar2;
    (ppVar1->collision).position[2] = param_1->coord[1] + fVar2;
    func_800154e4(ppVar1,0,0,0);
  }
}

void func_80069004(CombatEntity *param_1){
  playerData *ppVar1;
  
  if (((param_1->unk0x18[0] != 0.0) || (param_1->unk0x18[1] != 0.0)) &&
     (ppVar1 = gGlobals.playerDataArray[param_1->index], ppVar1 != NULL)) {
    ppVar1->facing[0] = -param_1->unk0x18[0];
    ppVar1->facing[1] = -param_1->unk0x18[1];
    vec2_normalize((Vec2 *)ppVar1->facing);
  }
  return;
}


byte get_weapon_animation(CombatEntity *param_1,byte param_2){
  byte (*pabVar1) [2];
  byte uStack64 [7] [2]={{0,16},{1,17},{2,13},{3,12},{4,15},{5,14},{0xff,0xff}};
  
  pabVar1 = uStack64;

  while( true ) {
    if (uStack64[0][0] == 0xff) {return 18;}
    if (*(byte *)pabVar1 == param_2) break;
    pabVar1 = (byte (*) [2])((int)pabVar1 + 2);
    uStack64[0][0] = *(byte *)pabVar1;
  }
  return *(byte *)((int)pabVar1 + 1);
}


uint func_80069114(CombatEntity *param_1){
  Temp_weapon *pTVar1;
  uint uVar2;
  
  if (param_1->rangeMulti == 3) {uVar2 = 400;}
  else {
    uVar2 = 0;
    if (param_1->rangeMulti != 1) {
      if (param_1->CharSheet == NULL) {uVar2 = 0;}
      else {
        pTVar1 = param_1->CharSheet->weapons;
        if (pTVar1 == NULL) {
          get_weapon_sheild_borg5(param_1);
          uVar2 = 0;
        }
        else {uVar2 = (uint)pTVar1->range;}
      }
    }
  }
  return uVar2;
}


uint Ofunc_8006916c(CombatEntity *param_1,uint param_2,uint param_3){
  s8 sVar1;
  char cVar4;
  int iVar2;
  uint uVar3;
  uint uVar5;
  uint uVar6;
  
  uVar6 = (int)((get_combatEnt_x(param_1) - (param_2 & 0xff)) * 0x1000000) >> 0x18;
  uVar5 = (int)((get_combatEnt_y(param_1) - (param_3 & 0xff)) * 0x1000000) >> 0x18;
  if (uVar6 == 0) {
    if (uVar5 == 0) {return 1;}
    sVar1 = param_1->unk0x14;
  }
  else {sVar1 = param_1->unk0x14;}
  switch(sVar1) {
  case 0:
    uVar3 = 0;
    if (uVar6 == 0) {uVar3 = (uint)(0 < (int)uVar5);}
    break;
  case 1:
    if (-1 < (int)uVar6) {return 0;}
    goto LAB_80069274;
  case 2:
    uVar3 = 0;
    if (uVar5 == 0) {
      uVar3 = uVar6 >> 0x1f;
    }
    break;
  case 3:
    if (-1 < (int)uVar6) {return 0;}
    goto joined_r0x8006924c;
  case 4:
    uVar3 = 0;
    if (uVar6 == 0) {uVar3 = uVar5 >> 0x1f;}
    break;
  case 5:
    if ((int)uVar6 < 1) {return 0;}
joined_r0x8006924c:
    if (-1 < (int)uVar5) {return 0;}
    goto LAB_8006927c;
  case 6:
    uVar3 = 0;
    if (uVar5 == 0) {uVar3 = (uint)(0 < (int)uVar6);}
    break;
  case 7:
    if ((int)uVar6 < 1) {return 0;}
LAB_80069274:
    uVar3 = 0;
    if (0 < (int)uVar5) {
LAB_8006927c:
      if ((int)uVar6 < 0) {uVar6 = -uVar6;}
      if ((int)uVar5 < 0) {uVar5 = -uVar5;}
      uVar3 = (uint)(uVar6 == uVar5);
    }
    break;
  default:
    uVar3 = 0;
  }
  return uVar3;
}

bool func_800692bc(CombatEntity *param_1,CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  bool bVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  bVar3 = false;
  if (ppVar1 != NULL) {
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    bVar3 = false;
    if (ppVar2 != NULL) {
      fVar4 = func_80069554(param_1,param_2);
      fVar5 = ppVar1->scale_floatB;
      if (fVar5 <= ppVar1->unk0x38) {fVar5 = ppVar1->unk0x38;}
      fVar6 = ppVar2->scale_floatB;
      if (fVar6 <= ppVar2->unk0x38) {fVar6 = ppVar2->unk0x38;}
      bVar3 = true;
      if (fVar5 + fVar6 + 0.75f < fVar4) {bVar3 = false;}
    }
  }
  return bVar3;
}

bool func_80069384(CombatEntity *param_1,CombatEntity *param_2,uint param_3,uint param_4,int param_5){
  byte bVar1;
  CharSheet *pCVar2;
  bool bVar4;
  longlong lVar3;
  float fVar5;
  uint uVar6;
  
  if ((param_5 != 0) &&
     (!check_combatents_facings(param_1,(float)(param_3 & 0xff),(float)(param_4 & 0xff)),)) {return false;}
  if (param_1->rangeMulti == 3) {return true;}
  lVar3 = CombatEnt_flag_check(param_1);
  if (lVar3 == 0) {
    bVar1 = param_1->rangeMulti;
    if (bVar1 == 1) {
      if (param_1->CharSheet->weapons != NULL) goto LAB_80069414;
    }
    else {
      if (bVar1 == 2) {pCVar2 = param_1->CharSheet;}
      else {
        if (bVar1 != 4) {return false;}
        pCVar2 = param_1->CharSheet;
      }
      if (pCVar2->weapons != NULL) {
        fVar5 = get_combatEnt_proximity(param_1,param_2);
        if (fVar5 < INT_MAX_f) {
          uVar6 = (uint)fVar5;
          bVar1 = param_1->rangeMulti;
        }
        else {
          uVar6 = (int)(fVar5 - INT_MAX_f) | 0x80000000;
          bVar1 = param_1->rangeMulti;
        }
        if (bVar1 != 2) {return uVar6 <= param_1->CharSheet->weapons->range;}
        bVar4 = func_80068358(param_1);
        if (bVar4 == false) {return false;}
        if (2 < uVar6) {return uVar6 <= param_1->CharSheet->weapons->range;}
        return false;
      }
    }
    param_1->rangeMulti = 0;
    return false;
  }
LAB_80069414:
  return func_800692bc(param_1,param_2);
}

float get_combatEnt_proximity(CombatEntity *param_1,CombatEntity *param_2){
  Vec2 afStack144;
  Vec2 afStack80;
  
  setVec2((Vec2 *)afStack144,param_1->coord[0],param_1->coord[1]);
  setVec2((Vec2 *)afStack80,param_2->coord[0],param_2->coord[1]);
  return get_vec2_proximity((Vec2 *)afStack144,(Vec2 *)afStack80);}

float func_80069554(CombatEntity *param_1,CombatEntity *param_2){
  func_80070234(param_2);
  func_80070234(param_1);
  return get_combatEnt_proximity(param_1,param_2);}


bool combat_can_use_potion(CombatEntity *param_1,PotionEnum param_2){return can_use_potion(param_1->CharSheet,param_2,NULL);}

bool Combat_can_use_flask(CombatEntity *param_1,CombatEntity *param_2){

  bool ret;

  if (param_1->rangeMulti == 3) {
    if (param_1->item < HEALING) {ret = CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2);}
    else {
      ret = false;
      if (param_2 == param_1) {ret = combat_can_use_potion(param_1,param_1->item);}
    }
  }
  else {ret = true;}
  return ret;
}

bool func_8006963c(CombatEntity *param_1,CombatEntity *param_2){
  bool bVar1;
  bool bVar2;

  if (CombatEnt_flag_6(param_2)) {return false;}
  if (!isDead(param_2->CharSheet)) {return false;}
  if ((param_1->rangeMulti == 3) || (CombatEnt_flag_check(param_1))) {
LAB_800696b4:
    if (Combat_can_use_flask(param_1,param_2)) {return false;}
    if (CombatEnt_flag_check(param_1)) {
      if (CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2)) goto LAB_800696f0;
    }
    bVar1 = CombatEnt_flag_check(param_1);
    bVar2 = true;
    if ((bVar1 == false) && (bVar2 = false, param_1->rangeMulti != 0)) {bVar2 = true;}
  }
  else {
    if (CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2)) goto LAB_800696b4;
LAB_800696f0:
    bVar2 = false;
  }
  return bVar2;
}



bool func_checking_shadow(CombatEntity *param_1,CombatEntity *param_2,undefined4 param_3){
  playerData *ppVar1;
  playerData *ppVar2;
  uint uVar4;
  uint uVar5;
  byte X;
  byte Y;
  float fVar8;
  byte bStack176 [2];
  vec3 fStack168;
  vec3 afStack104;
  
  if (param_2->CharSheet->ID != (ItemID)(entityList[172] + 0x200)) { //not shadow
    if (!CombatEnt_flag_check(param_1)) {
      if (gGlobals.combatBytes[0] == 0x19) {return param_2 == param_1;}
      if (!func_8006963c(param_1,param_2)) {return false;}
    }
    else {
      if (isDead(param_2->CharSheet)) {return false;}
      if (CombatEnt_flag_6(param_2)) {return false;}
      if (CombatEnt_flag_4(param_2) != CombatEnt_flag_4(param_1)) {return false;}
      if (getHPCurrent(param_2->CharSheet) == getHPMax(param_2->CharSheet)) {return false;}
      if ((param_1->flags & flag9) == 0 {if (param_2 == param_1) {return true;}}
      else {if (param_2 == param_1) {return false;}}
    }
    bStack176[0] = 0;
    bStack176[1] = 0;
    get_combatEnt_x_y(param_2,bStack176,bStack176 + 1);
    if (!func_80069384(param_1,param_2,(uint)bStack176[0],(uint)bStack176[1],param_3)) {return false;}
    X = get_combatEnt_x(param_1);
    Y = get_combatEnt_y(param_1);
    if (func_8007105c(&combatPointer->substruct,X,Y,(uint)bStack176[0],bStack176[1])) {return true;}
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    if ((ppVar1 != NULL) && (ppVar2 != NULL)) {
      copyVec3((vec3 *)(ppVar1->collision).position,(vec3 *)fStack168);
      copyVec3((vec3 *)(ppVar2->collision).position,(vec3 *)afStack104);
      fStack168[1] += -ppVar1->scale_floatB + get_entity_2float_sum(param_1->CharSheet->ID)
      fStack168[1] += -ppVar2->scale_floatB + get_entity_2float_sum(param_2->CharSheet->ID);
      return func_800716b4(&combatPointer->substruct,(vec3 *)fStack168,(vec3 *)afStack104,(uint)param_1->index,param_2->index);
      
    }
  }
  return false;
}


uint get_spell_target_number(CombatEntity *param_1){
  Temp_spell *pTVar1;
  uint uVar2;

  pTVar1 = getSpell(param_1->CharSheet);
  if (pTVar1 == NULL) {uVar2 = 0;}
  else {
    if (pTVar1->cast == ALL) {uVar2 = (uint)combatPointer->EntCount;}
    else {
      uVar2 = 1;
      if (pTVar1->cast == RANK) {
        uVar2 = check_spell_wizard(param_1->CharSheet,pTVar1) + 1 >> 1;
      }
    }
  }
  return uVar2;
}

bool canControl(CombatEntity *param_1,Temp_spell *param_2){
  ItemID IVar1;
  SpellEnum bVar3;
  bool bVar2;
  byte bVar4;
  
  bVar3 = GetIDIndex(param_2->id);
  IVar1 = param_1->CharSheet->ID;
  switch(bVar3) {
  case ControlElem:
  case banishing:
    if (IsElemental(IVar1)) {return true;}
    return false;
  default:
    goto switchD_80069a74_caseD_5;
  case charming:
  //no chaos or undead
    if (EntityPointer->entities[GetIDIndex(IVar1)].Category != Chaos_Enemy) {return true;}
    return false;
  case controlMarquis:
    bVar4 = entityList[170]; //marquis
    break;
  case controlZombies:
    bVar4 = entityList[182]; //plague or nomal zombie
    if (IVar1 == (ItemID)(entityList[190] + 0x200)) {return true;}
  }
  bVar2 = false;
  if (IVar1 == (ItemID)(bVar4 + 0x200)) {
switchD_80069a74_caseD_5:
    bVar2 = true;
  }
  return bVar2;
}


bool can_effect_target(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  bool bVar1;
  bool bVar2;
  byte bVar3;
  MagicTargetEnum MVar4;
  
  if (param_3 == NULL) {
RetFalse:
    bVar1 = false;
  }
  else {
    if (CombatEnt_flag_6(param_2)) {return false;}
    if (isDead(param_2->CharSheet)) {return false;}
    MVar4 = param_3->target;
    if (MVar4 == Party_in_Area) {
      if (CombatEnt_flag_4(param_2) != CombatEnt_flag_4(param_1)) {return false;}
    }
    if (MVar4 == Enemy_in_Area) {
      if (CombatEnt_flag_4(param_2) == CombatEnt_flag_4(param_1)) goto RetFalse;
    }
    bVar1 = false;
    if (!IsNotAffected(param_2->CharSheet,GetIDIndex(param_3->id))) {
      if (CheckTargetSpellAspect(param_2->CharSheet,param_3) == 0) {bVar1 = canControl(param_2,param_3) != false;}
      else {bVar1 = false;}
    }
  }
  return bVar1;
}

bool ai_shouldnt_cast_magic(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  int iVar1;
  byte bVar3;
  uint uVar2;
  bool bVar4;
  
  if ((param_1->combat_ai_pointer == NULL) ||
     ((param_1->combat_ai_pointer->unk0x9 & 8) == 0)) {bVar4 = true;}
  else {
    bVar4 = false;
    if (spell_stamina_subtract(param_3,check_spell_wizard(param_1->CharSheet,param_3)) <= getModdedStat(param_1->CharSheet->Stats,STAM)) {
      bVar4 = false;
      if (some_equip_spell_charges(param_1->CharSheet) != 0) {
        if (CheckTargetSpellAspect(param_2->CharSheet,param_3) == 0) {bVar4 = check_spell_aspect_tod(param_3) == 0;}
        else {bVar4 = false;}
      }
    }
  }
  return bVar4;
}

bool func_80069d00(CombatEntity *param_1,CombatEntity *param_2,float param_3,float param_4){
  playerData *ppVar1;
  bool bVar2;
  float fVar3;
  Vec2 afStack224;
  Vec2 fStack160;
  Vec2 fStack96;
  
  ppVar1 = gGlobals.playerDataArray[param_2->index];
  if (ppVar1 == NULL) {bVar2 = false;}
  else {
    memset(afStack224,0,8);
    afStack224[0] = param_4;
    memset(fStack96,0,8);
    fStack160[0] = (ppVar1->collision).position[0];
    fStack160[1] = (ppVar1->collision).position[2];
    fStack96[0] = fStack160[0];
    fStack96[1] = fStack160[1];
    fVar3 = get_vec2_proximity((Vec2 *)afStack224,(Vec2 *)fStack160);
    bVar2 = true;
    if (param_3 + ppVar1->scale_floatB < fVar3) {bVar2 = false;}
  }
  return bVar2;
}

bool ai_should_cast_magic(CombatEntity *param_1,CombatEntity *param_2){
  byte bVar1;
  playerData *ppVar2;
  Temp_spell *pTVar5;
  byte bVar8;
  int iVar6;
  char cVar9;
  uint uVar7;
  u8 uVar4;
  bool bVar10;
  Borg_9_data *pBVar11;
  float fVar12;
  int iVar13;
  double dVar14;
  float fVar15;
  byte bStack256;
  byte abStack255 [7];
  vec3 fStack248;
  vec3 afStack184;
  vec3 fStack120;
  
  if (param_2->index == gGlobals.ShadowIndex) {return false;}
  if (param_1->index == gGlobals.ShadowIndex) {return false;}
  pTVar5 = getSpell(param_1->CharSheet);
  if (can_effect_target(param_1,param_2,pTVar5) != 0) {
    bVar8 = GetIDIndex(pTVar5->id);
    if (ai_shouldnt_cast_magic(param_1,param_2,pTVar5) != 0) {
        //cast if TP or self-target
      if ((bVar8 == 0xc) || (pTVar5->cast == SELF)) { return param_2 == param_1;}
      iVar6 = check_spell_wizard(param_1->CharSheet,pTVar5);
      bVar1 = pTVar5->range;
      fVar12 = get_combatEnt_x_f(param_1);
      get_combatEnt_y_f(param_1);
      uVar4 = get_combatEnt_x(param_1);
      uVar7 = get_combatEnt_y(param_1);
      bStack256 = 0;
      abStack255[0] = 0;
      get_combatEnt_x_y(param_2,&bStack256,abStack255);
      iVar13 = iVar6 * (uint)bVar1;
      if ((pTVar5->aspect_flag & 0x10) != 0) {
        fVar12 = combatPointer->floatA;
        fVar15 = combatPointer->floatB;
        if (0.0 < fVar12) {iVar13 = (int)((double)fVar12 + 0.5d);}
        else {iVar13 = -(int)(0.5d - (double)fVar12);}
        uVar4 = iVar13 & 0xff;
        if (0.0 < fVar15) {uVar7 = (uint)((double)fVar15 + 0.5d);}
        else {uVar7 = -(int)(0.5d - (double)fVar15);}
        uVar7 &= 0xff;
        iVar13 = iVar6;
      }
      if (bVar8 != 0x15) {
        dVar14 = (double)iVar13;
        if (iVar13 < 0) {dVar14 = dVar14 + UINT_MAX_d;}
        bVar10 = func_80069d00(param_1,param_2,(float)dVar14,fVar12);
        if (bVar10 == false) {return false;}
      }
      if (func_8007105c(&combatPointer->substruct,uVar4,(byte)uVar7,(uint)bStack256,abStack255[0])) {return true;}
      if ((uVar4 == bStack256) && (uVar7 == abStack255[0])) {return true;}
      ppVar2 = gGlobals.playerDataArray[param_2->index];
      if (ppVar2 != NULL) {
        fVar15 = (float)uVar4;
        fVar12 = (float)uVar7;
        pBVar11 = &(gGlobals.Sub.ZoneDatMtx[4].mapPointer)->dat;
        setVec3((vec3 *)fStack248,fVar15,50.0,fVar12);
        setVec3((vec3 *)afStack184,fVar15,-10.0,fVar12);
        bVar10 = func_800adf78(pBVar11,(vec3 *)fStack248,(vec3 *)afStack184,0.5,(vec3 *)fStack120,NULL,0);
        if (bVar10 == false) {setVec3((vec3 *)fStack120,fVar15,10.0,fVar12);}
        else {fStack120[1] += 2.0f;}
        copyVec3((vec3 *)(ppVar2->collision).position,(vec3 *)fStack248);
        fVar12 = get_entity_2float_sum(param_2->CharSheet->ID);
        fStack248[1] = fStack248[1] + -ppVar2->scale_floatB + fVar12;
        return func_800716b4(&combatPointer->substruct,(vec3 *)fStack120,(vec3 *)fStack248,(uint)param_2->index,param_2->index);
      }
    }
  }
  return false;
}

bool spell_taget_party_area(CombatEntity *param_1){
  Temp_spell *pTVar1;
  bool bVar2;
  
  pTVar1 = getSpell(param_1->CharSheet);
  bVar2 = false;
  if (pTVar1 != NULL) {bVar2 = pTVar1->target == Party_in_Area;}
  return bVar2;
}

uint func_8006a1dc(CombatEntity *param_1){
  Temp_weapon *pTVar1;
  bool bVar3;
  uint uVar2;
  longlong lVar4;
  uint auStack72 [4];
  uint uStack56;
  
  if (param_1->rangeMulti < 5) {
    lVar4 = 0;
    pTVar1 = param_1->CharSheet->weapons;
    auStack72[2] = 0;
    if (pTVar1 != (Temp_weapon *)0x0) {
      bVar3 = isBreathSpitOrSpikes(pTVar1);
      lVar4 = (longlong)bVar3;
      auStack72[2] = (uint)(param_1->CharSheet->weapons->range != 0);
    }
    uStack56 = 0;
    auStack72[0] = 0;
    auStack72[1] = (int)lVar4;
    auStack72[3] = 1;
    if (lVar4 != 0) {uStack56 = (uint)(auStack72[2] != 0);}
    uVar2 = auStack72[param_1->rangeMulti];
  }
  else {uVar2 = 0;}
  return uVar2;
}

void func_8006a274(CombatEntity *param_1){
  if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
  CombatEnt_NAND_flags(param_1,flag9);
  CombatEnt_NAND_flags(param_1,flag10);
  set_atk_range_multi(param_1,true);
  param_1->unk0x22 = 1;
  if (gGlobals.SomeCase == 3) {gGlobals.combatBytes[1] = 0x13;}
}


void Ofunc_8006a2f0(CombatEntity *param_1,byte param_2){
  byte bVar1;
  uint uVar2;
  bool bVar3;
  
  bVar1 = param_1->rangeMulti;
  if (bVar1 != param_2) {
    param_1->rangeMulti = param_2;
    uVar2 = func_8006a1dc(param_1);
    if (uVar2 == 0) {param_1->rangeMulti = bVar1;}
    else {
      if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
      CombatEnt_NAND_flags(param_1,flag9);
      CombatEnt_NAND_flags(param_1,flag10);
      func_80072454(combatPointer->substruct2,param_1);
      get_weapon_sheild_borg5(param_1);
      end_combat_turn_(param_1);
    }
  }
  return;
}

void func_8006a394(CombatEntity *param_1,uint param_2,uint param_3){
  char cVar2;
  int iVar1;
  s8 sVar3;
  int iVar4;
  
  iVar4 = (int)(((param_2 & 0xff) - get_combatEnt_x(param_1)) * 0x1000000) >> 0x18;
  iVar1 = (int)(((param_3 & 0xff) - get_combatEnt_y(param_1)) * 0x1000000) >> 0x18;
  if ((iVar4 != 0) || (iVar1 != 0)) {
    if (iVar4 < 0) {
      sVar3 = 7;
      if ((-1 < iVar1) && (sVar3 = 5, iVar1 < 1)) {sVar3 = 6;}
    }
    else {
      if (iVar4 < 1) {
        sVar3 = 4;
        if (iVar1 < 0) {
          param_1->unk0x14 = 0;
          return;
        }
      }
      else {
        sVar3 = 1;
        if ((-1 < iVar1) && (sVar3 = 3, iVar1 < 1)) {sVar3 = 2;}
      }
    }
    param_1->unk0x14 = sVar3;
  }
  return;
}


void Ofunc_8006a450(CombatEntity *param_1,s8 param_2){
  param_1->unk0x14 = param_2;
  set_combatEnt_vec2(param_1,param_2);
  func_80072454(combatPointer->substruct2,param_1);
  func_80072454(combatPointer->substruct2 + 1,param_1);
  func_80068e38(param_1);
}

void end_combat_turn_(CombatEntity *param_1){
  CharSheet *pCVar1;
  ushort uVar2;
  bool bVar3;
  temp_gear *puVar2;
  combat_ai *pTVar1;
  
  clear_camera_playerdata_focus();
  pTVar1 = param_1->combat_ai_pointer;
  if ((pTVar1 != NULL) && ((pTVar1->unk0x9 & 8) != 0)) {func_80064b18(pTVar1);}
  param_1->CharSheet->some_rand_val = 0xff;
  CombatEnt_NAND_flags(param_1,flag1);
  pCVar1 = param_1->CharSheet;
  if (pCVar1->spellSwitch == 5) {
    puVar2 = pCVar1->pItemList->pItem[pCVar1->currSpell];
    if ((puVar2->pSpell->Charges == 0) &&
       ((uVar2 = (ushort)puVar2->id >> 8, uVar2 == 0x11 || (uVar2 == 0xd)))) { //scroll or wand
      //dispose of drained acc.
      unequip_acc(pCVar1,(uint)pCVar1->currSpell);
      param_1->CharSheet->spellSwitch = 0;
    }
  }
  gGlobals.combatBytes[0] = 1;
  set_combatflag_42(0);
  if ((!isDead(param_1->CharSheet)) && (!CombatEnt_flag_6(param_1))) {
    gGlobals.playerDataArray[param_1->index]->ani_type = 0;
  }
  func_looking_for_flask(param_1);
  if (((param_1->rangeMulti == 3) && (param_1->item < HEALING)) &&
     (param_1->CharSheet->weapons != NULL)) {
    MoveWeaponsToInventory(gGlobals.Party,(uint)param_1->index);
  }
  func_80070304(param_1);
  func_80073e3c(&combatPointer->combatTurn);
  return;}


void combat_escape_func(CombatEntity *param_1){
  if (!CombatEnt_flag_6(param_1)) {
    func_800714d0(&combatPointer->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_1->unk0x23);
    CombatEnt_OR_flags(param_1,flag7);
    combatPointer->unk0x2--;
    if (!CombatEnt_flag_4(param_1)) {combatPointer->playersAlive--;}
    else {combatPointer->EnemiesAlive--;}
    clear_combatEnt_effects(param_1);
    clear_charsheet_potions(param_1->CharSheet);
    func_80096048(gGlobals.playerDataArray[param_1->index]);
    func_80094228(gGlobals.playerDataArray[param_1->index]);
    playerData_death_flags(gGlobals.playerDataArray[param_1->index]);
    gGlobals.playerDataArray[param_1->index] = NULL;
    flee_draw_crossbones(param_1->CharSheet->ID,param_1->index);
  }
  return;
}

bool NotAspectBonus(AspectEnum param_1){
  if (param_1 == LUNAR) {return TerrainPointer->partOfDay != NIGHT;}
  if (param_1 != SOLAR) {return false;}
  return TerrainPointer->partOfDay == NIGHT;
}


bool getNotAspectBonus(CombatEntity *param_1){return NotAspectBonus(GetCharAspect(param_1->CharSheet->EXP));}


bool IsAspectBonus(CombatEntity *param_1){
  AspectEnum AVar1;
  bool bVar2;
  
  AVar1 = GetCharAspect(param_1->CharSheet->EXP);
  bVar2 = false;
  if (AVar1 != NONE) {
    if (AVar1 == LUNAR) {bVar2 = TerrainPointer->partOfDay == NIGHT;}
    else {
      bVar2 = false;
      if (AVar1 == SOLAR) {bVar2 = TerrainPointer->partOfDay != NIGHT;}
    }
  }
  return bVar2;
}


u8 func_8006a830(CombatEntity *param_1,CombatEntity *param_2,ulonglong param_3,ulonglong param_4){
  ulonglong uVar1;
  ulonglong uVar2;
  s8 sVar4;
  u8 uVar5;
  s8 sVar6;
  ulonglong uVar7;
  ulonglong uVar8;
  char cVar3;
  
  uVar8 = param_3 & 0xff;
  uVar7 = param_4 & 0xff;
  uVar1 = get_combatEnt_x(param_1);
  uVar2 = get_combatEnt_y(param_1);
  switch(param_2->unk0x14) {
  case 0:
    if (((uVar1 < uVar8) && (uVar7 < uVar2)) && (param_1->unk0x14 == 1)) {return 1;}
    if (((uVar1 != uVar8) || (uVar2 <= uVar7)) || (param_1->unk0x14 != 0)) {
      if (uVar1 <= uVar8) {return 0;}
      sVar4 = 7;
      if (uVar2 <= uVar7) {return 0;}
      sVar6 = param_1->unk0x14;
      goto LAB_8006ab00;
    }
    goto LAB_8006ab08;
  case 1:
    if (uVar1 < uVar8) {
      if ((uVar2 == uVar7) && (param_1->unk0x14 == 2)) goto LAB_8006ab08;
      if ((uVar7 < uVar2) && (param_1->unk0x14 == 1)) {return 1;}
    }
    uVar5 = 0;
    if (((uVar1 == uVar8) && (uVar5 = 0, uVar7 < uVar2)) && (uVar5 = 0, param_1->unk0x14 == 0)) {uVar5 = 1;}
    break;
  case 2:
    uVar5 = 0;
    if (uVar1 < uVar8) {
      if ((uVar2 < uVar7) && (param_1->unk0x14 == 3)) {uVar5 = 1;}
      else {
        if ((uVar2 == uVar7) && (param_1->unk0x14 == 2)) {uVar5 = 1;}
        else {
          uVar5 = 0;
          if ((uVar7 < uVar2) && (uVar5 = 0, param_1->unk0x14 == 1)) {uVar5 = 1;}
        }
      }
    }
    break;
  case 3:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 4)) {return 1;}
    if (uVar1 >= uVar8) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = param_1->unk0x14;
    sVar6 = 2;
    goto LAB_8006ab6c;
  case 4:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 4)) {return 1;}
    if (uVar1 <= uVar8) {return 0;}
    goto LAB_8006aaf4;
  case 5:
    if (uVar8 < uVar1) {
      if ((uVar2 == uVar7) && (param_1->unk0x14 == 6)) goto LAB_8006ab08;
      if ((uVar2 < uVar7) && (param_1->unk0x14 == 5)) {
        return 1;
      }
    }
    if (uVar1 != uVar8) {return 0;}
    sVar4 = 4;
    if (uVar7 <= uVar2) {return 0;}
    sVar6 = param_1->unk0x14;
    goto LAB_8006ab00;
  case 6:
    if (uVar1 <= uVar8) {return 0;}
    if ((uVar7 < uVar2) && (param_1->unk0x14 == 7)) {return 1;}
    if ((uVar2 == uVar7) && (param_1->unk0x14 == 6)) goto LAB_8006ab08;
LAB_8006aaf4:
    uVar5 = 0;
    sVar4 = 5;
    if (uVar2 < uVar7) {
      sVar6 = param_1->unk0x14;
LAB_8006ab00:
      uVar5 = 0;
      if (sVar6 == sVar4) {
LAB_8006ab08:
        uVar5 = 1;
      }
    }
    break;
  case 7:
    if (((uVar8 < uVar1) && (uVar7 < uVar2)) && (param_1->unk0x14 == 7)) {return 1;}
    if (((uVar1 == uVar8) && (uVar7 < uVar2)) && (param_1->unk0x14 == 0)) {return 1;}
    if (uVar8 >= uVar1) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = param_1->unk0x14;
    sVar6 = 6;
LAB_8006ab6c:
    uVar5 = 0;
    if (sVar4 == sVar6) {uVar5 = 1;}
    break;
  default:
    uVar5 = 0;
  }
  return uVar5;
}

bool isMagicElement(CombatEntity* e, ElementEnum x){
  switch(x) {
  case NONE:
  case Physical:
  case Cutting:
  case Smashing:
  case Holy:
    return false;
  case Earth:
  case Solar:
  case Necromany:
  case Fire:
  case Lunar:
  case Naming:
  case Water:
  case Magic:
  case Air:
  case Star:
  case Elemental:
  case Chaos:
    return true;
  default:
    return false;
  }
}

bool phys_magic_element_bool(CombatEntity* param_1,ElementEnum param_2,ElementEnum param_3){
  bool ret;
  
  if (param_3 == NONE) {ret = false;}
  else {
    ret = true;
    if (param_2 != param_3) {
      if (param_3 == Physical) {
        if ((param_2 == Cutting) || (ret = false, param_2 == Smashing)) {ret = true;}
      }
      else {
        ret = false;
        if (param_3 == Magic) {ret = isMagicElement(param_1,param_2);}
      }
    }
  }
  return ret;
}

bool gear_element_resist(CombatEntity *param_1,ElementEnum param_2,float *param_3){
  temp_armor *ptVar1;
  Temp_weapon *pTVar2;
  CharGear *pCVar3;
  bool bVar5;
  CharSheet *pCVar4;
  temp_gear *ptVar6;
  uint uVar7;
  bool bVar8;
  ulonglong uVar9;
  float fVar10;
  
  uVar9 = (ulonglong)(uint)1.0f;
  bVar8 = false;
  uVar7 = 0;
  do {
    bVar5 = phys_magic_element_bool(param_1,param_2,param_1->resists[uVar7].element);
    if (bVar5 != false) {
      bVar8 = true;
      uVar9 = = param_1->resists[uVar7].percent);
    }
    ptVar1 = param_1->CharSheet->armor[uVar7];
    if (((ptVar1 != (temp_armor *)0x0) && (ptVar1->resist != (resist_float *)0x0)) &&
       (bVar5 = phys_magic_element_bool(param_1,param_2,ptVar1->resist->element), bVar5 != false)) {
      bVar8 = true;
      uVar9 = = ptVar1->resist->percent);
    }
    uVar7++;
  } while (uVar7 < 2);
  pTVar2 = param_1->CharSheet->weapons;
  if (pTVar2 == (Temp_weapon *)0x0) {
    pCVar3 = param_1->CharSheet->pItemList;
  }
  else {
    if (pTVar2->resist == (resist_float *)0x0) {
      pCVar4 = param_1->CharSheet;
    }
    else {
      bVar5 = phys_magic_element_bool(param_1,param_2,pTVar2->resist->element);
      if (bVar5 == false) {
        pCVar4 = param_1->CharSheet;
      }
      else {
        bVar8 = true;
        uVar9 = = pTVar2->resist->percent);
        pCVar4 = param_1->CharSheet;
      }
    }
    pCVar3 = pCVar4->pItemList;
  }
  fVar10 = (float)uVar9;
  uVar7 = 0;
  if (pCVar3->num_used != 0) {
    ptVar6 = (temp_gear *)pCVar3->pItem;
    while( true ) {
      ptVar6 = *(temp_gear **)((int)ptVar6 + uVar7 * 4);
      if (((ptVar6 != (temp_gear *)0x0) && (ptVar6->resist != (resist_float *)0x0)) &&
         (bVar5 = phys_magic_element_bool(param_1,param_2,ptVar6->resist->element), bVar5 != false))
      {
        bVar8 = true;
        uVar9 = = ptVar6->resist->percent);
      }
      fVar10 = (float)uVar9;
      uVar7++;
      if ((byte)pCVar3->num_used <= uVar7) break;
      ptVar6 = (temp_gear *)pCVar3->pItem;
    }
  }
  *param_3 = fVar10;
  return bVar8;
}

bool CanResistSpell(CombatEntity *e,Temp_spell *spel_,ElementEnum Elem){
  SpellEnum spellID;
  bool bVar1;
  SpellEnum SVar2;
  
  spellID = GetIDIndex(spel_->id);
  switch(Elem) {
  default:
    bVar1 = false;
    break;
  case Earth:
    bVar1 = spellID == EarthSmite;
    break;
  case Solar:
    bVar1 = (bool)(spel_->aspect_flag >> 1 & 1);
    break;
  case Necromany:
    bVar1 = spel_->school == Necromancy;
    break;
  case Fire:
    if (spellID != DragonFlames) {
      SVar2 = fireball;
CheckOtherSpell:
      if (spellID != SVar2) {return false;}
    }
    goto ReturnTrue;
  case Lunar:
    bVar1 = (bool)(spel_->aspect_flag & 1);
    break;
  case Naming:
    bVar1 = spel_->school == Naming;
    break;
  case Water:
    if (spellID != lightning) {
      SVar2 = frozenDoom;
      goto CheckOtherSpell;
    }
ReturnTrue:
    bVar1 = true;
    break;
  case Magic:
    bVar1 = true;
    break;
  case Air:
    bVar1 = spellID == wind;
    break;
  case Star:
    bVar1 = spel_->school == Star;
    break;
  case Elemental:
    bVar1 = spel_->school == Elemental;
    break;
  case Chaos:
    bVar1 = spel_->school == Chaos;
  }
  return bVar1;
}

bool magic_resist_element_checks(CombatEntity *param_1,Temp_spell *param_2,float *param_3){
  temp_armor *ptVar1;
  Temp_weapon *pTVar2;
  CharGear *pCVar3;
  bool bVar5;
  CharSheet *pCVar4;
  temp_gear *ptVar6;
  uint uVar7;
  bool bVar8;
  ulonglong uVar9;
  float fVar10;
  
  uVar9 = (ulonglong)(uint)1.0f;
  bVar8 = false;
  uVar7 = 0;
  do {
    bVar5 = CanResistSpell(param_1,param_2,param_1->resists[uVar7].element);
    if (bVar5 != false) {
      bVar8 = true;
      uVar9 = = param_1->resists[uVar7].percent);
    }
    ptVar1 = param_1->CharSheet->armor[uVar7];
    if (((ptVar1 != (temp_armor *)0x0) && (ptVar1->resist != (resist_float *)0x0)) &&
       (bVar5 = CanResistSpell(param_1,param_2,ptVar1->resist->element), bVar5 != false)) {
      bVar8 = true;
      uVar9 = = ptVar1->resist->percent);
    }
    uVar7++;
  } while (uVar7 < 2);
  pTVar2 = param_1->CharSheet->weapons;
  if (pTVar2 == (Temp_weapon *)0x0) {
    pCVar3 = param_1->CharSheet->pItemList;
  }
  else {
    if (pTVar2->resist == (resist_float *)0x0) {
      pCVar4 = param_1->CharSheet;
    }
    else {
      bVar5 = CanResistSpell(param_1,param_2,pTVar2->resist->element);
      if (bVar5 == false) {
        pCVar4 = param_1->CharSheet;
      }
      else {
        bVar8 = true;
        uVar9 = = pTVar2->resist->percent);
        pCVar4 = param_1->CharSheet;
      }
    }
    pCVar3 = pCVar4->pItemList;
  }
  fVar10 = (float)uVar9;
  uVar7 = 0;
  if (pCVar3->num_used != 0) {
    ptVar6 = (temp_gear *)pCVar3->pItem;
    while( true ) {
      ptVar6 = *(temp_gear **)((int)ptVar6 + uVar7 * 4);
      if (((ptVar6 != (temp_gear *)0x0) && (ptVar6->resist != (resist_float *)0x0)) &&
         (bVar5 = CanResistSpell(param_1,param_2,ptVar6->resist->element), bVar5 != false)) {
        bVar8 = true;
        uVar9 = = ptVar6->resist->percent);
      }
      fVar10 = (float)uVar9;
      uVar7++;
      if ((byte)pCVar3->num_used <= uVar7) break;
      ptVar6 = (temp_gear *)pCVar3->pItem;
    }
  }
  *param_3 = fVar10;
  return bVar8;
}

char check_vs_magic(CombatEntity *param_1,Temp_spell *param_2){
  Temp_enchant *pTVar1;
  byte (*pabVar2) [2];
  effects *peVar3;
  uint uVar4;
  byte uStack64 [5] [2]={{38,1},{39,2},{40,3},{41,5},{0xff,0xff}}; //magic id with corresponding school
  
  uVar4 = 0;
  peVar3 = param_1->CharSheet->effects;
  do {
    pTVar1 = peVar3->list[0];
    if ((pTVar1 != (Temp_enchant *)0x0) && (uStack64[0][0] != 0xff)) {
      pabVar2 = uStack64;
      do {
        if ((*(SpellEnum *)pabVar2 == pTVar1->index) &&
           (*(MagicSchoolEnum *)((int)pabVar2 + 1) == param_2->school)) {
          return pTVar1->lv * 6 & 0xfe;
        }
        pabVar2 = (byte (*) [2])((int)pabVar2 + 2);
      } while (*(SpellEnum *)pabVar2 != NONE);
    }
    uVar4++
    peVar3 = (effects *)(peVar3->list + 1);
    if (0xe < uVar4) {return 0;}
  } while( true );
}

uint get_STR_Steps(CombatEntity *param_1){
  uint uVar2;
  byte STR_Steps[8]={4,9,17,24,28,32,36,39};


  uVar2 = 0;
  while( true ) {
    if (7 < uVar2) {return uVar2;}
    if (getModdedStat(param_1->CharSheet->Stats,STR) <= STR_Steps[uVar2]) break;
    uVar2++;
  }
  return uVar2;
}

void func_seeking_sholeh(CombatEntity *param_1){ //probably a death func
  byte *pbVar1;
  CharSheet *pCVar2;
  Temp_enchant *pTVar3;
  CombatEntity *pCVar4;
  combat_ai *pcVar5;
  bool bVar8;
  uint uVar9;
  uint uVar10;
  
  uVar10 = 0;
  pCVar2 = param_1->CharSheet;
  while( true ) {
    pTVar3 = pCVar2->effects->list[uVar10];
    if (pTVar3 != NULL) {
      if (isPetrify(pTVar3->index)) {clear_player_effect(param_1->CharSheet,uVar10,param_1);}
    }
    uVar10++;
    if (0xe < uVar10) break;
  }
  func_800714d0(&combatPointer->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_1->unk0x23);
  combatPointer->unk0x2--;
                    /* Sholeh */
  if ((ItemID)(entityList[164] + 0x200) == param_1->CharSheet->ID) {setEventFlag(0x26e,true);}
  if (!CombatEnt_flag_5(param_1)) {
    combatPointer->playersAlive--;
    register_party_deaths(gGlobals.Party);
    if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
  }
  else {
    combatPointer->EnemiesAlive--;
    if (combatPointer->unk0x8 == 0) {
      uVar10 = 0;
      pbVar1 = &combatPointer->EntCount;
      combatPointer->unk0x8 = 1;
      if (*pbVar1 != 0) {
        do {
          pCVar4 = (&combatPointer->combatEnts)[uVar10];
          if (pCVar4 == NULL) {
LAB_8006b3d4:
            uVar9 = (uint)combatPointer->EntCount;
          }
          else {
            if (pCVar4 == param_1) {
              bVar8 = CombatEnt_flag_4(pCVar4);
              if (bVar8 != false) {
                pcVar5 = pCVar4->combat_ai_pointer;
                if (pcVar5 == NULL) {
                  uVar9 = (uint)combatPointer->EntCount;
                  goto LAB_8006b3d8;
                }
                pcVar5->unk0x9 = pcVar5->unk0x9 | 2;
              }
              goto LAB_8006b3d4;
            }
            uVar9 = (uint)combatPointer->EntCount;
          }
LAB_8006b3d8:
          uVar10++;
        } while (uVar10 < uVar9);
      }
    }
  }
  return;
}

bool check_for_petrify_effect(CombatEntity *param_1){
  CharSheet *pCVar1;
  Temp_enchant *pTVar2;
  bool bVar3;
  uint uVar4;
  
  uVar4 = 0;
  pCVar1 = param_1->CharSheet;
  while ((pTVar2 = pCVar1->effects->list[uVar4], pTVar2 == (Temp_enchant *)0x0 ||
         (!isPetrify(pTVar2->index)))) {
    uVar4++;
    if (0xe < uVar4) {return false;}
  }
  return true;
}

short multiple_skill_checks(CombatEntity *param_1,CombatEntity *param_2,char param_3,char param_4,byte backstab){
  byte bVar1;
  CharSheet *pCVar2;
  CharStats *stats;
  CharSkills *pCVar3;
  Temp_weapon *pTVar4;
  CharStats *stats_00;
  int iVar6;
  int iVar7;
  int iVar8;
  char cVar11;
  char cVar12;
  bool bVar13;
  int iVar9;
  short sVar10;
  ushort uVar15;
  
  pCVar2 = param_1->CharSheet;
  stats = pCVar2->Stats;
  pCVar3 = pCVar2->Skills;
  pTVar4 = pCVar2->weapons;
  stats_00 = param_2->CharSheet->Stats;
  iVar6 = getModdedStat(stats,STR);
  iVar7 = getModdedStat(stats,END);
  iVar8 = getBaseStat(stats,LV);
  bVar1 = pTVar4->hit;
  cVar11 = getModdedWeapon(pCVar3,pTVar4->weaponType);
  cVar12 = getModdedSkill(pCVar3,Warrior);
  bVar13 = check_for_petrify_effect(param_2);
  uVar15 = 0;
  if (bVar13 == false) {uVar15 = getModdedStat(stats_00,DEX);}
  sVar10 = 0;
  if (bVar13 == false) {sVar10 = get_sheild_warrior_skill(param_2);}
  iVar9 = getBaseStat(stats_00,LV);
  iVar6 = theif_backstab_mod(param_1,
    (short)((((iVar6 + iVar7 + iVar8) * 0x10000 >> 0x10) +(uint)bVar1 + cVar11 * 6 + cVar12 * 2) * 0x10000 >>0x10) - (uVar15 * 2 + (short)iVar9 + sVar10),
    (bool)backstab,1,0x14);
  if (getModdedStat(stats_00,STAM) == 0) {iVar6 *= 1.15f;}
  iVar7 = func_80070cc4(&combatPointer->substruct,param_3,param_4,get_combatEnt_x(param_1),get_combatEnt_y(param_1););
  iVar7 *= 0.05f * (float)iVar6 + (float)iVar6);
  if (getModdedStat(stats,STAM) == 0) {iVar7 = *= 0.8f);}
  if (TerrainPointer->partOfDay == NIGHT) {iVar7 = *= 0.9f);}
  sVar10 = func_8006be0c(param_1,some_aspect_multi(param_1,iVar7)Var5);
  if (sVar10 < 5) {sVar10 = 5;}
  return sVar10;
}

int skillcheck_float(CombatEntity *param_1,short rand,short param_3,SkillEnum param_4){
  int rand1;
  float fVar2;
  
  rand1 = (int)rand;
  fVar2 = (float)getModdedSkill(param_1->CharSheet->Skills,param_4);
  if (param_3 * 0.2f <= fVar2) {fVar2 = param_3 * 0.2f;}
  if ((float)rand1 <= fVar2) {rand1 = (int)((rand1 - RollD(1,100)) * 0x10000) >> 0x10;}
  return rand1;
}


void combat_weapon_skill_check(CombatEntity *param_1,uint param_2,WeaponClassEnum param_3){
  float fVar2;
  
  fVar2 = (float)(param_2 & 0xff) * 0.1f;
  if (INT_MAX_f <= fVar2) {fVar2 -= INT_MAX_f;}
  if (RollD(1,100) <= ((int)fVar2 & 0xffU)) {wonky_weapon_check(param_1->CharSheet->Skills,param_3,1);}
}


short calc_element_resist_multi(CombatEntity *param_1,CombatEntity *param_2,short param_3,ElementEnum param_4){
  combat_ai *pcVar1;
  float afStack32;
  
  afStack32 = 0.0;
  if (gear_element_resist(param_2,param_4,&afStack32)) {
    param_3 *= afStack32);
    if ((afStack32 != 0.0) && (param_3 < 1)) {param_3 = 1;}
    if (((1.0f < afStack32) &&
        (pcVar1 = param_2->combat_ai_pointer, pcVar1 != NULL)) &&
       ((pcVar1->unk0x9 & 8) != 0)) {pcVar1->unk0x9 |= 0x12;}
  }
  return param_3;
}

short use_weapon_enchantment(CombatEntity *param_1,CombatEntity *param_2){
  Temp_weapon *pTVar1;
  Temp_enchant *pTVar2;
  short lVar5;
  Temp_spell TStack80;
  
  pTVar1 = param_1->CharSheet->weapons;
  if (pTVar1 != NULL) {
    pTVar2 = pTVar1->enchantment;
    if (pTVar2 != NULL) {
      lVar5 = 0;
      create_temp_spell(&TStack80,SpellList[pTVar2->index] | 0x300,pTVar2->lv);
      if (can_effect_target(param_1,param_2,&TStack80)) {
        lVar5 = magic_damage_resist_calc(param_1,param_2,&TStack80,true);;
        if (lVar5 == 0xfffd) {lVar5 = 0;}
        if (lVar5 == 0xffff) {lVar5 = 0;}
        if (lVar5 == 0xfffe) {lVar5 = 0;}
      }
      clear_temp_Stat_spell((Temp_weapon *)&TStack80);
      return lVar5;
    }
  }
  return 0;
}
uint calc_attack_or_crit(CombatEntity *attacker,CombatEntity *target){
  Temp_weapon *pTVar1;
  CharSkills *pCVar2;
  char cVar6;
  undefined uVar7;
  bool backstab;
  short sVar5;
  uint uVar3;
  int iVar4;
  byte bVar8;
  uint uVar9;
  
  pTVar1 = attacker->CharSheet->weapons;
  if (pTVar1 == NULL) {uVar3 = 0;}
  else {
    cVar6 = get_combatEnt_x(target);
    uVar7 = get_combatEnt_y(target);
    pCVar2 = attacker->CharSheet->Skills;
    backstab = check_for_backstab(attacker,target);
    sVar5 = multiple_skill_checks(attacker,target,cVar6,uVar7,backstab);
    iVar4 = skillcheck_float(attacker,(short)RollD(1,100),sVar5,Warrior);
    bVar8 = getModdedWeapon(pCVar2,pTVar1->weaponType);
    if (bVar8 < 6) {uVar9 = (uint)(byte)(('\b' - bVar8) * ('\b' - bVar8));}
    else {uVar9 = 5;}
    if (iVar4 < sVar5) {
      sVar5 = some_STR_Theif_check(attacker,sVar5,iVar4,target,1,(int)backstab);
      combat_weapon_skill_check(attacker,uVar9,pTVar1->weaponType);
      if (uVar3 == iVar4) {sprintf(gGlobals.text,combatPointer->textArray->they attack,attacker->CharSheet->name,target->CharSheet->name);}
      else {sprintf(gGlobals.text,combatPointer->textArray->crit attack,attacker->CharSheet->name,target->CharSheet->name);}
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      if (sVar5 == 0) {
        combat_print_dodge(attacker,target);
        uVar3 = 0;
      }
      else {
        combat_print_damage(target,sVar5);
        uVar3 = (int)sVar5 & 0xffff;
      }
    }
    else {
      combat_weapon_skill_check(attacker,uVar9 >> 1,pTVar1->weaponType);
      combat_print_dodge(attacker,target);
      uVar3 = 0;
    }
  }
  return uVar3;
}

short some_STR_Theif_check(CombatEntity *attacker,short param_2,int param_3,CombatEntity *target,
                char diceMulti,int backStab){
  ElementEnum EVar1;
  byte bVar2;
  CharSheet *pCVar3;
  CharStats *stats;
  CharSkills *pCVar4;
  char cVar11;
  uint uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  short sVar9;
  short sVar10;
  
  pCVar3 = attacker->CharSheet;
  stats = pCVar3->Stats;
  pCVar4 = pCVar3->Skills;
  EVar1 = pCVar3->weapons->element;
  bVar2 = pCVar3->weapons->damage;
  cVar11 = get_STR_Steps(attacker);
  uVar5 = RollD(bVar2 + cVar11 * diceMulti,6);
  iVar6 = some_skillcheck_calc(((int)param_2 - (int)(short)param_3) * 0x10000 >> 0x10);
  iVar7 = getBaseStat(stats,LV);
  uVar8 = get_protection_level(target,SUB41(backStab,0));
  cVar11 = getModdedSkill(pCVar4,Theif);
  iVar6 = (((int)(((int)(short)uVar5 + ((iVar6 + iVar7) - uVar8)) * 0x10000) >> 0x10) +
          cVar11 * 2 * backStab) * 0x10000 >> 0x10;
  if (iVar6 < 1) {iVar6 = 1;}
  sVar9 = calc_element_resist_multi(attacker,target,(short)iVar6,EVar1);
  if ((int)sVar9 << 0x10 < 0) {sVar9 = 0;}
  sVar10 = use_weapon_enchantment(attacker,target);
  return sVar10 + sVar9;
}

int func_8006be0c(CombatEntity *param_1,short param_2){
  int iVar2;
  float fVar3;
  
  iVar2 = (int)param_2;
  if (combatPointer->unk0x13 != 0) {
    fVar3 = (float)combatPointer->unk0x13 * 0.01f;
    if (!CombatEnt_flag_4(param_1)) {fVar3 += 1.05f;}
    else {fVar3 = 0.95f - fVar3;}
    iVar2*= fVar3);
  }
  return iVar2;
}

int some_aspect_multi(CombatEntity *param_1,short param_2){
  bool bVar1;
  int iVar2;
  float fVar3;
  
  iVar2 = (int)param_2;
  bVar1 = getNotAspectBonus(param_1);
  fVar3 = 0.75f;
  if ((bVar1 != false) ||
     (bVar1 = IsAspectBonus(param_1), fVar3 = 1.25f, bVar1 != false)) {
    iVar2 *= fVar3);
  }
  return iVar2;
}

int some_night_check(CombatEntity *e, short param_1,short param_2,short param_3,short nightPenalty,ushort param_5){
  int iVar1;
  
  iVar1 = (int)param_1;
  if (TerrainPointer->partOfDay == NIGHT) {iVar1 = (iVar1 - nightPenalty) * 0x10000 >> 0x10;}
  if ((TerrainPointer->windByte != 2) &&
     (param_2 = param_3, TerrainPointer->windByte != 1)) {return iVar1;}
  iVar1 -= param_2);
  if (6 < param_5) {iVar1 = (iVar1 - ((int)((param_5 - 5) * 0x10000) >> 0x10)) * 0x10000 >> 0x10;}
  return iVar1;
}

int Ofunc_8006bfc0(CombatEntity *param_1,short param_2,uint param_3,undefined1 param_4){
  int iVar2;
  int iVar4;
  short asStack96 [48];
  
  iVar4 = (int)param_2;
  iVar2 = func_80070cc4(&combatPointer->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_3 & 0xff,param_4);
  if (iVar2 != 0) {
    iVar4 = (iVar4 + *(short *)((int)asStack96 + (iVar2 >> 0x1f & 2U))) * 0x10000 >> 0x10;
  }
  return iVar4;
}

int theif_backstab_mod(CombatEntity *param_1,short param_2,bool backstab,int param_4,short param_5){
  char cVar1;
  
  cVar1 = getModdedSkill(param_1->CharSheet->Skills,Theif);
  return ((((int)param_2 + (int)param_5 * (int)backstab) * 0x10000 >> 0x10) +
         (int)cVar1 * param_4 * 10) * 0x10000 >> 0x10;
}


short check_warrior_weapon_night(CombatEntity *param_1,CombatEntity *param_2,char param_3,char param_4,
                undefined4 param_5){
  WeaponClassEnum WVar1;
  byte bVar2;
  CharSheet *pCVar3;
  CharStats *stats;
  CharStats *stats_00;
  Temp_weapon *pTVar4;
  CharSkills *pCVar5;
  int iVar7;
  int iVar8;
  int iVar9;
  char cVar11;
  char cVar12;
  bool bVar13;
  undefined uVar14;
  short sVar10;
  uint uVar15;
  undefined2 uVar16;
  float prox;
  
  pCVar3 = param_1->CharSheet;
  stats = pCVar3->Stats;
  stats_00 = param_2->CharSheet->Stats;
  pTVar4 = pCVar3->weapons;
  pCVar5 = pCVar3->Skills;
  WVar1 = pTVar4->weaponType;
  prox = get_combatEnt_proximity(param_1,param_2);
  if (INT_MAX_f <= prox) {prox-= INT_MAX_f;}
  iVar7 = getModdedStat(stats,INT);
  iVar8 = getModdedStat(stats,DEX);
  iVar9 = getBaseStat(stats,LV);
  bVar2 = pTVar4->hit;
  cVar11 = getModdedWeapon(pCVar5,WVar1);
  cVar12 = getModdedSkill(pCVar5,Warrior);
  uVar15 = (int)((((iVar7 + iVar8 + iVar9) * 0x10000 >> 0x10) +
                 (uint)bVar2 + cVar11 * 6 + cVar12 * 2) * 0x10000) >> 0x10;
  if (6 < ((int)prox & 0xffU)) {
    uVar15 = (int)(((uVar15 & 0xffff) - (((int)prox & 0xffU) - 5)) * 0x10000) >> 0x10;
  }
  iVar7 = getBaseStat(stats_00,LV);
  iVar7 = (uVar15 - iVar7) * 0x10000;
  uVar16 = (undefined2)((uint)iVar7 >> 0x10);
  if (!check_for_petrify_effect(param_2)) {
    iVar8 = getModdedStat(stats_00,DEX);
    iVar9 = get_sheild_warrior_skill(param_2);
    uVar16 = (undefined2)((uint)(((((iVar7 >> 0x10) + iVar8 * -2) * 0x10000 >> 0x10) - iVar9) * 0x10000) >> 0x10);
  }
  iVar7 = theif_backstab_mod(param_1,uVar16,param_5._3_1_,0,0x14);
  if (param_2->unk0x22 == 0) {iVar7 *= 1.2f;}
  if (getModdedStat(stats_00,STAM) == 0) {iVar7 *= 1.15f;}
  iVar8 = func_80070cc4(&combatPointer->substruct,param_3,param_4,get_combatEnt_x(param_1),get_combatEnt_y(param_1));
  iVar8 *= (iVar8 * 0.05f + 1.0f);
  prox = 1.0f;
  iVar7 = getModdedStat(stats,STAM);
  if (iVar7 == 0) {iVar8 *= 0.9f);}
  iVar7 = iVar8 *(prox - TerrainPointer->weatherFloatA * 0.3f));
  if (TerrainPointer->partOfDay == NIGHT) {iVar7 *= 0.7f;}
  if (param_2->unk0x22 != 0) {iVar7 *= 0.8f;}
  sVar10 = func_8006be0c(param_1,some_aspect_multi(param_1,iVar7));
  if (sVar10 < 5) {sVar10 = 5;}
  return sVar10;
}

uint some_combat_weapon_func(CombatEntity *attacker,CombatEntity *target){
  WeaponClassEnum WVar1;
  CharSkills *pCVar2;
  char cVar6;
  undefined uVar7;
  bool bVar8;
  short sVar5;
  uint uVar3;
  int iVar4;
  byte bVar9;
  uint uVar10;
  
  cVar6 = get_combatEnt_x(target);
  uVar7 = get_combatEnt_y(target);
  pCVar2 = attacker->CharSheet->Skills;
  WVar1 = attacker->CharSheet->weapons->weaponType;
  bVar8 = check_for_backstab(attacker,target);
  sVar5 = check_warrior_weapon_night(attacker,target,cVar6,uVar7,(int)bVar8);
  uVar3 = RollD(1,100);
  iVar4 = skillcheck_float(attacker,(short)uVar3,sVar5,Warrior);
  bVar9 = getModdedWeapon(pCVar2,WVar1);
  if (bVar9 < 6) {uVar10 = (uint)(byte)(('\b' - bVar9) * ('\b' - bVar9));}
  else {uVar10 = 5;}
  if (iVar4 < sVar5) {
    sVar5 = some_STR_Theif_check(attacker,sVar5,iVar4,target,0,0);
    if (uVar3 == iVar4) {sprintf(gGlobals.text,combatPointer->textArray->they attack,attacker->CharSheet->name,target->CharSheet->name);}
    else {sprintf(gGlobals.text,combatPointer->textArray->crit attack,attacker->CharSheet->name,target->CharSheet->name);}
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    print_combat_textbox(combatPointer,gGlobals.text,0);
    if ((int)sVar5 == 0) {combat_print_swing_and_miss(attacker,target);}
    else {combat_print_damage(target,sVar5);}
    combat_weapon_skill_check(attacker,uVar10,WVar1);
    uVar3 = (int)sVar5 & 0xffff;
  }
  else {
    combat_weapon_skill_check(attacker,uVar10 >> 1,WVar1);
    combat_print_swing_and_miss(attacker,target);
    uVar3 = 0;
  }
  return uVar3;
}

bool isDispelMagic(char param_1){
  uint uVar1=0;
  byte *pbVar2;
  byte uStack64 [5]={42,43,44,45,0xff}; //dispel magic indecies
  
  pbVar2 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) {return false;}
    if (*pbVar2 == param_1) break;
    uVar1++;
    uStack64[0] = uStack64[uVar1];
    pbVar2 = uStack64 + uVar1;
  }
  return true;
}

bool find_spell_error(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,bool param_4){
  byte bVar2;
  
  if (param_3->target == outside_Combat) {
    if (param_4 == false) {
                    /* spell unavailable */
      sprintf(gGlobals.text,combatPointer->textArray->No Spell Available);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
    }
    param_1->CharSheet->some_rand_val = 0xfe;
  }
  else {
    bVar2 = CheckTargetSpellAspect(param_2->CharSheet,param_3);
    if (bVar2 == 0) {
      bVar2 = check_spell_aspect_tod(param_3);
      if (bVar2 == 0) {return true;}
    }
    print_spell_error(param_1,param_2,bVar2,param_4);
  }
  return false;
}

void combat_spell_fail(CombatEntity *param_1,char *param_2){
  copy_string_to_combat_textbox(combatPointer,param_2,0);
  print_combat_textbox(combatPointer,param_2,0);
  param_1->CharSheet->some_rand_val = 0xfe;
  param_1->CharSheet->spellSwitch = 0;
  clear_combat_substruc2(combatPointer->substruct2 + 1);
}

void combat_textbox_spell(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  sprintf(gGlobals.text,combatPointer->textArray->they cast spell,param_1->CharSheet->name,
              param_3->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  sprintf(gGlobals.text,combatPointer->textArray->spell was cast,param_3->name,
              param_2->CharSheet->name);
  print_combat_textbox(combatPointer,gGlobals.text,0);
}

void combat_print_failed_spell(CombatEntity *param_1){
  sprintf(gGlobals.text,combatPointer->textArray->they failed spell,param_1->CharSheet->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  print_combat_textbox(combatPointer,gGlobals.text,0);
}

void print_spell_cast_resist(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  sprintf(gGlobals.text,combatPointer->textArray->they cast spell,param_1->CharSheet->name,
              param_3->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  sprintf(gGlobals.text,combatPointer->textArray->they resist spell,param_2->CharSheet->name);
  print_combat_textbox(combatPointer,gGlobals.text,0);
}

void print_spell_error(CombatEntity *param_1,undefined4 param_2,int param_3,bool param_4){
  if (param_4 == false) {
    sprintf(gGlobals.text,combatPointer->textArray->(string),spell_error_labels[param_3]);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    print_combat_textbox(combatPointer,gGlobals.text,0);
  }
}

bool IsControlMagic(SpellEnum param_1){
  byte *pbVar1;
  byte uStack64 [5]={4,16,17,27,255};
  
  pbVar1 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) {return false;}
    if (*pbVar1 == param_1) break;
    pbVar1++
    uStack64[0] = *pbVar1;
  }
  return true;
}


bool isPetrify(SpellEnum enum_spell){

  SpellEnum *pSVar1;
  uint uVar2;
  byte petrify_spells[4]={34,53,57,255}; //wall of bones, frozen doom, web of starlight

  uVar2 = 0;
  if (petrify_spells[0] != 255) {
    pSVar1 = petrify_spells;
    do {
      if (*pSVar1 == enum_spell) {return true;}
      uVar2++;
      pSVar1 = petrify_spells + uVar2;
    } while (petrify_spells[uVar2] != 255);
  }
  return false;
}

bool func_8006cbb4(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  CombatEntity *pCVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  
  if (combatPointer->enemy_index == 0xc) {bVar2 = true;}
  else {
    uVar3 = (uint)combatPointer->playerCount;
    uVar4 = 0;
    if (uVar3 < combatPointer->EntCount) {
      do {
        pCVar1 = (&combatPointer->combatEnts)[uVar3];
        if (((pCVar1 != NULL) && (!isDead(pCVar1->CharSheet)))
           && ((!CombatEnt_flag_4(pCVar1) || (!check_for_petrify_effect(pCVar1))))) {
          uVar4++;
        }
        uVar3++;
      } while (uVar3 < combatPointer->EntCount);
    }
    bVar2 = true;
    if (2 < uVar4) {
      print_spell_cast_resist(param_1,param_2,param_3);
      bVar2 = false;
    }
  }
  return bVar2;
}

bool check_for_control_petrify(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,SpellEnum param_4){
  bool ret;

  if (((!IsControlMagic(param_4)) && (!isPetrify(param_4))) ||(CombatEnt_flag_4(param_1))) {ret = true;}
  else {ret = func_8006cbb4(param_1,param_2,param_3);}
  return ret;}

bool check_for_petrify(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,char param_4){
  bool uVar2;
   
  if (!isPetrify(param_4)) {uVar2 = true;}
  else {uVar2 = func_8006cbb4(param_1,param_2,param_3);}
  return uVar2;
}

bool combat_check_spell_ingredient(CombatEntity *param_1,Temp_spell *param_2){
  inv_funcs *piVar1;
  bool bVar4;
  bool bVar5;
  ItemID IVar3;
  ulong uVar2;
  
  bVar4 = CombatEnt_flag_5(param_1);
  bVar5 = true;
  if (((bVar4 == false) && (bVar5 = true, param_1->combat_ai_pointer == NULL)) &&
     (bVar5 = true, param_2->cost != NONE)) {
    IVar3 = get_spell_ingredient(param_2);
    piVar1 = (gGlobals.Party)->Inventory->Functions;
    uVar2 = (*(piVar1->get_some_bool).func)
                      ((int)(gGlobals.Party)->Inventory->inv_slots +
                       (short)(piVar1->get_some_bool).arg[0] + -4,IVar3,1);
    if (uVar2 == 0) {
      combat_spell_fail(param_1,combatPointer->textArray->not enough spell ingredients);
      bVar5 = false;
    }
    else {bVar5 = true;}
  }
  return bVar5;
}

ushort some_aspect_multi_check(CombatEntity *param_1,uint param_2){
  CharStats *stats;
  int iVar1;
  int iVar2;
  ushort uVar3;
  float fVar5;
  float moonfloats [4]={0.5f,0.75f,1.25f,1.5f};
  float dayfloats [5]={0.75f,1.25f,1.25f,0.75f,0.75f};
  
  stats = param_1->CharSheet->Stats;
  iVar1 = getModdedStat(stats,INT);
  iVar2 = getBaseStat(stats,LV);
  if (GetCharAspect(param_1->CharSheet->EXP) == LUNAR) {fVar5 = moonfloats[TerrainPointer->moonPhases];}
  else {fVar5 = dayfloats[TerrainPointer->partOfDay];}
  uVar3 = func_8006be0c(param_1,(short)(int)((float)(iVar1 * 4 + param_2 * 6 + iVar2) * fVar5));
  if (uVar3 < 5) {uVar3 = 5;}
  return uVar3;
}

bool some_spell_ingredient_check
               (CombatEntity *param_1,Temp_spell *param_2,short param_3,short param_4)

{
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  float fVar3;
  int iVar4;
  byte bVar7;
  bool bVar8;
  ItemID IVar6;
  uint uVar5;
  bool bVar9;
  float fVar10;
  
  bVar9 = false;
  if (param_2->level < 4) {
    iVar4 = 5 - (uint)param_2->level;
    uVar5 = iVar4 * iVar4;
  }
  else {uVar5 = 3;}
  if (param_3 < param_4) {
    bVar7 = some_skillcheck_calc(((int)param_4 - (int)param_3) * 0x10000 >> 0x10);
    pCVar1 = param_1->CharSheet;
    bVar9 = true;
  }
  else {
    if ((!CombatEnt_flag_5(param_1)) && (param_2->cost != NONE)) {
      IVar6 = get_spell_ingredient(param_2);
      piVar2 = (gGlobals.Party)->Inventory->Functions;
      (*(piVar2->add_to_inv).func)
                ((int)(gGlobals.Party)->Inventory->inv_slots +
                 (short)(piVar2->add_to_inv).arg[0] + -4,IVar6,1);
    }
    combat_print_failed_spell(param_1);
    uVar5 = uVar5 >> 1;
    pCVar1 = param_1->CharSheet;
    bVar7 = 0xff;
  }
  fVar3 = INT_MAX_f;
  fVar10 = (float)uVar5 * 0.1f;
  bVar8 = INT_MAX_f <= fVar10;
  pCVar1->some_rand_val = bVar7;
  if (bVar8) {fVar10 -= fVar3;}
  if (RollD(1,100) <= ((int)fVar10 & 0xffU)) {
    uVar5 = param_2->level + 1;
    if (10 < uVar5) {uVar5 = 10;}
    param_2->level = (byte)uVar5;
  }
  return bVar9;
}


bool check_spell_wizard_combat(CombatEntity *param_1,Temp_spell *param_2,bool param_3){
  uint LV;
  bool bVar4;
  uint uVar1;
  short sVar3;
  int iVar2;
  
  if (param_3 == false) {LV = check_spell_wizard(param_1->CharSheet,param_2);}
  else {LV = (uint)param_2->level;}
  if (combat_check_spell_ingredient(param_1,param_2)) {
    uVar1 = spell_stamina_subtract(param_2,(byte)LV);
    if (Test_equip_Stamina(param_1->CharSheet,(short)uVar1)) {
      sVar3 = some_aspect_multi_check(param_1,LV);
      iVar2 = skillcheck_float(param_1,(short)RollD(1,100),sVar3,Wizard);
      bVar4 = some_spell_ingredient_check(param_1,param_2,(short)iVar2,sVar3);
      return bVar4;
    }
    combat_spell_fail(param_1,combatPointer->textArray->not enough Stam for Spell);
  }
  return false;
}

bool func_using_spell_charges(CombatEntity *param_1,Temp_spell *param_2,bool param_3){
  bool bVar2;
  byte bVar3;
  uint uVar1;
  
  bVar3 = param_1->CharSheet->spellSwitch;
  if (CombatEnt_flag_0(param_1)) {return true;}
  if (param_3 == false) {
    if (bVar3 == 1) {
      if (check_spell_wizard_combat(param_1,param_2,false) == false) {return false;}
      goto LAB_8006d340;
    }
    if (some_equip_spell_charges(param_1->CharSheet) == 0) {
      sprintf(gGlobals.text,combatPointer->textArray->they failed spell,param_1->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      param_1->CharSheet->some_rand_val = 0xfe;
      param_1->CharSheet->spellSwitch = 0;
      clear_combat_substruc2(combatPointer->substruct2 + 1);
      return false;
    }
    dec_item_spell_uses(param_1->CharSheet);
  }
  param_1->CharSheet->some_rand_val = some_skillcheck_calc((short)RollD(1,100););;
LAB_8006d340:
  CombatEnt_OR_flags(param_1,flag1);
  return true;
}

bool some_magic_check(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3){
  SpellEnum bVar3;
  bool bVar1;
  bool bVar2;
  
  bVar3 = GetIDIndex(param_2->id);
  if ((bVar3 != wallOfBones) ||
     (bVar2 = false, param_3->CharSheet->ID != (ItemID)(entityList[170] + 0x200))) {//marquis
    bVar1 = isDispelMagic(bVar3);
    bVar2 = false;
    if (bVar1 == false) {
      if (bVar3 == teleportation) {bVar2 = false;}
      else {
        bVar2 = true;
        if ((param_2->target != Enemy_in_Area) && (bVar2 = true, (param_2->aspect_flag & 0x10) == 0)
           ) {
          if (bVar3 == wind) {bVar2 = CombatEnt_flag_4(param_3) != CombatEnt_flag_4(param_1);}
          else {bVar2 = false;}
        }
      }
    }
  }
  return bVar2;
}

bool func_checking_vs_magic(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3,char *param_4){
  byte bVar1;
  CharStats *stats;
  int lVar2;
  int iVar3;
  uint uVar6;
  AspectEnum AVar7;
  AspectEnum AVar8;
  bool bVar9;
  CharSheet *pCVar10;
  float fVar11;
  
// no TP with Shadow present
  if ((param_2->id == (ItemID)(SpellList[12] + 0x300)) && (gGlobals.ShadowIndex != -1)) {
    combat_print_failed_spell(param_1);
    return false;
  }
  if (!some_magic_check(param_1,param_2,param_3)) {return true;}
  stats = param_3->CharSheet->Stats;
  iVar3 = (getModdedStat(stats,WIL) * 3 + getModdedStat(stats,END) + getBaseStat(stats,LV)) * 0x10000 >> 0x10;
  uVar6 = check_vs_magic(param_3,param_2);
  if ((uVar6 & 0xffff) != 0) {
    iVar3 = (int)(((uVar6 & 0xffff) + iVar3) * 0x10000) >> 0x10;
  }
  if ((param_2->aspect_flag & 2) == 0) {
    if ((param_2->aspect_flag & 1) == 0) goto LAB_8006d5ac;
    pCVar10 = param_3->CharSheet;
  }
  else {pCVar10 = param_3->CharSheet;}
  fVar11 = 0.75f;
  if (GetCharAspect(pCVar10->EXP) != GetCharAspect(param_1->CharSheet->EXP)) {fVar11 = 1.25f;}
  iVar3 *= fVar11;
LAB_8006d5ac:
  uVar6 = RollD(1,100);
  bVar9 = true;
  if ((short)uVar6 <= iVar3) {
    lVar2 = some_skillcheck_calc((iVar3 - (short)uVar6) * 0x10000 >> 0x10);
    pCVar10 = param_1->CharSheet;
    if (lVar2 < pCVar10->some_rand_val) {
      if (param_3->unk0x28 != 0) {
        iVar3 = ((int)(char)pCVar10->some_rand_val - lVar2) * 0x10000;
        if (iVar3 >> 0x10 < param_3->unk0x28) {param_3->unk0x28-= (char)((uint)iVar3 >> 0x10);}
        else {param_3->unk0x28 = 0;}
        lVar2 = param_1->CharSheet->some_rand_val;
        pCVar10 = param_1->CharSheet;
      }
      bVar1 = pCVar10->some_rand_val;
    }
    else {bVar1 = pCVar10->some_rand_val;}
    bVar9 = true;
    if (lVar2 < (char)bVar1) {*param_4 -= (char)lVar2;}
    else {
      print_spell_cast_resist(param_1,param_3,param_2);
      bVar9 = false;
    }
  }
  return bVar9;
}


byte banishing_func(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  combat_textbox_spell(param_1,param_2,param_3);
  sprintf(gGlobals.text,combatPointer->textArray->theyre banished,param_2->CharSheet->name);
  copy_to_combat_textbox_2(combatPointer,gGlobals.text,4);
  return getHPCurrent(param_2->CharSheet);
}

int dispel_magic_combat(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,
                       SpellEnum param_4,byte param_5){
  if (!dispel_magic(param_2->CharSheet,(char)param_2,param_4,param_5)) {
    sprintf(gGlobals.text,combatPointer->textArray->they cast spell,param_1->CharSheet->name,param_3->name);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    sprintf(gGlobals.text,combatPointer->textArray->they fail,param_3->name);
    print_combat_textbox(combatPointer,gGlobals.text,0);
  }
  else {combat_textbox_spell(param_1,param_2,param_3);}
  return -1;
}


int func_8006d7d8(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,SpellEnum param_4,
                undefined1 param_5,byte param_6){
  int uVar1;
  
  combat_textbox_spell(param_1,param_2,param_3);
  if (CombatEnt_flag_4(param_2) == CombatEnt_flag_4(param_1)) {
    malloc_enchant(param_2->CharSheet,param_4,(uint)param_6,param_5,
                   ((uint)param_6 * 0xe0 + (uint)param_6) * 8,1);
    uVar1 = -1;
  }
  else {uVar1 = param_3->damage;}
  return uVar1;
}

int calc_spell_damage_(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3,uint param_4,undefined1 param_5){
  SpellEnum SVar3;
  byte bVar4;
  int iVar2;
  bool bVar5;
  longlong lVar1;
  uint Level;
  
  Level = param_4 & 0xff;
  SVar3 = GetIDIndex(param_2->id);
  if (SVar3 == banishing) {
    bVar4 = banishing_func(param_1,param_3,param_2);
    iVar2 = (int)(char)bVar4 << 0x10;
  }
  else {
    if (!isDispelMagic(SVar3)) {
      if ((!check_for_control_petrify(param_1,param_3,param_2,SVar3)) ||
         (!check_for_petrify(param_1,param_3,param_2,SVar3))) {
        return 0;
      }
      if ((param_2->damage == 0) || (lVar1 = func_80083ff4(param_2), lVar1 != 0)) {
        param_3->damage = 0;
        param_3->unk0x2a = 0;
        ApplySpellEffect(param_3->CharSheet,SVar3,Level,Level * 0x708,param_5,param_3);
        if (SVar3 == tapStamina) {
          malloc_enchant(param_1->CharSheet,tapStamina,Level,0,Level * 0x708,0);
        }
        combat_textbox_spell(param_1,param_3,param_2);
        return 0xffffffff;
      }
      if (param_2->damage == 5) {
        combat_textbox_spell(param_1,param_3,param_2);
        return Level;
      }
      if (SVar3 != wind) {
        combat_textbox_spell(param_1,param_3,param_2);
        return (int)param_2->damage;
      }
      iVar2 = func_8006d7d8(param_1,param_3,param_2,0xb,param_5,(char)Level);
      iVar2 = iVar2 << 0x10;
    }
    else {
      iVar2 = dispel_magic_combat(param_1,param_3,param_2,SVar3,param_5);
      iVar2 = iVar2 << 0x10;
    }
  }
  return (uint)(iVar2 >> 0x10);
}

short magic_damage_resist_calc(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,bool param_4){
  bool bVar4;
  uint uVar1;
  int iVar2;
  short sVar3;
  byte abStack32 [32];
  
  noop_80070658();
  sVar3 = -2;
  if (find_spell_error(param_1,param_2,param_3,param_4)) {
    if (param_4 == false) {uVar1 = check_spell_wizard(param_1->CharSheet,param_3);}
    else {uVar1 = (uint)param_3->level;}
    bVar4 = func_using_spell_charges(param_1,param_3,param_4);
    if (bVar4 == false) {sVar3 = -2;}
    else {
      abStack32[0] = param_1->CharSheet->some_rand_val;
      bVar4 = func_checking_vs_magic(param_1,param_3,param_2,(char *)abStack32);
      if (bVar4 == false) {sVar3 = -1;}
      else {
        iVar2 = calc_spell_damage_(param_1,param_3,param_2,uVar1,abStack32[0]);
        if (iVar2 < 0) {sVar3 = -3;}
        else {
          uVar1 = RollD(abStack32[0] + (char)iVar2,6);
          sVar3 = func_calcing_magic_resist(param_2,(short)uVar1,param_3);
        }
      }
    }
  }
  return sVar3;
}

short func_calcing_magic_resist(CombatEntity *param_1,short param_2,Temp_spell *param_3){
  combat_ai *pcVar1;
  float fVar3;
  float afStack32;
  
  fVar3 = 0.0;
  afStack32 = 0.0;
  if (magic_resist_element_checks(param_1,param_3,&afStack32)) {
    param_2 *= afStack32);
    if ((afStack32 != fVar3) && (param_2 < 1)) {param_2 = 1;}
    if (((1.0f < afStack32) &&
        (pcVar1 = param_1->combat_ai_pointer, pcVar1 != NULL)) &&
       ((pcVar1->unk0x9 & 8) != 0)) {
      pcVar1->unk0x9 = pcVar1->unk0x9 | 0x12;
    }
  }
  return param_2;
}

void func_8006dc78(CombatEntity *param_1){
  inv_funcs *piVar1;
  
  if (param_1->combat_ai_pointer == NULL) {
    piVar1 = (gGlobals.Party)->Inventory->Functions;
    (*(piVar1->get_some_bool).func)
              ((int)(gGlobals.Party)->Inventory->inv_slots +
               (short)(piVar1->get_some_bool).arg[0] + -4,param_1->item | 0x1000,1);
    func_looking_for_flask(param_1);
  }
  return;
}


void func_8006dcd8(uint param_1,PotionEnum param_2,CharSheet *param_3){
  playerData *ppVar1;
  Potion_effect *pPVar2;
  undefined4 uVar3;
  uint uVar4;
  
  ppVar1 = gGlobals.playerDataArray[param_1];
  if (ppVar1 != NULL) {
    ppVar1->ani_type = 5;
    uVar3 = func_800941e8(ppVar1,param_2);
    uVar4 = 0;
    pPVar2 = *param_3->potion_effects;
    while (((pPVar2 == NULL || (pPVar2->ID != param_2)) || (pPVar2->unk2 != 0xffff))) {
      uVar4++;
      if (6 < uVar4) {return;}
      pPVar2 = param_3->potion_effects[uVar4];
    }
    pPVar2->unk2 = uVar3;
  }
  return;
}


void combat_potion_heal(CombatEntity *param_1,CombatEntity *param_2,ushort HI,ushort Lo){
  ushort uVar1;
  
  uVar1 = potion_heal(param_1->CharSheet,HI,Lo);
  if (uVar1 == 0) {
    sprintf(gGlobals.text,combatPointer->textArray->potion failed,param_1->CharSheet->name);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    print_combat_textbox(combatPointer,gGlobals.text,0);
  }
  else {
    func_8006dcd8((uint)param_1->index,param_1->item,param_1->CharSheet);
    combat_print_HP_gained(param_2,uVar1);
    copy_to_textbox_1(combatPointer);
  }
  return;
}

bool combat_potion_effects(CombatEntity *param_1,CombatEntity *param_2){
  PotionEnum PVar1;

  PVar1 = param_1->item;
  if (PVar1 < STRENGTH) {
    if (PVar1 == HEALING) {
      combat_potion_heal(param_1,param_2,0xf,0x19);
      return true;
    }
    if (PVar1 == CURING) {
      combat_potion_heal(param_1,param_2,0x28,0x3c);
      return true;
    }
    if (PVar1 == STAMINA) {
      clear_exhaustion(param_1->CharSheet);
      sprintf(gGlobals.text,combatPointer->textArray->potion full stamina,
                  param_1->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      func_8006dcd8((uint)param_1->index,param_1->item,param_1->CharSheet);
      return true;
    }
    if (PVar1 == ANTIDOTE) {
      ApplySpellEffect(param_1->CharSheet,removePoison,0,0,0xff,param_1);
      sprintf(gGlobals.text,combatPointer->textArray->potion worked,param_1->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      func_8006dcd8((uint)param_1->index,param_1->item,param_1->CharSheet);
      return true;
    }
    if (PVar1 != RESTORE) {return false;}
    clear_debuff_spells(param_1->CharSheet);
    func_8006dcd8((uint)param_1->index,param_1->item,param_1->CharSheet);
    sprintf(gGlobals.text,combatPointer->textArray->potion worked,param_1->CharSheet->name);
  }
  else {
    if (!has_potion_effect(param_1->CharSheet,PVar1)) {
      Buffing_potion_effect(param_1->CharSheet,param_1->item,0,0x9e340);
      sprintf(gGlobals.text,combatPointer->textArray->potion worked,param_1->CharSheet->name);
      func_8006dcd8((uint)param_1->index,param_1->item,param_1->CharSheet);
    }
    else {
      sprintf(gGlobals.text,combatPointer->textArray->potion already used,
                  param_1->CharSheet->name);
    }
  }
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  print_combat_textbox(combatPointer,gGlobals.text,0);
  return true;
}

short Warrior_thrown_check(CombatEntity *param_1,CombatEntity *param_2,byte param_3)

{
  u8 uVar1;
  CharStats *stats;
  CharStats *stats_00;
  CharSkills *pCVar2;
  int iVar5;
  int iVar6;
  int iVar7;
  char cVar12;
  char cVar13;
  int iVar8;
  int iVar9;
  uint uVar10;
  bool backstab;
  short sVar11;
  undefined2 uVar14;
  
  stats = param_1->CharSheet->Stats;
  stats_00 = param_2->CharSheet->Stats;
  pCVar2 = param_1->CharSheet->Skills;
  iVar5 = getModdedStat(stats,INT);
  iVar6 = getModdedStat(stats,DEX);
  iVar7 = getBaseStat(stats,LV);
  cVar12 = getModdedWeapon(pCVar2,Thrown);
  cVar13 = getModdedSkill(pCVar2,Warrior);
  iVar8 = getModdedStat(stats_00,DEX);
  iVar9 = getBaseStat(stats_00,LV);
  uVar10 = get_sheild_warrior_skill(param_2);
  iVar5 = (((((iVar5 + iVar6 + iVar7) * 0x10000 >> 0x10) + cVar12 * 6 + cVar13 * 2 + 0x28) * 0x10000
           >> 0x10) - ((uVar10 >> 1 & 0xff) + iVar8 + iVar9)) * 0x10000;
  uVar14 = (undefined2)((uint)iVar5 >> 0x10);
  if (6 < param_3) {
    uVar14 = (undefined2)(((iVar5 >> 0x10 & 0xffffU) - (param_3 - 5)) * 0x10000 >> 0x10);
  }
  backstab = check_for_backstab(param_1,param_2);
  iVar5 = theif_backstab_mod(param_1,uVar14,backstab,0,0x14);
  iVar6 = getModdedStat(stats_00,STAM);
  if (iVar6 == 0) {
    iVar5 = (iVar5 + 10) * 0x10000 >> 0x10;
    uVar1 = param_2->unk0x22;
  }
  else {
    uVar1 = param_2->unk0x22;
  }
  if (uVar1 != 0) {
    iVar5 = (iVar5 + -0x14) * 0x10000 >> 0x10;
  }
  sVar11 = (short)iVar5;
  if (CombatEnt_flag_3(param_1)) {
    sVar11 = (short)((uint)((iVar5 + -0x19) * 0x10000) >> 0x10);
  }
  iVar5 = some_night_check(param_1,sVar11,0x14,10,0x1e,(ushort)param_3);
  sVar11 = func_8006be0c(param_1,some_aspect_multi(param_1,iVar5));
  if (sVar11 < 5) {sVar11 = 5;}
  return sVar11;
}


void combat_print_swing_miss_2(CombatEntity *param_1,CombatEntity *param_2,uint param_3){
  playerData *ppVar1;
  float fVar2;
  
  ppVar1 = gGlobals.playerDataArray[param_2->index];
  copyVec3((vec3 *)(ppVar1->collision).position,(vec3 *)gGlobals.unk0x1434);
  fVar2 = get_entity_2float_sum(param_2->CharSheet->ID);
  gGlobals.unk0x1434[1] =
       gGlobals.unk0x1434[1] + (fVar2 * 0.5f - (ppVar1->collision).radius);
  combat_weapon_skill_check(param_1,(param_3 & 0xff) >> 1,Thrown);
  gGlobals.playerDataArray[param_1->index]->ani_type = 0xf;
  func_8006dc78(param_1);
  sprintf(gGlobals.text,combatPointer->textArray->they attack,param_1->CharSheet->name,
              param_2->CharSheet->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  sprintf(gGlobals.text,combatPointer->textArray->they miss_,param_1->CharSheet->name);
  print_combat_textbox(combatPointer,gGlobals.text,0);
  return;
}

void NOOP_8006E430(void){}

undefined2 some_rolld_func(CombatEntity *param_1){
  uint auStack136 [16];
  ushort uStack72;
  ushort uStack68_00;
  ushort uStack68;
  uint uStack68_01;
  
  uStack72 = RollD(4,6);
  _uStack72 = RollD(8,6) | (uint)uStack72 << 0x10;
  uStack68_00 = 0xf;
  uStack68_01 = RollD(2,6) | (uint)uStack68_00 << 0x10;
  auStack136[0] = _uStack72;
  auStack136[1] = uStack68_01;
  return *(undefined2 *)((int)auStack136 + (uint)param_1->item * 2);
}

void func_8006e4c0(CombatEntity *param_1,CombatEntity *param_2,short param_3){
  byte A;
  byte B;
  CombatEntity *pCVar1;
  playerData *ppVar2;
  uint uVar3;
  bool bVar9;
  ushort uVar7;
  short sVar8;
  int iVar4;
  int iVar5;
  uint uVar6;
  ulonglong uVar10;
  ulonglong uVar11;
  byte bStack48;
  byte abStack47 [47];
  
  uVar11 = 0;
  A = combatPointer->unk0x5444[0];
  B = combatPointer->unk0x5444[1];
  if (param_1->item == ACID) {
    uVar3 = RollD(2,6);
    uVar11 = (longlong)(int)uVar3 & 0xff;
  }
  uVar3 = 0;
  if (combatPointer->EntCount != 0) {
    do {
      pCVar1 = (&combatPointer->combatEnts)[uVar3];
      if ((pCVar1 != NULL) && (bVar9 = isDead(pCVar1->CharSheet), bVar9 == false)) {
        bStack48 = 0;
        abStack47[0] = 0;
        get_combatEnt_x_y(pCVar1,&bStack48,abStack47);
        uVar7 = sub_square_add_(A,B,bStack48,abStack47[0]);
        uVar10 = 1;
        if (1 < (uVar7 & 0xff)) {
          sVar8 = sub_square_add_(A,B,bStack48,abStack47[0]);
          uVar10 = (longlong)sVar8 & 0xff;
        }
        if ((param_1->item == ACID) && (uVar10 <= uVar11)) {
          if (uVar10 == 0) {trap(7);}
          Buffing_potion_effect(pCVar1->CharSheet,ACID,(char)((uint)uVar11 / (uint)uVar10),0x9e340);
          func_8006dcd8((uint)pCVar1->index,param_1->item,pCVar1->CharSheet);
        }
        else {
          if (uVar10 <= param_3) {
            iVar5 = param_3 / uVar10;
            if (uVar10 == 0) {trap(7);}
            if (pCVar1 == param_2) {
              combat_print_damage(pCVar1,(short)iVar5);
            }
            if (param_1->item == SLEEP) {
              if ((pCVar1 != param_2) &&
                 (iVar4 = getModdedStat(pCVar1->CharSheet->Stats,STAM), iVar4 <= iVar5)) {
                iVar5 = getModdedStat(pCVar1->CharSheet->Stats,STAM);
                iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
              }
              if (iVar5 < 1) {pCVar1->damage = (byte)iVar5;}
              else {
                damage_func(pCVar1->CharSheet,(short)iVar5);
                func_8006dcd8((uint)pCVar1->index,param_1->item,pCVar1->CharSheet);
                pCVar1->damage = (byte)iVar5;
              }
            }
            else {
              if ((pCVar1 != param_2) &&
                 (getHPCurrent(pCVar1->CharSheet) <= iVar5)) {
                iVar5 = (int)((getHPCurrent(pCVar1->CharSheet) - 1) * 0x10000) >> 0x10;
              }
              if (0 < iVar5) {
                func_checking_cheat_death(pCVar1->CharSheet,(short)iVar5,pCVar1);
                func_8006dcd8((uint)pCVar1->index,param_1->item,pCVar1->CharSheet);
              }
              pCVar1->damage = (byte)iVar5;
            }
            if (pCVar1 == param_2) {checkForCheatDeath(pCVar1,(short)iVar5);}
            ppVar2 = gGlobals.playerDataArray[pCVar1->index];
            if ((ppVar2 != NULL) && (ppVar2->ani_type = 7, pCVar1 != param_2)) {
              gamecombat_actor_func(ppVar2,(ushort)pCVar1->damage,0,false,pCVar1->CharSheet);
              pCVar1->damage = 0;
            }
          }
        }
      }
      uVar3++;
    } while (uVar3 < combatPointer->EntCount);
  }
  return;
}
byte func_8006e7c8(CombatEntity *param_1,CombatEntity *param_2){
  CharSkills *pCVar1;
  bool bVar5;
  short sVar4;
  uint uVar2;
  int iVar3;
  byte bVar6;
  Borg_9_data *pBVar7;
  float fVar8;
  byte bStack176 [8];
  vec3 afStack168;
  vec3 afStack104;
  
  bVar5 = combat_potion_effects(param_1,param_2);
  if (bVar5 == false) {
    pCVar1 = param_1->CharSheet->Skills;
    get_combatEnt_x_y(param_2,bStack176,bStack176 + 1);
    fVar8 = get_combatEnt_proximity(param_1,param_2);
    if (INT_MAX_f <= fVar8) {fVar8-= INT_MAX_f;}
    sVar4 = Warrior_thrown_check(param_1,param_2,(char)(int)fVar8);
    uVar2 = RollD(1,100);
    iVar3 = skillcheck_float(param_1,(short)uVar2,sVar4,Warrior);
    bVar6 = getModdedWeapon(pCVar1,Thrown);
    if (bVar6 < 6) {uVar2 = (uint)(byte)(('\b' - bVar6) * ('\b' - bVar6));}
    else {uVar2 = 5;}
    if (sVar4 <= iVar3) {
      combat_print_swing_miss_2(param_1,param_2,uVar2);
      return 0;
    }
    NOOP_8006E430();
    pBVar7 = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
    setVec3((vec3 *)afStack168,(float)(uint)bStack176[0],50.0,(float)(uint)bStack176[1]);
    setVec3((vec3 *)afStack104,(float)(uint)bStack176[0],-10.0,(float)(uint)bStack176[1]);
    bVar5 = func_800adf78(pBVar7,(vec3 *)afStack168,(vec3 *)afStack104,0.5,
                         (vec3 *)gGlobals.unk0x1434,NULL,0);
    if (bVar5 == false) {
      setVec3((vec3 *)gGlobals.unk0x1434,(float)(uint)bStack176[0],0.0,(float)(uint)bStack176[1]);
    }
    bVar6 = some_rolld_func(param_1);
    sprintf(gGlobals.text,combatPointer->textArray->they attack,param_1->CharSheet->name,
                param_2->CharSheet->name);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    print_combat_textbox(combatPointer,gGlobals.text,0);
    combatPointer->unk0x5444[0] = bStack176[0];
    combatPointer->unk0x5444[1] = bStack176[1];
    param_1->damage = bVar6;
    combat_weapon_skill_check(param_1,uVar2,Thrown);
    gGlobals.playerDataArray[param_1->index]->ani_type = 0xf;
  }
  func_8006dc78(param_1);
  return 0;
}

u8 user_target_in_party(CombatEntity *param_1,CombatEntity *param_2,playerData * param_3){
  uint uVar1;
  s8 sVar3;
  byte bVar4;
  uint uVar2;
  u8 uVar5;
  
  uVar1 = getHPCurrent(param_2->CharSheet);
  sVar3 = find_ent_in_Party(gGlobals.Party,param_1->CharSheet->ID);
  bVar4 = find_ent_in_Party(gGlobals.Party,param_2->CharSheet->ID);
  if ((sVar3 != 0xff) && ((bVar4 != 0xff)) {
    uVar5 = sVar3;
    if ((param_1->flags & flag9) == 0) {pass_to_party_healing_func(gGlobals.Party,(uint)uVar5,(int)(char)bVar4 & 0xff);}
    else {pass_to_healing_func_2(gGlobals.Party,(byte)uVar5,bVar4);}
    if ((int)uVar1 < (int)getHPCurrent(param_2->CharSheet)) {
      uVar2 = getHPCurrent(param_2->CharSheet);
      sprintf(gGlobals.text,combatPointer->textArray->they heal,param_1->CharSheet->name,
                  param_2->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      combat_print_HP_gained(param_2,(short)((uVar2 - uVar1) * 0x10000 >> 0x10));
      param_3->ani_type = 5;
      param_2->unk0x2a = (byte)(uVar2 - uVar1);
    }
    else {
      sprintf(gGlobals.text,combatPointer->textArray->they failed heal,param_1->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
    }
  }
  return 0;
}

byte func_8006ec94(CombatEntity *param_1,CombatEntity *param_2,playerData *param_3){
  byte bVar1;
  bool bVar2;
  bool bVar4;
  byte bVar5;
  short sVar3;
  
  bVar5 = 0;
  bVar2 = true;
  bVar1 = param_1->rangeMulti;
  if (bVar1 != 2) {
    if (bVar1 < 3) {
      if (bVar1 == 1) {bVar5 = calc_attack_or_crit(param_1,param_2);}
      else {bVar2 = false;}
      goto LAB_8006ed7c;
    }
    if (bVar1 == 3) {
      bVar5 = func_8006e7c8(param_1,param_2);
      bVar2 = false;
      goto LAB_8006ed7c;
    }
    if (bVar1 != 4) {
      bVar2 = false;
      goto LAB_8006ed7c;
    }
    param_1->rangeMulti = 1;
    bVar4 = func_checking_shadow(param_1,param_2,0);
    if (bVar4 != false) {
      bVar5 = calc_attack_or_crit(param_1,param_2);
      param_1->rangeMulti = 4;
      goto LAB_8006ed7c;
    }
    param_1->rangeMulti = 4;
  }
  bVar5 = some_combat_weapon_func(param_1,param_2);
LAB_8006ed7c:
  if (bVar2) {param_3->ani_type = get_weapon_animation(param_1,param_1->CharSheet->weapons->animation);}
  return bVar5;
}

void set_movement_spellUsed(playerData *param_1,ushort param_2,ushort param_3){
  param_1->movement_ = param_2;
  param_1->spellUsed = param_3;}

int func_8006edd0(CombatEntity *param_1,CombatEntity *param_2,playerData *param_3,playerData *param_4){
  Temp_enchant *pTVar1;
  Temp_spell *pTVar2;
  short sVar4;
  SpellEnum SVar5;
  undefined4 uVar3;
  int iVar6;
  uint uVar7;
  longlong lVar8;
  longlong lVar9;
  
  pTVar2 = passto_getSpell(param_1->CharSheet);
  if (pTVar2 == (Temp_spell *)0x0) {return 0;}
  sVar4 = magic_damage_resist_calc(param_1,param_2,pTVar2,false);
  lVar9 = (longlong)sVar4;
  if (lVar9 == 0) {print_spell_cast_resist(param_2,param_2,pTVar2);}
  lVar8 = lVar9;
  if (lVar9 == 0xfffd) {lVar8 = 0;}
  if (lVar8 == 0xffff) {
    lVar9 = -1;
    lVar8 = 0;
  }
  if (lVar8 == 0xfffe) {
    lVar9 = -2;
    lVar8 = 0;
  }
  param_3->ani_type = 5;
  SVar5 = GetIDIndex(pTVar2->id);
  set_movement_spellUsed(param_3,param_3->ani_type,(short)(char)SVar5);
  uVar3 = func_80095c04(param_3,param_4,SVar5,lVar9);
  if ((lVar8 != 0) || (iVar6 = 0, lVar9 == 0xfffd)) {
    lVar9 = func_80083ff4(pTVar2);
    iVar6 = (int)lVar8 << 0x10;
    if (lVar9 != 0) {
      pTVar1 = param_2->CharSheet->effects->list[0];
      if (pTVar1 == (Temp_enchant *)0x0) {uVar7 = 1;}
      else {
        if (pTVar1->index == (char)SVar5) {
          if (pTVar1->unk0x14 == 0xffff) {
            pTVar1->unk0x14 = uVar3;
            goto LAB_8006ef64;
          }
          uVar7 = 1;
        }
        else {uVar7 = 1;}
      }
      while (uVar7 < 0xf) {
        pTVar1 = param_2->CharSheet->effects->list[uVar7];
        if (pTVar1 == (Temp_enchant *)0x0) {uVar7++;}
        else {
          if (pTVar1->index == SVar5) {
            if (pTVar1->unk0x14 == 0xffff) {
              pTVar1->unk0x14 = uVar3;
              break;
            }
            uVar7++;
          }
          else {uVar7++;}
        }
      }
    }
  }
LAB_8006ef64:
  return iVar6 >> 0x10;
}


short tick_goblin_ambush(CombatEntity *param_1,CombatEntity *param_2,short param_3){
  CharSheet *pCVar1;
  int iVar2;
  short sVar3;
  
  sVar3 = 0;
                    /* alaron target? */
  if (((param_3 != 0) &&
      (pCVar1 = param_2->CharSheet, sVar3 = param_3, pCVar1->ID == (ItemID)(entityList[153] | 0x200)))
      && (combatPointer->encounter_dat->EncounterID == FLAG_GoblinAmbush)) {
    combat_print_damage(param_2,1);
    gGlobals.GoblinHitTally--;
    sVar3 = 1;
    if (gGlobals.GoblinHitTally == 0) {
      iVar2 = getModdedStat(pCVar1->Stats,STR);
      addModdedStat(pCVar1->Stats,STR,-(char)iVar2);
      check_petrify_int_dex_wil_str(param_2);
      sVar3 = 1;
    }
  }
  return sVar3;
}


void checkForCheatDeath(CombatEntity *param_1,short param_2){
  if (getHPCurrent(param_1->CharSheet) <= param_2) {
    if (!hasCheatDeath(param_1->CharSheet)) {
      sprintf(gGlobals.text,combatPointer->textArray->they died,param_1->CharSheet->name);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      func_seeking_sholeh(param_1);
    }
    else {
      sprintf(gGlobals.text,combatPointer->textArray->Cheated Death,param_1->CharSheet->name);
      print_combat_textbox(combatPointer,gGlobals.text,0);
    }
  }
  return;
}


bool some_attack_calc(CombatEntity *user,CombatEntity *target,u8 param_3){
  byte bVar1;
  playerData *ppVar2;
  playerData *ppVar3;
  bool bVar7;
  undefined2 uVar5;
  short sVar6;
  
  ppVar2 = gGlobals.playerDataArray[user->index];
  ppVar3 = gGlobals.playerDataArray[target->index];
  if (!CombatEnt_flag_2(user)) {bVar1 = target->index;}
  else {
    func_8006f2cc(user);
    bVar1 = target->index;
  }
  user->unk0x10 = (uint)bVar1;
  if (param_3 == 0) {
    clear_substruct2_arrayB(combatPointer->substruct2);
    uVar5 = func_8006edd0(user,target,ppVar2,ppVar3);
  }
  else {
    clear_substruct2_arrayB(combatPointer->substruct2 + 1);
    if (CombatEnt_flag_check(user) == false) {uVar5 = func_8006ec94(user,target,ppVar2);}
    else {uVar5 = user_target_in_party(user,target,ppVar2);}
  }
  playerdata_NAND_flags(ppVar2,2);
  sVar6 = tick_goblin_ambush(user,target,uVar5);
  checkForCheatDeath(target,sVar6);
  user->unk0x22 = 1;
  if (user->rangeMulti != 3) {target->damage = (byte)sVar6;}
  set_camera_playerdata_focus(ppVar2,ppVar3);
  gGlobals.combatBytes[0] = 2;
  gGlobals.combatBytes[1] = 2;
  set_combatflag_42(1);
  return sVar6 != 0;
}

void func_8006f2cc(CombatEntity *param_1){
  CombatEnt_NAND_flags(param_1,flag3);
  combatPointer->unk0x13 = 0;
  if (gGlobals.playerDataArray[param_1->index] != NULL) {
    FreeAttachmentFromPlayer(gGlobals.playerDataArray[param_1->index],2);
  }
  return;
}

void check_petrify_int_dex_wil_str(CombatEntity *param_1){
  bool bVar2;
  
  bVar2 = check_for_petrify_effect(param_1);
  if ((((getModdedStat(param_1->CharSheet->Stats,INT) == 0) || (getModdedStat(param_1->CharSheet->Stats,WIL) == 0)) ||
      (getModdedStat(param_1->CharSheet->Stats,DEX) == 0)) ||
     ((getModdedStat(param_1->CharSheet->Stats,STR) == 0 || (bVar2)))) {
    CombatEnt_NAND_flags(param_1,flag2);
  }
  else {CombatEnt_OR_flags(param_1,flag2);}
  return;
}

void rand_wonky_troub_check(CombatEntity *param_1,byte param_2){
  if (RollD(1,100) <= (param_2 / 10)) {wonky_baseskill_check(param_1->CharSheet->Skills,Troubadour,1);}}

void func_8006f448(CombatEntity *param_1){
  playerData *ppVar1;
  vec3 afStack80;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1 != NULL) {
    setVec3((vec3 *)afStack80,param_1->coord[0],(ppVar1->collision).position[1],param_1->coord[1]);
    combat_set_playerdata_floats(ppVar1,(vec3 *)afStack80,(float)param_1->move_length);
  }
}

void combat_troubadour(CombatEntity *param_1){
  CombatEntity *pCVar1;
  playerData *ppVar2;
  bool bVar4;
  int iVar3;
  char cVar5;
  byte bVar6;
  short sVar7;
  uint uVar8;
  uint uVar9;
  
  if (combatPointer->unk0x13 == 0) {
    if (getModdedStat(param_1->CharSheet->Stats,STAM) == 0) {
      sprintf(gGlobals.text,combatPointer->textArray->too tired to perform,
                  param_1->CharSheet->name);
      copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
      print_combat_textbox(combatPointer,gGlobals.text,0);
      gGlobals.combatBytes[0] = 1;
    }
    else {
      iVar3 = (getModdedSkill(param_1->CharSheet->Skills,Troubadour) * 5 + getModdedStat(param_1->CharSheet->Stats,INT)) * 0x20000 >> 0x10;
      uVar8 = RollD(1,100);
      bVar6 = getModdedSkill(param_1->CharSheet->Skills,Troubadour);
      if (bVar6 < 6) {uVar9 = (uint)(byte)(('\b' - bVar6) * ('\b' - bVar6));}
      else {uVar9 = 8;}
      ppVar2 = gGlobals.playerDataArray[param_1->index];
      if (iVar3 < uVar8) {
        sprintf(gGlobals.text,combatPointer->textArray->they failed troubador,param_1->CharSheet->name);
        copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
        print_combat_textbox(combatPointer,gGlobals.text,0);
        rand_wonky_troub_check(param_1,(byte)(uVar9 >> 1));
      }
      else {
        sVar7 = (short)((uint)((iVar3 - (short)uVar8) * 0x10000) >> 0x10);
        uVar8 = some_skillcheck_calc(sVar7);
        if (uVar8 < 2) {bVar6 = 1;}
        else {bVar6 = (byte)some_skillcheck_calc(sVar7);}
        CombatEnt_OR_flags(param_1,flag3);
        CombatEnt_NAND_flags(param_1,flag9);
        CombatEnt_NAND_flags(param_1,flag10);
        combatPointer->unk0x13 = bVar6;
        damage_func(param_1->CharSheet,3);
        sprintf(gGlobals.text,combatPointer->textArray->they perform,param_1->CharSheet->name);
        copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
        print_combat_textbox(combatPointer,gGlobals.text,0);
        rand_wonky_troub_check(param_1,(byte)uVar9);
        AttachItemToPlayer(ppVar2,2,0x1abb);
      }
      ppVar2->ani_type = 5;
      combat_byte_0x1a(ppVar2);
    }
  }
  else {
    uVar8 = 0;
    sprintf(gGlobals.text,combatPointer->textArray->they failed troubador,
                param_1->CharSheet->name);
    while (uVar8 < 4) {
      pCVar1 = (&combatPointer->combatEnts)[uVar8];
      if (pCVar1 == NULL) {uVar8++;}
      else {
        bVar4 = CombatEnt_flag_2(pCVar1);
        if (bVar4 != false) {
          sprintf(gGlobals.text,combatPointer->textArray->already performing,pCVar1->CharSheet->name);
          break;
        }
        uVar8++;
      }
    }
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    print_combat_textbox(combatPointer,gGlobals.text,0);
    gGlobals.combatBytes[0] = 1;
  }
  return;
}



void func_8006f7f8(CombatEntity *param_1,Struct_char_flags param_2){

  
  if (!CombatEnt_flag_check(param_1)) {
    CombatEnt_OR_flags(param_1,param_2);
    if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
    func_80072454(combatPointer->substruct2,param_1);
  }
  else {
    if ((param_1->flags & param_2) == 0) {
      CombatEnt_NAND_flags(param_1,flag9);
      CombatEnt_NAND_flags(param_1,flag10);
      CombatEnt_OR_flags(param_1,param_2);
    }
  }
  return;
}

void func_8006f8a0(CombatEntity *param_1){func_8006f7f8(param_1,flag9);}
void func_8006f8bc(CombatEntity *param_1){func_8006f7f8(param_1,flag10);}


void func_8006f8d8(CombatEntity *param_1,ItemID param_2,byte param_3){
  byte bVar1;
  PotionEnum PVar2;
  bool bVar3;
  
  param_1->unk0x26 = param_3;
  param_1->item = GetIDIndex(param_2);
  bVar1 = param_1->rangeMulti;
  if (bVar1 != 3) {
    param_1->rangeMulti = 3;
    bVar3 = CombatEnt_flag_2(param_1);
    if (bVar3 != false) {func_8006f2cc(param_1);}
    CombatEnt_NAND_flags(param_1,flag9);
    CombatEnt_NAND_flags(param_1,flag10);
    get_weapon_sheild_borg5(param_1);
    param_1->unk0x24 = bVar1;
  }
}


void func_looking_for_flask(CombatEntity *param_1){
  if (!CombatEnt_flag_check(param_1)) {
    if (param_1->rangeMulti == 3) {
      if (param_1->item < HEALING) {
        if (has_item_func((gGlobals.Party)->Inventory,(ItemID)(param_1->item | 0x1000))) {
          param_1->rangeMulti = 0;
          get_weapon_sheild_borg5(param_1);
        }
      }
      else {
        param_1->rangeMulti = param_1->unk0x24;
        get_weapon_sheild_borg5(param_1);
      }
    }
  }
  else {
    CombatEnt_NAND_flags(param_1,flag9);
    CombatEnt_NAND_flags(param_1,flag10);
  }
}

uint check_sheild_borg5_(CombatEntity *param_1){
  temp_armor *ptVar1;
  uint uVar3;
  uint uVar4;
  
  uVar4 = 0xffffffff;
  if (!cannotSheild(param_1->CharSheet->ID)) {
    ptVar1 = param_1->CharSheet->armor[1];
    if (ptVar1 == NULL) {uVar4 = 0xffffffff;}
    else {
      uVar3 = get_sheild_borg5(ptVar1->id);
      uVar4 = 0xffffffff;
      if (uVar3 != 0x38f9) {uVar4 = uVar3;}
    }
  }
  return uVar4;
}

ushort get_weapon_borg5(CombatEntity *param_1){
  Temp_weapon *pTVar1;
  byte bVar4;
  ushort uVar2;
  ushort uVar3;
  
  pTVar1 = param_1->CharSheet->weapons;
  if (pTVar1 == NULL) {uVar3 = 0xffff;}
  else {
    bVar4 = GetIDIndex(pTVar1->id);
    uVar2 = Weapon_borg5_lookup(bVar4);
    uVar3 = 0xffff;
    if (uVar2 != 0xffff) {uVar3 = uVar2;}
  }
  return uVar3;
}


bool bow_eqquiped(CombatEntity *param_1){
  byte bVar1;
  Temp_weapon *pTVar2;
  byte bVar3;
  byte *pbVar4;
  byte missle_ids[9]={53,55,56,54,58,56,57,60,255}

  pTVar2 = param_1->CharSheet->weapons;
  if (pTVar2 != (Temp_weapon *)0x0) {
    bVar3 = GetIDIndex(pTVar2->id);
    if (missle_ids[0] != 0xff) {
      pbVar4 = missle_ids;
      do {
        bVar1 = *pbVar4;
        pbVar4++;
        if (bVar1 == bVar3) {return true;}
      } while (*pbVar4 != 0xff);
    }
  }
  return false;
}


void attach_wep_sheild_borg5(CombatEntity *param_1,uint param_2,int param_3,uint borg5){
  playerData *ppVar1;
  
  if (borg5 != 0xffffffff) {
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    if (ppVar1->locator_pointer != (Borg_7_header *)0x0) {
      HasLocator(ppVar1->locator_pointer->aniDat,param_3);
    }
    AttachItemToPlayer(ppVar1,param_2 & 0xffff,borg5);
    ChangeAttachmentNode(ppVar1,param_2 & 0xffff,(ushort)param_3,0);
  }
  return;
}

void throwing_equipped(CombatEntity *param_1){
  byte bVar1;
  byte bVar3;
  byte *pbVar4;
  
  param_1->throwingFlag = 0;
  if (param_1->rangeMulti == 3) {if (param_1->item < HEALING) {param_1->throwingFlag = 1;}}
  else {
    if (param_1->CharSheet->weapons != NULL) {
      if (!bow_eqquiped(param_1)) {
        bVar3 = GetIDIndex(param_1->CharSheet->weapons->id);
        if (throwing_ids[0] != 0xff) {
          pbVar4 = throwing_ids;
          do {
            bVar1 = *pbVar4;
            pbVar4++;
            if (bVar1 == bVar3) goto LAB_8006fc48;
          } while (*pbVar4 != 0xff);
        }
      }
      else {
LAB_8006fc48:
        param_1->throwingFlag = 1;
      }
    }
  }
  return;
}

void get_weapon_sheild_borg5(CombatEntity *param_1){
  playerData *ppVar1;
  uint borg5;
  bool bVar2;
  uint borg5_00;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  borg5_00 = 0xffffffff;
  FreeAttachmentFromPlayer(ppVar1,1);
  FreeAttachmentFromPlayer(ppVar1,0);
  param_1->unk0x88 = 0;
  param_1->unk0x89 = 2;
  borg5 = check_sheild_borg5_(param_1);
  if (param_1->rangeMulti != 0) {
    if (param_1->rangeMulti == 3) {borg5_00 = 0x34c5;}
    else {
      if (param_1->CharSheet->weapons != (Temp_weapon *)0x0) {
        bVar2 = bow_eqquiped(param_1);
        borg5_00 = 0x348f;
        if (bVar2 == false) {borg5_00 = get_weapon_borg5(param_1);}
        else {
          param_1->unk0x89 = param_1->notboss != 0;
          param_1->unk0x88 = param_1->notboss == 0;
          borg5 = get_weapon_borg5(param_1);
        }
      }
    }
  }
  throwing_equipped(param_1);
  attach_wep_sheild_borg5(param_1,1,(uint)param_1->unk0x89,borg5);
  if (!CannotShowWeapon(param_1->CharSheet->ID)) {attach_wep_sheild_borg5(param_1,0,(uint)param_1->unk0x88,borg5_00);}
  return;
}

bool cannotSheild(ItemID param_1){return EntityPointer->entities[GetIDIndex(param_1)].sheildStat == -1;}

/* ehud gorgon chaos.Lt. harpy marquis minotuar mino.lord neilsin */
bool CannotShowWeapon(ItemID param_1){
  byte bVar2;
  byte *pbVar1;
  uint uVar3;
  byte auStack72 [12];
  
  auStack72._0_4_ = BYTE_ARRAY_800dfb9c._0_4_;
  auStack72._4_4_ = BYTE_ARRAY_800dfb9c._4_4_;
  auStack72[8] = BYTE_ARRAY_800dfb9c[8];
  bVar2 = GetIDIndex(param_1);
  uVar3 = 0;
  pbVar1 = auStack72;
  while( true ) {
    if (auStack72[0] == 0xff) {return false;}
    if (*pbVar1 == bVar2) break;
    uVar3++;
    auStack72[0] = auStack72[uVar3];
    pbVar1 = auStack72 + uVar3;
  }
  return true;
}

AnimationData * get_weapon_anidat(CombatEntity *param_1){
  Temp_weapon *pTVar1;
  bool bVar5;
  byte bVar6;
  ushort uVar4;
  uint uVar2;
  AnimationData *pAVar3;
  longlong lVar7;
  uint uVar8;
  
  if (CannotShowWeapon(param_1->CharSheet->ID)) {return NULL;}
  if (param_1->rangeMulti == 3) {
    lVar7 = 0x34c5;
LAB_8006ff78:
    pAVar3 = BorgAnimLoadScene((uint)lVar7);
  }
  else {
    pTVar1 = param_1->CharSheet->weapons;
    if (pTVar1 != (Temp_weapon *)0x0) {
      bVar6 = GetIDIndex(pTVar1->id);
      uVar4 = Weapon_borg5_lookup(bVar6);
      lVar7 = (longlong)(short)uVar4;
      if (lVar7 != -1) {
        if (missle_ids[0] != 0xff) {
          if (missle_ids[0] == bVar6) {lVar7 = 0x348f;}
          else {
            uVar2 = 1;
            do {
              uVar8 = uVar2 & 0xffff;
              if (missle_ids[uVar8] == 0xff) goto LAB_8006ff78;
              uVar2 = uVar8 + 1;
            } while (missle_ids[uVar8] != bVar6);
            lVar7 = 0x348f;
          }
        }
        goto LAB_8006ff78;
      }
    }
    pAVar3 = NULL;
  }
  return pAVar3;
}

void get_ranged_weapon_floats(CombatEntity *param_1,float *param_2,float *param_3,float *param_4){
  CharSheet *pCVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  byte bVar7;
  float fVar8;
  
  bVar7 = param_1->rangeMulti;
  if (bVar7 == 3) {
switchD_80070018_caseD_3d:
    fVar8 = 8.0f;
    *param_2 = 4.0f;
    goto LAB_800701bc;
  }
  if (bVar7 < 4) {pCVar1 = param_1->CharSheet;}
  else {
    if (bVar7 != 4) {return;}
    pCVar1 = param_1->CharSheet;
  }
  bVar7 = GetIDIndex(pCVar1->weapons->id);
  fVar6 = 12.0f;
  fVar5 = 12.0f;
  fVar4 = 90.0f;
  fVar3 = 6.0f;
  fVar8 = 6.0f;
  fVar2 = 20.0f;
  switch(bVar7) {
  case 0x35:
    *param_2 = 9.9f;
    *param_3 = 0.0;
    break;
  case 0x36:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x37:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x38:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x39:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x3a:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x3b:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x3c:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  default:
    goto switchD_80070018_caseD_3d;
  case 0x46:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x5e:
    *param_2 = 8.0f;
    goto LAB_800701bc;
  case 0x5f:
    *param_2 = 8.0f;
    fVar8 = fVar2;
    goto LAB_800701bc;
  case 0x60:
    *param_2 = 5.0f;
    fVar8 = fVar6;
    goto LAB_800701bc;
  case 0x61:
    *param_2 = 5.0f;
    fVar8 = fVar5;
    goto LAB_800701bc;
  case 0x62:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 99:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case 100:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case 0x65:
    *param_2 = 5.0f;
    fVar8 = fVar3;
LAB_800701bc:
    *param_3 = fVar8;
    break;
  case 0x66:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    *param_4 = fVar4;
    return;
  }
  *param_4 = 0.0;
  return;
}

void clear_combatEnt_effects(CombatEntity *param_1){
  uint uVar1;
  uint uVar2 = 0;
  if (param_1->CharSheet->effects != NULL) {
    uVar1 = 0;
    do {
      uVar2++;
      clear_player_effect(param_1->CharSheet,uVar1,param_1);
      uVar1 = uVar2 & 0xff;
    } while (uVar2 < 0xf);
  }
}

void func_80070234(CombatEntity *param_1){
  playerData *ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1 != NULL) {
    func_800714d0(&combatPointer->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_1->unk0x23);
    param_1->coord = {(ppVar1->collision).position[0],(ppVar1->collision).position[2]};
    func_800713fc(&combatPointer->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),(uint)param_1->unk0x23);
  }
}

void func_80070304(CombatEntity *param_1){
  uint uVar1;
  CombatEntity *pCVar2;
  bool bVar3;
  
  uVar1 = param_1->unk0x10;
  if (-1 < (int)uVar1) {
    pCVar2 = (&combatPointer->combatEnts)[uVar1];
    param_1->unk0x10 = 0xffffffff;
    if ((pCVar2 != NULL) && (!isDead(pCVar2->CharSheet))) {param_1->unk0x10 = uVar1;}
  }
}

void combat_print_damage(CombatEntity *param_1,short param_2){
  if (param_2 < 2) {sprintf(gGlobals.text,combatPointer->textArray->they lose1HP,param_1->CharSheet->name);}
  else {sprintf(gGlobals.text,combatPointer->textArray->they lose  hp,param_1->CharSheet->name,param_2);}
  print_combat_textbox(combatPointer,gGlobals.text,0);
}

void combat_print_HP_gained(CombatEntity *param_1,short param_2){
  if (param_2 < 2) {sprintf(gGlobals.text,combatPointer->textArray->they gain 1HP,param_1->CharSheet->name);}
  else {sprintf(gGlobals.text,combatPointer->textArray->they gain hp,param_1->CharSheet->name,param_2);}
  print_combat_textbox(combatPointer,gGlobals.text,0);
  return;
}

void set_atk_range_multi(CombatEntity *param_1,bool param_2){
  Temp_weapon *pTVar1;
  bool bVar2;
  byte bVar3;
  
  param_1->rangeMulti = 0;
  pTVar1 = param_1->CharSheet->weapons;
  if (pTVar1 != NULL) {
    bVar3 = 1;
    if (pTVar1->range != 0) {
      bVar3 = 2;
      if (isBreathSpitOrSpikes(pTVar1)) {bVar3 = 4;}
    }
    param_1->rangeMulti = bVar3;
  }
  if (param_2 != false) {func_80072454(combatPointer->substruct2,param_1);}
  get_weapon_sheild_borg5(param_1);
}

void combat_print_dodge(CombatEntity *param_1,CombatEntity *param_2){
  sprintf(gGlobals.text,combatPointer->textArray->they attack,param_1->CharSheet->name,
              param_2->CharSheet->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  sprintf(gGlobals.text,combatPointer->textArray->they avoid,param_2->CharSheet->name);
  print_combat_textbox(combatPointer,gGlobals.text,0);
}


void combat_print_swing_and_miss(CombatEntity *param_1,CombatEntity *param_2){
  CharSheet *pCVar1 = param_2->CharSheet;
  sprintf(gGlobals.text,combatPointer->textArray->they attack,param_1->CharSheet->name,pCVar1->name);
  copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
  sprintf(gGlobals.text,combatPointer->textArray->they miss,param_1->CharSheet->name,pCVar1->name);
  print_combat_textbox(combatPointer,gGlobals.text,0);
}

void noop_80070658(void){}
short retMinus1(void){return -1;}
short passto_retMinus1(void){return retMinus1();}