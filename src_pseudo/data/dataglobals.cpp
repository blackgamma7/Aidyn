struct ArrayHeader{
 u8 Size;
 u8 unk[3]; //leftover garbage data? sometimes mirrors the next few values.

u8 load_db_array_size(ArrayHeader *header,u8 *size,s32 *offset){
  s32 iVar1;
  u8 bVar2;
  ArrayHeader temp;
  
  iVar1 = *offset;
  bVar2 = RomCopy(&temp,header + iVar1,sizeof(ArrayHeader),1,"../data/dataGlobals.cpp",0x24);
  *size = temp.Size;
  *offset = iVar1 + sizeof(ArrayHeader);
  return bVar2;
}