#ifdef DEBUGVER
#define FILENAME "./src/n64borg.cpp"
#else
#define FILENAME ""
#endif

u32 BorgFlag;
//borg_funcs_a: first step in initalization
//borg_funcs_b: second step, sometimes appends the header
s32 borg_padding[15]= {8,16,88,16,8,16,32,80,8,8,8,8,8,16,8};
u8 animChache=3;
u32 borg_mem[15];
u32 borg_count[15];
void** borg_index_x4;
u8* borg_index_x1;
void* BorgListingPointer;
void* BorgFilesPointer;
u32 BorgTotal;

void setBorgFlag(void){borgFlag = 1;}
void clearBorgFlag(void){borgFlag = 0;}
u32 Ofunc_getBorgTotal(void){return borgTotal;}

void set_borg_mem_things(void *listing,void *files){
  u32 fileCount [2];
  
  BorgListingPointer = listing;
  borgFilesPointer = files;
  RomCopy::RomCopy(fileCount,listing,8,1,FILENAME,0xfc);
  borgTotal = fileCount[0];
  borg_index_x4 = (void **)heapAlloc(fileCount[0] << 2,FILENAME,0x10a);
  memset(borg_index_x4,0,fileCount[0] << 2);
  borg_index_x1 = (u8 *)heapAlloc(fileCount[0],FILENAME,0x10d);
  memset(borg_index_x1,0,fileCount[0]);
  memset(borg_mem,0,sizeof(borg_mem));
  memset(borg_count,0,sizeof(borg_count));
}

bool decompressBorg(void *param_1,u32 compSize,void *borgfile,u32 param_4,u32 compression){
  void *pvVar1;
  u32 auStack40 [10];
  
  auStack40[0] = param_4;
  if (compression == 1) {
    pvVar1 = heapAlloc(compSize,FILENAME,0x17f);
    RomCopy::RomCopy(pvVar1,param_1,compSize,1,FILENAME,0x183);
    decompress_LZ01(pvVar1,compSize,borgfile,auStack40);
    HeapFree(pvVar1,FILENAME,0x18d);
  }
  else if (compression == 0) {
    RomCopy::RomCopy(borgfile,param_1,compSize,1,FILENAME,0x175);
  }
  else if (compression == 2) {
    pvVar1 = heapAlloc(compSize,FILENAME,0x197);
    RomCopy::RomCopy(pvVar1,param_1,compSize,1,FILENAME,0x19b);
    decompress_LZB(pvVar1,compSize,borgfile,auStack40);
    HeapFree(pvVar1,FILENAME,0x1a5);
  }
  return true;
}

s16 get_borg_listing_type(s32 param_1){
  BorgListing listing;
  s32 temp [2];
  
  RomCopy::RomCopy(temp,BorgListingPointer,8,1,FILENAME,0x1be);
  if ((param_1 < 0) || (temp[0] <= param_1)) {
    listing.Type = -1;
  }
  else {
    RomCopy::RomCopy(&listing,(void *)((s32)BorgListingPointer + param_1 * 0x10 + 8),0x10,1,FILENAME,0x1c6);
  }
  return listing.Type;
}

s16 GetBorgItemInfo(BorgListing *itemInfo,s32 param_2){ //orphaned, low priority
  s16 sVar1;
  s32 aiStack88 [2];
  
  if (((u32)itemInfo & 7) != 0) {
    CRASH("n64Borg.cpp,_GetBorgItemInfo()","itemInfo_is_not_8_bytes_aligned!");
  }
  RomCopy::RomCopy(aiStack88,BorgListingPointer,8,1,FILENAME,0x1dc);
  if ((param_2 < 0) || (aiStack88[0] <= param_2)) {
    sVar1 = -1;
  }
  else {
    RomCopy::RomCopy(itemInfo,(void *)((s32)BorgListingPointer + param_2 * 0x10 + 8),0x10,1,
            FILENAME,0x1e8);
    sVar1 = itemInfo->Type;
  }
  return sVar1;
}

void * get_borg_index_x4(s32 x){return borg_index_x4[x];}


