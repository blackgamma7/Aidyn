#include "mathN64.h"
#include "stringN64.h"
//return length of vec2
float Vec2Length(vec2f *X){
	return  _sqrtf(SQ(X->x)+SQ(X->y));
}
//return length of vec3
float Vec3Length(vec3f *X){
	return _sqrtf(SQ(X->x)+SQ(X->y)+SQ(X->z));
}
//subtract A from b and store result in res
void Vec2Sub(vec2f *res,vec2f *A,vec2f *B){
  res->x = A->x - B->x;
  res->y = A->y - B->y;
  }
//subtract A from b and store result in res
void Vec3Sub(vec3f *res,vec3f *A,vec3f *B){
  res->x = A->x - B->x;
  res->y = A->y - B->y;
  res->z = A->z - B->z;
  }
//subtract A from b and store result in res
void Vec4Sub(vec4f *res,vec4f *a,vec4f *b){
  res->x = a->x - b->x;
  res->y = a->y - b->y;
  res->z = a->z - b->z;
  res->w = a->w - b->w;
}
//add A and b and store result in res
void Vec2Sum(vec2f *res,vec2f *a,vec2f *b){
  res->x = a->x + b->x;
  res->y = a->y + b->y;
  }
//add A and b and store result in res
void Vec3Sum(vec3f *res,vec3f *a,vec3f *b){
  res->x = a->x + b->x;
  res->y = a->y + b->y;
  res->z = a->z + b->z;
  }
//add A and b and store result in res
void Vec4Sum(vec4f *res,vec4f *a,vec4f *b){
  res->x = a->x + b->x;
  res->y = a->y + b->y;
  res->z = a->z + b->z;
  res->w = a->w + b->w;
  }
//return distance between a and b
float Vec2Dist(vec2f *A,vec2f *B){
	vec2f temp;

	Vec2Sub(&temp,A,B);
	return Vec2Length(&temp);}
//return distance between a and b
float Vec3Dist(vec3f *A,vec3f *B){
	vec3f temp;

	Vec3Sub(&temp,A,B);
	return Vec3Length(&temp);}
//return dot product of a and b
float Vec2Dot(vec2f *A,vec2f *B){
	return A->x * B->x + A->y * B->y;}
//return dot product of a and b
float Vec3Dot(vec3f *A,vec3f *B){
	return A->x * B->x + A->y * B->y + A->z * B->z;
}
//store cross product of A and b in res
void Vec3Cross(vec3f *res,vec3f *A,vec3f *B){
  res->x = A->y * B->z - A->z * B->y;
  res->y = A->z * B->x - A->x * B->z;
  res->z = A->x * B->y - A->y * B->x;}
//normalize vector and return length (or 1e-6)
float Vec2Normalize(vec2f *X){
	float len = _sqrtf(SQ(X->x)+SQ(X->y));
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
	X->x /=len;
	X->y /=len;
	return len;
}
//normalize vector and return length (or 1e-6)
float Vec3Normalize(vec3f *X){
	float len = _sqrtf(SQ(X->x)+SQ(X->y)+SQ(X->z));
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
  X->x /= len;
  X->y /= len;
  X->z /= len;
	return len;
}
//normalize vector and return length (or 1e-6)
float Vec4Normalize(vec4f *X){
	float len = _sqrtf(SQ(X->x)+SQ(X->y)+SQ(X->z)+SQ(X->w));
	if(len < NORMALIZE_MIN) len = NORMALIZE_MIN;
  X->x /= len;
  X->y /= len;
  X->z /= len;
  X->w /= len;
	return len;
}
//use points B C D to create a normal stored in A
float NormalizeTri(vec3f *A,vec3f *B,vec3f *C,vec3f *D){
	vec3f TempA;
	vec3f TempB;

	Vec3Sub(&TempA,B,C);
	Vec3Sub(&TempB,B,D);
	Vec3Cross(A,&TempA,&TempB);
	return Vec3Normalize(A);
}
//please identify purpose of function.
int some_trig_func_2(vec2f *A,vec2f *B,float C){
  float x = Vec2Normalize(A);
  float y = Vec2Normalize(B);
  float fVar1;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  vec2f fStack192;
  vec2f fStack128;
  float fVar2 = __sinf(C);
  if (Vec2Dist(A,B) <= fVar2) {
    Vec2Copy(B,A);
    Vec2Scale(A,x);
    Vec2Scale(B,y);
    return true;
  }
  else {
    fVar1 = __sinf(TAU - C);
    fVar3 = __cosf(C);
    fVar6 = __cosf(TAU - C);
    fStack192.x = fVar3 * A->x + fVar2 * A->y;
    fStack192.y = fVar3 * A->y - fVar2 * A->x;
    fStack128.x = fVar6 * A->x + fVar1 * A->y;
    fStack128.y = fVar6 * A->y - fVar1 * A->x;
    fVar3 = Vec2Dist(&fStack192,B);
    fVar6 = Vec2Dist(&fStack128,B);
    fVar1 = fStack192.y;
    fVar2 = fStack192.x;
    if (fVar6 <= fVar3) {
      fVar1 = fStack128.y;
      fVar2 = fStack128.x;
    }
    A->x = fVar2 * x;
    A->y = fVar1 * x;
    Vec2Scale(B,y);
    return false;
  }
}
//please identify purpose of function.
void FUN_800ab23c(vec3f *A,vec3f *B,float C){
  vec2f V2D;
  vec2f v2A;
  vec2f v2C;
  vec2f v2B;
  
  CLEAR(&v2A);
  V2D.x = A->x;
  V2D.y = A->z;
  v2A.x = V2D.x;
  v2A.y = V2D.y;
  CLEAR(&v2B);
  v2C.x = B->x;
  v2C.y = B->z;
  v2B.x = v2C.x;
  v2B.y = v2C.y;
  some_trig_func_2(&V2D,&v2C,C);
  A->x = V2D.x;
  A->z = V2D.y;}
