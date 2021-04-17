.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osJamMesg
/* C8440 800C7840 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* C8444 800C7844 AFB00010 */  sw         $s0, 0x10($sp)
/* C8448 800C7848 00808021 */  addu       $s0, $a0, $zero
/* C844C 800C784C AFB50024 */  sw         $s5, 0x24($sp)
/* C8450 800C7850 00A0A821 */  addu       $s5, $a1, $zero
/* C8454 800C7854 AFB20018 */  sw         $s2, 0x18($sp)
/* C8458 800C7858 00C09021 */  addu       $s2, $a2, $zero
/* C845C 800C785C AFBF0028 */  sw         $ra, 0x28($sp)
/* C8460 800C7860 AFB40020 */  sw         $s4, 0x20($sp)
/* C8464 800C7864 AFB3001C */  sw         $s3, 0x1c($sp)
/* C8468 800C7868 0C030D90 */  jal        __osDisableInt
/* C846C 800C786C AFB10014 */   sw        $s1, 0x14($sp)
/* C8470 800C7870 8E030008 */  lw         $v1, 8($s0)
/* C8474 800C7874 8E040010 */  lw         $a0, 0x10($s0)
/* C8478 800C7878 0064182A */  slt        $v1, $v1, $a0
/* C847C 800C787C 14600012 */  bnez       $v1, .L800C78C8
/* C8480 800C7880 00408821 */   addu      $s1, $v0, $zero
/* C8484 800C7884 24140001 */  addiu      $s4, $zero, 1
/* C8488 800C7888 24130008 */  addiu      $s3, $zero, 8
.L800C788C:
/* C848C 800C788C 12540005 */  beq        $s2, $s4, .L800C78A4
/* C8490 800C7890 26040004 */   addiu     $a0, $s0, 4
/* C8494 800C7894 0C030DAC */  jal        __osRestoreInt
/* C8498 800C7898 02202021 */   addu      $a0, $s1, $zero
/* C849C 800C789C 08031E54 */  j          .L800C7950
/* C84A0 800C78A0 2402FFFF */   addiu     $v0, $zero, -1
.L800C78A4:
/* C84A4 800C78A4 3C02800F */  lui        $v0, %hi(__osRunningThread)
/* C84A8 800C78A8 8C423CC0 */  lw         $v0, %lo(__osRunningThread)($v0)
/* C84AC 800C78AC 0C02FEA5 */  jal        __osEnqueueAndYeild
/* C84B0 800C78B0 A4530010 */   sh        $s3, 0x10($v0)
/* C84B4 800C78B4 8E020008 */  lw         $v0, 8($s0)
/* C84B8 800C78B8 8E030010 */  lw         $v1, 0x10($s0)
/* C84BC 800C78BC 0043102A */  slt        $v0, $v0, $v1
/* C84C0 800C78C0 1040FFF2 */  beqz       $v0, .L800C788C
/* C84C4 800C78C4 00000000 */   nop
.L800C78C8:
/* C84C8 800C78C8 8E02000C */  lw         $v0, 0xc($s0)
/* C84CC 800C78CC 8E030010 */  lw         $v1, 0x10($s0)
/* C84D0 800C78D0 00431021 */  addu       $v0, $v0, $v1
/* C84D4 800C78D4 2442FFFF */  addiu      $v0, $v0, -1
/* C84D8 800C78D8 0043001A */  div        $zero, $v0, $v1
/* C84DC 800C78DC 14600002 */  bnez       $v1, .L800C78E8
/* C84E0 800C78E0 00000000 */   nop
/* C84E4 800C78E4 0007000D */  break      7
.L800C78E8:
/* C84E8 800C78E8 2401FFFF */   addiu     $at, $zero, -1
/* C84EC 800C78EC 14610004 */  bne        $v1, $at, .L800C7900
/* C84F0 800C78F0 3C018000 */   lui       $at, 0x8000
/* C84F4 800C78F4 14410002 */  bne        $v0, $at, .L800C7900
/* C84F8 800C78F8 00000000 */   nop
/* C84FC 800C78FC 0006000D */  break      6
.L800C7900:
/* C8500 800C7900 00001810 */   mfhi      $v1
/* C8504 800C7904 8E020014 */  lw         $v0, 0x14($s0)
/* C8508 800C7908 AE03000C */  sw         $v1, 0xc($s0)
/* C850C 800C790C 00031880 */  sll        $v1, $v1, 2
/* C8510 800C7910 00621821 */  addu       $v1, $v1, $v0
/* C8514 800C7914 AC750000 */  sw         $s5, ($v1)
/* C8518 800C7918 8E020008 */  lw         $v0, 8($s0)
/* C851C 800C791C 8E030000 */  lw         $v1, ($s0)
/* C8520 800C7920 24420001 */  addiu      $v0, $v0, 1
/* C8524 800C7924 AE020008 */  sw         $v0, 8($s0)
/* C8528 800C7928 8C620000 */  lw         $v0, ($v1)
/* C852C 800C792C 10400005 */  beqz       $v0, .L800C7944
/* C8530 800C7930 00000000 */   nop
/* C8534 800C7934 0C02FEF9 */  jal        __osPopThread
/* C8538 800C7938 02002021 */   addu      $a0, $s0, $zero
/* C853C 800C793C 0C0334B8 */  jal        osStartThread
/* C8540 800C7940 00402021 */   addu      $a0, $v0, $zero
.L800C7944:
/* C8544 800C7944 0C030DAC */  jal        __osRestoreInt
/* C8548 800C7948 02202021 */   addu      $a0, $s1, $zero
/* C854C 800C794C 00001021 */  addu       $v0, $zero, $zero
.L800C7950:
/* C8550 800C7950 8FBF0028 */  lw         $ra, 0x28($sp)
/* C8554 800C7954 8FB50024 */  lw         $s5, 0x24($sp)
/* C8558 800C7958 8FB40020 */  lw         $s4, 0x20($sp)
/* C855C 800C795C 8FB3001C */  lw         $s3, 0x1c($sp)
/* C8560 800C7960 8FB20018 */  lw         $s2, 0x18($sp)
/* C8564 800C7964 8FB10014 */  lw         $s1, 0x14($sp)
/* C8568 800C7968 8FB00010 */  lw         $s0, 0x10($sp)
/* C856C 800C796C 03E00008 */  jr         $ra
/* C8570 800C7970 27BD0030 */   addiu     $sp, $sp, 0x30
/* C8574 800C7974 00000000 */  nop
/* C8578 800C7978 00000000 */  nop
/* C857C 800C797C 00000000 */  nop