void * getBorgItem(s32 index){
  s32 memOld;
  void *ret;
  void *borgfile;
  s32 MemNew;
  u8 *puVar1;
  u32 uVar2;
  BorgListing listing;
  char errmsg [96];
  
  memOld = get_memUsed();
  if ((index < (s32)borgTotal) && (-1 < index)) {
    RomCopy::RomCopy(&listing,(void *)((s32)BorgListingPointer + index * 0x10 + 8),0x10,1,FILENAME,0x21d);
    if ((((listing.Type < 3) || (listing.Type == 6)) || (listing.Type == 11)) || (((listing.Type == 12 || (listing.Type == 13)) || (listing.Type == 14)))) {
      if (borgFlag == 0) {
        ret = heapAlloc(borg_padding[listing.Type] + 4,FILENAME,0x231);
        puVar1 = borg_index_x1 + index;
        if (*puVar1 == 0) {
          borgfile = heapAlloc(listing.uncompressed,FILENAME,0x236);
          decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                         borgfile,listing.uncompressed,(s32)listing.Compression);
          (*borg_funcs_a[listing.Type])(borgfile);
          puVar1 = borg_index_x1 + index;
          borg_index_x4[index] = borgfile;
          *puVar1 = 1;
        }
        else {
          borgfile = borg_index_x4[index];
          *puVar1++;
        }
        *(s32 *)ret = index;
        *(s32 *)((s32)ret + 4) = 0;
      }
      else {
        ret = heapAlloc(borg_padding[listing.Type] + 4,FILENAME,600);
        borgfile = heapAlloc(listing.uncompressed,FILENAME,0x25a);
        decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,borgfile,
                       listing.uncompressed,(s32)listing.Compression);
        (*borg_funcs_a[listing.Type])(borgfile);
        puVar1 = borg_index_x1 + index;
        borg_index_x4[index] = NULL;
        *puVar1 = 0;
        *(s32 *)ret = -1;
        *(s32 *)((s32)ret + 4) = 0;
      }
      (*borg_funcs_b[listing.Type])(ret,borgfile);
    }
    else {
      if (borgFlag == 0) {
        puVar1 = borg_index_x1 + index;
        if (*puVar1 == 0) {
          uVar2 = borg_padding[MemNew] + listing.uncompressed;
          ret = heapAlloc(uVar2,FILENAME,0x28d);
          _bzero(ret,uVar2);
          decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                         (void *)((s32)ret + borg_padding[listing.Type]),listing.uncompressed,
                         (s32)listing.Compression);
          (*borg_funcs_a[listing.Type])(ret);
          (*borg_funcs_b[listing.Type])(ret,0);
          puVar1 = borg_index_x1 + index;
          borg_index_x4[index] = ret;
          *puVar1 = 1;
          *(s32 *)ret = index;
          *(s32 *)((s32)ret + 4) = 0;
        }
        else {
          ret = borg_index_x4[index];
          *puVar1 = *puVar1 + 1;
        }
      }
      else {
        uVar2 = borg_padding[MemNew] + listing.uncompressed;
        ret = heapAlloc(uVar2,FILENAME,0x273);
        _bzero(ret,uVar2);
        decompressBorg((void *)((s32)borgFilesPointer + listing.Offset),listing.compressed,
                       (void *)((s32)ret + borg_padding[listing.Type]),listing.uncompressed,
                       (s32)listing.Compression);
        (*borg_funcs_a[listing.Type])(ret);
        (*borg_funcs_b[listing.Type])(ret,0);
        puVar1 = borg_index_x1 + index;
        borg_index_x4[index] = NULL;
        *puVar1 = 0;
        *(s32 *)ret = -1;
        *(s32 *)((s32)ret + 4) = 0;
      }
    }
    MemNew = get_memUsed();
    borg_mem[listing.Type] = borg_mem[listing.Type] + (MemNew - memOld);
    borg_count[listing.Type] = borg_count[listing.Type] + 1;
    return ret;
  }
  //likely check order is reversed: this appears higher in ASM.
  sprintf(errmsg,"item_index_is_out_of_range_(%i/%i)",index,borgTotal - 1);
  CRASH("n64Borg.cpp,_GetBorgItem()",errmsg);
}

void FUN_800a2de0(void){}
u8 get_borg_index_count(s32 param_1){return borg_index_x1[param_1];}

void dec_borg_count(s32 index){
  u8 *puVar1;
  
  puVar1 = borg_index_x1 + index;
  if ((0 < *puVar1) && (*puVar1--, borg_index_x1[index] == 0)) {
    HeapFree(borg_index_x4[index],FILENAME,0x2f9);
    borg_index_x4[index] = NULL;
  }
}

//"Borg0" is an unused type. Unknown what it was supposed to do.
void borg0_func_a(s32 *a){ *a += (s32)a;}
bool borg0_func_b(s32 *a,s32 b){ a[2] = b; return false;}
void Ofunc_borg0_free(s32 *param_1){
  s32 memOld;
  
  memOld = get_memUsed();
  if (*param_1 == -1) {HeapFree((void *)param_1[2],FILENAME,0x342);}
  else {dec_borg_count(*param_1);}
  HeapFree(param_1,FILENAME,0x349);
  borg_mem[0] -= (memOld - get_memUsed());
  borg_count[0]--;
  return;}
void * Ofunc_getborg(s32 param_1){
  void *pvVar1;
  
  clearBorgFlag();
  pvVar1 = getBorgItem(param_1);
  return **(void ***)((s32)pvVar1 + 8);}