//rotate Vec2 A by B degrees
void Vec2Rot(vec2f *A,float B){
  float A1 = A->y;
  float A0 = A->x;
  float sin = __sinf(B * dtor);
  float cos = __cosf(B * dtor);
  A->x = cos * A0 + sin * A1;
  A->y = cos * A1 - sin * A0;}
//please identify purpose of function.
void some_vec2Math(vec2f *v2,float x,float y){
  float fVar1 = v2->y;
  float fVar2 = v2->x;
  v2->x = y * fVar2 + x * fVar1;
  v2->y = y * fVar1 - x * fVar2;}

//please identify purpose of function.
void Ofunc_800ab3cc(vec3f *X,float Y){
  vec2f TempA;
  vec2f TempB;
  
  CLEAR(&TempB);
  TempA.x = X->x;
  TempA.y = X->z;
  TempB.x = TempA.x;
  TempB.y = TempA.y;
  Vec2Rot(&TempA,Y);
  Vec3Set(X,TempA.x,X->y,TempA.y);}
//copy "from" to "to".
void Vec2Copy(vec2f *from,vec2f *to){
  to->x = from->x;
  to->y = from->y;}
//copy "from" to "to".
void Vec3Copy(vec3f *from,vec3f *to){
  to->x = from->x;
  to->y = from->y;
  to->z = from->z;}
//copy "from" to "to".
void Vec4Copy(vec4f *from,vec4f *to){
  to->x = from->x;
  to->y = from->y;
  to->z = from->z;
  to->w = from->w;}
//invert values of vec4. (used for one function)
void Vec4Neg(vec4f *v){
  v->x = -v->x;
  v->y = -v->y;
  v->z = -v->z;
  v->w = -v->w;}
//scale v by x
void Vec2Scale(vec2f *v,float x){
  v->x *= x;
  v->y *= x;}
//scale v by x
void Vec3Scale(vec3f *v,float x){
  v->x *= x;
  v->y *= x;
  v->z *= x;}
//scale v by x
void Vec4Scale(vec4f *v,float x){
  v->x *= x;
  v->y *= x;
  v->z *= x;
  v->w *= x;}
//set values of vec2
void Vec2Set(vec2f *v,float x,float y){
  v->x = x;
  v->y = y;}
//set values of vec3
void Vec3Set(vec3f *v,float x,float y,float z){
  v->x = x;
  v->y = y;
  v->z = z;}
//set values of vec4
void Vec4Set(vec4f *v,float x,float y,float z,float w){
  v->x = x;
  v->y = y;
  v->z = z;
  v->w = w;}
//please identify purpose of function.
float three_vec2_proximities(vec2f *X,vec2f *Y,vec2f *Z){
  vec2f TempA;
  vec2f TempB;
  
  Vec2Sub(&TempA,Y,X);
  Vec2Normalize(&TempA);
  Vec2Sub(&TempB,Z,X);
  Vec2Normalize(&TempB);
  return (2.0f -
         ((TempA.x - TempB.x) * (TempA.x - TempB.x) +
         (TempA.y - TempB.y) * (TempA.y - TempB.y))) * 0.5f;}
//please identify purpose of function.
float FUN_800ab628(vec2f *A,vec2f *B,vec2f *C){
  float X = three_vec2_proximities(A,B,C);
  
  X = 1.0f - X * X;
  if (X <= 0.0) X = -X;
  return _sqrtf(X);}
