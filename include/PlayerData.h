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
    SceneData *sceneDat;
    u16 index;
};
struct DCMSub2 {
    Borg12Header *borg12;
    u32 index;
    u8 id;
};
struct UnkAudioStruct {
    u16 field0_0x0;
    u8 field1_0x2;
    u8 randVal;
    u8 field3_0x4[4];
};

struct MoveQueueEntry {
    vec2f pos2d;
    float rad;
    short active;
    s16 flag;
};

//Main actor struct for entites moving in world
struct playerData {
    u16 ID;
    short removeFlag;
    Borg7header *locator_pointer;
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
    float interactRadiusA;
    float interactRadiusB;
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
    s16 unk10[PLAYER_ABS_MAXPLAYERS];
    short playerCount;
    u16 counter;
    float shadowDist;
    float float_0x68;
    Borg1header *shadowTexture;
    Borg1header * unk70; //unused? queded for freeing.
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
    BaseWidget *smallerDebugWindow;
    BaseWidget *debugMenuTP;
    BaseWidget *debugMenuActor;
    u32 debugMenuUnused0;
    BaseWidget *debugMenuEnemy;
    BaseWidget *debugMenuArena;
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
    void SetAiDest(playerData *,float,float,float,u16);
    void ResetMoveQueue(playerData *);
    void SetFacing(playerData *,float,float);
    void MoveTo(playerData *);
    void SetCombatMove(playerData *,vec3f *,float);
    void UnsetFlag4(playerData *);
};

//TODO: Rename some of the following to use Actor namespace

void get_mapcellsize(u8 ,vec2f *);
void InitPlayerHandler(Camera_struct *,s16,s32);
void FreePlayerHandler(void);
u8 PlayerShadowAlpha(PlayerHandler *,playerData *,float,u8);
void playerdata_remove_dcm(playerData *,u16);
DCMSub2 * AllocPlayerAudio(playerData *,UnkAudioStruct *,u16,u16);
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


u32 _bigw_flag=0; //used for "!bigw" cheat
u32 _balloon_flag=0; //used for "!balloon" cheat
u32 _flea_flag=0;//used for "!flea" cheat

u16 ProcessPlayersTally=0;

u32 some_borg5= 0x25AA;

vec3f player_coords_A;
vec3f player_coords_b;
u16 map_shorts_A[2];
u16 map_shorts_b[2];
