.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osResetGlobalIntMask
/* C94C0 800C88C0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C94C4 800C88C4 AFB00010 */  sw         $s0, 0x10($sp)
/* C94C8 800C88C8 AFBF0014 */  sw         $ra, 0x14($sp)
/* C94CC 800C88CC 0C030D90 */  jal        __osDisableInt
/* C94D0 800C88D0 00808021 */   addu      $s0, $a0, $zero
/* C94D4 800C88D4 3C03800F */  lui        $v1, %hi(__OSGlobalIntMask)
/* C94D8 800C88D8 8C633840 */  lw         $v1, %lo(__OSGlobalIntMask)($v1)
/* C94DC 800C88DC 00108027 */  nor        $s0, $zero, $s0
/* C94E0 800C88E0 36100401 */  ori        $s0, $s0, 0x401
/* C94E4 800C88E4 00701824 */  and        $v1, $v1, $s0
/* C94E8 800C88E8 3C01800F */  lui        $at, %hi(__OSGlobalIntMask)
/* C94EC 800C88EC AC233840 */  sw         $v1, %lo(__OSGlobalIntMask)($at)
/* C94F0 800C88F0 0C030DAC */  jal        __osRestoreInt
/* C94F4 800C88F4 00402021 */   addu      $a0, $v0, $zero
/* C94F8 800C88F8 8FBF0014 */  lw         $ra, 0x14($sp)
/* C94FC 800C88FC 8FB00010 */  lw         $s0, 0x10($sp)
/* C9500 800C8900 03E00008 */  jr         $ra
/* C9504 800C8904 27BD0018 */   addiu     $sp, $sp, 0x18
/* C9508 800C8908 00000000 */  nop
/* C950C 800C890C 00000000 */  nop
