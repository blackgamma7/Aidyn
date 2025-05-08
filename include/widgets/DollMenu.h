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
    UnkGuiSubstruct unkb8=UnkGuiSubstruct(22);
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
    UnkGuiSubstruct unk90=UnkGuiSubstruct(7);
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
    UnkGuiSubstruct unk7c=UnkGuiSubstruct(30);
    u32 unk8c;
    WidgetBorg8* icons[15];
    ItemID icon_item_ids[15];
    DollEquipmentMenu(CharSheet*);
    ~DollEquipmentMenu();
    void GetSlotIcons(CharSheet*);
    void GetSlotIcon(u32,ItemID);
    ItemID GetEntityItemId(CharSheet *,u8);
    void SetSlotCoords(u32 ,BaseWidget *);
    u8 Tick();
    u32 unkGetter();
};

class WidgetChild4: public WidgetMenu{
    WidgetTrainShop* menus[4];
    WidgetTrainShop* unk8c;
    u8 menuIndex;
    u8 partyPicker;
    u8 menuCount;
    WidgetInvShop* invMenu;
    WidgetSpellTrain* spellMenu;
    WidgetSkillTrain* skillMenu;
    WidgetStatTrain* statMenu;
    WidgetBorg8* background;
    WidgetClipText* expCost;
    WidgetClipText* expRemain;
    UnkGuiSubstruct unkb0=UnkGuiSubstruct(8);
    WidgetChild4(DollEquipmentMenu *,u8);
    ~WidgetChild4();
    void InitMenu(DollEquipmentMenu *,u8);
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    u32 m80038bc0();
    void m80038bdc(u8);
    void m80038c60(u8);
    void ShowEXPCosts();
    u32 GetNumber();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* LeftFunc();
    BaseWidget* RightFunc();
    BaseWidget* AFunc();
    BaseWidget* CDownFunc();
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