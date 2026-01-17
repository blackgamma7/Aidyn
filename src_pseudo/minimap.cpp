#include "globals.h"




MinimapSec_dat* minimap_sec_pointers[]={
    minimaps_Gwernia,MinimapSec_dat_ARRAY_800edf0c,MinimapSec_erromon,MinimapSec_ehud,
    minimap_sec_mageschool,MinimapSec_dat_ARRAY_800ee508,MinimapSec_dat_ARRAY_800ee55c,
    minimap_sec_Barrows,NULL
};
extern minimap_dat_2 minimap_dats_2[]; //TODO: Fill in

//an unused array of strings. Likely important Zone coords
char gMinimapUnkCoords[][2]={
    {'3','I'},{'3','J'},{'3','K'},{'3','H'},{'3','C'},{'3','D'},{'3','E'},{'3','F'},{'3','G'}
};
u16 gMinimapUnkVal=0;

//a macro that could be replaced with an LE adaptation

#define MapShorts32 *(u32*)this->mapshorts

void MiniMap_Save(u8 *dat){
  u16 k = 0;
  memset(dat,0,24);
  for(u16 i=0;minimap_sec_pointers[i]!=NULL;i++){
    for(u16 j=0;minimap_sec_pointers[i][j].flagIndex!=0;j++,k++){
        dat[k >> 3]|=minimap_sec_pointers[i][j].checked<<(k & 7);
    }
  }
}

void MiniMap_Load(u8 *dat){
  u16 k = 0;
  for(u16 i=0;minimap_sec_pointers[i]!=NULL;i++){
    for(u16 j=0;minimap_sec_pointers[i][j].flagIndex!=0;j++,k++){
        if(dat[k >> 3]>>(k & 7)&1) minimap_sec_pointers[i][j].checked=true;
        else minimap_sec_pointers[i][j].checked=false;
    }
  }
}

void MiniMap::Init(){
  this->widget24 = NULL;
  this->widget28 = NULL;
  this->unk2c = NULL;
  this->unk30 = NULL;
  this->unk34 = NULL;
  this->unk38 = NULL;
  this->widget18 = NULL;
  this->widget1c = NULL;
  this->widget20 = NULL;
  this->mapdat = NULL;
  this->mapshorts[0] = 0;
  this->mapshorts[1] = 0;
  this->field19_0x48 = 0.0;
  this->field20_0x4c = 0.0;
  this->field21_0x50 = 0.0;
  this->field22_0x54 = 0.0;
  this->floatX = 0.0;
  this->floatY = 0.0;
  this->savedPlayerPos.x = 0.0;
  this->savedPlayerPos.y = 0.0;
  this->savedPlayerPos.z = 0.0;
  this->unk3c = 0;
  this->B_buttonToggle = false;
  this->showAllVar = 0;
  this->field18_0x44 = 0;
  this->active = 0;
  this->ShowMinimap = 1;
  this->field23_0x58 = 1.0;
  this->field24_0x5c = 1.0;
}

bool MiniMap::Free2(){Free();return true;}


void MiniMap::LoadData(MinimapSec_dat *secDat){
  float fVar2;
  s16 sVar5;
  u16 uVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  
  if (this->mapdat == secDat) return;
  Free();
  fVar8 = 172.0f;
  fVar7 = 2.0f;
  fVar2 = 223.0f;
  fVar9 = 1.0f;
  if (this->B_buttonToggle == false) {
    uVar6 = 0x3c;
    this->field43_0xa8 = 0xed;
    sVar5 = 0xa3;
    fVar7 = fVar9;
    fVar8 = fVar2;
  }
  else {
    uVar6 = 120;
    if (this->B_buttonToggle) goto LAB_80051504;
    this->field43_0xa8 = 0xb1;
    sVar5 = 0x34;
  }
  this->field45_0xac = uVar6;
  this->field46_0xae = uVar6;
  this->field44_0xaa = sVar5;
  this->mapScale = fVar7;
  this->field29_0x70 = fVar7;
  this->Y9C = fVar8;
  this->field41_0xa0 = fVar8;
LAB_80051504:
  fVar9 = 297.0f;
  this->field30_0x74 = 0.0;
  this->field33_0x80 = 0.0;
  this->field36_0x8c = 0.0;
  this->field39_0x98 = 0;
  this->field42_0xa4 = 0.0;
  this->mapX = this->field43_0xa8;
  this->field32_0x7c = this->field43_0xa8;
  this->X90 = 297.0f;
  this->field38_0x94 = 297.0f;
  this->mapY = this->field44_0xaa;
  this->field35_0x88 = this->field44_0xaa;
  fVar9 = this->mapScale * 8.0f;
  this->widget24 = WidgetB8(BORG8_WhiteBorderGraySquare);
  this->widget24->SetCoords((this->mapX - this->mapScale * 8.0f),(this->mapY - this->mapScale * 8.0f));
  this->widget24->SetWidth((this->X90 - this->mapX) + this->mapScale * 16.0f);
  this->widget24->SetHeight((this->Y9C - this->mapY) + this->mapScale * 16.0f);
  this->widget24->SetColor(COLOR_BLACK);
  this->widget28 = WidgetB8(BORG8_WhiteBorderAlphaSquare);
  this->widget28->SetCoords(this->mapX,this->mapY);
  this->widget28->SetWidth((this->X90 - this->mapX) + 1.0f);
  this->widget28->SetHeight((this->Y9C - this->mapY) + 1.0f);
  this->widget28->SetColor(COLOR_BLACK);
  this->mapdat = secDat;
  this->active = 1;
}

