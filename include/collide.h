#include "GhidraDump.h"
#include "mathN64.h"


struct SpeedProperty {
    vec3f gravity;
    vec3f Accel;
    float velScale;
};

struct collisionTypeA {
    float unk0;
    float unk4;
    float unk8; /* set to 0 */
    float unkc; /* set to 0, unused */
    float unk10; /* set to 0, unused */
    u16 flag; /* set when callback added */
    u32 unk18;
    ulong (*callbackA)(void); /* never seem to be set outside orphaned code */
    ulong (*callbackB)(void); /* never seem to be set outside orphaned code */
    ulong (*callbackC)(void); /* never seem to be set outside orphaned code */
};

struct EnvProp {
    SpeedProperty *Speed;
    collisionTypeA *colA;
    u32 unk;
};

//Hitbox for actors and particle emmiters
struct collisionSphere {
    float radius;
    vec3f pos;
    vec3f vel;
    ushort flags; /* 0x400 - ?,0x8000 remove */
    short unk1e;
    vec3f polyNormal;
    vec3f unk2c; /* another normal? set, but not read. */
    EnvProp *envProps;
    void *link; /* a guess of PlayerData* . */
};