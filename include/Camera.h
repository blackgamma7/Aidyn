#include "collide.h"

// Camera Data struct
struct Camera_struct {
    vec3f pos; 
    vec3f aim; /* position to aim camera */
    vec3f posTarget;
    vec3f aimTarget;
    vec2f rotationXZ;
    vec3f rotation;
    u16 camera_mode_prev;
    u16 camera_mode;
    float unk48;
    float unk4c;
    float unk50;
    float unk54;
    float unk58;
    float unk5c;
    float unk60;
    float unk64;
    s16 unk68;
    u16 holdCamera;
    float camHeight;
    vec3f unk70; /* another aim target? */
    s16 unk7c;
    s16 unk7e; /* length check between aimTarget and unk70 */
    s16 unk80;
    s16 unk82;
    u16 unk84;
    Borg9Data *borg_9; /* current map data */
    collisionSphere collide; /* only pos updated in 1 func, otherwise unused */
    EnvProp envProp; /* only a guess - unused */
    collisionTypeA colTypeA; /* unused */
    SpeedProperty colTypeB; /* unused */
};

struct ScriptCam {
    s16 active;
    s16 index;
    u16 timer;
    s16 flag;
    vec3f *aim;
    float height;
    voxelObject voxel;
};

struct ScriptCamera_struct {
    ScriptCam *cameras; /* 0x7c size */
    s16 cameraIndecies[8];
    u16 cameraCount; /* up to 8 */
    s16 dataActive;
    s16 counter0;
    s16 counter1;
};

namespace Camera{
    void SetPos(Camera_struct *cam,vec3f *pos);
    void SetAim(Camera_struct *cam,vec3f *pos);
    void Init(Camera_struct *cam,Borg9Data *map,vec3f *pos,u16 mode);
    void Orient(Camera_struct *cam);
    void Lerp(vec3f *arg,vec3f *target,float f);
    void AdjustAim(vec3f *aim0,vec3f *aim1,float arg2,s16 delta,float arg4);
    void SetFeild70(Camera_struct *cam,vec3f *arg1);
    void FUN_800b04ec(Camera_struct *cam);
    void FUN_800b050c(Camera_struct *cam,vec3f *param_2);
    void FUN_800b05d0(Camera_struct *cam,vec3f *Arg1,vec3f *Arg2);
    void Mode1(Camera_struct *cam,vec3f *arg1,vec3f *arg2,s16 arg3,float arg4,
               float arg5,s32 arg6,s32 arg7,float arg8,float arg9,
               float arg10,float arg11,float arg12,float arg13,s16 arg14,
               s16 arg15);
    void Mode0(Camera_struct *cam,vec3f *param_2,vec3f *param_3,s16 param_4,s16 param_5);
    void FUN_800b0fac(Camera_struct *CAM,vec3f* param_2,s16 param_3,float param_4,float param_5,float param_6);
    void SetMode(Camera_struct *cam,u16 mode);
    void RevertMode(Camera_struct *cam);
    void ProcessGameCamera(Camera_struct *cam,vec3f *param_2,vec3f* param_3,s16 param_4,u16 param_5);
    float CreateFocusFromMultiple(vec3f *outV3,vec2f *outV2,vec3f **arr,s16 numFoci,float param_5);
    void ApplyVelocity(Camera_struct *cam,vec3f *vel);
    void AddPosToList(vec3f *param_1);
    void CopyPosAim(Camera_struct *cam,u16 flag,vec3f *param_3);
    void CopyPosAim2(Camera_struct *cam,u16 flag,vec3f *param_3);
    
};

void set_camera_voxel_pointer(voxelObject *param_1,vec3f *param_2);
void clear_camera_voxel_pointer();
void passto_camera_init(Camera_struct *cam,Borg9Data *map,vec3f *pos,u16 dat);
void clear_some_playerHandler_field(void);
void FUN_80019ccc(playerData *param_1);
void GiveCameraToPlayer(playerData *param_1);
void processVoxelCamera(vec3f *arg0,voxelObject *vox,Camera_struct *cam,float delta);
void InitScriptCameras(ScriptCamera_struct *param_1);
void FreeScriptCameras(ScriptCamera_struct *param_1);

#define gCamera gGlobals.gameVars.camera //shorthand for camera object