void MiniMap::Free(){
  this->mapdat = NULL;
  this->unk3c = 0;
  this->active = 0;
  if (this->widget24) {
    FREEQW(this->widget24);
    this->widget24 = NULL;
  }
  if (this->widget28) {
    FREEQW(this->widget28);
    this->widget28 = NULL;
  }
  if (this->unk2c) {
    FREEQW(this->unk2c);
    this->unk2c = NULL;
  }
  if (this->unk30) {
    FREEQW(this->unk30);
    this->unk30 = NULL;
  }
  if (this->unk34) {
    FREEQW(this->unk34);
    this->unk34 = NULL;
  }
  if (this->unk38) {
    FREEQW(this->unk38);
    this->unk38 = NULL;
  }
  FreeLinked();
}

bool MiniMap::SpecialSections(float posX,float posY,float posZ){
  MinimapSec_dat *pMVar1;
  int iVar2;
  u32 uVar3;
  minimap_dat_2 *pmVar4;
  bool bVar6;
  u32 uVar5;
  minimap_dat_2 *pmVar7;
  float fVar8;
  float fVar9;
  u32 uVar10;
  u32 uVar11;
  u32 cellCoord;
  
  pMVar1 = this->mapdat;
  //another case-switch?
  if (pMVar1 == minimaps_Gwernia) {
    cellCoord = MapShorts32;
    //messy case-switch optimization. cleanup later.
    if (cellCoord == 0x90007) {
      if ((u32)(this->savedPlayerPos.y *.25) != (u32)(posY *.25)) return true;
      if (this->unk3c != 8) return false;
      uVar10 = this->savedPlayerPos.z / 26.0f;
      fVar8 = 26.0f;
    }
    else {
      if (cellCoord != 0x10001) {
        if (cellCoord != 0xf0009) {
          return false;
        }
        uVar10 = this->savedPlayerPos.y * 0.25f;
        fVar8 = posY * 0.25f;
        if (INT_MAX_f <= fVar8) {
          fVar8 = fVar8 - INT_MAX_f;
          goto LAB_80051c70;
        }
        goto LAB_80051c60;
      }
      if ((u32)this->savedPlayerPos.x / 35.0f != (u32)posX / 35.0f) {
        return true;
      }
      fVar9 = this->savedPlayerPos.z / 25.0f;
      fVar8 = 25.0f;
      uVar10=fVar9;
    }
    fVar8 = posZ / fVar8;
    if (fVar8 < INT_MAX_f) {
LAB_80051e0c:
      uVar11 = (u32)fVar8;
      goto LAB_80051e2c;
    }
    fVar8 = fVar8 - INT_MAX_f;
  }
  else {
    if (pMVar1 == minimap_sec_mageschool) {
      if (MapShorts32 != 0x10001) {
        return false;
      }
      fVar8 = this->savedPlayerPos.y * 0.25f;
      if (fVar8 < INT_MAX_f) {
        uVar10 = (u32)fVar8;
      }
      else {
        uVar10 = (int)(fVar8 - INT_MAX_f) | 0x80000000;
      }
      fVar8 = posY * 0.25f;
      if (INT_MAX_f <= fVar8) {
        fVar8 = fVar8 - INT_MAX_f;
LAB_80051c70:
        uVar11 = (int)fVar8 | 0x80000000;
        goto LAB_80051c80;
      }
LAB_80051c60:
      uVar11 = (u32)fVar8;
LAB_80051c80:
      if (uVar10 != uVar11) {
        return true;
      }
      return false;
    }
    if (pMVar1 != MinimapSec_ehud) {
      if (pMVar1 == minimap_sec_Barrows) return CaseBarrows(posX);
      if (pMVar1 != MinimapSec_dat_ARRAY_800ee508) {
        return false;
      }
      if (MapShorts32 != 0xb0003) {
        return false;
      }
      pmVar7 = minimap_dats_2 + 0xc;
      if (minimap_dats_2[0xc].borg8 == 0) return false;
      while (!getEventFlag(pmVar7->flag)) {
        pmVar4 = pmVar7 + 1;
        pmVar7 = pmVar7 + 1;
        if (pmVar4->borg8 == 0) return false;
      }
      uVar5 = this->field18_0x44;
LAB_80051cd8:
      uVar3 = *(u32*)pmVar7->unk0x0;
      if (uVar5 != uVar3) {
        this->field18_0x44 = uVar3;
        return true;
      }
      return false;
    }
    iVar2 = MapShorts32;
    if (iVar2 == 0xf0005) {
      pmVar7 = minimap_dats_2;
      if (minimap_dats_2[0].borg8 == 0) {
        return false;
      }
      while (!getEventFlag(pmVar7->flag)) {
        pmVar4 = pmVar7 + 1;
        pmVar7++;
        if (pmVar4->borg8 == 0) return false;
      }
      uVar5 = this->field18_0x44;
      goto LAB_80051cd8;
    }
    if (iVar2 != 0x3000b) {
      if (iVar2 != 0x90009) {
        return false;
      }
      if (0.0 <= (this->savedPlayerPos.x - 16.0f) * (posX - 16.0f)) {
        return false;
      }
      return true;
    }
    if ((u32)(this->savedPlayerPos.x / 48.0f) != (u32)(posX / 48.0f)) return true;
    uVar10 = this->savedPlayerPos.z / 48.0f;
    fVar8 = posZ / 48.0f;
    if (fVar8 < INT_MAX_f) goto LAB_80051e0c;
    fVar8 = fVar8 - INT_MAX_f;
  }
  uVar11 = (int)fVar8 | 0x80000000;
LAB_80051e2c:
  if (uVar10 == uVar11) return false;
  return true;
}

