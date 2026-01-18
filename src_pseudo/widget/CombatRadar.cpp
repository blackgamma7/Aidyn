#include "widgets/CombatRadar.h"
#include "combat/CombatStruct.h"
#include "globals.h"

WidgetCombatRadar::WidgetCombatRadar():BaseWidget(){
  this->posX = (SCREEN_WIDTH-46);
  this->posY = (SCREEN_HEIGHT-41);
  this->col.A = 164;
  this->glow = 0;
  this->glowDelta = -4;
  this->compass = WidgetB8(BORG8_CompassRing);
  this->compass->posX = this->posX - (this->compass->GetWidth()/2) + 1;
  this->compass->posY = this->posY - (this->compass->GetHeight()/2) + 1;
  this->compass->col.A = col.A;
  BaseWidget::Link(this->compass);
}

WidgetCombatRadar::~WidgetCombatRadar(){
    BaseWidget::~BaseWidget();
}

u8 WidgetCombatRadar::Tick(){
  this->glow+=this->glowDelta;
  if (this->glow < -150) {
    this->glow = -150;
    this->glowDelta = -this->glowDelta;
  }
  else if (0 < this->glow) {
    this->glow = 0;
    this->glowDelta = -this->glowDelta;
  }
  this->compass->col.A = this->col.A;
  return this->TickChildren();
}

int FUN_80097674(playerData *p){
  for(u32 i=0;i<gCombatP->EntCount;i++){
    if (gGlobals.playerDataArray[i]==p) return gCombatP->substruct2[1].arrayB[i];
  }
  return 0;
}

Gfx * WidgetCombatRadar::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  Gfx* gfx = RenderChildren(g,x0,y0,x1,y1);
  if (0 < PHANDLE.max_player) {
    for(u16 i=0;i<PHANDLE.max_player;i++) {
      playerData *pDat = &PHANDLE.playerDats[i];
      if ((pDat) && (pDat->state)) {
        if (i == PHANDLE.cameraFocus) {
          this->col.R = 150;
          this->col.G = 150;
        }
        else if (!pDat->combatAlly) {
          this->col.R = 150;
          this->col.G = 0;
        }
        else {
          this->col.R = 0;
          this->col.G = 150;
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
            if(this->col.R)this->col.R+=this->glow;
            if(this->col.G)this->col.G+=this->glow;
            if(this->col.B)this->col.B+=this->glow;
          }
        }
        float posXF = (pDat->collision).pos.x - PHANDLE.playerDats[PHANDLE.cameraFocus].collision.pos.x;
        float posYF = (pDat->collision).pos.z - PHANDLE.playerDats[PHANDLE.cameraFocus].collision.pos.z;
        vec2f avStack_70={
          (posXF * -gCamera.rotationXZ.y + posYF * gCamera.rotationXZ.x) * 0.5f,
          (posXF * gCamera.rotationXZ.x - posYF * -gCamera.rotationXZ.y) * 0.5f
        };
        if (20.0f < Vec2Length(&avStack_70)) {
          this->col.R >>= 1;
          this->col.G >>= 1;
          this->col.B >>= 1;
          Vec2Normalize(&avStack_70);
          avStack_70.x*= 20.0;
          avStack_70.y*= 20.0;
        }
        u16 blipx = this->posX + avStack_70.x;
        u16 blipy = this->posY + avStack_70.y;
        gfx = DrawRectangle(gfx,blipx,blipy,blipx + 2,blipy + 2,
          this->col.R*gGlobals.brightness,this->col.G*gGlobals.brightness,this->col.B*gGlobals.brightness,this->col.A*gGlobals.brightness);
      }
    }
  }
  return gfx;
}

u32 WidgetCombatRadar::GetNumber(){return WidgetN_Other;}