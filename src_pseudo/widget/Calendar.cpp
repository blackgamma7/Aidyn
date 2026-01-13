#include "game.h"
#include "widgets/textPopup.h"
#include "widgets/JournalWidget.h"

WidgetCalendar::WidgetCalendar():WidgetMenu() {Init();}

WidgetCalendar::~WidgetCalendar() {
  WCSub *puVar1 = (WCSub *)this->substruct;
  puVar1->selected = NULL;
  puVar1->campLabel = NULL;
  puVar1->journalLabel = NULL;
  delete(puVar1);
  this->substruct = NULL;
  WidgetMenu::~WidgetMenu();
}

u32 WidgetCalendar::Init() {
  WCSub* sub = new WCSub;
  char* monthnames[]={ //why not just offset from the first?
    Cstring(Month00),Cstring(Month01),Cstring(Month02),Cstring(Month03),Cstring(Month04),Cstring(Month05),
    Cstring(Month06),Cstring(Month07),Cstring(Month08),Cstring(Month09),Cstring(Month10),Cstring(Month11),
  };
  this->substruct = sub;
  Calendar cal;
  World::GetCalendarDate(TerrainPointer,&cal);
  u8 bVar17 = cal.day + cal.week * 7;
  this->dayofMonth = bVar17;
  this->monthVal = cal.season * 2;
  if (28 <= bVar17) {
    this->monthVal = cal.season * 2 + 1;
    this->dayofMonth = bVar17 - 28;
  }
  bVar17 = this->dayofMonth + 3;
  this->weekofMonth = bVar17 / 7;
  this->dayofMonth = bVar17 - ((char)(bVar17 / 7 << 3) - (char)(bVar17 / 7));
  this->monthTitle = WClipTXTSafe(monthnames[this->monthVal]);
  this->DayMarker = WidgetB8(BORG8_CurrDayMarker);
  this->monthTitle->SetCoords(SCREEN_CENTERW,40);
  Utilities::SetTextWidgetBoundsX(this->monthTitle,SCREEN_CENTERW,260);
  this->monthTitle->SetColor(COLOR_RED1);
  this->Link(this->monthTitle);
  this->monthTitle->GetHeight();//?
  this->DayMarker->SetWidth(this->DayMarker->GetWidth() + 1);
  this->DayMarker->SetHeight(this->DayMarker->GetHeight() + 1);
  s16 xOff;//seems bo be a pixel miasalignment on certain days in calendar?
  switch((u32)this->weekofMonth * 7 + (u32)this->dayofMonth) {
    case 4:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 21:
    case 23:
    case 26:
    case 28:
    case 29:
      xOff = -1;
      break;
    default:
     xOff = -2;
  }
  this->DayMarker->SetCoords(this->dayofMonth * 0xe + xOff + SCREEN_CENTERW,this->weekofMonth * 0xe + 65);
  this->Link(this->DayMarker);
  sub->campLabel = WidgetB8(BORG8_TitleCamp);
  sub->campLabel->SetCoords(0xd7,0x9b);
  sub->campLabel->SetColor(COLOR_RED1);
  this->Link(sub->campLabel);
  sub->journalLabel = WidgetB8(BORG8_TitleJournal);
  sub->journalLabel->SetCoords(0xc0,0xae);
  sub->journalLabel->SetColor(COLOR_RED1);
  this->Link(sub->journalLabel);
  this->map = new WidgetMenuWorldMap(); //constructor gets inlined here
  this->map->SetCoords(0,0);
  this->Link(this->map);
  CityMarker cityMarkers[]={
    {BORG8_CityMarkerErromon,27,60},{BORG8_CityMarkerGwernia,116,41},
    {BORG8_CityMarkerSaiid,23,99},{BORG8_CityMarkerTalewok,64,86},
    {BORG8_CityMarkerTerminor,41,128},{BORG8_CityMarkerUgairt,125,178},
    {0},{0}
  };
  for(u8 i=0;cityMarkers[i].borg!=0;i++){
    WidgetBorg8* marker=WidgetB8(cityMarkers[i].borg);
    marker->posX=cityMarkers[i].x;
    marker->posY=cityMarkers[i].y;
    this->Link(marker);
  };
  this->UpButtonFunc = Calendar_UpFunc;
  this->DownButtonFunc = Calendar_DownFunc;
  this->StartButtonFunc = Calendar_StartFunc;
  this->LeftButtonFunc = Calendar_LeftFunc;
  this->RightButtonFunc = Calendar_RightFunc;
  this->AButtonFunc = campMenuController;
  this->BButtonFunc = Calendar_BFunc;
  (this->col0).R = 0x44;
  (this->col0).B = 0x22;
  (this->col1).G = 0x8d;
  (this->col0).G = 0x2a;
  (this->col1).R = 0x97;
  (this->col1).B = 0xbf;
  (this->col0).A = 0xff;
  (this->col1).A = 0xff;
  this->waveTint = 0;
  this->waveAmmount = 1;
  this->Tick();
  return Controller::GetDelay(0);
}

