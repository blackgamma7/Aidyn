.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel passto_passtoMalloc
/* D7260 800D6660 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D7264 800D6664 AFBF0010 */  sw         $ra, 0x10($sp)
/* D7268 800D6668 0C026259 */  jal        passToMalloc
/* D726C 800D666C 00000000 */   nop
/* D7270 800D6670 8FBF0010 */  lw         $ra, 0x10($sp)
/* D7274 800D6674 03E00008 */  jr         $ra
/* D7278 800D6678 27BD0018 */   addiu     $sp, $sp, 0x18
/* D727C 800D667C 00000000 */  nop
