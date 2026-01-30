#include "widgets/WidgetBorg8.h"

namespace TitleSplash{
    void ShowVersion(Gfx**,u8);
    void Noop(u32,u32);
    void Timer(u16 *param_1,u8 *alpha,u8 *param_3,u32 ShowTime,u8 *param_5,u8 param_6);
    void Init();
    void N64Free();
    void Load();
    void Free();
    u8 Show(Gfx**GG);
    void Borg8(Gfx **GG,u8 alpha,Borg8Header *borg8);
    u8 ExpansionPak(Gfx** param_1);
    void Println(Gfx**param_1,s16 *HSpace,char *TXT);
    u8 Copyright(Gfx **param_1);
    u8 N64Logo(Gfx**param_1);
    u8 THQLogo(Gfx** GG);
    u8 H2OLogo(Gfx**GG);
};
#if DEBUGVER
#define SplashNoop(cont) Noop(cont->held,cont->pressed) //not present in retail, would control something?
#else
#define SplashNoop(cont) ;
#endif


//intromusic protos

void load_intro_music();
s32 appState_0(Gfx **GG);
void noop_intromusic();

char** copyrightText=NULL;
#if DEBUGVER
u16 sCodeSizeError=0;
#endif
SceneData* SplashLogoModel=NULL;
WidgetBorg8* SplashLicence=NULL;
Borg8Header* sSplashExpPak=NULL;
#if DEBUGVER
u16 sSplashVersionFlag=true;
#endif
u16 splashscreen_fadeTimer=0;
u8 splashscreen_load_flag=true;
u8 splashscreen_clear_flag=false;
u16 splashscreen_exppakdatA=0;
u8 sSplashExpPakAlpha=0;
u16 sSplashCopyrightState=0;
u8 sSplashCopyrightGray=0;
vec3f n64LogoVec3;
float N64LogoRot=0;
u16 sSplashN64state=0;
u8 sSplashN64Alpha=0;
u16 u16_800e98fc=0;
u8 sSplashTHQAlpha=0;
u16 u16_800e9900=0;
u8 h20LogoAlpha=0;
