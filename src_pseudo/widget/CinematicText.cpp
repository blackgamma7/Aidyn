#include "cinematics.h"
#include "ZoneEngine.h"

WidgetCinematicText::WidgetCinematicText(u16 (*dims) [4],short param_3,short param_4,Color32 *txtCol,u32 param_6):WidgetMenu(){
  u16 uVar1;
  u16 uVar2;
  u16 uVar3;
  BaseWidget *pBVar6;
  Borg8Header *pBVar7;
  
  this->textW = NULL;
  this->unk80 = NULL;
  this->gradient = NULL;
  *(undefined4 *)this->dimensions = *(undefined4 *)*dims;
  *(undefined4 *)(this->dimensions + 2) = *(undefined4 *)(*dims + 2);
  this->unk90 = param_3;
  this->unk92 = param_4;
  this->dimensions[0] = (*dims)[0];
  this->dimensions[1] = (*dims)[1];
  this->dimensions[2] = (*dims)[2];
  this->dimensions[3] = (*dims)[3];
  uVar1 = (*dims)[1];
  uVar2 = (*dims)[3];
  this->resize = param_6;
  this->unk80 = WidgetBorg8At(this,BORG8_Pixel,0,(*dims)[1],SCREEN_WIDTH,(*dims)[3]);
  this->unk80->SetColor(COLOR_BLACK);
  this->gradient = Utilities::AddBorg8Widget2(this,loadBorg8(BORG8_GradientC),0,(*dims)[1] - 0xb,SCREEN_WIDTH,(*dims)[1] - 1);
  this->gradient->SetColor(COLOR_BLACK);
  uVar1 = (*dims)[0];
  uVar2 = (*dims)[1];
  uVar3 = (*dims)[2];
  this->textW = new WidgetText(" ",0x100);
  SetWidgetBounds(this->textW,param_3 + uVar1,param_4 + uVar2,uVar3 - 5,(*dims)[3] - param_4);
  this->textW->SetCoords((*dims)[0] + param_3,(*dims)[1] + param_4);
  this->textW->SetColor(txtCol->R,txtCol->G,txtCol->B,txtCol->A);
  this->Link(this->textW);
}

WidgetCinematicText::~WidgetCinematicText(){
  free_borg8_widget(gradient);
  free_borg8_widget(unk80);
  WidgetMenu::~WidgetMenu();
}

void WidgetCinematicText::SetText(char *txt){  
  strcpy(Utilities::GetWidgetText(this->textW),txt);
  if (this->resize) {
    u16 uVar1 = this->dimensions[3];
    u16 uVar2 = this->dimensions[1];
    u16 uVar6 = this->textW->GetHeight();
    u16 x = this->dimensions[0];
    u16 uStack_4e = this->dimensions[1];
    u16 uVar3 = this->dimensions[2];
    u16 uVar4 = this->dimensions[3];
    u16 uVar7 = this->unk92 * 2 + uVar6;
    if ((u16)(uVar1 - uVar2) < uVar7) uStack_4e = uVar4 - (short)uVar7;
    this->unk80->SetCoords(x,uStack_4e);
    SetWidgetBounds(this->unk80,x,uStack_4e,uVar3,uVar4);
    this->unk80->SetWidth((uVar3 - x) + 1);
    this->unk80->SetHeight((uVar4 - uStack_4e) + 1);
    this->gradient->SetCoords(x,uStack_4e - 0xb);
    SetWidgetBounds(this->gradient,x,uStack_4e - 0xb,uVar3,uStack_4e - 1);
    SetWidgetBounds(this->textW,x + this->unk90,uStack_4e + this->unk92,uVar3 - 5,
                    uVar4 - this->unk92);
    this->textW->SetCoords(x + this->unk90,uStack_4e + this->unk92);
  }
}
