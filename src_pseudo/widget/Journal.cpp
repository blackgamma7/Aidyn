#include "game.h"
#include "stringDecrypt.h"
#include "widgets/JournalWidget.h"

#define FILENAME "./menus/journal.cpp"

int some_char_to_int_parsing(int base,u32 param_2) {
  int iVar1;
  u32 uVar2;
  int iVar3;
  
  iVar3 = 1;
  uVar2 = 0;
  iVar1 = base;
  if (param_2 != 0) {
    do {
      iVar3 = iVar1;
      uVar2 = uVar2 + 1;
      iVar1 = iVar3 * base;
    } while (uVar2 < param_2);
  }
  return iVar3;
}


EventFlag StringToFlag(char *param_1) {
  int ret;
  
  u16 len = strlen(param_1);
  for(u16 i=0,ret=0;i<len;i++){
      ret+=((byte)param_1[(len - 1) - i] - '0') * some_char_to_int_parsing(10,i);
    }
  return (EventFlag)ret;
}

Journal::Journal(s16 newest):WidgetMenu(){
  InitMenu(newest);
}

Journal::~Journal(){WidgetMenu::~WidgetMenu();}


void Journal::InitMenu(s16 newest) {
  BaseWidget *pBVar3;

  this->col.A = 0;
  this->background = WidgetB8(BORG8_JournalBG);
  this->background->SetCoords(0,0);
  this->background->SetColor(0xff,0xff,0xff,0);
  this->Link(this->background);
  this->Load(newest);
  WSLSub *scrollSub = (WSLSub *)this->scrollList->substruct;
  scrollSub->vSpace = 4;
  if (scrollSub->itemCount == 1) {
    pBVar3 = WClipTXT(Cstring(JournalEmpty));
    pBVar3->SetColor(98,70,30,0xff);
    this->scrollList->AddEntry(pBVar3);
  }
  this->scrollList->AddEntry(WClipTXT("  "));
  this->scrollList->Tick();
  if (newest == -1) scrollSub->itemHighlight = scrollSub->itemCount - 1;
  else scrollSub->items[scrollSub->itemHighlight]->SetColor(130,80,140,0xff);
  pBVar3= scrollSub->items[scrollSub->itemHighlight];
  if (this->scrollList->boundY1 - this->scrollList->boundY0 <
      ((pBVar3->posY + pBVar3->GetHeight()) - this->scrollList->posY)) {
    scrollSub->yCurr=scrollSub->yTarget = 
      (this->scrollList->boundY1 - this->scrollList->boundY0) - this->scrollList->GetHeight();
  }
  this->arrowU = WidgetB8(BORG8_LongUpArrow);
  this->arrowD = WidgetB8(BORG8_LongDownArrow);
  this->Arrows = new WidgetScrollArrows(this->scrollList,this->arrowU,this->arrowD,-1);
  this->Arrows->SetCoords(247,30);
  this->Arrows->SetColor(COLOR_RED1);
  ((WSA_Sub*)this->Arrows->substruct)->bottom = 30;
  this->Link(this->Arrows);
  this->fadeIn = Journal_FadeIn;
  this->fadeOut = Journal_FadeOut;
  Controller::GetDelay(0);
}

u8 Journal::ShowTriggeredEntry(char *txt) {
  EventFlag flag;
  bool ret;
  char *pcVar5;
  
  pcVar5 = txt;
  if (*txt != ' ') {
    for (pcVar5 = txt + 1; *pcVar5 != ' '; pcVar5++) {
    }
  }
  *pcVar5 = '\0';
  flag = StringToFlag(txt);
  ret = false;
  if (getEventFlag(flag)) {
    WidgetClipText *Entry = WClipTXT(pcVar5 + 1);
    Entry->varU16 = flag;
    Entry->SetColor(98,70,60,0xff);
    this->scrollList->AddEntry(Entry);
    ret = true;
  }
  return ret;
}

