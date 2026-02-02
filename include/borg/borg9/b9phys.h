#include "mathN64.h"

//a section of map collsion indecies - saves on calulating for entire map.
struct CollideSection {
    u16 *collideIndecies;
    void* unk4; //offset calculated, unused(?)
    u16 *voxelIndecies;
    u16 collideCount;
    u16 field4_0xe; //unused?
    u16 voxelSceneCount;
    u16 field7_0x12; //align?
};

enum Borg9GroundFlags{
    B9Ground_0001=1,
    B9Ground_0002=2,
    B9Ground_0004=4,
    B9Ground_0008=8,
    B9Ground_0010=0x10,
    B9Ground_m001f=(B9Ground_0010|B9Ground_0008|B9Ground_0004|B9Ground_0002|B9Ground_0001),
    B9Ground_0020=0x20,
    B9Ground_0040=0x40,
    B9Ground_0080=0x80,
    B9Ground_0100=0x100,
    B9Ground_0200=0x200,
    B9Ground_0400=0x400,
    B9Ground_0800=0x800,
    B9Ground_CanToggle=0x1000, //Can be changed by activating a trigger "voxel" in the map chunk
    B9Ground_VoxTrigger=0x2000, //triggers a teleport, camera or dialouge voxel
    B9Ground_ExpPak=0x4000, //collision flag for Expansion-Pak-Only props
    B9Ground_8000=0x8000, //unused apart from mask?
    B9Ground_mf000=(B9Ground_8000|B9Ground_ExpPak|B9Ground_VoxTrigger|B9Ground_CanToggle)
};
enum Borg9PhysFlags{
    B9Phys_0001=1,
    B9Phys_SpeedProperty=2,
    B9Phys_EdgeA=4,
    B9Phys_EdgeB=8,
    B9Phys_EdgeC=0x10,
    B9Phys_EdgeMask=B9Phys_EdgeA|B9Phys_EdgeB|B9Phys_EdgeC,
    B9Phys_VertA=0x20,
    B9Phys_VertB=0x40,
    B9Phys_VertC=0x80,
    B9Phys_VertMask=B9Phys_VertA|B9Phys_VertB|B9Phys_VertC,
    B9Phys_NormalizeTri=0x100,
    B9Phys_0200=0x200,
    B9Phys_0400=0x400, //not read?
    B9Phys_0800=0x800, //not read?
    B9Phys_DefaultCallback=0x1000, //has default callback of struct_unk_.check_trigger_func
    B9Phys_NegateColA=0x2000,
    B9Phys_4000=0x4000, //not read?
    B9Phys_8000=0x8000, //not read?
};

struct borg9_phys {
    vec3f *verts[3];
    vec3f normal;
    union{
      u32 physProp;
      struct EnvProp *envProperty;
    };
    u16 flags; // use Borg9PhysFlags
    u16 GroundType; //uses Borg9GroundFlags
};