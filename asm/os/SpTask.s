.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpSetStatus
/* CDE40 800CD240 3C02A404 */  lui        $v0, 0xa404
/* CDE44 800CD244 34420010 */  ori        $v0, $v0, 0x10
/* CDE48 800CD248 03E00008 */  jr         $ra
/* CDE4C 800CD24C AC440000 */   sw        $a0, ($v0)

glabel osSpTaskYield
/* CDE50 800CD250 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CDE54 800CD254 AFBF0010 */  sw         $ra, 0x10($sp)
/* CDE58 800CD258 0C033490 */  jal        __osSpSetStatus
/* CDE5C 800CD25C 24040400 */   addiu     $a0, $zero, 0x400
/* CDE60 800CD260 8FBF0010 */  lw         $ra, 0x10($sp)
/* CDE64 800CD264 03E00008 */  jr         $ra
/* CDE68 800CD268 27BD0018 */   addiu     $sp, $sp, 0x18
/* CDE6C 800CD26C 00000000 */  nop
