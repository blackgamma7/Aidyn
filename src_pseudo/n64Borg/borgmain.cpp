#define FILENAME "./src/n64borg.cpp"

#include "globals.h"
#include "romcopy.h"
#include "decompress.h"

u32 borgFlag;
//borg_funcs_a: first step in initalization
//borg_funcs_b: second step, sometimes appends the header


void setBorgFlag(void){borgFlag = 1;}
void clearBorgFlag(void){borgFlag = 0;}
u32 Ofunc_getBorgTotal(void){return borgTotal;}

void SetBorgListing(void *listing,void *files){
  u32 fileCount ;
  
  BorgListingPointer = listing;
  borgFilesPointer = files;
  ROMCOPYS(&fileCount,listing,8,252);
  borgTotal = fileCount;
  ALLOCS(gBorgpointers,fileCount *sizeof(void*),266);
  memset(gBorgpointers,0,fileCount * sizeof(void*));
  ALLOCS(gBorgBytes,fileCount,269);
  memset(gBorgBytes,0,fileCount);
  CLEAR(borg_mem);
  CLEAR(borg_count);
}

u8 decompressBorg(void *param_1,u32 compSize,u8 *borgfile,u32 param_4,u32 compression){
  u8 *pvVar1;
  u32 auStack40 [10];
  
  auStack40[0] = param_4;
  if (compression == 1) {
    ALLOCS(pvVar1,compSize,0x17f);
    ROMCOPYS(pvVar1,param_1,compSize,0x183);
    decompress_LZ01(pvVar1,compSize,borgfile,auStack40);
    HFREE(pvVar1,0x18d);
  }
  else if (compression == 0) {
    ROMCOPYS(borgfile,param_1,compSize,0x175);
  }
  else if (compression == 2) {
    ALLOCS(pvVar1,compSize,0x197);
    ROMCOPYS(pvVar1,param_1,compSize,0x19b);
    decompress_LZB(pvVar1,compSize,borgfile,auStack40);
    HFREE(pvVar1,0x1a5);
  }
  return true;
}

s16 get_borg_listing_type(s32 param_1){
  BorgListing listing;
  s32 temp [2];
  
  ROMCOPYS(temp,BorgListingPointer,8,0x1be);
  if ((param_1 < 0) || (temp[0] <= param_1)) {
    listing.Type = -1;
  }
  else {
    ROMCOPYS(&listing,(void *)((s32)BorgListingPointer + param_1 * 0x10 + 8),0x10,0x1c6);
  }
  return listing.Type;
}

s16 GetBorgItemInfo(BorgListing *itemInfo,s32 param_2){ //orphaned, low priority
  s16 sVar1;
  s32 aiStack88 [2];
  
  if (((u32)itemInfo & 7)) {
    CRASH("n64Borg.cpp,_GetBorgItemInfo()","itemInfo_is_not_8_bytes_aligned!");
  }
  ROMCOPYS(aiStack88,BorgListingPointer,8,476);
  if ((param_2 < 0) || (aiStack88[0] <= param_2)) {
    sVar1 = -1;
  }
  else {
    ROMCOPYS(itemInfo,(void *)((s32)BorgListingPointer + param_2 * 0x10 + 8),0x10,0x1e8);
    sVar1 = itemInfo->Type;
  }
  return sVar1;
}

borgHeader * get_gBorgpointers(s32 x){return gBorgpointers[x];}


