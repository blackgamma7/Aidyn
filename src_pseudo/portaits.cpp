u16 screen_bottom=240;

void init_portait_highlighter(void){gGlobals.portraitBorder = get_borg_8(0xdf);}

bool ofunc_check_portaits_bottom(bool param_1){
  bool bVar1;
  
  bVar1 = true;
  if (param_1 == false) {if (screen_bottom < 0xf0) {bVar1 = false;}}
  else if (param_1 == true) {bVar1 = screen_bottom < 0xba;}
  return bVar1;
}

#define WHITE_GLOW {255,255,255,128}
void pass_to_draw_portaits(rspCom *param_1,bool param_2){
  color uStack72 [4] ={WHITE_GLOW,WHITE_GLOW,WHITE_GLOW,WHITE_GLOW}; //yes, by hacking, you could color-code the auras.
  draw_party_portaits(param_1,param_2,uStack72);
}

void some_portait_math(color *colA,color *colB,float fade){
  float fVar1;
  
  fVar1 = (float)(uint)colA->R * fade;
  if (fVar1 < INT_MAX_f) {colB->R = (byte)fVar1;}
  else {colB->R = (byte)(fVar1 - INT_MAX_f);}
  fVar1 = (float)(uint)colA->G * fade;
  if (fVar1 < INT_MAX_f) {colB->G = (byte)fVar1;}
  else {colB->G = (byte)(fVar1 - INT_MAX_f);}
  fVar1 = (float)(uint)colA->B * fade;
  if (fVar1 < INT_MAX_f) {colB->B = (byte)fVar1;}
  else {colB->B = (byte)(fVar1 - INT_MAX_f);}
  fVar1 = (float)(uint)colA->A * fade;
  if (INT_MAX_f <= fVar1) {
    colB->A = (byte)(fVar1 - INT_MAX_f);
    return;
  }
  colB->A = (byte)fVar1;
  return;
}

rspCom * draw_party_portaits(rspCom *param_1,bool param_2,color *col){
  CharSheet *pCVar1;

  rspCom *pauVar2;
  float Hscale;
  color TempCol;
  
  if (!param_2) {if (screen_bottom < 0xf0) {screen_bottom+=4;}}
  else if ((param_2) && (0xb9 < screen_bottom)) {screen_bottom-=4;}}
  pauVar2 = rsp_func(param_1,6,gfx::get_hres(),gfx::get_vres());
  some_portait_math(col,&TempCol,gGlobals.screenfadeFloat);
  Hscale = 0.8f;
  pauVar2 = pass_to_borg_image_draw(pauVar2,gGlobals.portraitBorder,84.0,(float)(uint)screen_bottom,0.8f,0.8f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  some_portait_math(col + 1,&TempCol,gGlobals.screenfadeFloat);
  pauVar2 = pass_to_borg_image_draw(pauVar2,gGlobals.portraitBorder,122.0,(float)(uint)screen_bottom,Hscale,Hscale,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  some_portait_math(col + 2,&TempCol,gGlobals.screenfadeFloat);
  pauVar2 = pass_to_borg_image_draw(pauVar2,gGlobals.portraitBorder,160.0,(float)(uint)screen_bottom,Hscale,Hscale,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  some_portait_math(col + 3,&TempCol,gGlobals.screenfadeFloat);
  pauVar2 = pass_to_borg_image_draw(pauVar2,gGlobals.portraitBorder,198.0,(float)(uint)screen_bottom,Hscale,Hscale,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  TempCol.G = 0xff;
  TempCol.R = 0xff;
  TempCol.A = 0x80;
  some_portait_math(&TempCol,&TempCol,gGlobals.screenfadeFloat);
  pCVar1 = (gGlobals.Party)->Party[0];
  if ((pCVar1 != NULL) && (pCVar1->portait != NULL)) {
    pauVar2 = pass_to_borg_image_draw(pauVar2,pCVar1->portait,90.0,(float)(screen_bottom + 6),0.75f,0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (gGlobals.Party)->Party[1];
  if ((pCVar1 != NULL) && (pCVar1->portait != NULL)) {
    pauVar2 = pass_to_borg_image_draw(pauVar2,pCVar1->portait,128.0,(float)(screen_bottom + 6),0.75f,0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (gGlobals.Party)->Party[2];
  if ((pCVar1 != NULL) && (pCVar1->portait != NULL)) {
    pauVar2 = pass_to_borg_image_draw(pauVar2,pCVar1->portait,166.0,(float)(screen_bottom + 6),0.75f,0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (gGlobals.Party)->Party[3];
  if ((pCVar1 != NULL) && (pCVar1->portait != NULL)) {
    pauVar2 = pass_to_borg_image_draw(pauVar2,pCVar1->portait,204.0,(float)(screen_bottom + 6),0.75f,0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  return pauVar2;
}

void portait_border_free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.portraitBorder,4,0);
  gGlobals.portraitBorder = NULL;}