bool MiniMap::CaseBarrows(float param_2){
  minimap_dat_2 *pmVar2;
  bool bVar3;
  minimap_dat_2 *pmVar4;
  
  pmVar4 = minimap_dats_2 + 0x12;
  if (minimap_dats_2[0x12].borg8 != 0) {
    do {
      if (getEventFlag(pmVar4->flag)) {
        if (this->field18_0x44 == (u32)pmVar4->unk0x0) {
          return false;
        }
        this->field18_0x44 = (u32)pmVar4->unk0x0;
        return true;
      }
      pmVar2 = pmVar4 + 1;
      pmVar4 = pmVar4 + 1;
    } while (pmVar2->borg8 != 0);
  }
  bVar3 = true;
  if (this->field18_0x44 == 0) {
    bVar3 = false;
    if ((MapShorts32 == 0x50001) &&
       (bVar3 = true,
       0.0 <= (this->savedPlayerPos.x - 1.3f) * (param_2 - 1.3f))) {
      bVar3 = false;
    }
  }
  else this->field18_0x44 = 0;
  return bVar3;
}

void MiniMap::Update(float posx,float posy,float posz){
  byte bVar1;
  byte bVar2;
  bool bVar4;
  s16 sVar3;
  u8 uVar6;
  BaseWidget *pBVar7;
  int iVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  
  if (this->active == 0) return;
  bVar4 = SpecialSections(posx,posy,posz);
  this->savedPlayerPos.x = posx;
  this->savedPlayerPos.y = posy;
  this->savedPlayerPos.z = posz;
  if (bVar4) UpdateSection(this->mapshorts[0],this->mapshorts[1]);
  fVar9 = this->field19_0x48;
  fVar12 = this->field21_0x50;
  if (fVar9 != fVar12) {
    fVar11 = fVar12 - fVar9;
    if (fVar11 <= 0.0) fVar11 = -fVar11;
    fVar10 = this->field23_0x58;
    if (0.0 < fVar10) {
      if (fVar10 <= fVar11) goto LAB_800520d0;
      this->field19_0x48 = fVar12;
    }
    else if (fVar11 < -fVar10) this->field19_0x48 = fVar12;
    else {
LAB_800520d0:
      this->field19_0x48 = fVar9 + fVar10;
    }
  }
  fVar9 = this->field20_0x4c;
  fVar12 = this->field22_0x54;
  if (fVar9 != fVar12) {
    fVar11 = fVar12 - fVar9;
    if (fVar11 <= 0.0) fVar11 = -fVar11;
    fVar10 = this->field24_0x5c;
    if (0.0 < fVar10) {
      if (fVar10 <= fVar11) goto LAB_8005214c;
      this->field20_0x4c = fVar12;
    }
    else if (fVar11 < -fVar10) this->field20_0x4c = fVar12;
    else {
LAB_8005214c:
      this->field20_0x4c = fVar9 + fVar10;
    }
  }
  fVar9 = this->field32_0x7c;
  if (this->mapX != fVar9) {
    fVar12 = fVar9 - this->mapX;
    if (fVar12 <= 0.0) {
      fVar12 = -fVar12;
    }
    fVar11 = this->field33_0x80;
    if (0.0 < fVar11) {
      if (fVar11 <= fVar12) {
        fVar9 = this->mapX;
        goto LAB_800521c8;
      }
      this->mapX = fVar9;
    }
    else if (fVar12 < -fVar11) {
      this->mapX = fVar9;
    }
    else {
      fVar9 = this->mapX;
LAB_800521c8:
      this->mapX = fVar9 + fVar11;
    }
  }
  fVar9 = this->X90;
  fVar12 = this->field38_0x94;
  if (fVar9 != fVar12) {
    fVar11 = fVar12 - fVar9;
    if (fVar11 <= 0.0) fVar11 = -fVar11;
    fVar10 = (float)this->field39_0x98;
    if (0.0 < fVar10) {
      if (fVar10 <= fVar11) goto LAB_80052248;
      this->X90 = fVar12;
    }
    else if (fVar11 < -fVar10) this->X90 = fVar12;
    else {
LAB_80052248:
      this->X90 = fVar9 + fVar10;
    }
  }
  fVar9 = this->field35_0x88;
  if (this->mapY != fVar9) {
    fVar12 = fVar9 - this->mapY;
    if (fVar12 <= 0.0) fVar12 = -fVar12;
    fVar11 = this->field36_0x8c;
    if (0.0 < fVar11) {
      if (fVar11 <= fVar12) {
        fVar9 = this->mapY;
        goto LAB_800522c4;
      }
      this->mapY = fVar9;
    }
    else if (fVar12 < -fVar11) {
      this->mapY = fVar9;
    }
    else {
      fVar9 = this->mapY;
LAB_800522c4:
      this->mapY = fVar9 + fVar11;
    }
  }
  fVar9 = this->Y9C;
  fVar12 = this->field41_0xa0;
  if (fVar9 != fVar12) {
    fVar11 = fVar12 - fVar9;
    if (fVar11 <= 0.0) {
      fVar11 = -fVar11;
    }
    fVar10 = this->field42_0xa4;
    if (0.0 < fVar10) {
      if (fVar10 <= fVar11) goto LAB_80052344;
      this->Y9C = fVar12;
    }
    else if (fVar11 < -fVar10) this->Y9C = fVar12;
    else {
LAB_80052344:
      this->Y9C = fVar9 + fVar10;
    }
  }
  fVar9 = this->field29_0x70;
  fVar12 = this->mapScale;
  if (fVar12 != fVar9){
   fVar12 = fVar9 - fVar12;
   if (fVar12 <= 0.0) fVar12 = -fVar12;
   fVar11 = this->field30_0x74;
   if (0.0 < fVar11) {
    if (fVar11 <= fVar12) {
      fVar9 = this->mapScale;
      goto LAB_800523c0;
    }
    this->mapScale = fVar9;
   }
   else if (fVar12 < -fVar11) this->mapScale = fVar9;
  else {
LAB_800523c0:
    this->mapScale+= fVar11;
  }
  }
  this->widget24->SetCoords((this->mapX - this->mapScale * 8.0f),(this->mapY - this->mapScale * 8.0f));
  this->widget24->SetWidth((this->X90 - this->mapX) + this->mapScale * 16.0f);
  this->widget24->SetHeight((this->Y9C - this->mapY) + this->mapScale * 16.0f);
  this->widget28->SetCoords(this->mapX,this->mapY);
  this->widget28->SetWidth((this->X90 - this->mapX) + 1.0f);
  this->widget28->SetHeight((this->Y9C - this->mapY) + 1.0f);
  pBVar7 = this->widget1c;
  if (pBVar7) {
    while(pBVar7) {
      (pBVar7->col).A-=10;
      if((pBVar7->col).A<=10)(pBVar7->col).A=0;
      pBVar7 = pBVar7->siblingR;
    }
  }
  pBVar7 = this->widget18;
  while(pBVar7){
    u8 uVar5 = (pBVar7->col).A;
    bVar2 = (pBVar7->col).R;
    if (pBVar7 == this->widget20) {
      if (bVar2 < 0xa6) {
        sVar3 = bVar2 + 10;
        if (uVar5 < 0x91) goto LAB_8005265c;
        iVar8 = 0x9b;
      }
      else {
        sVar3 = bVar2 - 10;
LAB_8005265c:
        iVar8 = (int)sVar3;
      }
      if (uVar5 < 0x10a) {
        sVar3 = (pBVar7->col).A + 10;
        if (0xf4 < uVar5) sVar3 = 0xff;
      }
      else sVar3 = (pBVar7->col).A - 10;
    }
    else {
      if (bVar2 < 0x6b) {
        if (bVar2 < 0x56) {
          iVar8 = (int)((bVar2 + 10) * 0x10000) >> 0x10;
        }
        else iVar8 = 0x60;
      }
      else {
        iVar8 = bVar2 - 10;
      }
      if (uVar5 < 0x8b) {
        sVar3 = (pBVar7->col).A + 10;
        if (0x75 < uVar5) sVar3 = 0x80;
      }
      else sVar3 = (pBVar7->col).A - 10;
    }
    pBVar7->SetColor(iVar8,iVar8,iVar8,sVar3);
    pBVar7 = pBVar7->siblingR;
  }
  pBVar7 = this->widget18;
  while(pBVar7) {
        pBVar7->SetCoords((this->field19_0x48 + (float)this->mapdat[pBVar7->varU8].x),
                   (this->field20_0x4c + (float)this->mapdat[pBVar7->varU8].y));
        pBVar7 = pBVar7->siblingR;
      }
}