//please identify purpose of function.
float big_vec2_math_func(vec2f *A,vec2f *B,vec2f *C){
  float fVar1;
  float x;
  float fVar2;
  float fVar3;
  vec2f afStack304;
  vec2f afStack240;
  vec2f afStack176;
  vec2f afStack112;
  
  Vec2Sub(&afStack304,B,A);
  Vec2Normalize(&afStack304);
  Vec2Sub(&afStack240,C,A);
  Vec2Normalize(&afStack240);
  fVar1 = Vec2Dist(&afStack304,&afStack240);
  fVar3 = (2.0f - SQ(fVar1)) * 0.5f;
  fVar1 = 1.0f - SQ(fVar3);
  if (fVar1 <= 0.0) fVar1 = -fVar1;
  x = _sqrtf(fVar1);
  Vec2Scale(&afStack304,100.0);
  Vec2Scale(&afStack240,100.0);
  Vec2Copy(&afStack304,&afStack176);
  Vec2Copy(&afStack304,&afStack112);
  some_vec2Math(&afStack176,x,fVar3);
  fVar1 = -x;
  some_vec2Math(&afStack112,fVar1,fVar3);
  if (Vec2Dist(&afStack176,&afStack240) < Vec2Dist(&afStack112,&afStack240)) {
    fVar1 = x;
  }
  return fVar1;
}
//please identify purpose of function.
float Ofunc_800ab7e4(vec3f *A,vec3f *B,vec3f *C){
  return (((A->x * B->y * C->z + A->y * B->z * C->x + A->z * B->x * C->y) - A->z * B->y * C->x) -
         A->y * B->x * C->z) - A->x * B->z * C->y;
}
//please identify purpose of function.
void FUN_800ab880(MtxF *A,MtxF *B){
  float X;
  float Y;
  float Z;
  
  Z = (float)(1.0 / (double)(SQ((*A)[0][0]) + SQ((*A)[0][1]) + SQ((*A)[0][2])));
  (*B)[0][0] = (*A)[0][0] * Z;
  (*B)[1][0] = (*A)[0][1] * Z;
  (*B)[2][0] = (*A)[0][2] * Z;
  X = (float)(1.0 / (double)(SQ((*A)[1][0]) + SQ((*A)[1][1]) + SQ((*A)[1][2])));
  (*B)[0][1] = (*A)[1][0] * X;
  (*B)[1][1] = (*A)[1][1] * X;
  (*B)[2][1] = (*A)[1][2] * X;
  Y = (float)(1.0 / (double)(SQ((*A)[2][0]) + SQ((*A)[2][1]) + SQ((*A)[2][2])));
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
}
//please identify purpose of function.
float ofunc_sub_800aba2c(MtxF *param_1,u8 param_2,s8 param_3){
  float fVar1;
  float fVar2;
  float fVar3;
  
  if (param_2 == 1) {
LAB_800abacc:
    if (param_3 == 1) {
      fVar3 = -(*param_1)[0][2] * (*param_1)[1][2];
      fVar1 = (*param_1)[2][0];
      fVar2 = (*param_1)[0][0];
LAB_800abb14:
      return fVar3 + fVar2 * fVar1;
    }
    if (param_3 < 2) {
      if (param_3 == 0) {
        fVar3 = -(*param_1)[0][1] * (*param_1)[2][0];
        fVar1 = (*param_1)[1][3];
        fVar2 = (*param_1)[0][2];
        goto LAB_800abb14;
      }
    }
    else if (param_3 == 2) {
      fVar3 = -(*param_1)[0][0] * (*param_1)[1][3];
      fVar1 = (*param_1)[1][2];
      fVar2 = (*param_1)[0][1];
      goto LAB_800abb14;
    }
  }
  else if (((char)param_2 < 2) && (param_2 == 0)) {
    if (param_3 == 1) {
      fVar3 = (*param_1)[1][1] * (*param_1)[1][2];
      fVar1 = (*param_1)[2][0];
      fVar2 = (*param_1)[0][3];
      goto LAB_800aba8c;
    }
    if (param_3 < 2) {
      if (param_3 == 0) {
        fVar3 = (*param_1)[1][0] * (*param_1)[2][0];
        fVar1 = (*param_1)[1][3];
        fVar2 = (*param_1)[1][1];
        goto LAB_800aba8c;
      }
    }
    else if (param_3 == 2) {
      fVar3 = (*param_1)[0][3] * (*param_1)[1][3];
      fVar1 = (*param_1)[1][2];
      fVar2 = (*param_1)[1][0];
      goto LAB_800aba8c;
    }
    goto LAB_800abacc;
  }
  if (param_3 == 1) {
    fVar3 = (*param_1)[0][2] * (*param_1)[0][3];
    fVar1 = (*param_1)[1][1];
    fVar2 = (*param_1)[0][0];
LAB_800aba8c:
    return fVar3 - fVar2 * fVar1;
  }
  if (param_3 < 2) {
    if (param_3 == 0) {
      fVar3 = (*param_1)[0][1] * (*param_1)[1][1];
      fVar1 = (*param_1)[1][0];
      fVar2 = (*param_1)[0][2];
      goto LAB_800aba8c;
    }
    fVar2 = (*param_1)[0][0];
  }
  else {
    fVar2 = (*param_1)[0][0];
  }
  return fVar2 * (*param_1)[1][0] - (*param_1)[0][1] * (*param_1)[0][3];
}
//please identify purpose of function.
float ofunc_sub_800abbbc(float *Arg0){
  return ((((*Arg0 * Arg0[4] * Arg0[8] - *Arg0 * Arg0[5] * Arg0[7]) +
           Arg0[1] * Arg0[5] * Arg0[6]) - Arg0[1] * Arg0[3] * Arg0[8]) +
         Arg0[2] * Arg0[3] * Arg0[7]) - Arg0[2] * Arg0[4] * Arg0[6];
}
//please identify purpose of function.
void Ofunc_800abc38(MtxF *param_1,float *param_2){
  float fVar1;
  float fVar2;
  
  fVar1 = ofunc_sub_800abbbc(param_1);
  fVar2 = fVar1;
  if (fVar1 < 0.0) fVar2 = -fVar1;
  if ((double)1.0E-15 <= (double)fVar2) {
    fVar1 = (float)((double)1.0 / (double)fVar1);
    *param_2 = ofunc_sub_800aba2c(param_1,0,0) * fVar1;
    param_2[1] = ofunc_sub_800aba2c(param_1,1,0) * fVar1;
    param_2[2] = ofunc_sub_800aba2c(param_1,2,0) * fVar1;
    param_2[3] = ofunc_sub_800aba2c(param_1,0,1) * fVar1;
    param_2[4] = ofunc_sub_800aba2c(param_1,1,1) * fVar1;
    param_2[5] = ofunc_sub_800aba2c(param_1,2,1) * fVar1;
    param_2[6] = ofunc_sub_800aba2c(param_1,0,2) * fVar1;
    param_2[7] = ofunc_sub_800aba2c(param_1,1,2) * fVar1;
    param_2[8] = ofunc_sub_800aba2c(param_1,2,2) * fVar1;
  }
}

