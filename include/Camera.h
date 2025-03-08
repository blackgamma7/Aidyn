#include "collide.h"

// Camera Data struct
struct Camera_struct {
    vec3f pos; 
    vec3f aim; /* position to aim camera */
    vec3f posTarget;
    vec3f aimTarget;
    vec2f rotationXZ;
    vec3f rotation;
    u16 camera_mode_prev;
    u16 camera_mode;
    float unk48;
    float unk4c;
    float unk50;
    float unk54;
    float unk58;
    float unk5c;
    float unk60;
    float unk64;
    short unk68;
    u16 holdCamera;
    float camHeight;
    vec3f unk70; /* another aim target? */
    s16 unk7c;
    s16 unk7e; /* length check between aimTarget and unk70 */
    u16 unk80;
    s16 unk82;
    u16 unk84;
    Borg9data *borg_9; /* current map data */
    collisionSphere collide; /* only pos updated in 1 func, otherwise unused */
    EnvProp envProp; /* only a guess - unused */
    collisionTypeA colTypeA; /* unused */
    SpeedProperty colTypeB; /* unused */
};