Gfx * MiniMap::Render(Gfx *G){
  BaseWidget *w;
  if ((this->active) && (this->widget20)) {
    if (gMinimapUnkVal) gMinimapUnkVal = 0;
    RSPFUNC6(G);
    G = this->widget24->Render(G,FULL_SCREENSPACE);
    for (w = this->widget1c; w != NULL; w = w->siblingR) {
      G = w->Render(G,this->mapX,this->mapY,this->X90,this->Y9C);
    }
    for (w = this->widget18; w != NULL; w = w->siblingR) {
      G = w->Render(G,this->mapX,this->mapY,this->X90,this->Y9C);
    }
    G = this->widget28->Render(G,FULL_SCREENSPACE);
  }
  return G;
}

void MiniMap::UpdateSection(s16 param_2,s16 param_3){
  char cVar1;
  s16 sVar3;
  u16 uVar4;
  int iVar8;
  s32 lVar7;
  BaseWidget *pBVar9;
  Borg8Header *b8;
  BaseWidget *pBVar10;
  u16 uVar11;
  u16 *puVar12;
  MinimapSec_dat *pMVar13;
  int iVar14;
  u16 i;
  float fVar16;
  BaseWidget *apBStack_28 [8];
  //BIG mess of goto's. seriously needs cleanup.
  if (this->active) {
    pMVar13 = this->mapdat;
    this->mapshorts[0] = param_2;
    this->mapshorts[1] = param_3;
    i = 0;
    if (this->mapdat[i].borg8) {
      iVar8 = 0;
LAB_800529b4:
      if (((this->mapdat[i].mapshort1 == param_2) && (this->mapdat[i].mapshort2 == param_3)) || (pMVar13 == minimap_sec_Barrows)) {
        if (ShowingSpecialSection(i)) {
          pMVar13 = this->mapdat;
          sVar3 = this->mapdat[i].flagIndex;
          this->floatX = (float)this->mapdat[i].x;
          this->floatY = (float)this->mapdat[i].y;
          if (this->unk3c == sVar3) {
            if (this->mapdat[i].checked) {
              pBVar9 = this->widget18;
              goto LAB_80052a58;
            }
            if (this->showAllVar) {
              pBVar9 = this->widget18;
              goto LAB_80052a58;
            }
            pBVar10 = WidgetB8(this->mapdat[i].borg8);
            pBVar10->varU8 = i;
            pBVar10->varU16 = this->mapdat[i].borg8;
            pBVar10->SetColor(0x9b,0x9b,0x9b,0);
            pBVar9 = this->widget18;
            this->widget20 = (WidgetBorg8*)pBVar10;
            this->mapdat[i].checked = true;
            if (pBVar9) {
              pBVar10->siblingR = pBVar9;
              this->widget18->siblingL = pBVar10;
            }
            this->widget18 = (WidgetBorg8*)pBVar10;
            goto LAB_80052b2c;
          }
          this->unk3c = sVar3;
          pBVar10 = this->widget1c;
          pBVar9 = apBStack_28[0];
          while (apBStack_28[0] = pBVar10, apBStack_28[0] != NULL) {
            this->widget1c = (WidgetBorg8*)this->widget1c->siblingR;
            FREEQW(apBStack_28);
            pBVar9 = apBStack_28[0];
            pBVar10 = this->widget1c;
          }
          pBVar10 = this->widget18;
          this->widget18 = NULL;
          this->widget1c = (WidgetBorg8*)pBVar10;
          this->mapdat[i].checked = true;
          apBStack_28[0] = pBVar9;
          LoadSections();
          pBVar9 = this->widget18;
          do {
            if (pBVar9 == NULL) {
LAB_80052cac:
              if (!this->B_buttonToggle) {
                uVar11 = this->widget20->GetWidth();
                iVar8 = (u32)this->field45_0xac << 0x10;
                this->field21_0x50 =
                     ((float)((int)this->field43_0xa8 + ((iVar8 >> 0x10) - (iVar8 >> 0x1f) >> 1))
                     - this->floatX) - (float)(uVar11 >> 1 & 0xffff);
                uVar11 = this->widget20->GetHeight();
                iVar8 = (u32)this->field46_0xae << 0x10;
                fVar16 = ((float)((int)this->field44_0xaa +
                                 ((iVar8 >> 0x10) - (iVar8 >> 0x1f) >> 1)) - this->floatY) -
                         (float)(uVar11 >> 1 & 0xffff);
              }
              else {
                fVar16 = (float)(int)this->field44_0xaa;
                this->field21_0x50 = (float)(int)this->field43_0xa8;
              }
              this->field22_0x54 = fVar16;
              this->field19_0x48 = this->field21_0x50;
              this->field20_0x4c = this->field22_0x54;
              goto LAB_80052da0;
            }
            if (pBVar9->varU8 == i) {
              this->widget20 = (WidgetBorg8*)pBVar9;
              goto LAB_80052cac;
            }
            pBVar9 = pBVar9->siblingR;
          } while( true );
        }
      }
      i++;
      pMVar13 = this->mapdat;
      iVar8 = i << 3;
      if (pMVar13[i].borg8 == 0) goto LAB_80052e28;
      goto LAB_800529b4;
    }
LAB_80052e28:
    this->widget20 = NULL;
    this->ShowMinimap = 0;
  }
  return;
LAB_80052a58:
  if (pBVar9 == NULL) {
LAB_80052b30:
    if (!this->B_buttonToggle) {
      uVar11 = this->widget20->GetWidth();
      iVar8 = (u32)this->field45_0xac << 0x10;
      this->field21_0x50 =
           ((float)((int)this->field43_0xa8 + ((iVar8 >> 0x10) - (iVar8 >> 0x1f) >> 1)) -
           this->floatX) - (float)(uVar11 >> 1);
      uVar11 = this->widget20->GetHeight();
      iVar8 = (u32)this->field46_0xae << 0x10;
      this->field22_0x54 =
           ((float)((int)this->field44_0xaa + ((iVar8 >> 0x10) - (iVar8 >> 0x1f) >> 1)) -
           this->floatY) - (float)(uVar11 >> 1);
    }
    else {
      this->field21_0x50 = (float)(int)this->field43_0xa8;
      this->field22_0x54 = (float)(int)this->field44_0xaa;
    }
LAB_80052da0:
    pBVar9 = this->widget20;
    if (pBVar9) pBVar9->SetColor(0x9b,0x9b,0x9b,0);
    this->ShowMinimap = 1;
    this->field23_0x58 = (this->field21_0x50 - this->field19_0x48) / 14.0f;
    this->field24_0x5c = (this->field22_0x54 - this->field20_0x4c) / 14.0f;
    return;
  }
  if (pBVar9->varU8 == i) {
    if ((this->widget20)&&(this->widget20 == pBVar9)) return;
    this->widget20 = pBVar9;
    if (this->showAllVar) this->mapdat[i].checked = 1;
LAB_80052b2c:
    goto LAB_80052b30;
  }
  pBVar9 = pBVar9->siblingR;
  goto LAB_80052a58;
}

