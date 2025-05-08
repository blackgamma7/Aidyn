#include "widgets/DollMenu.h"
#include "globals.h"


WidgetHealthGold::WidgetHealthGold(CharSheet *chara):WidgetMenu(){
  char buff [88];
  this->HpPercent = 0;
  this->HpPercent = Entity::getHPCurrent(chara)/Entity::getHPMax(chara) *80.0f;
  this->HPBar = WidgetB8(0xe0); //health bar
  this->HPBar->SetWidth(0x50);
  this->HPBar->SetHeight(10);
  this->HPBar->SetCoords(0xdc,0x1b);
  this->Link(this->HPBar);
  sprintf(buff,"%u",Entity::GetLevel(chara));
  this->LevelText = new WidgetClipText(buff,5);
  this->LevelText->SetCoords(0xdf,0x37);
  this->LevelText->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->LevelText);
  sprintf(buff,"%ld",(gGlobals.party)->Gold);
  this->GoldText = new WidgetClipText(buff,10);
  this->GoldText->SetCoords(0xdf,0x45);
  this->GoldText->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->GoldText);
  sprintf(buff,"%d",Entity::getHPCurrent(chara));
  this->CurrHPText = new WidgetClipText(buff,4);
  this->CurrHPText->SetCoords(0xdf,0x29);
  this->CurrHPText->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->CurrHPText);
  sprintf(buff,"%d",Entity::getHPMax(chara));
  this->MaxHPText = new WidgetClipText(buff,4);
  this->MaxHPText->SetCoords(0xff,0x29);
  this->MaxHPText->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->MaxHPText);
}

WidgetHealthGold::~WidgetHealthGold(){
  this->unk90.~UnkGuiSubstruct();
  WidgetMenu::~WidgetMenu();
}

void WidgetHealthGold::Update(CharSheet *param_2){;
  short asStack_80 [4];
  char buff [64];
  byte abStack_38 [48];
  
  if ((this->unk90).present) {
    this->unk90.Tick(10000); //why not add the args?
    this->unk90.Tick(10);
    this->unk90.Tick(10);
  }
  asStack_80[0] =  Entity::getHPCurrent(param_2) / Entity::getHPMax(param_2) * this->HPBar->GetWidth();
  if (this->HpPercent != asStack_80[0]) {
    this->unk90.AddItem(new UnkGuiClassU2(&this->HpPercent,asStack_80,0xf,double_array_0));
  }
  sprintf(buff,"%u",Entity::GetLevel(param_2));
  this->LevelText = new WidgetClipText(buff,3);
  this->LevelText->SetCoords(0xdf,0x37);
  this->LevelText->x+=this->x;
  this->LevelText->boundX0 +=this->x;
  this->LevelText->boundX1 +=this->x;
  this->LevelText->SetColor(0x82,0x50,0x50,0xff);
  (this->LevelText->col).A = 0;//why not use setter?
  abStack_38[0] = 0xff;
  this->unk90.AddItem(new UnkGuiClassU3(&(this->LevelText->col).A,abStack_38,0xf,double_array_0));
  this->Link(this->LevelText);
  abStack_38[1] = 0;
  this->unk90.AddItem(new UnkGuiClassL(new UnkGuiClassU3(&(this->LevelText->col).A,abStack_38 + 1,0xf,double_array_0),this->LevelText));
  sprintf(buff,"%u",Entity::getHPCurrent(param_2));
  this->CurrHPText = new WidgetClipText(buff,4);
  this->CurrHPText->SetCoords(0xdf,0x29);
  this->CurrHPText->x+=this->x;
  this->CurrHPText->boundX0+=this->x;
  this->CurrHPText->boundX1+=this->x;
  this->CurrHPText->SetColor(0x82,0x50,0x50,0xff);
  (this->CurrHPText->col).A = 0;//why not use setter?
  abStack_38[2] = 0xff;
  this->unk90.AddItem(new UnkGuiClassU3(&(this->CurrHPText->col).A,abStack_38 + 2,0xf,double_array_0));
  this->Link(this->CurrHPText);
  abStack_38[3] = 0;
  this->unk90.AddItem(new UnkGuiClassL(new UnkGuiClassU3(&(this->CurrHPText->col).A,abStack_38 + 3,0xf,double_array_0),this->CurrHPText));
  sprintf(buff,"%u",Entity::getHPMax(param_2));
  this->MaxHPText = new WidgetClipText(buff,4);
  this->MaxHPText->SetCoords(0xff,0x29);
  this->MaxHPText->x+= this->x;//why not use setter?
  this->MaxHPText->boundX0+= this->x;
  this->MaxHPText->boundX1+= this->x;
  this->MaxHPText->SetColor(0x82,0x50,0x50,0xff);
  this->MaxHPText->col.A = 0; // why not use setter?
  abStack_38[4] = 0xff;
  this->unk90.AddItem(new UnkGuiClassU3(&(this->MaxHPText->col).A,abStack_38 + 4,0xf,double_array_0));
  this->Link(this->MaxHPText);
  abStack_38[5] = 0;
  this->unk90.AddItem(new UnkGuiClassL(new UnkGuiClassU3(&(this->MaxHPText->col).A,abStack_38 + 5,0xf,double_array_0),this->MaxHPText));
}

u8 WidgetHealthGold::Tick(){
  this->unk90.Tick(1);
  this->HPBar->boundX0 = this->HPBar->x;
  this->HPBar->boundX1 = this->HPBar->x + this->HpPercent;
  return TickChildren();
}

Gfx* WidgetHealthGold::Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1){RENDERCHILDREN();}

u32 WidgetHealthGold::m80043c2c(){return this->unk90.present;}