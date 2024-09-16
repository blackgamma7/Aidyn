/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown.
1-Textures. use some compression method.
2-Geometry data. conatins verts and ucode (primariliy G_TRI1)
3-only 5 in the game. 48 bytes big. mystery.
4-3 floats, 8 more bytes. no clue what they're for
5-Model data. uses the aformentioned types.
6-animation data.
7-Actor models.
8-Images. used for UI, primarily. Easily viewable in Texture64 when extracted.
9-Map data. contains collision and object data
10-unused. refered internally in Debug as "CollisionMaterial"
11-DCM instrument for SFX and BGM
12-Sound/music.
13-Dialogue/cutscenes.
14-unused. refered internally in Debug as "GameState"*/

struct Borg_8_dat {
    u16 format;  //enum of {?,RGBA32,GRBA16,?,CI8,IA8} thus far.
    u16 height;
    u16 width;
    u16 PAL size;
    u32 flags;
    u32 offset; //either 0x10(past the header) or 0x210(header + pallette)
};

//borg 9 data structs.
struct Borg_9_data{
    vec3f floatsA; /* position? */
    vec2f floatsB; /* size? */
    u8 unk1[6]; /* seems unused */
    u8 byte0x1a;
    u8 byte0x1b;
    u16 shortA;
    u16 shortB;
    u8 unk[2];
    u16 Vertex_count;
    u16 borghpys_count;
    u16 unk0x26;
    u16 voxelCount;
    u16 unkStructCount;
    s16 * counting_pointer;
    s32 someint;
    s16 * pointer2;
    vec3f* Verticies;
    struct borg9_phys * phys_pointer;
    s32 someInt_2;
    mapVoxel* ref_objs; 
    struct borg_9_struct * unkStructs;
};
struct borg9_phys { //collision faces
    vec3f * VertexEntries[3];
    vec3f vec3_0xc; //face normal?
    void * ptr_0x18;
    u16 unk0x1c; //flags?
    u16 GroundType; //for footstep noises
};

enum Vobject{
    VOBJECT_SCENE, //any static meshes
    VOBJECT_CONTAINER, //chests and various loot.
    VOBJECT_LIGHT,
    VOBJECT_AUDIO, //also generated in "playSFX" func
    VOBJECT_WANDERNODE, // points in paths for "monterparty" entities
    VOBJECT_MONSTERPARTY, //enemy encounter data and NPC's
    VOBJECT_REFERNCEPOINT, //locator for various purposes
    VOBJECT_TELEPORTER, //doors, tunnels, ladders, ect.
    VOBJECT_CAMERA,
    VOBJECT_DIALOUGE, //triggers "borg 13"
    VOBJECT_TRIGGER,
    VOBJECT_SAVEPOINT, //unused? game saves virtually where/whenever.
    VOBJECT_CODE, //in game, but dunno what it does special.
}
/* bitfeild flags id'd
0001
0002
0004
0008
0010
0020=NoEXPPak. render if there's not an EXP Pak
0040=EXPPak. opposite above.
0080 may also be an unused visibility flag
0100
0200="used". also used to set header "flagB"
0400
0800
1000
2000
4000
8000=visible/active.*/

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    vec3f coords; /* Where is it */
    float size; /* how big is it. */
    u32 timestamp; /* when was it called */
    u16 Bitfeild; /* 16-bit Flags for rendering */
    enum Vobject type; /* object type. 16-bit*/
    s16 LinkID[2]; /* used by containers to link with scene object. holds index of relevant voxel. */
    u16 flagA; // if non-zero, flagA detemines which needs to be set to activate
    u16 flagB;
    u16 flagC;
    u8 unk0x22;
    u8 unk0x23;
    void * ptr0x24;
};

struct Scene_obj_dat{
    float unk0x0; //size mirror?
    u32 borg_7_index;
    AnimationData* anidat;
    float unk0xc;
    u32 borg5_index;
    u8 unk0x14[8];
    u32 borg5_index2; //used for open chests?
    u32 unk0x20;
    vec3f rotation; //in radians. x usually has an odd angle, for some reason.
    vec3f scaling;
    color32 tinting; //used if SceneFlags&0x10
    u16 unk0x40;
    u16 Sceneflags;
};
/* Sceneflags id'd
0001
0002
0004
0008
0010=use tinting.
0020=tint with sunlight
doesn't seem to use all 16 bits.*/

struct container_Dat {
    float unk0x0; //size mirror?
    float chestSize; //proximity to activate.
    u16 open_flag;
    u16 explode_flag;
    s16 trap_lv;
    u16 unk0x14;
    struct ItemID LootCat; /* chestdb id */
    u16 LootType;
    u16 LockLV;
    u16 Gold; /* money or reagents, depending on LootType */
    struct ItemID item; // static item
    u16 unk0x1a; //align?
    s16 lootCatDrop[6][2]; /* populated with chestdb items and quantities*/
    u8 align[16];
};

