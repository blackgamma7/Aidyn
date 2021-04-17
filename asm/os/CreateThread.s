.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osCreateThread
/* BFAC0 800BEEC0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BFAC4 800BEEC4 AFB00010 */  sw         $s0, 0x10($sp)
/* BFAC8 800BEEC8 00808021 */  addu       $s0, $a0, $zero
/* BFACC 800BEECC 00E04821 */  addu       $t1, $a3, $zero
/* BFAD0 800BEED0 000747C3 */  sra        $t0, $a3, 0x1f
/* BFAD4 800BEED4 3C04800C */  lui        $a0, %hi(__osCleanupThread)
/* BFAD8 800BEED8 2484FD70 */  addiu      $a0, $a0, %lo(__osCleanupThread)
/* BFADC 800BEEDC 00801821 */  addu       $v1, $a0, $zero
/* BFAE0 800BEEE0 000417C3 */  sra        $v0, $a0, 0x1f
/* BFAE4 800BEEE4 8FA70028 */  lw         $a3, 0x28($sp)
/* BFAE8 800BEEE8 3C040100 */  lui        $a0, 0x100
/* BFAEC 800BEEEC 34840800 */  ori        $a0, $a0, 0x800
/* BFAF0 800BEEF0 AFBF0014 */  sw         $ra, 0x14($sp)
/* BFAF4 800BEEF4 AE020100 */  sw         $v0, 0x100($s0)
/* BFAF8 800BEEF8 AE030104 */  sw         $v1, 0x104($s0)
/* BFAFC 800BEEFC 3402FF03 */  ori        $v0, $zero, 0xff03
/* BFB00 800BEF00 AE020118 */  sw         $v0, 0x118($s0)
/* BFB04 800BEF04 2402003F */  addiu      $v0, $zero, 0x3f
/* BFB08 800BEF08 AE020128 */  sw         $v0, 0x128($s0)
/* BFB0C 800BEF0C 24020001 */  addiu      $v0, $zero, 1
/* BFB10 800BEF10 AE050014 */  sw         $a1, 0x14($s0)
/* BFB14 800BEF14 AE000000 */  sw         $zero, ($s0)
/* BFB18 800BEF18 AE000008 */  sw         $zero, 8($s0)
/* BFB1C 800BEF1C AE06011C */  sw         $a2, 0x11c($s0)
/* BFB20 800BEF20 AE080038 */  sw         $t0, 0x38($s0)
/* BFB24 800BEF24 AE09003C */  sw         $t1, 0x3c($s0)
/* BFB28 800BEF28 AE04012C */  sw         $a0, 0x12c($s0)
/* BFB2C 800BEF2C AE000018 */  sw         $zero, 0x18($s0)
/* BFB30 800BEF30 A6020010 */  sh         $v0, 0x10($s0)
/* BFB34 800BEF34 A6000012 */  sh         $zero, 0x12($s0)
/* BFB38 800BEF38 8FA2002C */  lw         $v0, 0x2c($sp)
/* BFB3C 800BEF3C 00E05821 */  addu       $t3, $a3, $zero
/* BFB40 800BEF40 000757C3 */  sra        $t2, $a3, 0x1f
/* BFB44 800BEF44 AE020004 */  sw         $v0, 4($s0)
/* BFB48 800BEF48 256BFFF0 */  addiu      $t3, $t3, -0x10
/* BFB4C 800BEF4C 2D62FFF0 */  sltiu      $v0, $t3, -0x10
/* BFB50 800BEF50 254AFFFF */  addiu      $t2, $t2, -1
/* BFB54 800BEF54 01425021 */  addu       $t2, $t2, $v0
/* BFB58 800BEF58 AE0A00F0 */  sw         $t2, 0xf0($s0)
/* BFB5C 800BEF5C 0C030D90 */  jal        __osDisableInt
/* BFB60 800BEF60 AE0B00F4 */   sw        $t3, 0xf4($s0)
/* BFB64 800BEF64 3C03800F */  lui        $v1, %hi(__osActiveQueue)
/* BFB68 800BEF68 8C633CBC */  lw         $v1, %lo(__osActiveQueue)($v1)
/* BFB6C 800BEF6C 00402021 */  addu       $a0, $v0, $zero
/* BFB70 800BEF70 3C01800F */  lui        $at, %hi(__osActiveQueue)
/* BFB74 800BEF74 AC303CBC */  sw         $s0, %lo(__osActiveQueue)($at)
/* BFB78 800BEF78 0C030DAC */  jal        __osRestoreInt
/* BFB7C 800BEF7C AE03000C */   sw        $v1, 0xc($s0)
/* BFB80 800BEF80 8FBF0014 */  lw         $ra, 0x14($sp)
/* BFB84 800BEF84 8FB00010 */  lw         $s0, 0x10($sp)
/* BFB88 800BEF88 03E00008 */  jr         $ra
/* BFB8C 800BEF8C 27BD0018 */   addiu     $sp, $sp, 0x18
