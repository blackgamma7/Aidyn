#include "widgets/BaseWidget.h"
u8 textbox_alpha[]={0xff,0xff};

u8 TextPopup_FadeIn(BaseWidget *);
u8 TextPopup_FadeOut(BaseWidget *);
BaseWidget* TextPopup_Close(BaseWidget*,BaseWidget*);
BaseWidget *TextPopup_New(char *txt,u16 x,u16 y,u8 red0,u8 green0,u8 blue0,u8 alpha0,u8 alph1,u32 addToHandler);
BaseWidget * some_textbox_func(char *txt,u16 lenMax,Color32 *txtCol,Color32 *bgCol,u32 addToHandler);


#define ErrPopup(str){\
Color32 col1={COLOR_OFFWHITE};\
Color32 col2={COLOR_DARKGRAY_T};\
some_textbox_func(str,150,&col1,&col2,true);}