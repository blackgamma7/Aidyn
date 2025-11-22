#include "typedefs.h"
#include "stringN64.h"

struct SaveFile {
    u8* dat;
    u32 pos;
};

namespace SaveParty{
    void Init(SaveFile *save,u8 *dat);
    void SaveBits(SaveFile *sav,u32 dat,u32 bits);
    u32 LoadBits(SaveFile *save,u32 bits);
    void Advance(SaveFile *sav,u32 bits);
    u32 RShift(u32 x,u8 shifts);
    u32 GetBit(u8 *arr,u32 x);
    void WriteData(u8 *dat,u32 filesize,u32 size);
    void GetData(u32 *dat,u32 shift,int bits);

};

struct SavePartyHeader {
    int time;
    ItemID party[4];
    char name[20];
};

struct mapFloatDat {
    vec3f playerVec3;
    vec2f playerVec2;
    vec3f cameraVec3;
    u16 MapShort1;
    u16 MapShort2;
    u8 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    u16 field8_0x2a;
};

struct SaveDatStruct {
    SavePartyHeader headerDat;
    u8 field1_0x20[0x20];
    mapFloatDat mapDat;
    u8 field34_0x6c[20];
    u8 flags[0x1400/8]; 
    u8 screenshot[4096];
    u8 minimap[64];
    u8 gameState[1984];
    u8 voxelChart[256]; /* last 4 bytes for checksum */
};

struct SaveDatPointers {
    SaveDatStruct *datStart;
    SavePartyHeader *savePartyHead;
    mapFloatDat *mapdata;
    u8 *EventFlags;
    u8 *gamestate;
    void *screenshot;
    u32 *minimap;
    u8 *voxelChart;
};

//to save space, only the max changed bits are saved/load into the file
//example: since base skill levels max at 10, you only need to save 4 of the 8 bits.

#define SaveBits_Bool 1 //1 bit's all you need.
#define SaveBits_Nibble 4 //save half a byte
#define SaveBits_Byte 8 //save entire byte
#define SaveBits_Halfword 16 //save entire half
#define SaveBits_Word 32 //save entire word
#define SaveBits_Float 32 //save entire word of float

#define SaveBits_ItemID 13
#define SaveBits_SpellCharge 5
#define SaveBits_StatMod 10
#define SaveBits_Timer 12

#define SaveBits_ItemInstance (SaveBits_ItemID+SaveBits_SpellCharge+SaveBits_StatMod)

#define SaveBits_PotionID SaveBits_Nibble
#define SaveBits_PotionPower SaveBits_Nibble
#define SaveBits_PotionTimer (SaveBits_PotionID+SaveBits_PotionPower+SaveBits_Timer)
#define SaveBits_PotionEffects (SaveBits_PotionTimer*POTION_FXMAX)

#define SaveBits_SpellLV SaveBits_Nibble
#define SaveBits_SpellIndex 6
#define SaveBits_SpellVarA 5
#define SaveBits_SpellVarB SaveBits_Bool
#define SaveBits_SpellEffect (SaveBits_SpellLV+SaveBits_SpellIndex+SaveBits_SpellVarA+SaveBits_SpellVarB+SaveBits_Timer)
#define SaveBits_SpellSkip SaveBits_SpellEffect-SaveBits_SpellLV
#define SaveBits_SpellEffects (SaveBits_SpellEffect*MAGIC_FXMAX)
#define Save_SchoolMax 13
#define SaveBits_SpellSchools (SaveBits_SpellLV*(Save_SchoolMax+10))

#define SaveBits_Experience 24
#define SaveBits_CharExp SaveBits_Experience*2

#define SaveBits_SkillLV SaveBits_Nibble
#define SaveBits_CharSkills (SaveBits_SkillLV*(SKILLCOUNT+6))

#define SaveBits_StatStam SaveBits_Byte
#define SaveBits_StatEndLV 6
#define SaveBits_StatOther 5
#define SaveBits_CharStats (SaveBits_StatStam+(SaveBits_StatEndLV*2)+(SaveBits_StatOther)*4)*2

#define SaveBits_AlaronNameMagic (SaveBits_Byte*20)+(SaveBits_SpellSchools*3)

#define SaveBits_CharSheet SaveBits_Byte+SaveBits_CharExp+SaveBits_CharStats+SaveBits_ItemInstance\
                +(SaveBits_ItemInstance*2)+(SaveBits_ItemInstance*12)+SaveBits_SpellSchools+SaveBits_CharSkills
#define SaveBits_CharSheetEffects (SaveBits_SpellEffects+SaveBits_PotionEffects+SaveBits_CharSheet)
