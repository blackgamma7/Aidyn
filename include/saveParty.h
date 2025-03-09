#include "entity.h"
#include "savefiles.h"

namespace SaveParty{
    void SavePotionEffect(SaveFile *sav,PotionEffect *pot);
    u8 LoadPotionEffect(SaveFile *sav,CharSheet *chara);
    void SaveSpellEffect(SaveFile *sav,Temp_enchant* ench);
    Temp_enchant* LoadSpellEffect(SaveFile* sav);
    void SaveStatMod(SaveFile* sav,StatMod* mod);
    StatMod* LoadStatMod(SaveFile* sav);
    void SaveItem(SaveFile* sav, ItemInstance* item);
    void LoadItem(SaveFile* sav, ItemInstance* item);
    void SaveCharEXP(SaveFile* sav, CharExp* exp);
    void LoadCharEXP(SaveFile* sav, CharExp* exp);
    void SaveCharStats(SaveFile *sav,CharSheet *chara);
    void LoadCharStats(SaveFile *sav,CharStats_s* chara);
    void SaveSpell(SaveFile *sav,SpellBook *spellbook,u8 school);
    void LoadSpell(SaveFile *sav,SpellBook *spellbook,u8 school);
    void SaveSpellsFromSchool(SaveFile *sav,SpellBook *spellbook,u8 school);
    void LoadSpellsFromSchool(SaveFile *sav,SpellBook *spellbook,u8 school);
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
}