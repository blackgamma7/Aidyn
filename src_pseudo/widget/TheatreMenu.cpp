#include "widgets/theatreMenu.h"
#include "widgets/JournalWidget.h"
#include "globals.h"
#include "stringDecrypt.h"

#define FILENAME "./menus/theatermenu.cpp"

TheatreMenu::TheatreMenu():WidgetMenu() {InitMenu();}

TheatreMenu::~TheatreMenu(){
    TMSub* s = (TMSub*)this->substruct;
    s->scroll=NULL;
    delete s;
    this->substruct=NULL;
    WidgetMenu::~WidgetMenu();
}

void TheatreMenu::InitMenu() {
  TMSub *s = new TMSub;
  this->substruct = s;
  Controller::GetDelay(0);
  s->scroll = new WidgetScrollMenu(10);
  Utilities::SetScrollMenuColors(s->scroll,0x67,0x40,0x40,0xff,0xc5,0xae,0xb0,0xff,0xf);
  s->scroll->SetColor(COLOR_BROWN1);
  WidgetBorg8* title = WidgetB8(BORG8_TitleTheater);
  title->SetCoords(SCREEN_CENTERW - (title->GetWidth() >> 1),50);
  this->Link(title);
  s->scroll->SetCoords(SCREEN_CENTERW,90);
  LoadOptionStrings();
  //If no entries, add one saying so.
  //(should not happen - unavaiilable entries marked as "----------------")
  if (((WSMSub*)s->scroll->substruct)->numChoices == 0)
    s->scroll->Append(WClipTXT(gGlobals.CommonStrings[0xac]));
  Utilities::SetArrayVSpace(s->scroll,5);
  s->scroll->SetFlags(4);
  s->scroll->Tick();
  this->Link(s->scroll);
  this->LeftButtonFunc = TheatreMenu_LeftFunc;
  this->RightButtonFunc = TheatreMenu_RightFunc;
  this->UpButtonFunc = TheatreMenu_UpFunc;
  this->DownButtonFunc = TheatreMenu_DownFunc;
  this->StartButtonFunc = TheatreMenu_StartFunc;
  this->AButtonFunc = TheatreMenu_AFunc;
  this->BButtonFunc = TheatreMenu_BFunc;
  this->Tick();
}


Gfx * TheatreMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  if (gOptionsMenuContPak == 0)
    g = BaseWidget::RenderChildren(g,x0,y0,x1,y1);
  return g;
}

u8 TheatreMenu::Tick() {
  if (gOptionsMenuContPak == 0) return this->TickChildren();
  return 3;//?
}

extern EventFlag StringToFlag(char*);

void TheatreMenu::AddAvailableCinematics(char *str) {
  BaseWidget *pBVar1;
  char *pcVar4;
  TMSub *s;
  
  s = (TMSub *)this->substruct;
  if (s->scroll) {
    pcVar4 = str;
    if (*str != ' ') {
      for (pcVar4 = str + 1; *pcVar4 != ' '; pcVar4 = pcVar4 + 1) {
      }
    }
    *pcVar4 = '\0';
    EventFlag flag = StringToFlag(str);
    if (getEventFlag(flag)) {
      s->scroll->Append(WClipTXT(pcVar4 + 1));
      pBVar1->varU16 = flag;
      pBVar1->AButtonFunc = choose_cinematic;
    }
    else s->scroll->Append(WClipTXT("----------------"));
  }
}

extern void*cinematic_titles;
void TheatreMenu::LoadOptionStrings() {
  byte bVar1;
  byte *dest;
  byte *pbVar2;
  byte *pbVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  char abStack288 [256];
  
  dest = (byte *)HALLOC(0x60,183);
  ROMCOPYS(dest,cinematic_titles,0x60,192);
  uVar6 = 0;
  while( true ) {
    while( true ) {
      while( true ) {
        while( true ) {
          for (; pbVar2 = dest + uVar6, *pbVar2 != '*'; uVar6++) {
          }
          if (pbVar2[1] == '*') break;
          uVar6++;
        }
        if (pbVar2[2] == '*') break;
        uVar6++;
      }
      if (pbVar2[3] == '*') break;
      uVar6++;
    }
    if (pbVar2[4] == '*') break;
    uVar6++;
  }
  uVar5 = 0;
  pbVar2 = dest;
  if (uVar6 != 0) {
    do {
      uVar5++;
      bVar1 = *pbVar2;
      memset(abStack288,0,0x100);
      for(u8 i=0;i<bVar1;i++){
          pbVar3 = (byte *)&abStack288[i];
          pbVar2 = dest + uVar5;
          uVar5++;
          *pbVar3 = *pbVar2;
      }
      decrypt_string(abStack288,0,0,(u16)bVar1);
      AddAvailableCinematics(abStack288);
      pbVar2 = dest + uVar5;
    } while (uVar5 < uVar6);
  }
  HFREE(dest,225);
}

u32 TheatreMenu::GetNumber(){return WidgetN_Other;}

BaseWidget* TheatreMenu_LeftFunc(BaseWidget* w0,BaseWidget* w1){
    return((TMSub*)w1->substruct)->scroll->LeftFunc();
}

BaseWidget* TheatreMenu_RightFunc(BaseWidget* w0,BaseWidget* w1){
    return((TMSub*)w1->substruct)->scroll->RightFunc();
}

BaseWidget* TheatreMenu_UpFunc(BaseWidget* w0,BaseWidget* w1){
    return((TMSub*)w1->substruct)->scroll->UpFunc();
}

BaseWidget* TheatreMenu_DownFunc(BaseWidget* w0,BaseWidget* w1){
    return((TMSub*)w1->substruct)->scroll->DownFunc();
}

BaseWidget* TheatreMenu_BFunc(BaseWidget* w0,BaseWidget* w1){
    w1->varU16=0;
    return w1;
}

BaseWidget* TheatreMenu_AFunc(BaseWidget* w0,BaseWidget* w1){
    BaseWidget*w2=((TMSub*)w1->substruct)->scroll->AFunc();
    if(w2->AFunc())w2->varU16=2;
    else w2=NULL;
    return w2;
}

theatreFlag gTheatreFlags[]={
    {FLAG_Cinematic0,Cinematic_opening,0},{FLAG_Cinematic1,Cinematic_Shadow,0},
    {FLAG_Cinematic2,Cinematic_Roog,0},{FLAG_Cinematic3,Cinematic_End,0},{0}
};

BaseWidget * choose_cinematic(BaseWidget *param_1,BaseWidget *param_2) {
  for(u16 i=0;gTheatreFlags[i].flag!=0;i++){
    if(gTheatreFlags[i].flag==param_2->varU16){
        gGlobals.cinematicReplay = 1;
        Cinematic::Load(gTheatreFlags[i].cinematic,get_CinematicDat,9);
        DAT_800e8dbc = 1;
        return param_2;
    }
  }
  return param_2;
}

BaseWidget* TheatreMenu_StartFunc(BaseWidget* w0,BaseWidget* w1){return w1->BFunc();}