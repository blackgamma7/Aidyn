.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetTime
/* C3C70 800C3070 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C3C74 800C3074 AFBF0024 */  sw         $ra, 0x24($sp)
/* C3C78 800C3078 AFB40020 */  sw         $s4, 0x20($sp)
/* C3C7C 800C307C AFB3001C */  sw         $s3, 0x1c($sp)
/* C3C80 800C3080 AFB20018 */  sw         $s2, 0x18($sp)
/* C3C84 800C3084 AFB10014 */  sw         $s1, 0x14($sp)
/* C3C88 800C3088 0C030D90 */  jal        __osDisableInt
/* C3C8C 800C308C AFB00010 */   sw        $s0, 0x10($sp)
/* C3C90 800C3090 0C030C40 */  jal        osGetCount
/* C3C94 800C3094 0040A021 */   addu      $s4, $v0, $zero
/* C3C98 800C3098 3C038010 */  lui        $v1, %hi(__osBaseCounter)
/* C3C9C 800C309C 8C63E7D0 */  lw         $v1, %lo(__osBaseCounter)($v1)
/* C3CA0 800C30A0 3C128010 */  lui        $s2, %hi(__osCurrentTime)
/* C3CA4 800C30A4 8E52E7E0 */  lw         $s2, %lo(__osCurrentTime)($s2)
/* C3CA8 800C30A8 3C138010 */  lui        $s3, %hi(__osCurrentTime+0x4)
/* C3CAC 800C30AC 8E73E7E4 */  lw         $s3, %lo(__osCurrentTime+0x4)($s3)
/* C3CB0 800C30B0 02802021 */  addu       $a0, $s4, $zero
/* C3CB4 800C30B4 0C030DAC */  jal        __osRestoreInt
/* C3CB8 800C30B8 00438023 */   subu      $s0, $v0, $v1
/* C3CBC 800C30BC 02008821 */  addu       $s1, $s0, $zero
/* C3CC0 800C30C0 00008021 */  addu       $s0, $zero, $zero
/* C3CC4 800C30C4 02711821 */  addu       $v1, $s3, $s1
/* C3CC8 800C30C8 0071202B */  sltu       $a0, $v1, $s1
/* C3CCC 800C30CC 02501021 */  addu       $v0, $s2, $s0
/* C3CD0 800C30D0 00441021 */  addu       $v0, $v0, $a0
/* C3CD4 800C30D4 8FBF0024 */  lw         $ra, 0x24($sp)
/* C3CD8 800C30D8 8FB40020 */  lw         $s4, 0x20($sp)
/* C3CDC 800C30DC 8FB3001C */  lw         $s3, 0x1c($sp)
/* C3CE0 800C30E0 8FB20018 */  lw         $s2, 0x18($sp)
/* C3CE4 800C30E4 8FB10014 */  lw         $s1, 0x14($sp)
/* C3CE8 800C30E8 8FB00010 */  lw         $s0, 0x10($sp)
/* C3CEC 800C30EC 03E00008 */  jr         $ra
/* C3CF0 800C30F0 27BD0028 */   addiu     $sp, $sp, 0x28
/* C3CF4 800C30F4 00000000 */  nop
/* C3CF8 800C30F8 00000000 */  nop
/* C3CFC 800C30FC 00000000 */  nop
