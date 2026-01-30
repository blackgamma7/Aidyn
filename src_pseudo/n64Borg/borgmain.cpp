#define FILENAME "./src/n64borg.cpp"

#include "globals.h"
#include "romcopy.h"
#include "decompress.h"

u32 borgFlag;

//borg_funcs_a: first step in initalization
//borg_funcs_b: second step, sometimes appends the header

//treat loaded Borg as unique instance
void setBorgFlag(){borgFlag = true;}
//reuse loaded Borg Data if available
void clearBorgFlag(){borgFlag = false;}
u32 Ofunc_getBorgTotal(){return borgTotal;}

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

u8 decompressBorg(void *param_1,u32 compSize,u8 *borgfile,u32 outSize,u32 compression){
  u8 *compressedDat;
  u32 auStack40[10];
  auStack40[0]= outSize;
  switch(compression){
    case Compress_None:
      ROMCOPYS(borgfile,param_1,compSize,373);
      break;
    case Compress_LZ01x:
      ALLOCS(compressedDat,compSize,383);
      ROMCOPYS(compressedDat,param_1,compSize,387);
      decompress_LZ01(compressedDat,compSize,borgfile,auStack40);
      HFREE(compressedDat,397);
      break;
    case Compress_LZB:
      ALLOCS(compressedDat,compSize,407);
      ROMCOPYS(compressedDat,param_1,compSize,411);
      decompress_LZB(compressedDat,compSize,borgfile,auStack40);
      HFREE(compressedDat,421);
  }
  return true;
}

s16 get_borg_listing_type(s32 param_1){
  BorgListing listing;
  s32 temp [2];
  
  ROMCOPYS(temp,BorgListingPointer,8,446);
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
    ROMCOPYS(itemInfo,(void *)((s32)BorgListingPointer + param_2 * 0x10 + 8),0x10,488);
    sVar1 = itemInfo->Type;
  }
  return sVar1;
}

borgHeader * getLoadedBorg(s32 x){return gBorgpointers[x];}

