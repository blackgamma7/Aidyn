.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osStartThread
/* CDEE0 800CD2E0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CDEE4 800CD2E4 AFB00010 */  sw         $s0, 0x10($sp)
/* CDEE8 800CD2E8 00808021 */  addu       $s0, $a0, $zero
/* CDEEC 800CD2EC AFBF001C */  sw         $ra, 0x1c($sp)
/* CDEF0 800CD2F0 AFB20018 */  sw         $s2, 0x18($sp)
/* CDEF4 800CD2F4 0C030D90 */  jal        __osDisableInt
/* CDEF8 800CD2F8 AFB10014 */   sw        $s1, 0x14($sp)
/* CDEFC 800CD2FC 96030010 */  lhu        $v1, 0x10($s0)
/* CDF00 800CD300 00409021 */  addu       $s2, $v0, $zero
/* CDF04 800CD304 24020001 */  addiu      $v0, $zero, 1
/* CDF08 800CD308 10620008 */  beq        $v1, $v0, .L800CD32C
/* CDF0C 800CD30C 24020008 */   addiu     $v0, $zero, 8
/* CDF10 800CD310 1462001E */  bne        $v1, $v0, .L800CD38C
/* CDF14 800CD314 24020002 */   addiu     $v0, $zero, 2
/* CDF18 800CD318 A6020010 */  sh         $v0, 0x10($s0)
/* CDF1C 800CD31C 3C04800F */  lui        $a0, %hi(__osRunQueue)
/* CDF20 800CD320 24843CB8 */  addiu      $a0, $a0, %lo(__osRunQueue)
/* CDF24 800CD324 080334E1 */  j          .L800CD384
/* CDF28 800CD328 02002821 */   addu      $a1, $s0, $zero
.L800CD32C:
/* CDF2C 800CD32C 8E020008 */  lw         $v0, 8($s0)
/* CDF30 800CD330 50400006 */  beql       $v0, $zero, .L800CD34C
/* CDF34 800CD334 24020002 */   addiu     $v0, $zero, 2
/* CDF38 800CD338 3C11800F */  lui        $s1, %hi(__osRunQueue)
/* CDF3C 800CD33C 26313CB8 */  addiu      $s1, $s1, %lo(__osRunQueue)
/* CDF40 800CD340 14510007 */  bne        $v0, $s1, .L800CD360
/* CDF44 800CD344 02002821 */   addu      $a1, $s0, $zero
/* CDF48 800CD348 24020002 */  addiu      $v0, $zero, 2
.L800CD34C:
/* CDF4C 800CD34C A6020010 */  sh         $v0, 0x10($s0)
/* CDF50 800CD350 3C04800F */  lui        $a0, %hi(__osRunQueue)
/* CDF54 800CD354 24843CB8 */  addiu      $a0, $a0, %lo(__osRunQueue)
/* CDF58 800CD358 080334E1 */  j          .L800CD384
/* CDF5C 800CD35C 02002821 */   addu      $a1, $s0, $zero
.L800CD360:
/* CDF60 800CD360 8E040008 */  lw         $a0, 8($s0)
/* CDF64 800CD364 24020008 */  addiu      $v0, $zero, 8
/* CDF68 800CD368 0C02FEE7 */  jal        __osEnqueueThread
/* CDF6C 800CD36C A6020010 */   sh        $v0, 0x10($s0)
/* CDF70 800CD370 8E040008 */  lw         $a0, 8($s0)
/* CDF74 800CD374 0C02FEF9 */  jal        __osPopThread
/* CDF78 800CD378 00000000 */   nop
/* CDF7C 800CD37C 02202021 */  addu       $a0, $s1, $zero
/* CDF80 800CD380 00402821 */  addu       $a1, $v0, $zero
.L800CD384:
/* CDF84 800CD384 0C02FEE7 */  jal        __osEnqueueThread
/* CDF88 800CD388 00000000 */   nop
.L800CD38C:
/* CDF8C 800CD38C 3C04800F */  lui        $a0, %hi(__osRunningThread)
/* CDF90 800CD390 8C843CC0 */  lw         $a0, %lo(__osRunningThread)($a0)
/* CDF94 800CD394 14800005 */  bnez       $a0, .L800CD3AC
/* CDF98 800CD398 00000000 */   nop
/* CDF9C 800CD39C 0C02FEFD */  jal        __osDispatchThread
/* CDFA0 800CD3A0 00000000 */   nop
/* CDFA4 800CD3A4 080334F6 */  j          .L800CD3D8
/* CDFA8 800CD3A8 00000000 */   nop
.L800CD3AC:
/* CDFAC 800CD3AC 3C02800F */  lui        $v0, %hi(__osRunQueue)
/* CDFB0 800CD3B0 8C423CB8 */  lw         $v0, %lo(__osRunQueue)($v0)
/* CDFB4 800CD3B4 8C830004 */  lw         $v1, 4($a0)
/* CDFB8 800CD3B8 8C420004 */  lw         $v0, 4($v0)
/* CDFBC 800CD3BC 0062182A */  slt        $v1, $v1, $v0
/* CDFC0 800CD3C0 10600005 */  beqz       $v1, .L800CD3D8
/* CDFC4 800CD3C4 24020002 */   addiu     $v0, $zero, 2
/* CDFC8 800CD3C8 A4820010 */  sh         $v0, 0x10($a0)
/* CDFCC 800CD3CC 3C04800F */  lui        $a0, %hi(__osRunQueue)
/* CDFD0 800CD3D0 0C02FEA5 */  jal        __osEnqueueAndYeild
/* CDFD4 800CD3D4 24843CB8 */   addiu     $a0, $a0, %lo(__osRunQueue)
.L800CD3D8:
/* CDFD8 800CD3D8 0C030DAC */  jal        __osRestoreInt
/* CDFDC 800CD3DC 02402021 */   addu      $a0, $s2, $zero
/* CDFE0 800CD3E0 8FBF001C */  lw         $ra, 0x1c($sp)
/* CDFE4 800CD3E4 8FB20018 */  lw         $s2, 0x18($sp)
/* CDFE8 800CD3E8 8FB10014 */  lw         $s1, 0x14($sp)
/* CDFEC 800CD3EC 8FB00010 */  lw         $s0, 0x10($sp)
/* CDFF0 800CD3F0 03E00008 */  jr         $ra
/* CDFF4 800CD3F4 27BD0020 */   addiu     $sp, $sp, 0x20
/* CDFF8 800CD3F8 00000000 */  nop
/* CDFFC 800CD3FC 00000000 */  nop
