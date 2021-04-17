.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSiCreateAccessQueue
/* CD540 800CC940 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD544 800CC944 24020001 */  addiu      $v0, $zero, 1
/* CD548 800CC948 AFB00010 */  sw         $s0, 0x10($sp)
/* CD54C 800CC94C 3C108010 */  lui        $s0, %hi(__osSiAccessQueue)
/* CD550 800CC950 2610E770 */  addiu      $s0, $s0, %lo(__osSiAccessQueue)
/* CD554 800CC954 02002021 */  addu       $a0, $s0, $zero
/* CD558 800CC958 3C058010 */  lui        $a1, %hi(siAccessBuf)
/* CD55C 800CC95C 24A5E760 */  addiu      $a1, $a1, %lo(siAccessBuf)
/* CD560 800CC960 AFBF0014 */  sw         $ra, 0x14($sp)
/* CD564 800CC964 3C01800F */  lui        $at, %hi(__osSiAcessQueueEnabled)
/* CD568 800CC968 AC2239E0 */  sw         $v0, %lo(__osSiAcessQueueEnabled)($at)
/* CD56C 800CC96C 0C02FBA4 */  jal        osCreateMesgQueue
/* CD570 800CC970 24060001 */   addiu     $a2, $zero, 1
/* CD574 800CC974 02002021 */  addu       $a0, $s0, $zero
/* CD578 800CC978 00002821 */  addu       $a1, $zero, $zero
/* CD57C 800CC97C 0C03313C */  jal        osSendMesg
/* CD580 800CC980 00003021 */   addu      $a2, $zero, $zero
/* CD584 800CC984 8FBF0014 */  lw         $ra, 0x14($sp)
/* CD588 800CC988 8FB00010 */  lw         $s0, 0x10($sp)
/* CD58C 800CC98C 03E00008 */  jr         $ra
/* CD590 800CC990 27BD0018 */   addiu     $sp, $sp, 0x18

glabel __osSiGetAccess
/* CD594 800CC994 3C02800F */  lui        $v0, %hi(__osSiAcessQueueEnabled)
/* CD598 800CC998 8C4239E0 */  lw         $v0, %lo(__osSiAcessQueueEnabled)($v0)
/* CD59C 800CC99C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CD5A0 800CC9A0 1440000F */  bnez       $v0, .L800CC9E0
/* CD5A4 800CC9A4 AFBF0018 */   sw        $ra, 0x18($sp)
/* CD5A8 800CC9A8 24020001 */  addiu      $v0, $zero, 1
/* CD5AC 800CC9AC 3C01800F */  lui        $at, %hi(__osSiAcessQueueEnabled)
/* CD5B0 800CC9B0 AC2239E0 */  sw         $v0, %lo(__osSiAcessQueueEnabled)($at)
/* CD5B4 800CC9B4 3C048010 */  lui        $a0, %hi(__osSiAccessQueue)
/* CD5B8 800CC9B8 2484E770 */  addiu      $a0, $a0, %lo(__osSiAccessQueue)
/* CD5BC 800CC9BC 3C058010 */  lui        $a1, %hi(siAccessBuf)
/* CD5C0 800CC9C0 24A5E760 */  addiu      $a1, $a1, %lo(siAccessBuf)
/* CD5C4 800CC9C4 0C02FBA4 */  jal        osCreateMesgQueue
/* CD5C8 800CC9C8 24060001 */   addiu     $a2, $zero, 1
/* CD5CC 800CC9CC 3C048010 */  lui        $a0, %hi(__osSiAccessQueue)
/* CD5D0 800CC9D0 2484E770 */  addiu      $a0, $a0, %lo(__osSiAccessQueue)
/* CD5D4 800CC9D4 00002821 */  addu       $a1, $zero, $zero
/* CD5D8 800CC9D8 0C03313C */  jal        osSendMesg
/* CD5DC 800CC9DC 00003021 */   addu      $a2, $zero, $zero
.L800CC9E0:
/* CD5E0 800CC9E0 3C048010 */  lui        $a0, %hi(__osSiAccessQueue)
/* CD5E4 800CC9E4 2484E770 */  addiu      $a0, $a0, %lo(__osSiAccessQueue)
/* CD5E8 800CC9E8 27A50010 */  addiu      $a1, $sp, 0x10
/* CD5EC 800CC9EC 0C0321E4 */  jal        osRecvMesg
/* CD5F0 800CC9F0 24060001 */   addiu     $a2, $zero, 1
/* CD5F4 800CC9F4 8FBF0018 */  lw         $ra, 0x18($sp)
/* CD5F8 800CC9F8 03E00008 */  jr         $ra
/* CD5FC 800CC9FC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel _osSiRelAccess
/* CD600 800CCA00 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD604 800CCA04 AFBF0010 */  sw         $ra, 0x10($sp)
/* CD608 800CCA08 3C048010 */  lui        $a0, %hi(__osSiAccessQueue)
/* CD60C 800CCA0C 2484E770 */  addiu      $a0, $a0, %lo(__osSiAccessQueue)
/* CD610 800CCA10 00002821 */  addu       $a1, $zero, $zero
/* CD614 800CCA14 0C03313C */  jal        osSendMesg
/* CD618 800CCA18 00003021 */   addu      $a2, $zero, $zero
/* CD61C 800CCA1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* CD620 800CCA20 03E00008 */  jr         $ra
/* CD624 800CCA24 27BD0018 */   addiu     $sp, $sp, 0x18
/* CD628 800CCA28 00000000 */  nop
/* CD62C 800CCA2C 00000000 */  nop