extern void* journal_ROM;
#define JOURNALSIZE 0x2090
void Journal::Load(s32 newest) {
  u16 uVar2;
  char *pcVar5;
  char *pcVar6;
  int iVar8;
  u32 uVar9;
  u32 uVar11;
  
  char *pBuffer = (char *)HALLOC(JOURNALSIZE,224);
  if (pBuffer == NULL) CRASH("Journal::Load()","Not enough memory for pBuffer");
  ROMCOPYS(pBuffer,journal_ROM,JOURNALSIZE,233);
  this->scrollList = new WidgetScrollList(100);
  this->scrollList->SetCoords(64,30);
  uVar11 = 0;
  this->scrollList->boundX1 = 245;
  this->scrollList->boundX0 = 64;
  this->scrollList->boundY0 = 30;
  this->scrollList->boundY1 = 220;
  this->Link(this->scrollList);
  this->scrollList->AddEntry(WClipTXT("  "));
  WSLSub *pvVar3 = (WSLSub *)this->scrollList->substruct;
  pcVar5 = pBuffer;
  if (*pBuffer != '*') goto LAB_8005b564;
  if (pBuffer[1] == '*') {
    if (pBuffer[2] == '*') {
      if (pBuffer[3] == '*') {
        if (pBuffer[4] != '*') goto LAB_8005b564;
        goto LAB_8005b5a8;
      }
      pcVar5 = pBuffer + 1;
    }
    else {
      pcVar5 = pBuffer + 1;
    }
  }
  else {
    pcVar5 = pBuffer + 1;
  }
  do {
    while( true ) {
      while( true ) {
        while( true ) {
          for (; uVar11++, *pcVar5 != '*'; pcVar5++) {
LAB_8005b564:
          }
          if (pcVar5[1] == '*') break;
          pcVar5++;
        }
        if (pcVar5[2] == '*') break;
        pcVar5++;
      }
      if (pcVar5[3] == '*') break;
      pcVar5++;
    }
    pcVar6 = pcVar5 + 4;
    pcVar5++;
  } while (*pcVar6 != '*');
LAB_8005b5a8:
  uVar9 = 0;
  for(u16 uVar10=0;uVar10<uVar11;uVar10++){
      pcVar5 = pBuffer + uVar9;
      iVar8 = uVar9 + 1;
      uVar9+=2;
      uVar2 = (*pcVar5<<8|pBuffer[iVar8]);
      char txtBuff[0x2000];
      memset(txtBuff,0,0x2000);
      for(u16 uVar7 = 0;uVar7<uVar2;uVar7++){
          pcVar6 = txtBuff + uVar7;
          pcVar5 = pBuffer + uVar9++;
          *pcVar6 = *pcVar5;
        }
      decrypt_string(txtBuff,0,0,uVar2);
      if ((ShowTriggeredEntry(txtBuff)) && (newest != -1)) {
        if (uVar10 == newest) {
          pvVar3->itemHighlight = pvVar3->itemCount - 1;
          newestJournal = -1;
        }
        #ifdef DEBUGVER
        Gsprintf("Entry found = %d\n",uVar10);
        N64PRINT(gGlobals.text);
        #endif
      }
  }
  HFREE(pBuffer,306);
}

u8 Journal::Tick() {
  this->Arrows->col.A = this->col.A;
  this->scrollList->col.A = this->col.A;
  this->background->col.A = this->col.A;
  return TickChildren();
}

BaseWidget * Journal::Control(controller_aidyn *cont) {
  BaseWidget *w = BaseWidget::Control(cont);
  if(w) return w;
  if ((cont->input_2 & (ANA_UP|D_UP)))
      return this->UpFunc();
  if ((cont->input_2 & (ANA_DOWN|D_DOWN)))
      return this->DownFunc();
  return NULL;
}

Gfx * Journal::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  g = RenderChildren(g,x0,y0,x1,y1);
  //generate the alpha gradient on the top and bottom of list
  //by redrawing the BG in strips over top of it.
  u8 alpha = (this->background->col).A;
  s16 bx0 = this->background->boundX0;
  this->background->boundX0 = 62;
  s16 bx1 = this->background->boundX1;
  (this->background->col).A = alpha * 0.125;
  s16 by0 = this->background->boundY0;
  s16 by1 = this->background->boundY1;
  this->background->boundX1 = 245;
  this->background->boundY0 = 37;
  this->background->boundY1 = 40;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.25;
  this->background->boundY0 = 35;
  this->background->boundY1 = 37;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.5;
  this->background->boundY0 = 33;
  this->background->boundY1 = 35;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.75;
  this->background->boundY0 = 28;
  this->background->boundY1 = 33;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.125;
  this->background->boundY0 = 210;
  this->background->boundY1 = 213;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.25;
  this->background->boundY0 = 213;
  this->background->boundY1 = 215;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.5;
  this->background->boundY0 = 215;
  this->background->boundY1 = 217;
  g = this->background->Render(g,x0,y0,x1,y1);
  (this->background->col).A = alpha * 0.75;
  this->background->boundY0 = 217;
  this->background->boundY1 = 220;
  g = this->background->Render(g,x0,y0,x1,y1);
  //restore original values
  this->background->boundX0 = bx0;
  this->background->boundY0 = by0;
  this->background->boundY1 = by1;
  (this->background->col).A = alpha;
  this->background->boundX1 = bx1;
  return g;
}

u32 Journal::GetNumber(){return WidgetN_Other;}

