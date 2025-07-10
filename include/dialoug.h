#include "n64Borg.h"
#include "widgets/ShadowText.h"
#include "widgets/WidgetText.h"
#include "widgets/WidgetScrollMenu.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/handler.h"
#include "PlayerData.h"

struct SuperMenuClass{
    Borg8Header* img;
    u32 index;
};

namespace SuperMenuClasses{
void Init(s32);
void Set();
void Free();
Borg8Header* Add(u32);
};

class DiaMenuSub{
    public:
    WidgetBorg8* PortraitBorder;
    BaseWidget* unk4; //unused?
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
    u8 borg13End; //set by commands ending borg13
    u8 collisionByte;
    u8 aniByte;
    u8 battlefeild;
    u8 unk115;
    u8 unk116;
};

struct dialougemode_struct {
    void (*funcs0[5])(void);
    void (*funcs1[5])(void);
    void (*funcs2[5])(BaseWidget*);
    void (*funcs3[5])(void);
    void (*funcs4[5])(void);
    void (*unk0x64[5])(void);
    wander_substruct *Wanderers;
    u16 Unk0x7C;
    u16 unk7e;
    u8 *partySkillLvls; /* one for each skill */
    Borg13Data *borg13_dat;
    playerData *playerDat;
    u32 borg13;
    u32 unk90;
    u16 RefPointID;
    u16 mapDatA;
    u16 mapShort1;
    u16 mapShort2;
    u16 timer9c;
    u16 unk9e;
    int controlLock;
    u32 timerFlag;
    u16 unka8;
    u8 func_index;
    u8 unkab;
    u8 unkac;
    u8 unkad;
    u16 unkae;
    int camp_flag;
    dialougmode_substruct some_substruct;
};

