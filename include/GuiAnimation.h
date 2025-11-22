#include "widgets/BaseWidget.h"

//these seem to be used for animating parts of the menus.

class GuiAnimator{
    public:
    f32 unk0;
    f32 spd;
    inline virtual ~GuiAnimator();
    virtual void vMethA(s32);
    virtual u32 vMethB(f32);
    
};

class GuiAnimatorU1: public GuiAnimator{
  public:
  ~GuiAnimatorU1();
  virtual void vMethA(s32);
};

//used for combatGuiBlip
class GuiAnimatorBlip : public GuiAnimatorU1{
  public:
  s16* unkc;
  f32 unk10;
  f32 unk14;
  GuiAnimatorBlip(s16 *param_2,s16 *param_3,f32 param_4);
  ~GuiAnimatorBlip();
  virtual u32 vMethB(f32);
  virtual s16 vMethC(f32);
};

//Used for "CrossBones" UI element
class GuiAnimatorCB: public GuiAnimatorU1{
    public:
  u8* unkc;
  f32 unk10;
  f32 unk14;
  GuiAnimatorCB(u8 *param_2,u8 *param_3,f32 param_4);
  inline GuiAnimatorCB(u8*p,f32 f1,f32 f2){
      unk0 = 0;
    spd = f2;
    unkc = p;
    unk10 = *p;
    unk14 = f1;}
  ~GuiAnimatorCB();
  virtual u32 vMethB(f32);
  virtual u8 vMethC(f32);
};
class GuiAnimatorF: public GuiAnimator{
  virtual void vMethA(s32);
  virtual u32 vMethB(f32);
};

class GuiAnimatorL: public GuiAnimatorF{
  public:
  GuiAnimator* link;
  BaseWidget* w;
  GuiAnimatorL(GuiAnimator*,BaseWidget*);
  ~GuiAnimatorL();
  void FreeLinked();
  void vMethA(s32);
  virtual u32 vMethB(f32);
};

class GuiAnimatorA: public GuiAnimator{
  virtual u8 vMethC();
};
struct GuiAnimatorStruct{
  f64 unk0;
  f64 unk8;
  f64 unk10;
  f64 unk18;
  f64 unk20;
  f64 unk28;
};
class GuiAnimatorS16:public GuiAnimator{
  public:
  s16* val;
  GuiAnimatorStruct unk;
  f64 f64Array[2];
  GuiAnimatorS16(s16*, s16*, s32, GuiAnimatorStruct*);
  ~GuiAnimatorS16();
  virtual u32 vMethB(f32);
  virtual s16 vMethC(f32);
};

class GuiAnimatorU8:public GuiAnimator{
  public:
  u8* val;
  GuiAnimatorStruct unk;
  f64 f64Array[2];
  GuiAnimatorU8(u8*, u8*, s32, GuiAnimatorStruct*);
  ~GuiAnimatorU8();
  virtual u32 vMethB(f32);
  virtual u8 vMethC(f32);
};

class GuiAnimatorU16:public GuiAnimator{
  public:
  u16* val;
  GuiAnimatorStruct unk;
  f64 f64Array[2];
  GuiAnimatorU16(u16*, u16*, s32, GuiAnimatorStruct*);
  ~GuiAnimatorU16();
  virtual u32 vMethB(f32);
  virtual u16 vMethC(f32);
};

#define PiOver2 1.570796012878418
GuiAnimatorStruct double_array_0={0.5,1.0,PiOver2,0.5,0.0,(PiOver2*2)};
GuiAnimatorStruct double_array_1={1.0,1.0,0.0,0.0,0.0,PiOver2};
GuiAnimatorStruct double_array_2={1.0,1.0,PiOver2,1.0,0.0,(PiOver2*3)};

class GuiAnimationManager{
    public:
    u32 unk0;
    GuiAnimator** ptr;
    u32 present;
    u32 max;
    GuiAnimationManager(u32);
    ~GuiAnimationManager();
    void AddItem(GuiAnimator*);
    void Tick(u32);
    void Clear();
};

//used in GuiAnimationManager contructor to alloc GuiAnimationManager->ptr
void* passto_new(u32 s);