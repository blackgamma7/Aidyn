#include "itemID.h"
#include "n64Borg.h"
#include "PlaneObj.h"
#include "collide.h"
#include "Controller.h"
#include "SceneData.h"

#define PLAYER_ABS_MAXPLAYERS 40

typedef enum PLAYERDATA_Flags {
    ACTOR_ISPLAYER=1,
    ACTOR_2=2,
    ACTOR_4=4, //Combat movement position has ben set?
    ACTOR_WALKONLY=8,
    ACTOR_CANMOVE=0x10,
    ACTOR_CANROTATE=0x20,
    ACTOR_40=0x40, //set/unset, not Read?
    ACTOR_80=0x80, //unused?
    ACTOR_100=0x100, //actor is "dying?"
    ACTOR_200=0x200, //set in combatEnt_setup(), not read?
    ACTOR_400=0x400, //skip player processing?
    ACTOR_800=0x800, //adds position to list in ProcessPlayers()?
    ACTOR_1000=0x1000, //something with movement?
    ACTOR_2000=0x2000, //visibility?
    ACTOR_4000=0x4000 //unused?
} PLAYERDATA_Flags;


struct attachmentNode {
    uint borg5;
    SceneData *sceneDat;
    u16 index;
};
struct DCMSub2 {
    Borg12Header *borg12;
    s32 index;
    u8 id;
};
struct audiokeyEntryA{
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
};

struct audioKeyEntryB {
    u16 unk0;
    u8 id1;
    u8 arrLen;
    u8 arr[4];
};

struct MoveQueueEntry {
    vec2f pos2d;
    float rad;
    short active;
    s16 flag;
};
//enums for different animation states
enum AniTypes{
    AniType_0,
    AniType_1,
    AniType_Walk=2,
    AniType_Run,
    AniType_4, //speaking motion?
    AniType_GetBuff=5,
    AniType_6,
    AniType_Hit,
    AniType_8,
    AniType_Dying,
    AniType_10,
    AniType_Atk3=12,
    AniType_Atk2,
    AniType_Atk5,
    AniType_Atk4,
    AniType_Atk0,
    AniType_Atk1,
    AniType_Atk6,
    AniType_19,
    AniType_20,
    AniType_21,
    AniType_22,
    AniType_23,
    AniType_24,
    AniType_Sneak,
};
//Main actor struct for entites moving in world
struct playerData {
    u16 ID;
    short removeFlag;
    Borg7Header *borg7P;
    SceneData *SceneDat;
    u32 borg7;
    u32 nextBorg7;
    short ani_type;
    u16 unk16;
    short unk18;
    u16 unk1a;
    u16 unk1c;
    u16 flags;
    vec2f facing;
    vec2f facingMirror;
    float scale;
    float scaleRad;
    float combatRadius;
    vec3f vec3_0x3c;
    vec3f vec3_0x48;
    u32 unk54;
    float unk58;
    float unk5c;
    u16 unk60;
    collisionSphere collision;
    vec3f positionMirror;
    EnvProp envprop;
    collisionTypeA colTypeA;
    SpeedProperty colTypeB;
    u16 Ground_type;
    u16 Ground_Type_New;
    short unk104;
    undefined field36_0x106;
    undefined field37_0x107;
    float unk108;
    float voxelReach; /* 100f default */
    vec3f voxelCoords;
    ControllerFull controller;
    u32 buttonMask;
    MoveQueueEntry moveQueue[16];
    short moveQueueIndex;
    u16 moveQueueIndex2;
    float aiDestDist;
    short aiTravelTime;
    undefined field48_0x25e;
    undefined field49_0x25f;
    vec2f aiDest;
    float wanderRadius;
    vec2f unk26c;
    vec3f combat_vec3;
    float combatMoveSpeed;
    u32 unk284; /* unused? */
    PlaneObj shadow;
    u8 unused518[496];
    short unk708;
    u8 visible_flag;
    u8 alaron_flag; //set if Alaron's model
    u8 shadowAlpha; //used for alpha
    u8 zoneDatByte;
    u8 unk70ee;
    undefined field64_0x70f;
    DCMSub2 dcmDat[2];
    short dcmDatIndex;
    u16 movement_;
    u16 spellUsed;
    undefined field69_0x72e;
    undefined field70_0x72f;
    attachmentNode attachmentNodes[3];
    u16 rangerWarrior;
    ItemID ent_ID;
    u16 Ent_index;
    float unk75c;
    float unk760;
    vec3f CombatTint; /* tint by combat effect */
    vec3f skyTint; /* tint from environmental light */
    char unk77c;
};

struct audiokey_struct {
    audiokeyEntryA* a;
    audioKeyEntryB* b;
    u16* c;
    u16 aLen,bLen,cLen; //lengths of entries. unused.
    u16 unk[3];//0, unused.
    audiokeyEntryA d[220];
    audioKeyEntryB e[276];
    u16 f[560];
    u8 unk2[8];//0, unused
};

