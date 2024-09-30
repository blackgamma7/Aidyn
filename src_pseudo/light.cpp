void InitLight_(light_obj *light,vec3f *pos,float size,u16 type,float f1,color32 colB,color32 colC){
  u16 uVar1;
  
  memset(light,0,0x6c);
  (light->header).type = Light;
  (light->header).Bitfeild = visible;
  copyVec3(pos,light);
  (light->data).lightType = type;
  (light->header).size = size;
  (light->data).cols[1] = colB;
  (light->data).cols[2] = colC;
  uVar1 = (light->data).lightType;
  if (uVar1 == 1) {
LAB_800549a8:
    (light->data).f1 = f1;
    return;
  }
  else if(uVar1 == 0) {
      (light->data).cols[0] = (light->data).cols[1];
      return;
    }
  else if ((uVar1 == 2) || (uVar1 == 3)) goto LAB_800549a8;
  CRASH("InitLight","Unknown Light Type");
}

void color_magnitude(color32 *param_1,color32 *param_2,float amp){
  float fVar2;
  char cVar3;
  
  if (amp < 0.0) amp = 0.0;
  if (1.0f < amp) amp = 1.0f;
  fVar2 = ((float)(u32)param_1[1].R - (float)(u32)param_1->R) * amp;
  if (fVar2 < INT_MAX_f) {cVar3 = (char)(s32)fVar2;}
  else {cVar3 = (char)(s32)(fVar2 - INT_MAX_f);}
  param_2->R = param_1->R + cVar3;
  fVar2 = ((float)(u32)param_1[1].G - (float)(u32)param_1->G) * amp;
  if (fVar2 < INT_MAX_f) {cVar3 = (char)(s32)fVar2;  }
  else {cVar3 = (char)(s32)(fVar2 - INT_MAX_f);}
  param_2->G = param_1->G + cVar3;
  fVar2 = ((float)(u32)param_1[1].B - (float)(u32)param_1->B) * amp;
  if (fVar2 < INT_MAX_f) {cVar3 = (char)(s32)fVar2;}
  else {cVar3 = (char)(s32)(fVar2 - INT_MAX_f);}
  param_2->B = param_1->B + cVar3;
  fVar2 = ((float)(u32)param_1[1].A - (float)(u32)param_1->A) * amp;
  if (fVar2 < INT_MAX_f) {cVar3 = (char)(s32)fVar2;}
  else {cVar3 = (char)(s32)(fVar2 - INT_MAX_f);}
  param_2->A = param_1->A + cVar3;
}

float FUN_80054ba4(float x,float y){
  if (x < 0.0) {x += y;}
  if (y < x) {x -= y;}
  return x;
}

void color_XOR(color32 *colA,color32 *colB){
  u8 temp;
  
  temp = colA->R ^ colB->R;
  colA->R = temp;
  temp = colB->R ^ temp;
  colB->R = temp;
  colA->R = colA->R ^ temp;
  temp = colA->G ^ colB->G;
  colA->G = temp;
  temp = colB->G ^ temp;
  colB->G = temp;
  colA->G = colA->G ^ temp;
  temp = colA->B ^ colB->B;
  colA->B = temp;
  temp = colB->B ^ temp;
  colB->B = temp;
  colA->B = colA->B ^ temp;
  temp = colA->A ^ colB->A;
  colA->A = temp;
  temp = colB->A ^ temp;
  colB->A = temp;
  colA->A = colA->A ^ temp;
}

void tint_color_with_screenfade(color32 *param_1,float fade){
  u8 bVar1;
  float fVar3;
  float fVar4;
  float fVar5;
  u8 bVar6;
  

  fVar4 = (float)(u32)param_1->R * fade;
  if (fVar4 < INT_MAX_f) {bVar6 = (u8)(s32)fVar4;}
  else {bVar6 = (u8)(s32)(fVar4 - INT_MAX_f);}
  fVar5 = (float)(u32)param_1->G * fade;
  param_1->R = bVar6;
  if (fVar5 < INT_MAX_f) {bVar6 = (u8)(s32)fVar5;}
  else {bVar6 = (u8)(s32)(fVar5 - INT_MAX_f);}
  fVar5 = (float)(u32)param_1->B * fade;
  param_1->G = bVar6;
  if (fVar5 < INT_MAX_f) {bVar6 = (u8)(s32)fVar5;}
  else {bVar6 = (u8)(s32)(fVar5 - INT_MAX_f);}
  fVar4 = (float)(u32)param_1->A * fade;
  param_1->B = bVar6;
  if (INT_MAX_f <= fVar4) {
    param_1->A = (u8)(s32)(fVar4 - INT_MAX_f);
    return;
  }
  param_1->A = (u8)(s32)fVar4;
  return;
}

