//char[8]* stat_labels ={"Intelligence","willpower","Dexterity","Endurance","Strength","Stamina","Level"};
int base_stat_cap[STATCOUNT] = {30,30,30,40,30,90,40};
int modded_stat_cap[STATCOUNT] = {40,40,40,50,40,120,40};
int stat_multiplier[STATCOUNT] = {12,12,24,12,12,4,500};

void init_CharStats(CharStats *stats,ItemID ID){
  byte index;
  Entity_Ram *Entram;
  
  index = GetIDIndex(ID);
  Entram = EntityPointer->entities;
  memcpy(stats,Entram[index].stats,6);
  stats->Base_Stats[6] = Entram[index].Level;
  memcpy(stats->statArray2,stats,7);
  memcpy(stats->Modded_Stats,stats,7);
  memcpy(stats->statArray3,stats,7);
}

void Ofunc_NOOP_800845f4(void){}

//two save / load funcs ommited. requires understanding of such functionality


void copyCharStats(CharStats *A,CharStats *B){
  memcpy(A,B,7);
  memcpy(A->statArray2,B->statArray2,7);
  memcpy(A->statArray3,B->statArray3,7);
  memcpy(A->Modded_Stats,B->Modded_Stats,7);
}

void addBaseStat(CharStats *stats,StatEnum arg1,char mod){
  if (base_stat_cap[arg1] < (int)stats->Base_Stats[arg1] + mod) {
    mod = base_stat_cap[arg1] - (uint)stats->Base_Stats[arg1];
  }
  stats->Base_Stats[arg1] += mod;
  stats->statArray3[arg1] += mod;
  addModdedStat(stats,arg1,adding);
}

void addModdedStat(CharStats *stat,StatEnum arg1,char mod){
  stat->statArray2[arg1] += mod;
  stat->Modded_Stats[arg1] += mod;
  if (mod != 0) {Event_flag_stat(arg1);}
}

void addModdedStat_flag(CharStats *stat,StatEnum arg1,char mod){
  stat->statArray3[arg1] += mod;
  stat->Modded_Stats[arg1] += mod;
  Event_flag_stat(arg1);
}

void SubtractModdedStats(CharStats *stat,StatEnum arg1,char mod){
  stat->statArray3[arg1] -= mod;
  stat->Modded_Stats[arg1] -= mod;
  Event_flag_stat(arg1);
}

void addtoModdedStats(CharStats *stat,StatEnum arg1,char mod){
  stat->Modded_Stats[arg1] += mod;}

void subtractFromModdedStats(CharStats *stat,StatEnum arg1,char mod){
  stat->Modded_Stats[arg1] -= mod;}

int getBaseStat(CharStats *stats,StatEnum arg1){
  return capStatMax(arg1,(uint)stats->statArray3[arg1],base_stat_cap);
}

int getModdedStat(CharStats *param_1,StatEnum param_2){
  return capStatMax(param_2,param_1->Modded_Stats[param_2],modded_stat_cap);}

int get_stat_trainPrice(CharStats *param_1,StatEnum param_2){
  int iVar1 = param_1->Base_Stats[param_2] + 1;
  return iVar1 * iVar1 * stat_multiplier[param_2];
}

bool isStatCapped(CharStats *param_1,StatEnum param_2){return base_stat_cap[param_2] <= param_1->Base_Stats[param_2];}

int get_base_stat_(CharStats *param_1,StatEnum arg1){
  return capStatMax(arg1,(uint)param_1->Base_Stats[arg1],base_stat_cap);}

int get_moddedStat_difference(CharStats *param_1,StatEnum arg1){
  return (int)(param_1->Modded_Stats[arg1] - param_1->Base_Stats[arg1];
}

int capStatMax(StatEnum arg0,int stat,int *caps){
  int iVar1;
  
  if (stat < 0) iVar1 = 0;
  else {
    iVar1 = caps[arg0];
    if (stat <= iVar1) return stat;
  }
  return iVar1;
}

bool someStatCheck(CharStats *param_1,StatEnum param_2){
  return param_1->statArray2[param_2] < param_1->Base_Stats[param_2];
}
