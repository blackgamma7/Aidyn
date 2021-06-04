struct sundail_struct {
    struct Borg_8_header * Ring;
    struct Borg_8_header * Cross;
    struct Borg_8_header * MoonPhase0;
    struct Borg_8_header * MoonPhase1;
    struct Borg_8_header * MoonPhase2;
    struct Borg_8_header * MoonPhase3;
    struct Borg_8_header * MoonPhase4;
    struct Borg_8_header * MoonPhase5;
    struct Borg_8_header * SunBig;
    struct Borg_8_header * SunSmall;
    byte moon;
    byte sun;
    byte align[2];
};


sundail_struct * sundail_pointer;

void sundail_init(void){
  sundail_pointer = (sundail_struct *)Malloc(0x2c,s_./src/sundial.cpp_800da490,0x6c);
  sundail_pointer->Ring = get_borg_8(BORG8_compassRing);
  sundail_pointer->Cross = get_borg_8(0x1ba);
  sundail_pointer->MoonPhase0 = get_borg_8(0x1b8);
  sundail_pointer->MoonPhase1 = get_borg_8(0x1b3);
  sundail_pointer->MoonPhase2 = get_borg_8(0x1b4);
  sundail_pointer->MoonPhase3 = get_borg_8(0x1b6);
  sundail_pointer->MoonPhase4 = get_borg_8(0x1b7);
  sundail_pointer->MoonPhase5 = get_borg_8(0x1b5);
  sundail_pointer->SunBig = get_borg_8(0x1bb);
  sundail_pointer->moon = 0;
  sundail_pointer->SunSmall = get_borg_8(0x1b9);
  sundail_pointer->sun = 0;
}

