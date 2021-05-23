void make_compass(void){
  compass_pointer = (Compass_struct *)Malloc(0x18,FILENAME,0x65);
  compass_pointer->ring = get_borg_8(BORG8_compassRing);
  compass_pointer->N = get_borg_8(BORG8_CompassNorth);
  compass_pointer->S = get_borg_8(BORG8_CompassSouth);
  compass_pointer->E = get_borg_8(BORG8_CompassEast);
  compass_pointer->W = get_borg_8(BORG8_CompassWest);
}

rspCom * draw_compass(rspCom *param_1,Vec2 *X_Z){
  u8 red;
  u8 green;
  u8 blue;
  ushort h;
  ushort v;
  rspCom *pauVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  Vec2 fStack128;
  
  pauVar1 = rsp_func(param_1,6,gfx::get_hres(),gfx::get_vres());
  fVar2 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
  fVar3 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar3) {fVar3-= INT_MAX_f;}
  fVar4 = gGlobals.screenfadeFloat * 255.0f;
  if (INT_MAX_f <= fVar4) {fVar4-= INT_MAX_f;}
  fVar5 = gGlobals.screenfadeFloat * 80.0f;
  if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
  fVar7 = 1.0f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,compass_pointer->ring,241.0,169.0,1.0f,1.0f
                       ,(u8)(int)fVar2,(u8)(int)fVar3,(u8)(int)fVar4,(u8)(int)fVar5);
  fStack128[1] = 0.0;
  fStack128[0] = fVar7;
  fVar3 = (float)vec2_scalar_product(X_Z,(Vec2 *)fStack128);
  fStack128[0] = 0.0;
  fStack128[1] = fVar7;
  fVar4 = (float)vec2_scalar_product(X_Z,(Vec2 *)fStack128);
  fVar7 = fVar3 * 25.0f;
  fVar3 = fVar3 * 95.0f;
  fVar5 = fVar4 * 25.0f;
  fVar4 = fVar4 * 95.0f;
  fVar2 = gGlobals.screenfadeFloat * 160.0f;
  if (INT_MAX_f <= fVar2) {
    fVar2 = fVar2 - INT_MAX_f;
  }
  fVar6 = gGlobals.screenfadeFloat * 160.0f;
  red = (u8)(int)fVar2;
  if (INT_MAX_f <= fVar6) {
    fVar6 = fVar6 - INT_MAX_f;
  }
  fVar2 = gGlobals.screenfadeFloat * 220.0f;
  green = (u8)(int)fVar6;
  if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
  fVar6 = (160.0f - fVar4) * gGlobals.screenfadeFloat;
  blue = (u8)(int)fVar2;
  if (INT_MAX_f <= fVar6) {fVar6-= INT_MAX_f;}
  pauVar1 = pass_to_borg_image_draw(pauVar1,compass_pointer->N,(271.0f - fVar7) - 8.0f,
                       (fVar5 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(int)fVar6);
  fVar2 = (fVar4 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
  pauVar1 = pass_to_borg_image_draw(pauVar1,compass_pointer->S,(fVar7 + 271.0f) - 8.0f,
                       (199.0f - fVar5) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(int)fVar2);
  fVar2 = (160.0f - fVar3) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
  pauVar1 = pass_to_borg_image_draw(pauVar1,compass_pointer->E,(fVar5 + 271.0f) - 8.0f,
                       (fVar7 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(int)fVar2);
  fVar2 = (fVar3 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
  pauVar1 = pass_to_borg_image_draw(pauVar1,compass_pointer->W,(271.0f - fVar5) - 8.0f,
                       (199.0f - fVar7) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(int)fVar2);
  return pauVar1;
}

void compass_free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,compass_pointer,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&compass_pointer->N,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&compass_pointer->S,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&compass_pointer->E,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&compass_pointer->W,4,0);
  Free(compass_pointer,FILENAME,0xd1);
  compass_pointer = NULL;
  return;
}