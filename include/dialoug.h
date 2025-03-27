#include "n64Borg.h"
#include "widgets/ShadowText.h"
#include "widgets/WidgetText.h"
#include "widgets/WidgetScrollMenu.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/handler.h"
#include "PlayerData.h"

struct SuperMenuClass{
    Borg8header* img;
    u32 index;
};

namespace SuperMenuClasses{
void Init(s32);
void Set();
void Free();
Borg8header* Add(u32);
};

class DiaMenuSub{
    public:
    WidgetBorg8* PortraitBorder;
    BaseWidget* unk4;
    WidgetBorg8* Portrait;
    WidgetBorg8* Background;
    u32 unk10;
    u32 unk14;
    WidgetBorg8* Gradient;
    u32 unk1c;
    WidgetText* text;
    WidgetShadowText* shadText;
    WidgetScrollMenu* scrollMenu;
    DiaMenuSub(WidgetHandler*,u8,u8);
    ~DiaMenuSub();
    void InitDefault(u8);
    void Init24(u8);
    void NOOP_8004e97c();
};

struct struct_3{
u8 next;
u8 unk1[3];//align?
ItemID ent_ID;
char* txt;
};

struct ActorAndID{
    playerData* actor;
    u16 id;
};

struct dialougmode_substruct {
    struct_3 diags[9];
    u32 unk6C;
    ActorAndID actors[16];
    u16 encounterEnemies[12];
    u16 unk108;
    ItemID Entid;
    u16 RefpointID;
    u16 unk10e;
    char unk110;
    u8 unk111;
    u8 unk112;
    u8 unk113;
    u8 battlefeild;
    u8 unk115;
    u8 unk116;
};

class DialougeClass{
    public:
    u8 unk0;
    WidgetMenu* menu; //uses DiaMenuSub as substruct
    dialougmode_substruct* dialouge_substruct;
    u32 unkC; //some boolean?
    WidgetHandler* handler;
    borg13data* borg_13_dat;
    u32 unk18; //unused?
    u32 unk1C; //some boolean?
    u32 unk20; //some boolean?
    u8 type;
    DialougeClass(WidgetHandler*);
    ~DialougeClass();
    bool StartDialoug(borg13data *,dialougmode_substruct *,u8,u8);
    bool m8004ea94(BaseWidget*);
    void LoadMenuSubstruct(u8);
    bool Setup();
    void ClearScrollMenu();
    void FreeWidgets();
    void SetUnk20();
    bool m8004f264();
    void BigBGDialoug(u8);
    void m8004f810();

};

void ofunc_sub_dialouge(DialougeClass*,borg13data *);
void look_for_dialouge_v_Num(char *);

BaseWidget* Dialoug_UpButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_DownButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_LeftButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_RightButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_AButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_DebugEnd(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_BButton(BaseWidget*,BaseWidget*);
