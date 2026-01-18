#include "SceneData.h"
#include "borgMaps.h"

struct ZoneDat {
    int borg5_ID;
    SceneData *sceneDat0x4;
    u32 borg9_id;
    Borg9Header *mapPointer;
    u32 borg5_ID2;
    SceneData *SceneDat0x14;
    u32 MapTally;
    u8 alpha;
    u8 index; /* BCD of mtxIndex */
    u8 flag;
    u8 unk1f;
};

#define ZoneCenter 0x11 //BCD index of MapZoneData[1][1]

#define MAPCENTER gGlobals.gameVars.ZoneDatMtx[1][1]

s16 gPlayerRenderTimer=0;
s32 FreeZoneEngineTimestamp=-1;
s32 handeZoneEngineTimestamp=-2;
u16 engineZone_flag=1;
#ifdef DEBUGVER
u16 gLoadOneZone=0; //Will force only the center map chunk to load.
u16 gSceneBoulder=0; // will replace "Scene" voxels with a boulder if set.
u16 voxel_index=0;
#endif 
u16 voxel_counter=0;
u32 initZoneTimestamp=0;
u16 DAT_800e8dbc=0;
u16 DAT_800e8dbe=0;
u16 no_ExpPak_memcheck_flag=0;
u16 no_TP_vec3=0;
u16 gFreeZoneEngineTimer=0;
u16 DAT_800e8dc6=0;
char** ground_labels=NULL;
u8 EnvPropBools[][2]={{0,0},{1,0},{1,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},
   {0,0},{0,0},{0,0},{0,0},{0,1},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}};
#ifdef DEBUGVER
u16 voxel_index_number=0;
u16 voxel_index_timer=0;
voxelObject* voxel_index_pointer=NULL;
#else
u16 retailTpFlag=0;
#endif

voxelObject bss_tele_obj;
vec3f vec3_800f5210;
voxelObject loadgame_tp_obj;


//Camp.cpp

void checking_camping_safety();
void dialoug_ref_obj_func();
void SetWidgetBounds(BaseWidget *w,u16 x0,u16 y0,u16 x1,u16 y1);
u8 isCampfireScene(u32 b13ID);
u8 some_dialoug_short_lookup(u16 flag);
void campfire_func();

//ZoneEngine.cpp 

u8 FUN_8000c9e0();
mapFloatDat* FUN_8000cae8(vec3f *position,s16 mapshortA,s16 mapShortB,s16 param_4,s16 param_5);
u8 FUN_8000ccc0();
u8 NoExpPak_memCheck(u16 x);
void InitEnvProps();
void FreeEnvProps();
void attachPhysicsProperties(Borg9Data *b9);
Borg9Data * GetCollisionZone(u8 x);
void set_teleport_pointer(voxelObject *param_1);
void set_teleport_obj_A(u16 mapA,u16 Short1,u16 Short2,vec3f *pos);
void set_teleport_obj_loadgame(u16 mapA,u16 Short1,u16 Short2,vec3f *pos);
void check_trigger(collisionSphere *param_1,borg9_phys *param_2);
void init_some_map_data(ZoneDat *dat,s16 i,char j);
void FUN_8000d744();
void Zonedat_clear(ZoneDat *param_1,s16 param_2,s16 param_3);
void ofunc_zoneengine_free();
void move_zonedat(ZoneDat *param_1[3][3],ZoneDat *param_2);
void checkToggleZoneScene(ZoneDat *param_1);
void MakeGameZoneNames(u16 param_1,u16 param_2);
void ZoneMoveSceneDat(SceneData *param_1,u8 index);
void zonedat_clear_all();
void FreeZoneEngineMemory();
void loading_map_data(ZoneDat *param_1);
void loadGameBorgScenes(u16 ShortA,u16 ShortB);
void ApplyZoneVelocity(vec3f *param_1,playerData *param_2);
voxelObject * FindReferncePoint(Borg9Data *param_1,u16 id);
voxelObject * get_map_referencepoint(Borg9Data *param_1,u16 id);
voxelObject * FindReferncePointName(Borg9Data *param_1,char *name,u8 cantFail);
u32 get_zoneDatByte(s16 param_1,s16 param_2,u32 param_3);
void set_playerdata_zoneDatByte(u16 param_1,u16 param_2);
void some_zoneDat_func();
void TeleportPlayer(playerData *player,voxelObject *tp,vec3f *param_3);
void ConfirmPlayerWithinZone(playerData *param_1,Borg9Data *param_2);
SceneData * load_borg_5_func(u32 b5);
void SetSceneColors(SceneData *param_1,u8 alpha,u8 param_3,u32 col);
u8 get_scene_obj_proximity(vec2f *obj,vec2f *cam,vec2f *aim,float *outx,float *outy);
void NoExpPak_ClearSceneVoxelIndex(Scene_obj_dat *scene,u16 index);
void NoExpPak_ClearSceneVoxel(Scene_obj_dat *scene);
Gfx * RenderVoxelScenes(Gfx *gfx,Borg9Data *borg9,vec3f *v3,s16 param_4,s16 param_5,float posx,float posz);
void RenderZones(Gfx **GG,vec3f *pos,s16 delta);
void RenderTransZones__(Gfx **GG);
void renderTransZones_(Gfx**GG);
void mapFloatDat_copy(mapFloatDat *param_1);
void InitZoneEngine(u16 param_1,s16 param_2);
void SaveEngineZone(playerData *param_1,mapFloatDat *param_2);
void clear_music_values(u16 ClearAll);
void clear_music_no_expPak();
void update_BGM_();
void FreeZoneEngine(s16 playMusic);
#ifdef DEBUGVER
void ClearVoxelFlags(Borg9Data *param_1);
void VoxelIndexPosition(s16 delta,playerData *param_2);
#endif
void handleZoneEngineFrame(Gfx **GG,s16 delta,playerData *player);
