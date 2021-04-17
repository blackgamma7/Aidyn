.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osUnmapTLBAll
/* D2890 800D1C90 40085000 */  mfc0       $t0, $10
/* D2894 800D1C94 2409001E */  addiu      $t1, $zero, 0x1e
/* D2898 800D1C98 3C0A8000 */  lui        $t2, 0x8000
/* D289C 800D1C9C 408A5000 */  mtc0       $t2, $10
/* D28A0 800D1CA0 40801000 */  mtc0       $zero, $2
/* D28A4 800D1CA4 40801800 */  mtc0       $zero, $3
.L800D1CA8:
/* D28A8 800D1CA8 40890000 */  mtc0       $t1, $0
/* D28AC 800D1CAC 00000000 */  nop
/* D28B0 800D1CB0 42000002 */  tlbwi
/* D28B4 800D1CB4 00000000 */  nop
/* D28B8 800D1CB8 00000000 */  nop
/* D28BC 800D1CBC 2129FFFF */  addi       $t1, $t1, -1
/* D28C0 800D1CC0 0521FFF9 */  bgez       $t1, .L800D1CA8
/* D28C4 800D1CC4 00000000 */   nop
/* D28C8 800D1CC8 40885000 */  mtc0       $t0, $10
/* D28CC 800D1CCC 03E00008 */  jr         $ra
/* D28D0 800D1CD0 00000000 */   nop
/* D28D4 800D1CD4 00000000 */  nop
/* D28D8 800D1CD8 00000000 */  nop
/* D28DC 800D1CDC 00000000 */  nop
