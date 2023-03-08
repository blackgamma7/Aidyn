//char[8]* stat_labels ={"Intelligence","willpower","Dexterity","Endurance","Strength","Stamina","Level"};
s32 base_stat_cap[STATCOUNT] = {30,30,30,40,30,90,40};
s32 modded_stat_cap[STATCOUNT] = {40,40,40,50,40,120,40};
s32 stat_multiplier[STATCOUNT] = {12,12,24,12,12,4,500};

void CharStats:Init(CharStats *stats,ItemID ID){
  u8 index;
  Entity_Ram *Entram;
  
  index = GetIDIndex(ID);
  Entram = EntityPointer->entities;
  memcpy(stats,Entram[index].stats,6);
  stats->Base_Stats[6] = Entram[index].Level;
  memcpy(stats->array2,stats,7);
  memcpy(stats->modded,stats,7);
  memcpy(stats->array3,stats,7);
}

void Ofunc_NOOP_800845f4(void){}

//two save / load funcs ommited. requires understanding of such functionality


void CharStats:::Copy(CharStats *A,CharStats *B){
  memcpy(A,B,7);
  memcpy(A->array2,B->array2,7);
  memcpy(A->array3,B->array3,7);
  memcpy(A->modded,B->modded,7);
}

void CharStats:::AddBase(CharStats *stats,u8 type,char mod){
  if (base_stat_cap[type] < (s32)stats->Base_Stats[type] + mod) {
    mod = base_stat_cap[type] - (u32)stats->Base_Stats[type];
  }
  stats->Base_Stats[type] += mod;
  stats->array3[type] += mod;
  CharStats::addModdedStat(stats,type,adding);
}

void CharStats::addModdedStat(CharStats *stat,u8 type,char mod){
  stat->array2[type] += mod;
  stat->modded[type] += mod;
  if (mod != 0) {Event_flag_stat(type);}
}

void addModdedStat_flag(CharStats *stat,u8 type,char mod){
  stat->array3[type] += mod;
  stat->modded[type] += mod;
  Event_flag_stat(type);
}

void SubtractModdedStats(CharStats *stat,u8 type,char mod){
  stat->array3[type] -= mod;
  stat->modded[type] -= mod;
  Event_flag_stat(type);
}

void addtoModdedStats(CharStats *stat,u8 type,char mod){
  stat->modded[type] += mod;}

void subtractFromModdedStats(CharStats *stat,u8 type,char mod){
  stat->modded[type] -= mod;}

s32 CharStats::getBaseStat(CharStats *stats,u8 type){
  return capStatMax(param_1,type,(u32)stats->array3[type],base_stat_cap);
}

s32 CharStats::getModdedStat(CharStats *param_1,u8 type){
  return capStatMax(param_1,type,param_1->modded[param_2],modded_stat_cap);}

s32 get_stat_trainPrice(CharStats *param_1,u8 type){
  s32 next = param_1->Base_Stats[type] + 1;
  return next * next * stat_multiplier[type];
}

bool isStatCapped(CharStats *param_1,u8 param_2){return base_stat_cap[param_2] <= param_1->Base_Stats[param_2];}

s32 get_base_stat_(CharStats *param_1,u8 type){
  return capStatMax(param_1,type,(u32)param_1->Base_Stats[type],base_stat_cap);}

s32 get_moddedStat_difference(CharStats *param_1,u8 type){
  return (s32)(param_1->modded[type] - param_1->Base_Stats[type];
}

s32 capStatMax(CharStats* x, u8 type,s32 stat,s32 *caps){
  s32 i;
  
  if (stat < 0) i = 0;
  else {
    i = caps[type];
    if (stat <= i) return stat;
  }
  return i;
}

bool someStatCheck(CharStats *param_1,u8 param_2){
  return param_1->array2[param_2] < param_1->Base_Stats[param_2];
}
