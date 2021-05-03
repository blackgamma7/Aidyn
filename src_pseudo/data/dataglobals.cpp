struct ArrayHeader{
 byte Size;
 byte unk[3]; //total size? checksum? unused regardless.
 }

byte load_db_array_size(ArrayHeader *header,byte *size,int *offset){
  int iVar1;
  byte bVar2;
  ArrayHeader temp;
  
  iVar1 = *offset;
  bVar2 = RomCopy(&temp,header + iVar1,sizeof(ArrayHeader),1,"../data/dataGlobals.cpp",0x24);
  *size = temp.Size;
  *offset = iVar1 + sizeof(ArrayHeader);
  return bVar2;
}