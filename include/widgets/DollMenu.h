#include "widgets/WidgetMenu.h"
#include "widgets/WidgetClipText.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetTrainShop.h"
#include "party.h"
#include "unkGuiSubstruct.h"


class WidgetMenuChild2: public WidgetMenu{
    public:
    u8 partySize;
    u8 selectedMember;
    WidgetBorg8* portraits[4];
    WidgetClipText* names[4];
    u16 Hs[4];
    u16 Ws[4];
    WidgetBorg8* aspectIcon;
    WidgetBorg8* schoolIcon;
    UnkGuiSubstruct unkb8;
    WidgetMenuChild2(Party *party,u8 size,u8 selected);
    ~WidgetMenuChild2();
    u32 m80042c04();
    void SchoolAspectIcons(u8);
    Gfx* Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
};

class WidgetHealthGold: public WidgetMenu{
    public:
    WidgetClipText* LevelText;
    WidgetClipText* GoldText;
    WidgetClipText* CurrHPText;
    WidgetClipText* MaxHPText;
    WidgetBorg8* HPBar;
    UnkGuiSubstruct unk90;
    s16 HpPercent;
    WidgetHealthGold(CharSheet* chara);
    ~WidgetHealthGold();
    void Update(CharSheet* chara);
    u8 Tick();
    Gfx* Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1);
    u32 m80043c2c();
};

class DollEquipmentMenu: public WidgetMenu{
    public:
    UnkGuiSubstruct unk7c;
    u32 unk8c;
    WidgetBorg8* icons[15];
    ItemID icon_item_ids[15];
};

class WidgetChild4: public WidgetMenu{
    WidgetTrainShop* StatTrainWidgets[4];
    WidgetTrainShop* unk8c;
    u8 unk90;
    u8 partyPicker;
    u8 unk92;
    WidgetTrainShop* unk98;
    WidgetTrainShop* unk9c;
    WidgetTrainShop* skills;
    WidgetTrainShop* stats;
    WidgetBorg8* background;
    WidgetClipText* expCost;
    WidgetClipText* expRemain;
    UnkGuiSubstruct unkb0;
};

class WidgetMenuSpells: public WidgetMenu{
    WidgetTrainShop* SpellSkills[2];
    u8 selected;
    u8 unk85;
    u8 count;
    WidgetTrainShop* spells;
    WidgetTrainShop* skills;
    UnkGuiSubstruct unkGui;
    WidgetBorg8* background;
    WidgetClipText* goldCost;
    WidgetClipText* expCost;
    u32 unkac;
    WidgetClipText* expRemain;
    WidgetChild4* wc4;
};

class WidgetDollMenu: public WidgetMenu {
    WidgetMenuChild2* unk7c;
    WidgetHealthGold* charStats_widget;
    DollEquipmentMenu* itemslots_widget;
    WidgetChild4* widget88;
    WidgetMenuSpells* spells_widget;
};