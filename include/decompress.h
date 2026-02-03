#include "typedefs.h"

s32 decompress_LZ01(u8 *compDat,u32 compSize,u8 *OutDat,u32 *OutSize);
s32 LZ01_func_2(u8 *param_1,int param_2,u8 *param_3,u8 **param_4);
s32 decompress_LZB(u8 *compDat,u32 CompSize,u8 *OutDat,u32 *outSize);
s32 LZB_func_2(u8 *param_1,u32 param_2,u8 *param_3,s32 *param_4);
s32 LZB_func_3(u8 *param_1,u32 param_2,u8 *param_3,s32 *param_4);