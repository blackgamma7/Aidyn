.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osaiDeviceBusy
/* BEEF0 800BE2F0 3C02A450 */  lui        $v0, 0xa450
/* BEEF4 800BE2F4 3442000C */  ori        $v0, $v0, 0xc
/* BEEF8 800BE2F8 8C420000 */  lw         $v0, ($v0)
/* BEEFC 800BE2FC 03E00008 */  jr         $ra
/* BEF00 800BE300 28420000 */   slti      $v0, $v0, 0
/* BEF04 800BE304 00000000 */  nop
/* BEF08 800BE308 00000000 */  nop
/* BEF0C 800BE30C 00000000 */  nop
