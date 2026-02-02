#include "Borgindecies.h"
#include "borg/borg5.h"
#include "borg/borg7.h"
#include "borg/borg8.h"
#include "borg/borg9.h"
#include "borg/borg12.h"
#include "borg/borg13.h"
#include "heapN64.h"
#include "graphics.h"


/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown. init/free code still ingame. earliest known name is an abreviation of "GEN"
1-Textures. Raw data has bitmap "interleaved" every even row.
2-Geometry data. contains verts and ucode (primariliy G_TRI1)
3-Scene perspective data (fov,clipping planes, ect.)
4-light object data
5-Model data. uses the aformentioned types.
6-animation data.
7-Actor models.
8-Images. used for UI, primarily. Easily viewable in Texture64 when extracted.
9-Map data. contains collision and object data
10-unused. refered internally in Debug as "CollisionMaterial"
11-DCM instrument for SFX and BGM. 44.1KHz mono PCM of 8 or 16BE bits
12-Sound/music sequence using Borg11 samples
13-Dialogue/cutscenes.
14-unused. refered internally in Debug as "GameState"*/


void borg1_func_a(Borg1Data *);
u8 InitBorgTexture(Borg1Header *,Borg1Data *);
void borg1_free(Borg1Header *);
void borg2_func_a(Borg2Data *);
u8 borg2_func_b(Borg2Header *,Borg2Data *);
void borg_2_free(Borg2Header *);
void borg4_func_a(void*);
u8 borg4_func_b(void* x,void* y);
void Borg4_free(borgHeader *);
void borg3_func_a(Borg3Header *);
u8 borg3_func_b(void*, void* );
void borg5_func_a(Borg5Header*);
u8 InitBorgScene(Borg5Header *,void*);
void borg5_free(Borg5Header *);
void borg6_func_a(Borg6Header*);
u8 borg6_func_b(Borg6Header *,Borg6Data *);
void borg_6_free(Borg6Header *);
void borg7_func_a(Borg7Header *);
u8 borg7_func_b(Borg7Header *,Borg7Data *);
void borg7_free(Borg7Header *);
void set_AnimCache(u8 );


//n64borg/CollisionMaterial.cpp

u8 borg10_func_b(void *x,void *y);
void borg10_func_a(void *x);
void borg_10_free(s32 *arg0);
void * get_borg_10(s32 arg0);
void passto_borg_10_free(s32 *arg0);


//n64borg/GameStates.cpp

u8 borg14_func_b(void *x,s32 y);
void borg14_func_a(void *arg0);
void ofunc_borg14_free(s32 *arg0);
void * get_borg_14(s32 arg0);
void passto_borg_14_free(s32 *arg0);

//n64borg/anim.cpp

void Ofunc_8009d250();
void Ofunc_8009d25c(void* p);
s8 GetN64ImageDimension(u16 X);
int GetBitmapSize(int h,int w,s32 d);
u32 half(int x);
int getPow2(u32);
s32 FUN_8009d3b0(s32 param_1,s32 param_2);
Gfx * FUN_8009d3dc(Gfx *param_1,Borg1Header *b1,u8 bufferchoice);
void moveBitmap32(Borg1Header *param_1,int param_2);
void moveBitmap16(Borg1Header *param_1,int param_2);
void FUN_8009d7b0(Borg1Header *param_1);
Gfx * borganim_LoadTextureImage(Gfx *gfx,Borg1Header *param_2);
Gfx * loadTextureImage(Gfx *gfx,Borg1Header *param_2,Borg2Struct *param_3);
Gfx * Ofunc_8009e228(Gfx *param_1,SceneData *param_2,int param_3);
void Borg5Transform_op0(Borg5Transform *param_1,MtxF *mf);
void Borg5Transform_op1(Borg5Transform *param_1,MtxF *mf);
void Borg5Transform_op2(Borg5Transform *param_1,MtxF *mf);
void Borg5Transform_op3(Borg5Transform *param_1,MtxF *mf);
void Borg5Transform_op4(Borg5Transform *param_1,MtxF *mf);
void Borg5Transform_ops(Borg5Transform *param_1,MtxF *mf);
void FUN_8009ed9c(MtxF *in,MtxF *out);
void FUN_8009ee48(MtxF *in,MtxF *out);
void FUN_8009ee98(Borg5Transform *param_1,MtxF *param_2);
void FUN_8009ef34(SceneData *param_1);
void Ofunc_8009efd0(SceneData *param_1,MtxF *param_2);
void FUN_8009f060(SceneData *param_1,MtxF *param_2);
void Ofunc_8009f4e0(SceneData *param_1);
void Ofunc_8009f554(SceneData *param_1,vec3f *param_2);
void Ofunc_8009f608(SceneData *param_1);
void Ofunc_8009f664(SceneData *param_1);
void FUN_8009f6b4(SceneData *param_1,Borg6Header *param_2);
void Scene_SetBorg6(SceneData *scene,Borg6Header *b6);
void unlinkBorg6(Borg6Header *param_1);
void Ofunc_8009f938(Borg5Header *param_1,s32 param_2,int param_3,s32 param_4,int param_5);
void FUN_8009f9d0(SceneData *param_1,Vp *param_2);
SceneData * BorgAnimLoadScene(u32 borg_5);
void borganim_free(SceneData *param_1);
Borg6Header * loadBorg6(int index);
void passto_borg_6_free(Borg6Header *param_1);
Borg7Header * loadBorg7(u32 index,struct ParticleHeadStruct *pHead);
void FUN_8009fca8(Borg7Header *param_1);
void FUN_8009fd40(Borg7Header *param_1);
void FUN_8009fd98(Borg7Header *param_1);
void FUN_8009fdec(Borg7Header *param_1);
void takeBranch(Borg7Header *param_1,Borg7Struct2 *param_2);
void animate_borg7(Borg7Header *param_1);
bool Borg7_AnimationExpired(Borg7Header *param_1);
void FUN_800a0088();
void Borg7_SetAnimation(Borg7Header *param_1,u16 param_2);
bool FUN_800a00d0(Borg7Header *param_1);
bool Borg7_TickAnimation(Borg7Header *param_1,int delta);
u16 Borg7_GetAniTime(Borg7Header *param_1);
void Borg7_StartParticles(Borg7Header *param_1);
Gfx * Borg7_Render(Gfx *g,Borg7Header *param_2);
void FUN_800a0714(struct Borg6Struct5 *param_1);
void FUN_800a0764(Borg6Struct4 *param_1,float param_2);
void FUN_800a07b0(Borg6Struct4 *param_1,float param_2);
void FUN_800a0800(Borg6Struct4 *param_1,float param_2);
void FUN_800a0940(Borg6Struct4 *param_1);
void FUN_800a09c0(Borg6Struct4 *param_1);
void FUN_800a0a08(SceneData *param_1);
void FUN_800a0a74(Borg6Struct4 *param_1);
void Ofunc_800a0d30(Borg6Header *param_1,int param_2);
Gfx * BorgAnimDrawScene(Gfx *g,SceneData *scene);
void FUN_800a0df4(SceneData *param_1);
void Ofunc_800a0e30(void);
Gfx * FUN_800a0e60(Gfx *G);
Gfx * setStaticMode(Gfx *g);
Gfx * FUN_800a1184(Gfx *gfx);
void Ofunc_800a1548(vec3f *param_1);
Gfx * gsAnimationDataMtx(Gfx *G,SceneData *param_2);
Gfx * BorgAnimDrawSceneRaw(Gfx *g,SceneData *param_2);
void NOOP_800a2448(void *x);
Gfx * ret_A0(Gfx *g);


