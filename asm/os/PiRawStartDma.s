.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPiRawStartDma
/* C91F0 800C85F0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* C91F4 800C85F4 AFB00010 */  sw         $s0, 0x10($sp)
/* C91F8 800C85F8 00808021 */  addu       $s0, $a0, $zero
/* C91FC 800C85FC AFB10014 */  sw         $s1, 0x14($sp)
/* C9200 800C8600 00A08821 */  addu       $s1, $a1, $zero
/* C9204 800C8604 3C02A460 */  lui        $v0, 0xa460
/* C9208 800C8608 34420010 */  ori        $v0, $v0, 0x10
/* C920C 800C860C AFBF001C */  sw         $ra, 0x1c($sp)
/* C9210 800C8610 AFB20018 */  sw         $s2, 0x18($sp)
/* C9214 800C8614 8C420000 */  lw         $v0, ($v0)
/* C9218 800C8618 00C02021 */  addu       $a0, $a2, $zero
/* C921C 800C861C 30420003 */  andi       $v0, $v0, 3
/* C9220 800C8620 10400007 */  beqz       $v0, .L800C8640
/* C9224 800C8624 00E09021 */   addu      $s2, $a3, $zero
/* C9228 800C8628 3C03A460 */  lui        $v1, 0xa460
/* C922C 800C862C 34630010 */  ori        $v1, $v1, 0x10
.L800C8630:
/* C9230 800C8630 8C620000 */  lw         $v0, ($v1)
/* C9234 800C8634 30420003 */  andi       $v0, $v0, 3
/* C9238 800C8638 1440FFFD */  bnez       $v0, .L800C8630
/* C923C 800C863C 00000000 */   nop
.L800C8640:
/* C9240 800C8640 0C034888 */  jal        osVirtualToPhysical
/* C9244 800C8644 00000000 */   nop
/* C9248 800C8648 3C06A460 */  lui        $a2, 0xa460
/* C924C 800C864C 34C60004 */  ori        $a2, $a2, 4
/* C9250 800C8650 3C051FFF */  lui        $a1, 0x1fff
/* C9254 800C8654 3C038000 */  lui        $v1, %hi(osRomBase)
/* C9258 800C8658 8C630308 */  lw         $v1, %lo(osRomBase)($v1)
/* C925C 800C865C 34A5FFFF */  ori        $a1, $a1, 0xffff
/* C9260 800C8660 3C04A460 */  lui        $a0, 0xa460
/* C9264 800C8664 AC820000 */  sw         $v0, ($a0)
/* C9268 800C8668 00711825 */  or         $v1, $v1, $s1
/* C926C 800C866C 00651824 */  and        $v1, $v1, $a1
/* C9270 800C8670 ACC30000 */  sw         $v1, ($a2)
/* C9274 800C8674 12000005 */  beqz       $s0, .L800C868C
/* C9278 800C8678 24020001 */   addiu     $v0, $zero, 1
/* C927C 800C867C 12020006 */  beq        $s0, $v0, .L800C8698
/* C9280 800C8680 3C03A460 */   lui       $v1, 0xa460
/* C9284 800C8684 080321AA */  j          .L800C86A8
/* C9288 800C8688 2402FFFF */   addiu     $v0, $zero, -1
.L800C868C:
/* C928C 800C868C 3C03A460 */  lui        $v1, 0xa460
/* C9290 800C8690 080321A7 */  j          .L800C869C
/* C9294 800C8694 3463000C */   ori       $v1, $v1, 0xc
.L800C8698:
/* C9298 800C8698 34630008 */  ori        $v1, $v1, 8
.L800C869C:
/* C929C 800C869C 2642FFFF */  addiu      $v0, $s2, -1
/* C92A0 800C86A0 AC620000 */  sw         $v0, ($v1)
/* C92A4 800C86A4 00001021 */  addu       $v0, $zero, $zero
.L800C86A8:
/* C92A8 800C86A8 8FBF001C */  lw         $ra, 0x1c($sp)
/* C92AC 800C86AC 8FB20018 */  lw         $s2, 0x18($sp)
/* C92B0 800C86B0 8FB10014 */  lw         $s1, 0x14($sp)
/* C92B4 800C86B4 8FB00010 */  lw         $s0, 0x10($sp)
/* C92B8 800C86B8 03E00008 */  jr         $ra
/* C92BC 800C86BC 27BD0020 */   addiu     $sp, $sp, 0x20
