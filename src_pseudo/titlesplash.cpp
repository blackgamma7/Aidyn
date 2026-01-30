#include "globals.h"
#include "titlesplash.h"
#include "romstring.h"


#if DEBUGVER
#define BUILDVER "02.01d-PRERELEASE"
#define COMPILEDATE "Feb  2 2001"
#define COMPILETIME "00:02:40"

void TitleSplash::ShowVersion(Gfx**GG,u8 param_2){

  if ((sSplashVersionFlag) && (param_2)) {
    Gfx*g = *GG;
    Gsprintf("Aidyn Chronicles\nVersion: 02.01d-PRERELEASE\nCompile: %s-%s\nCode: %lu",
     COMPILEDATE,COMPILETIME,CODESIZE);
    *GG = Graphics::DrawText(g,gGlobals.text,0x1e,0x1e,200,200,200,param_2);
  }
}
void TitleSplash::Noop(u32 x, u32 y){}
#endif

void TitleSplash::Timer(u16 *stateP,u8 *alpha,u8 *alpha2,u32 ShowTime,u8 *nextP,u8 next){

  s16 a2 = 0;
  s16 a = *alpha;
  u16 state = *stateP;
  if (alpha2) a2 = *alpha2;
  switch(state){
    case 0:
    a+=30;
    if(0xff <= a){
        a = 0xff;
        state = 1;
        splashscreen_fadeTimer = 0;
        gGlobals.titleSplashVars.timer = 0;
      }
    break;
    case 1:
    gGlobals.titleSplashVars.timer++;
    if (ShowTime <= gGlobals.titleSplashVars.timer) state = 2;
    break;
    case 2:{
        a-=30;
        if (alpha2){
          a2+=30;
          if(a2>=0xff)a2=0xff;
        }
        if (a <= 0) {
          splashscreen_fadeTimer++;
          a = 0;
          if (0x13 < splashscreen_fadeTimer) {
            state = 0;
            *nextP = next;
          }
        }
      }
  }
  if (alpha2) *alpha2 = (u8)a2;
  *alpha = (u8)a;
  *stateP = state;
}

void TitleSplash::Init(void){
  SplashLogoModel = BorgAnimLoadScene(BORG5_N64Logo);
  Scene::SetNearFarPlanes(SplashLogoModel,1.0f,256.0);
  Scene::SetFlag8(SplashLogoModel);
  Scene::SetFlag10(SplashLogoModel);
  Scene::UnsetFlag4(SplashLogoModel);
  Scene::SetModelTint(SplashLogoModel,COLOR_BLACK);
  gGlobals.titleSplashVars.UnkC = 0;
  gGlobals.titleSplashVars.timer = 0;
  fadeFloatMirror = 1.0f;
  SplashLicence = WidgetB8(BORG8_LicencedByNintendo);
  SplashLicence->SetColor(0,0,0,0);
  SplashLicence->SetCoords(SCREEN_CENTERW -(SplashLicence->GetWidth()/2),(SCREEN_HEIGHT-50));
}

void TitleSplash::N64Free(void){
  FREEQSCENE(SplashLogoModel);
  FREEQW(SplashLicence);
  SplashLogoModel = NULL;
  SplashLicence = NULL;
}

void TitleSplash::Load(void){
  gGlobals.titleSplashVars.state = 5;
  gGlobals.titleSplashVars.thqBorg8 = loadBorg8(BORG8_LogoTHQ);
  gGlobals.titleSplashVars.h20Borg8 = loadBorg8(BORG8_LogoH2O);
  sSplashExpPak = loadBorg8((gExpPakFlag)?BORG8_EXPPakYes:BORG8_EXPPakNo);
  TitleSplash::Init();
  gGlobals.titleSplashVars.timer = 0;
  gGlobals.titleSplashVars.UnkA = 0;
  gGlobals.titleSplashVars.UnkB = 0xff;
  gGlobals.titleSplashVars.UnkC = 0xff;
  gGlobals.titleSplashVars.UnkD = 0;
  copyrightText = RomString::Load(copyrightStrings,0x180);
  Controller::GetDelay(0);
  #if DEBUGVER
  if(CODESIZE>0x100000)sCodeSizeError=true;
  #endif
}

