/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown.
1-Textures
2-Geometry data. conatins verts and ucode (primariliy G_TRI1)
3-only 5 in the game. 48 bytes big. mystery.
4-3 floats, 8 more bytes. no clue what they're for
5-Model data. uses the aformentioned types.
6-animation data.
7-Actor models.
8-Images. sed for UI, primarily, easily viewable in Texture64 when extracted.
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
    uint flags;
    u32 offset; //either 0x10(past the header) or 0x210(header + pallette)
};

struct Borg_9_data{
    vec3 floatsA; /* position? */
    Vec2 floatsB; /* size? */
    byte unk1[6]; /* seems unused */
    byte byte0x1a;
    byte byte0x1b;
    ushort shortA;
    ushort shortB;
    byte unk[4];
    ushort borghpys_count;
    ushort field_0x26;
    ushort ref_obj_count;
    ushort unkStructCount;
    short * counting_pointer;
    int someint;
    short * pointer2;
    float * floats_pointer;
    struct borg9_phys * phys_pointer;
    int someInt_2;
    Voxel_u* ref_objs; 
    struct borg_9_struct * unkStructs;
};
enum Vobject{
    SCENE, //any static meshes
    CONTAINER, //chests and various loot.
    LIGHT,
    AUDIO, //also generated in "playSFX" func
    WANDERNODE,
    MONSTERPARTY, //enemy encounter data
    REFERNCEPOINT, //often used for setting up battlefeild.
    TELEPORTER, //doors, tunnels, ladders, ect.
    CAMERA,
    DIALOUGE, //triggers "borg 13"
    TRIGGER,
    SAVEPOINT, //unused? game saves virtually where/whenever.
    CODE, //in game, but dunno what it does special.
}
/* bitfeild flags id'd
0001
0002
0004
0008
0010
0020=EXPPak. render if there's an EXP Pak
0040=NoEXPPak. opposite above.
0080 may also be an unused visibility flag
0100
0200="used". also used to set header "flagB"
0400
0800
1000
2000=tangible. Turned off when pass through.
4000
8000=visible.*/

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    vec3 coords; /* Where is it */
    float size; /* how big is it */
    uint timestamp; /* when was it called */
    u16 Bitfeild; /* 16-bit Flags for rendering */
    enum Vobject type; /* object type. 16-bit*/
    s16 Link ID[2]; /* usually 0xFFFFFFFF (none) */
    u16 flagA; /* event flags */
    u16 flagB;
    u16 flagC;
    u8 field_0x22;
    u8 field_0x23;
    u8 field_0x24;
    u8 field_0x25;
    u8 field_0x26;
    u8 field_0x27;
};


struct ref_obj { //base object of "ref_objs"
    struct voxelHeader header; //common for all ref obj's
    byte data[68]; //different for each.
};



