#include "playerData.h"
#include "n64Borg.h"

// header for funcs used by Voxel Objects

//voxObjects.cpp
void set_ranger_float(void);
u8 FUN_8001b9bc(voxelObject *param_1,Borg9Data*map);
void set_refObj_flag(voxelObject *param_1);
void VoxelObjects_Activate(Borg9Data *dat,u8 index);
void set_voxel_visibility(voxelObject *a,u8 b);

//objectJumpTables.cpp

void replace_container_voxel(voxelObject*cont,u16 index,Borg9Data*map);
void play_countainer_sound(voxelObject*cont,Borg9Data*map);
void open_explosive_chest(voxelObject*cont,Borg9Data*map);
void NOOP_tp();
void run_voxelFuncs0(voxelObject*v,u16 A, u16 B);
u8 run_voxelFuncs2(voxelObject *v,Borg9Data*map);
u8 Voxel_CheckProc(voxelObject *v,playerData *p);
void Voxel_func_NOOP(voxelObject* v,u16 A, u16 B);
u8 teleport_trap(voxelObject* v);
void teleporter_func(voxelObject* v,u16 A, u16 B);
void get_loot_reagent(voxelObject* v,container_Dat * cont);
void loot_func(voxelObject *v,u16 A, u16 B);
void monsterpary_func(voxelObject *v,u16 A,u16 B);
void trigger_vobject_func(voxelObject *v,u16 A,u16 B);
void savepoint_func(voxelObject *v,u16 A,u16 B);
u8 vobject_pause_check(void);
void dialouge_vobject_func(voxelObject *v,u16 A,u16 B);
u8 check_reference_object(voxelObject *v,Borg9Data* map);
u8 scene_object_check(voxelObject *v,Borg9Data* map);
u8 exploding_container_sub(voxelObject* v,Borg9Data *map);
u8 exploding_container_check(voxelObject *v,Borg9Data *map);
u8 TP_lock_secret_check(voxelObject* v,Borg9Data* map);
u8 some_monster_check(voxelObject *v,Borg9Data* map);
u8 some_trigger_check(voxelObject *v,Borg9Data* map);
u8 some_dialouge_trigger_check(voxelObject *v,Borg9Data*map);
u8 savepoint_appear_check(voxelObject *v,Borg9Data*map);
u8 container_obj_check(voxelObject* v,playerData *arg1);
u8 Ofunc_80014ba0(voxelObject *v,vec3f *arg1);
u8 some_gamestate_check_B(voxelObject* v,playerData *arg1,u8 istrue);
u8 teleporter_obj_check(voxelObject* v,playerData *arg1);
u8 monsterparty_obj_check(voxelObject* v,playerData *arg1);
u8 trigger_obj_check_prox(voxelObject *v,playerData *arg1,u8 param_3);
u8 trigger_obj_check(voxelObject *v,playerData *arg1);
u8 dialouge_trigger_check(voxelObject *v,vec3f *arg1,u8 getProx);
u8 dialoug_obj_func(voxelObject *v,playerData *arg1);
u8 dialoug_obj_check(voxelObject* v,playerData *arg1);
u8 savepoint_prox_check(voxelObject *v,playerData *arg1);
u8 VoxelObj_Ret0(voxelObject *v,playerData *arg1);
void render_container(voxelObject* param_1,Borg9Data *param_2);
void set_container_obj_visible(voxelObject* param_1,Borg9Data *param_2);
BaseWidget* textbox_func_AB(BaseWidget* param_1,BaseWidget *param_2);
BaseWidget* secretdoor_widget_AB(BaseWidget* param_1,BaseWidget *param_2);
BaseWidget * TrekTextPopup(char *param_1);
u8 container_open_check(u16 param_1);
u8 container_explode_check(u16 param_1);
u8 Teleport_lock_check(u16 param_1);
u8 teleport_trap_check(u16 param_1);
u8 teleport_secret_check(u16 param_1);
u8 FUN_80015128(u16 param_1,u32 param_2);
u8 trigger_event_flag_check(u16 param_1,u16 param_2,u16 param_3);
void ref_obj_bitmask_flag(u16 param_1,u16 param_2,u16 param_3);
u8 FUN_8001520c(voxelObject* param_1);
void secret_door_func(voxelObject* param_1);

u16 FUN_80005d60(wander_substruct **w);
float func_checking_monsterparty(voxelObject *v,vec3f *pos);
void monsterparty_setvec2(voxelObject *v,vec2f *pos);
void obj_ref_func(void);

