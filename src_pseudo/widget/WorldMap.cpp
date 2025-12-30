#include "globals.h"

#define FILENAME "./maps/worldmap.cpp"

struct MapEventFlag {
    u32 MapShortA;
    u32 MapShortB;
    u32 flag;
};

struct WorldMapPiece {
    u16 eventFlag;
    u16 mapBorg8;
    u16 x;
    u16 y;
};

WorldMapPiece WorldMapPieces[]={
  {FLAG_Map1,BORG8_MapPiece01,58,29},{FLAG_Map2,BORG8_MapPiece02,35,29},
  {FLAG_Map4,BORG8_MapPiece04,35,29},{FLAG_Map5,BORG8_MapPiece05,43,58},
  {FLAG_Map6,BORG8_MapPiece06,60,74},{FLAG_Map7,BORG8_MapPiece07,35,70},
  {FLAG_Map8,BORG8_MapPiece08,56,157},{FLAG_Map9,BORG8_MapPiece09,32,143},
  {FLAG_Map10,BORG8_MapPiece10,59,69},{FLAG_Map11,BORG8_MapPiece11,94,62},
  {FLAG_Map12,BORG8_MapPiece12,111,70},{FLAG_Map13,BORG8_MapPiece13,111,74},
  {FLAG_Map14,BORG8_MapPiece14,110,133},{FLAG_Map15,BORG8_MapPiece15,214,117},
  {FLAG_Map16,BORG8_MapPiece16,120,161},{FLAG_MapGoblin,BORG8_MapPieceGob,128,135},
  {FLAG_Map17,BORG8_MapPiece17,102,166},{FLAG_Map18,BORG8_MapPiece18,106,164},
  {0},{0}
};

void WidgetMenuWorldMap::ShowMap() {
  this->mappieceCount = 0;
  while((WorldMapPieces[this->mappieceCount].eventFlag)||(WorldMapPieces[this->mappieceCount].mapBorg8)||
    (WorldMapPieces[this->mappieceCount].x)||(WorldMapPieces[this->mappieceCount].y)){
        this->mappieceCount++;
  }
 ALLOCS(this->mappiceptr,this->mappieceCount*sizeof(MapPieceWidget),132);
 for(s32 i=0;i<this->mappieceCount;i++){
   if (getEventFlag(WorldMapPieces[i].eventFlag)) {
    MapPieceWidget *pieceW=&this->mappiceptr[i];
    pieceW->x = WorldMapPieces[i].x;
    pieceW->y = WorldMapPieces[i].y;
    pieceW->img = WidgetB8(WorldMapPieces[i].mapBorg8);
    pieceW->img->SetCoords(pieceW->x,pieceW->y);
    pieceW->img->SetColor(130,80,80,0);
    this->Link(pieceW->img);
  }
  else this->mappiceptr[i].img = NULL;
}
}

bool WidgetMenuWorldMap::Init() {
  (this->col2).R = 0xa5;
  (this->col2).G = 0x9e;
  (this->col1).A = 0xff;
  (this->col2).B = 0xff;
  (this->col2).A = 0xff;
  this->pieceAlpha = 0;
  (this->col1).R = 0;
  (this->col1).G = 0;
  (this->col1).B = 0;
  this->unk84 = 0;
  this->alphaSign = 1;
  ShowMap();
  this->Marker = WidgetB8(BORG8_WorldMapMarker);
  this->Marker->SetColor(0,0,0,0);
  this->Link(this->Marker);
  this->Marker->posX = ((float)(gGlobals.gameVars.mapShort1 - 1) * 6.15f) + 35;
  this->Marker->posY = ((float)(gGlobals.gameVars.mapShort2 - 4) * 6.68f) + 29;
  return true;
}

bool WidgetMenuWorldMap::FreePieces() {
  MapPieceWidget *pMVar1 = this->mappiceptr;
  if (pMVar1) {
    for (u32 i = this->mappieceCount; i != 0; i--,pMVar1++) {
      if (pMVar1->img) pMVar1->img = NULL;
    }
    FREE(this->mappiceptr,235);
  }
  return true;
}

