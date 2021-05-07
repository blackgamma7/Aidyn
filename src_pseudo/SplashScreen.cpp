char** copyrightText;
u16 copyright_error;
AnimationData* splashscreenAniDat //the N64 logo, I suspect.


#ifdef DEBUGVER
#define BUILDVER "02.01d-PRERELEASE"
#define BUILDDATE "Feb  2 2001"
#define BUILDTIME "00:02:40"

void SplashScreen_ShowVerion(rspCom **param_1,char param_2){
  rspCom *pauVar1;
  
  if ((show_verion_flag != 0) && (param_2 != '\0')) {
    pauVar1 = *param_1;
    sprintf(gGlobals.text,"Aidyn Chronicles\nVersion: 02.01d-PRERELEASE\nCompile: %s-%s\nCode: %lu",
     BUILDDATE,BUILDTIME,(&clear_end - &romMain) + 0x400);
    pauVar1 = (rspCom *)debug::some_debug_print(pauVar1,gGlobals.text,0x1e,0x1e,200,200,200,param_2);
    *param_1 = pauVar1;
  }
}
void splashscreen_noop(void){}
#endif