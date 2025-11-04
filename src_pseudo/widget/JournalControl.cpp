#include "globals.h"
#include "widgets/JournalWidget.h"


u8 Journal_FadeIn(BaseWidget *w) {
  if ((w->col).A < (0xff-60)) (w->col).A+=60;
  else {
    (w->col).A = 0xff;
    w->state = WidgetS_FadedIn;
  }
  w->Tick();
  return w->state;
}

u8 Journal_FadeOut(BaseWidget *w) {
  if ((w->col).A <= 60) {
    (w->col).A = 0;
    w->state = WidgetS_Closed;
  }
  else (w->col).A-=60;
  w->Tick();
  return w->state;
}


BaseWidget* Journal::UpFunc(){return this->scrollList->UpFunc();}

BaseWidget* Journal::DownFunc(){return this->scrollList->DownFunc();}

BaseWidget* Journal::AFunc(){this->state=WidgetS_Closing;return NULL;}

BaseWidget* Journal::BFunc(){this->state=WidgetS_Closing;return NULL;}

BaseWidget* Journal::StartFunc(){this->state=WidgetS_Closing;return NULL;}