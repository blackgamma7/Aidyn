#include "n64Borg.h"


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
    u16 flags; /* 0x400 - ?,0x8000 remove */
    short unk1e;
    vec3f polyNormal;
    vec3f unk2c; /* another normal? set, but not read. */
    EnvProp *envProps;
    void *link; /* a guess of PlayerData* . */
};

//collide.cpp

void FUN_800adae0(Borg9data*,vec3f*,vec3f*,float ,s16*,s16 *,s16 *,s16 *);
void FUN_800adc44(Borg9data*,collisionSphere*,s16*,s16*,s16*,s16*);
void getZonePositionShorts(Borg9data *,vec3f *,s16 *,s16 *);
bool FUN_800ade28(Borg9data*,vec3f*,s16*,s16*);
bool CheckCollision(Borg9data *,vec3f *,vec3f *,float ,vec3f *,vec3f *,s16);
bool processPlayers_sub(Borg9data *,vec3f *,vec3f *,float ,vec3f *,vec3f *);
void ProcessCollisionSphere(Borg9data *,collisionSphere *,s16);

//collide2.cpp

bool FUN_800ae760(vec3f *,borg9_phys *);
bool FUN_800aea44(vec3f *pos,vec3f *vel,float spd,borg9_phys *,float *,vec3f *);
bool FUN_800aec1c(vec3f *,vec3f *,float ,borg9_phys *,float *,vec3f *);
bool FUN_800aede8(collisionSphere *,float ,vec3f *,vec3f *,vec3f *,vec3f *);
bool FUN_800af050(collisionSphere *,float ,vec3f *,float ,float *length,vec3f *dist,vec3f *outVel);
bool FUN_800af120(collisionSphere *,float ,vec3f *pos,float ,float *,vec3f *,vec3f *);

//collide3.cpp

void init_collisionTypeA(collisionTypeA *);
void set_CollisionTypeB(SpeedProperty *);
void set_collisionSphere(collisionSphere *dat,float r,float px,float py,float pz,float vx,float vy,float vz);
int GetVoxelOffset(Borg9data *,short ,short );
borg_9_struct * borg9_get_unkStruct(Borg9data *,short ,short );

//physics.cpp

void set_checktrigger_pointer(void *);
void collisiondat_add_velocity(collisionSphere *,vec3f *accel);
void collisiondat_sub_velocity(collisionSphere *,vec3f *accel);
void collision_velocity_func(vec3f *vel,vec3f *);
void vec3A_plusBMulC(vec3f *A,vec3f *B,float c);
bool FUN_800af578(collisionSphere *,EnvProp *,vec3f *);
void PerformCallback(short type,collisionSphere *,borg9_phys *);
void Ofunc_800af7ac(collisionSphere *collide,void *callback);
void Ofunc_800af7d0(collisionSphere *collide,void *callback);
void Ofunc_800af7f4(collisionSphere *collide,void *callback);
short CollideCollisionSphereWithVoxelPolys(collisionSphere *collider,borg_9_struct *,borg9_phys *);
bool Ofunc_800aff7c(collisionSphere *,collisionSphere *);
bool FUN_800b003c(collisionSphere *,float ,collisionSphere *,float ,float *);