//please identify purpose of function.
void ofunc_sub_800abd94(MtxF *res,MtxF *A,MtxF *B){
  (*res)[0][0] = (*A)[0][0] * (*B)[0][0] + (*A)[1][0] * (*B)[0][1] + (*A)[2][0] * (*B)[0][2];
  (*res)[1][0] = (*A)[0][0] * (*B)[1][0] + (*A)[1][0] * (*B)[1][1] + (*A)[2][0] * (*B)[1][2];
  (*res)[2][0] = (*A)[0][0] * (*B)[2][0] + (*A)[1][0] * (*B)[2][1] + (*A)[2][0] * (*B)[2][2];
  (*res)[3][0] = (*A)[0][0] * (*B)[3][0] + (*A)[1][0] * (*B)[3][1] + (*A)[2][0] * (*B)[3][2] +
                 (*A)[3][0];
  (*res)[0][1] = (*A)[0][1] * (*B)[0][0] + (*A)[1][1] * (*B)[0][1] + (*A)[2][1] * (*B)[0][2];
  (*res)[1][1] = (*A)[0][1] * (*B)[1][0] + (*A)[1][1] * (*B)[1][1] + (*A)[2][1] * (*B)[1][2];
  (*res)[2][1] = (*A)[0][1] * (*B)[2][0] + (*A)[1][1] * (*B)[2][1] + (*A)[2][1] * (*B)[2][2];
  (*res)[3][1] = (*A)[0][1] * (*B)[3][0] + (*A)[1][1] * (*B)[3][1] + (*A)[2][1] * (*B)[3][2] +
                 (*A)[3][1];
  (*res)[0][2] = (*A)[0][2] * (*B)[0][0] + (*A)[1][2] * (*B)[0][1] + (*A)[2][2] * (*B)[0][2];
  (*res)[1][2] = (*A)[0][2] * (*B)[1][0] + (*A)[1][2] * (*B)[1][1] + (*A)[2][2] * (*B)[1][2];
  (*res)[2][2] = (*A)[0][2] * (*B)[2][0] + (*A)[1][2] * (*B)[2][1] + (*A)[2][2] * (*B)[2][2];
  (*res)[0][3] = 0.0;
  (*res)[1][3] = 0.0;
  (*res)[2][3] = 0.0;
  (*res)[3][3] = 1.0;
  (*res)[3][2] = (*A)[0][2] * (*B)[3][0] + (*A)[1][2] * (*B)[3][1] + (*A)[2][2] * (*B)[3][2] + (*A)[3][2];
}
//please identify purpose of function.
void some_matrix_func_1(MtxF *res,MtxF *a,MtxF *b){
  (*res)[0][0] = (*a)[0][0] * (*b)[0][0] + (*a)[1][0] * (*b)[0][1] + (*a)[2][0] * (*b)[0][2];
  (*res)[1][0] = (*a)[0][0] * (*b)[1][0] + (*a)[1][0] * (*b)[1][1] + (*a)[2][0] * (*b)[1][2];
  (*res)[2][0] = (*a)[0][0] * (*b)[2][0] + (*a)[1][0] * (*b)[2][1] + (*a)[2][0] * (*b)[2][2];
  (*res)[3][0] = (*a)[0][0] * (*b)[3][0] * (*a)[0][3] + (*a)[1][0] * (*b)[3][1] * (*a)[1][3] +
                 (*a)[2][0] * (*b)[3][2] * (*a)[2][3] + (*a)[3][0];
  (*res)[0][1] = (*a)[0][1] * (*b)[0][0] + (*a)[1][1] * (*b)[0][1] + (*a)[2][1] * (*b)[0][2];
  (*res)[1][1] = (*a)[0][1] * (*b)[1][0] + (*a)[1][1] * (*b)[1][1] + (*a)[2][1] * (*b)[1][2];
  (*res)[2][1] = (*a)[0][1] * (*b)[2][0] + (*a)[1][1] * (*b)[2][1] + (*a)[2][1] * (*b)[2][2];
  (*res)[3][1] = (*a)[0][1] * (*b)[3][0] * (*a)[0][3] + (*a)[1][1] * (*b)[3][1] * (*a)[1][3] +
                 (*a)[2][1] * (*b)[3][2] * (*a)[2][3] + (*a)[3][1];
  (*res)[0][2] = (*a)[0][2] * (*b)[0][0] + (*a)[1][2] * (*b)[0][1] + (*a)[2][2] * (*b)[0][2];
  (*res)[1][2] = (*a)[0][2] * (*b)[1][0] + (*a)[1][2] * (*b)[1][1] + (*a)[2][2] * (*b)[1][2];
  (*res)[2][2] = (*a)[0][2] * (*b)[2][0] + (*a)[1][2] * (*b)[2][1] + (*a)[2][2] * (*b)[2][2];
  (*res)[3][2] = (*a)[0][2] * (*b)[3][0] * (*a)[0][3] + (*a)[1][2] * (*b)[3][1] * (*a)[1][3] +
                 (*a)[2][2] * (*b)[3][2] * (*a)[2][3] + (*a)[3][2];
  (*res)[0][3] = (*a)[0][3] * (*b)[0][3];
  (*res)[1][3] = (*a)[1][3] * (*b)[1][3];
  (*res)[3][3] = 1.0f;
  (*res)[2][3] = (*a)[2][3] * (*b)[2][3];
}