Gfx * WidgetCalendar::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  if (gOptionsMenuContPak == 0) g = RenderChildren(g,x0,y0,x1,y1);
  return g;
}

u8 WidgetCalendar::Tick() {
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte bVar4;
  byte bVar5;
  byte bVar6;
  byte bVar7;
  byte bVar8;
  byte bVar9;
  byte bVar10;
  u8 uVar11;
  byte bVar12;
  WCSub *puVar11;
  
  if (gOptionsMenuContPak == 0) {
    bVar1 = (this->col1).R;
    bVar2 = (this->col0).R;
    bVar3 = (this->col1).G;
    bVar4 = (this->col0).G;
    bVar5 = this->waveTint;
    bVar6 = (this->col0).B;
    bVar7 = (this->col1).B;
    bVar8 = (this->col0).A;
    bVar10 = (this->col1).A;
    this->waveTint+=this->waveAmmount;
    this->col.R = bVar2 + (char)((int)((u32)bVar1 - (u32)bVar2) / 0x14) * bVar5;
    this->col.G = bVar4 + (char)((int)((u32)bVar3 - (u32)bVar4) / 0x14) * bVar5;
    puVar11 = (WCSub *)this->substruct;
    this->col.B = bVar6 + (char)((int)((u32)bVar7 - (u32)bVar6) / 0x14) * bVar5;
    this->col.A = bVar8 + (char)((int)((u32)bVar10 - (u32)bVar8) / 0x14) * bVar5;
    if ((bVar12 == 0) || (bVar12 == 20)) this->waveAmmount = -this->waveAmmount;
    puVar11->selected->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
    return TickChildren();
  }
  else return WidgetS_Running;
}

u32 WidgetCalendar::GetNumber(){return WidgetN_Other;}

BaseWidget* Calendar_LeftFunc(BaseWidget* w0,BaseWidget* w1){return NULL;}
BaseWidget* Calendar_RightFunc(BaseWidget* w0,BaseWidget* w1){return NULL;}

BaseWidget* Calendar_UpFunc(BaseWidget* w0,BaseWidget* w1) {
  WCSub *piVar1 = (WCSub *)w1->substruct;
  if (piVar1->selected == piVar1->journalLabel) {
    piVar1->selected->SetColor(COLOR_RED1);
    piVar1->selected = piVar1->campLabel;
  }
  return NULL;
}

BaseWidget* Calendar_DownFunc(BaseWidget* w0,BaseWidget* w1) {
  WCSub *piVar1 = (WCSub *)w1->substruct;
  if (piVar1->selected == piVar1->campLabel) {
    piVar1->selected->SetColor(COLOR_RED1);
    piVar1->selected = piVar1->journalLabel;
  }
  return NULL;
}

BaseWidget* Calendar_BFunc(BaseWidget* w0,BaseWidget* w1){return w1;}

extern float camp_float_array[];
BaseWidget* campMenuController(BaseWidget* w0,BaseWidget* w1){
    WCSub *sub = (WCSub *)w1->substruct;
    if(sub->selected==sub->campLabel){
      if(World::getTerrain(TerrainPointer)>28)
        CRASH("Invalid Terrain","./menus/campmenucontroller.cpp");
      if(camp_float_array[World::getTerrain(TerrainPointer)]>0.0)
        w1->varU16=1;
      else {ErrPopup("The party cannot camp here.");}
    }
    else WHANDLE->AddWidget(new Journal(newestJournal));

}

BaseWidget* Calendar_StartFunc(BaseWidget* w0,BaseWidget* w1){return w1->BFunc();}