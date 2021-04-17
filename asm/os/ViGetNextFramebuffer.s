.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osCreateViManager
/* D2AD0 800D1ED0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* D2AD4 800D1ED4 AFB40028 */  sw         $s4, 0x28($sp)
/* D2AD8 800D1ED8 3C14800F */  lui        $s4, %hi(__osDevMgr)
/* D2ADC 800D1EDC 26943D50 */  addiu      $s4, $s4, %lo(__osDevMgr)
/* D2AE0 800D1EE0 AFBF002C */  sw         $ra, 0x2c($sp)
/* D2AE4 800D1EE4 AFB30024 */  sw         $s3, 0x24($sp)
/* D2AE8 800D1EE8 AFB20020 */  sw         $s2, 0x20($sp)
/* D2AEC 800D1EEC AFB1001C */  sw         $s1, 0x1c($sp)
/* D2AF0 800D1EF0 AFB00018 */  sw         $s0, 0x18($sp)
/* D2AF4 800D1EF4 8E820000 */  lw         $v0, ($s4)
/* D2AF8 800D1EF8 14400055 */  bnez       $v0, .L800D2050
/* D2AFC 800D1EFC 00808821 */   addu      $s1, $a0, $zero
/* D2B00 800D1F00 0C034604 */  jal        __osTimerServicesInit
/* D2B04 800D1F04 2412FFFF */   addiu     $s2, $zero, -1
/* D2B08 800D1F08 3C138010 */  lui        $s3, %hi(viThreadStack)
/* D2B0C 800D1F0C 2673F9F0 */  addiu      $s3, $s3, %lo(viThreadStack)
/* D2B10 800D1F10 02602021 */  addu       $a0, $s3, $zero
/* D2B14 800D1F14 3C058010 */  lui        $a1, %hi(viEventBuff)
/* D2B18 800D1F18 24A5FA08 */  addiu      $a1, $a1, %lo(viEventBuff)
/* D2B1C 800D1F1C 3C01800F */  lui        $at, %hi(vimgr_data_001C)
/* D2B20 800D1F20 AC203D6C */  sw         $zero, %lo(vimgr_data_001C)($at)
/* D2B24 800D1F24 0C02FBA4 */  jal        osCreateMesgQueue
/* D2B28 800D1F28 24060005 */   addiu     $a2, $zero, 5
/* D2B2C 800D1F2C 24040007 */  addiu      $a0, $zero, 7
/* D2B30 800D1F30 3C068010 */  lui        $a2, %hi(viRetraceMsg)
/* D2B34 800D1F34 24C6FA20 */  addiu      $a2, $a2, %lo(viRetraceMsg)
/* D2B38 800D1F38 2402000D */  addiu      $v0, $zero, 0xd
/* D2B3C 800D1F3C 3C108010 */  lui        $s0, %hi(viCounterMsg)
/* D2B40 800D1F40 2610FA38 */  addiu      $s0, $s0, %lo(viCounterMsg)
/* D2B44 800D1F44 A4C20000 */  sh         $v0, ($a2)
/* D2B48 800D1F48 2402000E */  addiu      $v0, $zero, 0xe
/* D2B4C 800D1F4C 3C018010 */  lui        $at, %hi(viRetraceMsg+0x2)
/* D2B50 800D1F50 A020FA22 */  sb         $zero, %lo(viRetraceMsg+0x2)($at)
/* D2B54 800D1F54 3C018010 */  lui        $at, %hi(viRetraceMsg+0x4)
/* D2B58 800D1F58 AC20FA24 */  sw         $zero, %lo(viRetraceMsg+0x4)($at)
/* D2B5C 800D1F5C A6020000 */  sh         $v0, ($s0)
/* D2B60 800D1F60 3C018010 */  lui        $at, %hi(viCounterMsg+0x2)
/* D2B64 800D1F64 A020FA3A */  sb         $zero, %lo(viCounterMsg+0x2)($at)
/* D2B68 800D1F68 3C018010 */  lui        $at, %hi(viCounterMsg+0x4)
/* D2B6C 800D1F6C AC20FA3C */  sw         $zero, %lo(viCounterMsg+0x4)($at)
/* D2B70 800D1F70 0C033188 */  jal        osSetEventMesg
/* D2B74 800D1F74 02602821 */   addu      $a1, $s3, $zero
/* D2B78 800D1F78 24040003 */  addiu      $a0, $zero, 3
/* D2B7C 800D1F7C 02602821 */  addu       $a1, $s3, $zero
/* D2B80 800D1F80 0C033188 */  jal        osSetEventMesg
/* D2B84 800D1F84 02003021 */   addu      $a2, $s0, $zero
/* D2B88 800D1F88 0C032138 */  jal        osGetThreadPri
/* D2B8C 800D1F8C 00002021 */   addu      $a0, $zero, $zero
/* D2B90 800D1F90 00401821 */  addu       $v1, $v0, $zero
/* D2B94 800D1F94 0071102A */  slt        $v0, $v1, $s1
/* D2B98 800D1F98 10400005 */  beqz       $v0, .L800D1FB0
/* D2B9C 800D1F9C 00000000 */   nop
/* D2BA0 800D1FA0 00609021 */  addu       $s2, $v1, $zero
/* D2BA4 800D1FA4 00002021 */  addu       $a0, $zero, $zero
/* D2BA8 800D1FA8 0C0331F4 */  jal        osSetThreadPri
/* D2BAC 800D1FAC 02202821 */   addu      $a1, $s1, $zero
.L800D1FB0:
/* D2BB0 800D1FB0 0C030D90 */  jal        __osDisableInt
/* D2BB4 800D1FB4 00000000 */   nop
/* D2BB8 800D1FB8 3C108010 */  lui        $s0, %hi(viThread)
/* D2BBC 800D1FBC 2610E838 */  addiu      $s0, $s0, %lo(viThread)
/* D2BC0 800D1FC0 02002021 */  addu       $a0, $s0, $zero
/* D2BC4 800D1FC4 00002821 */  addu       $a1, $zero, $zero
/* D2BC8 800D1FC8 3C06800D */  lui        $a2, %hi(vimgrMain)
/* D2BCC 800D1FCC 24C62070 */  addiu      $a2, $a2, %lo(vimgrMain)
/* D2BD0 800D1FD0 24030001 */  addiu      $v1, $zero, 1
/* D2BD4 800D1FD4 AE830000 */  sw         $v1, ($s4)
/* D2BD8 800D1FD8 3C038010 */  lui        $v1, %hi(viThreadStack)
/* D2BDC 800D1FDC 2463F9F0 */  addiu      $v1, $v1, %lo(viThreadStack)
/* D2BE0 800D1FE0 AFB10014 */  sw         $s1, 0x14($sp)
/* D2BE4 800D1FE4 00408821 */  addu       $s1, $v0, $zero
/* D2BE8 800D1FE8 02803821 */  addu       $a3, $s4, $zero
/* D2BEC 800D1FEC 3C01800F */  lui        $at, %hi(__osDevMgr+0x4)
/* D2BF0 800D1FF0 AC303D54 */  sw         $s0, %lo(__osDevMgr+0x4)($at)
/* D2BF4 800D1FF4 3C01800F */  lui        $at, %hi(__osDevMgr+0x8)
/* D2BF8 800D1FF8 AC333D58 */  sw         $s3, %lo(__osDevMgr+0x8)($at)
/* D2BFC 800D1FFC 3C01800F */  lui        $at, %hi(__osDevMgr+0xC)
/* D2C00 800D2000 AC333D5C */  sw         $s3, %lo(__osDevMgr+0xC)($at)
/* D2C04 800D2004 3C01800F */  lui        $at, %hi(__osDevMgr+0x10)
/* D2C08 800D2008 AC203D60 */  sw         $zero, %lo(__osDevMgr+0x10)($at)
/* D2C0C 800D200C 3C01800F */  lui        $at, %hi(__osDevMgr+0x14)
/* D2C10 800D2010 AC203D64 */  sw         $zero, %lo(__osDevMgr+0x14)($at)
/* D2C14 800D2014 3C01800F */  lui        $at, %hi(__osDevMgr+0x18)
/* D2C18 800D2018 AC203D68 */  sw         $zero, %lo(__osDevMgr+0x18)($at)
/* D2C1C 800D201C 0C02FBB0 */  jal        osCreateThread
/* D2C20 800D2020 AFA30010 */   sw        $v1, 0x10($sp)
/* D2C24 800D2024 0C034750 */  jal        __osViInit
/* D2C28 800D2028 00000000 */   nop
/* D2C2C 800D202C 0C0334B8 */  jal        osStartThread
/* D2C30 800D2030 02002021 */   addu      $a0, $s0, $zero
/* D2C34 800D2034 0C030DAC */  jal        __osRestoreInt
/* D2C38 800D2038 02202021 */   addu      $a0, $s1, $zero
/* D2C3C 800D203C 2402FFFF */  addiu      $v0, $zero, -1
/* D2C40 800D2040 12420003 */  beq        $s2, $v0, .L800D2050
/* D2C44 800D2044 00002021 */   addu      $a0, $zero, $zero
/* D2C48 800D2048 0C0331F4 */  jal        osSetThreadPri
/* D2C4C 800D204C 02402821 */   addu      $a1, $s2, $zero
.L800D2050:
/* D2C50 800D2050 8FBF002C */  lw         $ra, 0x2c($sp)
/* D2C54 800D2054 8FB40028 */  lw         $s4, 0x28($sp)
/* D2C58 800D2058 8FB30024 */  lw         $s3, 0x24($sp)
/* D2C5C 800D205C 8FB20020 */  lw         $s2, 0x20($sp)
/* D2C60 800D2060 8FB1001C */  lw         $s1, 0x1c($sp)
/* D2C64 800D2064 8FB00018 */  lw         $s0, 0x18($sp)
/* D2C68 800D2068 03E00008 */  jr         $ra
/* D2C6C 800D206C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel vimgrMain
/* D2C70 800D2070 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* D2C74 800D2074 AFB00018 */  sw         $s0, 0x18($sp)
/* D2C78 800D2078 00808021 */  addu       $s0, $a0, $zero
/* D2C7C 800D207C AFBF002C */  sw         $ra, 0x2c($sp)
/* D2C80 800D2080 AFB40028 */  sw         $s4, 0x28($sp)
/* D2C84 800D2084 AFB30024 */  sw         $s3, 0x24($sp)
/* D2C88 800D2088 AFB20020 */  sw         $s2, 0x20($sp)
/* D2C8C 800D208C AFB1001C */  sw         $s1, 0x1c($sp)
/* D2C90 800D2090 0C034884 */  jal        osGetViCurr
/* D2C94 800D2094 AFA00010 */   sw        $zero, 0x10($sp)
/* D2C98 800D2098 94420002 */  lhu        $v0, 2($v0)
/* D2C9C 800D209C 3C018010 */  lui        $at, %hi(retrace)
/* D2CA0 800D20A0 A422E830 */  sh         $v0, %lo(retrace)($at)
/* D2CA4 800D20A4 14400004 */  bnez       $v0, .L800D20B8
/* D2CA8 800D20A8 00008821 */   addu      $s1, $zero, $zero
/* D2CAC 800D20AC 24020001 */  addiu      $v0, $zero, 1
/* D2CB0 800D20B0 3C018010 */  lui        $at, %hi(retrace)
/* D2CB4 800D20B4 A422E830 */  sh         $v0, %lo(retrace)($at)
.L800D20B8:
/* D2CB8 800D20B8 02009021 */  addu       $s2, $s0, $zero
/* D2CBC 800D20BC 2414000D */  addiu      $s4, $zero, 0xd
/* D2CC0 800D20C0 2413000E */  addiu      $s3, $zero, 0xe
.L800D20C4:
/* D2CC4 800D20C4 8E44000C */  lw         $a0, 0xc($s2)
/* D2CC8 800D20C8 27A50010 */  addiu      $a1, $sp, 0x10
/* D2CCC 800D20CC 0C0321E4 */  jal        osRecvMesg
/* D2CD0 800D20D0 24060001 */   addiu     $a2, $zero, 1
/* D2CD4 800D20D4 8FA20010 */  lw         $v0, 0x10($sp)
/* D2CD8 800D20D8 94420000 */  lhu        $v0, ($v0)
/* D2CDC 800D20DC 10540005 */  beq        $v0, $s4, .L800D20F4
/* D2CE0 800D20E0 00000000 */   nop
/* D2CE4 800D20E4 1053003C */  beq        $v0, $s3, .L800D21D8
/* D2CE8 800D20E8 00000000 */   nop
/* D2CEC 800D20EC 08034831 */  j          .L800D20C4
/* D2CF0 800D20F0 00000000 */   nop
.L800D20F4:
/* D2CF4 800D20F4 0C03496C */  jal        __osViSwapContext
/* D2CF8 800D20F8 00000000 */   nop
/* D2CFC 800D20FC 3C028010 */  lui        $v0, %hi(retrace)
/* D2D00 800D2100 9442E830 */  lhu        $v0, %lo(retrace)($v0)
/* D2D04 800D2104 2442FFFF */  addiu      $v0, $v0, -1
/* D2D08 800D2108 3C018010 */  lui        $at, %hi(retrace)
/* D2D0C 800D210C A422E830 */  sh         $v0, %lo(retrace)($at)
/* D2D10 800D2110 3042FFFF */  andi       $v0, $v0, 0xffff
/* D2D14 800D2114 1440000C */  bnez       $v0, .L800D2148
/* D2D18 800D2118 00000000 */   nop
/* D2D1C 800D211C 0C034884 */  jal        osGetViCurr
/* D2D20 800D2120 00000000 */   nop
/* D2D24 800D2124 8C440010 */  lw         $a0, 0x10($v0)
/* D2D28 800D2128 10800004 */  beqz       $a0, .L800D213C
/* D2D2C 800D212C 00408021 */   addu      $s0, $v0, $zero
/* D2D30 800D2130 8E050014 */  lw         $a1, 0x14($s0)
/* D2D34 800D2134 0C03313C */  jal        osSendMesg
/* D2D38 800D2138 00003021 */   addu      $a2, $zero, $zero
.L800D213C:
/* D2D3C 800D213C 96020002 */  lhu        $v0, 2($s0)
/* D2D40 800D2140 3C018010 */  lui        $at, %hi(retrace)
/* D2D44 800D2144 A422E830 */  sh         $v0, %lo(retrace)($at)
.L800D2148:
/* D2D48 800D2148 3C028010 */  lui        $v0, %hi(__osViIntrCount)
/* D2D4C 800D214C 8C42E7D4 */  lw         $v0, %lo(__osViIntrCount)($v0)
/* D2D50 800D2150 24420001 */  addiu      $v0, $v0, 1
/* D2D54 800D2154 3C018010 */  lui        $at, %hi(__osViIntrCount)
/* D2D58 800D2158 1220000A */  beqz       $s1, .L800D2184
/* D2D5C 800D215C AC22E7D4 */   sw        $v0, %lo(__osViIntrCount)($at)
/* D2D60 800D2160 0C030C40 */  jal        osGetCount
/* D2D64 800D2164 00008821 */   addu      $s1, $zero, $zero
/* D2D68 800D2168 00408021 */  addu       $s0, $v0, $zero
/* D2D6C 800D216C 02001821 */  addu       $v1, $s0, $zero
/* D2D70 800D2170 00001021 */  addu       $v0, $zero, $zero
/* D2D74 800D2174 3C018010 */  lui        $at, %hi(__osCurrentTime)
/* D2D78 800D2178 AC22E7E0 */  sw         $v0, %lo(__osCurrentTime)($at)
/* D2D7C 800D217C 3C018010 */  lui        $at, %hi(__osCurrentTime+0x4)
/* D2D80 800D2180 AC23E7E4 */  sw         $v1, %lo(__osCurrentTime+0x4)($at)
.L800D2184:
/* D2D84 800D2184 3C108010 */  lui        $s0, %hi(__osBaseCounter)
/* D2D88 800D2188 0C030C40 */  jal        osGetCount
/* D2D8C 800D218C 8E10E7D0 */   lw        $s0, %lo(__osBaseCounter)($s0)
/* D2D90 800D2190 3C018010 */  lui        $at, %hi(__osBaseCounter)
/* D2D94 800D2194 AC22E7D0 */  sw         $v0, %lo(__osBaseCounter)($at)
/* D2D98 800D2198 00508023 */  subu       $s0, $v0, $s0
/* D2D9C 800D219C 3C028010 */  lui        $v0, %hi(__osCurrentTime)
/* D2DA0 800D21A0 8C42E7E0 */  lw         $v0, %lo(__osCurrentTime)($v0)
/* D2DA4 800D21A4 3C038010 */  lui        $v1, %hi(__osCurrentTime+0x4)
/* D2DA8 800D21A8 8C63E7E4 */  lw         $v1, %lo(__osCurrentTime+0x4)($v1)
/* D2DAC 800D21AC 02002821 */  addu       $a1, $s0, $zero
/* D2DB0 800D21B0 00002021 */  addu       $a0, $zero, $zero
/* D2DB4 800D21B4 00651821 */  addu       $v1, $v1, $a1
/* D2DB8 800D21B8 0065302B */  sltu       $a2, $v1, $a1
/* D2DBC 800D21BC 00441021 */  addu       $v0, $v0, $a0
/* D2DC0 800D21C0 00461021 */  addu       $v0, $v0, $a2
/* D2DC4 800D21C4 3C018010 */  lui        $at, %hi(__osCurrentTime)
/* D2DC8 800D21C8 AC22E7E0 */  sw         $v0, %lo(__osCurrentTime)($at)
/* D2DCC 800D21CC 3C018010 */  lui        $at, %hi(__osCurrentTime+0x4)
/* D2DD0 800D21D0 08034831 */  j          .L800D20C4
/* D2DD4 800D21D4 AC23E7E4 */   sw        $v1, %lo(__osCurrentTime+0x4)($at)
.L800D21D8:
/* D2DD8 800D21D8 0C034619 */  jal        __osTimerInterrupt
/* D2DDC 800D21DC 00000000 */   nop
/* D2DE0 800D21E0 08034831 */  j          .L800D20C4
/* D2DE4 800D21E4 00000000 */   nop
/* D2DE8 800D21E8 8FBF002C */  lw         $ra, 0x2c($sp)
/* D2DEC 800D21EC 8FB40028 */  lw         $s4, 0x28($sp)
/* D2DF0 800D21F0 8FB30024 */  lw         $s3, 0x24($sp)
/* D2DF4 800D21F4 8FB20020 */  lw         $s2, 0x20($sp)
/* D2DF8 800D21F8 8FB1001C */  lw         $s1, 0x1c($sp)
/* D2DFC 800D21FC 8FB00018 */  lw         $s0, 0x18($sp)
/* D2E00 800D2200 03E00008 */  jr         $ra
/* D2E04 800D2204 27BD0030 */   addiu     $sp, $sp, 0x30
/* D2E08 800D2208 00000000 */  nop
/* D2E0C 800D220C 00000000 */  nop
