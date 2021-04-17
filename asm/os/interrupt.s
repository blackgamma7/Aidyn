.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osDisableInt
/* C4240 800C3640 3C0A800F */  lui        $t2, %hi(__OSGlobalIntMask)
/* C4244 800C3644 254A3840 */  addiu      $t2, $t2, %lo(__OSGlobalIntMask)
/* C4248 800C3648 8D4B0000 */  lw         $t3, ($t2)
/* C424C 800C364C 316BFF00 */  andi       $t3, $t3, 0xff00
/* C4250 800C3650 40086000 */  mfc0       $t0, $12
/* C4254 800C3654 2401FFFE */  addiu      $at, $zero, -2
/* C4258 800C3658 01014824 */  and        $t1, $t0, $at
/* C425C 800C365C 40896000 */  mtc0       $t1, $12
/* C4260 800C3660 31020001 */  andi       $v0, $t0, 1
/* C4264 800C3664 8D480000 */  lw         $t0, ($t2)
/* C4268 800C3668 3108FF00 */  andi       $t0, $t0, 0xff00
/* C426C 800C366C 110B000E */  beq        $t0, $t3, .L800C36A8
/* C4270 800C3670 3C0A800F */   lui       $t2, %hi(__osRunningThread)
/* C4274 800C3674 254A3CC0 */  addiu      $t2, $t2, %lo(__osRunningThread)
/* C4278 800C3678 8D490118 */  lw         $t1, 0x118($t2)
/* C427C 800C367C 312AFF00 */  andi       $t2, $t1, 0xff00
/* C4280 800C3680 01485024 */  and        $t2, $t2, $t0
/* C4284 800C3684 3C01FFFF */  lui        $at, 0xffff
/* C4288 800C3688 342100FF */  ori        $at, $at, 0xff
/* C428C 800C368C 01214824 */  and        $t1, $t1, $at
/* C4290 800C3690 012A4825 */  or         $t1, $t1, $t2
/* C4294 800C3694 2401FFFE */  addiu      $at, $zero, -2
/* C4298 800C3698 01214824 */  and        $t1, $t1, $at
/* C429C 800C369C 40896000 */  mtc0       $t1, $12
/* C42A0 800C36A0 00000000 */  nop
/* C42A4 800C36A4 00000000 */  nop
.L800C36A8:
/* C42A8 800C36A8 03E00008 */  jr         $ra
/* C42AC 800C36AC 00000000 */   nop

glabel __osRestoreInt
/* C42B0 800C36B0 40086000 */  mfc0       $t0, $12
/* C42B4 800C36B4 01044025 */  or         $t0, $t0, $a0
/* C42B8 800C36B8 40886000 */  mtc0       $t0, $12
/* C42BC 800C36BC 00000000 */  nop
/* C42C0 800C36C0 00000000 */  nop
/* C42C4 800C36C4 03E00008 */  jr         $ra
/* C42C8 800C36C8 00000000 */   nop
/* C42CC 800C36CC 00000000 */  nop