class DialougeClass{
    public:
    u8 unk0;
    WidgetMenu* menu; //uses DiaMenuSub as substruct
    dialougmode_substruct* dialouge_substruct;
    u32 unkC; //some boolean?
    WidgetHandler* handler;
    Borg13Data* borg_13_dat;
    u32 unk18; //unused?
    u32 unk1C; //some boolean?
    u32 unk20; //some boolean?
    u8 type;
    DialougeClass(WidgetHandler*);
    ~DialougeClass();
    bool StartDialoug(Borg13Data *,dialougmode_substruct *,u8,u8);
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

struct borg_short {
    u32 borg_13;
    u16 pad; //unused? always 0
    u16 some_num;
};

//indecies of borg12's for "play SFX" borg13 commands
u32 dialoug_SFX[]={
    0x720,0x721,0x5e7,0x2e8,0x587,0x588,0x58a,0x722,0x723,0x576,
    0x577,0x578,0x57a,0x634,0x635,0x56c,0x56d,0x56e,0x56f,0x638,
    0x637,0x641,0x636,0x639,0x70e,0x70f,0x710,0x711,0x71c,0x71d,
    0x71e,0x71f,0x724,0x725,0x727,0x728,0x72d,0x72e,0x729,0x000};
dialougemode_struct* dialougemode_pointer=NULL;
Borg13Header* borg_13_pointer=NULL;
u32 borg13_flag=0;
u32 DAT_800ee96c=0;
u32 DAT_800ee970=1;
u32 DAT_800ee974=0;
u32 DAT_800ee978=0;
//seem to be indecies to "death" borg13's.
borg_short borg_short_list[]={
    {BORG13_AlaronDies1,0,2},{BORG13_AlaronDies2,0,2},{BORG13_AlaronDies3,0,2},
    {0x4f4,0,3},{0x4fe,0,1},{-1,-1,-1}
};
u16 whoDied_short=0; //uses borg_short.some_num.
u32 unusedDialougToggle=0; //toggled, but not read.

void ofunc_sub_dialouge(DialougeClass*,Borg13Data *);
void look_for_dialouge_v_Num(char *);

BaseWidget* Dialoug_UpButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_DownButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_LeftButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_RightButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_AButton(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_DebugEnd(BaseWidget*,BaseWidget*);
BaseWidget* Dialoug_BButton(BaseWidget*,BaseWidget*);

typedef void (*DialogCallback)(dialougmode_substruct*,Borg13Data *,u16,s16);
typedef s32 (*DialogCallback2)(dialougmode_substruct*,Borg13Data *,u16,u16);

void set_dialougprecallback(DialogCallback);
void set_dialoug_func_b(DialogCallback2);
void set_dialoug_func_c(DialogCallback);
u8 check_command_bitmask(Borg13Data *,u8);
char * get_borg_13_text(Borg13Data *,u8 );
u8 command_bitmask_6(Borg13Data *,u8);
u8 command_bitmask_7(Borg13Data *,u8);
bool FUN_800b59b8(dialougmode_substruct *,Borg13Data *,u8);
void FUN_800b5a1c(Borg13Data *);
u8 dialogNode_func_2(dialougmode_substruct *,Borg13Data *,u8);
u8 DialogNode_func(dialougmode_substruct *,Borg13Data *);
u8 dialoug_func_b_check(dialougmode_substruct *,Borg13Data *,u8);
void Dialoug_commands(dialougmode_substruct *,Borg13Data *,u8);
void dialoug_func_c_check(dialougmode_substruct *,Borg13Data *,u8);
int FUN_800b6b54(dialougmode_substruct *,u8 ,char *);
void FUN_800b6b9c(dialougmode_substruct *);
void get_dialouge_actors(dialougmode_substruct *,Borg13Data *);
void FUN_800b6c38(dialougmode_substruct *,u16);
u8 FUN_800b6cb8(dialougmode_substruct *,Borg13Data *,u8);
bool FUN_800b6e4c(dialougmode_substruct *,Borg13Data *,float);

//dialogue.cpp

void DialougCreateScriptCamera(u16 ,s16 ,playerData *,u16 ,float);
ActorAndID * DialougGetActorAndID(dialougmode_substruct *,Borg13Data *,ItemID);
CharSheet * DialougGetPartyMemberName(ItemID);
void DialougFreeActors(dialougmode_substruct *,Borg13Data *);
void DialoguePreCallback(dialougmode_substruct *,Borg13Data *,u16,s16);
s32 DialougCallbackB(dialougmode_substruct *,Borg13Data *,u16,u16);
void dialougemode_0x90_funcs3(u32);
void DialogCallbackC(dialougmode_substruct *,Borg13Data *,u16,s16);
char * DialougFindPlayerNameSpace(char *);
void DialougInsertPlayerName(char *);
void some_string_func(char *);

//dialogmode.cpp

void dialoug_func(u32,u16,u16,u16,u16,u16);
void run_dialougemode_funcs3();
void CreateNewDialouge_(u32);
Gfx * FUN_80057e78(Gfx *,u16);
int ScreenFadeMode_12(Gfx **);
void run_dialougemode_funcs1();
void run_dialougemode_funcs2();
u8 dialougSkillCheck(u8);
void FUN_8005831c();
void FUN_80058370();
void FUN_800583d0(u16);
void set_dialougemode_0x90(u32);
void encounterDat_func();
void monsterparty_wanderstruct(wander_substruct *);
bool DialougeAddPartyMember(ItemID);
void FUN_800585d0(ushort);
ItemID set_shopkeep();
void init_skill_trainer();
void shop_func();
void set_some_borg13_flag();
void FUN_80058ad4();
void FUN_80058b30(ushort);
void FUN_80058b88(Gfx **,u16);
void ApplyStimulus(playerData *,ushort);
void get_dialougemode_funcs();
void NOOP_80058dc8();
void get_some_borg13(u32);
u8 cutScene_control_func();
Gfx * FUN_800591a8(Gfx *g,u8 ,bool);
playerData * FUN_800591e4();
void run_dialougemode_funcs4();
void run_dialougemode_funcs5();
void DialogueModeInitPrescripted();
void load_one_of_two_cinematics();
bool FUN_80059628();
void FUN_80059674();
void DialogueModeInitPrescripted_set_map(u16 mapdatA,u16 short1,u16 short2);
void FUN_80059770();
void FUN_800597f8();
void FUN_80059888();
void FUN_800598fc();
void FUN_80059970(BaseWidget *);
void FUN_800599f0();
playerData * FUN_80059ae8();
void FUN_80059b28();
void FUN_80059b50();
void FUN_80059bf8(BaseWidget *);
void FUN_80059c70();
void unkState11();
void NOOP_80059D08();
bool FUN_80059d10(BaseWidget *);
bool FUN_80059d38();
void NOOP_80059d7c();
bool FUN_80059d84(BaseWidget *);
void FUN_80059dac();
bool isDialougeMode();
