.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osViSetEvent
/* D2F40 800D2340 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D2F44 800D2344 AFB00010 */  sw         $s0, 0x10($sp)
/* D2F48 800D2348 00808021 */  addu       $s0, $a0, $zero
/* D2F4C 800D234C AFB10014 */  sw         $s1, 0x14($sp)
/* D2F50 800D2350 00A08821 */  addu       $s1, $a1, $zero
/* D2F54 800D2354 AFB20018 */  sw         $s2, 0x18($sp)
/* D2F58 800D2358 AFBF001C */  sw         $ra, 0x1c($sp)
/* D2F5C 800D235C 0C030D90 */  jal        __osDisableInt
/* D2F60 800D2360 00C09021 */   addu      $s2, $a2, $zero
/* D2F64 800D2364 3C03800F */  lui        $v1, %hi(__osViNext)
/* D2F68 800D2368 8C633D44 */  lw         $v1, %lo(__osViNext)($v1)
/* D2F6C 800D236C 00402021 */  addu       $a0, $v0, $zero
/* D2F70 800D2370 AC700010 */  sw         $s0, 0x10($v1)
/* D2F74 800D2374 AC710014 */  sw         $s1, 0x14($v1)
/* D2F78 800D2378 0C030DAC */  jal        __osRestoreInt
/* D2F7C 800D237C A4720002 */   sh        $s2, 2($v1)
/* D2F80 800D2380 8FBF001C */  lw         $ra, 0x1c($sp)
/* D2F84 800D2384 8FB20018 */  lw         $s2, 0x18($sp)
/* D2F88 800D2388 8FB10014 */  lw         $s1, 0x14($sp)
/* D2F8C 800D238C 8FB00010 */  lw         $s0, 0x10($sp)
/* D2F90 800D2390 03E00008 */  jr         $ra
/* D2F94 800D2394 27BD0020 */   addiu     $sp, $sp, 0x20
/* D2F98 800D2398 00000000 */  nop
/* D2F9C 800D239C 00000000 */  nop
