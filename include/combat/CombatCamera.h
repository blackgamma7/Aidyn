#include "PlayerData.h"
#include "Camera.h"

playerData* camera_PlayerData_A=NULL;
playerData* camera_PlayerData_B=NULL;
u16 camera_PlayerData_flag=false;
u16 gCameraCombatStartFlag=false;
u16 combatCameraFlag2=false;
float FLOAT_800f1de0=0;
s16 SHORT_800f1de4=-1;

void set_camera_playerdata_focus(playerData *,playerData *);
void clear_camera_playerdata_focus(void);
void camera_collision_far(vec3f *a,vec3f *b);
void combat_camera_func(Camera_struct *,Borg9Data *);
void calc_camera_playerdata_focus(Camera_struct *,float);
u32 FUN_80096e58(PlayerHandler *,playerData *,vec3f *);
void FUN_80096f4c(PlayerHandler *,playerData *,vec3f *,Camera_struct *,s16);
void processCombatCamera(PlayerHandler *);
