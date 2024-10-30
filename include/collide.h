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
    void (*callbackA)(collisionSphere*,borg9_phys*); /* never seem to be set outside orphaned code */
    void (*callbackB)(collisionSphere*,borg9_phys*); /* never seem to be set outside orphaned code */
    void (*callbackC)(collisionSphere*,borg9_phys*); /* never seem to be set outside orphaned code */
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

void FUN_800adae0(Borg9data*,vec3f*,vec3f*,float ,s16*,s16 *,s16 *,s16 *);
void FUN_800adc44(Borg9data*,collisionSphere*,s16*,s16*,s16*,s16*);
void getZonePositionShorts(Borg9data *,vec3f *,s16 *,s16 *);
bool FUN_800ade28(Borg9data*,vec3f*,s16*,s16*);
bool CheckCollision(Borg9data *,vec3f *,vec3f *,float ,vec3f *,vec3f *,s16);
bool processPlayers_sub(Borg9data *,vec3f *,vec3f *,float ,vec3f *,vec3f *);
void ProcessCollisionSphere(Borg9data *,collisionSphere *,s16);