borgHeader * getBorgItem(s32 index){
  s32 memOld;
  borgHeader *ret;
  u8 *borgfile;
  s32 type;
  u32 size;
  BorgListing listing;
  
  memOld = get_memUsed();
  if ((index >= (s32)borgTotal) || (0 > index)){
    #ifdef DEBUGVER
    char errmsg [96];
    sprintf(errmsg,"item_index_is_out_of_Range(%i/%i)",index,borgTotal - 1);
    CRASH("n64Borg.cpp,_GetBorgItem()",errmsg);
    #else
    CRASH("","");
    #endif
  }
  else{
    ROMCOPYS(&listing,(void *)((s32)BorgListingPointer + index * sizeof(BorgListing) + 8),sizeof(BorgListing),541);
    if ((((listing.Type < 3) || (listing.Type == 6)) || (listing.Type == 11)) || (((listing.Type == 12 || (listing.Type == 13)) || (listing.Type == 14)))) {
      if (borgFlag == 0) {
        ALLOCS(ret,gBorgHeaderSizes[listing.Type] + sizeof(void*),561);
        if (gBorgBytes[index] == 0) {
          ALLOCS(borgfile,listing.uncompressed,566);
          decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                         borgfile,listing.uncompressed,(s32)listing.Compression);
          (*borg_funcs_a[listing.Type])(borgfile);
          gBorgpointers[index] = borgfile;
          gBorgBytes[index] = 1;
        }
        else {
          borgfile = gBorgpointers[index];
          gBorgBytes[index]++;
        }
        ret->index = index;
        ret->unk = 0;
      }
      else {
        ALLOCS(ret,gBorgHeaderSizes[listing.Type] + sizeof(void*),600);
        ALLOCS(borgfile,listing.uncompressed,602);
        decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,borgfile,
                       listing.uncompressed,(s32)listing.Compression);
        (*borg_funcs_a[listing.Type])(borgfile);
        gBorgpointers[index] = NULL;
        gBorgBytes[index] = 0;
        ret->index = -1;
        ret->unk = 0;
      }
      (*borg_funcs_b[listing.Type])(ret,borgfile);
    }
    else {
      if (borgFlag){
        size = gBorgHeaderSizes[type] + listing.uncompressed;
        ALLOCS(ret,size,627);
        bzero(ret,size);
        decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                       (void *)((s32)ret + gBorgHeaderSizes[listing.Type]),listing.uncompressed,
                       (s32)listing.Compression);
        (*borg_funcs_a[listing.Type])(ret);
        (*borg_funcs_b[listing.Type])(ret,0);
        gBorgpointers[index] = NULL;
        gBorgBytes[index] = 0;
        ret->index = -1;
        ret->unk = 0;
      } 
      else {
        if (!gBorgBytes[index]) {
          size = gBorgHeaderSizes[type] + listing.uncompressed;
          ALLOCS(ret,size,653);
          bzero(ret,size);
          decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                         (void *)((s32)ret + gBorgHeaderSizes[listing.Type]),listing.uncompressed,
                         (s32)listing.Compression);
          (*borg_funcs_a[listing.Type])(ret);
          (*borg_funcs_b[listing.Type])(ret,0);
          gBorgpointers[index] = ret;
          gBorgBytes[index] = 1;
          ret->index = index;
          ret->unk = 0;
        }
        else {
          ret = gBorgpointers[index];
          gBorgBytes[index]++;
        }
      }
    }
    borg_mem[listing.Type]+= (get_memUsed() - memOld);
    borg_count[listing.Type]++;
    return ret;
  }
}

void FUN_800a2de0(void){}
u8 get_borg_index_count(s32 param_1){return gBorgBytes[param_1];}

void dec_borg_count(s32 index){
  if(gBorgBytes[index]>0){
    gBorgBytes[index]--;
    if(!gBorgBytes[index])FREEL(gBorgpointers[index],761);
  }
}

//"Borg0" is an unused type. Unknown what it was supposed to do.
void borg0_func_a(void**a){ a[0] =(void*)((u32)a[0]+ (u32)a);}
u8 borg0_func_b(void**a,void* b){ a[2] = b; return false;}
void Ofunc_borg0_free(void**param_1){
  s32 memOld = get_memUsed();
  if ((s32)param_1[0] == -1) HFREE(param_1[2],834);
  else dec_borg_count((s32)param_1[0]);
  HFREE(param_1,841);
  borg_mem[0] -= (memOld - get_memUsed());
  borg_count[0]--;
}

void * Ofunc_getborg(s32 param_1){
  clearBorgFlag();
  return **(void ***)((s32)getBorgItem(param_1) + 8);}

//"borg1" is textures.
void borg1_func_a(Borg1Data *param_1){
  CheckSetPointer(param_1,dList);
  CheckSetPointer(param_1,bmp);
  CheckSetPointer(param_1,pallette);
}

u8 InitBorgTexture(Borg1Header *header,Borg1Data *dat){
  u16 uVar1;
  Borg1Data *pBVar2;
  uint size;
  u8 *puVar5;
  int bitDepth;
  
  header->dat = dat;
  if (!(dat->flag & 0x100)) {
    puVar5 = dat->bmp;
    header->bitmapB = puVar5;
    header->bitmapA = puVar5;
  }
  else {
    bitDepth = 2;
    if (B1_IA16 < dat->type) {
      if (dat->type == B1_RGBA32) bitDepth=4;
      else CRASH("n64Borg.cpp,_InitBorgTexture()",
          "Procedural flag on a texture type other than 32B_RGBA,16B_RGBA/IA!");
    }
    pBVar2 = header->dat;
    size = bitDepth * pBVar2->Width * pBVar2->Height;
    header->bitmapA = pBVar2->bmp;
    ALLOCS(puVar5,size,943);
    header->bitmapB = puVar5;
    memcpy(puVar5,header->dat->bmp,size);
    header->dat->bmp = header->bitmapA8;
    gBorgpointers[header->head.index] = NULL;
    gBorgBytes[header->head.index] = 0;
    header->head.index = -1;
    header->head.unk = 0;
  }
  return false;
}