void Ofunc_80054db0(light_obj *param_1,ref_obj_bitfeild param_2){(param_1->header).Bitfeild |= param_2;}
void Ofunc_80054dc0(light_obj *param_1,u16 param_2){(param_1->header).Bitfeild = (param_1->header).Bitfeild & ~param_2;}

void InitLight(AnimationData *ani,Borg_9_data *param_2,mapVoxel *obj,light_obj *light,s16 lightCount,s16 delta){
  ref_obj_bitfeild rVar1;
  u16 uVar2;
  void *pvVar3;
  bool bVar4;
  s32 delay;
  color32 *pcVar5;
  light_dat *plVar6;
  color32 *pcVar7;
  light_dat *plVar8;
  color32 *colA;
  color32 *colB;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  s8 sVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar20;
  vec3f fStack144;
  s32 iStack72;
  light_dat *plStack68;
  
  iStack72 = 0;
  delay = (s32)delta;
  if (0 < lightCount) {
    plVar8 = &light->data;
    pcVar7 = (light->data).cols + 1;
    colB = (light->data).cols + 2;
    plVar6 = plVar8;
    pcVar5 = pcVar7;
    colA = pcVar7;
    plStack68 = plVar8;
    do {
      if (((((light->header).type == Light) &&
           (rVar1 = (light->header).Bitfeild, (rVar1 & visible) != 0)) &&
          ((pvVar3 = (light->header).ptr0x24, pvVar3 == NULL ||
           (*(s16 *)((s32)pvVar3 + 6) < 1)))) &&
         (((rVar1 & 0x1000) == 0 ||
          (FUN_800adf78(param_2,light,obj,0.25,0x0,0x0,1) == false)))) {
        fVar9 = get_vec3_proximity(obj,light);
        fVar10 = (light->header).size;
        if (fVar9 < fVar10) {
          fVar10 = (fVar10 - fVar9) / fVar10;
          if ((light->header).timestamp < gGlobals.ticker) {
            (light->header).timestamp = gGlobals.ticker;
            fVar9 = 360.0f;
            uVar2 = (light->data).lightType;
            fVar11 = 1.0f;
            if (uVar2 == 1) {
              fVar9 = (light->data).f0 +(fVar11 / ((light->data).f1 * 30.0f)) * (float)delay;
              (light->data).f0 = fVar9;
              if (fVar11 < fVar9) {color_XOR(colA,colB);}
              fVar9 = FUN_80054ba4((light->data).f0,1.0f);
              (light->data).f0 = fVar9;
              color_magnitude((light->data).cols + 1,(color32 *)plStack68,fVar9);
            }
            else {
              if (uVar2 < 2) {
                if (uVar2 != 0) {
LAB_8005513c:
                  Gsprintf("Unknown Light Type: %d\n",(light->data).lightType);
                  CRASH("InitLight",gGlobals.text);
                }
                (light->data).cols[0] = (light->data).cols[1];
              }
              else {
                if (uVar2 == 2) {
                  fVar11 = (float)((double)(light->data).f0 +(360.0d / (double)((light->data).f1 * 60.0f)) *(double)delay);
                  (light->data).f0 = fVar11;
                  fVar9 = FUN_80054ba4(fVar11,fVar9);
                  fVar11 = fVar9 * DtoR_f;
                  (light->data).f0 = fVar9;
                  color_magnitude(pcVar5,(color32 *)plVar6,(__sinf(fVar11) + 1.0f) * 0.5f);
                }
                else {
                  if (uVar2 != 3) goto LAB_8005513c;
                  fVar14 = (light->data).f1;
                  fVar15 = (light->data).f0;
                  fVar16 = (light->data).f2;
                  fVar17 = fVar15 - fVar16;
                  fVar9 = (float)delay;
                  fVar12 = (fVar11 / (fVar14 * 60.0f)) * fVar9;
                  if (fVar17 < 0.0) {
                    if (fVar12 <= -fVar17) goto LAB_800550e8;
LAB_800550d0:
                    (light->data).f0 = fVar16;
                    (light->data).f2 = Random::GetFloatRange((u32 *)&gGlobals,0.0,1.0);
                  }
                  else {
                    if (fVar17 < fVar12) goto LAB_800550d0;
LAB_800550e8:
                    if (fVar16 < fVar15) {fVar15-= (fVar11 / (fVar14 * 60.0f)) * fVar9;}
                    else {fVar15+= (fVar11 / (fVar14 * 60.0f)) * fVar9;}
                    (light->data).f0 = fVar15;
                  }
                  color_magnitude(pcVar7,(color32 *)plVar8,(light->data).f0);
                }
              }
            }
            tint_color_with_screenfade((color32 *)&light->data,fVar10);
          }
          if (((light->header).Bitfeild & 1) == 0) {Vec3_sub(fStack144,light,obj);}
          else {Vec3_sub(fStack144,&gGlobals.Sub.camera,obj);}
          vec3_normalize(fStack144);
          tint_color_with_screenfade((color32 *)&light->data,gGlobals.screenfadeFloat);
          fVar10 = fVar10 * 250.0f;
          if (fVar10 < INT_MAX_f) {sVar13 = (s8)(s32)fVar10;}
          else {sVar13 = (s8)(s32)(fVar10 - INT_MAX_f);}
          some_light_func(ani,sVar13,fStack144[0],fStack144[1],fStack144[2],(light->data).cols[0].R,
                          (light->data).cols[0].G,(light->data).cols[0].B,light_count);
        }
      }
      plVar8 = (light_dat *)&plVar8[1].unk0x28;
      pcVar7 = pcVar7 + 0x1b;
      plVar6 = (light_dat *)&plVar6[1].unk0x28;
      pcVar5 = pcVar5 + 0x1b;
      colB = colB + 0x1b;
      colA = colA + 0x1b;
      light++;
      plStack68 = (light_dat *)&plStack68[1].unk0x28;
      iStack72 = (iStack72 + 1) * 0x10000 >> 0x10;
    } while (iStack72 < lightCount);
  }
  return;
}

