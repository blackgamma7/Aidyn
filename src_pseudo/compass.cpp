void make_compass(void){
  gCompass = (Compass_struct *)heapAlloc(0x18,FILENAME,0x65);
  gCompass->ring = get_borg_8(BORG8_compassRing);
  gCompass->N = get_borg_8(BORG8_CompassNorth);
  gCompass->S = get_borg_8(BORG8_CompassSouth);
  gCompass->E = get_borg_8(BORG8_CompassEast);
  gCompass->W = get_borg_8(BORG8_CompassWest);
}

Gfx* draw_compass(Gfx*param_1,Vec2 *X_Z){
  u8 red;
  u8 green;
  u8 blue;
  u16 h;
  u16 v;
  Gfx* pauVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  Vec2 fStack128;
  
  pauVar1 = rsp_func(param_1,6,gfx::get_hres(),gfx::get_vres());
  fVar2 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  fVar3 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar3) fVar3-= INT_MAX_f;
  fVar4 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar4) fVar4-= INT_MAX_f;
  fVar5 = gGlobals.screenfadeFloat * 80.0f;
  if (INT_MAX_f <= fVar5) fVar5-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->ring,241.0,169.0,1.0f,1.0f
                       ,(u8)(s32)fVar2,(u8)(s32)fVar3,(u8)(s32)fVar4,(u8)(s32)fVar5);
  fStack128[1] = 0.0;
  fStack128[0] = 1.0f;
  fVar3 = (float)vec2_dot(X_Z,fStack128);
  fStack128[0] = 0.0;
  fStack128[1] = 1.0f;
  fVar4 = (float)vec2_dot(X_Z,fStack128);
  fVar7 = fVar3 * 25.0f;
  fVar3 = fVar3 * 95.0f;
  fVar5 = fVar4 * 25.0f;
  fVar4 = fVar4 * 95.0f;
  fVar2 = gGlobals.screenfadeFloat * 160.0f;
  if (INT_MAX_f <= fVar2) {
    fVar2 = fVar2 - INT_MAX_f;
  }
  fVar6 = gGlobals.screenfadeFloat * 160.0f;
  red = (u8)(s32)fVar2;
  if (INT_MAX_f <= fVar6) fVar6-= INT_MAX_f;
  fVar2 = gGlobals.screenfadeFloat * 220.0f;
  green = (u8)(s32)fVar6;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  fVar6 = (160.0f - fVar4) * gGlobals.screenfadeFloat;
  blue = (u8)(s32)fVar2;
  if (INT_MAX_f <= fVar6) fVar6-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->N,(271.0f - fVar7) - 8.0f,
                       (fVar5 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar6);
  fVar2 = (fVar4 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->S,(fVar7 + 271.0f) - 8.0f,
                       (199.0f - fVar5) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (160.0f - fVar3) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->E,(fVar5 + 271.0f) - 8.0f,
                       (fVar7 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (fVar3 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->W,(271.0f - fVar5) - 8.0f,
                       (199.0f - fVar7) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  return pauVar1;
}

void compass_free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,gCompass->ring,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->N,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->S,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->E,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->W,4,0);
  HeapFree(gCompass,FILENAME,209);
  gCompass = NULL;
}