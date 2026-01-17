#include "widgets/DollMenu.h"
#include "globals.h"


WidgetHealthGold::WidgetHealthGold(CharSheet *chara):WidgetMenu(){
  char buff [88];
  this->HpPercent = 0;
  this->HpPercent = Entity::getHPCurrent(chara)/Entity::getHPMax(chara) *80.0f;
  this->HPBar = WidgetB8(BORG8_HealthBar);
  this->HPBar->SetWidth(0x50);
  this->HPBar->SetHeight(10);
  this->HPBar->SetCoords(0xdc,0x1b);
  this->Link(this->HPBar);
  sprintf(buff,"%u",Entity::GetLevel(chara));
  this->LevelText = new WidgetClipText(buff,5);
  this->LevelText->SetCoords(0xdf,0x37);
  this->LevelText->SetColor(COLOR_RED1);
  this->Link(this->LevelText);
  sprintf(buff,"%ld",PARTY->Gold);
  this->GoldText = new WidgetClipText(buff,10);
  this->GoldText->SetCoords(0xdf,0x45);
  this->GoldText->SetColor(COLOR_RED1);
  this->Link(this->GoldText);
  sprintf(buff,"%d",Entity::getHPCurrent(chara));
  this->CurrHPText = new WidgetClipText(buff,4);
  this->CurrHPText->SetCoords(0xdf,0x29);
  this->CurrHPText->SetColor(COLOR_RED1);
  this->Link(this->CurrHPText);
  sprintf(buff,"%d",Entity::getHPMax(chara));
  this->MaxHPText = new WidgetClipText(buff,4);
  this->MaxHPText->SetCoords(0xff,0x29);
  this->MaxHPText->SetColor(COLOR_RED1);
  this->Link(this->MaxHPText);
}

WidgetHealthGold::~WidgetHealthGold(){
  this->unk90.~GuiAnimationManager();
  WidgetMenu::~WidgetMenu();
}

void WidgetHealthGold::Update(CharSheet *chara){;
  s16 asStack_80 [4];
  char buff [64];
  u8 abStack_38 [48];
  
  if ((this->unk90).present) {
    this->unk90.Tick(10000); //why not add the args?
    this->unk90.Tick(10);
    this->unk90.Tick(10);
  }
  asStack_80[0] =  Entity::getHPCurrent(chara) / Entity::getHPMax(chara) * this->HPBar->GetWidth();
  if (this->HpPercent != asStack_80[0]) {
    this->unk90.AddItem(new GuiAnimatorS16(&this->HpPercent,asStack_80,0xf,&double_array_0));
  }
  sprintf(buff,"%u",Entity::GetLevel(chara));
  this->LevelText = new WidgetClipText(buff,3);
  this->LevelText->SetCoords(0xdf,0x37);
  this->LevelText->posX+=this->posX;
  this->LevelText->boundX0 +=this->posX;
  this->LevelText->boundX1 +=this->posX;
  this->LevelText->SetColor(COLOR_RED1);
  (this->LevelText->col).A = 0;//why not use setter?
  abStack_38[0] = 0xff;
  this->unk90.AddItem(new GuiAnimatorU8(&(this->LevelText->col).A,&abStack_38[0],0xf,&double_array_0));
  this->Link(this->LevelText);
  abStack_38[1] = 0;
  this->unk90.AddItem(new GuiAnimatorL(new GuiAnimatorU8(&(this->LevelText->col).A,&abStack_38[1],0xf,&double_array_0),this->LevelText));
  sprintf(buff,"%u",Entity::getHPCurrent(chara));
  this->CurrHPText = new WidgetClipText(buff,4);
  this->CurrHPText->SetCoords(0xdf,0x29);
  this->CurrHPText->posX+=this->posX;
  this->CurrHPText->boundX0+=this->posX;
  this->CurrHPText->boundX1+=this->posX;
  this->CurrHPText->SetColor(COLOR_RED1);
  (this->CurrHPText->col).A = 0;//why not use setter?
  abStack_38[2] = 0xff;
  this->unk90.AddItem(new GuiAnimatorU8(&(this->CurrHPText->col).A,&abStack_38[2],0xf,&double_array_0));
  this->Link(this->CurrHPText);
  abStack_38[3] = 0;
  this->unk90.AddItem(new GuiAnimatorL(new GuiAnimatorU8(&(this->CurrHPText->col).A,&abStack_38[3],0xf,&double_array_0),this->CurrHPText));
  sprintf(buff,"%u",Entity::getHPMax(chara));
  this->MaxHPText = new WidgetClipText(buff,4);
  this->MaxHPText->SetCoords(0xff,0x29);
  this->MaxHPText->posX+= this->posX;//why not use setter?
  this->MaxHPText->boundX0+= this->posX;
  this->MaxHPText->boundX1+= this->posX;
  this->MaxHPText->SetColor(COLOR_RED1);
  this->MaxHPText->col.A = 0; // why not use setter?
  abStack_38[4] = 0xff;
  this->unk90.AddItem(new GuiAnimatorU8(&(this->MaxHPText->col).A,&abStack_38[4],0xf,&double_array_0));
  this->Link(this->MaxHPText);
  abStack_38[5] = 0;
  this->unk90.AddItem(new GuiAnimatorL(new GuiAnimatorU8(&(this->MaxHPText->col).A,&abStack_38[5],0xf,&double_array_0),this->MaxHPText));
}

u8 WidgetHealthGold::Tick(){
  this->unk90.Tick(1);
  this->HPBar->boundX0 = this->HPBar->posX;
  this->HPBar->boundX1 = this->HPBar->posX + this->HpPercent;
  return TickChildren();
}

Gfx* WidgetHealthGold::Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1){RENDERCHILDREN();}

u32 WidgetHealthGold::GetAnimationCount(){return this->unk90.present;}