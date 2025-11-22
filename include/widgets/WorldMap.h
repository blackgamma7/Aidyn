#include "widgets/WidgetMenu.h"
#include "widgets/WidgetBorg8.h"


typedef struct MapPieceWidget{
    WidgetBorg8* img;
    u16 x,y;
};
struct WorldMapPiece {
    u16 eventFlag;
    u16 mapBorg8;
    u16 x;
    u16 y;
};

struct MapEventFlag {
    u32 MapShortA;
    u32 MapShortB;
    u32 flag;
};
extern MapEventFlag mapEventFlags[];

void set_map_event_flag(s32 a,s32 b);

class WidgetMenuWorldMap : public WidgetMenu{
    public:
    Color32 col1;
    Color32 col2;
    u8 unk84;
    u8 alphaSign;
    u8 pieceAlpha;
    WidgetBorg8 *Marker;
    MapPieceWidget *mappiceptr;
    u16 mappieceCount;
    void ShowMap();
    bool Init();
    bool FreePieces();
    Gfx* Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    inline WidgetMenuWorldMap();
    ~WidgetMenuWorldMap();
    u32 GetNumber();

};