//"borg1" is one of 2 image formats. format needs more understanding
void borg1_func_a(Borg_1_Header *arg0){
  if (arg0->unk0x8 != 0) {
    arg0->unk0x8 = (s32)&arg0->unk0x0 + arg0->unk0x8;
  }
  if (arg0->unk0xc) {
    arg0->unk0xc = (void *)((s32)arg0->unk0xc + (s32)arg0);
  }
  if (arg0->unk0x10 != (u16 *)0x0) {
    arg0->unk0x10 = (u16 *)((s32)arg0->unk0x10 + (s32)arg0);
  }
}
bool InitBorgTexture(Borg_1_Header *param_1,void *param_2){
  u16 uVar1;
  u16 *puVar2;
  u32 size;
  void **ppvVar3;
  u8 *puVar4;
  void *pvVar5;
  s32 iVar6;
  
  uVar1 = *(u16 *)((s32)param_2 + 2);
  param_1->unk0x10 = (u16 *)param_2;
  if ((uVar1 & 0x100) == 0) {
    pvVar5 = *(void **)((s32)param_2 + 0xc);
    param_1->unk0xc = pvVar5;
    param_1->unk0x8 = (s32)pvVar5;
  }
  else {
    iVar6 = 2;
    if (1 < *param_2) {
      if (*param_2 != 8) {
        CRASH("n64Borg.cpp,_InitBorgTexture()",
        "Procedural flag on a texture type other than 32B_RGBA,16B_RGBA/IA!");
      }
      iVar6 = 4;
    }
    puVar2 = param_1->unk0x10;
    size = iVar6 * (u32)*(u8 *)(puVar2 + 2) * (u32)*(u8 *)((s32)puVar2 + 5);
    param_1->unk0x8 = *(s32 *)(puVar2 + 6);
    pvVar5 = heapAlloc(size,FILENAME,0x3af);
    param_1->unk0xc = pvVar5;
    memcpy(pvVar5,*(void **)(param_1->unk0x10 + 6),size);
    ppvVar3 = borg_index_x4;
    iVar6 = param_1->unk0x0;
    *(s32 *)(param_1->unk0x10 + 6) = param_1->unk0x8;
    puVar4 = borg_index_x1;
    ppvVar3[iVar6] = NULL;
    puVar4[iVar6] = 0;
    param_1->unk0x0 = -1;
    param_1->unk0x4 = 0;
  }
  return false;
}
void borg1_free(Borg_1_Header *param_1){
  s32 iVar1;
  
  iVar1 = get_memUsed();
  if (((param_1->unk0x10[1] & 0x100) != 0) && (*param_1->unk0x10 < 2)) {

    HeapFree(param_1->unk0xc,FILENAME,0x3e4);}
  if (param_1->unk0x0 == -1) {HeapFree(param_1->unk0x10,FILENAME,0x3f0);}
  else {dec_borg_count(param_1->unk0x0);}
  HeapFree(param_1,FILENAME,0x3f0);
  borg_mem[1]-= (iVar1 - get_memUsed());
  borg_count[1]--;
}
/*"borg2": 
"vertices and display lists; for whatever stupid reason they only used tri1 cmds"
-Zoinkity*/
void borg2_func_a(borg_2_header *param_1){
  s32 *piVar1;
  s32 *piVar2;
  s32 iVar3;
  
  iVar3 = param_1->unk0x4;
  piVar1 = (s32 *)((s32)param_1->unk0x2c + (s32)param_1);
  param_1->unk0x2c = piVar1;
  param_1->unk0x30 = &param_1->unk0x0 + param_1->unk0x30;
  param_1->unk0x34 = &param_1->unk0x0 + param_1->unk0x34;
  param_1->unk0x40 = &param_1->unk0x0 + param_1->unk0x40;
  while (iVar3 != 0) {
    iVar3 = iVar3 + -1;
    *piVar1 = &param_1->unk0x0 + *piVar1;
    piVar1++;
  }
  piVar1 = param_1->unk0x3c;
  piVar2 = (s32 *)((s32)piVar1 + (s32)param_1);
  if (piVar1) {
    param_1->unk0x3c = piVar2;
    piVar2[1] = &param_1->unk0x0 + piVar2[1];
    iVar3 = *piVar1;
    piVar2 = (s32 *)(&param_1->unk0x0 + piVar1[2]);
    piVar1[2] = (s32)piVar2;
    while (iVar3 != 0) {
      iVar3 = iVar3 + -1;
      if (1 < *piVar2) {
        piVar2[1] = &param_1->unk0x0 + piVar2[1];
      }
      piVar2 = piVar2 + 2;
    }
  }
  return;
}

bool borg2_func_b(borg_2_header *param_1,void *param_2){
  u32 size;
  s32 iVar1;
  void *pvVar2;
  void *pvVar3;
  s32 iVar4;
  
  size = *(u32 *)((s32)param_2 + 4);
  param_1->unk0x8 = 0;
  param_1->unk0xc = 0;
  param_1->unk0x58 = (s32)param_2;
  if (size == 0) {
    param_1->unk0x54 = NULL;
    param_1->unk0x50 = NULL;
  }
  else {
    pvVar2 = heapAlloc(size,FILENAME,0x457);
    iVar1 = *(s32 *)(param_1->unk0x58 + 4);
    iVar4 = 0;
    param_1->unk0x54 = pvVar2;
    pvVar2 = heapAlloc(iVar1 << 2,FILENAME,0x458);
    param_1->unk0x50 = pvVar2;
    if (0 < *(s32 *)(param_1->unk0x58 + 4)) {
      do {
        pvVar3 = heapAlloc(0x100,FILENAME,0x45e);
        pvVar2 = param_1->unk0x54;
        *(void **)(iVar4 * 4 + (s32)param_1->unk0x50) = pvVar3;
        *(undefined *)((s32)pvVar2 + iVar4) = 1;
        iVar4 = iVar4 + 1;
      } while (iVar4 < *(s32 *)(param_1->unk0x58 + 4));
    }
  }
  guMtxIdentF((float (*) [4] [4])&param_1->unk0x10);
  return false;
}