//please identify purpose of function.
void FUN_800ac2e8(MtxF *res,MtxF *A,MtxF *B){
  (*res)[0][0] = (*A)[0][0] * (*B)[0][0] + (*A)[1][0] * (*B)[0][1] + (*A)[2][0] * (*B)[0][2];
  (*res)[1][0] = (*A)[0][0] * (*B)[1][0] + (*A)[1][0] * (*B)[1][1] + (*A)[2][0] * (*B)[1][2];
  (*res)[2][0] = (*A)[0][0] * (*B)[2][0] + (*A)[1][0] * (*B)[2][1] + (*A)[2][0] * (*B)[2][2];
  (*res)[0][1] = (*A)[0][1] * (*B)[0][0] + (*A)[1][1] * (*B)[0][1] + (*A)[2][1] * (*B)[0][2];
  (*res)[1][1] = (*A)[0][1] * (*B)[1][0] + (*A)[1][1] * (*B)[1][1] + (*A)[2][1] * (*B)[1][2];
  (*res)[2][1] = (*A)[0][1] * (*B)[2][0] + (*A)[1][1] * (*B)[2][1] + (*A)[2][1] * (*B)[2][2];
  (*res)[0][2] = (*A)[0][2] * (*B)[0][0] + (*A)[1][2] * (*B)[0][1] + (*A)[2][2] * (*B)[0][2];
  (*res)[1][2] = (*A)[0][2] * (*B)[1][0] + (*A)[1][2] * (*B)[1][1] + (*A)[2][2] * (*B)[1][2];
  (*res)[2][2] = (*A)[0][2] * (*B)[2][0] + (*A)[1][2] * (*B)[2][1] + (*A)[2][2] * (*B)[2][2];
}

//please identify purpose of function.
void some_other_matrix_math(MtxF *res,MtxF *A,MtxF *B){
  (*res)[0][0] = (*A)[0][0] * (*B)[0][0] + (*A)[1][0] * (*B)[0][1] + (*A)[2][0] * (*B)[0][2] +
                 (*A)[3][0] * (*B)[0][3];
  (*res)[1][0] = (*A)[0][0] * (*B)[1][0] + (*A)[1][0] * (*B)[1][1] + (*A)[2][0] * (*B)[1][2] +
                 (*A)[3][0] * (*B)[1][3];
  (*res)[2][0] = (*A)[0][0] * (*B)[2][0] + (*A)[1][0] * (*B)[2][1] + (*A)[2][0] * (*B)[2][2] +
                 (*A)[3][0] * (*B)[2][3];
  (*res)[3][0] = (*A)[0][0] * (*B)[3][0] + (*A)[1][0] * (*B)[3][1] + (*A)[2][0] * (*B)[3][2] +
                 (*A)[3][0] * (*B)[3][3];
  (*res)[0][1] = (*A)[0][1] * (*B)[0][0] + (*A)[1][1] * (*B)[0][1] + (*A)[2][1] * (*B)[0][2] +
                 (*A)[3][1] * (*B)[0][3];
  (*res)[1][1] = (*A)[0][1] * (*B)[1][0] + (*A)[1][1] * (*B)[1][1] + (*A)[2][1] * (*B)[1][2] +
                 (*A)[3][1] * (*B)[1][3];
  (*res)[2][1] = (*A)[0][1] * (*B)[2][0] + (*A)[1][1] * (*B)[2][1] + (*A)[2][1] * (*B)[2][2] +
                 (*A)[3][1] * (*B)[2][3];
  (*res)[3][1] = (*A)[0][1] * (*B)[3][0] + (*A)[1][1] * (*B)[3][1] + (*A)[2][1] * (*B)[3][2] +
                 (*A)[3][1] * (*B)[3][3];
  (*res)[0][2] = (*A)[0][2] * (*B)[0][0] + (*A)[1][2] * (*B)[0][1] + (*A)[2][2] * (*B)[0][2] +
                 (*A)[3][2] * (*B)[0][3];
  (*res)[1][2] = (*A)[0][2] * (*B)[1][0] + (*A)[1][2] * (*B)[1][1] + (*A)[2][2] * (*B)[1][2] +
                 (*A)[3][2] * (*B)[1][3];
  (*res)[2][2] = (*A)[0][2] * (*B)[2][0] + (*A)[1][2] * (*B)[2][1] + (*A)[2][2] * (*B)[2][2] +
                 (*A)[3][2] * (*B)[2][3];
  (*res)[3][2] = (*A)[0][2] * (*B)[3][0] + (*A)[1][2] * (*B)[3][1] + (*A)[2][2] * (*B)[3][2] +
                 (*A)[3][2] * (*B)[3][3];
  (*res)[0][3] = (*A)[0][3] * (*B)[0][0] + (*A)[1][3] * (*B)[0][1] + (*A)[2][3] * (*B)[0][2] +
                 (*A)[3][3] * (*B)[0][3];
  (*res)[1][3] = (*A)[0][3] * (*B)[1][0] + (*A)[1][3] * (*B)[1][1] + (*A)[2][3] * (*B)[1][2] +
                 (*A)[3][3] * (*B)[1][3];
  (*res)[2][3] = (*A)[0][3] * (*B)[2][0] + (*A)[1][3] * (*B)[2][1] + (*A)[2][3] * (*B)[2][2] +
                 (*A)[3][3] * (*B)[2][3];
  (*res)[3][3] = (*A)[0][3] * (*B)[3][0] + (*A)[1][3] * (*B)[3][1] + (*A)[2][3] * (*B)[3][2] +
                 (*A)[3][3] * (*B)[3][3];
}
//please identify purpose of function.
void Ofunc_800ac8a0(MtxF *res,MtxF *A,MtxF *B){
  (*res)[0][0] = (*A)[0][0] * (*B)[0][0] + (*A)[1][0] * (*B)[0][3] + (*A)[2][0] * (*B)[1][2];
  (*res)[0][1] = (*A)[0][0] * (*B)[0][1] + (*A)[1][0] * (*B)[1][0] + (*A)[2][0] * (*B)[1][3];
  (*res)[0][2] = (*A)[0][0] * (*B)[0][2] + (*A)[1][0] * (*B)[1][1] + (*A)[2][0] * (*B)[2][0];
  (*res)[0][3] = (*A)[0][1] * (*B)[0][0] + (*A)[1][1] * (*B)[0][3] + (*A)[2][1] * (*B)[1][2];
  (*res)[1][0] = (*A)[0][1] * (*B)[0][1] + (*A)[1][1] * (*B)[1][0] + (*A)[2][1] * (*B)[1][3];
  (*res)[1][1] = (*A)[0][1] * (*B)[0][2] + (*A)[1][1] * (*B)[1][1] + (*A)[2][1] * (*B)[2][0];
  (*res)[1][2] = (*A)[0][2] * (*B)[0][0] + (*A)[1][2] * (*B)[0][3] + (*A)[2][2] * (*B)[1][2];
  (*res)[1][3] = (*A)[0][2] * (*B)[0][1] + (*A)[1][2] * (*B)[1][0] + (*A)[2][2] * (*B)[1][3];
  (*res)[2][0] = (*A)[0][2] * (*B)[0][2] + (*A)[1][2] * (*B)[1][1] + (*A)[2][2] * (*B)[2][0];
}
//please identify purpose of function.
void Ofunc_800aca54(vec3f *res,MtxF *A,vec3f *B){
  res->x = (*A)[0][0] * B->x + (*A)[1][0] * B->y + (*A)[2][0] * B->z + (*A)[3][0];
  res->y = (*A)[0][1] * B->x + (*A)[1][1] * B->y + (*A)[2][1] * B->z + (*A)[3][1];
  res->z = (*A)[0][2] * B->x + (*A)[1][2] * B->y + (*A)[2][2] * B->z + (*A)[3][2];
}