rspCom * draw_sundail(rspCom *param_1){
  byte bVar1;
  rspCom *pauVar2;
  uint uVar3;
  Borg_8_header *borg8;
  u8 blue;
  u8 green;
  u8 red;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  Calendar aCStack144;
  
  pauVar2 = rsp_func(param_1,6,gfx::get_hres(),gfx::get_vres());
  fVar4 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
  fVar5 = gGlobals.screenfadeFloat * 255.0f;
  red = (u8)(int)fVar4;
  if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
  fVar4 = gGlobals.screenfadeFloat * 255.0f;
  green = (u8)(int)fVar5;
  if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
  fVar5 = gGlobals.screenfadeFloat * 80.0f;
  blue = (u8)(int)fVar4;
  if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
  pauVar2 = pass_to_borg_image_draw(pauVar2,sundail_pointer->Ring,19.0,169.0,1.0f,1.0f,red,green,blue,(u8)(int)fVar5);
  if (sundail_pointer->sun == 0) {
    fVar4 = gGlobals.screenfadeFloat * 160.0f;
    if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
    fVar5 = gGlobals.screenfadeFloat * 160.0f;
    red = (u8)(int)fVar4;
    if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
    fVar4 = gGlobals.screenfadeFloat * 220.0f;
    green = (u8)(int)fVar5;
    if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
    fVar5 = gGlobals.screenfadeFloat * 160.0f;
    blue = (u8)(int)fVar4;
    if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
    World::get_ingame_calendar(TerrainPointer,&aCStack144);
    uVar3 = (aCStack144.week & 3) >> 1;
    bVar1 = TerrainPointer->moonPhases;
    borg8 = NULL;
    if (bVar1 == 1) {
      if (uVar3 == 0) {borg8 = sundail_pointer->MoonPhase1;}
      else {borg8 = sundail_pointer->MoonPhase2;}
    }
    else {
      if (bVar1 < 2) {
        if (bVar1 == 0) {borg8 = sundail_pointer->MoonPhase0;}
      }
      else {
        if (bVar1 == 2) {
          if (uVar3 == 0) {borg8 = sundail_pointer->MoonPhase3;}
          else {borg8 = sundail_pointer->MoonPhase4;}
        }
        else if (bVar1 == 3) {borg8 = sundail_pointer->MoonPhase5;}
      }
    }
    pauVar2 = pass_to_borg_image_draw(pauVar2,borg8,39.0,189.0,1.0f,1.0f,red,green,blue,(u8)(int)fVar5);
  }
  fVar4 = World::get_timeofDay_float(TerrainPointer);
  fVar10 = (float)((int)(fVar4 * 720.0f) % 0x2d0);
  fVar11 = fVar10 / 30.0f;
  fVar10 = fVar10 * 0.017453292f;
  fVar4 = 0.0;
  fVar5 = __sinf(fVar10);
  fVar10 = __cosf(fVar10);
  if ((fVar11 <= 7.0f) || (21.0f <= fVar11)) {
    if ((23.0f < fVar11) || (fVar11 < 5.0f)) {
      fVar4 = gGlobals.screenfadeFloat * 120.0f;
      if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
      fVar11 = gGlobals.screenfadeFloat * 100.0f;
      red = (u8)(int)fVar4;
      if (INT_MAX_f <= fVar11) {fVar11-= INT_MAX_f;}
      fVar4 = gGlobals.screenfadeFloat * 190.0f;
      green = (u8)(int)fVar11;
      if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
      blue = (u8)(int)fVar4;
      fVar4 = 0.0;
      fVar9 = 160.0f;
    }
    else {
      if ((fVar11 < 5.0f) || (7.0f < fVar11)) {
        fVar9 = fVar4;
        if ((fVar11 < 21.0f) || (23.0f < fVar11)) goto LAB_8002ba60;
        fVar6 = 255.0f - (fVar11 - 21.0f) * 67.5f;
        if (INT_MAX_f <= fVar6) {fVar6-= INT_MAX_f;}
        fVar7 = 190.0f - (fVar11 - 21.0f) * 45.0f;
        if (INT_MAX_f <= fVar7) {fVar7-= INT_MAX_f;}
        fVar8 = (fVar11 - 21.0f) * 20.0f + 150.0f;
        if (INT_MAX_f <= fVar8) {fVar8-= INT_MAX_f;}
        fVar9 = (fVar11 - 21.0f) * 80.0f;
        fVar4 = 160.0f - fVar9;
      }
      else {
        fVar6 = (fVar11 - 5.0f) * 67.5f + 120.0f;
        if (INT_MAX_f <= fVar6) {fVar6-= INT_MAX_f;}
        fVar7 = (fVar11 - 5.0f) * 45.0f + 100.0f;
        if (INT_MAX_f <= fVar7) {fVar7-= INT_MAX_f;}
        fVar8 = 190.0f - (fVar11 - 5.0f) * 20.0f;
        if (INT_MAX_f <= fVar8) {fVar8-= INT_MAX_f;}
        fVar4 = (fVar11 - 5.0f) * 80.0f;
        fVar9 = 160.0f - fVar4;
      }
      blue = (u8)(int)fVar8;
      green = (u8)(int)fVar7;
      red = (u8)(int)fVar6;
    }
  }
  else {
    fVar4 = gGlobals.screenfadeFloat * 255.0f;
    if (INT_MAX_f <= fVar4) {fVar4 = fVar4 - INT_MAX_f;}
    fVar11 = gGlobals.screenfadeFloat * 190.0f;
    red = (u8)(int)fVar4;
    if (INT_MAX_f <= fVar11) {fVar11 = fVar11 - INT_MAX_f;}
    fVar4 = gGlobals.screenfadeFloat * 150.0f;
    green = (u8)(int)fVar11;
    if (INT_MAX_f <= fVar4) {fVar4 = fVar4 - INT_MAX_f;}
    blue = (u8)(int)fVar4;
    fVar4 = 160.0f;
    fVar9 = 0.0;
  }
LAB_8002ba60:
  fVar11 = gGlobals.screenfadeFloat * 80.0f;
  if (INT_MAX_f <= fVar11) {fVar11 = fVar11 - INT_MAX_f;}
  pauVar2 = pass_to_borg_image_draw(pauVar2,sundail_pointer->Cross,24.0,174.0,1.0f,1.0f,red,green,blue,(u8)fVar11);
  if (sundail_pointer->moon == 0) {
    fVar4 = fVar4 * gGlobals.screenfadeFloat;
    fVar11 = (fVar5 * 25.0f + 49.0f) - 10.0f;
    fVar5 = (199.0f - fVar10 * 25.0f) - 10.0f;
    if (INT_MAX_f <= fVar4) {fVar4 -= INT_MAX_f;}
    if ((u8)fVar4 != 0) {pauVar2 = pass_to_borg_image_draw(pauVar2,sundail_pointer->SunBig,fVar11,fVar5,1.0f,1.0f,red,green,blue,(u8)fVar4);}
    fVar9 = fVar9 * gGlobals.screenfadeFloat;
    if (INT_MAX_f <= fVar9) {fVar9 -= INT_MAX_f;}
    if ((u8)fVar9 != 0) {pauVar2 = pass_to_borg_image_draw(pauVar2,sundail_pointer->SunSmall,fVar11,fVar5,1.0f,1.0f,red,green,blue,(u8)fVar9);}
  }
  return pauVar2;
}

void xor_sundail_sun(byte x){sundail_pointer->sun = x ^ 1;}
void xor_sundail_moon(byte x){sundail_pointer->moon = x ^ 1;}

void sundail_free(void){
  Borg_8_header **ppBVar1;
  
  AllocFreeQueueItem(&gGlobals.QueueA,sundail_pointer,4,0);
  ppBVar1 = &sundail_pointer->Cross;
  sundail_pointer->Ring = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase0;
  sundail_pointer->Cross = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase1;
  sundail_pointer->MoonPhase0 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase2;
  sundail_pointer->MoonPhase1 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase3;
  sundail_pointer->MoonPhase2 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase4;
  sundail_pointer->MoonPhase3 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->MoonPhase5;
  sundail_pointer->MoonPhase4 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->SunBig;
  sundail_pointer->MoonPhase5 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  ppBVar1 = &sundail_pointer->SunSmall;
  sundail_pointer->SunBig = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,ppBVar1,4,0);
  sundail_pointer->SunSmall = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,&sundail_pointer,7,0);
  sundail_pointer = NULL;
}