void borg_2_free(borg_2_header *param_1){
  s32 iVar1;
  void *pvVar2;
  s32 iVar3;
  
  iVar1 = get_memUsed();
  if (param_1->unk0x50) {
    iVar3 = 0;
    if (0 < *(s32 *)(param_1->unk0x58 + 4)) {
      pvVar2 = param_1->unk0x50;
      while( true ) {
        pvVar2 = *(void **)(iVar3 * 4 + (s32)pvVar2);
        if (pvVar2) {
          HeapFree(pvVar2,FILENAME);
        }
        iVar3 = iVar3 + 1;
        if (*(s32 *)(param_1->unk0x58 + 4) <= iVar3) break;
        pvVar2 = param_1->unk0x50;
      }
    }
    HeapFree(param_1->unk0x50,FILENAME);
  }
  if (param_1->unk0x54) {
    HeapFree(param_1->unk0x54,FILENAME);
  }
  if (*(s32 *)param_1 == -1) {
    HeapFree((void *)param_1->unk0x58,FILENAME);
  }
  else {
    get_borg_index_count(*(s32 *)param_1);
    dec_borg_count(*(s32 *)param_1);
  }
  HeapFree(param_1,FILENAME);
  borg_mem[2]-= (iVar1 - get_memUsed());
  borg_count[2]--;
  return;
}
//"borg4": 3 floats, 8 more bytes. no clue what they're for
void borg4_func_a(void){}
bool borg4_func_b(void){return false;}
void Borg4_free(s32 *param_1){
  s32 iVar1;
  
  iVar1 = get_memUsed();
  if (*param_1 == -1) {HeapFree(param_1,FILENAME);}
  else {dec_borg_count(*param_1);}
  borg_mem[4]-= (iVar1 - get_memUsed());
  borg_count[4]--;
  return;
}
//"borg3": only 5 in the game. Seem to be camera perpective configs.
void borg3_func_a(Borg_3 *param_1){
  param_1->unk0x2c = 0;
  param_1->unk0x28 = (s32)&param_1->unk0x10 + param_1->unk0x28;
  return;}
