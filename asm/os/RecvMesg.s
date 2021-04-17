.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osRecvMesg
/* C9390 800C8790 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C9394 800C8794 AFB00010 */  sw         $s0, 0x10($sp)
/* C9398 800C8798 00808021 */  addu       $s0, $a0, $zero
/* C939C 800C879C AFB40020 */  sw         $s4, 0x20($sp)
/* C93A0 800C87A0 00A0A021 */  addu       $s4, $a1, $zero
/* C93A4 800C87A4 AFB10014 */  sw         $s1, 0x14($sp)
/* C93A8 800C87A8 00C08821 */  addu       $s1, $a2, $zero
/* C93AC 800C87AC AFBF0024 */  sw         $ra, 0x24($sp)
/* C93B0 800C87B0 AFB3001C */  sw         $s3, 0x1c($sp)
/* C93B4 800C87B4 0C030D90 */  jal        __osDisableInt
/* C93B8 800C87B8 AFB20018 */   sw        $s2, 0x18($sp)
/* C93BC 800C87BC 8E030008 */  lw         $v1, 8($s0)
/* C93C0 800C87C0 1460000F */  bnez       $v1, .L800C8800
/* C93C4 800C87C4 00409021 */   addu      $s2, $v0, $zero
/* C93C8 800C87C8 24130008 */  addiu      $s3, $zero, 8
.L800C87CC:
/* C93CC 800C87CC 16200005 */  bnez       $s1, .L800C87E4
/* C93D0 800C87D0 02002021 */   addu      $a0, $s0, $zero
/* C93D4 800C87D4 0C030DAC */  jal        __osRestoreInt
/* C93D8 800C87D8 02402021 */   addu      $a0, $s2, $zero
/* C93DC 800C87DC 08032225 */  j          .L800C8894
/* C93E0 800C87E0 2402FFFF */   addiu     $v0, $zero, -1
.L800C87E4:
/* C93E4 800C87E4 3C02800F */  lui        $v0, %hi(__osRunningThread)
/* C93E8 800C87E8 8C423CC0 */  lw         $v0, %lo(__osRunningThread)($v0)
/* C93EC 800C87EC 0C02FEA5 */  jal        __osEnqueueAndYeild
/* C93F0 800C87F0 A4530010 */   sh        $s3, 0x10($v0)
/* C93F4 800C87F4 8E020008 */  lw         $v0, 8($s0)
/* C93F8 800C87F8 1040FFF4 */  beqz       $v0, .L800C87CC
/* C93FC 800C87FC 00000000 */   nop
.L800C8800:
/* C9400 800C8800 12800007 */  beqz       $s4, .L800C8820
/* C9404 800C8804 00000000 */   nop
/* C9408 800C8808 8E02000C */  lw         $v0, 0xc($s0)
/* C940C 800C880C 8E030014 */  lw         $v1, 0x14($s0)
/* C9410 800C8810 00021080 */  sll        $v0, $v0, 2
/* C9414 800C8814 00431021 */  addu       $v0, $v0, $v1
/* C9418 800C8818 8C420000 */  lw         $v0, ($v0)
/* C941C 800C881C AE820000 */  sw         $v0, ($s4)
.L800C8820:
/* C9420 800C8820 8E02000C */  lw         $v0, 0xc($s0)
/* C9424 800C8824 8E030010 */  lw         $v1, 0x10($s0)
/* C9428 800C8828 24420001 */  addiu      $v0, $v0, 1
/* C942C 800C882C 0043001A */  div        $zero, $v0, $v1
/* C9430 800C8830 14600002 */  bnez       $v1, .L800C883C
/* C9434 800C8834 00000000 */   nop
/* C9438 800C8838 0007000D */  break      7
.L800C883C:
/* C943C 800C883C 2401FFFF */   addiu     $at, $zero, -1
/* C9440 800C8840 14610004 */  bne        $v1, $at, .L800C8854
/* C9444 800C8844 3C018000 */   lui       $at, 0x8000
/* C9448 800C8848 14410002 */  bne        $v0, $at, .L800C8854
/* C944C 800C884C 00000000 */   nop
/* C9450 800C8850 0006000D */  break      6
.L800C8854:
/* C9454 800C8854 00002010 */   mfhi      $a0
/* C9458 800C8858 8E020008 */  lw         $v0, 8($s0)
/* C945C 800C885C 8E030004 */  lw         $v1, 4($s0)
/* C9460 800C8860 2442FFFF */  addiu      $v0, $v0, -1
/* C9464 800C8864 AE020008 */  sw         $v0, 8($s0)
/* C9468 800C8868 AE04000C */  sw         $a0, 0xc($s0)
/* C946C 800C886C 8C620000 */  lw         $v0, ($v1)
/* C9470 800C8870 10400005 */  beqz       $v0, .L800C8888
/* C9474 800C8874 00000000 */   nop
/* C9478 800C8878 0C02FEF9 */  jal        __osPopThread
/* C947C 800C887C 26040004 */   addiu     $a0, $s0, 4
/* C9480 800C8880 0C0334B8 */  jal        osStartThread
/* C9484 800C8884 00402021 */   addu      $a0, $v0, $zero
.L800C8888:
/* C9488 800C8888 0C030DAC */  jal        __osRestoreInt
/* C948C 800C888C 02402021 */   addu      $a0, $s2, $zero
/* C9490 800C8890 00001021 */  addu       $v0, $zero, $zero
.L800C8894:
/* C9494 800C8894 8FBF0024 */  lw         $ra, 0x24($sp)
/* C9498 800C8898 8FB40020 */  lw         $s4, 0x20($sp)
/* C949C 800C889C 8FB3001C */  lw         $s3, 0x1c($sp)
/* C94A0 800C88A0 8FB20018 */  lw         $s2, 0x18($sp)
/* C94A4 800C88A4 8FB10014 */  lw         $s1, 0x14($sp)
/* C94A8 800C88A8 8FB00010 */  lw         $s0, 0x10($sp)
/* C94AC 800C88AC 03E00008 */  jr         $ra
/* C94B0 800C88B0 27BD0028 */   addiu     $sp, $sp, 0x28
/* C94B4 800C88B4 00000000 */  nop
/* C94B8 800C88B8 00000000 */  nop
/* C94BC 800C88BC 00000000 */  nop
