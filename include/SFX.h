#include "n64Borg.h"
#include "Camera.h"

struct SoundStructB {
    ushort index;
    short timer;
    u16 active;
    u16 unk6; //align bytes?
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
    SoundStructB *pointerB; /* 16 entries */
    ushort shortArrayB[16];
    ushort pointerBIndex;
    u16 active;
};

struct Voice_Aidyn {
    ALVoice voice;
    ALWaveTable wavetable;
    Borg11Data *instrumentData;
    u32 id;
    u32 unk0x38;
    u32 waveTableLength;
    u32 loopEnd;
    ushort pitch;
    u8 loopCount;
    u8 isActive;
    u8 vol;
    u8 pan;
    u8 flag;
    u8 unk0x4b;
};

struct Audio_manager {
    ALPlayer ALPLAYER;
    ALHeap ALHEAP;
    ALSynth ALSYNTH;
    void *ThreadStack;
    OSMesg *OsMsgPtr0x74;
    OSSched *sched;
    Acmd *ACMDList;
    Voice_Aidyn *voicesAidyn;
    s16 *buffer_pointers[3];
    u8* scaleBufferA;
    u8* scaleBufferB;
    u8 *indecies;
    u32 unk9c;
    OSThread Thread;
    OSScClient Client;
    OSScTask Task;
    u16 taskMsg;
    u8 unk0x2c2[30];
    OSMesg OSmesg0x2e0;
    OSMesgQueue mesgQ;
    OSMesgQueue mesgQ_2;
    OSMesgQueue *MesgQ_3;
    s32 AudiolistCount;
    u32 VoicesUsedTotal;
    u16 frequency;
    u16 audioLength;
    u16 unk0x324;
    u16 audioLengthMin;
    u16 bufferSize;
    u8 VoicesUsed;
    u8 audio_tally;
    s8 buffer_choice;
    u8 AudioListBool;
};
typedef enum VoiceFlag {
    VOICE_STOP=2,
    VOICE_FLAG4=4, //play? loop?
    VOICE_SETPITCH=8,
    VOICE_SETVOL=0x10,
    VOICE_SETPAN=0x20
} VoiceFlag;

#define ALHeapSize 0x12000 //size of ALHeap Base
#define PVoiceCount 0x20 //length of Voice_Aidyn array
#define ACMDSize 0x800 //count af Acmd's
#define MTIME 1000

void adjust_soundstruct_vec3(SoundStructA *);
void set_SFX_ZoneDatByte(SFX_Struct *,s16,s16);
void SoundStructA_get_borg12(SoundStructA *);
void ClearAudioBubble(SoundStructA *);

//redo following functions as SFX_Struct methods?

void init_sfx_struct(SFX_Struct *);
void SoundStructA_remove(SFX_Struct *,SoundStructA *);
SoundStructA * soundStructA_set(SFX_Struct *,voxelObject *,int ,u8);
SoundStructB * PlayAudioSound(SFX_Struct *,u32 ,u32,float,short,u16);
void FreeAudioSound(SFX_Struct *,SoundStructB *);
void clear_sfx_substruct_2(SFX_Struct *,s16);
void play_sfx_before_delete(SFX_Struct *,SoundStructA *);
SoundStructB * get_audio_substruct_2_by_index(SFX_Struct *,u16);
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

namespace DCM{
    void StartThread(OSSched *sched,u16 freq,u8 pri,u8 id);
    void ClosePlayer(void);
    void AddPlayer(ALPlayer *x);
    u32 AddVoice(u8 *oIndex,u32 *oID,Borg11Data *istDat,u32 param_4,u32 len,u32 loopEnd,u8 loops,u16 pitch,u8 vol,u8 pan,u8 param_11);
    u32 SetVoicePitch(u8 voice,u32 id,u16 p);
    u32 SetVoiceVol(u8 voice,u32 id,byte vol);
    u32 SetVoicePan(u8 voice,u32 id,byte pan);
    u32 StopVoice(u8 voice,u32 id);
    u8 IsVoiceActive(u8 voice);
    u32 GetVoiceID(u8 voice);
    u32 GetUnk0x38(u8 voice);
};
void AudioProcInit(void);
void * _amDmaNew(void);
u8 * dmaProc(u8 *param_1,s32 param_2,s32 param_3);
ALMicroTime soundVoiceHandler(void);
Acmd * CreateAudioList(void);
void AudioSetTask(Acmd *param_1);
u16 Ofunc_8009a0fc(void);
s32 Ofunc_8009a108(void);
void* Ofunc_8009a114(void);
u8 Ofunc_8009a12c(void);
