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

class UnkGuiClassL: public UnkGuiClass{
  public:
  UnkGuiClass* link;
  BaseWidget* w;
  UnkGuiClassL(UnkGuiClass*,BaseWidget*);
  ~UnkGuiClassL();
  void vMethA(s32);
  virtual u32 vMethB(f32);
};

class UnkGuiClassA: public UnkGuiClass{
  virtual u8 vMethC(){}
};

class UnkGuiClassU2:public UnkGuiClass{
  public:
  s16* unkc;
  f64 f64Array[8];
  UnkGuiClassU2(s16*, s16*, s32, f64*);
  ~UnkGuiClassU2();
  virtual u32 vMethB(f32);
  virtual s16 vMethC(f32);
};

class UnkGuiClassU3:public UnkGuiClass{
  public:
  u8* unkc;
  f64 f64Array[8];
  UnkGuiClassU3(u8*, u8*, s32, f64*);
  ~UnkGuiClassU3();
  virtual u32 vMethB(f32);
  virtual u8 vMethC(f32);
};

class UnkGuiClassU4:public UnkGuiClass{
  public:
  u16* unkc;
  f64 f64Array[8];
  UnkGuiClassU4(u16*, s16*, s32, f64*);
  ~UnkGuiClassU4();
  virtual u32 vMethB(f32);
  virtual u16 vMethC(f32);
};
f64 double_array_0[]={0.5,1.0,1.570796012878418,0.0,3.141592979431152};
f64 double_array_1[]={1.0,1.0,0.0,0.0,1.570796012878418};
f64 double_array_2[]={1.0,1.0,1.570796012878418,0.0,4.712389469146729};

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

//used in UnkGuiSubstruct::UnkGuiSubstruct to alloc UnkGuiSubstruct->ptr
void* passto_new(u32 s);