void TitleSplash::Free(void){
  FREEQB8(gGlobals.titleSplashVars.h20Borg8);
  FREEQB8(gGlobals.titleSplashVars.thqBorg8);
  FREEQB8(sSplashExpPak);
  Font::SetFace(gGlobals.font,BORG8_MainFont);
  RomString::Free(copyrightText);
  TitleSplash::N64Free();
}

u8 TitleSplash::Show(Gfx**GG){
  u8 bVar2;
  
  if (splashscreen_load_flag) {
    TitleSplash::Load();
    splashscreen_load_flag=0;
  }
  bVar2 = true;
  *GG = Graphics::SomeOtherInit(*GG,FULL_SCREENSPACE,0,0,0,0);
  switch(gGlobals.titleSplashVars.state) {
  case 0:
    splashscreen_clear_flag=1;
    bVar2 = false;
    break;
  case 1:
    gGlobals.titleSplashVars.state = N64Logo(GG);
    break;
  case 2:
    gGlobals.titleSplashVars.state = THQLogo(GG);
    break;
  case 3:
    gGlobals.titleSplashVars.state = H2OLogo(GG);
    break;
  case 4:
    gGlobals.titleSplashVars.state = Copyright(GG);
    break;
  case 5:
    gGlobals.titleSplashVars.state = ExpansionPak(GG);
  }
  if (splashscreen_clear_flag) {
    Free();
    splashscreen_load_flag=1;
    splashscreen_clear_flag=0;
  }
  return bVar2;
}

void TitleSplash::Borg8(Gfx **GG,u8 alpha,Borg8Header *borg8){
  if (alpha) {
    float x = (float)(SCREEN_WIDTH - (borg8->dat).Width) * 0.5f;
    float y = (float)(SCREEN_HEIGHT - (borg8->dat).Height) * 0.5f;
    Gfx *g = *GG;
    RSPFUNC6(g);
    *GG = Borg8_DrawSimple(g,borg8,x,y,1.0f,1.0f,0xff,0xff,0xff,alpha);
  }
}

u8 TitleSplash::ExpansionPak(Gfx** GG){
  #if DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 30
  #endif

  Gfx* g = *GG;
  u8 state = gGlobals.titleSplashVars.state;
  controller_aidyn* temp;
  while (Controller::GetInput(&temp,0)) {
    TitleSplash::Timer(&splashscreen_exppakdatA,&sSplashExpPakAlpha,NULL,ShowTime,&state,4);
  }
  TitleSplash::Borg8(&g,sSplashExpPakAlpha,sSplashExpPak);
  *GG = g;
  return state;
}

void TitleSplash::Println(Gfx**GG,s16 *HSpace,char *TXT){
  Font::print800b44dc(gGlobals.font,GG,TXT,(SCREEN_WIDTH - Font::GetWidth(gGlobals.font,TXT)) / 2,(s32)*HSpace);
  *HSpace+= (gGlobals.font)->charH;
}
u8 TitleSplash::Copyright(Gfx **GG){
  byte state;
  s16 textY;
  controller_aidyn *cont;
  Gfx *g;
  
  #if DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  g = *GG;
  state = gGlobals.titleSplashVars.state;
  textY = (Graphics::GetVRes()/2) + -7 + (gGlobals.font)->charH * -6;
  while (Controller::GetInput(&cont,0)) {
    #if DEBUGVER
    if ((cont->held & (R_BUTTON|L_BUTTON)) == (R_BUTTON|L_BUTTON)) {
      sSplashVersionFlag = 1;
    }
    #endif
    Timer(&sSplashCopyrightState,&sSplashCopyrightGray,NULL,ShowTime,&state,1);
  }
  RSPFUNC6(g);
  g = DrawRectangle(g,0,0,Graphics::GetHRes(),Graphics::GetVRes(),0,0,0,0);
  Font::SetFace(gGlobals.font,BORG8_SlimFont);
  ((gGlobals.font)->col).R = sSplashCopyrightGray;
  ((gGlobals.font)->col).G = sSplashCopyrightGray;
  ((gGlobals.font)->col).B = sSplashCopyrightGray;
  ((gGlobals.font)->col).A = sSplashCopyrightGray;
  #if DEBUGVER
  if (!sCodeSizeError){
  #endif
    for(u16 i = 0;i < 0xc;i++) {
      Println(&g,&textY,copyrightText[i]);
      //a few hard-coded margins
      if (((i == 1) || (i == 3)) || (i == 7)) textY += 5;
    }
  #if DEBUGVER
  }
  else{
    Gsprintf("Code Segment Too Big!\n");
    u32 segsize=CODESIZE;
    Println(&g,&textY,gGlobals.text);
    Gsprintf("Max: 0x%08x - %d\n",0x100000,0x100000);
    Println(&g,&textY,gGlobals.text);
    Gsprintf("Current: 0x%08x - %d\n",segsize,segsize);
    Println(&g,&textY,gGlobals.text);
    Gsprintf("Over: 0x%08x - %d\n",(segsize-0x100000),(segsize-0x100000));
    Println(&g,&textY,gGlobals.text);
    if (sSplashCopyrightState == 1) gGlobals.titleSplashVars.timer = 0;
  }
  #endif
  *GG = g;
  return state;
}

