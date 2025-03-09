#include "n64Borg.h"
#include "widgets\Utilities.h"


struct cinematic_dat_pointers {
    u32  *borg6;
    u16 *flags;
    enum Borg12Enum *borg12;
    float (*planes)[2];
};

typedef enum CinematicEnum {
    Cinematic_opening,
    Cinematic_Shadow,
    Cinematic_Roog,
    Cinematic_End
} CinematicEnum;

class WidgetCinematicText:public WidgetMenu{
    public:
    WidgetText* textW;
    WidgetBorg8* unk80; //background?
    WidgetBorg8* gradient;
    u16 dimensions[4];
    s16 unk90;
    s16 unk92;
    u32 resize; //bool?
    WidgetCinematicText(ushort (*dims) [4],short param_3,short param_4,Color32 *txtCol,u32 param_6);
    ~WidgetCinematicText();
    virtual void SetText(char*);
};

enum CinFadeType{
    CFade_None,
    CFade_Black,
    CFade_White,
    CFade_Red,
};

struct CinematicFade {
    u8 index;
    u8 fadeType; //use CinFadeType
    u16 runtime; /* div 2 */
    u16 fadeTime; /* div 2 */
    short exitTime;
};

typedef struct CinematicStruct CinematicStruct, *PCinematicStruct;

typedef enum enum_cinematic_switch {
    CSwitch_CineDat,
    CSwitch_WorldMap,
    CSwitch_Credits,
    CSwitch_TrueName,
    CSwitch_ToMenu
} enum_cinematic_switch;

struct CinematicStruct {
    AnimationData *AniDat;
    borg6header *Borg6;
    Borg12Header *BGM;
    u16 *SeqenceFlags;
    float (*clippingPlanes)[2];
    u32  *borg6enums;
    u32 *borg12enums;
    u16 tally;
    u16 scene_switch;
    u16 Bstart;
    u16 CSwitch;
    u32 BGId;
    u32 some_cinematic_dat;
    u8 BGIndex;
};

typedef struct cinematictext_struct cinematictext_struct, *Pcinematictext_struct;

struct cinematictext_struct {
    int showCaptionTimer;
    WidgetCinematicText *widget;
    void* field2_0x8;
    u16 (*shortsPointer)[3];
    u16 field4_0x10;
    u16 caption_scene_max;
    u16 caption_index;
    u16 runtime;
    u16 captionTime;
    char nextCaption[256];
    char AlaronName[256]; /* yeah, for just the player name */
    u16 pad;
};