void borg1_free(Borg1Header *param_1){
  int iVar1 = get_memUsed();
  if (((param_1->dat->flag & 0x100)) && (param_1->dat->type < B1_CI8)) {
    HFREE(param_1->bitmapB,0x3e4);
  }
  if (param_1->head.index == -1) HFREE(param_1->dat,1001);
  else dec_borg_count(param_1->head.index);
  HFREE(param_1,1008);
  borg_mem[1] -= (iVar1 - get_memUsed());
  borg_count[1]--;
}
/*"borg2": 
"vertices and display lists; for whatever stupid reason they only used tri1 cmds"
-Zoinkity*/
void borg2_func_a(Borg2Data *param_1){
  int *piVar1;
  Gfx **ppGVar2;
  int *piVar3;
  int iVar4;
  
  ppGVar2 = (Gfx **)((int)param_1->dsplists + (int)param_1);
  param_1->dsplists = ppGVar2;
  SetPointer(param_1,vertlist);
  SetPointer(param_1,vertlist2);
  SetPointer(param_1,unk0x40);
  for (iVar4 = param_1->dsplistcount; iVar4 != 0; iVar4--) {
    *ppGVar2 = (Gfx *)((int)*ppGVar2 + (int)param_1);
    ppGVar2++;
  }
  piVar1 = param_1->unk0x3c;
  piVar3 = (int *)((int)piVar1 + (int)param_1);
  if (piVar1 != NULL) {
    param_1->unk0x3c = piVar3;
    piVar3[1] = (int)&param_1->unk0x0 + piVar3[1];
    iVar4 = *piVar1;
    piVar3 = (int *)((int)&param_1->unk0x0 + piVar1[2]);
    piVar1[2] = (int)piVar3;
    while (iVar4 != 0) {
      iVar4 += -1;
      if (1 < *piVar3) {
        piVar3[1] = (int)&param_1->unk0x0 + piVar3[1];
      }
      piVar3 = piVar3 + 2;
    }
  }
}

u8 borg2_func_b(Borg2Header *param_1,Borg2Data *param_2){
  param_1->lookat[0] = NULL;
  param_1->lookat[1] = NULL;
  param_1->dat = param_2;
  if (!param_2->dsplistcount) {
    param_1->dlistSet = NULL;
    param_1->dlist = NULL;
  }
  else {
    ALLOCS(param_1->dlistSet,param_2->dsplistcount,1111);
    ALLOCS(param_1->dlist,param_1->dat->dsplistcount*sizeof(Gfx*),1112);
    if (0 < param_1->dat->dsplistcount) {
      for(s32 i = 0;i < param_1->dat->dsplistcount;i++){
        param_1->dlist[i] = (Gfx *)HALLOC((0x20*sizeof(Gfx)),1118);
        param_1->dlistSet[i]=1;
      }
    }
  }
  guMtxIdentF(&param_1->someMtx);
  return false;
}

void borg_2_free(Borg2Header *param_1){
  int iVar1 = get_memUsed();
  if (param_1->dlist) {
    if (0 < param_1->dat->dsplistcount) {
      for(s32 iVar3 = 0;param_1->dat->dsplistcount > iVar3;iVar3++) {
        if (param_1->dlist[iVar3]) HFREE(param_1->dlist[iVar3],1157);
      }
    }
    HFREE(param_1->dlist,1161);
  }
  if (param_1->dlistSet) HFREE(param_1->dlistSet,1166);
  if (param_1->head.index == -1) HFREE(param_1->dat,1171);
  else {
    get_borg_index_count(param_1->head.index);
    dec_borg_count(param_1->head.index);
  }
  HFREE(param_1,1184);
  borg_mem[2] -= (iVar1 - get_memUsed());
  borg_count[2]--;
}

//"borg4": 3 floats, 8 more bytes. no clue what they're for
void borg4_func_a(void* x){}
u8 borg4_func_b(void* x,void* y){return false;}
void Borg4_free(s32 *param_1){
  s32 iVar1 = get_memUsed();
  if (*param_1 == -1) HFREE(param_1,1240);
  else {dec_borg_count(*param_1);}
  borg_mem[4]-= (iVar1 - get_memUsed());
  borg_count[4]--;
}
//"borg3": only 5 in the game. Seem to be camera perpective configs.
void borg3_func_a(Borg3Header *param_1){
  param_1->dat.mtx_ = NULL;
  param_1->dat.unk18 = (s16 *)((int)(param_1->dat.unk18 + 8) + (int)param_1);
}
u8 borg3_func_b(void* x, void* y){return false;}

