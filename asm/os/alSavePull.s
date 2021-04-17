.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViGetNextFramebuffer
/* D2A90 800D1E90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2A94 800D1E94 AFBF0014 */  sw         $ra, 0x14($sp)
/* D2A98 800D1E98 0C030D90 */  jal        __osDisableInt
/* D2A9C 800D1E9C AFB00010 */   sw        $s0, 0x10($sp)
/* D2AA0 800D1EA0 3C03800F */  lui        $v1, %hi(__osViNext)
/* D2AA4 800D1EA4 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D2AA8 800D1EA8 8C700004 */  lw         $s0, 4($v1)
/* D2AAC 800D1EAC 0C030DAC */  jal        __osRestoreInt
/* D2AB0 800D1EB0 00402021 */   addu      $a0, $v0, $zero
/* D2AB4 800D1EB4 02001021 */  addu       $v0, $s0, $zero
/* D2AB8 800D1EB8 8FBF0014 */  lw         $ra, 0x14($sp)
/* D2ABC 800D1EBC 8FB00010 */  lw         $s0, 0x10($sp)
/* D2AC0 800D1EC0 03E00008 */  jr         $ra
/* D2AC4 800D1EC4 27BD0018 */   addiu     $sp, $sp, 0x18
/* D2AC8 800D1EC8 00000000 */  nop
/* D2ACC 800D1ECC 00000000 */  nop