void MtxXFMF(vec3f *A,MtxF *B,vec3f *C){
  A->x = (*B)[0][0] * C->x + (*B)[1][0] * C->y + (*B)[2][0] * C->z;
  A->y = (*B)[0][1] * C->x + (*B)[1][1] * C->y + (*B)[2][1] * C->z;
  A->z = (*B)[0][2] * C->x + (*B)[1][2] * C->y + (*B)[2][2] * C->z;
}
//does nothing, unused
void NOOP_800acb94(void){}
//does nothing, unused
void NOOP_800ACB9C(void){}

//please identify purpose of function.
void Ofunc_800acba4(MtxF *param_1,Mtx_t *param_2){
  u32 uVar1;
  u32 uVar2;
  u8 bVar3;
  float fVar4;
  float *pfVar5;
  long (*palVar6) [4];
  int iVar7;
  int iVar8;
  
  fVar4 = 1.5258789E-5f;
  palVar6 = *param_2 + 2;
  pfVar5 = (*param_1)[0] + 2;
  iVar8 = 1;
  for(iVar8=1;iVar8++;iVar8 < 4) {
    iVar7 = 1;
    do {
      uVar1 = *(u32 *)param_2;
      uVar2 = (*palVar6)[0];
      palVar6 = (long (*) [4])(*palVar6 + 1);
      param_2 = (Mtx_t *)((int)param_2 + 4);
      iVar7 += -1;
      *(float *)param_1 = (float)(uVar1 & 0xffff0000 | uVar2 >> 0x10) * fVar4;
      param_1 = (MtxF *)((int)param_1 + 8);
      *pfVar5 = (float)(uVar1 << 0x10 | uVar2 & 0xffff) * fVar4;
      pfVar5 = pfVar5 + 2;
    } while (-1 < iVar7);
  }
  return;
}
//please identify purpose of function.
void ofunc_sub_800acc40(MtxF *res,vec3f *v,float a){
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
  
  fVar11 = a * 0.5;
  fVar6 = __cosf(fVar11);
  fVar7 = __sinf(fVar11);
  fVar9 = fVar7 * v->x;
  fVar2 = (fVar9*2) * fVar6;
  fVar8 = fVar7 * v->y;
  fVar3 = (fVar8*2) * fVar6;
  fVar7 = fVar7 * v->z;
  fVar1 = (fVar7*2) * fVar6;
  fVar5 = (fVar9*2) * fVar8;
  fVar4 = (fVar8*2) * fVar7;
  fVar11 = (fVar7*2) * fVar9;
  fVar8 = SQ(fVar8);
  fVar7 = SQ(fVar7);
  fVar10 = SQ(fVar6) - SQ(fVar9);
  (*res)[2][2] = (fVar10 - fVar8) + fVar7;
  (*res)[0][0] = ((SQ(fVar6) + SQ(fVar9)) - fVar8) - fVar7;
  (*res)[1][1] = (fVar10 + fVar8) - fVar7;
  (*res)[1][0] = fVar5 - fVar1;
  (*res)[2][0] = fVar11 + fVar3;
  (*res)[0][1] = fVar5 + fVar1;
  (*res)[2][1] = fVar4 - fVar2;
  (*res)[0][2] = fVar11 - fVar3;
  (*res)[1][2] = fVar4 + fVar2;}
//please identify purpose of function.
void Ofunc_800acd9c(MtxF *A,vec3f *B){
  vec3f v3Temp= {B->x,B->y,B->z};
  ofunc_sub_800acc40(A,&v3Temp,Vec3Normalize(&v3Temp));
  (*A)[3][0] = 0.0;
  (*A)[3][1] = 0.0;
  (*A)[3][2] = 0.0;
  (*A)[0][3] = 0.0;
  (*A)[1][3] = 0.0;
  (*A)[2][3] = 0.0;
  (*A)[3][3] = 1.0;
}