void light_init_func(playerData *param_1,AnimationData *param_2,s16 param_3){
  u16 uVar1;
  Borg_9_data *pBVar2;
  borg_9_struct *pbVar3;
  s32 iVar4;
  light_obj *light;
  vec3f *obj;
  s32 iVar5;
  s16 sStack48;
  s16 asStack46 [23];
  
  pBVar2 = GetCollisionZone(param_1->zoneDatByte);
  if (pBVar2) {
    obj = (param_1->collision).position;
    getZonePositionShorts(pBVar2,obj,&sStack48,asStack46);
    pbVar3 = borg9_get_unkStruct(pBVar2,sStack48,asStack46[0]);
    if ((param_1->visible_flag != 0) && (iVar4 = 0, pbVar3->unk0x10 != 0)) {
      iVar5 = 0x10000;
      do {
        uVar1 = *(u16 *)(iVar4 * 2 + (s32)pbVar3->unk0x8);
        light = (light_obj *)((s32)pBVar2->ref_objs + ((u32)uVar1 * 0x1c - (u32)uVar1) * 4);
        if ((light->header).type == Light) {
          InitLight(param_2,pBVar2,(mapVoxel *)obj,light,1,param_3);
        }
        iVar4 = iVar5 >> 0x10;
        iVar5 = iVar5 + 0x10000;
      } while (iVar4 < (s32)(u32)pbVar3->unk0x10);
    }
  }
  return;
}

void passto_initLight(AnimationData *param_1,Borg_9_data *param_2,mapVoxel *param_3,s16 param_4)
  {InitLight(param_1,param_2,param_3,(light_obj *)param_2->ref_objs,param_2->voxelCount,param_4);}

void passto_InitLight_2(dynamic_light_struct *param_1,AnimationData *param_2,mapVoxel *param_3,s16 param_4)
  {InitLight(param_2,gGlobals.Sub.borg9DatPointer,param_3,param_1->lights,16,param_4);}

