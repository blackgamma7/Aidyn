#include "GhidraDump.h"
#include "itemID.h"
#include "n64Borg.h"
#include "PlaneObj.h"
#include "collide.h"
#include "Controller.h"
#include "animationData.h"

typedef enum PLAYERDATA_Flags {
    ACTOR_ISPLAYER=1,
    ACTOR_2=2,
    ACTOR_4=4,
    ACTOR_WALKONLY=8,
    ACTOR_CANMOVE=0x10,
    ACTOR_CANROTATE=0x20,
    ACTOR_40=0x40,
    ACTOR_80=0x80,
    ACTOR_100=0x100,
    ACTOR_200=0x200,
    ACTOR_400=0x400,
    ACTOR_800=0x800,
    ACTOR_1000=0x1000,
    ACTOR_2000=0x2000,
    ACTOR_4000=0x4000
} PLAYERDATA_Flags;


struct attachmentNode {
    uint borg5;
    AnimationData *anidat;
    u16 index;
};

//Main actor struct for entites moving in world
struct playerData {
    u16 ID;
    short removeFlag;
    Borg7header *locator_pointer;
    AnimationData *anidat;
    u32 borg7;
    u32 nextBorg7;
    short ani_type;
    undefined field7_0x16;
    undefined field8_0x17;
    short field9_0x18;
    undefined field10_0x1a;
    undefined field11_0x1b;
    undefined field12_0x1c;
    undefined field13_0x1d;
    u16 flags;
    vec2f facing;
    vec2f facingMirror;
    float interactRadiusA;
    float interactRadiusB;
    float combatRadius;
    vec3f vec3_0x3c;
    vec3f vec3_0x48;
    u32 field22_0x54;
    float field23_0x58;
    float unk5c;
    u16 field25_0x60;
    collisionSphere collision;
    vec3f positionMirror;
    EnvProp envprop;
    collisionTypeA colTypeA;
    SpeedProperty colTypeB;
    ushort Ground_type;
    ushort Ground_Type_New;
    short field35_0x104;
    undefined field36_0x106;
    undefined field37_0x107;
    float field38_0x108;
    float voxelReach; /* 100f default */
    vec3f voxelCoords;
    ControllerFull controller;
    u32 buttonMask;
    MoveQueueEntry moveQueue[16];
    short moveQueueIndex;
    ushort moveQueueIndex2;
    float aiDestDist;
    short aiTravelTime;
    undefined field48_0x25e;
    undefined field49_0x25f;
    vec2f aiDest;
    float wanderRadius;
    vec2f field52_0x26c;
    vec3f combat_vec3;
    float combatMoveSpeed;
    u32 unk284; /* unused? */
    PlaneObj shadow;
    u8 unused518[496];
    short field58_0x708;
    u8 visible_flag;
    u8 alaron_flag;
    char unk70c;
    u8 zoneDatByte;
    u8 unk70ee;
    undefined field64_0x70f;
    DCMSub2 dcmDat[2];
    short dcmDatIndex;
    ushort movement_;
    ushort spellUsed;
    undefined field69_0x72e;
    undefined field70_0x72f;
    attachmentNode attachmentNodes[3];
    ushort rangerWarrior;
    ItemID ent_ID;
    ushort Ent_index;
    undefined field75_0x75a;
    undefined field76_0x75b;
    float unk75c;
    float unk760;
    vec3f CombatTint; /* tint by combat effect */
    vec3f skyTint; /* tint from environmental light */
    char field81_0x77c;
};
struct audiokey_struct {
    u8 (*a)[4];
    void* b;
    void* c;
    u8 d[1277][4];
};

struct PlayerHandler {
    short max_player;
    u16 initFlag;
    Camera_struct *camera;
    short cameraFocus;
    undefined field4_0xa;
    undefined field5_0xb;
    playerData *playerDats;
    s16 unk10[40];
    short playerCount;
    u16 counter;
    float float_0x64;
    float float_0x68;
    Borg1header *shadowTexture;
    u32 field13_0x70;
    audiokey_struct *audiokey;
};

namespace Actor{
    u8 IsFlyingModel(playerData*);
    void GetPosOnLoadedMap(playerData*,vec3f*);
    void AddPosOnLoadedMap(u8,vec2f *);
    void SubPosOnLoadedMap(u8,vec3f *);
    u8 CheckCollision(playerData *,float ,s16 ,u16);
    void Init(playerData *,u16 );
    Gfx* CalculateShadow(playerData *,Gfx *,float ,u8);
    playerData * AllocPlayer(float,float,float,float,u32);
    void FreePlayer(playerData *);
    void remove_flagged_playerdata(void);
    void ChangeAppearance(playerData *,u32);
    void FreePlayerActor(playerData *);
    void SetFlag(playerData *,u16);
    void UnSetFlag(playerData *,u16);
    void DeathFlag(playerData *);
    void EmptyHands(playerData *);
    void Move(playerData *,controller_aidyn *);
    void MemsetController(ControllerFull *);
    void ClearInput(playerData *);
    void setMoveBasedOnCamera(vec2f *,vec2f *);
    void SetControllerWalk(ControllerFull *,vec2f *);
    void SetControllerRun(ControllerFull *,vec2f *);
    void ClearInputMoveFlags(playerData *);
    void SetAiDest(playerData *,float,float,float,u16);
    void ResetMoveQueue(playerData *);
    void SetFacing(playerData *,float,float);
    void MoveTo(playerData *);
    void MoveNearShadow(playerData *,vec3f *,float);
    void UnsetFlag4(playerData *);
};

//TODO: Rename some of the following to use Actor namespace

void get_mapcellsize(u8 ,vec2f *);
void InitPlayerHandler(Camera_struct *,s16,s32);
void FreePlayerHandler(void);
u8 FUN_80015d70(PlayerHandler *,playerData *,float,u8);
void playerdata_remove_dcm(playerData *,u16);
DCMSub2 * AllocPlayerAudio(playerData *,UnkAudioStruct *,ushort,u16);
u8 FUN_8001620c(playerData *);
void ProcessPlayers(PlayerHandler *,s16);
void FUN_80017330(playerData *,float,float,float,float);
void FUN_80017388(playerData *,float);
void some_player_render_sub(playerData *,AnimationData *,vec3f*,u8,u16);
void set_sun_light(AnimationData *,u32,voxelObject*,u8);
Gfx * renderPlayers(PlayerHandler *,Gfx *,short,short,short);
void edit_playerdat_combat_pos(playerData *,vec3f *);
void FUN_800187f4(attachmentNode *);
void AttachItemToPlayer(playerData *,u16,u32);
void FreeAttachmentFromPlayer(playerData *,u16);
void ChangeAttachmentNode(playerData*,u16,u16,char*,u16);
void FUN_80018b84(void);
void FUN_80018bf0(playerData *);
void FUN_80018c38(void);
void camera_control_update_(float,float,vec2f*,vec2f*);
void setCombatCameraMode(ushort);
void SetPlayerMoveToQueue(playerData *,float,float,float,s16);
void FUN_80019770(playerData *);
void FUN_80019b08(playerData *);
void debug_sub_3(void);
