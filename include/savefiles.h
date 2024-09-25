#include "typedefs.h"
#include "entity.h"
#include "stringN64.h"

typedef struct SaveFile SaveFile, *PSaveFile;

struct SaveFile {
    u8* dat;
    u32 pos;
};

namespace SaveParty{
    void Init(SaveFile *save,u8 *dat);
    void SaveBits(SaveFile *sav,u32 dat,uint bits);
    u32 LoadBits(SaveFile *save,u32 bits);
    void Advance(SaveFile *sav,u32 bits);
    u32 RShift(u32 x,u8 shifts);
    u32 GetBit(u8 *arr,u32 x);
    void WriteData(u8 *dat,u32 filesize,u32 size);
    void GetData(u32 *dat,uint shift,int bits);
    //may need split into seperate namespace/class?


    void SavePotionEffect(SaveFile *sav,PotionEffect *pot);
    u8 LoadPotionEffect(SaveFile *sav,CharSheet *chara);
    void SaveSpellEffect(SaveFile *sav,Temp_enchant* ench);
    Temp_enchant* LoadSpellEffect(SaveFile* sav);
    void SaveStatMod(SaveFile* sav,StatMod* mod);
    StatMod* LoadStatMod(SaveFile* sav);
    void SaveItem(SaveFile* sav, ItemInstance* item);
    void LoadItem(SaveFile* sav, ItemInstance* item);
    void SaveCharEXP(SaveFile* sav, charExp* exp);
    void LoadCharEXP(SaveFile* sav, charExp* exp);
    void SaveCharStats(SaveFile *sav,CharSheet *chara);
    void LoadCharStats(SaveFile *sav,CharStats *chara);
    void SaveSpell(SaveFile *sav,Spellbook *spellbook,u8 school);
    void LoadSpell(SaveFile *sav,Spellbook *spellbook,u8 school);
    void SaveSpellsFromSchool(SaveFile *sav,Spellbook *spellbook,u8 school);
    void LoadSpellsFromSchool(SaveFile *sav,Spellbook *spellbook,u8 school);
    void SaveInGameTime(SaveFile *sav);
    void LoadInGameTime(SaveFile *sav);
    void SaveGold(SaveFile *sav);
    u32 LoadGold(SaveFile *sav);
    void SaveTimer(SaveFile *sav,u32 t);
    s32 LoadTimer(SaveFile *sav);
    void SaveAlaron(SaveFile *sav,CharSheet *alaron);
    void LoadAlaron(SaveFile *sav,CharSheet *alaron);
    void SaveCharSheet(SaveFile *sav,CharSheet *chara);
    CharSheet* LoadCharSheet(SaveFile *sav);
    void SaveCharSheetEffects(SaveFile *sav,CharSheet *chara);
    CharSheet * LoadCharSheetEffects(SaveFile *sav);
    void LoadShield(SaveFile *sav,CharSheet *chara);
    void LoadWeapon(SaveFile *sav,CharSheet *chara);
    void LoadArmor(SaveFile *sav,CharSheet *chara);
    void LoadGear(SaveFile *sav,CharSheet *chara);

};