struct light_dat{
    color32 cols[3]; //first seems to be used for blending.
    u16 lightType; //4 valid types. {static(use only cols[1]),alternating blend,sinewave blend,random blend}
    u16 pad;
    float f0; //blend factor, changes per type.
    float f1; //blend speed,bigger is slower
    float f2; //used in light type 3 for rng lerp.
    u8 align[40];
};

struct audio_obj_dat {
    u32 borg12Index;
    u32 unk0x4;
    float volume;
    u16 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    float unk0x10;
    u16 AudioFlags;
    //these are set in-game, it seems
    u16 unk0x16;
    float volume_;
    u32 sfx_arg3;
    u32 unk0x20;
    u16 unk0x24;
    u8 dcmIndex;
    u8 align[29];
};
/* AudioFlags id'd
0001=loop
0002
0004
0008=Don't diminish by distance
0010=BGM
doesn't seem to use all 16 bits.*/
struct wandernode_dat{
    vec2f startCoords;
    float wanderRadius;
	float randVal;
	float NodeChangeChance;
	u16 Timer; //frame ticks before changing nodes.
    u16 nodeflags; //only first 3 bits used, it seems.
    u16 NodeA; //indecies of sibling nodes on map chunk.
	u16 NodeB;
    u8 align[40];
};
struct monsterparty_dat {
    struct monsterpartyEntry enemyEntries[8];
    struct ItemID entityID; //avatar of party or NPC
    struct ItemID globalLoot;
    u16 unk0x24;
    u8 unk0x26;
    u8 unk0x27;
    u16 unk0x28;
    u16 totalsize;
    struct ItemID unk0x2c; //usually mirror of entityID.
    u16 wanderNode; //index on map chunk.
    u16 monsterpartyFlags;
    u8 unk0x32;
    u8 unk0x33;
    u32 borg_13;
    u8 align[12];
};

struct referencepoint_dat{//used as locators for tp's, camera's dialouge scripts, spawners, ect.
    u16 refpointID;
    u16 pad;
    char name[16];
    vec3f position; //used in tp for facing?
    u8 align[36];
};

struct teleport_dat {
    u16 MapDatA;
    u16 MapShort1;
    u16 MapShort2;
    u16 refPoint_ID; //determines location of teleport.
    s16 trap_value;
    u16 trapBool16;
    u16 lock_lv;
    u16 refPoint_ID2;
    u16 lock_flag;
    u16 lockpick_flag_2;
    u16 trap_flag;
    u16 flag_0x3e;
    u16 secrect_door_flag;
    u16 secretDoorVal;
    char name[16]; //internal
    u8 align[24];
};

struct camera_dat {
    s16 refpoint_ID; //used as inital aim for camera.
    u16 CameraFlags; //bitfeild in need of later documentation.
    u32 timestamp;
    vec3f vec3_A;
    vec3f vec3_b;
    vec3f vec3_C;
    float unk0x54;
    u8 align[20];
};

struct dialoug_dat {
    u16 borg_13;
    u16 MapDatA;
    u16 MapShortA;
    u16 MapShortB;
    u16 RefPointID;
    //below may be wrong, a lot of guessing here.
    u16 unk0xa;
    u16 unk0xc;
    u8 unk0xe[6];
    u16 unk0x14;
    u16 unk0x16;
    u8 align[44];
};

struct Trigger_dat {
    s16 triggertype; // 1,2,4 are valid
    u8 unk0x2;
    u8 unk0x3;
    u16 flagA;
    u16 flagB;
    u16 flagC;
    u16 unk0xa;
    s16 unk0xc;
    u8 unk0xe[6];
    u16 unk0x14;
    u16 unk0x16;
    u32 unk0x18;
    char name[16];
    u8 align[24];
};
//likely actual struct - used non-union structs in ghidra as they played nicer.
struct mapVoxel { //base object of "ref_objs"
    struct voxelHeader header; //common for all ref obj's
    union{
        Scene_obj_dat scene;
        container_Dat container;
        light_dat light;
        audio_obj_dat audio;
        wandernode_dat wander;
        monsterparty_dat monster;
        referencepoint_dat refpoint;
        teleport_dat teleport;
        camera_dat camera;
        dialoug_dat dialoug;
        Trigger_dat trigger;
        u8 other[68]; //"CODE" is usually blank, "SAVEPOINT" is never used (you can save anywhere.)
    }d;
};
struct Borg_3{
    u32 index;
    u8 unk0x4[4]; //align?
    //actual file data
    u16[4] perspnorm;
    f32 unk0x10;
    f32 fovy;
    f32 nearplane,farplane;
    f32 unk0x20;
    f32 aspect;
    s32 unk0x28; //pointer? seems unused.
    Mtx* mtx_;
};
