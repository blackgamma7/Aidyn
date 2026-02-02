#include "borg/borgHead.h"
extern struct SceneData;

struct Borg6Struct3{
    u16 unk0,unk2;
    float* unk4;
};

struct Borg6Struct2{
    s16 unk0;
    s16 unk2;
    Borg6Struct3*struct3;
    s32 unk8;
    u32 unkc;
};

struct Borg6Struct5 {
    Borg6Struct2 *struct2;
    Borg6Struct3 *struct3;
    float * unk8;
    u16 unkc;
};

struct Borg6Struct1{
    u32 borgInd;
    u32 type;//1= Borg5, 2=?,3=?
    void* unk8; //pointer used sometimes by Borg6Struct4->unk10
    u32 unkc;
    u32 struct2Count;
    Borg6Struct2* struct2;
};
struct Borg6Data{
    u32 borg5;
    s32 struct1Count;
    Borg6Struct1* struct1;
    s32 aniLength;
};
struct Borg6Struct4{
    Borg6Struct1* struct1;
    u32 unk4; //set to 0, unread
    u32 unk8; //set to 0, unread
    Borg6Struct5* struct5;
    void* unk10; //varies
    u32 unk14; //unused?
};
struct Borg6Header {
    borgHeader head;
    SceneData* sceneDat;
    Borg6Header *link;
    Borg6Header * link2;
    Borg6Struct4 *struct4;
    u32 flag;
    float unk1c; //always 1.0(?)
    Borg6Data *dat;
};