void borg3_free(Borg3Header *param_1){
  int iVar1 = get_memUsed();
  if (param_1->head.index == -1) HFREE(param_1,1312);
  else dec_borg_count(param_1->head.index);
  borg_mem[3]-= (iVar1 - get_memUsed());
  borg_count[3]--;
}
//"borg5": probably model data. DEFINITELY needs more info
void borg5_func_a(Borg5Header *b5){
  u32 *puVar1;
  u16 *puVar4;
  borg5substruct *pbVar6;
  void *pvVar7;
  int iVar8;
  
  pbVar6 = (b5->dat).someSubstruct;
  if (pbVar6 != NULL) {
    pbVar6 = (borg5substruct *)((int)&b5->head.index + (int)&(pbVar6->rot).x);
    iVar8 = (b5->dat).substructCount;
    (b5->dat).someSubstruct = pbVar6;
    for (; iVar8 != 0; iVar8--) {
      pbVar6->links = (borg5substruct **)((int)(pbVar6->links + 4) + (int)b5);
      pbVar6++;
    }
  }
  if ((b5->dat).unused20) (b5->dat).unused20 = (void *)((int)(b5->dat).unused20 + (int)&b5->dat);
  if ((b5->dat).borg4i) (b5->dat).borg4i = (u32 *)((int)((b5->dat).borg4i + 4) + (int)b5);
  if ((b5->dat).borg2i) (b5->dat).borg2i = (Borg2Header **)((int)((b5->dat).borg2i + 4) + (int)b5);
  if ((b5->dat).borg1i)(b5->dat).borg1i = (Borg1Header **)((int)(ppBVar3 + 4) + (int)b5);
  pvVar7 = (b5->dat).aniTextures;
  if (pvVar7 != NULL) {
    (b5->dat).aniTextures = (void *)((int)pvVar7 + (int)&b5->dat);
  }
  iVar8 = (b5->dat).aniTextureCount;
  if (0 < iVar8) {
    pvVar7 = (b5->dat).aniTextures;
    for(;iVar8;iVar8--) {
      *(int *)((int)pvVar7 + 0x10) = (int)&(b5->dat).substructCount + *(int *)((int)pvVar7 + 0x10);
      pvVar7 = (void *)((int)pvVar7 + 0x18);
    } while (iVar8 != 0);
  }
  (b5->dat).borg1lookup = (u16 *)((int)((b5->dat).borg1lookup + 8) + (int)b5);
  (b5->dat).ParticleDat = (Borg5_particle *)((int)(b5->dat).ParticleDat->unk10 + (int)(b5->dat).ParticleDat);
}
//These need re-decompiled once the header format is understood.
u8 InitBorgScene(Borg5Header *param_1,void* x){
  Color32 *pCVar1;
  Borg2Data *pbVar2;
  int *piVar3;
  u8 bVar4;
  void *pvVar5;
  Borg3Header *pBVar6;
  Borg2Header *pbVar7;
  Borg1Header *pBVar8;
  Mtx *pMVar9;
  LookAt *pLVar10;
  astruct_3 *paVar11;
  u32 *puVar12;
  uint size;
  Borg2Header **ppbVar13;
  Vtx_t *puVar13;
  uint uVar14;
  u32 uVar15;
  borg5substruct **ppbVar16;
  Vtx_t *pVVar17;
  int iVar18;
  int iVar19;
  Borg2Header **ppbVar20;
  void **ppvVar21;
  Borg1Header **ppBVar22;
  borg5substruct *pbVar23;
  u32 uVar24;
  Vtx_t *pVVar25;
  
  iVar19 = (param_1->dat).aniTextureCount;
  if (iVar19) {
    pvVar5 = HALLOC(iVar19 << 3,1471);
    param_1->aniTextures = pvVar5;
    if (pvVar5) memset(pvVar5,0,(param_1->dat).aniTextureCount << 3);
    else CRASH("n64borg.cpp,_InitBorgScene()","Alloc for animated texture states failed!");
  }
  size = 0;
  iVar18 = 0;
  iVar19 = (param_1->dat).substructCount;
  pbVar23 = (param_1->dat).someSubstruct;
  if (0 < iVar19) {
    do {
      size += 0x188;
      iVar18 += 1;
      ppbVar16 = pbVar23->links;
      for (uVar14 = (uint)pbVar23->tier; uVar14 != 0; uVar14 -= 1) {
        *ppbVar16 = (param_1->dat).someSubstruct + (int)*ppbVar16;
        ppbVar16 = ppbVar16 + 1;
      }
      pbVar23 = pbVar23 + 1;
    } while (iVar18 < iVar19);
  }
  if ((param_1->dat).borg3i == -1) (param_1->dat).borg3P = NULL;
  else {
    size += 0x80;
    setBorgFlag();
    (param_1->dat).borg3P = (Borg3Header *)getBorgItem((param_1->dat).borg3i);
  }
  ppvVar21 = (void **)(param_1->dat).borg4i;
  if (ppvVar21 == NULL){
    for (iVar19 = (param_1->dat).borg4Count; iVar19 != 0; iVar19 += -1) {
      size += 0x20;
      setBorgFlag();
      pvVar5 = getBorgItem((int)*ppvVar21);
      *ppvVar21 = pvVar5;
      ppvVar21 = ppvVar21 + 1;
    }
  }
  if ((param_1->dat).borg2p) {
    iVar19 = (param_1->dat).borg2Count;
    while (iVar19 != 0) {
      clearBorgFlag();
      pbVar7 = (Borg2Header *)getBorgItem((int)*ppbVar13);
      pbVar2 = pbVar7->dat;
      piVar3 = pbVar2->unk0x3c;
      *ppbVar13 = pbVar7;
      if (piVar3) size += pbVar2->vertcount * 0x10;
      bVar4 = false;
      iVar19 += -1;
      paVar11 = pbVar2->unk0x40;
      ppbVar13 = ppbVar13 + 1;
      for (iVar18 = pbVar2->dsplistcount; iVar18 != 0; iVar18 += -1) {
        uVar14._0_2_ = paVar11->field0_0x0;
        uVar14._2_2_ = paVar11->field1_0x2;
        if ((uVar14 & 3)) {bVar4 = true;}
        paVar11++;
      }
      if (bVar4) {
        size += 0x60;
        pbVar7->lookat[0] = (LookAt *)-1;
        pbVar7->lookat[1] = (LookAt *)-1;
      }
      else {
        pbVar7->lookat[0] = NULL;
        pbVar7->lookat[1] = NULL;
      }
    }
  }
  clearBorgFlag();
  ppBVar22 = (param_1->dat).borg1i;
  if (ppBVar22) {
    for (uVar24 = (param_1->dat).borg1Count; uVar24 != 0; uVar24 -= 1) {
      pBVar8 = (Borg1Header *)getBorgItem((int)*ppBVar22);
      *ppBVar22 = pBVar8;
      ppBVar22++;
    }
  }
  pMVar9 = (Mtx *)HALLOC(size,0x6bf);
  pbVar23 = (param_1->dat).someSubstruct;
  iVar19 = (param_1->dat).substructCount;
  param_1->unk8 = pMVar9;
  if (iVar19 != 0) {
    pbVar23->mtxs = pMVar9;
    while( true ) {
      pMVar9[5].m[0][0] = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x144) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x148) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x14c) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x150) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x154) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x158) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x15c) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x160) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x164) = 0;
      *(undefined4 *)((int)pbVar23->mtxs + 0x168) = 0;
      pMVar9 = (Mtx *)((int)pMVar9 + 0x188);
      *(undefined4 *)((int)pbVar23->mtxs + 0x16c) = 0;
      iVar19 += -1;
      guMtxIdent(pbVar23->mtxs);
      guMtxIdent(pbVar23->mtxs + 1);
      if (iVar19 == 0) break;
      pbVar23[1].mtxs = pMVar9;
      pbVar23 = pbVar23 + 1;
    }
  }
  pBVar6 = (param_1->dat).borg3;
  if (pBVar6 == NULL) {
    puVar12 = (param_1->dat).borg4i;
  }
  else {
    pBVar6->mtx_ = pMVar9;
    pMVar9 = pMVar9 + 2;
    puVar12 = (param_1->dat).borg4i;
  }
  if (puVar12 == NULL) {
    ppbVar13 = (param_1->dat).borg2i;
  }
  else {
    for (iVar19 = (param_1->dat).borg4Count; iVar19 != 0; iVar19 += -1) {
      uVar24 = *puVar12;
      puVar12 = puVar12 + 1;
      *(Mtx **)(uVar24 + 0x18) = pMVar9;
      pMVar9 = (Mtx *)(pMVar9->m + 2);
    }
    ppbVar13 = (param_1->dat).borg2i;
  }
  if (ppbVar13 != NULL) {
    iVar19 = (param_1->dat).borg2Count;
    while (iVar19 != 0) {
      pbVar2 = (*ppbVar13)->dat;
      iVar19 += -1;
      ppbVar20 = ppbVar13 + 1;
      if (pbVar2->unk0x3c != NULL) {
        pVVar25 = (Vtx_t *)((uint)((int)pMVar9->m[0] + 7) & 0xfffffff8);
        uVar24 = pbVar2->vertcount;
        pVVar17 = pbVar2->vertlist2;
        pbVar2->vertcount = (u32)pVVar25;
        puVar13 = pVVar25;
        for (uVar15 = uVar24; uVar15 != 0; uVar15 -= 1) {
          *(undefined4 *)puVar13->ob = *(undefined4 *)pVVar17->ob;
          *(undefined4 *)(puVar13->ob + 2) = *(undefined4 *)(pVVar17->ob + 2);
          *(undefined4 *)puVar13->tc = *(undefined4 *)pVVar17->tc;
          pCVar1 = &pVVar17->cn;
          pVVar17 = pVVar17 + 1;
          puVar13->cn = *pCVar1;
          puVar13 = puVar13 + 1;
        }
        pMVar9 = (Mtx *)(pVVar25 + uVar24);
      }
      pbVar7 = *ppbVar13;
      if (pbVar7->lookat[0] == NULL) {
        pLVar10 = pbVar7->lookat[1];
      }
      else {
        pbVar7->lookat[0] = (LookAt *)pMVar9;
        pMVar9 = pMVar9 + 1;
        pbVar7 = *ppbVar13;
        pLVar10 = pbVar7->lookat[1];
      }
      ppbVar13 = ppbVar20;
      if (pLVar10 != NULL) {
        pbVar7->lookat[1] = (LookAt *)pMVar9;
        pMVar9 = (Mtx *)(pMVar9->m + 2);
      }
    }
  }
  return false;
}


