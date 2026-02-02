#include "borg/borg1.h"
#include "borg/borg2.h"
#include "borg/borg3.h"
#include "borg/borg4.h"

struct Borg5Struct2{
    Mtx mtxs[2];
    MtxF mfs[2];
    //much of what below this is unread or unused.
    u8 unk100[0x40]; //may be an Mtx(F) unused(?)
    vec3f unk140;
    vec3f unk14c;
    vec3f unk158; //set to 0 in InitBorgScene, never read(?)
    vec3f unk164; //set to 0 in InitBorgScene, never read(?)
    vec3f unk170; //used in orphaned functions.
    vec3f unk17c; //used in orphaned functions.
};
//unused as a case-switch error says. pointers are still set if there are any.
struct Borg5AniTexture{
    u8 unk0[16];
    void* p;
    u8 unk14[4];
};
struct Borg5Transform {
    u16 flag;
    u8 mtxOp;
    u8 tier;
    Borg5Transform **links;
    u32 unk0x8;
    Borg5Struct2* unkStruct;
    vec3f rot;
    vec3f pos;
    vec3f scale;
    vec3f pivot; //used for mtxOp 1
};

struct Borg5_particle{
    u16 locator0;
    u16 locator1;
    u16 aniUsed;
    u16 unk6;
    s16 partLifespan;
    s16 partLifespan2;
    u16 emmiLifespan;
    u16 flagE;//uses Borg5PartFlag
    float emmiSpeed;
    s16 unk14;
    s16 unk16;
    s16 texture;
    u16 count;
    vec3f pos;
    float randRangeA;
    vec3f pos2;
    float randRangeB;
    float randRangeC;
    u32 unk40;
    vec4f colVA;
    vec4f colVB;
    vec4f colVC;
    vec4f colVD;
    vec3f norm;
    float speed;
    float scaleRangeLo;
    float scaleRangeHi;
    float scaleValC;
    Color32 colRandLo;
    Color32 colRandHi;
    Color32 colBlend;
    u8 unkAc[20]; //unused?
};
enum Borg5PartFlag{
    B5PART_0001=0x1, //particle emmiter has height of 0.
    B5PART_0002=0x2, //unused?
    B5PART_0004=0x4, //use randRangeB for velocity range when set, 0 to randRangeB when unset
    B5PART_0008=0x8, //use randRangeA for position range when set, 0 to randRangeA when unset
    B5PART_0010=0x10, //get locator normal when set.
    B5PART_0020=0x20,
    B5PART_0040=0x40, //unused?
    B5PART_0080=0x80, //unused?
    B5PART_0100=0x100, //unused?
    B5PART_0200=0x200, //emmiter's collision position is used.
    B5PART_0400=0x400, //color colVD is used for ColorB to set particles' colorB.
    B5PART_0800=0x800, //color colVC is used for ColorB to set particles' velocity.
    B5PART_1000=0x1000, //color colVB is used for ColorB to set particles' colorB.
    B5PART_2000=0x2000, //get locator position and check B5PART_0004 when set.
    B5PART_4000=0x4000, //use colBlend to set particles' colorA
    B5PART_8000=0x8000, //use (scaleValC - scaleRangeLo) / partLifespan2 to mod particles' scale.
};
enum Borg5Instruction{
    B5INST_ZERO,//likely unused
    B5INST_LOADTEXTURE,//load texture index by value (or don't if value is 0xff)
    B5INST_MATRIX,//calulate matrix using transforms[value]
    B5INST_ANITEXTURE, //not implemmented. crashes with a warning.
    B5INST_LOADVERTS, //set current borg2 to borg2p[value] and load verticies
    B5INST_B2DLIST //load dlist of borg2p[B5INST_LOADVERTS<<8|value].dsplists[value]
};
struct Borg5Data {
    s32 transformCount;
    s32 borg4Count;
    s32 borg2Count;
    u32 borg1Count;
    s32 aniTextureCount;
    u32 instructionCount;
    Borg5Transform *transforms;
    u32 unused1c; //at least, unused according to Ghidra.
    void* unused20; //pointer to unused data?
    union{
        s32 borg3i;
        Borg3Header *borg3P;
        };
    union{
        s32* borg4i;
        Borg4Header **borg4p;
    };
    union{
        s32* borg2i;
        Borg2Header **borg2p;
    };
    union{
        s32* borg1i;
        Borg1Header **borg1p;
    };
    Borg5AniTexture * aniTextures; //not used, but pointers still set (0x18 byte struct.) 
    u16 *instructions; //first byte uses Borg5Instruction, second is described "value"
    Borg5_particle **ParticleDat;
    u32 ParticleCount;
};

struct Borg5Header {
    borgHeader head;
    void *allocedDat;
    void *aniTextures;
    Borg5Data dat;
};