bool MiniMap::LoadSections(){
  if (!this->widget18) {
    for(u8 i=0;this->mapdat[i].borg8;i++) {
      if((this->showAllVar)||(this->mapdat[i].checked)){
        if (this->mapdat[i].flagIndex == this->unk3c) {
          WidgetBorg8* pBVar4 = WidgetB8(this->mapdat[i].borg8);
          pBVar4->varU8 = i;
          pBVar4->varU16 = this->mapdat[i].borg8;
          pBVar4->SetColor(0x60,0x60,0x60,0);
          if (this->widget18 == NULL) this->widget18 = pBVar4;
          else {
            pBVar4->siblingR = this->widget18;
            this->widget18->siblingL = pBVar4;
            this->widget18 = pBVar4;
          }
        }
      }
    }
    return true;
  }
  return false;
}

bool MiniMap::FreeLinked(){
  BaseWidget *w;
  
  w = this->widget18;
  while (w) {
    this->widget18 = (WidgetBorg8*)this->widget18->siblingR;
    FREEQW(w);
    w = this->widget18;
  }
  w = this->widget1c;
  while (w) {
    this->widget1c = (WidgetBorg8*)this->widget1c->siblingR;
    FREEQW(w);
    w = this->widget1c;
  }
  this->widget20 = NULL;
  return true;
}

