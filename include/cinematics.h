#include "n64Borg.h"
#include "widgets\Utilities.h"


struct CinematicPointers {
    u32  *borg6;
    u16 *flags;
    u32 *borg12;
    float (*planes)[2];
};

typedef enum CinematicEnum {
    Cinematic_opening,
    Cinematic_Shadow,
    Cinematic_Roog,
    Cinematic_End
} CinematicEnum;

//Widget used for the text during cinematics
class WidgetCinematicText:public WidgetMenu{
    public:
    WidgetText* textW;
    WidgetBorg8* unk80; //background?
    WidgetBorg8* gradient;
    u16 dimensions[4];
    s16 unk90;
    s16 unk92;
    u32 resize; //bool?
    WidgetCinematicText(u16 (*dims) [4],short param_3,short param_4,Color32 *txtCol,u32 param_6);
    ~WidgetCinematicText();
    virtual void SetText(char*);
};
//different fade colors for scene transitions
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
//action to take once cinematic is stopped.
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

namespace Cinematic{
    void Load(u16,u16,s32);
    u16 Tick(Gfx**);
    void FreeScene();
    s16 GetName();
    u16 EndCase();
    u16 Control();
    Gfx* Render(Gfx*,s16);
    void LoadNextScene();
    u16 LoadMap();
    u16 LoadCredits();
    u16 TrueName();
    u16 ToMenu();
    u16 GetSomeDat();
    void InitFade(u16);
    void NextFadeTally();
    Gfx * Fade(Gfx *,u16);
};

namespace CinematicText{
    void Init(char *);
    void Free();
    void SetText(char *,int);
    void Render(Gfx **,int);
    void ResetTimer();
    bool StringEquals(char *,char *);
    void InsertPlayerName(char *,char *,char *,char *);
    void NextLine();
    void ClearRuntime();
    void IncRuntime(int);
    void LoadNextLine();
    void AllocPointer8(void);
    void FreePointer8(void);
    void Sequence(u32);
}