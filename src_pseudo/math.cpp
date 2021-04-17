#define NORMALIZE_MIN 1.0E-6
#define TAU 6.2831855
#define dtor 0.017453

float vec2Length(Vec2 *X){
	return _sqrtf(X*[0] * X*[0] + X*[1] * X*[2]);
}

float vec3Length(Vec3 *X){
	return _sqrtf(X*[0] * X*[0] + X*[1] * X*[2] + X*[2] * X*[2]);
}

void Vec2_Sub(Vec2 *A,Vec2 *B,Vec2 *C){
	(*A)[0] = (*B)[0] - (*C)[0];
	(*A)[1] = (*B)[1] - (*C)[1];
	return;
}

void Vec3_Sub(Vec3 *A,Vec3 *B,Vec3 *C){
	(*A)[0] = (*B)[0] - (*C)[0];
	(*A)[1] = (*B)[1] - (*C)[1];
	(*A)[2] = (*B)[2] - (*C)[2];
	return;
}

void Vec4_Sub(Vec4 *A,Vec4 *B,Vec4 *C){
	(*A)[0] = (*B)[0] - (*C)[0];
	(*A)[1] = (*B)[1] - (*C)[1];
	(*A)[2] = (*B)[2] - (*C)[2];
	(*A)[3] = (*B)[3] - (*C)[3];
	return;
}

void Vec2_Sum(Vec2 *A,Vec2 *B,Vec2 *C){
	(*A)[0] = (*B)[0] + (*C)[0];
	(*A)[1] = (*B)[1] + (*C)[1];
	return;
}

void Vec3_Sum(Vec3 *A,Vec3 *B,Vec3 *C){
	(*A)[0] = (*B)[0] + (*C)[0];
	(*A)[1] = (*B)[1] + (*C)[1];
	(*A)[2] = (*B)[2] + (*C)[2];
	return;
}

void Vec4_Sum(Vec4 *A,Vec4 *B,Vec4 *C){
	(*A)[0] = (*B)[0] + (*C)[0];
	(*A)[1] = (*B)[1] + (*C)[1];
	(*A)[2] = (*B)[2] + (*C)[2];
	(*A)[3] = (*B)[3] + (*C)[3];
	return;
}

float get_vec2_proximity(Vec2 *A,Vec2 *B){
	Vec2 temp;

	Vec2_Sub((Vec2 *)temp,A,B);
	return vec2Length((Vec2 *)temp);
}

float get_vec3_proximity(Vec3 *A,Vec3 *B){
	Vec3 temp;

	Vec3_Sub((Vec3 *)temp,A,B);
	return vec3Length((Vec3 *)temp);
}

float vec2_scalar_product(Vec2 *A,Vec2 *B){
	return (*A)[0] * (*B)[0] + (*A)[1] * (*B)[1];
}

float vec3_scalar_product(Vec3 *A,Vec3 *B){
	return (*A)[0] * (*B)[0] + (*A)[1] * (*B)[1] + (*A)[2] * (*B)[2];
}

//my math ID'ing gets rusty here.
void some_vec3_math(vec3 *A,vec3 *B,vec3 *C){
	(*A)[0] = (*B)[1] * (*C)[2] - (*B)[2] * (*C)[1];
	(*A)[1] = (*B)[2] * (*C)[0] - (*B)[0] * (*C)[2];
	(*A)[2] = (*B)[0] * (*C)[1] - (*B)[1] * (*C)[0];
	return;
}

float vec2_normalize(Vec2 *X){
	float len = _sqrtf(X*[0] * X*[0] + X*[1] * X*[1]);
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
	(*X)[0] /=len;
	(*X)[1] /=len;
	return len;
}

float vec3_normalize(Vec3 *X){
	float len = _sqrtf(X*[0] * X*[0] + X*[1] * X*[1] + X*[2] * X*[2]);
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
	(*X)[0] /=len;
	(*X)[1] /=len;
	(*X)[2] /=len;
	return len;
}

float vec4_normalize(Vec4 *X){
	float len = _sqrtf(X*[0] * X*[0] + X*[1] * X*[1] + X*[2] * X*[2] + X*[2] * X*[2]);
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
	(*X)[0] = /=len;
	(*X)[1] = /=len;
	(*X)[2] = /=len;
	(*X)[3] = /=len;
	return len;
}

void some_vec3_math_sphere(vec3 *A,vec3 *B,vec3 *C,vec3 *D){
	vec3 TempA;
	vec3 TempB;

	Vec3_sub((vec3 *)TempA,B,C);
	Vec3_sub((vec3 *)TempB,B,D);
	some_vec3_math(A,(vec3 *)TempA,(vec3 *)TempB);
	vec3_normalize(A);
	return;
}

bool some_trig_func_2(Vec2 *A,Vec2 *B,float C){
  bool ret;
  float x = vec2_normalize(A);
  float y = vec2_normalize(B);
  float fVar1 = get_vec2_proximity(A,B);
  float fVar2 = __sinf(C);
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  Vec2 fStack192;
  Vec2 fStack128;
  
  if (fVar1 <= fVar2) {
    copyVec2(B,A);
    multiVec2(A,x);
    multiVec2(B,y);
    ret = true;
  }
  else {
    fVar6 = TAU - C;
    fVar1 = __sinf(fVar6);
    fVar3 = __cosf(C);
    fVar6 = __cosf(fVar6);
    fVar5 = (*A)[0];
    fVar4 = (*A)[1];
    fStack192[0] = fVar3 * fVar5 + fVar2 * fVar4;
    fStack192[1] = fVar3 * fVar4 - fVar2 * fVar5;
    fStack128[0] = fVar6 * fVar5 + fVar1 * fVar4;
    fStack128[1] = fVar6 * fVar4 - fVar1 * fVar5;
    fVar3 = get_vec2_proximity((Vec2 *)fStack192,B);
    fVar6 = get_vec2_proximity((Vec2 *)fStack128,B);
    fVar1 = fStack192[1];
    fVar2 = fStack192[0];
    if (fVar6 <= fVar3) {
      fVar1 = fStack128[1];
      fVar2 = fStack128[0];
    }
    (*A)[0] = fVar2 * x;
    (*A)[1] = fVar1 * x;
    multiVec2(B,y);
    ret = false;
  }
  return ret;
}

