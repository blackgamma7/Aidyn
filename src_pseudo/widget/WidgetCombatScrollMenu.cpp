#include "widgets/CombatScrollMenu.h"

BaseWidget* WCSM_UpFunc(BaseWidget* param_1,BaseWidget *param_2) {
  WSMSub *sub = (WSMSub *)param_2->substruct;
  u16 uVar1 = sub->numChoices;
  if (uVar1 == 0) return 0;
  if (sub->highlight) uVar1 = sub->highlight;
  sub->highlight = uVar1 - 1;
  return 0;
}

BaseWidget* WCSM_UpFunc(BaseWidget* param_1,BaseWidget *param_2) {
  WSMSub *sub = (WSMSub *)param_2->substruct;
  if (sub->numChoices != 0) {
    if ((uint)sub->highlight == sub->numChoices - 1) {
      sub->highlight = 0;
    }
    else sub->highlight++;
    return 0;
  }
  return 0;
}

WidgetCombatScrollMenu::WidgetCombatScrollMenu(u8 param_2):WidgetScrollMenu(param_2){
  this->UpButtonFunc = WCSM_UpFunc;
  this->DownButtonFunc = WCSM_DownFunc;
}

u8 WidgetCombatScrollMenu::Tick() {
  short sVar1;
  u16 uVar2;
  BaseWidget *pBVar3;
  u8 uVar6;
  ulong uVar4;
  ulong uVar5;
  bool bVar7;
  BaseWidget **ppBVar9;
  u16 lVar8;
  int iVar10;
  u16 uVar13;
  int iVar12;
  WSMSub *sub = (WSMSub *)this->substruct;
  iVar12 = 0;
  uVar13 = 0;
  if (sub->items) {
    uVar6 = sub->blendB + sub->blendSign;
    sub->blendB = uVar6;
    if ((uVar6 == 0) || ((int)(sub->blendA - 1) <= (int)(uint)sub->blendB)) {
      sub->blendSign = -sub->blendSign;
    }
    for(u32 i=0;i<sub->numChoices;i++){
        pBVar3 = sub->items[i];
        pBVar3->boundX0 = this->boundX0;
        pBVar3->boundX1 = this->boundX1;
        pBVar3->boundY0 = this->boundY0;
        pBVar3->boundY1 = this->boundY1;
        pBVar3->SetCoords(this->posX,this->posY + (short)iVar12 + sub->yOff);
        uVar4 = pBVar3->GetHeight();
        iVar12+= pBVar3->GetHeight() + sub->vSpace;
        uVar13 = iVar12;
        if (i == sub->highlight) {
          sVar1 = pBVar3->posY;
          iVar10 = (int)sVar1 + uVar4;
          if ((this->boundY1 < iVar10) && (sub->yOff == sub->unk16)) {
            sub->unk16-= (iVar10 - this->boundY1);
          }
          if ((sVar1 < this->boundY0) && (sub->yOff == sub->unk16)) {
            sub->unk16 =(this->boundY0 - (int)sVar1)+sub->unk16;
          }
        }
      }
  }
  this->SetHeight(uVar13);
  if (sub->unk14 < sub->XOff) {
    sub->XOff-=sub->scrollSpeed;
    bVar7 = sub->XOff < sub->unk14;
LAB_8002ee78:
    if (bVar7) {
      sub->XOff = sub->unk14;
    }
  }
  else {
    if ((short)sub->XOff < sub->unk14) {
      sub->XOff+=sub->scrollSpeed;
      bVar7 = sub->XOff < sub->unk14;
      goto LAB_8002ee78;
    }
  }
  if (sub->unk16 < sub->yOff) {
    sub->yOff-=sub->scrollSpeed;
    bVar7 = sub->yOff < sub->unk16;
  }
  else {
    if (sub->unk16 <= sub->yOff) goto LAB_8002eee0;
    sub->yOff+=sub->scrollSpeed;
    bVar7 = sub->unk16 < sub->yOff;
  }
  if (bVar7) {
    sub->yOff = sub->unk16;
  }
LAB_8002eee0:
  return TickChildren();
}

void FUN_8002ef0c(u8 param_1,u8 param_2,Color32 *param_3,float param_4) {
  byte local_res0;
  byte local_res4;
  
  local_res4 = (char)param_2 >> 7;
  local_res0 = (char)param_1 >> 7;
  param_3->R = local_res0 + ((uint)local_res4 - (uint)local_res0) * param_4;
  param_3->G = local_res0 + ((uint)local_res4 - (uint)local_res0) * param_4;
  param_3->B = local_res0 + ((uint)local_res4 - (uint)local_res0) * param_4;
  param_3->A = param_1 + ((uint)param_2 - (uint)param_1) * param_4;
}

Gfx * WidgetCombatScrollMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  Color32 *pCVar1;
  u8 bVar2,uVar5,uVar6,uVar7;
  Color32 CVar8;
  byte bStack_1e8,bStack_1e7,bStack_1e6;
  Color32 aCStack_1a8,CStack_168,uStack_128,aCStack_e8,CStack_a8,CStack_68;
  WSMSub *sub;
  
  WSMSub *sub = (WSMSub *)this->substruct;
  for(u32 i=0;i<sub->numChoices;i++){
      BaseWidget *entry = sub->items[i];
      if (entry){
        if (i == sub->highlight) {
          CLEAR(&aCStack_1a8);
          pCVar1 = &entry->col;
          uVar5 = pCVar1->R;
          uVar6 = pCVar1->G;
          uVar7 = pCVar1->B;
          bVar2 = (entry->col).A;
          CVar8 = *pCVar1;
          aCStack_1a8 = CVar8;
          CLEAR(&uStack_128);
          uStack_128.R = sub->reds[0];
          uStack_128.G = sub->greens[0];
          uStack_128.B = sub->blues[0];
          uStack_128.A = sub->alphas[0];
          CStack_168 = uStack_128;
          CStack_a8 = uStack_128;
          CStack_68 = CVar8;
          FUN_8002ef0c(sub->alphas[0],bVar2,&aCStack_e8,(float)sub->blendB / (float)sub->blendA);
          entry->SetColor(aCStack_e8.R,aCStack_e8.G,aCStack_e8.B,aCStack_e8.A);
          g = entry->Render(g,x0,y0,x1,y1);
          entry->SetColor(uVar5,uVar6,uVar7,bVar2);
        }
        else g = entry->Render(g,x0,y0,x1,y1);
      }
  }
  RENDERCHILDREN();
}

WidgetCombatScrollMenu::~WidgetCombatScrollMenu() {
  WidgetScrollMenu::~WidgetScrollMenu();
}