void MiniMap::ToggleShowAll(){
  this->showAllVar^= 1;
  ShowAll();
  if (this->widget20) this->widget20->SetColor(0x9b,0x9b,0x9b,0xff);
}

s32 MiniMap::ShowAll(){
  BaseWidget *pBVar1;
  BaseWidget *pBVar2;
  bool bVar4;
  s32 uVar3;
  s32 uVar5;
  BaseWidget *apBStack_18;
  
  uVar5 = -1;
  if (this->widget20) uVar5 = this->widget20->varU8;
  pBVar1 = this->widget1c;
  pBVar2 = apBStack_18;
  while (apBStack_18 = pBVar1, apBStack_18 != NULL) {
    this->widget1c = (WidgetBorg8*)this->widget1c->siblingR;
    FREEQW(apBStack_18);
    pBVar2 = apBStack_18;
    pBVar1 = this->widget1c;
  }
  pBVar1 = this->widget18;
  this->widget18 = NULL;
  this->widget1c = pBVar1;
  apBStack_18 = pBVar2;
  uVar3 = LoadSections();
  if (-1 < uVar5) {
    for (pBVar2 = this->widget18; pBVar2 != NULL; pBVar2 = pBVar2->siblingR) {
      uVar3 = pBVar2->varU8;
      if (uVar3 == uVar5) {
        this->widget20 = (WidgetBorg8*)pBVar2;
        break;
      }
    }
  }
  return (s32)uVar3;
}

//0=unset,1=set,2=toggle
void MiniMap::Toggle(byte x){
  BaseWidget *pBVar1;
  float fVar3;
  float fVar4;
  char cVar6;
  u16 uVar5;
  int iVar7;
  float fVar8;
  float fVar9;
  switch(x){
    case 0:
    if (this->B_buttonToggle== false) return;
    this->B_buttonToggle = false;
    break;
    case 1:
    if (this->B_buttonToggle == true) return;
    this->B_buttonToggle = true;
    break;
    case 2:
    this->B_buttonToggle^=1;
  }
  if (!this->B_buttonToggle) {
    pBVar1 = this->widget20;
    this->field43_0xa8 = 0xed;
    this->field45_0xac = 0x3c;
    this->field46_0xae = 0x3c;
    this->field44_0xaa = 0xa3;
    this->field29_0x70 = 1.0f;
    if (pBVar1 == NULL) {
      this->field21_0x50 = 237.0f;
      this->field22_0x54 = 163.0f;
    }
    else {
      uVar5 = pBVar1->GetWidth();
      iVar7 = (u32)this->field45_0xac << 0x10;
      this->field21_0x50 =
           ((float)((int)this->field43_0xa8 + ((iVar7 >> 0x10) - (iVar7 >> 0x1f) >> 1)) -
           this->floatX) - (float)(uVar5 >> 1);
      uVar5 = this->widget20->GetHeight();
      iVar7 = (u32)this->field46_0xae << 0x10;
      this->field22_0x54 =
           ((float)((int)this->field44_0xaa + ((iVar7 >> 0x10) - (iVar7 >> 0x1f) >> 1)) -
           this->floatY) - (float)(uVar5 >> 1);
    }
  }
  else {
    this->field43_0xa8 = 0xb1;
    this->field45_0xac = 120;
    this->field46_0xae = 120;
    this->field44_0xaa = 0x34;
    this->field21_0x50 = 177.0f;
    this->field22_0x54 = 52.0f;
    this->field29_0x70 = 2.0f;
  }
  this->field32_0x7c = (float)(int)this->field43_0xa8;
  fVar9 = (float)(int)this->field44_0xaa;
  this->field35_0x88 = (float)(int)this->field44_0xaa;
  fVar8 = (float)((int)this->field44_0xaa + (int)(s16)this->field46_0xae);
  this->field41_0xa0 = fVar8;
  this->field33_0x80 = ((float)(int)this->field43_0xa8 - this->mapX) / 14.0f;
  this->field36_0x8c = ((float)(int)this->field44_0xaa - this->mapY) / 14.0f;
  this->field42_0xa4 = (fVar8 - this->Y9C) / 14.0f;
  this->field30_0x74 = (this->field29_0x70 - this->mapScale) / 14.0f;
  this->field23_0x58 = (this->field21_0x50 - this->field19_0x48) / 14.0f;
  this->field24_0x5c = (this->field22_0x54 - this->field20_0x4c) / 14.0f;
}

