#include "borg/borg9/b9phys.h"
#include "borg/borg9/b9voxel.h"

typedef enum EnumMapDatA {
    MAPA_Overworld,
    MAPA_GoblinCamp,
    MAPA_PortSaiid,
    MAPA_Lighthouse,
    MAPA_GwerniaCastle,
    MAPA_GwerniaInterior,
    MAPA_Interior,
    MAPA_Erromon,
    MAPA_Terminor,
    MAPA_Barrows,
    MAPA_RoogCave,
    MAPA_JundarInteriors,
    MAPA_EhudUnder,
    MAPA_Ugairt,
    MAPA_Ugairt2,
    MAPA_ChaosIsle,
    MAPA_Battle,
} EnumMapDatA;


struct Borg9Data {
    vec3f floatsA; /* position? */
    vec2f floatsB; /* size? */
    u8 unk1[6]; /* seems unused */
    u8 byte0x1a;
    u8 byte0x1b;
    u16 shortA;
    u16 shortB;
    u8 unk[4];
    u16 borghpys_count;
    u16 field9_0x26;
    u16 voxelObjCount;
    u16 collideSectionCount;
    s16 *collideCount;
    void *someint;
    s16 *lightCount;
    vec3f *verts; //vertex data
    borg9_phys *phys_pointer;
    void* someInt_2; //(off)set, seems unused.
    voxelObject *voxelObjs;
    CollideSection *collideSections;
};
struct Borg9Header {
    borgHeader head;
    Borg9Data dat;
};

//n64borg/collisionZone.cpp

u8 borg9_func_b(void*,void*);
void * set_pointer_offset(void *A,void *B);
void borg9_func_a(Borg9Header *);
void n64BorgCollisionZone_free(Borg9Header *);
Borg9Header * loadBorg9(u32);
void remove_borg_9(Borg9Header *);