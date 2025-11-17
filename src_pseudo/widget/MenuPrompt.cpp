#include "widgets/menuPrompt.h"
#include "widgets/Utilities.h"
#include "widgets/ItemDetails.h"

WidgetMenuPrompt::WidgetMenuPrompt(char *str,s16 x,s16 y,u8 r,u8 g,u8 b,u8 a):WidgetMenu() {
  WidgetClipText* txt = WClipTXTSafe(str);
  WidgetMenuPopup(this);
  txt->SetColor(r,g,b,a);
  txt->SetCoords(x,y);
  Utilities::SetTextWidgetBoundsX(txt,x,149);
  BaseWidget::Link(txt);
}

BaseWidget* WidgetMenuPrompt::AFunc(){Close();}//? No return?

BaseWidget* WidgetMenuPrompt::BFunc(){Close();}//? No return?

BaseWidget* WidgetMenuPrompt::StartFunc(){Close();}//? No return?

void WidgetMenuPrompt::Close(){this->SetState(WidgetS_Closing);}

WidgetMenuPrompt::~WidgetMenuPrompt(){WidgetMenu::~WidgetMenu();}