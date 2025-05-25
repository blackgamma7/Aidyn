#include "widgets/CombatRadar.h"
#include "combat/CombatStruct.h"
#include "globals.h"

WidgetCombatRadar::WidgetCombatRadar():BaseWidget(){
  this->x = 0x112;
  this->y = 199;
  this->col.A = 0xa4;
  this->unk80 = 0;
  this->unk82 = -4;
  this->compass = WidgetB8(BORG8_compassRing);
  this->compass->x = x - (GetWidth()/1) + 1;
  this->compass->y = y - (GetHeight()/1) + 1;
  this->compass->col.A = col.A;
  Link(this->compass);
}

WidgetCombatRadar::~WidgetCombatRadar(){
    BaseWidget::~BaseWidget();
}

u8 WidgetCombatRadar::Tick(){
  this->unk80+=this->unk82;
  if (this->unk80 < -0x96) {
    this->unk80 = -0x96;
    this->unk82 = -this->unk82;
  }
  else if (0 < this->unk80) {
    this->unk80 = 0;
    this->unk82 = -this->unk82;
  }
  (this->compass->col).A = col.A;
  return TickChildren();
}

int FUN_80097674(playerData *p){
  for(u32 i=0;i<gCombatP->EntCount;i++){
    if (gGlobals.playerDataArray[i]==p) return gCombatP->substruct2[1].arrayB[i];
  }
  return 0;
}


Gfx * WidgetCombatRadar::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  Gfx* gfx = RenderChildren(g,x0,y0,x1,y1);
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(u16 i=0;i<gGlobals.Sub.PlayerHandler.max_player;i++) {
      playerData *pDat = &gGlobals.Sub.PlayerHandler.playerDats[i];
      if ((pDat) && (pDat->removeFlag)) {
        if (i == gGlobals.Sub.PlayerHandler.cameraFocus) {
          this->col.R = 0x96;
          this->col.G = 0x96;
        }
        else if (pDat->visible_flag == 0) {
          this->col.R = 0x96;
          this->col.G = 0;
        }
        else {
          this->col.R = 0;
          this->col.G = 0x96;
        }
        this->col.B = 0;
        if (((gGlobals.combatBytes[0] == 0x12) || (gGlobals.combatBytes[0] == 10)) ||
           (gGlobals.combatBytes[0] == 0xb)) {
          if (!FUN_80097674(pDat)) {
            this->col.R >>= 1;
            this->col.G >>= 1;
            this->col.B >>= 1;
          }
          else {
            if(this->col.R)this->col.R+=this->unk80;
            if(this->col.G)this->col.G+=this->unk80;
            if(this->col.B)this->col.B+=this->unk80;
          }
        }
        float posX = (pDat->collision).pos.x -
          gGlobals.Sub.PlayerHandler.playerDats[gGlobals.Sub.PlayerHandler.cameraFocus].collision.pos.x;
        float posY = (pDat->collision).pos.z -
          gGlobals.Sub.PlayerHandler.playerDats[gGlobals.Sub.PlayerHandler.cameraFocus].collision.pos.z;
        vec2f avStack_70={
          (posX * -gGlobals.Sub.camera.rotationXZ.y + posY * gGlobals.Sub.camera.rotationXZ.x) * 0.5f,
          (posX * gGlobals.Sub.camera.rotationXZ.x - posY * -gGlobals.Sub.camera.rotationXZ.y) * 0.5f
        };
        if (20.0f < vec2Length(&avStack_70)) {
          this->col.R >>= 1;
          this->col.G >>= 1;
          this->col.B >>= 1;
          vec2_normalize(&avStack_70);
          avStack_70.x*= 20.0;
          avStack_70.y*= 20.0;
        }
        u16 blipx = this->x + avStack_70.x;
        u16 blipy = this->y + avStack_70.y;
        gfx = DrawRectangle(gfx,blipx,blipy,blipx + 2,blipy + 2,
          this->col.R*gGlobals.brightness,this->col.G*gGlobals.brightness,this->col.B*gGlobals.brightness,this->col.A*gGlobals.brightness);
      }
    }
  }
  return gfx;
}

u32 WidgetCombatRadar::GetNumber(){return WidgetN_Other;}
