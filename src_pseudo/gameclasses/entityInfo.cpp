#include "entity.h"
#include "eventFlag.h"

void CharExp::Init(ItemID id){
  u8 bVar1;
  u8 bVar3;
  u8 bVar4;
  Entity_Ram *pEVar5;
  
  bVar3 = GETINDEX(id);
  pEVar5 = gEntityDB->entities + bVar3;
  this->rom0x2b = pEVar5->rom0x2b; //seems unused
  this->school = pEVar5->School;
  this->protection = pEVar5->BaseProtect;
  this->total = 0;
  this->spending = 0;
  this->damage = pEVar5->BaseDamage;
  this->flags = pEVar5->flags;
  if (pEVar5->aspect == ASPECT_SOLAR) this->flags |= CHAR_IsSolar;
  //is alaron "Named" yet?
  if ((bVar3 == EntInd_Alaron) && (getEventFlag(FLAG_Cinematic2))) this->flags |= CHAR_TrueName;
}

u8 CharExp::GetAspect(){return (flags & CHAR_IsSolar) ? ASPECT_SOLAR:ASPECT_LUNAR;}