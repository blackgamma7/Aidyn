struct{
    OSMesg msg;
    OSMesgQueue msgQ;
    void* VAddr;
    u32 devAddr;
    u32 bytes;
}romcopy_struct;

struct{
    void* stack;
    OSMesg* mesgPointer;
    romcopy_struct* dmaStructs;
    u8* dmaIndecies;
    OSThread Thread;
    OSMesgQueue mesgQ0x1c0;
    OSMesg mesg0x1d8;
    OSMesgQueue mesgQ0x1dc;
    u8 flag;
}RomcopyManageStruct;
