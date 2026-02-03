#include "widgets/textPopup.h"
#include "globals.h"

u8 TextPopup_FadeIn(BaseWidget *w){
  bool bVar2 = (int)(textbox_alpha[0] - 90) <= (int)(u32)(w->col).A;
  if (bVar2) {
    (w->col).A = textbox_alpha[0];
  }
  else  (w->col).A+= 90;
  Utilities::SetAlpha(w,(w->col).A);
  if (bVar2) w->state = WidgetS_FadedIn;
  return w->state;
}

u8 TextPopup_FadeOut(BaseWidget *w){
  u8 bVar1 = (w->col).A;
  if (bVar1 <= 90) (w->col).A = 0;
  else (w->col).A += 166;
  Utilities::SetAlpha(w,(w->col).A);
  if (bVar1 <= 90) w->state = WidgetS_Closed;
  return w->state;
}
//close the text popup by hitting A, B, C-up or C-down.
BaseWidget * TextPopup_Close(BaseWidget * param_1,BaseWidget *param_2){
  param_2->SetState(WidgetS_Closing);
  return NULL;
}
//open a centered text popup
BaseWidget * TextPopup_New(char *txt,u16 x,u16 y,u8 red0,u8 green0,u8 blue0,u8 alpha0,
      u8 alph1,u32 addToHandler){
  
  s16 x0 = (s16)((int)(SCREEN_WIDTH - (u32)x) / 2);
  s16 y0 = (s16)((int)(SCREEN_HEIGHT - (u32)y) / 2);
  BaseWidget *popup =  new WidgetMenu();
  popup->fadeIn = TextPopup_FadeIn;
  popup->fadeOut = TextPopup_FadeOut;
  textbox_alpha[1] = alph1;
  popup->Link(IntroMenu_ShadowBG(x0,y0,x0 + x + 8,y0 + y));
  textbox_alpha[0] = alpha0;
  WidgetText* pBVar2 = Utilities::AddTextWidget(popup,txt,x0 + 4,y0 + 4,red0,green0,blue0,0);
  pBVar2->boundX1 = x + x0 + 4;
  pBVar2->boundY1 = y + y0 + 4;
  popup->BButtonFunc = TextPopup_Close;
  popup->AButtonFunc = TextPopup_Close;
  popup->CDownButtonFunc = TextPopup_Close;
  popup->CUpButtonFunc = TextPopup_Close;
  Utilities::SetAlpha(popup,0);
  if (addToHandler) WHANDLE->AddWidget(popup);
  return popup;
}

//open a centered text popup
BaseWidget * TextBox_Centered(char *txt,u16 lenMax,Color32 *txtCol,Color32 *bgCol,u32 addToHandler){  
  u16 w = Font::GetWidth(gGlobals.font,txt);
  u16 len = lenMax;
  if (w < lenMax) len = w;
  return TextPopup_New(txt,(u16)len,Font::GetHeight(gGlobals.font,txt,0,len) + 5,
            txtCol->R,txtCol->G,txtCol->B,txtCol->A,bgCol->A,addToHandler);
}




