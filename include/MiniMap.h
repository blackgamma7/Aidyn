#include "mathN64.h"
#include "widgets/WidgetBorg8.h"


struct minimap_dat_2 {
    u16 unk0x0;
    u16 flag;
    u32 borg8;
};

struct MinimapSec_dat {
    u16 mapshort1;
    u16 mapshort2;
    u16 flagIndex;
    u16 checked;
    u16 borg8;
    u16 x;
    u16 y;
};

extern MinimapSec_dat minimaps_Gwernia[];//TODO: Fill in
extern MinimapSec_dat MinimapSec_dat_ARRAY_800edf0c[];//TODO: Fill in
extern MinimapSec_dat MinimapSec_erromon[];//TODO: Fill in
extern MinimapSec_dat MinimapSec_ehud[];//TODO: Fill in
extern MinimapSec_dat minimap_sec_mageschool[];//TODO: Fill in
extern MinimapSec_dat MinimapSec_dat_ARRAY_800ee508[];//TODO: Fill in
extern MinimapSec_dat MinimapSec_dat_ARRAY_800ee55c[];//TODO: Fill in
extern MinimapSec_dat minimap_sec_Barrows[];//TODO: Fill in

class MiniMap {
    public:
    u32 active;
    u32 ShowMinimap;
    u8 B_buttonToggle;
    u8 showAllVar;
    vec3f savedPlayerPos;
    WidgetBorg8 *widget18;
    WidgetBorg8 *widget1c;
    WidgetBorg8 *widget20;
    WidgetBorg8 *widget24;
    WidgetBorg8 *widget28;
    u32 unk2c;
    u32 unk30;
    u32 unk34;
    u32 unk38;
    u16 unk3c;
    u16 field16_0x3e;
    MinimapSec_dat *mapdat;
    u32 field18_0x44;
    float field19_0x48;
    float field20_0x4c;
    float field21_0x50;
    float field22_0x54;
    float field23_0x58;
    float field24_0x5c;
    u16 mapshorts[2];
    float floatX;
    float floatY;
    float mapScale;
    float field29_0x70;
    float field30_0x74;
    float mapX;
    float field32_0x7c;
    float field33_0x80;
    float mapY;
    float field35_0x88;
    float field36_0x8c;
    float X90;
    float field38_0x94;
    u32 field39_0x98;
    float Y9C;
    float field41_0xa0;
    float field42_0xa4;
    s16 field43_0xa8;
    s16 field44_0xaa;
    u16 field45_0xac;
    u16 field46_0xae;
    void Init();
    void Free();
    bool Free2();
    bool FreeLinked();
    void LoadData(MinimapSec_dat *param_2);
    bool SpecialSections(float posX,float posY,float posZ);
    bool CaseBarrows(float param_2);
    void Update(float posx,float posy,float posz);
    Gfx * Render(Gfx *g);
    void UpdateSection(s16 param_2,s16 param_3);
    bool LoadSections();
    void ToggleShowAll();
    s32 ShowAll();
    void Toggle(u8);

    //a few methods for special condition minimap sections

    bool ShowingSpecialSection(u16);
    bool EhudI09(u16);
    bool EhudC11(u16);
    bool GwernWalls(u16);
    bool GwernCourt(u16);
    bool GwernTower(u16);
    bool MageschoolStairs(u16);
    bool EhudO05(u16);
    bool RoogEntrance(u16);
    bool BarrowsFlags(u16);
};

void Minimap_Save(u8*);
void Minimap_Load(u8*);

#define MINIMAP gGlobals.minimap //shorthand for minimapobject