u8 TitleSplash::N64Logo(Gfx**GG){
  float fVar5;
  float fVar6;
  float fVar7;
  u8 auStack64;
  controller_aidyn* tempCont;
  
  #if DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  Gfx*g = *GG;
  auStack64 = gGlobals.titleSplashVars.state;
  //yeah, sets value directly instead of using setter.
  (SplashLicence->col)={sSplashN64Alpha,sSplashN64Alpha,sSplashN64Alpha,sSplashN64Alpha};
  Scene::SetModelTint(SplashLogoModel,sSplashN64Alpha,sSplashN64Alpha,sSplashN64Alpha,0xff);
  if (360.0f < N64LogoRot) N64LogoRot-= 360.0f;
  fVar7 = N64LogoRot * dtor;
  n64LogoVec3.x = __sinf(fVar7) * 40.0f;
  n64LogoVec3.y = 15.0f;
  n64LogoVec3.z = __cosf(fVar7) * 40.0f;
  fVar5 = -n64LogoVec3.x;
  fVar7 = -n64LogoVec3.y;
  fVar6 = -n64LogoVec3.z;
  while (Controller::GetInput(&tempCont,0)) {
    TitleSplash::Timer(&sSplashN64state,&sSplashN64Alpha,NULL,ShowTime,&auStack64,2);
    N64LogoRot += 2.0;
    SplashNoop(tempCont);
  }
  g = Graphics::StartDisplay(g,FULL_SCREENSPACE);
  Scene::LookAt(SplashLogoModel,n64LogoVec3.x,n64LogoVec3.y,n64LogoVec3.z,fVar5,fVar7,fVar6,0,1.0f,0);
  FUN_800a0df4(SplashLogoModel);
  g = gsAnimationDataMtx(g,SplashLogoModel);
  g = BorgAnimDrawScene(g,SplashLogoModel);
  RSPFUNC6(g);
  *GG = SplashLicence->Render(g,FULL_SCREENSPACE);
  return auStack64;
}

u8 TitleSplash::THQLogo(Gfx** GG){
  bool bVar1;
  byte abStack_28 [4];
  controller_aidyn *pcStack_24;
  Gfx *g;

  #if DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif
  
  g = *GG;
  abStack_28[0] = gGlobals.titleSplashVars.state;
  while (bVar1 = Controller::GetInput(&pcStack_24,0), bVar1) {
    Timer(&u16_800e98fc,&sSplashTHQAlpha,NULL,ShowTime,abStack_28,3);
    SplashNoop(pcStack_24);
  }
  Borg8(&g,sSplashTHQAlpha,gGlobals.titleSplashVars.thqBorg8);
  ShowVersion(&g,sSplashTHQAlpha);
  *GG = g;
  if (abStack_28[0] == 3) {
    sSplashTHQAlpha = 0;
  }
  return abStack_28[0];
}

u8 TitleSplash::H2OLogo(Gfx**GG){
  
  #if DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  byte state;
  controller_aidyn *cont;
  Gfx *g [8];
  
  g[0] = *GG;
  state = gGlobals.titleSplashVars.state;
  do {
    SplashNoop(cont);
    Timer(&u16_800e9900,&h20LogoAlpha,NULL,ShowTime,&state,0);
  }while(Controller::GetInput(&cont,0));
  Borg8(g,h20LogoAlpha,gGlobals.titleSplashVars.h20Borg8);
  ShowVersion(g,h20LogoAlpha);
  *GG = g[0];
  if (state == 0) h20LogoAlpha = 0;
  return state;
}