void init_dynamic_light(dynamic_light_struct *param_1){
  s16 (*pasVar1) [4];
  s16 (*pasVar2) [4];
  s16 (*ppasVar3) [4];
  s16 iVar3;
  s32 iVar4;
  s16 *psVar5;
  
  memset(param_1,0,0x764);
  iVar3 = 0;
  ppasVar3 = (s16 (*) [4])&param_1->lights[0].header.ptr0x24;
  pasVar1 = param_1->shortsA;
  param_1->unk0x762 = 1;
  psVar5 = param_1->shortsB;
  iVar4 = 0x10000;
  pasVar2 = pasVar1;
  for(iVar3=0;iVar3 < 0x10;iVar3++) {
    *(s16 (**) [4])*ppasVar3 = pasVar2;
    ppasVar3 = (s16 (*) [4])(ppasVar3[0xd] + 2);
    pasVar2 = pasVar2[1];
    *psVar5 = (s16)iVar3;
    (*pasVar1)[0] = (s16)iVar3;
    pasVar1 = pasVar1[1];
    psVar5++;
  }
}

void dynamic_lights_free_all(dynamic_light_struct *param_1){
  s32 iVar1;
  void **ppvVar2;
  s32 iVar3;
  
  ppvVar2 = &param_1->lights[0].header.ptr0x24;
  param_1->unk0x762 = 0;
  iVar3 = 0x10000;
  do {
    if (*(s16 *)((s32)*ppvVar2 + 2) != 0) {FreeDynamicLight(param_1,**ppvVar2);}
    iVar1 = iVar3 >> 0x10;
    ppvVar2 = ppvVar2 + 0x1b;
    iVar3 = iVar3 + 0x10000;
  } while (iVar1 < 0x10);
  return;
}

//This only seems to be used with the exploding chest.
light_obj * AllocDynamicLight(dynamic_light_struct *param_1,u16 param_2,vec3f *pos,float size,u16 type,
                 float f1,color32 colb,color32 colc){
  s16 sVar1;
  void *pvVar2;
  light_obj *pdVar3;
  
  sVar1 = param_1->dynamicLightCount;
  if (sVar1 < 0x10) {
    pdVar3 = (light_obj *)((s32)param_1 + (sVar1 * 0x1c - (s32)sVar1) * 4);
    pvVar2 = (pdVar3->header).ptr0x24;
    param_1->dynamicLightCount++;
    *(u16 *)((s32)pvVar2 + 2) = 1;
    *(u16 *)((s32)pvVar2 + 4) = param_2;
    InitLight_(pdVar3,pos,size,type,f1,colb,colc);
    (pdVar3->header).ptr0x24 = pvVar2;
    return pdVar3;
  }
  CRASH(s_AllocDynamicLight_800de68c,s_Out_of_Dynamic_Lights_800de6a0);
}

void FreeDynamicLight(dynamic_light_struct *param_1,s16 param_2){
  void *pvVar1;
  u16 uVar2;
  
  pvVar1 = param_1->lights[param_2].header.ptr0x24;
  if (param_1->dynamicLightCount < 1) {CRASH("FreeDynamicLight","Trying to free too many lights!");}
  *(u16 *)((s32)pvVar1 + 4) = 0;
  *(u16 *)((s32)pvVar1 + 2) = 0;
  param_1->lights[param_2].header.Bitfeild = 0;
  uVar2 = param_1->dynamicLightCount - 1;
  param_1->dynamicLightCount = uVar2;
  *(s16 *)((s32)param_1->shortsB + ((s32)((u32)uVar2 << 0x10) >> 0xf)) = param_2;
  return;
}

void FUN_800556f4(dynamic_light_struct *param_1,s16 param_2){
  u16 *puVar1;
  s32 iVar2;
  void **ppvVar3;
  s32 iVar4;
  
  ppvVar3 = &param_1->lights[0].header.ptr0x24;
  iVar4 = 0x10000;
  do {
    puVar1 = (u16 *)*ppvVar3;
    if (puVar1[1] != 0) {
      if ((s16)puVar1[3] < 1) {
        if ((0 < (s16)puVar1[2]) &&
           (iVar2 = (u32)(u16)puVar1[2] - (s32)param_2, puVar1[2] = (s16)iVar2,
           iVar2 * 0x10000 < 1)) {
          FreeDynamicLight(param_1,*puVar1);
        }
      }
      else {
        iVar2 = (u32)(u16)puVar1[3] - (s32)param_2;
        puVar1[3] = (s16)iVar2;
        if (iVar2 * 0x10000 < 0) {puVar1[3] = 0;}
      }
    }
    iVar2 = iVar4 >> 0x10;
    ppvVar3 = ppvVar3 + 0x1b;
    iVar4 = iVar4 + 0x10000;
  } while (iVar2 < 0x10);
}

