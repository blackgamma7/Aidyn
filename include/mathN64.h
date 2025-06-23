#include "typedefs.h"
//used in 2d math
typedef union vec2f{
    struct{float x,y;};
    float f[2];
};
//used in 3d math
typedef union vec3f{
    struct{float x,y,z;};
    float f[3];
};

//mostly used for color
typedef union vec4f{
    struct{float x,y,z,w;};
    struct{float r,g,b,a;};
    float f[4];
};

typedef float MtxF[4][4];

#define NORMALIZE_MIN 1.0E-6
#define TAU 6.2831855
#define dtor 0.017453
#define RadInDeg_f 57.29578f
#define SQ(x) x*x

extern float _sqrtf(float x);
extern float __sinf(float x);
extern float __cosf(float x);

float vec2Length(vec2f *X);
float vec3Length(vec3f *X);
void Vec2_Sub(vec2f *A,vec2f *B,vec2f *C);
void Vec3_sub(vec3f *res,vec3f *a,vec3f *b);
void Vec4_sub(vec4f *res,vec4f *a,vec4f *b);
void vec2_sum(vec2f *res,vec2f *a,vec2f *b);
void vec3_sum(vec3f *res,vec3f *a,vec3f *b);
float vec2_proximity(vec2f *A,vec2f *B);
float vec3_proximity(vec3f *A,vec3f *B);
float vec2_dot(vec2f *A,vec2f *B);
float vec3_dot(vec3f *A,vec3f *B);
void Vec3_cross(vec3f *res,vec3f *A,vec3f *B);
float vec2_normalize(vec2f *X);
float vec3_normalize(vec3f *X);
float vec4_normalize(vec4f *X);
float NormalizeTri(vec3f *norm,vec3f *X,vec3f *y,vec3f *z);
int some_trig_func_2(vec2f *A,vec2f *B,float C);
void FUN_800ab23c(vec3f *A,vec3f *B,float C);
void RotVec2(vec2f *v,float a);
void some_vec2Math(vec2f *v2,float x,float y);
void Ofunc_800ab3cc(vec3f *X,float Y);
void copyVec2(vec2f *from,vec2f *to);
void copyVec3(vec3f *from,vec3f *to);
void copyVec4(vec4f *from,vec4f *to);
void negVec4(vec4f *x);
void multiVec2(vec2f *v,float x);
void multiVec3(vec3f *v,float x);
void multiVec4(vec4f *v,float x);
void setVec2(vec2f *v,float x,float y);
void setVec3(vec3f *v,float x,float y,float z);
void setVec4(vec4f *v,float x,float y,float z, float w);
float three_vec2_proximities(vec2f *X,vec2f *Y,vec2f *Z);
float Ofunc_800ab628(vec2f *A,vec2f *B,vec2f *C);
float big_vec2_math_func(vec2f *A,vec2f *B,vec2f *C);
float Ofunc_800ab7e4(vec3f *A,vec3f *B,vec3f *C);
void FUN_800ab880(MtxF *A,MtxF *B);
float ofunc_sub_800aba2c(MtxF *param_1,u8 param_2,s8 param_3);
float ofunc_sub_800abbbc(MtxF *param_1);
void Ofunc_800abc38(MtxF *param_1,float *param_2);
void ofunc_sub_800abd94(MtxF *res,MtxF *A,MtxF *B);
void some_matrix_func_1(MtxF *res,MtxF *A,MtxF *B);
void FUN_800ac2e8(MtxF *res,MtxF *A,MtxF *B);
void some_other_matrix_math(MtxF *res,MtxF *A,MtxF *B);
void Ofunc_800ac8a0(MtxF *res,MtxF *A,MtxF *B);
void Ofunc_800aca54(vec3f *res,MtxF *A,vec3f *B);
void MtxXFMF(vec3f *A,MtxF *B,vec3f *C);
void NOOP_800acb94(void);
void NOOP_800ACB9C(void);
void Ofunc_800acba4(MtxF *param_1,Mtx_t *param_2);
void ofunc_sub_800acc40(MtxF *res,vec3f *v,float a);
void Ofunc_800acd9c(MtxF *A,vec3f *B);
void ofunc_sub_800ace10(MtxF *res,float x,float y,float z);
void Ofunc_800acf64(MtxF *A,int X,int Y,int Z);
void matrix_scale(MtxF *m,float x,float Y,float Z);
void Ofunc_800ad028(MtxF *X);
void Ofunc_800ad174(MtxF *X,vec3f *A,vec3f *B,vec3f *C);
void ofunc_sub_800ad30c(float *param_1,float *param_2,float *param_3);
void Ofunc_800ad38c(vec3f *res,MtxF *A,vec3f *B);
void Ofunc_800ad420(vec3f *A,vec3f *B,vec3f *C,vec3f *D);
void Ofunc_800ad49c(vec3f *A,vec3f *B);
void Ofunc_800ad50c(MtxF *A,float *B,float *C,float *D,float *E);
void Ofunc_800ad81c(MtxF *A,vec3f *B);
byte Ofunc_800ad8d8(float X);
void FUN_800ad974(MtxF *X,float A);
void FUN_800ad9dc(vec4f *X,MtxF *Y,vec4f *Z);

extern u32 udivdi3(u64 a, u64 b);

s16 sub_square_add_(u8 A,u8 B,u8 C,u8 D);
s16 sub_square_add_sqrt(u8 A,u8 B,u8 C,u8 D);
u32 warrior_dividing(u8 x,u8 divis,u8 roundup,u8 min,u8 max);