struct PlayerHandler {
    short max_player;
    u16 initFlag;
    Camera_struct *camera;
    short cameraFocus;
    undefined field4_0xa;
    undefined field5_0xb;
    playerData *playerDats;
    s16 unk10[PLAYER_ABS_MAXPLAYERS];
    short playerCount;
    u16 counter;
    float shadowDist;
    float float_0x68;
    Borg1Header *shadowTexture;
    Borg1Header * unk70; //unused? queded for freeing.
    audiokey_struct *audiokey;
};

struct player_char_struct {
    playerData *playerDat;
    u32 player_form;
    float collisionRadius;
    u16 show_portaits;
    u16 some_sound_var;
    u16 unk10;
    undefined field6_0x12;
    undefined field7_0x13;
    WidgetMenu *smallerDebugWindow;
    WidgetMenu *debugMenuTP;
    WidgetMenu *debugMenuActor;
    u32 debugMenuUnused0;
    WidgetMenu *debugMenuEnemy;
    WidgetMenu *debugMenuArena;
    u32 debugMenuUnused1;
    BaseWidget *text_window;
    u8 unkState;
    undefined field17_0x35;
    ItemID current_shopkeep;
};

namespace Actor{
    u8 IsFlyingModel(playerData*);
    void GetPosOnLoadedMap(playerData*,vec3f*);
    void AddPosOnLoadedMap(u8,vec2f *);
    void SubPosOnLoadedMap(u8,vec3f *);
    u8 CheckCollision(playerData *,float ,s16 ,u16);
    void Init(playerData *,u16 );
    Gfx* CalculateShadow(playerData *,Gfx *,float ,u8);
    playerData * AllocPlayer(float radius,float x,float y,float z,u32 borg7);
    void FreePlayer(playerData *);
    void remove_flagged_playerdata(void);
    void ChangeAppearance(playerData *,u32);
    void FreePlayerActor(playerData *);
    void SetFlag(playerData *,u16);
    void UnsetFlag(playerData *,u16);
    void DeathFlag(playerData *);
    void EmptyHands(playerData *);
    void Move(playerData *,controller_aidyn *);
    void MemsetController(ControllerFull *);
    void ClearInput(playerData *);
    void setMoveBasedOnCamera(vec2f *,vec2f *);
    void SetControllerWalk(ControllerFull *,vec2f *);
    void SetControllerRun(ControllerFull *,vec2f *);
    void ClearInputMoveFlags(playerData *);
    void SetAiDest(playerData *p,float x,float y,float rad,u16 flag);
    void ResetMoveQueue(playerData *);
    void SetFacing(playerData *,float,float);
    void MoveTo(playerData *);
    void SetCombatMove(playerData *param_1,vec3f *pos,float range);
    void UnsetFlag4(playerData *);
};

//TODO: Rename some of the following to use Actor namespace

void get_mapcellsize(u8 ,vec2f *);
void InitPlayerHandler(Camera_struct *,s16,s32);
void FreePlayerHandler(void);
u8 PlayerShadowAlpha(PlayerHandler *,playerData *,float,u8);
void playerdata_remove_dcm(playerData *,u16);
DCMSub2 * AllocPlayerAudio(playerData *,audioKeyEntryB *,u16,u16);
u8 FUN_8001620c(playerData *);
void ProcessPlayers(PlayerHandler *,s16);
void FUN_80017330(playerData *,float,float,float,float);
void FUN_80017388(playerData *,float);
void some_player_render_sub(playerData *,SceneData *,vec3f*,u8,u16);
void set_sun_light(SceneData *,u16,voxelObject*,u8);
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
void setCombatCameraMode(u16);
void SetPlayerMoveToQueue(playerData *,float,float,float,s16);
void FUN_80019770(playerData *);
void FUN_80019b08(playerData *);
void debug_sub_3(void);
Gfx * renderPlayerShadows(PlayerHandler *param_1,Gfx *gfx);

//audiokey.cpp

audiokey_struct * load_audiokey();
void Audiokey_free(audiokey_struct *p);
void FUN_8005bf10(playerData *pDat,audioKeyEntryB *UAS,u16 id1,u16 id2,u16 amp,byte vol,s8 pan
                 ,u8 *arr,byte arrsize,u16 type);
bool FUN_8005c0f0(playerData *param_1,audiokey_struct *param_2,audiokeyEntryA *entryA,u16 param_4
                 ,u16 param_5,u16 param_6,byte vol,u8 param_8);
bool FUN_8005c2f0(playerData *param_1,u16 param_2,u8 param_3,u8 param_4);
void player_audiokey(playerData *pDat,u16 id1,u16 id2,u16 amp);
audioKeyEntryB audioKeyEntryB_ARRAY_800ee9d0[];
u8 audiokey_unk1[][3];
u8 audiokey_unk2[][3];
u8 audiokey_unk3[][3];
u8 audiokey_unk4[][3];
u32 u32_ARRAY_800eec98[];
u32 u32_ARRAY_800eee18[];
u32 u32_ARRAY_800ef010[];

u32 _bigw_flag=0; //used for "!bigw" cheat
u32 _balloon_flag=0; //used for "!balloon" cheat
u32 _flea_flag=0;//used for "!flea" cheat

u16 ProcessPlayersTally=0;

u32 some_borg5= 0x25AA;

vec3f player_coords_A;
vec3f player_coords_b;
u16 map_shorts_A[2];
u16 map_shorts_b[2];