void borg5_free(Borg5Header *param_1){
  int iVar2;
  u8 uVar3;
  Borg2Header *pbVar4;
  Borg1Header *pBVar5;
  int iVar6;
  u32 uVar7;
  u32 *puVar8;
  Borg2Header **ppbVar9;
  Borg1Header **ppBVar10;
  
  iVar2 = get_memUsed();
  if ((param_1->dat).borg3P) borg3_free((param_1->dat).borg3P);
  puVar8 = (param_1->dat).borg4i;
  if ((puVar8 != NULL) && (iVar6 = (param_1->dat).borg4Count, iVar6 != 0)) {
    uVar7 = *puVar8;
    while( true ) {
      iVar6 += -1;
      puVar8 = puVar8 + 1;
      Borg4_free(uVar7);
      if (iVar6 == 0) break;
      uVar7 = *puVar8;
    }
  }
  ppbVar9 = (param_1->dat).borg2i;
  if (ppbVar9) {
    iVar6 = (param_1->dat).borg2Count;
    if (iVar6 != 0) {
      pbVar4 = *ppbVar9;
      while( true ) {
        iVar6 += -1;
        ppbVar9 = ppbVar9 + 1;
        borg_2_free(pbVar4);
        if (iVar6 == 0) break;
        pbVar4 = *ppbVar9;
      }
    }
  }
  ppBVar10 = (param_1->dat).borg1p;
  if (ppBVar10){
    uVar7 = (param_1->dat).borg1Count;
    if (uVar7 != 0) {
      pBVar5 = *ppBVar10;
      while( true ) {
        uVar7 -= 1;
        ppBVar10 = ppBVar10 + 1;
        borg1_free(pBVar5);
        if (uVar7 == 0) break;
        pBVar5 = *ppBVar10;
      }
    }
  }
  if (param_1->head.index == -1) {
    HFREE(param_1->unk8,0x78b);
    HFREE(param_1,0x78f);
  }
  else {
    if (get_borg_index_count(param_1->head.index) == 1) HFREE(param_1->unk8,0x795);
    dec_borg_count(param_1->head.index);
  }
  borg_mem[5]-= (iVar2 - get_memUsed());
  borg_count[5]--;
}
//"borg6": animation/cinematic data
void borg6_func_a(Borg6Header *param_1){
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  void *pvVar5;
  short *psVar6;
  short *psVar7;
  int iVar8;
  int iVar9;
  
  iVar9 = 0;
  iVar3 = param_1->unk4;
  pvVar5 = (void *)((int)param_1->unk8 + (int)param_1);
  param_1->unk8 = pvVar5;
  if (0 < iVar3) {
    do {
      iVar8 = 0;
      iVar9 += 1;
      iVar4 = *(int *)((int)pvVar5 + 0x10);
      psVar7 = (short *)((int)&param_1->field0_0x0 + *(int *)((int)pvVar5 + 0x14));
      *(short **)((int)pvVar5 + 0x14) = psVar7;
      if (0 < iVar4) {
        do {
          iVar8 += 1;
          psVar6 = (short *)((int)&param_1->field0_0x0 + *(int *)(psVar7 + 2));
          *(short **)(psVar7 + 2) = psVar6;
          sVar1 = *psVar6;
          *(int *)(psVar6 + 2) = (int)&param_1->field0_0x0 + *(int *)(psVar6 + 2);
          sVar2 = *psVar7;
          psVar7 = psVar7 + 8;
          while (sVar1 != sVar2) {
            sVar1 = psVar6[4];
            *(int *)(psVar6 + 6) = (int)&param_1->field0_0x0 + *(int *)(psVar6 + 6);
            psVar6 = psVar6 + 4;
          }
        } while (iVar8 < iVar4);
      }
      pvVar5 = (void *)((int)pvVar5 + 0x18);
    } while (iVar9 < iVar3);
  }
  return;
}



