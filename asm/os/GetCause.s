.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osGetCause
/* C41A0 800C35A0 40026800 */  mfc0       $v0, $13
/* C41A4 800C35A4 03E00008 */  jr         $ra
/* C41A8 800C35A8 00000000 */   nop
/* C41AC 800C35AC 00000000 */  nop