void func_800ab23c(vec3 *A,vec3 *B,float C){
  Vec2 fStack280;
  Vec2 fStack216;
  Vec2 fStack152;
  Vec2 fStack88;
  
  memset(fStack216,0,8);
  fStack280[0] = (*A)[0];
  fStack280[1] = (*A)[2];
  fStack216[0] = fStack280[0];
  fStack216[1] = fStack280[1];
  memset(fStack88,0,8);
  fStack152[0] = (*B)[0];
  fStack152[1] = (*B)[2];
  fStack88[0] = fStack152[0];
  fStack88[1] = fStack152[1];
  some_trig_func_2((Vec2 *)fStack280,(Vec2 *)fStack152,C);
  (*A)[0] = fStack280[0];
  (*A)[2] = fStack280[1];
  return;
}

void some_trig_func(Vec2 *A,float B){
  float A1 = (*A)[1];
  float A0 = (*A)[0];
  float fVar2 = B * dtor;
  float fVar1 = __sinf(fVar2);
  
  fVar2 = __cosf(fVar2);
  (*A)[0] = fVar2 * A0 + fVar1 * A1;
  (*A)[1] = fVar2 * A1 - fVar1 * A0;
  return;
}

void some_vec2Math(Vec2 *v2,float x,float y){
  float fVar1 = (*v2)[1];
  float fVar2 = (*v2)[0];
  (*v2)[0] = y * fVar2 + x * fVar1;
  (*v2)[1] = y * fVar1 - x * fVar2;
  return;
}

void func_800ab3cc(vec3 *X,float Y){
  Vec2 TempA;
  Vec2 TempB;
  
  memset(TempB,0,8);
  TempA[0] = (*X)[0];
  TempA[1] = (*X)[2];
  TempB[0] = TempA[0];
  TempB[1] = TempA[1];
  some_trig_func((Vec2 *)TempA,Y);
  setVec3(X,TempA[0],(*X)[1],TempA[1]);
  return;
}

void copyVec2(Vec2 *from,Vec2 *to){
  (*to)[0] = (*from)[0];
  (*to)[1] = (*from)[1];
  return;
}

void copyVec3(Vec3 *from,Vec3 *to){
  (*to)[0] = (*from)[0];
  (*to)[1] = (*from)[1];
  (*to)[2] = (*from)[2];
  return;
}

void copyVec4(Vec4 *from,Vec4 *to){
  (*to)[0] = (*from)[0];
  (*to)[1] = (*from)[1];
  (*to)[2] = (*from)[2];
  (*to)[3] = (*from)[3];
  return;
}

void negVec4(vec4 *x){
  (*x)[0] = -(*x)[0];
  (*x)[1] = -(*x)[1];
  (*x)[2] = -(*x)[2];
  (*x)[3] = -(*x)[3];
  return;
}

void multiVec2(Vec2 *v,float x){
  (*v)[0] *= x;
  (*v)[1] *= x;
  return;
}

void multiVec3(Vec3 *v,float x){
  (*v)[0] *= x;
  (*v)[1] *= x;
  (*v)[2] *= x;
  return;
}
void multiVec4(Vec4 *v,float x){
  (*v)[0] *= x;
  (*v)[1] *= x;
  (*v)[2] *= x;
  (*v)[3] *= x;
  return;
}

void setVec2(vec2 *v,float A,float B){
  (*v)[0] = A;
  (*v)[1] = B;
  return;
}

void setVec3(vec3 *v,float A,float B,float C){
  (*v)[0] = A;
  (*v)[1] = B;
  (*v)[2] = C;
  return;
}

void setVec4(vec4 *v,float A,float B,float C,float D){
  (*v)[0] = A;
  (*v)[1] = B;
  (*v)[2] = C;
  (*v)[3] = D;
  return;
}

float three_vec2_proximities(Vec2 *X,Vec2 *Y,Vec2 *Z){
  Vec2 TempA;
  Vec2 TempB;
  
  Vec2_Sub((Vec2 *)TempA,Y,X);
  vec2_normalize((Vec2 *)TempA);
  Vec2_Sub((Vec2 *)TempB,Z,X);
  vec2_normalize((Vec2 *)TempB);
  return (2.0f -
         ((TempA[0] - TempB[0]) * (TempA[0] - TempB[0]) +
         (TempA[1] - TempB[1]) * (TempA[1] - TempB[1]))) * 0.5f;
}

float func_800ab628(Vec2 *A,Vec2 *B,Vec2 *C){
  float X = three_vec2_proximities(A,B,C);
  
  X = 1.0f - X * X;
  if (X <= 0.0) X = -X;
  return _sqrtf(X);
}

float big_vec2_math_func(Vec2 *A,Vec2 *B,Vec2 *C){
  float fVar1;
  float x;
  float fVar2;
  float fVar3;
  Vec2 afStack304;
  Vec2 afStack240;
  Vec2 afStack176;
  Vec2 afStack112;
  
  Vec2_Sub((Vec2 *)afStack304,B,A);
  vec2_normalize((Vec2 *)afStack304);
  Vec2_Sub((Vec2 *)afStack240,C,A);
  vec2_normalize((Vec2 *)afStack240);
  fVar1 = get_vec2_proximity((Vec2 *)afStack304,(Vec2 *)afStack240);
  fVar3 = (2.0f - fVar1 * fVar1) * 0.5f;
  fVar1 = 1.0f - fVar3 * fVar3;
  if (fVar1 <= 0.0) fVar1 = -fVar1;
  x = _sqrtf(fVar1);
  multiVec2((Vec2 *)afStack304,100.0f);
  multiVec2((Vec2 *)afStack240,100.0f);
  copyVec2((Vec2 *)afStack304,(Vec2 *)afStack176);
  copyVec2((Vec2 *)afStack304,(Vec2 *)afStack112);
  some_vec2Math((Vec2 *)afStack176,x,fVar3);
  fVar1 = -x;
  some_vec2Math((Vec2 *)afStack112,fVar1,fVar3);
  fVar3 = get_vec2_proximity((Vec2 *)afStack176,(Vec2 *)afStack240);
  fVar2 = get_vec2_proximity((Vec2 *)afStack112,(Vec2 *)afStack240);
  if (fVar3 < fVar2) fVar1 = x;
  return fVar1;
}

float func_800ab7e4(vec3 *A,vec3 *B,vec3 *C){
  return ((((*A)[0] * (*B)[1] * (*C)[2] + (*A)[1] * (*B)[2] * (*C)[0] + (*A)[2] * (*B)[0] * (*C)[1]) - (*A)[2] * (*B)[1] * (*C)[0]) - (*A)[1] * (*B)[0] * (*C)[2]) - (*A)[0] * (*B)[2] * (*C)[1];
}