bool borg3_func_b(void){return false;}
void borg3_free(Borg_3 *param_1){
  s32 iVar1 = get_memUsed();
  if (param_1->index == -1) {HeapFree(param_1,FILENAME,0x520);}
  else {
    dec_borg_count(param_1->index);
  }
  borg_mem[3] -= (iVar1 - get_memUsed(););
  borg_count[3]--;
  return;
}
//"borg5": probably model data. DEFINITELY needs more info
void borg5_func_a(Borg_5_header *b5){
  undefined *puVar1;
  s32 iVar2;
  
  if (b5->unk0x28) {
    puVar1 = b5->unk0x28 + 0x10 + (s32)b5;
    iVar2 = b5->unk0x10;
    b5->unk0x28 = puVar1;
    while (iVar2 != 0) {
      iVar2 = iVar2 + -1;
      *(s32 *)(puVar1 + 4) = (s32)b5->unk0x18 + *(s32 *)(puVar1 + 4) + -8;
      puVar1 = puVar1 + 0x40;
    }
  }
  if (b5->unk0x30) {
    b5->unk0x30 = b5->unk0x30 + 0x10 + (s32)b5;
  }
  if (b5->unk0x38) {
    b5->unk0x38 = b5->unk0x38 + 0x10 + (s32)b5;
  }
  if (b5->locatorDat) {
    b5->locatorDat = b5->locatorDat + 0x10 + (s32)b5;
  }
  if (b5->unk0x40) {
    b5->unk0x40 = b5->unk0x40 + 0x10 + (s32)b5;
  }
  if (b5->unk0x44) {
    b5->unk0x44 = b5->unk0x44 + 0x10 + (s32)b5;
  }
  iVar2 = b5->ani_texture_count;
  if (0 < iVar2) {
    puVar1 = b5->unk0x44;
    do {
      iVar2 = iVar2 + -1;
      *(s32 *)(puVar1 + 0x10) = (s32)b5->unk0x18 + *(s32 *)(puVar1 + 0x10) + -8;
      puVar1 = puVar1 + 0x18;
    } while (iVar2 != 0);
  }
  b5->unk0x4 = 0;
  b5->unk0x48 = b5->unk0x48 + 0x10 + (s32)b5;
  b5->unk0x4c = b5->unk0x4c + 0x10 + (s32)b5;
  return;
}
//These need re-decompiled once the header format is understood.
bool InitBorgScene(Borg_5_header *param_1){
  s32 *puVar1;
  bool bVar2;
  undefined *puVar3;
  void *pvVar4;
  s32 *puVar5;
  u32 *puVar6;
  u32 size;
  s32 *puVar7;
  u32 uVar8;
  s32 iVar9;
  s32 *piVar10;
  s32 *puVar11;
  s32 iVar12;
  float fVar13;
  s32 *piVar14;
  void **ppvVar15;
  
  if (param_1->ani_texture_count != 0) {
    puVar3 = (undefined *)heapAlloc(param_1->ani_texture_count << 3,FILENAME,0x5bf);
    param_1->unk0xc = puVar3;
    if (puVar3 == (undefined *)0x0) {CRASH("n64borg.cpp,_InitBorgScene()","Alloc for animated texture states failed!");}
    memset(puVar3,0,param_1->ani_texture_count << 3);
  }
  size = 0;
  iVar12 = 0;
  iVar9 = param_1->unk0x10;
  puVar3 = param_1->unk0x28;
  if (0 < iVar9) {
    do {
      size = size + 0x188;
      iVar12 = iVar12 + 1;
      uVar8 = (u32)(u8)puVar3[3];
      piVar10 = *(s32 **)(puVar3 + 4);
      while (uVar8 != 0) {
        uVar8 = uVar8 - 1;
        *piVar10 = (s32)(param_1->unk0x28 + *piVar10 * 0x40);
        piVar10 = piVar10 + 1;
      }
      puVar3 = puVar3 + 0x40;
    } while (iVar12 < iVar9);
  }
  if (param_1->unk0x34 == (undefined *)0xffffffff) {
    param_1->unk0x34 = (undefined *)0x0;
  }
  else {
    size = size + 0x80;
    setBorgFlag();
    puVar3 = (undefined *)getBorgItem((s32)param_1->unk0x34);
    param_1->unk0x34 = puVar3;
  }
  ppvVar15 = (void **)param_1->unk0x38;
  if (ppvVar15 == (void **)0x0) {
    ppvVar15 = (void **)param_1->locatorDat;
  }
  else {
    iVar9 = *(s32 *)&param_1->unk0x14;
    while (iVar9 != 0) {
      size = size + 0x20;
      setBorgFlag();
      iVar9 = iVar9 + -1;
      pvVar4 = getBorgItem((s32)*ppvVar15);
      *ppvVar15 = pvVar4;
      ppvVar15 = ppvVar15 + 1;
    }
    ppvVar15 = (void **)param_1->locatorDat;
  }
  if (ppvVar15 != (void **)0x0) {
    fVar13 = param_1->unk0x18[0];
    while (fVar13 != 0.0) {
      clearBorgFlag();
      pvVar4 = getBorgItem((s32)*ppvVar15);
      iVar9 = *(s32 *)((s32)pvVar4 + 0x58);
      iVar12 = *(s32 *)(iVar9 + 0x3c);
      *ppvVar15 = pvVar4;
      if (iVar12 != 0) {
        size = size + *(s32 *)(iVar9 + 0x38) * 0x10;
      }
      bVar2 = false;
      fVar13 = (float)((s32)fVar13 + -1);
      puVar6 = *(u32 **)(iVar9 + 0x40);
      iVar9 = *(s32 *)(iVar9 + 4);
      ppvVar15 = ppvVar15 + 1;
      while (iVar9 != 0) {
        if ((*puVar6 & 3) != 0) {
          bVar2 = true;
        }
        iVar9--;
        puVar6 = puVar6 + 5;
      }
      if (bVar2) {
        size = size + 0x60;
        *(s32 *)((s32)pvVar4 + 8) = 0xffffffff;
        *(s32 *)((s32)pvVar4 + 0xc) = 0xffffffff;
      }
      else {
        *(s32 *)((s32)pvVar4 + 8) = 0;
        *(s32 *)((s32)pvVar4 + 0xc) = 0;
      }
    }
  }
  clearBorgFlag();
  ppvVar15 = (void **)param_1->unk0x40;
  if (ppvVar15 != (void **)0x0) {
    fVar13 = param_1->unk0x18[1];
    while (fVar13 != 0.0) {
      fVar13 = (float)((s32)fVar13 + -1);
      pvVar4 = getBorgItem((s32)*ppvVar15);
      *ppvVar15 = pvVar4;
      ppvVar15 = ppvVar15 + 1;
    }
  }
  puVar5 = (s32 *)heapAlloc(size,FILENAME,0x6bf);
  puVar3 = param_1->unk0x28;
  iVar9 = param_1->unk0x10;
  *(s32 **)&param_1->unk0x8 = puVar5;
  if (iVar9 != 0) {
    *(s32 **)(puVar3 + 0xc) = puVar5;
    while( true ) {
      puVar5[0x50] = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x144) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x148) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x14c) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x150) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x154) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x158) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x15c) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x160) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x164) = 0;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x168) = 0;
      puVar5 = puVar5 + 0x62;
      *(s32 *)(*(s32 *)(puVar3 + 0xc) + 0x16c) = 0;
      iVar9 = iVar9 + -1;
      guMtxIdent(*(s32 *)(puVar3 + 0xc));
      guMtxIdent(*(s32 *)(puVar3 + 0xc) + 0x40);
      if (iVar9 == 0) break;
      *(s32 **)(puVar3 + 0x4c) = puVar5;
      puVar3 = puVar3 + 0x40;
    }
  }
  if (param_1->unk0x34 == (undefined *)0x0) {
    piVar10 = (s32 *)param_1->unk0x38;
  }
  else {
    *(s32 **)(param_1->unk0x34 + 0x2c) = puVar5;
    puVar5 = puVar5 + 0x20;
    piVar10 = (s32 *)param_1->unk0x38;
  }
  if (piVar10 == NULL) {
    piVar10 = (s32 *)param_1->locatorDat;
  }
  else {
    iVar9 = *(s32 *)&param_1->unk0x14;
    while (iVar9 != 0) {
      iVar9 = iVar9 + -1;
      iVar12 = *piVar10;
      piVar10 = piVar10 + 1;
      *(s32 **)(iVar12 + 0x18) = puVar5;
      puVar5 = puVar5 + 8;
    }
    piVar10 = (s32 *)param_1->locatorDat;
  }
  if (piVar10 != NULL) {
    fVar13 = param_1->unk0x18[0];
    while (fVar13 != 0.0) {
      iVar9 = *(s32 *)(*piVar10 + 0x58);
      fVar13 = (float)((s32)fVar13 + -1);
      piVar14 = piVar10 + 1;
      if (*(s32 *)(iVar9 + 0x3c) != 0) {
        puVar5 = (s32 *)((s32)puVar5 + 7U & 0xfffffff8);
        iVar12 = *(s32 *)(iVar9 + 0x38);
        puVar11 = *(s32 **)(iVar9 + 0x34);
        *(s32 **)(iVar9 + 0x38) = puVar5;
        iVar9 = iVar12;
        puVar7 = puVar5;
        while (iVar9 != 0) {
          *puVar7 = *puVar11;
          puVar7[1] = puVar11[1];
          iVar9 = iVar9 + -1;
          puVar7[2] = puVar11[2];
          puVar1 = puVar11 + 3;
          puVar11 = puVar11 + 4;
          puVar7[3] = *puVar1;
          puVar7 = puVar7 + 4;
        }
        puVar5 = puVar5 + iVar12 * 4;
      }
      iVar9 = *piVar10;
      if (*(s32 *)(iVar9 + 8) == 0) {
        iVar12 = *(s32 *)(iVar9 + 0xc);
      }
      else {
        *(s32 **)(iVar9 + 8) = puVar5;
        puVar5 = puVar5 + 0x10;
        iVar9 = *piVar10;
        iVar12 = *(s32 *)(iVar9 + 0xc);
      }
      piVar10 = piVar14;
      if (iVar12 != 0) {
        *(s32 **)(iVar9 + 0xc) = puVar5;
        puVar5 = puVar5 + 8;
      }
    }
  }
  return false;
}
void borg5_free(Borg_5_header *param_1){
  s32 uVar1;
  s32 iVar2;
  borg_2_header *pbVar4;
  Borg_1_Header *pBVar5;
  s32 iVar6;
  float fVar7;
  s32 *puVar8;
  borg_2_header *pbVar9;
  Borg_1_Header *pBVar10;
  
  iVar2 = get_memUsed();
  if (param_1->borg3) {
    borg3_free(param_1->borg3);
  }
  puVar8 = (s32 *)param_1->unk0x38;
  if ((puVar8) && (iVar6 = *(s32 *)&param_1->unk0x14, iVar6 != 0)) {
    uVar1 = *puVar8;
    while( true ) {
      iVar6 = iVar6 + -1;
      puVar8 = puVar8 + 1;
      Borg4_free(uVar1);
      if (iVar6 == 0) break;
      uVar1 = *puVar8;
    }
  }
  pbVar9 = (borg_2_header *)param_1->locatorDat;
  if (pbVar9 == NULL) {
    pBVar10 = (Borg_1_Header *)param_1->unk0x40;
  }
  else {
    fVar7 = param_1->unk0x18[0];
    if (fVar7 != 0.0) {
      pbVar4 = *(borg_2_header **)pbVar9;
      while( true ) {
        fVar7 = (float)((s32)fVar7 + -1);
        pbVar9 = (borg_2_header *)((s32)pbVar9 + 4);
        borg_2_free(pbVar4);
        if (fVar7 == 0.0) break;
        pbVar4 = *(borg_2_header **)pbVar9;
      }
    }
    pBVar10 = (Borg_1_Header *)param_1->unk0x40;
  }
  if (pBVar10 == NULL) {
    iVar6 = *(s32 *)param_1;
  }
  else {
    fVar7 = param_1->unk0x18[1];
    if (fVar7 != 0.0) {
      pBVar5 = *(Borg_1_Header **)pBVar10;
      while( true ) {
        fVar7 = (float)((s32)fVar7 + -1);
        pBVar10 = (Borg_1_Header *)((s32)pBVar10 + 4);
        borg1_free(pBVar5);
        if (fVar7 == 0.0) break;
        pBVar5 = *(Borg_1_Header **)pBVar10;
      }
    }
    iVar6 = *(s32 *)param_1;
  }
  if (iVar6 == -1) {
    HeapFree(*(void **)&param_1->unk0x8,FILENAME,0x78b);
    HeapFree(param_1,FILENAME,0x78f);
  }
  else {
    if (get_borg_index_count(iVar6) == 1) {HeapFree(*(void **)&param_1->unk0x8,FILENAME,0x795);}
    dec_borg_count(*(s32 *)param_1);
  }
  borg_mem[5]-= (iVar2 - get_memUsed());
  borg_count[5]--;
  return;
}
//"borg6": animation/cinematic data?
void borg6_func_a(borg_6_header *param_1){
  s16 sVar1;
  s16 sVar2;
  u32 uVar3;
  s32 iVar4;
  s16 *psVar5;
  s32 iVar6;
  s16 *psVar7;
  s32 iVar8;
  s32 iVar9;
  
  iVar9 = 0;
  uVar3 = param_1->unk0x4;
  iVar6 = (s32)&param_1->unk0x0 + param_1->unk0x8;
  param_1->unk0x8 = iVar6;
  if (0 < (s32)uVar3) {
    do {
      iVar8 = 0;
      iVar9 = iVar9 + 1;
      iVar4 = *(s32 *)(iVar6 + 0x10);
      psVar7 = (s16 *)((s32)&param_1->unk0x0 + *(s32 *)(iVar6 + 0x14));
      *(s16 **)(iVar6 + 0x14) = psVar7;
      if (0 < iVar4) {
        do {
          iVar8 = iVar8 + 1;
          psVar5 = (s16 *)((s32)&param_1->unk0x0 + *(s32 *)(psVar7 + 2));
          *(s16 **)(psVar7 + 2) = psVar5;
          sVar1 = *psVar5;
          *(s32 *)(psVar5 + 2) = (s32)&param_1->unk0x0 + *(s32 *)(psVar5 + 2);
          sVar2 = *psVar7;
          psVar7 = psVar7 + 8;
          while (sVar1 != sVar2) {
            sVar1 = psVar5[4];
            *(s32 *)(psVar5 + 6) = (s32)&param_1->unk0x0 + *(s32 *)(psVar5 + 6);
            psVar5 = psVar5 + 4;
          }
        } while (iVar8 < iVar4);
      }
      iVar6 = iVar6 + 0x18;
    } while (iVar9 < (s32)uVar3);
  }
  return;
}
bool borg6_func_b(borg_6_header *param_1,void *param_2){
  s32 iVar1;
  s32 iVar2;
  s32 iVar3;
  s32 iVar4;
  void *pvVar5;
  float fVar6;
  s32 *piVar7;
  s32 *piVar8;
  s32 *puVar9;
  s32 *puVar10;
  s32 iVar11;
  s32 *puVar12;
  u16 uVar13;
  s32 iVar14;
  s32 iVar15;
  s32 iVar16;
  s32 iVar17;
  u32 size;
  s32 uVar18;
  
  fVar6 = 1.0f;
  size = 0;
  iVar17 = 0;
  iVar1 = *(s32 *)((s32)param_2 + 4);
  param_1->unk0x20 = (u32)param_2;
  param_1->unk0x18 = 0;
  param_1->unk0x1c = fVar6;
  piVar7 = (s32 *)heapAlloc(iVar1 * 0x18,FILENAME,0x810);
  param_1->unk0x14 = piVar7;
  iVar1 = *(s32 *)(param_1->unk0x20 + 4);
  iVar4 = *(s32 *)(param_1->unk0x20 + 8);
  if (0 < iVar1) {
    do {
      iVar14 = *(s32 *)(iVar4 + 0x10);
      *piVar7 = iVar4;
      piVar7[1] = 0;
      piVar7[2] = 0;
      piVar8 = (s32 *)heapAlloc(iVar14 << 4,FILENAME,0x821);
      iVar17 = iVar17 + 1;
      iVar14 = *(s32 *)(iVar4 + 0x14);
      piVar7[4] = *(s32 *)(iVar4 + 8);
      iVar11 = *(s32 *)(iVar4 + 0x10);
      piVar7[3] = (s32)piVar8;
      if (0 < iVar11) {
        do {
          size = size + 0x10;
          iVar2 = *(s32 *)(iVar14 + 4);
          iVar11 = iVar11 + -1;
          *piVar8 = iVar14;
          iVar14 = iVar14 + 0x10;
          *(u16 *)(piVar8 + 3) = 1;
          piVar8[1] = iVar2;
          piVar8 = piVar8 + 4;
        } while (iVar11 != 0);
      }
      piVar7 = piVar7 + 6;
      iVar4 = iVar4 + 0x18;
    } while (iVar17 < iVar1);
  }
  puVar9 = (s32 *)heapAlloc(size,FILENAME,0x87d);
  iVar17 = 0;
  iVar1 = *(s32 *)(param_1->unk0x20 + 4);
  iVar4 = *(s32 *)(param_1->unk0x20 + 8);
  pvVar5 = param_1->unk0x14;
  if (0 < iVar1) {
    do {
      iVar16 = 0;
      iVar17 = iVar17 + 1;
      iVar14 = *(s32 *)(iVar4 + 0x10);
      puVar10 = puVar9;
      iVar11 = *(s32 *)((s32)pvVar5 + 0xc);
      iVar2 = *(s32 *)(iVar4 + 0x14);
      if (0 < iVar14) {
        do {
          iVar15 = 4;
          iVar16 = iVar16 + 1;
          iVar3 = *(s32 *)(iVar2 + 4);
          puVar9 = puVar10 + 4;
          *(s32 **)(iVar11 + 8) = puVar10;
          uVar13 = *(u16 *)(iVar3 + 2);
          puVar12 = *(s32 **)(iVar3 + 4);
          do {
            if ((uVar13 & 1) == 0) {
              *puVar10 = 0;
            }
            else {
              uVar18 = *puVar12;
              puVar12 = puVar12 + 1;
              *puVar10 = uVar18;
            }
            uVar13 = (s16)uVar13 >> 1;
            iVar15 = iVar15 + -1;
            puVar10 = puVar10 + 1;
          } while (iVar15 != 0);
          puVar10 = puVar9;
          iVar11 = iVar11 + 0x10;
          iVar2 = iVar2 + 0x10;
        } while (iVar16 < iVar14);
      }
      iVar4 = iVar4 + 0x18;
      pvVar5 = (void *)((s32)pvVar5 + 0x18);
    } while (iVar17 < iVar1);
  }
  param_1->unk0xc = 0;
  param_1->unk0x10 = 0;
  return false;
}
void borg_6_free(borg_6_header *param_1){
  s32 iVar1;
  s32 iVar2;
  s32 iVar3;
  
  iVar1 = get_memUsed();
  if (param_1->unk0x14) {
    HeapFree(*(void **)(*(s32 *)((s32)param_1->unk0x14 + 0xc) + 8),FILENAME);
    iVar2 = 0;
    if (0 < *(s32 *)(param_1->unk0x20 + 4)) {
      iVar3 = 0;
      do {
        HeapFree(*(void **)((s32)param_1->unk0x14 + iVar3 + 0xc),FILENAME);
        iVar2 = iVar2 + 1;
        iVar3 = iVar3 + 0x18;
      } while (iVar2 < *(s32 *)(param_1->unk0x20 + 4));
    }
    HeapFree(param_1->unk0x14,FILENAME,0x8e0);
  }
  if (param_1->index == -1) {
    HeapFree((void *)param_1->unk0x20,FILENAME,0x8e5);
  }
  else {dec_borg_count(param_1->index);}
  HeapFree(param_1,FILENAME,0x8ec);
  borg_mem[6]-= (iVar1 - get_memUsed(););
  borg_count[6]--;
  return;
}
//"borg7": actor data. also need more comprehension