u8      borg6_func_b(Borg6Header *param_1,Borg6Data *param_2)

{
  int iVar1;
  u32 uVar2;
  int iVar3;
  int iVar4;
  Borg5Header *pBVar5;
  int iVar6;
  float fVar7;
  SceneData *pAVar8;
  SceneDatSubstruct *pAVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  int iVar12;
  undefined4 *puVar13;
  ushort uVar14;
  void *pvVar15;
  int iVar16;
  int iVar17;
  int iVar18;
  uint size;
  undefined4 uVar19;
  
  fVar7 = ConstFloats::1.0f;
  size = 0;
  iVar18 = 0;
  iVar1 = param_2->unk4;
  param_1->dat = param_2;
  param_1->flag2 = 0;
  param_1->unk1c = fVar7;
  pAVar8 = (SceneData *)HeapAlloc(iVar1 * 0x18,s_./src/n64borg.cpp_800e3120,0x810);
  param_1->sceneDat = pAVar8;
  iVar1 = param_1->dat->unk4;
  pBVar5 = (Borg5Header *)param_1->dat->unk8;
  if (0 < iVar1) {
    do {
      iVar12 = (pBVar5->dat).substructCount;
      pAVar8->scene[0].borg5 = pBVar5;
      pAVar8->scene[0].borg6 = NULL;
      pAVar8->scene[0].link = NULL;
      pAVar9 = (SceneDatSubstruct *)HeapAlloc(iVar12 << 4,s_./src/n64borg.cpp_800e3120,0x821);
      iVar18 += 1;
      pvVar15 = (void *)(pBVar5->dat).borg4Count;
      pAVar8->scene[0].unk10 = pBVar5->unk8;
      iVar12 = (pBVar5->dat).substructCount;
      pAVar8->scene[0].sub = pAVar9;
      if (0 < iVar12) {
        do {
          size += 0x10;
          uVar2 = *(u32 *)((int)pvVar15 + 4);
          iVar12 += -1;
          pAVar9->unk0 = pvVar15;
          pvVar15 = (void *)((int)pvVar15 + 0x10);
          pAVar9->unkc = 1;
          pAVar9->unk4 = uVar2;
          pAVar9 = pAVar9 + 1;
        } while (iVar12 != 0);
      }
      pAVar8 = (SceneData *)(pAVar8->scene + 1);
      pBVar5 = (Borg5Header *)&(pBVar5->dat).borg2Count;
    } while (iVar18 < iVar1);
  }
  puVar10 = (undefined4 *)HeapAlloc(size,s_./src/n64borg.cpp_800e3120,0x87d);
  iVar12 = 0;
  iVar1 = param_1->dat->unk4;
  iVar18 = param_1->dat->unk8;
  pAVar8 = param_1->sceneDat;
  if (0 < iVar1) {
    do {
      iVar17 = 0;
      iVar12 += 1;
      iVar3 = *(int *)(iVar18 + 0x10);
      puVar11 = puVar10;
      pAVar9 = pAVar8->scene[0].sub;
      iVar6 = *(int *)(iVar18 + 0x14);
      if (0 < iVar3) {
        do {
          iVar16 = 4;
          iVar17 += 1;
          iVar4 = *(int *)(iVar6 + 4);
          puVar10 = puVar11 + 4;
          pAVar9->unk8 = puVar11;
          uVar14 = *(ushort *)(iVar4 + 2);
          puVar13 = *(undefined4 **)(iVar4 + 4);
          do {
            if ((uVar14 & 1) == 0) {
              *puVar11 = 0;
            }
            else {
              uVar19 = *puVar13;
              puVar13 = puVar13 + 1;
              *puVar11 = uVar19;
            }
            uVar14 = (short)uVar14 >> 1;
            iVar16 += -1;
            puVar11 = puVar11 + 1;
          } while (iVar16 != 0);
          puVar11 = puVar10;
          pAVar9 = pAVar9 + 1;
          iVar6 = iVar6 + 0x10;
        } while (iVar17 < iVar3);
      }
      iVar18 = iVar18 + 0x18;
      pAVar8 = (SceneData *)(pAVar8->scene + 1);
    } while (iVar12 < iVar1);
  }
  param_1->link = NULL;
  param_1->flag = 0;
  return false;
}
void borg_6_free(Borg6Header *param_1){
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = get_memUsed();
  if (param_1->sceneDat != NULL) {
    HeapFree((void *)(param_1->sceneDat->scene[0].sub)->field2_0x8,s_./src/n64borg.cpp_800e3120,0x8d7)
    ;
    iVar2 = 0;
    if (0 < *(int *)((int)param_1->field8_0x20 + 4)) {
      iVar3 = 0;
      do {
        HeapFree(*(void **)((int)&param_1->sceneDat->scene[0].sub + iVar3),
                 s_./src/n64borg.cpp_800e3120,0x8dd);
        iVar2 += 1;
        iVar3 += 0x18;
      } while (iVar2 < *(int *)((int)param_1->field8_0x20 + 4));
    }
    HeapFree(param_1->sceneDat,s_./src/n64borg.cpp_800e3120,0x8e0);
  }
  if (param_1->field0_0x0 == -1) HFREE(param_1->field8_0x20,0x8e5);
  else dec_borg_count(param_1->field0_0x0);
  HFREE(param_1,0x8ec);
  iVar2 = get_memUsed();
  borg_mem[6]-= (iVar1 - get_memUsed());
  borg_count[6]--;
  return;
}