//please identify purpose of function.
void ofunc_sub_800ace10(MtxF* A,float x,float y,float z){
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
  (*A)[0][1] = cosy * sinz;
  (*A)[0][0] = cosx * cosz + sinx * siny * sinz;
  (*A)[1][0] = -cosx * sinz + sinx * siny * cosz;
  (*A)[0][2] = -sinx * cosz + cosx * siny * sinz;
  (*A)[1][2] = sinx * sinz + cosx * siny * cosz;
}
//please identify purpose of function.
void FUN_800acf64(float (*A) [4] [4],s32 X,s32 Y,s32 Z){
  ofunc_sub_800ace10(A,(float)X,(float)Y,(float)Z);
  (*A)[3][0] = 0.0;
  (*A)[3][1] = 0.0;
  (*A)[3][2] = 0.0;
  (*A)[0][3] = 0.0;
  (*A)[1][3] = 0.0;
  (*A)[2][3] = 0.0;
  (*A)[3][3] = 1.0f;
}
//scales A by x,y,z
void matrix_scale(MtxF* A,float x,float Y,float Z){
  (*A)[0][0] *= x;
  (*A)[0][1] *= x;
  (*A)[0][2] *= x;
  (*A)[1][0] *= Y;
  (*A)[1][1] *= Y;
  (*A)[1][2] *= Y;
  (*A)[2][0] *= Z;
  (*A)[2][1] *= Z;
  (*A)[2][2] *= Z;
}
//please identify purpose of function.
void Ofunc_800ad028(MtxF* M){

  float X = (float)(1.0 / (double)_sqrtf(SQ((*M)[0][0]) + SQ((*M)[0][1]) + SQ((*M)[0][2])));
  float Y = (float)(1.0 / (double)_sqrtf(SQ((*M)[1][0]) + SQ((*M)[1][1]) + SQ((*M)[1][2])));
  float Z = (float)(1.0 / (double)_sqrtf(SQ((*M)[2][0]) + SQ((*M)[2][1]) + SQ((*M)[2][2])));
  (*M)[0][0] *= X;
  (*M)[0][1] *= X;
  (*M)[0][2] *= X;
  (*M)[1][0] *= Y;
  (*M)[1][1] *= Y;
  (*M)[1][2] *= Y;
  (*M)[2][0] *= Z;
  (*M)[2][1] *= Z;
  (*M)[2][2] *= Z;
  }
