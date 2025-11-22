#include "globals.h"

#define FILENAME "./maps/worldmap.cpp"

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
  //TODO: declare mapEventFlags here (163 entries)
  //loop may also be inaccurate.
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