//"borg7": actor data. also need more comprehension

void borg7_func_a(Borg7Header *param_1){
  Borg7Data *pBVar1 = &param_1->dat;
  if (0 < (param_1->dat).subCount) {
    Borg7Sub* sub= &pBVar1->sub[0];
    for(s32 iVar2 = (param_1->dat).subCount;iVar2 != 0;iVar2--) {
      sub->p =(b7SubSub*)((u32)sub->p + (u32)&param_1->dat);
      sub++;
    }
  }
}


u8 borg7_func_b(Borg7Header *param_1,Borg7Data *param_2){
  u32 bVar1;
  struct_1 *psVar2;
  Borg6Header *pBVar3;
  int iVar5 = (param_1->dat).subCount;
  ALLOCS(psVar2,iVar5 *sizeof(struct_1),2350);
  param_1->unk18 = psVar2;
  if (0 < iVar5) {
    Borg7Sub *pBVar4 = (param_1->dat).sub;
    for(;iVar5!=0;iVar5--,psVar2++) {
      psVar2->sub = pBVar4;
      pBVar4++;
      psVar2->b6 = NULL;
      psVar2++;
    }
  }
  CLEAR(&param_1->unk38);
  clearBorgFlag();
  Borg6Header *pBVar3 = (Borg6Header *)getBorgItem((param_1->dat).sub[0].borg6);
  bVar1 = (param_1->dat).sub[0].borg6;
  psVar2 = param_1->unk18;
  (param_1->unk38).anis[0] = pBVar3;
  param_1->sceneDat = NULL;
  param_1->currentAni = 0;
  param_1->prevAni = 0;
  param_1->nextAni = 0;
  psVar2->b6 = pBVar3;
  (param_1->unk20).x = 0.0;
  (param_1->unk20).y = 0.0;
  (param_1->unk20).z = 0.0;
  (param_1->unk2c).x = 0.0;
  (param_1->unk2c).y = 0.0;
  (param_1->unk2c).z = 0.0;
  iVar5 = (param_1->dat).unk8;
  param_1->unk12 = 1;
  (param_1->unk38).indecies[0] = bVar1;
  param_1->unk1c = psVar2 + iVar5;
  return true;
}
void borg7_free(Borg7Header *param_1){
  for(s32 i=2;i>-1;i++) {
    if (param_1->unk38.anis[i]) borg_6_free(param_1->unk38.anis[i]);
  }
  s32 memOld = get_memUsed();
  if (param_1->head.index == -1) {
    HFREE(param_1->unk18,2422);
    HFREE(param_1,2424);
  }
  else {
    if (get_borg_index_count(param_1->head.index) == 1) HFREE(param_1->unk18,0x97e);
    dec_borg_count(param_1->head.index);
  }
  borg_mem[7] -= (memOld - get_memUsed());
  borg_count[7]--;
}

void set_AnimCache(u8 x){animChache = x;}