bool MiniMap::ShowingSpecialSection(u16 index){
  int iVar2;
  
  if (this->mapdat == minimaps_Gwernia) {
    iVar2 = MapShorts32;
    if (iVar2 == 0x90007) return GwernCourt(index);
    if (iVar2 == 0x10001) return GwernWalls(index);
    if (iVar2 == 0xf0009) return GwernTower(index);
    this->field18_0x44 = 0;
  }
  else if (this->mapdat == MinimapSec_ehud) {
    iVar2 = MapShorts32;
    if (iVar2 == 0xf0005) return EhudO05(index);
    if (iVar2 == 0x3000b) return EhudC11(index);
    if (iVar2 == 0x90009) return EhudI09(index);
    this->field18_0x44 = 0;
  }
  else if (this->mapdat == MinimapSec_dat_ARRAY_800ee508) {
    if (MapShorts32 == 0xb0003) return m80053960(index);
    this->field18_0x44 = 0;
  }
  else if (this->mapdat == minimap_sec_mageschool) {
    if (MapShorts32 == 0x10001) return MageschoolStairs(index);
    this->field18_0x44 = 0;
  }
  else {
    if (this->mapdat == minimap_sec_Barrows) {
      return m800539fc(index);
    }
    this->field18_0x44 = 0;
  }
  return true;
}


bool MiniMap::EhudI09(u16 param_2){
  bool bVar1;
  
  if (this->savedPlayerPos.x < 16.0f) {
    bVar1 = false;
    if (this->mapdat[param_2].borg8 == 0x5a) {
      return true;
    }
  }
  else {
    bVar1 = true;
    if (this->mapdat[param_2].borg8 != 0x5b) {
      bVar1 = false;
    }
  }
  return bVar1;
}


bool MiniMap::EhudC11(u16 param_2){
  s16 sVar1;
  
  if (this->savedPlayerPos.x < 48.0f) {
    sVar1 = 0x82;
    if (this->savedPlayerPos.z < 48.0f) {
      sVar1 = 0x80;
    }
  }
  else {
    sVar1 = 0x83;
    if (this->savedPlayerPos.z < 48.0f) {
      sVar1 = 0x81;
    }
  }
  return this->mapdat[param_2].borg8 == sVar1;
}

//minimap of castle rampart
bool MiniMap::GwernWalls(u16 param_2){
  s16 sVar1;
  
  if (this->savedPlayerPos.x < 35.0f) {
    sVar1 = 0x3829;
    if (this->savedPlayerPos.z < 25.0f) {
      sVar1 = 0x3827;
    }
  }
  else {
    sVar1 = 0x382a;
    if (this->savedPlayerPos.z < 25.0f) {
      sVar1 = 0x3828;
    }
  }
  return this->mapdat[param_2].borg8 == sVar1;
}

//minimap of castle courtyard
bool MiniMap::GwernCourt(u16 index){
  s16 sVar1;
  s16 sVar2;
  bool bVar3;
  MinimapSec_dat *pMVar4;
  u32 uVar5;
  float fVar6;
  
  uVar5 = (u32)index;
  if (this->savedPlayerPos.y < 4.0f) {
    if (26.0f < this->savedPlayerPos.z) {
      pMVar4 = this->mapdat + index;
      sVar1 = *(s16 *)&pMVar4->borg8;
      sVar2 = 0x2a;
    }
    else {
      pMVar4 = (MinimapSec_dat *)(((u32)index * 8 - index) * 2 + (int)this->mapdat);
      sVar1 = *(s16 *)&pMVar4->borg8;
      sVar2 = 0x2b;
    }
    bVar3 = false;
    if ((sVar1 == sVar2) && (bVar3 = false, pMVar4->flagIndex == 8)) {
      return true;
    }
  }
  else if (this->savedPlayerPos.y < 8.0f) {
    bVar3 = false;
    if (this->mapdat[index].borg8 == 0x37) {
      return true;
    }
  }
  else {
    bVar3 = true;
    if (this->mapdat[index].borg8 != 0x38) {
      bVar3 = false;
    }
  }
  return bVar3;
}

//minimap for the tower lobby
bool MiniMap::GwernTower(u16 param_2){
  bool bVar1;
  
  if (this->savedPlayerPos.y < 4.0f) {
    bVar1 = false;
    if (this->mapdat[param_2].borg8 == 0x98) {
      return true;
    }
  }
  else {
    bVar1 = true;
    if (this->mapdat[param_2].borg8 != 0x9d) {
      bVar1 = false;
    }
  }
  return bVar1;
}