borgHeader * getBorgItem(s32 index){
  s32 memOld;
  borgHeader *ret;
  u8 *borgfile;
  s32 type;
  u32 size;
  BorgListing listing;
  
  memOld = get_memUsed();
  if ((index >= (s32)borgTotal) || (0 > index)){
    #if DEBUGVER
    char errmsg [96];
    sprintf(errmsg,"item_index_is_out_of_Range(%i/%i)",index,borgTotal - 1);
    #endif
    CRASH("n64Borg.cpp,_GetBorgItem()",errmsg);
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
                       (u8 *)((s32)ret + gBorgHeaderSizes[listing.Type]),listing.uncompressed,
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
                         (u8 *)((s32)ret + gBorgHeaderSizes[listing.Type]),listing.uncompressed,
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

//based on older builds, would originally print out memory used by category of Borg
void FUN_800a2de0(void){
#if 0
  extern void DummiedPrintf(char*,...);
  char abrevs[][4]={
    "GEN","TEX","MDL","CAM","LGT","SCN","ANI","ACT","IMG","CZN","CZM","SMP","DCM","DLG","GMS"};
  DummiedPrintf("============================\n");
  for(u32 i=0;i<15;i++){
    DummiedPrintf("%s: %i, %i\n",abrevs[i],borg_count[i],borg_mem[i]);
  }
  DummiedPrintf("============================\n");
#endif
}

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
  u32 size;
  u8 *puVar5;
  int bitDepth;
  
  header->dat = dat;
  if (!(dat->flag & B1_Procedural)) {
    header->bitmapA = header->bitmapB = dat->bmp;
  }
  else {
    bitDepth = 2;
    if (B1_RGBA16 <= dat->type) {
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
  if (((param_1->dat->flag & B1_Procedural)) && (param_1->dat->type < B1_CI8)) {
    HFREE(param_1->bitmapB,996);
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
  int *piVar3;
  int iVar4;
  

  SetPointer(param_1,dsplists);
  SetPointer(param_1,vertlist);
  SetPointer(param_1,vertlist2);
  SetPointer(param_1,unk0x40);
  Gfx **gg =param_1->dsplists;
  for (iVar4 = param_1->dsplistcount; iVar4 != 0; iVar4--) {
    *gg = (Gfx *)((int)*gg + (int)param_1);
    gg++;
  }
  piVar1 = param_1->unk0x3c;
  piVar3 = (int *)((int)piVar1 + (int)param_1);
  if (piVar1 != NULL) {
    param_1->unk0x3c = piVar3;
    piVar3[1] = (int)&param_1->alpha + piVar3[1];
    iVar4 = *piVar1;
    piVar3 = (int *)((int)&param_1->alpha + piVar1[2]);
    piVar1[2] = (int)piVar3;
    while (iVar4 != 0) {
      iVar4 += -1;
      if (1 < *piVar3) {
        piVar3[1] = (int)&param_1->alpha + piVar3[1];
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
    if (0 < param_1->dat->dsplistcount) { //breakup dlist into 32-instruction chunks.
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
      for(s32 i = 0;param_1->dat->dsplistcount > i;i++) {
        if (param_1->dlist[i]) HFREE(param_1->dlist[i],1157);
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

//"borg4": seems to used for lighting data
void borg4_func_a(void* x){}
u8 borg4_func_b(void* x,void* y){return false;}
void Borg4_free(borgHeader *param_1){
  s32 oldMem = get_memUsed();
  if (param_1->index == -1) HFREE(param_1,1240);
  else {dec_borg_count(param_1->index);}
  borg_mem[4]-= (oldMem - get_memUsed());
  borg_count[4]--;
}
//"borg3": only 5 in the game. Seem to be camera perpective configs.
void borg3_func_a(Borg3Header *param_1){
  param_1->dat.mtx_ = NULL;
  param_1->dat.viewportP = (Vp *)((int)(param_1->dat.viewportP + 8) + (int)param_1);
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
  Borg5Transform *pbVar6;
  int i;
  
  pbVar6 = (b5->dat).transforms;
  if (pbVar6 != NULL) {
    pbVar6 = (Borg5Transform *)((int)&b5 + (int)&pbVar6);
    i = (b5->dat).transformCount;
    (b5->dat).transforms = pbVar6;
    for (; i != 0; i--) {
      pbVar6->links = (Borg5Transform **)((int)(pbVar6->links + 4) + (int)b5);
      pbVar6++;
    }
  }
  if ((b5->dat).unused20) (b5->dat).unused20 = (void *)((int)(b5->dat).unused20 + (int)&b5->dat);
  if ((b5->dat).borg4i) (b5->dat).borg4i = (s32 *)((int)((b5->dat).borg4i + 4) + (int)b5);
  if ((b5->dat).borg2i) (b5->dat).borg2i = (s32 *)((int)((b5->dat).borg2i + 4) + (int)b5);
  if ((b5->dat).borg1i)(b5->dat).borg1i = (s32 *)((int)((b5->dat).borg1i + 4) + (int)b5);
  if (b5->dat.aniTextures)b5->dat.aniTextures = (Borg5AniTexture *)((int)b5->dat.aniTextures + (int)&b5->dat);
  i = (b5->dat).aniTextureCount;
  if (0 < i) {
    Borg5AniTexture* ani = (Borg5AniTexture*)(b5->dat).aniTextures;
    for(;i!=0;i--) {
      ani->p = (void*)((u32)&b5->dat + (u32)ani->p);
      ani++;
    }
  }
  (b5->dat).instructions = (u16 *)((int)((b5->dat).instructions + 8) + (int)b5);
  (b5->dat).ParticleDat = (Borg5_particle **)((uintptr_t)&b5->dat.ParticleDat->emmiSpeed + (int)(b5->dat).ParticleDat);
}

u8 InitBorgScene(Borg5Header *param_1,void* x){
  Color32 *pCVar1;
  Borg2Data *pBVar2;
  int *piVar3;
  bool bVar4;
  void *x;
  Borg4Header *pBVar6;
  Borg2Header *pBVar7;
  Borg1Header *pBVar8;
  LookAt *pLVar9;
  Borg2Struct *paVar10;
  Borg2Header **ppBVar11;
  Vtx_t *puVar12;
  u32 uVar12;
  u32 uVar13;
  Borg5Transform **ppbVar14;
  Vtx_t *pVVar15;
  int j;
  int i;
  Borg2Header **ppBVar18;
  Borg4Header **ppBVar19;
  Borg1Header **ppBVar20;
  Borg5Transform *pbVar21;
  u32 uVar22;
  Vtx_t *pVVar23;
  
  if ((param_1->dat).aniTextureCount) {
    ALLOCS(param_1->aniTextures,(param_1->dat).aniTextureCount*8,1471);
    if (!param_1->aniTextures)
      CRASH("n64borg.cpp, InitBorgScene()","Alloc for animated texture states failed!");
    memset(param_1->aniTextures,0,(param_1->dat).aniTextureCount*8);
  }
  u32 size = 0;//calculate size for needed structs and use in one alloc
  j = 0;
  i = (param_1->dat).transformCount;
  pbVar21 = (param_1->dat).transforms;
  if (0 < i) {
    do {
      size += sizeof(Borg5Struct2);
      j++;
      ppbVar14 = pbVar21->links;
      for (uVar12 = (u32)pbVar21->tier; uVar12 != 0; uVar12--) {
        *ppbVar14 = (param_1->dat).transforms + (int)*ppbVar14;
        ppbVar14++;
      }
      pbVar21++;
    } while (j < i);
  }
  if ((param_1->dat).borg3i == -1) (param_1->dat).borg3P = NULL;
  else {
    size += sizeof(Mtx)*2;
    setBorgFlag();
    (param_1->dat).borg3P = (Borg3Header *)getBorgItem(param_1->dat.borg3i);
  }
  ppBVar19 = (param_1->dat).borg4p;
  if (ppBVar19){
    for (i = (param_1->dat).borg4Count; i != 0; i += -1) {
      size += sizeof(Light)*2;
      setBorgFlag();
      *ppBVar19 = (Borg4Header *)getBorgItem((int)*ppBVar19);
      ppBVar19++;
    }
  }
  ppBVar11 = (param_1->dat).borg2p;
  if (ppBVar11 != NULL) {
    i = (param_1->dat).borg2Count;
    while (i != 0) {
      clearBorgFlag();
      pBVar7 = (Borg2Header *)getBorgItem((int)*ppBVar11);
      pBVar2 = pBVar7->dat;
      piVar3 = pBVar2->unk0x3c;
      *ppBVar11 = pBVar7;
      if (piVar3 != NULL) {
        size += pBVar2->vertcount * sizeof(Vtx);
      }
      bVar4 = false;
      i--;
      paVar10 = pBVar2->unk0x40;
      ppBVar11 = ppBVar11 + 1;
      for (j = pBVar2->dsplistcount; j != 0; j--) {
        if ((paVar10->flags & B2S_0001|B2S_LinText)) bVar4 = true;
        paVar10++;
      }
      if (bVar4) {
        size += (sizeof(LookAt)*3);//3? only 2 used
        pBVar7->lookat[0] = (LookAt *)-1;
        pBVar7->lookat[1] = (LookAt *)-1;
      }
      else {
        pBVar7->lookat[0] = NULL;
        pBVar7->lookat[1] = NULL;
      }
    }
  }
  clearBorgFlag();
  ppBVar20 = (param_1->dat).borg1p;
  if (ppBVar20) {
    for (uVar22 = (param_1->dat).borg1Count; uVar22 != 0; uVar22 -= 1) {
      pBVar8 = (Borg1Header *)getBorgItem((int)*ppBVar20);
      *ppBVar20 = pBVar8;
      ppBVar20 = ppBVar20 + 1;
    }
  }
  void* p = HALLOC(size,1727);
  pbVar21 = (param_1->dat).transforms;
  i = (param_1->dat).transformCount;
  param_1->allocedDat = p;
  while (i != 0) {
    pbVar21->unkStruct = (Borg5Struct2 *)p;
    pbVar21->unkStruct->unk140.x = 0;
    pbVar21->unkStruct->unk140.y = 0;
    pbVar21->unkStruct->unk140.z = 0;
    pbVar21->unkStruct->unk14c.x = 0;
    pbVar21->unkStruct->unk14c.y = 0;
    pbVar21->unkStruct->unk14c.z = 0;
    pbVar21->unkStruct->unk158.x = 0;
    pbVar21->unkStruct->unk158.y = 0;
    pbVar21->unkStruct->unk158.z = 0;
    pbVar21->unkStruct->unk164.x = 0;
    pbVar21->unkStruct->unk164.y = 0;
    pbVar21->unkStruct->unk164.z = 0;
    p = (void *)((uintptr_t)p + sizeof(Borg5Struct2));
    i--;
    guMtxIdent(&pbVar21->unkStruct->mtxs[0]);
    guMtxIdent(&pbVar21->unkStruct->mtxs[1]);
    pbVar21++;
  }
  if (param_1->dat.borg3P){
    param_1->dat.borg3P->dat.mtx_ = (Mtx *)p;
    p = (void *)((uintptr_t)p + sizeof(Mtx)*2);
  }
  ppBVar19 = (param_1->dat).borg4p;
  if (ppBVar19){
    for (i = (param_1->dat).borg4Count; i != 0; i--) {
      pBVar6 = *ppBVar19;
      ppBVar19++;
      pBVar6->dat->l = (Light *)p;
      p = (void *)((uintptr_t)p + sizeof(Light)*2);
    }
  }
  ppBVar11 = (param_1->dat).borg2p;
  if (ppBVar11 != NULL) {
    i = (param_1->dat).borg2Count;
    while (i != 0) {
      pBVar2 = (*ppBVar11)->dat;
      i += -1;
      ppBVar18 = ppBVar11 + 1;
      if (pBVar2->unk0x3c != NULL) { //align 8?
        pVVar23 = (Vtx_t *)((uintptr_t)((uintptr_t)p + 7) & ~7);
        uVar22 = pBVar2->vertcount;
        pVVar15 = &pBVar2->vertlist2->v;
        pBVar2->vertcount = (u32)pVVar23;
        puVar12 = pVVar23;
        for (uVar13 = uVar22; uVar13 != 0; uVar13--) {
          *puVar12 = *pVVar15;
          pVVar15++;
          puVar12++;
        }
        p = pVVar23 + uVar22;
      }
      pBVar7 = *ppBVar11;
      if (pBVar7->lookat[0]){
        pBVar7->lookat[0] = (LookAt *)p;
        p = (void *)((uintptr_t)p + sizeof(LookAt)*2);//second of third skipped?
        pBVar7 = *ppBVar11;
      }
      pLVar9 = pBVar7->lookat[1];
      ppBVar11 = ppBVar18;
      if (pBVar7->lookat[1]) {
        pBVar7->lookat[1] = (LookAt *)p;
        p = (void *)((uintptr_t)p + sizeof(LookAt));
      }
    }
  }
  return false;
}

void borg5_free(Borg5Header *param_1){
  int i,j;
  
  s32 memOld = get_memUsed();
  if ((param_1->dat).borg3P) borg3_free((param_1->dat).borg3P);
  Borg4Header **b4P = (param_1->dat).borg4p;
  if (b4P) {
    i = (param_1->dat).borg4Count;
    while(i!=0){
      Borg4Header *b4 = *b4P;
      i--;
      b4P++;
      Borg4_free(&b4->head);
    }
  }
  Borg2Header **b2P = (param_1->dat).borg2p;
  if (b2P){
    i = (param_1->dat).borg2Count;
    while (i != 0) {
      Borg2Header *b2 = *b2P;
      i--;
      b2P++;
      borg_2_free(b2);
    }
  }
  Borg1Header **b1P = (param_1->dat).borg1p;
  if (b1P){
    j = (param_1->dat).borg1Count;
    while (j != 0) {
      Borg1Header *b1 = *b1P;
      j--;
      b1P++;
      borg1_free(b1);
    }
  }
  if ((param_1->head).index == -1) {
    HFREE(param_1->allocedDat,1931);
    HFREE(param_1,1935);
  }
  else {
    if (get_borg_index_count((param_1->head).index) == 1)
      HFREE(param_1->allocedDat,1941);
    dec_borg_count((param_1->head).index);
  }
  borg_mem[5]-= (memOld - get_memUsed());
  borg_count[5]--;
}

//"borg6": animation/cinematic data
void borg6_func_a(Borg6Data *param_1) {
  u16 uVar1;
  u16 uVar2;
  u32 uVar3;
  u32 uVar4;
  Borg6Struct3 *pBVar5;
  Borg6Struct1 *pBVar6;
  Borg6Struct2 *pBVar7;
  int j;
  int i;
  
  i = 0;
  uVar3 = param_1->struct1Count;
  pBVar6 = (Borg6Struct1 *)((uintptr_t)&param_1->borg5 + (uintptr_t)&param_1->struct1->borgInd);
  param_1->struct1 = pBVar6;
  if (0 < (int)uVar3) {
    do {
      j = 0;
      i++;
      uVar4 = pBVar6->struct2Count;
      pBVar7 = (Borg6Struct2 *)((uintptr_t)&param_1->borg5 + (uintptr_t)&pBVar6->struct2->unk0);
      pBVar6->struct2 = pBVar7;
      if (0 < (int)uVar4) {
        do {
          j++;
          pBVar5 = (Borg6Struct3 *)((uintptr_t)&param_1->borg5 + (uintptr_t)&pBVar7->struct3->unk0);
          pBVar7->struct3 = pBVar5;
          uVar1 = pBVar5->unk0;
          pBVar5->unk4 = (float *)((uintptr_t)pBVar5->unk4 + (uintptr_t)param_1);
          uVar2 = pBVar7->unk0;
          pBVar7++;
          while (uVar1 != uVar2) {
            uVar1 = pBVar5[1].unk0;
            pBVar5[1].unk4 = (float *)((uintptr_t)pBVar5[1].unk4 + (uintptr_t)param_1);
            pBVar5++;
          }
        } while (j < (int)uVar4);
      }
      pBVar6++;
    } while (i < (int)uVar3);
  }
}

u8 borg6_func_b(Borg6Header *head,Borg6Data *dat) {
  u32 uVar1;
  Borg6Struct3 *pBVar2;
  Borg6Struct1 *pBVar3;
  Borg6Struct5 *pSVar4;
  Borg6Struct4 *pBVar5;
  Borg6Struct5 *piVar7;
  float *pfVar5;
  float *paVar6;
  u32 uVar7;
  float *pfVar8;
  u16 uVar9;
  Borg6Struct2 *pBVar10;
  int iVar11;
  int j;
  int i;
  uint size;
  float fVar14;
  
  size = 0;
  i = 0;
  head->dat = dat;
  head->flag = 0;
  head->unk1c = 1.0f;
  pBVar5 = (Borg6Struct4 *)HALLOC(dat->struct1Count * sizeof(Borg6Struct4),2064);
  head->struct4 = pBVar5;
  pBVar3 = head->dat->struct1;
  if (0 < (int)head->dat->struct1Count) {
    do {
      uVar7 = pBVar3->struct2Count;
      pBVar5->struct1 = pBVar3;
      pBVar5->unk4 = 0;
      pBVar5->unk8 = 0;
      piVar7 = (Borg6Struct5 *)HALLOC(uVar7 *sizeof(Borg6Struct5),2081);
      i++;
      pBVar10 = pBVar3->struct2;
      pBVar5->unk10 = (void *)pBVar3->unk8;
      uVar7 = pBVar3->struct2Count;
      pBVar5->struct5 = piVar7;
      if (0 < (int)uVar7) {
        do {
          size+= sizeof(float)*4;
          pBVar2 = pBVar10->struct3;
          uVar7--;
          piVar7->struct2 = pBVar10;
          pBVar10++;
          piVar7->unkc = 1;
          piVar7->struct3 = pBVar2;
          piVar7++;
        } while (uVar7 != 0);
      }
      pBVar5++;
      pBVar3++;
    } while (i < (int)head->dat->struct1Count);
  }
  pfVar5 = (float *)HALLOC(size,2173);
  i = 0;
  pBVar3 = head->dat->struct1;
  pBVar5 = head->struct4;
  if (0 < (int)head->dat->struct1Count) {
    do {
      j = 0;
      i++;
      uVar7 = pBVar3->struct2Count;
      paVar6 = pfVar5;
      pSVar4 = pBVar5->struct5;
      pBVar10 = pBVar3->struct2;
      if (0 < (int)uVar7) {
        do {
          iVar11 = 4;
          j++;
          pBVar2 = pBVar10->struct3;
          pfVar5 = paVar6 + 1;
          pSVar4->unk8 = paVar6;
          uVar9 = pBVar2->unk2;
          pfVar8 = pBVar2->unk4;
          do {
            if ((uVar9 & 1) == 0) *paVar6 = 0.0;
            else {
              *paVar6 = *pfVar8;
              pfVar8++;
            }
            uVar9>>=1;
            iVar11--;
            paVar6++;
          } while (iVar11 != 0);
          paVar6 = pfVar5;
          pSVar4++;
          pBVar10++;
        } while (j < (int)uVar7);
      }
      pBVar3++;
      pBVar5++;
    } while (i < (int)head->dat->struct1Count);
  }
  head->link = NULL;
  head->link2 = NULL;
  return false;
}

void borg_6_free(Borg6Header *param_1){
  int iVar1 = get_memUsed();
  if (param_1->struct4) {
    HFREE(param_1->struct4->struct1->unk8,2263);
    for(u32 i=0;i<param_1->dat->struct1Count;i++){
      //???
      HFREE((void*)((uintptr_t)&param_1->struct4->struct5+(i*sizeof(Borg6Struct4))),2269);
    }
    HFREE(param_1->struct4,2272);
  }
  if (param_1->head.index == -1) HFREE(param_1->dat,2277);
  else dec_borg_count(param_1->head.index);
  HFREE(param_1,2284);
  borg_mem[6]-= (iVar1 - get_memUsed());
  borg_count[6]--;
}

//"borg7": actor data. also need more comprehension

void borg7_func_a(Borg7Header *param_1){
  Borg7Data *pBVar1 = &param_1->dat;
  if (0 < (param_1->dat).subCount) {
    Borg7Struct1* sub= &pBVar1->sub[0];
    for(s32 iVar2 = (param_1->dat).subCount;iVar2 != 0;iVar2--) {
      sub->p =(Borg7Struct2*)((u32)sub->p + (u32)&param_1->dat);
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
    Borg7Struct1 *pBVar4 = (param_1->dat).sub;
    for(;iVar5!=0;iVar5--,psVar2++) {
      psVar2->sub = pBVar4;
      pBVar4++;
      psVar2->b6 = NULL;
      psVar2++;
    }
  }
  CLEAR(&param_1->aniChache);
  clearBorgFlag();
  Borg6Header *pBVar3 = (Borg6Header *)getBorgItem((param_1->dat).sub[0].borg6);
  bVar1 = (param_1->dat).sub[0].borg6;
  psVar2 = param_1->unk18;
  (param_1->aniChache).anis[0] = pBVar3;
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
  (param_1->aniChache).indecies[0] = bVar1;
  param_1->unk1c = psVar2 + iVar5;
  return true;
}
void borg7_free(Borg7Header *param_1){
  for(s32 i=2;i>-1;i++) {
    if (param_1->aniChache.anis[i]) borg_6_free(param_1->aniChache.anis[i]);
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
