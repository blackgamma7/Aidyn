#include "globals.h"

#define FILENAME "./maps/worldmap.cpp"

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
    pieceW->img->SetColor(0x82,0x50,0x50,0);
    this->Link(pieceW->img);
  }
  else this->mappiceptr[i].img = NULL;
}
}

bool WidgetMenuWorldMap::Init() {
  (this->col2).R = 0xa5;
  (this->col2).G = 0x9e;
  (this->col).A = 0xff;
  (this->col2).B = 0xff;
  (this->col2).A = 0xff;
  this->pieceAlpha = 0;
  (this->col).R = 0;
  (this->col).G = 0;
  (this->col).B = 0;
  this->unk84 = 0;
  this->field4_0x85 = 1;
  ShowMap();
  this->Marker = WidgetB8(0xF6);
  this->Marker->SetColor(0,0,0,0);
  this->Link(this->Marker);
  this->Marker->posX = ((float)(gGlobals.gameVars.mapShort1 - 1) * 6.15f) + 0x23;
  this->Marker->posY = ((float)(gGlobals.gameVars.mapShort2 - 4) * 6.68f) + 0x1d;
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
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte bVar4;
  ushort uVar5;
  pause_Substruct *ppVar6;
  BaseWidget *pBVar7;
  byte bVar8;
  byte bVar9;
  bool bVar10;
  MapPieceWidget *pMVar11;
  int i;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  
  if (gGlobals.BigAssMenu != NULL) {
    bVar1 = (this->col2).R;
    uVar15 = (uint)(this->col).R;
    bVar2 = this->unk84;
    uVar13 = (uint)(this->col).A;
    bVar3 = (this->col2).G;
    uVar14 = (uint)(this->col).G;
    bVar4 = (this->col2).B;
    uVar12 = (uint)(this->col).B;
    uVar13 = uVar13 + ((int)((this->col2).A - uVar13) / 10) * (uint)bVar2 & 0xff;
    ppVar6 = PauseSub;
    if ((gGlobals.sky.Type == 3) && (gGlobals.minimap.active == 0)) {
    }
    else uVar13 = 0;
    if (!ppVar6->isScrolling) {
      bVar8 = this->unk84 + this->field4_0x85;
      this->unk84 = bVar8;
      if ((bVar8 == 0) || (bVar8 == 10)) {
        this->field4_0x85 = -this->field4_0x85;
      }
      bVar9 = this->pieceAlpha + 5;
      if (0xf9 < bVar8) bVar9 = 0xff;
      this->pieceAlpha = bVar9;
    }
    this->Marker->SetColor(
               uVar15 + ((int)(bVar1 - uVar15) / 10) * (uint)bVar2 & 0xff,
               uVar14 + ((int)(bVar3 - uVar14) / 10) * (uint)bVar2 & 0xff,
               uVar12 + ((int)(bVar4 - uVar12) / 10) * (uint)bVar2 & 0xff,uVar13);
    for(i=0;i<this->mappieceCount;i++){
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
  while((entry->MapShortA!=0)&&(entry->MapShortB!=0)&&(entry->flag)!=0){
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