.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osReadHost
/* C92C0 800C86C0 3C02800F */  lui        $v0, %hi(readHostInitialized)
/* C92C4 800C86C4 8C4238B0 */  lw         $v0, %lo(readHostInitialized)($v0)
/* C92C8 800C86C8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* C92CC 800C86CC AFB20020 */  sw         $s2, 0x20($sp)
/* C92D0 800C86D0 00809021 */  addu       $s2, $a0, $zero
/* C92D4 800C86D4 AFB30024 */  sw         $s3, 0x24($sp)
/* C92D8 800C86D8 00A09821 */  addu       $s3, $a1, $zero
/* C92DC 800C86DC AFB1001C */  sw         $s1, 0x1c($sp)
/* C92E0 800C86E0 00008821 */  addu       $s1, $zero, $zero
/* C92E4 800C86E4 AFBF0028 */  sw         $ra, 0x28($sp)
/* C92E8 800C86E8 1440000F */  bnez       $v0, .L800C8728
/* C92EC 800C86EC AFB00018 */   sw        $s0, 0x18($sp)
/* C92F0 800C86F0 3C108010 */  lui        $s0, %hi(readHostMegQueue)
/* C92F4 800C86F4 26109550 */  addiu      $s0, $s0, %lo(readHostMegQueue)
/* C92F8 800C86F8 02002021 */  addu       $a0, $s0, $zero
/* C92FC 800C86FC 3C058010 */  lui        $a1, %hi(readHostMesgBuf)
/* C9300 800C8700 24A59568 */  addiu      $a1, $a1, %lo(readHostMesgBuf)
/* C9304 800C8704 0C02FBA4 */  jal        osCreateMesgQueue
/* C9308 800C8708 24060001 */   addiu     $a2, $zero, 1
/* C930C 800C870C 2404000F */  addiu      $a0, $zero, 0xf
/* C9310 800C8710 02002821 */  addu       $a1, $s0, $zero
/* C9314 800C8714 0C033188 */  jal        osSetEventMesg
/* C9318 800C8718 00003021 */   addu      $a2, $zero, $zero
/* C931C 800C871C 24020001 */  addiu      $v0, $zero, 1
/* C9320 800C8720 3C01800F */  lui        $at, %hi(readHostInitialized)
/* C9324 800C8724 AC2238B0 */  sw         $v0, %lo(readHostInitialized)($at)
.L800C8728:
/* C9328 800C8728 3C018010 */  lui        $at, %hi(__osRdb_Read_Data_Buf)
/* C932C 800C872C AC329574 */  sw         $s2, %lo(__osRdb_Read_Data_Buf)($at)
/* C9330 800C8730 3C018010 */  lui        $at, %hi(__osRdb_Read_Data_Ct)
/* C9334 800C8734 AC339570 */  sw         $s3, %lo(__osRdb_Read_Data_Ct)($at)
/* C9338 800C8738 27A40010 */  addiu      $a0, $sp, 0x10
.L800C873C:
/* C933C 800C873C 24050001 */  addiu      $a1, $zero, 1
/* C9340 800C8740 0C02FF60 */  jal        __osRdbSend
/* C9344 800C8744 24060005 */   addiu     $a2, $zero, 5
/* C9348 800C8748 02228821 */  addu       $s1, $s1, $v0
/* C934C 800C874C 1220FFFB */  beqz       $s1, .L800C873C
/* C9350 800C8750 27A40010 */   addiu     $a0, $sp, 0x10
/* C9354 800C8754 3C048010 */  lui        $a0, %hi(readHostMegQueue)
/* C9358 800C8758 24849550 */  addiu      $a0, $a0, %lo(readHostMegQueue)
/* C935C 800C875C 00002821 */  addu       $a1, $zero, $zero
/* C9360 800C8760 0C0321E4 */  jal        osRecvMesg
/* C9364 800C8764 24060001 */   addiu     $a2, $zero, 1
/* C9368 800C8768 8FBF0028 */  lw         $ra, 0x28($sp)
/* C936C 800C876C 8FB30024 */  lw         $s3, 0x24($sp)
/* C9370 800C8770 8FB20020 */  lw         $s2, 0x20($sp)
/* C9374 800C8774 8FB1001C */  lw         $s1, 0x1c($sp)
/* C9378 800C8778 8FB00018 */  lw         $s0, 0x18($sp)
/* C937C 800C877C 03E00008 */  jr         $ra
/* C9380 800C8780 27BD0030 */   addiu     $sp, $sp, 0x30
/* C9384 800C8784 00000000 */  nop
/* C9388 800C8788 00000000 */  nop
/* C938C 800C878C 00000000 */  nop