void func_800ab880(float (*A) [4] [4],float (*B) [4] [4]){
  float X;
  float Y;
  float Z;
  
  Z = (float)(1.0d / (double)((*A)[0][0]^2 + (*A)[0][1]^2 + (*A)[0][2]^2));
  (*B)[0][0] = (*A)[0][0] * Z;
  (*B)[1][0] = (*A)[0][1] * Z;
  (*B)[2][0] = (*A)[0][2] * Z;
  X = (float)(1.0d / (double)((*A)[1][0]^2 + (*A)[1][1]^3 + (*A)[1][2]^2));
  (*B)[0][1] = (*A)[1][0] * X;
  (*B)[1][1] = (*A)[1][1] * X;
  (*B)[2][1] = (*A)[1][2] * X;
  Y = (float)(1.0d / (double)((*A)[2][0]^2 + (*A)[2][1]^3 + (*A)[2][2]^2));
  (*B)[0][2] = (*A)[2][0] * Y;
  (*B)[1][2] = (*A)[2][1] * Y;
  (*B)[2][2] = (*A)[2][2] * Y;
  (*B)[3][0] = (-((*A)[0][0] * Z) * (*A)[3][0] - (*B)[1][0] * (*A)[3][1]) - (*B)[1][0] * (*A)[3][2];
  (*B)[3][1] = (-(*B)[0][1] * (*A)[3][0] - (*B)[1][1] * (*A)[3][1]) - (*B)[2][1] * (*A)[3][2];
  (*B)[0][3] = 0.0;
  (*B)[1][3] = 0.0;
  (*B)[2][3] = 0.0;
  (*B)[3][3] = 1.0f;
  (*B)[3][2] = (-(*B)[0][2] * (*A)[3][0] - (*B)[1][2] * (*A)[3][1]) - (*B)[2][2] * (*A)[3][2];
  return;
}

/*above interpreted from:
void FUN_800ab880(float (*A) [4] [4],float (*B) [4] [4])

{
  double dVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  
  dVar1 = 1.0d;
  fVar6 = (*A)[0];
  fVar3 = (*A)[1];
  fVar2 = (*A)[2];
  fVar5 = (*A)[1][0];
  fVar8 = (float)(1.0d / (double)(fVar6 * fVar6 + fVar3 * fVar3 + fVar2 * fVar2));
  fVar7 = (*A)[2][1];
  fVar3 = (*A)[1][1];
  fVar10 = (*A)[2][2];
  fVar4 = (*A)[2][0];
  fVar2 = (*A)[1][2];
  (*B)[0] = fVar6 * fVar8;
  fVar12 = (*A)[1] * fVar8;
  (*B)[1][0] = fVar12;
  fVar11 = (*A)[2] * fVar8;
  (*B)[2][0] = fVar11;
  fVar2 = (float)(dVar1 / (double)(fVar5 * fVar5 + fVar3 * fVar3 + fVar2 * fVar2));
  fVar5 = (*A)[1][0] * fVar2;
  (*B)[1] = fVar5;
  fVar9 = (*A)[1][1] * fVar2;
  (*B)[1][1] = fVar9;
  fVar2 = (*A)[1][2] * fVar2;
  (*B)[2][1] = fVar2;
  fVar3 = (float)(dVar1 / (double)(fVar4 * fVar4 + fVar7 * fVar7 + fVar10 * fVar10));
  fVar7 = (*A)[2][0] * fVar3;
  (*B)[2] = fVar7;
  fVar10 = (*A)[2][1] * fVar3;
  (*B)[1][2] = fVar10;
  fVar3 = (*A)[2][2] * fVar3;
  (*B)[2][2] = fVar3;
  (*B)[3][0] = (-(fVar6 * fVar8) * (*A)[3][0] - fVar12 * (*A)[3][1]) - fVar11 * (*A)[3][2];
  (*B)[3][1] = (-fVar5 * (*A)[3][0] - fVar9 * (*A)[3][1]) - fVar2 * (*A)[3][2];
  fVar2 = 1.0f;
  fVar5 = (*A)[3][0];
  fVar4 = (*A)[3][1];
  fVar6 = (*A)[3][2];
  (*B)[3] = 0.0;
  (*B)[1][3] = 0.0;
  (*B)[2][3] = 0.0;
  (*B)[3][3] = fVar2;
  (*B)[3][2] = (-fVar7 * fVar5 - fVar10 * fVar4) - fVar3 * fVar6;
  return;
}*/

float ofunc_sub_800aba2c(float *Arg0,byte Arg1,byte Arg2){
  float fVar1;
  float fVar2;
  float fVar3;
  
  if (Arg1 == 1) {
LAB_800abacc:
    if (Arg2 == 1) {
      fVar3 = -Arg0[2] * Arg0[6];
      fVar1 = Arg0[8];
      fVar2 = *Arg0;
LAB_800abb14:
      return fVar3 + fVar2 * fVar1;
    }
    if ((char)Arg2 < '\x02') {
      if (Arg2 == 0) {
        fVar3 = -Arg0[1] * Arg0[8];
        fVar1 = Arg0[7];
        fVar2 = Arg0[2];
        goto LAB_800abb14;
      }
    }
    else {
      if (Arg2 == 2) {
        fVar3 = -*Arg0 * Arg0[7];
        fVar1 = Arg0[6];
        fVar2 = Arg0[1];
        goto LAB_800abb14;
      }
    }
  }
  else {
    if (((char)Arg1 < '\x02') && (Arg1 == 0)) {
      if (Arg2 == 1) {
        fVar3 = Arg0[5] * Arg0[6];
        fVar1 = Arg0[8];
        fVar2 = Arg0[3];
        goto LAB_800aba8c;
      }
      if ((char)Arg2 < '\x02') {
        if (Arg2 == 0) {
          fVar3 = Arg0[4] * Arg0[8];
          fVar1 = Arg0[7];
          fVar2 = Arg0[5];
          goto LAB_800aba8c;
        }
      }
      else {
        if (Arg2 == 2) {
          fVar3 = Arg0[3] * Arg0[7];
          fVar1 = Arg0[6];
          fVar2 = Arg0[4];
          goto LAB_800aba8c;
        }
      }
      goto LAB_800abacc;
    }
  }
  if (Arg2 == 1) {
    fVar3 = Arg0[2] * Arg0[3];
    fVar1 = Arg0[5];
    fVar2 = *Arg0;
LAB_800aba8c:
    return fVar3 - fVar2 * fVar1;
  }
  if ((char)Arg2 < '\x02') {
    if (Arg2 == 0) {
      fVar3 = Arg0[1] * Arg0[5];
      fVar1 = Arg0[4];
      fVar2 = Arg0[2];
      goto LAB_800aba8c;
    }
    fVar2 = *Arg0;
  }
  else {
    fVar2 = *Arg0;
  }
  return fVar2 * Arg0[4] - Arg0[1] * Arg0[3];
}


