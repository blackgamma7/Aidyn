.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osCreateMesgQueue
/* BFA90 800BEE90 3C02800F */  lui        $v0, %hi(__osThreadTail)
/* BFA94 800BEE94 24423CB0 */  addiu      $v0, $v0, %lo(__osThreadTail)
/* BFA98 800BEE98 AC820000 */  sw         $v0, ($a0)
/* BFA9C 800BEE9C AC820004 */  sw         $v0, 4($a0)
/* BFAA0 800BEEA0 AC800008 */  sw         $zero, 8($a0)
/* BFAA4 800BEEA4 AC80000C */  sw         $zero, 0xc($a0)
/* BFAA8 800BEEA8 AC860010 */  sw         $a2, 0x10($a0)
/* BFAAC 800BEEAC 03E00008 */  jr         $ra
/* BFAB0 800BEEB0 AC850014 */   sw        $a1, 0x14($a0)
/* BFAB4 800BEEB4 00000000 */  nop
/* BFAB8 800BEEB8 00000000 */  nop
/* BFABC 800BEEBC 00000000 */  nop
