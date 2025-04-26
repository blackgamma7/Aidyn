#include "typedefs.h"

class UnkGuiClass{
    public:
    u32 unk0;
    f32 unk4;
    virtual ~UnkGuiClass();
    virtual void vMethA(s32);
    virtual u32 vMethB(f32){}
    
};

class UnkGuiClassU1: public UnkGuiClass{
  public:
  ~UnkGuiClassU1(){}
  virtual void vMethA(s32);
};

//used for combatGuiBlip
class UnkGuiClassBlip : public UnkGuiClassU1{
  public:
  s16* unkc;
  f32 unk10;
  f32 unk14;
  UnkGuiClassBlip(s16 *param_2,short *param_3,s32 param_4);
  ~UnkGuiClassBlip();
  virtual u32 vMethB(f32);
  virtual s16 vMethC(f32);
};

//Used for "CrossBones" UI element
class UnkGuiClassCB: public UnkGuiClassU1{
    public:
  u8* unkc;
  f32 unk10;
  f32 unk14;
  UnkGuiClassCB(u8 *param_2,u8 *param_3,s32 param_4);
  ~UnkGuiClassCB();
  virtual u32 vMethB(f32);
  virtual u8 vMethC(f32);
};


class UnkGuiClassA: public UnkGuiClass{
  virtual u8 vMethC(){}
};




class UnkGuiSubstruct{
    public:
    u32 unk0;
    UnkGuiClass** ptr;
    u32 present;
    u32 max;
    UnkGuiSubstruct(u32);
    ~UnkGuiSubstruct();
    void AddItem(UnkGuiClass*);
    void Tick(u32);
    void Clear();
};

//used in UnkGuiSubstruct::init to alloc UnkGuiSubstruct->ptr
void* passto_new(u32 s);