Gfx* WidgetMenuWorldMap::Render(Gfx*g, u16 x0, u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

u8 WidgetMenuWorldMap::Tick() {
  byte bVar2;
  byte bVar3;
  byte bVar4;
  u16 uVar5;
  pause_Substruct *ppVar6;
  BaseWidget *pBVar7;
  byte bVar8;
  byte bVar9;
  u32 uVar12;
  
  if (gGlobals.BigAssMenu) { //? should parented to begin with.
    bVar2 = this->unk84;
    u8 markerAlpha = (u32)(this->col1).A;
    markerAlpha = markerAlpha + ((int)((this->col2).A - markerAlpha) / 10) * this->unk84;
    pause_Substruct *ppVar6 = PauseSub;
    //don't show marker if not on overworld
    if ((gGlobals.sky.Type != SkyTypeOutdoor) || (gGlobals.minimap.active)) markerAlpha = 0;
    if (!ppVar6->isScrolling) {
      bVar8 = this->unk84 + this->alphaSign;
      this->unk84 = bVar8;
      if ((bVar8 == 0) || (bVar8 == 10)) {
        this->alphaSign = -this->alphaSign;
      }
      bVar9 = this->pieceAlpha + 5;
      if (0xf9 < bVar8) bVar9 = 0xff;
      this->pieceAlpha = bVar9;
    }
    this->Marker->SetColor(
               (this->col1).R + ((int)((this->col2).R - (this->col1).R) / 10) * bVar2,
               (this->col1).G + ((int)((this->col2).G - (this->col1).G) / 10) * bVar2,
               (this->col1).B + ((int)((this->col2).B - (this->col1).B) / 10) * bVar2,
               markerAlpha);
    for(s32 i=0;i<this->mappieceCount;i++){
        if (this->mappiceptr[i].img){
          ((this->mappiceptr[i].img)->col).A = this->pieceAlpha;
        }
    }
  }
  return TickChildren();
}

void set_map_event_flag(s32 a,s32 b) {
  MapEventFlag mapEventFlags[]={
    /*  0*/{1,4,FLAG_Map4},{1,5,FLAG_Map4},{1,6,FLAG_Map4},{1,15,FLAG_Map7},{1,22,FLAG_Map9},
    /*  5*/{2,4,FLAG_Map4},{2,5,FLAG_Map4},{2,6,FLAG_Map4},{2,7,FLAG_Map4},{2,8,FLAG_Map2},
    /* 10*/{2,9,FLAG_Map2},{2,14,FLAG_Map7},{2,15,FLAG_Map7},{2,22,FLAG_Map9},{3,7,FLAG_Map4},
    /* 15*/{3,8,FLAG_Map2},{3,9,FLAG_Map2},{3,10,FLAG_Map2},{3,14,FLAG_Map7},{3,15,FLAG_Map7},
    /* 20*/{3,16,FLAG_Map7},{4,8,FLAG_Map2},{4,9,FLAG_Map2},{4,10,FLAG_Map2},{4,13,FLAG_Map7},
    /* 25*/{4,14,FLAG_Map7},{4,15,FLAG_Map7},{4,22,FLAG_Map8},{4,23,FLAG_Map8},{5,8,FLAG_Map2},
    /* 30*/{5,9,FLAG_Map2},{5,13,FLAG_Map7},{5,14,FLAG_Map7},{5,15,FLAG_Map7},{5,22,FLAG_Map8},
    /* 35*/{5,23,FLAG_Map8},{6,8,FLAG_Map2},{6,9,FLAG_Map2},{6,13,FLAG_Map7},{6,14,FLAG_Map7},
    /* 40*/{6,15,FLAG_Map7},{6,23,FLAG_Map8},{7,8,FLAG_Map2},{7,9,FLAG_Map2},{6,10,FLAG_Map5},
    /* 45*/{7,12,FLAG_Map6},{7,13,FLAG_Map6},{7,14,FLAG_Map7},{7,15,FLAG_Map7},{7,18,FLAG_Map10},
    /* 50*/{7,19,FLAG_Map10},{8,8,FLAG_Map1},{8,9,FLAG_Map1},{8,10,FLAG_Map5},{8,11,FLAG_Map5},
    /* 55*/{8,12,FLAG_Map5},{8,13,FLAG_Map5},{8,14,FLAG_Map10},{8,15,FLAG_Map10},{8,18,FLAG_Map10},
    /* 60*/{8,19,FLAG_Map10},{9,8,FLAG_Map1},{9,9,FLAG_Map1},{9,10,FLAG_Map5},{9,11,FLAG_Map5},
    /* 65*/{9,12,FLAG_Map5},{9,13,FLAG_Map5},{9,14,FLAG_Map10},{9,15,FLAG_Map10},{9,18,FLAG_Map10},
    /* 70*/{9,19,FLAG_Map10},{10,8,FLAG_Map1},{10,9,FLAG_Map1},{10,11,FLAG_Map5},{10,12,FLAG_Map5},
    /* 75*/{10,13,FLAG_Map5},{10,14,FLAG_Map10},{10,15,FLAG_Map10},{10,16,FLAG_Map10},{10,17,FLAG_Map10},
    /* 80*/{10,18,FLAG_Map10},{10,19,FLAG_Map10},{11,8,FLAG_Map1},{11,9,FLAG_Map1},{11,15,FLAG_Map10},
    /* 85*/{11,16,FLAG_Map10},{11,17,FLAG_Map10},{11,18,FLAG_Map10},{11,19,FLAG_Map10},{11,20,FLAG_Map10},
    /* 90*/{12,7,FLAG_Map1},{12,8,FLAG_Map1},{12,16,FLAG_Map11},{12,17,FLAG_Map11},{12,19,FLAG_Map15},
    /* 95*/{12,20,FLAG_Map15},{13,6,FLAG_Map1},{13,7,FLAG_Map1},{13,8,FLAG_Map1},{13,16,FLAG_Map11},
    /*100*/{13,17,FLAG_Map11},{13,20,FLAG_Map11},{13,21,FLAG_Map15},{13,22,FLAG_Map15},{13,23,FLAG_Map15},
    /*105*/{14,6,FLAG_Map1},{14,8,FLAG_Map1},{14,16,FLAG_Map11},{14,17,FLAG_Map11},{14,21,FLAG_Map15},
    /*110*/{14,22,FLAG_Map15},{14,23,FLAG_Map15},{14,25,FLAG_Map17},{14,26,FLAG_Map17},{14,27,FLAG_Map17},
    /*115*/{14,28,FLAG_Map17},{15,16,FLAG_Map11},{15,17,FLAG_Map11},{15,22,FLAG_Map14},{15,23,FLAG_Map14},
    /*120*/{15,24,FLAG_Map14},{15,25,FLAG_Map18},{15,26,FLAG_Map17},{15,27,FLAG_MapGoblin},{15,28,FLAG_Map17},
    /*125*/{16,16,FLAG_Map12},{16,17,FLAG_Map12},{16,18,FLAG_Map13},{16,19,FLAG_Map13},{16,21,FLAG_Map14},
    /*130*/{16,22,FLAG_Map14},{16,23,FLAG_Map14},{16,24,FLAG_Map14},{16,25,FLAG_Map17},{16,26,FLAG_Map17},
    /*135*/{16,27,FLAG_Map17},{17,16,FLAG_Map12},{17,17,FLAG_Map12},{17,18,FLAG_Map13},{17,19,FLAG_Map13},
    /*140*/{17,20,FLAG_Map13},{17,21,FLAG_Map14},{17,25,FLAG_Map16},{17,26,FLAG_Map16},{17,27,FLAG_Map14},
    /*145*/{18,16,FLAG_Map13},{18,17,FLAG_Map13},{18,18,FLAG_Map13},{18,19,FLAG_Map13},{18,20,FLAG_Map14},
    /*150*/{18,21,FLAG_Map14},{18,25,FLAG_Map16},{18,26,FLAG_Map16},{18,27,FLAG_Map16},{18,28,FLAG_Map16},
    /*155*/{19,16,FLAG_Map13},{19,25,FLAG_MapGoblin},{19,26,FLAG_MapGoblin},{19,27,FLAG_MapGoblin},{20,26,FLAG_MapGoblin},
    /*160*/{20,27,FLAG_MapGoblin},{20,28,FLAG_MapGoblin},{0}
  };
  //loop may be inaccurate.
  MapEventFlag* entry = mapEventFlags;
  while((entry->MapShortA)&&(entry->MapShortB)&&(entry->flag)){
    if((entry->MapShortA==a)&&(entry->MapShortB==b)){
        setEventFlag(entry->flag,true);
        return;
    }
    entry++;
  }
}

WidgetMenuWorldMap::WidgetMenuWorldMap():WidgetMenu() {Init();}

WidgetMenuWorldMap::~WidgetMenuWorldMap(){
    FreePieces();
    WidgetMenu::~WidgetMenu();
}

u32 WidgetMenuWorldMap::GetNumber(){return WidgetN_Other;}