//please identify purpose of function.
void Ofunc_800ad174(MtxF *X,vec3f *A,vec3f *B,vec3f *C){
  float fVar1;
  float fVar2;
  float fVar3;
  vec3f V3temp;
  
  V3temp.x = B->x - C->x;
  V3temp.y = B->y - C->y;
  V3temp.z = B->z - C->z;
  fVar1 = Vec3Dot(&V3temp,A);
  fVar2 = Vec3Dot(C,A);
  (*X)[0][0] = -C->x * A->x - fVar1;
  (*X)[1][0] = -C->x * A->y;
  fVar3 = fVar1 + fVar2;
  (*X)[2][0] = -C->x * A->z;
  (*X)[3][0] = C->x * fVar3;
  (*X)[0][1] = -C->y * A->x;
  (*X)[1][1] = -C->y * A->y - fVar1;
  (*X)[2][1] = -C->y * A->z;
  (*X)[3][1] = C->y * fVar3;
  (*X)[0][2] = -C->z * A->x;
  (*X)[1][2] = -C->z * A->y;
  (*X)[2][2] = -C->z * A->z - fVar1;
  (*X)[3][2] = C->z * fVar3;
  (*X)[0][3] = -A->x;
  (*X)[1][3] = -A->y;
  fVar1 = A->z;
  (*X)[3][3] = fVar2;
  (*X)[2][3] = -fVar1;
}
//please identify purpose of function.
void ofunc_sub_800ad30c(float *param_1,float *param_2,float *param_3){
  s32 iVar1;
  s32 iVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  s32 iVar7;
  s32 iVar8;
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

//please identify purpose of function.
void Ofunc_800ad38c(vec3f *res,MtxF *A,vec3f *B){
  res->x = (*A)[0][0] * B->x + (*A)[0][1] * B->y + (*A)[0][2] * B->z;
  res->y = (*A)[0][3] * B->x + (*A)[1][0] * B->y + (*A)[1][1] * B->z;
  res->z = (*A)[1][2] * B->x + (*A)[1][3] * B->y + (*A)[2][0] * B->z;
}
//please identify purpose of function.
void Ofunc_800ad420(vec3f *A,vec3f *B,vec3f *C,vec3f *D){
  float fVar1 = A->x * B->x + A->y * B->y + A->z * B->z;
  float fVar2 = B->x * fVar1;
  C->x = fVar2;
  C->y = B->y * fVar1;
  C->z = B->z * fVar1;
  D->x = A->x - fVar2;
  D->y = A->y - C->y;
  D->z = A->z - C->z;
}
//please identify purpose of function.
void Ofunc_800ad49c(vec3f *A,vec3f *B){
  float fVar1 = Vec3Dot(A,B);
  fVar1 = -fVar1;
  B->x = B->x + A->x * fVar1;
  B->y = B->y + A->y * fVar1;
  B->z = B->z + A->z * fVar1;
}
//please identify purpose of function.
void Ofunc_800ad50c(MtxF *A,float *B,float *C,float *D,float *E){
  MtxF fStack376;
  MtxF fStack312;
  MtxF fStack248;
  MtxF afStack_b8;
  

  fStack312[0][0] = *C;
  fStack376[0][0] = *B * fStack312[0][0];
  fStack312[0][3] = C[1];
  fStack376[0][1] = *B * fStack312[0][3];
  fStack312[1][2] = C[2];
  fStack376[0][2] = *B * fStack312[1][2];
  fStack312[0][1] = *D;
  fStack376[0][3] = B[1] * fStack312[0][1];
  fStack312[1][0] = D[1];
  fStack312[1][3] = D[2];
  fStack376[1][0] = B[1] * fStack312[1][0];
  fStack376[1][1] = B[1] * fStack312[1][3];
  fStack312[0][2] = *E;
  fStack376[1][2] = B[2] * fStack312[0][2];
  fStack312[1][1] = E[1];
  fStack312[2][0] = E[2];
  fStack376[1][3] = B[2] * fStack312[1][1];
  fStack376[2][0] = B[2] * fStack312[2][0];
  ofunc_sub_800ad30c((float*)fStack248,(float*)fStack312,(float*)fStack376);
  afStack_b8=*A;
  (*A)[1][0] = fStack248[0][0] * afStack_b8[1][0] + fStack248[0][1] * afStack_b8[1][1] +
               fStack248[0][2] * afStack_b8[1][2];
  (*A)[0][0] = fStack248[0][0] * afStack_b8[0][0] + fStack248[0][1] * afStack_b8[0][1] +
               fStack248[0][2] * afStack_b8[0][2];
  (*A)[0][1] = fStack248[0][3] * afStack_b8[0][0] + fStack248[1][0] * afStack_b8[0][1] +
               fStack248[1][1] * afStack_b8[0][2];
  (*A)[2][0] = fStack248[0][0] * afStack_b8[2][0] + fStack248[0][1] * afStack_b8[2][1] +
               fStack248[0][2] * afStack_b8[2][2];
  (*A)[2][1] = fStack248[0][3] * afStack_b8[2][0] + fStack248[1][0] * afStack_b8[2][1] +
               fStack248[1][1] * afStack_b8[2][2];
  (*A)[1][1] = fStack248[0][3] * afStack_b8[1][0] + fStack248[1][0] * afStack_b8[1][1] +
               fStack248[1][1] * afStack_b8[1][2];
  (*A)[2][2] = fStack248[1][2] * afStack_b8[2][0] + fStack248[1][3] * afStack_b8[2][1] +
               fStack248[2][0] * afStack_b8[2][2];
  (*A)[0][2] = fStack248[1][2] * afStack_b8[0][0] + fStack248[1][3] * afStack_b8[0][1] +
               fStack248[2][0] * afStack_b8[0][2];
  (*A)[1][2] = fStack248[1][2] * afStack_b8[1][0] + fStack248[1][3] * afStack_b8[1][1] +
               fStack248[2][0] * afStack_b8[1][2];
}

//please identify purpose of function.
void Ofunc_800ad81c(MtxF *A,vec3f *B){
  vec3f V3TempA;
  vec3f V3TempB;
  
  V3TempB.x = (*A)[2][0];
  V3TempB.y = (*A)[2][1];
  V3TempB.z = (*A)[2][2];
  Vec3Cross(&V3TempA,B,&V3TempB);
  Vec3Normalize(&V3TempA);
  Vec3Cross(&V3TempB,&V3TempA,B);
  (*A)[0][0] = V3TempA.x;
  (*A)[0][1] = V3TempA.y;
  (*A)[0][2] = V3TempA.z;
  (*A)[1][0] = B->x;
  (*A)[1][1] = B->y;
  (*A)[1][2] = B->z;
  (*A)[2][0] = V3TempB.x;
  (*A)[2][1] = V3TempB.y;
  (*A)[2][2] = V3TempB.z;
  }

//please identify purpose of function.
u8 FUN_800ad8d8(float X){
  u32 uVar1;
  u32 uVar2;
  float fVar3;
  
  fVar3 = 1.0f;
  if ((double)X <= (double)1.0) {
    fVar3 = X;
  }
  if ((double)fVar3 < (double)(1.0)) {
    fVar3 = 0.0;
  }
  uVar2 = ((u32)fVar3 >> 0x17 & 0xff) - 0x7f;
  if (uVar2 != 0) {
    uVar1 = ((u32)fVar3 & 0x7fffff | 0x800000) >> 0x10;
    if (-9 < (s32)uVar2) {
      if ((s32)uVar2 < 0) {
        uVar1 = uVar1 >> (uVar2 & 0x1f);
      }
      return (u8)uVar1;
    }
    return 0;
  }
  return 0xff;
}
//please identify purpose of function.
void FUN_800ad974(MtxF *X,float A){  
  float fVar2;
  float fVar3 = SQ(A);
  (*X)[0][0] = 0.0;
  (*X)[0][1] = 0.0;
  (*X)[0][2] = 0.0;
  (*X)[1][3] = 0.0;
  (*X)[2][2] = 0.0;
  (*X)[2][3] = 0.0;
  (*X)[3][1] = 0.0;
  (*X)[3][2] = 0.0;
  (*X)[3][3] = 0.0;
  (*X)[0][3] = 1;
  fVar2 = fVar3 * A * 6.0f;
  (*X)[1][2] = A;
  (*X)[1][1] = fVar3;
  (*X)[2][1] = fVar3 + fVar3;
  (*X)[1][0] = fVar3 * A;
  (*X)[2][0] = fVar2;
  (*X)[3][0] = fVar2;
}
//please identify purpose of function.
void FUN_800ad9dc(vec4f *X,MtxF *Y,vec4f *Z){
  X->x = (*Y)[0][0] * Z->x + (*Y)[1][0] * Z->y + (*Y)[2][0] * Z->z + (*Y)[3][0] * Z->w;
  X->y = (*Y)[0][1] * Z->x + (*Y)[1][1] * Z->y + (*Y)[2][1] * Z->z + (*Y)[3][1] * Z->w;
  X->z = (*Y)[0][2] * Z->x + (*Y)[1][2] * Z->y + (*Y)[2][2] * Z->z + (*Y)[3][2] * Z->w;
  X->w = (*Y)[0][3] * Z->x + (*Y)[1][3] * Z->y + (*Y)[2][3] * Z->z + (*Y)[3][3] * Z->w;
}