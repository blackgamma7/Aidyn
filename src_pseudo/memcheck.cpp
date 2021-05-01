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

MemCheck_struct memCheckStruct;
u16 ExpPakFlag;

void lookforExpansionPak(int ramstart,int arg1){
  u32 mem = osGetMemSize();
  if (mem < 0x400001) {
    memCheckStruct.MaxResolution0 = 0x25800;
    memCheckStruct.MaxResolution1 = 0x25800;
  }
  else {
    memCheckStruct.MaxResolution0 = 0x4b000;
    memCheckStruct.MaxResolution1 = 0x4b000;
  }
  ExpPakFlag = (u16)(mem >= 0x400001);
  memCheckStruct.GfxStart = (undefined *)((ramstart + arg1 & 0xffffffc0U) + 0x40);
  memCheckStruct.vi_buffer_pointers[0] =
       (void *)((u32)mem - (memCheckStruct.MaxResolution1 * 2 + -0x80000000));
  memCheckStruct.HeapStart = memCheckStruct.GfxStart + memCheckStruct.MaxResolution0;
  memCheckStruct.ramstartVal = ramstart;
  memCheckStruct.vi_buffer_pointers[1] =
       (void *)((int)memCheckStruct.vi_buffer_pointers[0] + memCheckStruct.MaxResolution1);
  memCheckStruct.RamSize = mem;
  memCheckStruct.ramVal0 = arg1;
  memCheckStruct.mem_free_allocated =
       (u32)((int)memCheckStruct.vi_buffer_pointers[0] - (int)memCheckStruct.HeapStart);
}
