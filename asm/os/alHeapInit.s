.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alHeapInit
/* C3D60 800C3160 30A3000F */  andi       $v1, $a1, 0xf
/* C3D64 800C3164 24020010 */  addiu      $v0, $zero, 0x10
/* C3D68 800C3168 00431823 */  subu       $v1, $v0, $v1
/* C3D6C 800C316C 10620003 */  beq        $v1, $v0, .L800C317C
/* C3D70 800C3170 00A31021 */   addu      $v0, $a1, $v1
/* C3D74 800C3174 08030C60 */  j          .L800C3180
/* C3D78 800C3178 AC820000 */   sw        $v0, ($a0)
.L800C317C:
/* C3D7C 800C317C AC850000 */  sw         $a1, ($a0)
.L800C3180:
/* C3D80 800C3180 8C820000 */  lw         $v0, ($a0)
/* C3D84 800C3184 AC860008 */  sw         $a2, 8($a0)
/* C3D88 800C3188 AC80000C */  sw         $zero, 0xc($a0)
/* C3D8C 800C318C 03E00008 */  jr         $ra
/* C3D90 800C3190 AC820004 */   sw        $v0, 4($a0)
/* C3D94 800C3194 00000000 */  nop
/* C3D98 800C3198 00000000 */  nop
/* C3D9C 800C319C 00000000 */  nop