void chest_explode_particles(voxelObject *chest,float height,vec4f *color,u16 param_4,short param_5,short count
               ,float randHi,float randLo,float param_9,short addLight);
void ofunc_sub_8001ae04(ParticleHeadStruct *param_1,ParticleEmmiter *param_2);
void Ofunc_8001af40(container_Dat *param_1,vec3f *param_2,vec4f *param_3,float param_4,
                   u16 param_5,short param_6,float param_7);
void FUN_8001b0a8(ParticleHeadStruct *param_1,ParticleEmmiter *param_2);
ParticleEmmiter *
FUN_8001b29c(vec3f *param_1,u16 param_2,short param_3,u16 param_4,short param_5,float param_6
            ,vec4f *param_7,vec4f *param_8,vec4f *param_9,vec3f *param_10);
void alloc_explosion_light(vec3f *pos,float param_2,u16 param_3,bool moving);
void Ofunc_8001b688(vec3f *pos,vec2f *param_2,u16 param_3);
void UNK_NOOP(void *param_1,u16 param_2);
void FUN_8001b888(ParticleHeadStruct *param_1,vec3f *param_2);


void lockpicking_check(voxelObject *v);
BaseWidget * lockpicking_widget_ABfunc(BaseWidget *b0,BaseWidget *b1);

//light.cpp

void InitLight_(voxelObject* vox,vec3f *pos,float size,u16 type,float f1,u32 colB,u32 colC);
void color_magnitude(Color32 *param_1,Color32 *param_2,float amp);
float FUN_80054ba4(float x,float y);
void color_XOR(Color32 *colA,Color32 *colB);
void tint_color_with_screenfade(Color32 *param_1,float fade);
void Ofunc_80054db0(voxelObject* param_1,u16 param_2);
void Ofunc_80054dc0(voxelObject* param_1,u16 param_2);
void InitLight(SceneData *scene,Borg9Data *borg9,vec3f *pos,voxelObject *lightObj,s16 count,s16 delta);
void light_init_func(playerData *param_1,SceneData *param_2,s16 param_3);
void passto_initLight(SceneData *param_1,Borg9Data *param_2,voxelObject *param_3,s16 param_4);
void passto_InitLight_2(DynamicLightHead *param_1,SceneData *param_2,voxelObject *param_3,s16 param_4);
void init_dynamic_light(DynamicLightHead *param_1);
void dynamic_lights_free_all(DynamicLightHead *param_1);
voxelObject*  AllocDynamicLight(DynamicLightHead *param_1,u16 param_2,vec3f *pos,float size,u16 type,
                 float f1,u32 colb,u32 colc);
void FreeDynamicLight(DynamicLightHead *param_1,s16 param_2);
void FUN_800556f4(DynamicLightHead *param_1,s16 delta);


typedef void (*VoxelUse)(voxelObject*,u16,u16);
typedef u8 (*VoxelProx)(voxelObject*,playerData*);
typedef u8 (*VoxelFunc2)(voxelObject*,Borg9Data*);

VoxelUse gVoxelUseFuncs[]={
  Voxel_func_NOOP,
  loot_func,
  Voxel_func_NOOP,
  Voxel_func_NOOP,
  Voxel_func_NOOP,
  monsterpary_func,
  Voxel_func_NOOP,
  dialouge_vobject_func,
  trigger_vobject_func,
  savepoint_func,
  Voxel_func_NOOP
};
VoxelProx gVoxelProxFuncs[]={
  VoxelObj_Ret0,
  container_obj_check,
  VoxelObj_Ret0,
  VoxelObj_Ret0,
  VoxelObj_Ret0,
  monsterparty_obj_check,
  VoxelObj_Ret0,
  teleporter_obj_check,
  VoxelObj_Ret0,
  dialoug_obj_check,
  trigger_obj_check,
  savepoint_prox_check,
  VoxelObj_Ret0
};
VoxelFunc2 gVoxelFuncs2[]={
  scene_object_check,
  exploding_container_check,
  check_reference_object,
  check_reference_object,
  check_reference_object,
  some_monster_check,
  check_reference_object,
  TP_lock_secret_check,
  check_reference_object,
  some_dialouge_trigger_check,
  some_trigger_check,
  savepoint_appear_check,
  check_reference_object
};
float RangerIngredientFloat=0;
u32 unk800e8f04=0; //4 bytes between global vars. unused.
u32 only_TP_active=false; //disables any non-teleporting map objects if set. still in retail game
u32 teleportTimestamp;
