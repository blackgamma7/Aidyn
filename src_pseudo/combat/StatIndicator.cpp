#include "combat/CombatStat.h"
#include "globals.h"
#define FILENAME "./src/combatstatindicator.cpp"

CombatStatIndicatorHandler combatStatIndicatorDat={0};

namespace CombatStatIndicator{
  //clear combatStatIndicatorDat, load digit textures
  void Init(){
    CLEAR(&combatStatIndicatorDat);
    combatStatIndicatorDat.borg1Digits[0] = (Borg1Header *)getBorgItem(0x16);
    combatStatIndicatorDat.borg1Digits[1] = (Borg1Header *)getBorgItem(0x11);
    combatStatIndicatorDat.borg1Digits[2] = (Borg1Header *)getBorgItem(0x15);
    combatStatIndicatorDat.borg1Digits[3] = (Borg1Header *)getBorgItem(0x14);
    combatStatIndicatorDat.borg1Digits[4] = (Borg1Header *)getBorgItem(0xf);
    combatStatIndicatorDat.borg1Digits[5] = (Borg1Header *)getBorgItem(0xe);
    combatStatIndicatorDat.borg1Digits[6] = (Borg1Header *)getBorgItem(0x13);
    combatStatIndicatorDat.borg1Digits[7] = (Borg1Header *)getBorgItem(0x12);
    combatStatIndicatorDat.borg1Digits[8] = (Borg1Header *)getBorgItem(0xd);
    combatStatIndicatorDat.borg1Digits[9] = (Borg1Header *)getBorgItem(0x10);
    ALLOCS(combatStatIndicatorDat.Indicators,MAXSTATDIGITS*sizeof(PlaneObj),135);
    memset(combatStatIndicatorDat.Indicators,0,MAXSTATDIGITS*sizeof(PlaneObj));
    ALLOCS(combatStatIndicatorDat.array,MAXSTATDIGITS,138);
    for(u32 i=0;i<MAXSTATDIGITS;i++){combatStatIndicatorDat.array[i]=i;}
    }
//parse damage/healing number for display
uint AddItem(playerData *param_1,int type,short num){
  Borg1Data *pBVar1;
  u8 *puVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  vec3f *pvVar8;
  u8 *dst;
  PlaneObj *pcVar7;
  byte bVar10;
  float fVar11;
  u8* aiStack_70 [MAXSTATDIGITS];
  uint index;
  Borg1Header *pBStack_2c;
  
  index = (uint)combatStatIndicatorDat.array[combatStatIndicatorDat.index++];
  pcVar7 = &combatStatIndicatorDat.Indicators[index];
  if (num < 100) {
    iVar6 = (int)num;
    if (num < 10) {
      aiStack_70[0] = combatStatIndicatorDat.borg1Digits[iVar6]->dat->bmp;
      uVar4 = 1;
    }
    else {
      aiStack_70[0] = combatStatIndicatorDat.borg1Digits[iVar6/10]->dat->bmp;
      aiStack_70[1] = combatStatIndicatorDat.borg1Digits[iVar6%10]->dat->bmp;                    
      uVar4 = 2;
    }
  }
  else {
    iVar5 = (int)num + ((int)num / 100) * -100;
    iVar6 = iVar5 / 10;
    aiStack_70[0] = combatStatIndicatorDat.borg1Digits[(int)num / 100]->dat->bmp;
    aiStack_70[1] = combatStatIndicatorDat.borg1Digits[iVar6]->dat->bmp;
    aiStack_70[2] =
         *(undefined4 *)
          (*(int *)(*(int *)((int)&combatStatIndicatorDat + iVar5 * 4 + iVar6 * -0x28) + 0x10) + 0xc
          );
    uVar4 = 3;
  }
  pBStack_2c = &pcVar7->Statborg1Head;
  (pcVar7->datStatBorg1Data).type = B1_IA8;
  (pcVar7->Statborg1Head).dat = &pcVar7->datStatBorg1Data;
  (pcVar7->datStatBorg1Data).lods = 1;
  pBVar1 = (pcVar7->Statborg1Head).dat;
  (pcVar7->datStatBorg1Data).flag = 0;
  pBVar1->Width = 0x40;
  ((pcVar7->Statborg1Head).dat)->Height = 0x10;
  pBVar1 = (pcVar7->Statborg1Head).dat;
  ALLOCS(pBVar1->bmp,0x400,209);
  pBVar1->pallette = NULL;
  pBVar1->dList = NULL;
  (pcVar7->Statborg1Head).bitmapA = NULL;
  (pcVar7->Statborg1Head).bitmapB = NULL;
  memset(pBVar1->bmp,0,0x400);
  puVar3 = ((pcVar7->Statborg1Head).dat)->bmp;
  for(bVar10=0;bVar10 < MAXSTATDIGITS;bVar10++) {
    dst = puVar3 + uVar4 * -8 + 0x20;
    puVar3+= 0x40;
    if (uVar4) {
      for(u8 uVar9=0;uVar9 < uVar4;uVar9++) {
        u8** piVar7 = aiStack_70 + uVar9;
        memcpy(dst,*piVar7,0x10);
        *piVar7+= 0x10;
        dst+= 0x10;
      }
    }
  }
  pcVar7->borg1p = pBStack_2c;
  pcVar7->UScale = 1;
  if (type == 0) {
    pcVar7->vertCols[0].R = 0xff;
    pcVar7->vertCols[0].G = 0xff;
    pcVar7->vertCols[1].R = 0xff;
    pcVar7->vertCols[1].G = 0xff;
    pcVar7->vertCols[2].R = 0xff;
    pcVar7->vertCols[2].G = 0xff;
    pcVar7->vertCols[3].R = 0xff;
    pcVar7->vertCols[3].G = 0xff;
    pcVar7->vertCols[0].B = 0x80;
    pcVar7->vertCols[1].B = 0x80;
    pcVar7->vertCols[2].B = 0x80;
    pcVar7->vertCols[3].B = 0x80;
    (pcVar7->statStartPos).x = (param_1->collision).pos.x;
    (pcVar7->statStartPos).y = ((param_1->collision).pos.y - param_1->interactRadiusB) + gEntityDB->GetHeight(param_1->ent_ID);
    (pcVar7->unk278).x = 0.5f;
    (pcVar7->unk278).y = 0.2f;
    (pcVar7->statStartPos).z = (param_1->collision).pos.z;
    if (vec3_proximity(&pcVar7->statStartPos,&gGlobals.Sub.camera.pos) < 0.0)
      fVar11 = -vec3_proximity(&pcVar7->statStartPos,&gGlobals.Sub.camera.pos);
    else
      fVar11 = vec3_proximity(&pcVar7->statStartPos,&gGlobals.Sub.camera.pos);
    pcVar7->unk280 = fVar11 * 0.15f;
    pcVar7->statAlpha = 0xff;
    pcVar7->statAlphaDelta = 1;
  }
  else if (type == 1) {
    pcVar7->vertCols[0].R = 0x80;
    pcVar7->vertCols[0].G = 0x80;
    pcVar7->vertCols[1].R = 0x80;
    pcVar7->vertCols[1].G = 0x80;
    pcVar7->vertCols[2].R = 0x80;
    pcVar7->vertCols[2].G = 0x80;
    pcVar7->vertCols[3].R = 0x80;
    pcVar7->vertCols[3].G = 0x80;
    pcVar7->vertCols[0].B = 0xff;
    pcVar7->vertCols[1].B = 0xff;
    pcVar7->vertCols[2].B = 0xff;
    pcVar7->vertCols[3].B = 0xff;
    (pcVar7->statStartPos).x = (param_1->collision).pos.x;
    pvVar8 = &pcVar7->statStartPos;
    (pcVar7->statStartPos).y =((param_1->collision).pos.y - param_1->interactRadiusB) + gEntityDB->GetHeight(param_1->ent_ID) + 0.5f;

    (pcVar7->unk278).x = 1.5;
    (pcVar7->unk278).y = 0.6;
    (pcVar7->statStartPos).z = (param_1->collision).pos.z;
    if (vec3_proximity(pvVar8,&gGlobals.Sub.camera.pos) < 0.0)
      fVar11 = -vec3_proximity(pvVar8,&gGlobals.Sub.camera.pos);
    else 
      fVar11 = vec3_proximity(pvVar8,&gGlobals.Sub.camera.pos);
    pcVar7->unk280 = fVar11 * 0.15;
    pcVar7->statAlpha = 0;
    pcVar7->statAlphaDelta = -1;
  }
  pcVar7->statVisible = 1;
  pcVar7->statTime = 0;
  return index;
}
//precess and draw damage/healing number
Gfx * Tick(Gfx *g,int delta){
  uint uVar1;
  Borg1Data *pBVar2;
  Gfx *pGVar3;
  byte bVar4;
  PlaneObj *x;
  uint i;
  int iVar6;
  float fVar7;
  float fVar8;
  char cVar10;
  float fVar9;
  vec3f pos;
  vec3f rot;
  vec2f avStack_68;
  
  pGVar3 = PlaneObj_SetupGfx(g,9);
  for(i=0;i<MAXSTATDIGITS;i++) {
    x = &combatStatIndicatorDat.Indicators[i];
    if (x->statVisible) {
      if (x->statTime < 120) {
        fVar8 = __sinf((x->statTime / 120.0f) * 1.5708f) * x->statAlphaDelta;
        cVar10 = fVar8 * 255.0f;
        pos.x = (x->statStartPos).x;
        fVar9 = fVar8 * 0.5f;
        bVar4 = x->statAlpha - cVar10;
        x->vertCols[0].A = bVar4;
        x->vertCols[1].A = bVar4;
        x->vertCols[2].A = bVar4;
        x->vertCols[3].A = bVar4;
        pos.y = (x->statStartPos).y + fVar9 * x->unk280;
        pos.z = (x->statStartPos).z;
        avStack_68.x = (x->unk278).x + fVar8 * x->unk280;
        rot.x = pos.x - gGlobals.Sub.camera.pos.x;
        rot.z = pos.z - gGlobals.Sub.camera.pos.z;
        rot.y = pos.y - gGlobals.Sub.camera.pos.y;
        avStack_68.y = (x->unk278).y + fVar8 * 0.4f * x->unk280;
        guNormalize(&rot.x,&rot.y,&rot.z);
        pGVar3 = PlaneObj_Render(PlaneObj_GetTexture(pGVar3,x),x,&pos,&rot,&avStack_68);
        x->statTime+= delta;
      }
      else {
        pBVar2 = (x->Statborg1Head).dat;
        memset(pBVar2->bmp,0,(uint)pBVar2->Width * (uint)pBVar2->Height);
        HFREE(((x->Statborg1Head).dat)->bmp,351);
        CLEAR(x);
        combatStatIndicatorDat.array[--combatStatIndicatorDat.index] = (u8)i;
      }
    }
  }
  return pGVar3;
}
//free combatStatIndicatorDat and digit textures
void Free(void){
  Borg1Data *pBVar1;
  PlaneObj *pvVar2;
  uint i;
  
  for(i=0;i<MAXSTATDIGITS;i++) {
    pvVar2 = &combatStatIndicatorDat.Indicators[i];
    if (pvVar2->statVisible) {
      pBVar1 = (pvVar2->Statborg1Head).dat;
      memset(pBVar1->bmp,0,(uint)pBVar1->Width * (uint)pBVar1->Height);
      HFREE(((pvVar2->Statborg1Head).dat)->bmp,415);
      CLEAR(pvVar2);
    }
  }
  memset(combatStatIndicatorDat.Indicators,0,MAXSTATDIGITS*sizeof(PlaneObj));
  HFREE(combatStatIndicatorDat.Indicators,422);
  memset(combatStatIndicatorDat.array,0,MAXSTATDIGITS);
  HFREE(combatStatIndicatorDat.array,425);
  for(i=0;i<10;i++) {
    FREEQB1(&combatStatIndicatorDat.borg1Digits[i]);
  }
  CLEAR(&combatStatIndicatorDat);
}

}