typedef void (*BorgFuncA)(void*);
typedef u8 (*BorgFuncB)(void*,void*);

u32 borgFlag=0;
BorgFuncA borg_funcs_a[]={
(BorgFuncA)borg0_func_a,(BorgFuncA)borg1_func_a,(BorgFuncA)borg2_func_a,
(BorgFuncA)borg3_func_a,(BorgFuncA)borg4_func_a,(BorgFuncA)borg5_func_a,
(BorgFuncA)borg6_func_a,(BorgFuncA)borg7_func_a,(BorgFuncA)borg8_func_a,
(BorgFuncA)borg9_func_a,(BorgFuncA)borg10_func_a,(BorgFuncA)borg11_func_a,
(BorgFuncA)borg12_func_a,(BorgFuncA)borg13_func_a,(BorgFuncA)borg14_func_a
};
BorgFuncB borg_funcs_b[]={
(BorgFuncB)borg0_func_b,(BorgFuncB)InitBorgTexture,(BorgFuncB)borg2_func_b,
(BorgFuncB)borg3_func_b,(BorgFuncB)borg4_func_b,(BorgFuncB)InitBorgScene,
(BorgFuncB)borg6_func_b,(BorgFuncB)borg7_func_b,(BorgFuncB)borg8_func_b,
(BorgFuncB)borg9_func_b,(BorgFuncB)borg10_func_b,(BorgFuncB)borg11_func_b,
(BorgFuncB)borg12_func_b,(BorgFuncB)borg13_func_b,(BorgFuncB)borg14_func_b
};
//for header sizes that use pointer to data
#define BorgHSize(x) (sizeof(Borg##x##Header)-sizeof(Borg##x##Data*))
//for header sizes that use copy of data
#define BorgHSize2(x) (sizeof(Borg##x##Header)-sizeof(Borg##x##Data))
//sizeof(BorgXHeader)-sizeof(BorgXData* or BorgXData)
s32 gBorgHeaderSizes[15]= {
    sizeof(borgHeader),BorgHSize(1),BorgHSize(2),BorgHSize2(3),
    sizeof(borgHeader),BorgHSize2(5),BorgHSize(6),BorgHSize2(7),
    BorgHSize(8),BorgHSize2(9),sizeof(borgHeader),BorgHSize(11),
    BorgHSize(12),BorgHSize(13),sizeof(borgHeader)};
u8 animChache=3;
u32 borg_mem[15]={0};
u32 borg_count[15]={0};
borgHeader** gBorgpointers=NULL;
u8* gBorgBytes=0;
void* BorgListingPointer=0;
void* borgFilesPointer=0;
u32 borgTotal=0;


//macro used to adjust offsets in header
#define SetPointer(x,f) x->f= decltype(x->f)((uintptr_t)&x+(uintptr_t)x->f)
//same as SetPointer(), but makes sure there is an offset
#define CheckSetPointer(x,f) if(x->f) SetPointer(x,f)


