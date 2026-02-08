#include "borg/borg6.h"
#include "mathN64.h"


struct Borg7AnimChache {
    struct Borg6Header *anis[3];
    u32 indecies[3];
};

struct Borg7Struct2{
    u8 ani;
    u8 unk1;
    u8 flag;
    u8 unk3;
};

struct Borg7Struct1{
    u32 borg6;
    u16 flag;
    u16 subSubCount;
    Borg7Struct2* p;
};

struct Borg7Data {
    u32 transformIndex;
    int subCount;
    int unk8;
    Borg7Struct1 sub[1]; //acually Borg7Struct1[subCount]
};

struct struct_1 {
    Borg7Struct1 *sub;
    Borg6Header *b6;
};

struct Borg7Header {
    borgHeader head;
    SceneData *sceneDat;
    u16 currentAni;
    u16 prevAni;
    u16 nextAni;
    u16 unk12;
    u32 unk14;
    struct_1*unk18;
    struct_1 *unk1c;
    vec3f unk20;
    vec3f unk2c; //z axis used for moving playerData based on 2d normal and scale
    Borg7AnimChache aniChache;
    Borg7Data dat;
};