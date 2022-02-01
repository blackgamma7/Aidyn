struct MemCheck_struct {
    u32 ramstartVal;
    pointer GfxStart;
    pointer HeapStart;
    void * vi_buffer_pointers[2];
    u32 RamSize;
    u32 ramVal0;
    u32 MaxResolution0;
    u32 mem_free_allocated;
    u32 MaxResolution1;
};

MemCheck_struct gMemCheckStruct;
u16 ExpPakFlag;

void MemoryCheck(s32 ramstart,s32 arg1){
  u32 mem = osGetMemSize();
  if (mem < 0x400001) {
    gMemCheckStruct.MaxResolution0 = 0x25800;
    gMemCheckStruct.MaxResolution1 = 0x25800;
  }
  else {
    gMemCheckStruct.MaxResolution0 = 0x4b000;
    gMemCheckStruct.MaxResolution1 = 0x4b000;
  }
  ExpPakFlag = (u16)(mem >= 0x400001);
  gMemCheckStruct.GfxStart = (undefined *)((ramstart + arg1 & 0xffffffc0U) + 0x40);
  gMemCheckStruct.vi_buffer_pointers[0] =
       (void *)((u32)mem - (gMemCheckStruct.MaxResolution1 * 2 + -0x80000000));
  gMemCheckStruct.HeapStart = gMemCheckStruct.GfxStart + gMemCheckStruct.MaxResolution0;
  gMemCheckStruct.ramstartVal = ramstart;
  gMemCheckStruct.vi_buffer_pointers[1] =
       (void *)((s32)gMemCheckStruct.vi_buffer_pointers[0] + gMemCheckStruct.MaxResolution1);
  gMemCheckStruct.RamSize = mem;
  gMemCheckStruct.ramVal0 = arg1;
  gMemCheckStruct.mem_free_allocated =
       (u32)((s32)gMemCheckStruct.vi_buffer_pointers[0] - (s32)gMemCheckStruct.HeapStart);
}
