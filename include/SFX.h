#include "n64Borg.h"
#include "Camera.h"

struct audio_substruct_2 {
    ushort index;
    short timer;
    u16 field2_0x4;
    undefined field3_0x6;
    undefined field4_0x7;
    voxelObject voxel;
    SoundStructA *soundStruct;
};

struct SoundStructA {
    vec3f worldPos;
    int mapTally;
    s16 index;
    u8 zoneDatByte;
    u8 unk13;
    u16 timer;
    ushort flag;
    Borg12Header *borg12;
    voxelObject *voxel;
    audio_obj_dat *voxelDat;
};

struct audiokey_struct {
    u8 (*a)[4];
    void* b;
    void* c;
    u8 d[1277][4];
};

//retail has 2 more sound obj entries.
#ifdef DEBUGVER
#define SoundObjCount 80
#else
#define SoundObjCount 82
#endif

struct SFX_Struct {
    SoundStructA *pointerA; /* (SoundObjCount) entries */
    ushort shortArrayA[SoundObjCount];
    u16 pointerAIndex;
    undefined field3_0xa6;
    undefined field4_0xa7;
    audio_substruct_2 *pointerB; /* 16 entries */
    ushort shortArrayB[16];
    ushort pointerBIndex;
    u16 field8_0xce;
};



void adjust_soundstruct_vec3(SoundStructA *);
void set_SFX_ZoneDatByte(SFX_Struct *,s16,s16);
void SoundStructA_get_borg12(SoundStructA *);
void ClearAudioBubble(SoundStructA *);

//redo following functions as SFX_Struct methods?

void init_sfx_struct(SFX_Struct *);
void SoundStructA_remove(SFX_Struct *,SoundStructA *);
SoundStructA * soundStructA_set(SFX_Struct *,voxelObject *,int ,u8);
audio_substruct_2 * PlayAudioSound(SFX_Struct *,u32 ,u32,float,short,u16);
void FreeAudioSound(SFX_Struct *,audio_substruct_2 *);
void clear_sfx_substruct_2(SFX_Struct *,s16);
void play_sfx_before_delete(SFX_Struct *,SoundStructA *);
audio_substruct_2 * get_audio_substruct_2_by_index(SFX_Struct *,u16);
void Ofunc_80055fc0(SFX_Struct *);
void audio_ref_objs(SFX_Struct *,Borg9data *,u32,u8);
void clear_sfx_entries(SFX_Struct *,s16);
void sfx_struct_free(SFX_Struct *);
void clear_sfx_on_map(SFX_Struct *,s32);
void render_auido_voxel(SoundStructA *);

float Sound_Volume_proximity(vec3f *,float ,Camera_struct *);
float FUN_800565a8(vec3f *,float ,Camera_struct *);
void FUN_8005661c(vec3f *,float ,Camera_struct *,s8 *,s8 *);
void ProcessAudioBubbles(SFX_Struct *,vec3f *,s16);
