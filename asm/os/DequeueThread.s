.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osDequeueThread
/* D23D0 800D17D0 8C820000 */  lw         $v0, ($a0)
/* D23D4 800D17D4 10400009 */  beqz       $v0, .L800D17FC
/* D23D8 800D17D8 00000000 */   nop
.L800D17DC:
/* D23DC 800D17DC 54450004 */  bnel       $v0, $a1, .L800D17F0
/* D23E0 800D17E0 00402021 */   addu      $a0, $v0, $zero
/* D23E4 800D17E4 8C420000 */  lw         $v0, ($v0)
/* D23E8 800D17E8 080345FF */  j          .L800D17FC
/* D23EC 800D17EC AC820000 */   sw        $v0, ($a0)
.L800D17F0:
/* D23F0 800D17F0 8C420000 */  lw         $v0, ($v0)
/* D23F4 800D17F4 1440FFF9 */  bnez       $v0, .L800D17DC
/* D23F8 800D17F8 00000000 */   nop
.L800D17FC:
/* D23FC 800D17FC 03E00008 */  jr         $ra
/* D2400 800D1800 00000000 */   nop
/* D2404 800D1804 00000000 */  nop
/* D2408 800D1808 00000000 */  nop
/* D240C 800D180C 00000000 */  nop
