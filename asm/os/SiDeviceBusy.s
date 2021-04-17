.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSiDeviceBusy
/* CD8D0 800CCCD0 3C02A480 */  lui        $v0, 0xa480
/* CD8D4 800CCCD4 34420018 */  ori        $v0, $v0, 0x18
/* CD8D8 800CCCD8 8C420000 */  lw         $v0, ($v0)
/* CD8DC 800CCCDC 30420003 */  andi       $v0, $v0, 3
/* CD8E0 800CCCE0 03E00008 */  jr         $ra
/* CD8E4 800CCCE4 0002102B */   sltu      $v0, $zero, $v0
/* CD8E8 800CCCE8 00000000 */  nop
/* CD8EC 800CCCEC 00000000 */  nop
