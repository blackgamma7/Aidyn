
#include "n64Borg.h"

struct SceneDatSubstruct {
    Borg6SubSub *unk0;
    void *unk4;
    void * unk8;
    u16 unkc;
};

struct SceneDatStruct {
    Borg5Header *borg5;
    Borg6Header *borg6;
    SceneData* link;
    SceneDatSubstruct *sub;
    void *unk10;
    u32 unk14;
};

#define MAX_LOCATORS 7
struct SceneData {
    SceneDatStruct scene[5];
    u8 unk78[16];
    MtxF matrixA;
    MtxF matrixB;
    MtxF matrixC;
    MtxF matrixD;
    MtxF matrixE;
    vec3f scalar;
    int locators[MAX_LOCATORS+1];
    u32 flags;
    u16 aniTime;
    u8 aniSpeed;
    u8 perspNormIndex;
    vec4f colorFloats;
    int fogMin;
    int fogMax;
    Color32 fogColor;
    Light DirLights[7]; //"pad" fields are also set (to 0) for some reason.
    Light envLight;
    u32 maxLights; /* no more than 7 */
    u32 currLights;
    ParticleHeadStruct *particleHead;
    SceneData* locatorScene1;
    SceneData* locatorScene2;
    u8 sceneTicked;
    char borg5_char[11]; //only 5 chars used, rest may be align/unused bytes
};

enum SceneFlags{
    SCENE_0001=1, //unused?
    SCENE_0002=2, //unused?
    SCENE_0004=4, //copies matrix to some_mtx, some_mtx is Identity otherwise
    SCENE_0008=8, //skips a matrix calculation
    SCENE_0010=0x10, //changes a matrix calculation
    SCENE_0020=0x20, //skips a matrix calculation
    SCENE_0040=0x40, //skip perspactive normalizing dlist
    SCENE_0080=0x80, //related to lighting
    SCENE_0100=0x100, //use fog
    SCENE_0200=0x200, //can be set,unread?
    SCENE_0400=0x400, //unused?
    SCENE_0800=0x800, //unused?
    SCENE_1000=0x1000, //unused?
    SCENE_2000=0x2000, //unused?
    SCENE_4000=0x4000, //skip perspective matrix copy(?)
    SCENE_8000=0x8000, //related to lighting
};

namespace Scene{
void MatrixASetPos(SceneData*,float ,float ,float );
void MatrixATranslate(SceneData*,float ,float ,float );
void Ofunc_800a7554(SceneData*,float ,float ,float );
void MatrixARotate(SceneData*,float ,float ,float );
void Ofunc_800a7674(SceneData*,float ,float ,float );
void Ofunc_800a76f0(SceneData*,vec3f *,float);
void Ofunc_800a770c(SceneData*,vec3f *,float);
void MatrixANormalizeScale(SceneData*,float,float,float);
void ScaleBodyPart(SceneData*,float,float,float);
void MatrixAAlign(SceneData*,float ,float ,float ,float);
void MatrixBPos(SceneData*,float ,float ,float );
void MatrixBTranslate(SceneData*,float ,float ,float );
void Ofunc_800a7920(SceneData*,float ,float ,float );
void MatrixBRotate(SceneData*,float ,float ,float );
void Ofunc_800a7a40(SceneData*,float ,float ,float );
void MatrixBCopyTo(SceneData*,MtxF *);
void SetFlag40_800a7af8(SceneData*);
void UnsetFlag40_800a7b08(SceneData*);
void SetFlag80(SceneData*);
void UnsetFlag80_800a7b2c(SceneData*);
borg5substruct * Ofunc_800a7b40(SceneData*);
void LookAt(SceneData*,float,float,float,float,float,float,float,float,float);
void SetFOV(SceneData*,float);
float GetFOV(SceneData*);
void SetNearFarPlanes(SceneData*,float,float);
float GetFarplane(SceneData*);
float GetNearplane(SceneData*);
void Ofunc_800a7e4c(SceneData*,float);
float Ofunc_800a7e68(SceneData*);
void SetAspectRatio(SceneData*,float);
float GetAspectRatio(SceneData*);
void Ofunc_800a7ec0(SceneData*,float,float,float,float);
void Ofunc_800a7f48(SceneData*,float);
void SetFlag4(SceneData*);
void UnsetFlag4(SceneData*);
void SetFlag8(SceneData*);
void UnsetFlag8(SceneData*);
void SetFlag10(SceneData*);
void UnsetFlag10(SceneData*);
void SetFlag20(SceneData*);
void UnsetFlag20(SceneData*);
void SetFlag40(SceneData*);
void UnsetFlag40(SceneData*);
void SetFlag80(SceneData*);
void UnsetFlag80(SceneData*);
void SetFlag200(SceneData*);
void UnsetFlag200(SceneData*);
void Ofunc_800a806c(SceneData*);
void SetSpeed(SceneData*,byte);
borg5substruct * Ofunc_800a8098(SceneData*,s32 );
void SetFogFlag(SceneData*);
void UnsetFogFlag(SceneData*);
void SetFogColor(SceneData *,s32,s32,s32,s32);
void SetFogPlane(SceneData *,s32,s32);
void Ofunc_800a821c(SceneData *,int ,int ,vec4f *);
void SetFlag4000(SceneData *);
void UnsetFlag4000(SceneData *);
void SetModelTint(SceneData *,u8,u8,u8,u8);
void SetLightData(SceneData *);
void SceneSetMaxDynamicDirLights(SceneData *,u8);
int LengthSquared(byte,byte,byte);
s16 addLight(SceneData *param_1,u8 param_2,float X,float Y,float Z,u8 red,u8 green,u8 blue,s16 index);
void SetLightColors(SceneData *,u8 ,u8 ,u8);
bool HasLocator(SceneData *,s32);
bool SceneGetLocatorMtx(SceneData *,MtxF *,s32);
bool SceneGetLocatorPos(SceneData *,vec3f *,s32);
bool SceneGetLocatorNorm(SceneData *,vec3f *,s32 );
bool SceneGetLocatorAlign(SceneData *,vec3f *,u32 );
void CopyMatrixA(SceneData *,MtxF*);
void SetParticleHead(SceneData *,ParticleHeadStruct *);
void Ofunc_800a8e80(SceneData *,SceneData *);
void Ofunc_800a8e88(SceneData *,SceneData *);
bool GetRotate(SceneData *,vec3f *,vec3f *,vec3f *);
void Tick(SceneData*);
};
void SceneSetCameraLookAt(SceneData*,float,float,float,float,float,float);
void FUN_800a80ac(SceneData*,vec3f *,s32);
void FUN_800a80d8(SceneData*,vec3f *,s32);
void Ofunc_800a8104(SceneData*,s32 ,float);

vec3f gAnimationLookatVec={1,0,0};