float ofunc_sub_800abbbc(float *Arg0){
  return ((((*Arg0 * Arg0[4] * Arg0[8] - *Arg0 * Arg0[5] * Arg0[7]) +
           Arg0[1] * Arg0[5] * Arg0[6]) - Arg0[1] * Arg0[3] * Arg0[8]) +
         Arg0[2] * Arg0[3] * Arg0[7]) - Arg0[2] * Arg0[4] * Arg0[6];
}

void func_800abc38(undefined4 Arg0,float *Arg1){
  float fVar1;
  float fVar2;
  
  fVar1 = (float)ofunc_sub_800abbbc();
  fVar2 = fVar1;
  if (fVar1 < 0.0) {
    fVar2 = -fVar1;
  }
  if (1.0E-15d <= (double)fVar2) {
    fVar1 = (float)(1.0d / (double)fVar1);
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,0,0);
    *Arg1 = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,1,0);
    Arg1[1] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,2,0);
    Arg1[2] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,0,1);
    Arg1[3] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,1,1);
    Arg1[4] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,2,1);
    Arg1[5] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,0,2);
    Arg1[6] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,1,2);
    Arg1[7] = fVar2 * fVar1;
    fVar2 = (float)ofunc_sub_800aba2c(Arg0,2,2);
    Arg1[8] = fVar2 * fVar1;
  }
  return;
}


void ofunc_sub_800abd94(float (*Arg0) [4] [4],float (*Arg1) [4] [4],float (*Arg2) [4] [4]){
  (*Arg0)[0] =
       (*Arg1)[0] * (*Arg2)[0] + (*Arg1)[1][0] * (*Arg2)[1] +
       (*Arg1)[2][0] * (*Arg2)[2];
  (*Arg0)[1][0] =
       (*Arg1)[0] * (*Arg2)[1][0] + (*Arg1)[1][0] * (*Arg2)[1][1] +
       (*Arg1)[2][0] * (*Arg2)[1][2];
  (*Arg0)[2][0] =
       (*Arg1)[0] * (*Arg2)[2][0] + (*Arg1)[1][0] * (*Arg2)[2][1] +
       (*Arg1)[2][0] * (*Arg2)[2][2];
  (*Arg0)[3][0] =
       (*Arg1)[0] * (*Arg2)[3][0] + (*Arg1)[1][0] * (*Arg2)[3][1] +
       (*Arg1)[2][0] * (*Arg2)[3][2] + (*Arg1)[3][0];
  (*Arg0)[1] =
       (*Arg1)[1] * (*Arg2)[0] + (*Arg1)[1][1] * (*Arg2)[1] +
       (*Arg1)[2][1] * (*Arg2)[2];
  (*Arg0)[1][1] =
       (*Arg1)[1] * (*Arg2)[1][0] + (*Arg1)[1][1] * (*Arg2)[1][1] +
       (*Arg1)[2][1] * (*Arg2)[1][2];
  (*Arg0)[2][1] =
       (*Arg1)[1] * (*Arg2)[2][0] + (*Arg1)[1][1] * (*Arg2)[2][1] +
       (*Arg1)[2][1] * (*Arg2)[2][2];
  (*Arg0)[3][1] =
       (*Arg1)[1] * (*Arg2)[3][0] + (*Arg1)[1][1] * (*Arg2)[3][1] +
       (*Arg1)[2][1] * (*Arg2)[3][2] + (*Arg1)[3][1];
  (*Arg0)[2] =
       (*Arg1)[2] * (*Arg2)[0] + (*Arg1)[1][2] * (*Arg2)[1] +
       (*Arg1)[2][2] * (*Arg2)[2];
  (*Arg0)[1][2] =
       (*Arg1)[2] * (*Arg2)[1][0] + (*Arg1)[1][2] * (*Arg2)[1][1] +
       (*Arg1)[2][2] * (*Arg2)[1][2];
  (*Arg0)[2][2] =
       (*Arg1)[2] * (*Arg2)[2][0] + (*Arg1)[1][2] * (*Arg2)[2][1] +
       (*Arg1)[2][2] * (*Arg2)[2][2];
  (*Arg0)[3] = 0.0;
  (*Arg0)[1][3] = 0.0;
  (*Arg0)[2][3] = 0.0;
  (*Arg0)[3][3] = 1.0f;
  (*Arg0)[3][2] = (*Arg1)[2] * (*Arg2)[3][0] + (*Arg1)[1][2] * (*Arg2)[3][1] + (*Arg1)[2][2] * (*Arg2)[3][2] + (*Arg1)[3][2];
  return;
}

