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
    #ifdef DEBUGVER
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
  (b5->dat).ParticleDat = (Borg5_particle *)((int)(b5->dat).ParticleDat->unk10 + (int)(b5->dat).ParticleDat);
}
//These need re-decompiled once the header format is understood.
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
        size += (sizeof(LookAt)*3);
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
  if (i != 0) {
    pbVar21->unkStruct = (Borg5Struct2 *)p;
    while( true ) {
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
      guMtxIdent(pbVar21->unkStruct->mtxs);
      guMtxIdent(pbVar21->unkStruct->mtxs + 1);
      if (i == 0) break;
      pbVar21[1].unkStruct = (Borg5Struct2 *)p;
      pbVar21++;
    }
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
        p = (void *)((uintptr_t)p + sizeof(LookAt)*2);
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
  int memOld;
  int iVar7;
  u32 uVar8;
  
  memOld = get_memUsed();
  if ((param_1->dat).borg3P) borg3_free((param_1->dat).borg3P);
  Borg4Header **ppBVar9 = (param_1->dat).borg4p;
  if ((ppBVar9) && (iVar7 = (param_1->dat).borg4Count, iVar7 != 0)) {
    Borg4Header *pBVar2 = *ppBVar9;
    while( true ) {
      iVar7--;
      ppBVar9++;
      Borg4_free(&pBVar2->head);
      if (iVar7 == 0) break;
      pBVar2 = *ppBVar9;
    }
  }
  Borg2Header **ppBVar10 = (param_1->dat).borg2p;
  if (ppBVar10){
    iVar7 = (param_1->dat).borg2Count;
    if (iVar7 != 0) {
      Borg2Header *pBVar5 = *ppBVar10;
      while( true ) {
        iVar7 += -1;
        ppBVar10 = ppBVar10 + 1;
        borg_2_free(pBVar5);
        if (iVar7 == 0) break;
        pBVar5 = *ppBVar10;
      }
    }
  }
  Borg1Header **ppBVar11 = (param_1->dat).borg1p;
  if (ppBVar11){
    uVar8 = (param_1->dat).borg1Count;
    if (uVar8 != 0) {
      Borg1Header *pBVar6 = *ppBVar11;
      while( true ) {
        uVar8--;
        ppBVar11 = ppBVar11 + 1;
        borg1_free(pBVar6);
        if (uVar8 == 0) break;
        pBVar6 = *ppBVar11;
      }
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
void borg6_func_a(Borg6Data *param_1){
  s16 sVar1;
  s16 sVar2;
  u32 uVar3;
  u32 uVar4;
  float *pfVar5;
  Borg6Struct1 *pBVar6;
  Borg6Struct2 *pBVar7;
  int j;
  int i;
  
  i = 0;
  uVar3 = param_1->subCount;
  pBVar6 = (Borg6Struct1 *)((int)&param_1->borg5 + (int)&param_1->sub->borg5);
  param_1->sub = pBVar6;
  if (0 < (int)uVar3) {
    do {
      j = 0;
      i++;
      uVar4 = pBVar6->subCount;
      pBVar7 = (Borg6Struct2 *)((int)&param_1->borg5 + (int)&pBVar6->sub->unk0);
      pBVar6->sub = pBVar7;
      if (0 < (int)uVar4) {
        do {
          j++;
          pfVar5 = (float *)((int)pBVar7->unk4 + (int)param_1);
          pBVar7->unk4 = pfVar5;
          sVar1 = *(s16 *)pfVar5;
          pfVar5[1] = (float)((int)&param_1->borg5 + (int)pfVar5[1]);
          sVar2 = pBVar7->unk0;
          pBVar7 = pBVar7 + 1;
          while (sVar1 != sVar2) {
            sVar1 = *(s16 *)(pfVar5 + 2);
            pfVar5[3] = (float)((int)&param_1->borg5 + (int)pfVar5[3]);
            pfVar5 = pfVar5 + 2;
          }
        } while (j < (int)uVar4);
      }
      pBVar6++;
    } while (i < (int)uVar3);
  }
}

u8 borg6_func_b(Borg6Header *param_1,Borg6Data *param_2){
  u32 uVar1;
  float *pfVar2;
  Borg6Struct1 *pBVar3;
  void *pvVar4;
  Borg6Struct4 *pBVar6;
  int *piVar7;
  u32 *puVar8;
  u32 *puVar9;
  u32 uVar10;
  u32 *puVar11;
  u16 uVar12;
  Borg6Struct2 *pBVar13;
  int iVar14;
  int iVar15;
  int iVar16;
  u32 size;
  u32 uVar17;
  
  size = 0;
  iVar16 = 0;
  uVar1 = param_2->subCount;
  param_1->dat = param_2;
  param_1->flag = 0;
  param_1->unk1c = 1.0;
  pBVar6 = (Borg6Struct4 *)HALLOC(param_2->subCount * sizeof(Borg6Struct4),2064);
  param_1->structDat = pBVar6;
  uVar1 = param_1->dat->subCount;
  pBVar3 = param_1->dat->sub;
  if (0 < (int)uVar1) {
    do {
      uVar10 = pBVar3->subCount;
      pBVar6->sub = pBVar3;
      pBVar6->unk4 = 0;
      pBVar6->unk8 = 0;
      piVar7 = (int *)HALLOC(uVar10 << 4,2081);
      iVar16 += 1;
      pBVar13 = pBVar3->sub;
      pBVar6->unk10 = (void *)pBVar3->unk8;
      uVar10 = pBVar3->subCount;
      pBVar6->unkc = piVar7;
      if (0 < (int)uVar10) {
        do {
          size += 0x10;
          pfVar2 = pBVar13->unk4;
          uVar10 -= 1;
          *piVar7 = (int)pBVar13;
          pBVar13 = pBVar13 + 1;
          *(u16 *)(piVar7 + 3) = 1;
          piVar7[1] = (int)pfVar2;
          piVar7 = piVar7 + 4;
        } while (uVar10 != 0);
      }
      pBVar6 = pBVar6 + 1;
      pBVar3 = pBVar3 + 1;
    } while (iVar16 < (int)uVar1);
  }
  puVar8 = (u32 *)HALLOC(size,0x87d);
  iVar16 = 0;
  uVar1 = param_1->dat->subCount;
  pBVar3 = param_1->dat->sub;
  pBVar6 = param_1->structDat;
  if (0 < (int)uVar1) {
    do {
      iVar15 = 0;
      iVar16 += 1;
      uVar10 = pBVar3->subCount;
      puVar9 = puVar8;
      pvVar4 = pBVar6->unkc;
      pBVar13 = pBVar3->sub;
      if (0 < (int)uVar10) {
        do {
          iVar14 = 4;
          iVar15 += 1;
          pfVar2 = pBVar13->unk4;
          puVar8 = puVar9 + 4;
          *(u32 **)((int)pvVar4 + 8) = puVar9;
          uVar12 = *(u16 *)((int)pfVar2 + 2);
          puVar11 = (u32 *)pfVar2[1];
          do {
            if ((uVar12 & 1) == 0) {
              *puVar9 = 0;
            }
            else {
              uVar17 = *puVar11;
              puVar11 = puVar11 + 1;
              *puVar9 = uVar17;
            }
            uVar12 = (s16)uVar12 >> 1;
            iVar14 += -1;
            puVar9 = puVar9 + 1;
          } while (iVar14 != 0);
          puVar9 = puVar8;
          pvVar4 = (void *)((int)pvVar4 + 0x10);
          pBVar13 = pBVar13 + 1;
        } while (iVar15 < (int)uVar10);
      }
      pBVar3 = pBVar3 + 1;
      pBVar6 = pBVar6 + 1;
    } while (iVar16 < (int)uVar1);
  }
  param_1->link = NULL;
  param_1->link2 = NULL;
  return false;
}

void borg_6_free(Borg6Header *param_1){
  int iVar1 = get_memUsed();
  if (param_1->structDat) {
    HFREE(param_1->structDat->sub->unk8,2263);
    for(u32 i=0;i<param_1->dat->subCount;i++){
      HFREE(param_1->structDat->unkc[i],2269);
    }
    HFREE(param_1->structDat,2272);
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