//change displayed minimap as you climb the stairs
bool MiniMap::MageschoolStairs(u16 param_2){
  s16 sVar1;
  s16 sVar2;
  float fVar3;
  
  if (this->savedPlayerPos.y < 4.0f) {
    sVar1 = this->mapdat[param_2].borg8;
    sVar2 = 0xa2;
  }
  else {
    if (8.0f <= this->savedPlayerPos.y) {
      if (this->mapdat[param_2].borg8 == 0xaa) {
        return true;
      }
      return false;
    }
    sVar1 = this->mapdat[param_2].borg8;
    sVar2 = 0xa7;
  }
  if (sVar1 != sVar2) return false;
  return true;
}


bool MiniMap::EhudO05(u16 param_2){
  minimap_dat_2 *pmVar1;
  minimap_dat_2 *pmVar3;
  
  if (minimap_dats_2[0].borg8 != 0) {
    pmVar3 = minimap_dats_2;
    do {
      if (getEventFlag(pmVar3->flag)) {
        if (this->mapdat[param_2].borg8 != pmVar3->borg8) {
          return false;
        }
        this->field18_0x44 = *(u32 *)pmVar3;
        return true;
      }
      pmVar1 = pmVar3 + 1;
      pmVar3 = pmVar3 + 1;
    } while (pmVar1->borg8 != 0);
  }
  return false;
}

bool MiniMap::m80053960(u16 param_2){
  minimap_dat_2 *pmVar1;
  minimap_dat_2 *pmVar3;
  
  if (minimap_dats_2[0xc].borg8 != 0) {
    pmVar3 = minimap_dats_2 + 0xc;
    do {
      if (getEventFlag(pmVar3->flag)) {
        if (this->mapdat[param_2].borg8 != pmVar3->borg8) {
          return false;
        }
        this->field18_0x44 = *(u32 *)pmVar3;
        return true;
      }
      pmVar1 = pmVar3 + 1;
      pmVar3 = pmVar3 + 1;
    } while (pmVar1->borg8 != 0);
  }
  return false;
}


bool MiniMap::m800539fc(u16 param_2){
  u16 uVar1;
  bool bVar2;
  s16 sVar3;
  s16 sVar4;
  
  uVar1 = this->mapshorts[0];
  if (uVar1 == 1) {
    if (this->mapshorts[1] == 2) {
      if (getEventFlag(0x10c5)) return this->mapdat[param_2].borg8 == 0xc1;
    }
    else if ((this->mapshorts[1] == 3) && (getEventFlag(0x10c5))) {
      return this->mapdat[param_2].borg8 == 0xc4;
    }
  }
  else if (uVar1 == 2) {
    if (this->mapshorts[1] == 2) {
      if (getEventFlag(0x10c4)) return this->mapdat[param_2].borg8 == 0xc2;
      if (getEventFlag(0x10c6)) return this->mapdat[param_2].borg8 == 0xc3;
    }
    else if ((this->mapshorts[1] == 3) && (getEventFlag(0x10c6)))
      return this->mapdat[param_2].borg8 == 0xc5;
  }
  else {
    if (uVar1 == 5) {
      if (getEventFlag(0x10c3)) {
        sVar4 = this->mapdat[param_2].borg8;
        sVar3 = 0xc9;
      }
      else if (this->mapshorts[1] == 2) {
        sVar4 = this->mapdat[param_2].borg8;
        sVar3 = 200;
      }
      else {
        if (this->mapshorts[1] != 1) {
          return false;
        }
        if (1.3f <= this->savedPlayerPos.x) {
          if (this->mapdat[param_2].borg8 == 199) {
            return true;
          }
          return false;
        }
        sVar4 = this->mapdat[param_2].borg8;
        sVar3 = 0xc6;
      }
      if (sVar4 != sVar3) {
        return false;
      }
      return true;
    }
    if (uVar1 == 7) {
      uVar1 = this->mapshorts[1];
      if (uVar1 == 1) {
        bVar2 = getEventFlag(0x10be);
        if (bVar2) {
          return this->mapdat[param_2].borg8 == 0xcc;
        }
      }
      else if (uVar1 != 2) {
        if (uVar1 == 3) {
          if (getEventFlag(0x10c0)) {
            return this->mapdat[param_2].borg8 == 0xd0;
          }
          if (getEventFlag(0x10c1)) {
            return this->mapdat[param_2].borg8 == 0xd4;
          }
        }
        goto LAB_80053d50;
      }
      bVar2 = getEventFlag(0x10bf);
      if (bVar2) {
        return this->mapdat[param_2].borg8 == 0xcd;
      }
    }
    else if ((MapShorts32 == 0x80003) && (getEventFlag(0x10c2))) {
      return this->mapdat[param_2].borg8 == 0xd3;
    }
  }
LAB_80053d50:
  bVar2 = false;
  if ((this->mapdat[param_2].mapshort1 == this->mapshorts[0]) &&
     (bVar2 = true,
     this->mapdat[param_2].mapshort2 != this->mapshorts[1])) {
    bVar2 = false;
  }
  return bVar2;
}

