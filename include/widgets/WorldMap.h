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
    uint MapShortA;
    uint MapShortB;
    uint flag;
};

class WidgetMenuWorldMap : public WidgetMenu{
    Color32 col;
    Color32 col2;
    u8 field3_0x84;
    u8 field4_0x85;
    u8 pieceAlpha;
    WidgetBorg8 *Marker;
    MapPieceWidget *mappiceptr;
    u16 mappieceCount;
};