.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osMapTLBRdb
/* C4CB0 800C40B0 40085000 */  mfc0       $t0, $10
/* C4CB4 800C40B4 2409001F */  addiu      $t1, $zero, 0x1f
/* C4CB8 800C40B8 40890000 */  mtc0       $t1, $0
/* C4CBC 800C40BC 40802800 */  mtc0       $zero, $5
/* C4CC0 800C40C0 240A0017 */  addiu      $t2, $zero, 0x17
/* C4CC4 800C40C4 3C09C000 */  lui        $t1, 0xc000
/* C4CC8 800C40C8 40895000 */  mtc0       $t1, $10
/* C4CCC 800C40CC 3C098000 */  lui        $t1, 0x8000
/* C4CD0 800C40D0 00095982 */  srl        $t3, $t1, 6
/* C4CD4 800C40D4 016A5825 */  or         $t3, $t3, $t2
/* C4CD8 800C40D8 408B1000 */  mtc0       $t3, $2
/* C4CDC 800C40DC 24090001 */  addiu      $t1, $zero, 1
/* C4CE0 800C40E0 40891800 */  mtc0       $t1, $3
/* C4CE4 800C40E4 00000000 */  nop
/* C4CE8 800C40E8 42000002 */  tlbwi
/* C4CEC 800C40EC 00000000 */  nop
/* C4CF0 800C40F0 00000000 */  nop
/* C4CF4 800C40F4 00000000 */  nop
/* C4CF8 800C40F8 00000000 */  nop
/* C4CFC 800C40FC 40885000 */  mtc0       $t0, $10
/* C4D00 800C4100 03E00008 */  jr         $ra
/* C4D04 800C4104 00000000 */   nop
/* C4D08 800C4108 00000000 */  nop
/* C4D0C 800C410C 00000000 */  nop