void some_matrix_func_1(float (*A) [4] [4],float (*B) [4] [4],float (*C) [4] [4]){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[2][0] * (*C)[2];
  (*A)[1][0] = (*B)[0] * (*C)[1][0] + (*B)[1][0] * (*C)[1][1] + (*B)[2][0] * (*C)[1][2];
  (*A)[2][0] = (*B)[0] * (*C)[2][0] + (*B)[1][0] * (*C)[2][1] + (*B)[2][0] * (*C)[2][2];
  (*A)[3][0] = (*B)[0] * (*C)[3][0] * (*B)[3] + (*B)[1][0] * (*C)[3][1] * (*B)[1][3] + (*B)[2][0] * (*C)[3][2] * (*B)[2][3] + (*B)[3][0];
  (*A)[1] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[1] + (*B)[2][1] * (*C)[2];
  (*A)[1][1] = (*B)[1] * (*C)[1][0] + (*B)[1][1] * (*C)[1][1] + (*B)[2][1] * (*C)[1][2];
  (*A)[2][1] = (*B)[1] * (*C)[2][0] + (*B)[1][1] * (*C)[2][1] + (*B)[2][1] * (*C)[2][2];
  (*A)[3][1] = (*B)[1] * (*C)[3][0] * (*B)[3] + (*B)[1][1] * (*C)[3][1] * (*B)[1][3] + (*B)[2][1] * (*C)[3][2] * (*B)[2][3] + (*B)[3][1];
  (*A)[2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[1] + (*B)[2][2] * (*C)[2];
  (*A)[1][2] = (*B)[2] * (*C)[1][0] + (*B)[1][2] * (*C)[1][1] + (*B)[2][2] * (*C)[1][2];
  (*A)[2][2] = (*B)[2] * (*C)[2][0] + (*B)[1][2] * (*C)[2][1] + (*B)[2][2] * (*C)[2][2];
  (*A)[3][2] = (*B)[2] * (*C)[3][0] * (*B)[3] + (*B)[1][2] * (*C)[3][1] * (*B)[1][3] + (*B)[2][2] * (*C)[3][2] * (*B)[2][3] + (*B)[3][2];
  (*A)[3] = (*B)[3] * (*C)[3];
  (*A)[1][3] = (*B)[1][3] * (*C)[1][3];
  (*A)[3][3] = 1.0f;
  (*A)[2][3] = (*C)[2][3] * (*C)[2][3];
  return;
}

void func_800ac2e8(float(*A)[4][4],float(*B)[4][4],float(*C)[4][4]){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[2][0] * (*C)[2];
  (*A)[1][0] = (*B)[0] * (*C)[1][0] + (*B)[1][0] * (*C)[1][1] + (*B)[2][0] * (*C)[1][2];
  (*A)[2][0] = (*B)[0] * (*C)[2][0] + (*B)[1][0] * (*C)[2][1] + (*B)[2][0] * (*C)[2][2];
  (*A)[1] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[1] + (*B)[2][1] * (*C)[2];
  (*A)[1][1] = (*B)[1] * (*C)[1][0] + (*B)[1][1] * (*C)[1][1] + (*B)[2][1] * (*C)[1][2];
  (*A)[2][1] = (*B)[1] * (*C)[2][0] + (*B)[1][1] * (*C)[2][1] + (*B)[2][1] * (*C)[2][2];
  (*A)[2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[1] + (*B)[2][2] * (*C)[2];
  (*A)[1][2] = (*B)[2] * (*C)[1][0] + (*B)[1][2] * (*C)[1][1] + (*B)[2][2] * (*C)[1][2];
  (*A)[2][2] = (*B)[2] * (*C)[2][0] + (*B)[1][2] * (*C)[2][1] + (*B)[2][2] * (*C)[2][2];
  return;
}

void some_oher_matrix_math(float(*A)[4][4],float(*B)[4][4],float(*C)[4][4]){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[2][0] * (*C)[2] + (*B)[3][0] * (*C)[3];
  (*A)[1][0] = (*B)[0] * (*C)[1][0] + (*B)[1][0] * (*C)[1][1] + (*B)[2][0] * (*C)[1][2] +
               (*B)[3][0] * (*C)[1][3];
  (*A)[2][0] = (*B)[0] * (*C)[2][0] + (*B)[1][0] * (*C)[2][1] + (*B)[2][0] * (*C)[2][2] +
               (*B)[3][0] * (*C)[2][3];
  (*A)[3][0] = (*B)[0] * (*C)[3][0] + (*B)[1][0] * (*C)[3][1] + (*B)[2][0] * (*C)[3][2] +
               (*B)[3][0] * (*C)[3][3];
  (*A)[1] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[1] + (*B)[2][1] * (*C)[2] + (*B)[3][1] * (*C)[3];
  (*A)[1][1] = (*B)[1] * (*C)[1][0] + (*B)[1][1] * (*C)[1][1] + (*B)[2][1] * (*C)[1][2] +
               (*B)[3][1] * (*C)[1][3];
  (*A)[2][1] = (*B)[1] * (*C)[2][0] + (*B)[1][1] * (*C)[2][1] + (*B)[2][1] * (*C)[2][2] +
               (*B)[3][1] * (*C)[2][3];
  (*A)[3][1] = (*B)[1] * (*C)[3][0] + (*B)[1][1] * (*C)[3][1] + (*B)[2][1] * (*C)[3][2] +
               (*B)[3][1] * (*C)[3][3];
  (*A)[2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[1] + (*B)[2][2] * (*C)[2] + (*B)[3][2] * (*C)[3];
  (*A)[1][2] = (*B)[2] * (*C)[1][0] + (*B)[1][2] * (*C)[1][1] + (*B)[2][2] * (*C)[1][2] +
               (*B)[3][2] * (*C)[1][3];
  (*A)[2][2] = (*B)[2] * (*C)[2][0] + (*B)[1][2] * (*C)[2][1] + (*B)[2][2] * (*C)[2][2] +
               (*B)[3][2] * (*C)[2][3];
  (*A)[3][2] = (*B)[2] * (*C)[3][0] + (*B)[1][2] * (*C)[3][1] + (*B)[2][2] * (*C)[3][2] +
               (*B)[3][2] * (*C)[3][3];
  (*A)[3] = (*B)[3] * (*C)[0] + (*B)[1][3] * (*C)[1] + (*B)[2][3] * (*C)[2] + (*B)[3][3] * (*C)[3];
  (*A)[1][3] = (*B)[3] * (*C)[1][0] + (*B)[1][3] * (*C)[1][1] + (*B)[2][3] * (*C)[1][2] +
               (*B)[3][3] * (*C)[1][3];
  (*A)[2][3] = (*B)[3] * (*C)[2][0] + (*B)[1][3] * (*C)[2][1] + (*B)[2][3] * (*C)[2][2] +
               (*B)[3][3] * (*C)[2][3];
  (*A)[3][3] = (*B)[3] * (*C)[3][0] + (*B)[1][3] * (*C)[3][1] + (*B)[2][3] * (*C)[3][2] +
               (*B)[3][3] * (*C)[3][3];
  return;
}

void Ofunc_800ac8a0(float(*A)[4][4],float(*B)[4][4],float(*C)[4][4]){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[3] + (*B)[2][0] * (*C)[1][2];
  (*A)[1] = (*B)[0] * (*C)[1] + (*B)[1][0] * (*C)[1][0] + (*B)[2][0] * (*C)[1][3];
  (*A)[2] = (*B)[0] * (*C)[2] + (*B)[1][0] * (*C)[1][1] + (*B)[2][0] * (*C)[2][0];
  (*A)[3] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[3] + (*B)[2][1] * (*C)[1][2];
  (*A)[1][0] = (*B)[1] * (*C)[1] + (*B)[1][1] * (*C)[1][0] + (*B)[2][1] * (*C)[1][3];
  (*A)[1][1] = (*B)[1] * (*C)[2] + (*B)[1][1] * (*C)[1][1] + (*B)[2][1] * (*C)[2][0];
  (*A)[1][2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[3] + (*B)[2][2] * (*C)[1][2];
  (*A)[1][3] = (*B)[2] * (*C)[1] + (*B)[1][2] * (*C)[1][0] + (*B)[2][2] * (*C)[1][3];
  (*A)[2][0] = (*B)[2] * (*C)[2] + (*B)[1][2] * (*C)[1][1] + (*B)[2][2] * (*C)[2][0];
  return;
}

void Ofunc_800aca54(vec3 *A,float(*B)[4][4],vec3 *C){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[2][0] * (*C)[2] + (*B)[3][0];
  (*A)[1] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[1] + (*B)[2][1] * (*C)[2] + (*B)[3][1];
  (*A)[2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[1] + (*B)[2][2] * (*C)[2] + (*B)[3][2];
  return;
}

void some_float_multi_math(vec3 *A,float (*B) [4] [4],vec3 *C){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[2][0] * (*C)[2];
  (*A)[1] = (*B)[1] * (*C)[0] + (*B)[1][1] * (*C)[1] + (*B)[2][1] * (*C)[2];
  (*A)[2] = (*B)[2] * (*C)[0] + (*B)[1][2] * (*C)[1] + (*B)[2][2] * (*C)[2];
  return;
}

void NOOP_800acb94(void){return;}
void NOOP_800ACB9C(void){return;}


void func_800acba4(float *param_1,uint *param_2){ //likely inacurate, but goes unused
  uint uVar1;
  uint uVar2;
  bool bVar3;
  float fVar4;
  float *pfVar5;
  uint *puVar6;
  int iVar7;
  int iVar8;
  
  fVar4 = 1.5258789E-5f;
  puVar6 = param_2 + 8;
  pfVar5 = param_1 + 2;
  iVar8 = 1;
  do {
    iVar7 = 1;
    do {
      uVar1 = *param_2;
      uVar2 = *puVar6;
      puVar6 = puVar6 + 1;
      param_2 = param_2 + 1;
      iVar7 = iVar7 + -1;
      *param_1 = (float)(uVar1 & 0xffff0000 | uVar2 >> 0x10) * fVar4;
      param_1 = param_1 + 2;
      *pfVar5 = (float)(uVar1 << 0x10 | uVar2 & 0xffff) * fVar4;
      pfVar5 = pfVar5 + 2;
    } while (-1 < iVar7);
    bVar3 = iVar8 < 4;
    iVar8 = iVar8 + 1;
  } while (bVar3);
  return;
}

void ofunc_sub_800acc40(float (*param_1) [4] [4],vec3 *param_2,float param_3){
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  
  fVar11 = param_3 * 0.5f;
  fVar6 = __cosf(fVar11);
  fVar7 = __sinf(fVar11);
  fVar9 = fVar7 * (*param_2)[0];
  fVar2 = (fVar9 + fVar9) * fVar6;
  fVar8 = fVar7 * (*param_2)[1];
  fVar3 = (fVar8 + fVar8) * fVar6;
  fVar7 = fVar7 * (*param_2)[2];
  fVar1 = (fVar7 + fVar7) * fVar6;
  fVar5 = (fVar9 + fVar9) * fVar8;
  fVar4 = (fVar8 + fVar8) * fVar7;
  fVar11 = (fVar7 + fVar7) * fVar9;
  fVar8 = fVar8 * fVar8;
  fVar7 = fVar7 * fVar7;
  fVar10 = fVar6 * fVar6 - fVar9 * fVar9;
  (*param_1)[2][2] = (fVar10 - fVar8) + fVar7;
  (*param_1)[0] = ((fVar6 * fVar6 + fVar9 * fVar9) - fVar8) - fVar7;
  (*param_1)[1][1] = (fVar10 + fVar8) - fVar7;
  (*param_1)[1][0] = fVar5 - fVar1;
  (*param_1)[2][0] = fVar11 + fVar3;
  (*param_1)[1] = fVar5 + fVar1;
  (*param_1)[2][1] = fVar4 - fVar2;
  (*param_1)[2] = fVar11 - fVar3;
  (*param_1)[1][2] = fVar4 + fVar2;
  return;
}

void Ofunc_800acd9c(float (*A)[4][4],vec3 *B){
  float len;
  vec3 v3Temp;
  
  v3Temp[0] = (*B)[0];
  v3Temp[1] = (*B)[1];
  v3Temp[2] = (*B)[2];
  len = vec3_normalize((vec3 *)v3Temp);
  ofunc_sub_800acc40(A,(vec3 *)v3Temp,len);
  (*A)[3][0] = 0.0;
  (*A)[3][1] = 0.0;
  (*A)[3][2] = 0.0;
  (*A)[3] = 0.0;
  (*A)[1][3] = 0.0;
  (*A)[2][3] = 0.0;
  (*A)[3][3] = 1.0f;
  return;
}

void ofunc_sub_800ace10(float (*A) [4] [4],float x,float y,float z){
  float cosx = __cosf(x*dtor);
  float cosy = __cosf(y*dtor);
  float cosz = __cosf(z*dtor);
  float sinx = __sinf(x*dtor);
  float siny = __sinf(y*dtor);
  float sinz = __sinf(z*dtor);

  (*A)[2][1] = -siny;
  (*A)[1][1] = cosy * cosz;
  (*A)[2][2] = cosx * cosy;
  (*A)[2][0] = sinx * cosy;
  (*A)[1] = cosy * sinz;
  (*A)[0] = cosx * cosz + sinx * siny * sinz;
  (*A)[1][0] = -cosx * sinz + sinx * siny * cosz;
  (*A)[2] = -sinx * cosz + cosx * siny * sinz;
  (*A)[1][2] = sinx * sinz + cosx * siny * cosz;
  return;
}

void func_800acf64(float (*A) [4] [4],int X,int Y,int Z){
  ofunc_sub_800ace10(A,(float)X,(float)Y,(float)Z);
  (*A)[3][0] = 0.0;
  (*A)[3][1] = 0.0;
  (*A)[3][2] = 0.0;
  (*A)[3] = 0.0;
  (*A)[1][3] = 0.0;
  (*A)[2][3] = 0.0;
  (*A)[3][3] = 1.0f;
  return;
}

void matrix_scale(float (*A) [4] [4],float x,float Y,float Z){
  (*A)[0] *= x;
  (*A)[1] *= x;
  (*A)[2] *= x;
  (*A)[1][0] *= Y;
  (*A)[1][1] *= Y;
  (*A)[1][2] *= Y;
  (*A)[2][0] *= Z;
  (*A)[2][1] *= Z;
  (*A)[2][2] *= Z;
  return;
}

void func_800ad028(float (*X) [4] [4]){
  float fVar9;
  float fVar11;
  float fVar12;

  fVar9 = (float)(1.0d / (double)_sqrtf((*X)[0][0]*(*X)[0][0] + (*X)[0][1]*(*X)[0][1] + (*X)[0][2]*(*X)[0][2]));
  fVar11 = (float)(1.0d / (double)_sqrtf((*X)[1][0]*(*X)[1][0] + (*X)[1][1]*(*X)[1][1] + (*X)[1][2]*(*X)[1][2]));
  fVar12 = (float)(1.0d / (double)_sqrtf((*X)[2][0](*X)[2][0] + (*X)[2][1*(*X)[2][1] + (*X)[2][2]*(*X)[2][2]));
  (*X)[0] *= fVar9;
  (*X)[1] *= fVar9;
  (*X)[2] *= fVar9;
  (*X)[1][0] *= fVar11;
  (*X)[1][1] *= fVar11;
  (*X)[1][2] *= fVar11;
  (*X)[2][0] *= fVar12;
  (*X)[2][1] *= fVar12;
  (*X)[2][2] *= fVar12;
  return;
}

void func_800ad174(float (*X) [4] [4],vec3 *A,vec3 *B,vec3 *C){
  float fVar1;
  float fVar2;
  float fVar3;
  vec3 V3temp;
  
  V3temp[0] = (*B)[0] - (*C)[0];
  V3temp[1] = (*B)[1] - (*C)[1];
  V3temp[2] = (*B)[2] - (*C)[2];
  fVar1 = vec3_scalar_product((vec3 *)V3temp,A);
  fVar2 = vec3_scalar_product(C,A);
  (*X)[0] = -(*C)[0] * (*A)[0] - fVar1;
  (*X)[1][0] = -(*C)[0] * (*A)[1];
  fVar3 = fVar1 + fVar2;
  (*X)[2][0] = -(*C)[0] * (*A)[2];
  (*X)[3][0] = (*C)[0] * fVar3;
  (*X)[1] = -(*C)[1] * (*A)[0];
  (*X)[1][1] = -(*C)[1] * (*A)[1] - fVar1;
  (*X)[2][1] = -(*C)[1] * (*A)[2];
  (*X)[3][1] = (*C)[1] * fVar3;
  (*X)[2] = -(*C)[2] * (*A)[0];
  (*X)[1][2] = -(*C)[2] * (*A)[1];
  (*X)[2][2] = -(*C)[2] * (*A)[2] - fVar1;
  (*X)[3][2] = (*C)[2] * fVar3;
  (*X)[3] = -(*A)[0];
  (*X)[1][3] = -(*A)[1];
  fVar1 = (*A)[2];
  (*X)[3][3] = fVar2;
  (*X)[2][3] = -fVar1;
  return;
}

void ofunc_sub_800ad30c(float *param_1,float *param_2,float *param_3){
  int iVar1;
  int iVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  int iVar7;
  int iVar8;
  float fVar9;
  
  iVar8 = 3;
  do {
    iVar2 = 3;
    pfVar3 = param_3;
    pfVar5 = param_1;
    do {
      fVar9 = 0.0;
      param_1 = pfVar5 + 1;
      iVar7 = 0x20000;
      do {
        pfVar4 = pfVar3;
        pfVar6 = param_2;
        iVar1 = iVar7 >> 0x10;
        fVar9 = fVar9 + *pfVar6 * *pfVar4;
        iVar7 = iVar7 + -0x10000;
        param_2 = pfVar6 + 1;
        pfVar3 = pfVar4 + 3;
      } while (iVar1 != 0);
      *pfVar5 = fVar9;
      param_2 = pfVar6 + -2;
      iVar2 = (iVar2 + -1) * 0x10000 >> 0x10;
      pfVar3 = pfVar4 + -5;
      pfVar5 = param_1;
    } while (iVar2 != 0);
    iVar8 = (iVar8 + -1) * 0x10000 >> 0x10;
    param_2 = pfVar6 + 1;
  } while (iVar8 != 0);
  return;
}


void func_800ad38c(vec3 *A,float (*B) [4] [4],vec3 *C){
  (*A)[0] = (*B)[0] * (*C)[0] + (*B)[1] * (*C)[1] + (*B)[2] * (*C)[2];
  (*A)[1] = (*B)[3] * (*C)[0] + (*B)[1][0] * (*C)[1] + (*B)[1][1] * (*C)[2];
  (*A)[2] = (*B)[1][2] * (*C)[0] + (*B)[1][3] * (*C)[1] + (*B)[2][0] * (*C)[2];
  return;
}

void func_800ad420(vec3 *A,vec3 *B,vec3 *C,vec3 *D){
  float fVar1;
  float fVar2;
  
  fVar1 = (*A)[0] * (*B)[0] + (*A)[1] * (*B)[1] + (*A)[2] * (*B)[2];
  fVar2 = (*B)[0] * fVar1;
  (*C)[0] = fVar2;
  (*C)[1] = (*B)[1] * fVar1;
  (*C)[2] = (*B)[2] * fVar1;
  (*D)[0] = (*A)[0] - fVar2;
  (*D)[1] = (*A)[1] - (*C)[1];
  (*D)[2] = (*A)[2] - (*C)[2];
  return;
}

void func_800ad49c(vec3 *A,vec3 *B){
  float fVar1 = vec3_scalar_product(A,B);
  fVar1 = -fVar1;
  (*B)[0] += (*A)[0] * fVar1;
  (*B)[1] += (*A)[1] * fVar1;
  (*B)[2] += (*A)[2] * fVar1;
  return;
}

void func_800ad50c(float (*A) [4] [4],float *B,float *C,float *D,float *E){//Again, probably very inaccurate, but unused.
  float fVar1;
  float fVar2;
  float (*paafVar3) [4] [4];
  float *pfVar4;
  float fVar5;
  float fStack376 [4] [4];
  float fStack312 [4] [4];
  float fStack248 [4] [4];
  float afStack184 [8];
  float fStack152;
  float fStack148;
  float fStack144;
  
  fVar5 = *B;
  fStack312[0][0] = *C;
  fStack376[0][0] = fVar5 * fStack312[0][0];
  fStack312[0][3] = C[1];
  fStack376[0][1] = fVar5 * fStack312[0][3];
  fStack312[1][2] = C[2];
  fStack376[0][2] = fVar5 * fStack312[1][2];
  fVar5 = B[1];
  fStack312[0][1] = *D;
  fStack376[0][3] = fVar5 * fStack312[0][1];
  fStack312[1][0] = D[1];
  fStack312[1][3] = D[2];
  fStack376[1][0] = fVar5 * fStack312[1][0];
  fStack376[1][1] = fVar5 * fStack312[1][3];
  fVar5 = B[2];
  fStack312[0][2] = *E;
  fStack376[1][2] = fVar5 * fStack312[0][2];
  fStack312[1][1] = E[1];
  fStack312[2][0] = E[2];
  fStack376[1][3] = fVar5 * fStack312[1][1];
  fStack376[2][0] = fVar5 * fStack312[2][0];
  ofunc_sub_800ad30c(fStack248,fStack312,fStack376);
  pfVar4 = afStack184;
  paafVar3 = A;
  do {
    fVar5 = (*paafVar3)[1];
    fVar1 = (*paafVar3)[2];
    fVar2 = (*paafVar3)[3];
    *pfVar4 = (*paafVar3)[0];
    pfVar4[1] = fVar5;
    pfVar4[2] = fVar1;
    pfVar4[3] = fVar2;
    paafVar3 = (float (*) [4] [4])(*paafVar3)[1];
    pfVar4 = pfVar4 + 4;
  } while (paafVar3 != A[1]);
  (*A)[1][0] = fStack248[0][0] * afStack184[4] + fStack248[0][1] * afStack184[5] +
               fStack248[0][2] * afStack184[6];
  (*A)[0] = fStack248[0][0] * afStack184[0] + fStack248[0][1] * afStack184[1] +
            fStack248[0][2] * afStack184[2];
  (*A)[1] = fStack248[0][3] * afStack184[0] + fStack248[1][0] * afStack184[1] +
            fStack248[1][1] * afStack184[2];
  (*A)[2][0] = fStack248[0][0] * fStack152 + fStack248[0][1] * fStack148 +
               fStack248[0][2] * fStack144;
  (*A)[2][1] = fStack248[0][3] * fStack152 + fStack248[1][0] * fStack148 +
               fStack248[1][1] * fStack144;
  (*A)[1][1] = fStack248[0][3] * afStack184[4] + fStack248[1][0] * afStack184[5] +
               fStack248[1][1] * afStack184[6];
  (*A)[2][2] = fStack248[1][2] * fStack152 + fStack248[1][3] * fStack148 +
               fStack248[2][0] * fStack144;
  (*A)[2] = fStack248[1][2] * afStack184[0] + fStack248[1][3] * afStack184[1] +
            fStack248[2][0] * afStack184[2];
  (*A)[1][2] = fStack248[1][2] * afStack184[4] + fStack248[1][3] * afStack184[5] +
               fStack248[2][0] * afStack184[6];
  return;
}


void func_800ad81c(float (*A) [4] [4],vec3 *B){
  vec3 V3TempA;
  vec3 V3TempB;
  
  V3TempB[0] = (*A)[2][0];
  V3TempB[1] = (*A)[2][1];
  V3TempB[2] = (*A)[2][2];
  some_vec3_math((vec3 *)V3TempA,B,(vec3 *)V3TempB);
  vec3_normalize((vec3 *)V3TempA);
  some_vec3_math((vec3 *)V3TempB,(vec3 *)V3TempA,B);
  (*A)[0] = V3TempA[0];
  (*A)[1] = V3TempA[1];
  (*A)[2] = V3TempA[2];
  (*A)[1][0] = (*B)[0];
  (*A)[1][1] = (*B)[1];
  (*A)[2][0] = V3TempB[0];
  (*A)[2][1] = V3TempB[1];
  (*A)[2][2] = V3TempB[2];
  (*A)[1][2] = (*B)[2];
  return;
}


u8 func_800ad8d8(float X){
  uint uVar1;
  uint uVar2;
  float fVar3;
  
  fVar3 = 1.0f;
  if ((double)X <= 1.0d) {
    fVar3 = X;
  }
  if ((double)fVar3 < (double)((ulonglong)1.0d & 0xffffffff00000000)) {
    fVar3 = 0.0;
  }
  uVar2 = ((uint)fVar3 >> 0x17 & 0xff) - 0x7f;
  if (uVar2 != 0) {
    uVar1 = ((uint)fVar3 & 0x7fffff | 0x800000) >> 0x10;
    if (-9 < (int)uVar2) {
      if ((int)uVar2 < 0) {
        uVar1 = uVar1 >> (uVar2 & 0x1f);
      }
      return (u8)uVar1;
    }
    return 0;
  }
  return 0xff;
}

void func_800ad974(float (*X) [4] [4],float A){
  float fVar2 =6.0f;
  float fVar3 = A*A;
  
  (*X)[0] = 0.0;
  (*X)[1] = 0.0;
  (*X)[2] = 0.0;
  (*X)[1][3] = 0.0;
  (*X)[2][2] = 0.0;
  (*X)[2][3] = 0.0;
  (*X)[3][1] = 0.0;
  (*X)[3][2] = 0.0;
  (*X)[3][3] = 0.0;
  (*X)[3] = 1.0f;
  fVar2 = fVar3 * A * fVar2;
  (*X)[1][2] = A;
  (*X)[1][1] = fVar3;
  (*X)[2][1] = fVar3 + fVar3;
  (*X)[1][0] = fVar3 * A;
  (*X)[2][0] = fVar2;
  (*X)[3][0] = fVar2;
  return;
}

void func_800ad9dc(vec4 *X,float (*Y) [4] [4],vec4 *Z){
  (*X)[0] = (*Y)[0] * (*Z)[0] + (*Y)[1][0] * (*Z)[1] + (*Y)[2][0] * (*Z)[2] + (*Y)[3][0] * (*Z)[3];
  (*X)[1] = (*Y)[1] * (*Z)[0] + (*Y)[1][1] * (*Z)[1] + (*Y)[2][1] * (*Z)[2] + (*Y)[3][1] * (*Z)[3];
  (*X)[2] = (*Y)[2] * (*Z)[0] + (*Y)[1][2] * (*Z)[1] + (*Y)[2][2] * (*Z)[2] + (*Y)[3][2] * (*Z)[3];
  (*X)[3] = (*Y)[3] * (*Z)[0] + (*Y)[1][3] * (*Z)[1] + (*Y)[2][3] * (*Z)[2] + (*Y)[3][3] * (*Z)[3];
  return;
}