void borg7_func_a(Borg_7_header *param_1){
  s32 iVar1;
  s32 iVar2;
  
  iVar2 = param_1->borg6_size;
  iVar1 = &param_1->unk0x50;
  if (0 < iVar2) {
    do {
      iVar2--;
      *(s32 *)(iVar1 + 0x14) = *(s32 *)(iVar1 + 0x14) + &param_1->unk0x50;
      iVar1 = iVar1 + 0xc;
    } while (iVar2 != 0);
  }
  return;
}

bool borg7_func_b(Borg_7_header *param_1,void *param_2){
  borg6Enum bVar1;
  borg_6_header *pbVar2;
  borg_6_header *pbVar3;
  borg6Enum *pbVar4;
  s32 iVar5;
  
  iVar5 = param_1->borg6_size;
  pbVar2 = (borg_6_header *)heapAlloc(iVar5 << 3,FILENAME,0x92e);
  param_1->borg_pointer = pbVar2;
  if (0 < iVar5) {
    pbVar4 = &param_1->borg6;
    do {
      pbVar2->unk0x0 = (u32)pbVar4;
      pbVar4 = pbVar4 + 3;
      pbVar2->unk0x4 = 0;
      iVar5 = iVar5 + -1;
      pbVar2 = (borg_6_header *)&pbVar2->unk0x8;
    } while (iVar5 != 0);
  }
  memset(&param_1->unk0x38,0,0x18);
  clearBorgFlag();
  pbVar3 = (borg_6_header *)getBorgItem(param_1->borg6);
  bVar1 = param_1->borg6;
  pbVar2 = param_1->borg_pointer;
  param_1->unk0x38 = pbVar3;
  param_1->aniDat = NULL;
  param_1->unk0xc = 0;
  param_1->unk0xe = 0;
  param_1->unk0x10 = 0;
  pbVar2->unk0x4 = (u32)pbVar3;
  param_1->unk0x20 = 0;
  param_1->unk0x24 = 0;
  param_1->unk0x28 = 0;
  param_1->unk0x2c = 0;
  param_1->unk0x30 = 0;
  param_1->unk0x34 = 0;
  param_1->unk0x12 = 1;
  param_1->unk0x44 = bVar1;
  param_1->unk0x1c = (undefined *)(&pbVar2->unk0x0 + param_1->unk0x58 * 2);
  return true;
}

void borg7_free(Borg_7_header *param_1){
  u8 uVar2;
  s32 iVar1;
  borg_6_header **ppbVar3;
  s32 iVar4;
  
  ppbVar3 = &param_1->unk0x38;
  iVar4 = 2;
  do {
    iVar4--;
    if (*ppbVar3) {
      borg_6_free(*ppbVar3);
    }
    ppbVar3++;
  } while (-1 < iVar4);
  iVar4 = get_memUsed();
  if (param_1->index == -1) {
    HeapFree(param_1->borg_pointer,FILENAME,0x976);
    HeapFree(param_1,FILENAME,0x978);}
  else {
    if (get_borg_index_count(param_1->index) == 1)
      {HeapFree(param_1->borg_pointer,FILENAME,0x97e);}
    dec_borg_count(param_1->index);}
  iVar1 = get_memUsed();
  borg_mem[7]-= (iVar4 - iVar1);
  borg_count[7]--;
}

void set_AnimCache(u8 x){animChache = x;}
