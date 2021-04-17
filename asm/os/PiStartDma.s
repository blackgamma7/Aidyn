.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPiStartDma
/* C8390 800C7790 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C8394 800C7794 AFB00010 */  sw         $s0, 0x10($sp)
/* C8398 800C7798 00808021 */  addu       $s0, $a0, $zero
/* C839C 800C779C 8FA40028 */  lw         $a0, 0x28($sp)
/* C83A0 800C77A0 3C02800F */  lui        $v0, %hi(__osPiDevMgr)
/* C83A4 800C77A4 8C423870 */  lw         $v0, %lo(__osPiDevMgr)($v0)
/* C83A8 800C77A8 8FA8002C */  lw         $t0, 0x2c($sp)
/* C83AC 800C77AC 8FA30030 */  lw         $v1, 0x30($sp)
/* C83B0 800C77B0 14400003 */  bnez       $v0, .L800C77C0
/* C83B4 800C77B4 AFBF0014 */   sw        $ra, 0x14($sp)
/* C83B8 800C77B8 08031E0A */  j          .L800C7828
/* C83BC 800C77BC 2402FFFF */   addiu     $v0, $zero, -1
.L800C77C0:
/* C83C0 800C77C0 14C00002 */  bnez       $a2, .L800C77CC
/* C83C4 800C77C4 2402000C */   addiu     $v0, $zero, 0xc
/* C83C8 800C77C8 2402000B */  addiu      $v0, $zero, 0xb
.L800C77CC:
/* C83CC 800C77CC A6020000 */  sh         $v0, ($s0)
/* C83D0 800C77D0 24020001 */  addiu      $v0, $zero, 1
/* C83D4 800C77D4 A2050002 */  sb         $a1, 2($s0)
/* C83D8 800C77D8 AE030004 */  sw         $v1, 4($s0)
/* C83DC 800C77DC AE040008 */  sw         $a0, 8($s0)
/* C83E0 800C77E0 AE07000C */  sw         $a3, 0xc($s0)
/* C83E4 800C77E4 AE080010 */  sw         $t0, 0x10($s0)
/* C83E8 800C77E8 14A20009 */  bne        $a1, $v0, .L800C7810
/* C83EC 800C77EC AE000014 */   sw        $zero, 0x14($s0)
/* C83F0 800C77F0 0C031E60 */  jal        osPiGetCmdQueue
/* C83F4 800C77F4 00000000 */   nop
/* C83F8 800C77F8 00402021 */  addu       $a0, $v0, $zero
/* C83FC 800C77FC 02002821 */  addu       $a1, $s0, $zero
/* C8400 800C7800 0C031E10 */  jal        osJamMesg
/* C8404 800C7804 00003021 */   addu      $a2, $zero, $zero
/* C8408 800C7808 08031E0A */  j          .L800C7828
/* C840C 800C780C 00000000 */   nop
.L800C7810:
/* C8410 800C7810 0C031E60 */  jal        osPiGetCmdQueue
/* C8414 800C7814 00000000 */   nop
/* C8418 800C7818 00402021 */  addu       $a0, $v0, $zero
/* C841C 800C781C 02002821 */  addu       $a1, $s0, $zero
/* C8420 800C7820 0C03313C */  jal        osSendMesg
/* C8424 800C7824 00003021 */   addu      $a2, $zero, $zero
.L800C7828:
/* C8428 800C7828 8FBF0014 */  lw         $ra, 0x14($sp)
/* C842C 800C782C 8FB00010 */  lw         $s0, 0x10($sp)
/* C8430 800C7830 03E00008 */  jr         $ra
/* C8434 800C7834 27BD0018 */   addiu     $sp, $sp, 0x18
/* C8438 800C7838 00000000 */  nop
/* C843C 800C783C 00000000 */  nop
