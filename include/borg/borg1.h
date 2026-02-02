#include "borg/borgHead.h"

typedef enum BORG1type {
    B1_RGBA16,
    B1_IA16,
    B1_CI8,
    B1_IA8,
    B1_I8,
    B1_CI4,
    B1_IA4,
    B1_I4,
    B1_RGBA32
} BORG1type;

enum Borg1Flag{
    B1_Flag20 =0x20,
    B1_TDDetail=0x40,
    B1_TDSharpen=0x80,
    B1_Procedural=0x100,
    B1_Moving=0x200,
};

struct Borg1Data {
    u16 type; //uses enum enum BORG1type
    u16 flag;
    u8 Width;
    u8 Height;
    u8 lods;
    u8 move; //each nibble indicates x or y axis movement
    Gfx *dList;
    u8 *bmp;
    u16 * pallette;
    u32 unk14; //unused, always 0. bmp offset always past it.
};

struct Borg1Header {
    borgHeader head;
    union{
        void* bitmapA;
        u8* bitmapA8;
        u16* bitmapA16;
        Color32*  bitmapA32;
        };
    u8 *bitmapB;
    Borg1Data *dat;
};