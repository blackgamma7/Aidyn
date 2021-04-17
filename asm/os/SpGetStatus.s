.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpGetStatus
/* CDEC0 800CD2C0 3C02A404 */  lui        $v0, 0xa404
/* CDEC4 800CD2C4 34420010 */  ori        $v0, $v0, 0x10
/* CDEC8 800CD2C8 03E00008 */  jr         $ra
/* CDECC 800CD2CC 8C420000 */   lw        $v0, ($v0)
