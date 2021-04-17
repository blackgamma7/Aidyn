.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpDeviceBusy
/* CDA40 800CCE40 3C02A404 */  lui        $v0, 0xa404
/* CDA44 800CCE44 34420010 */  ori        $v0, $v0, 0x10
/* CDA48 800CCE48 8C420000 */  lw         $v0, ($v0)
/* CDA4C 800CCE4C 3042001C */  andi       $v0, $v0, 0x1c
/* CDA50 800CCE50 03E00008 */  jr         $ra
/* CDA54 800CCE54 0002102B */   sltu      $v0, $zero, $v0
/* CDA58 800CCE58 00000000 */  nop
/* CDA5C 800CCE5C 00000000 */  nop
