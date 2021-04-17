.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osDCPDevicebusy
/* CD0D0 800CC4D0 3C02A410 */  lui        $v0, 0xa410
/* CD0D4 800CC4D4 3442000C */  ori        $v0, $v0, 0xc
/* CD0D8 800CC4D8 8C420000 */  lw         $v0, ($v0)
/* CD0DC 800CC4DC 30420100 */  andi       $v0, $v0, 0x100
/* CD0E0 800CC4E0 03E00008 */  jr         $ra
/* CD0E4 800CC4E4 0002102B */   sltu      $v0, $zero, $v0
/* CD0E8 800CC4E8 00000000 */  nop
/* CD0EC 800CC4EC 00000000 */  nop
