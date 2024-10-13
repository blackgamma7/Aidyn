#include "mathN64.h"
#include "widgets/WidgetBorg8.h"


struct minimap_dat_2 {
    ushort unk0x0;
    u16 flag;
    u32 borg8;
};

struct MinimapSec_dat {
    u16 mapshort1;
    u16 mapshort2;
    u16 flagIndex;
    u16 checked;
    u16 borg8;
    s16 x;
    s16 y;
};

struct MiniMap {
    uint active;
    uint ShowMinimap;
    u8 B_buttonToggle;
    u8 ShowAll;
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
    ushort mapshorts[2];
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
    float field37_0x90;
    float field38_0x94;
    u32 field39_0x98;
    float field40_0x9c;
    float field41_0xa0;
    float field42_0xa4;
    short field43_0xa8;
    short field44_0xaa;
    ushort field45_0xac;
    ushort field46_0xae;
};