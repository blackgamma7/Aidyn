.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osSpRawStartDma
/* CDDB0 800CD1B0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CDDB4 800CD1B4 AFB20018 */  sw         $s2, 0x18($sp)
/* CDDB8 800CD1B8 00809021 */  addu       $s2, $a0, $zero
/* CDDBC 800CD1BC AFB00010 */  sw         $s0, 0x10($sp)
/* CDDC0 800CD1C0 00A08021 */  addu       $s0, $a1, $zero
/* CDDC4 800CD1C4 AFB10014 */  sw         $s1, 0x14($sp)
/* CDDC8 800CD1C8 00C08821 */  addu       $s1, $a2, $zero
/* CDDCC 800CD1CC AFB3001C */  sw         $s3, 0x1c($sp)
/* CDDD0 800CD1D0 AFBF0020 */  sw         $ra, 0x20($sp)
/* CDDD4 800CD1D4 0C033390 */  jal        __osSpDeviceBusy
/* CDDD8 800CD1D8 00E09821 */   addu      $s3, $a3, $zero
/* CDDDC 800CD1DC 14400010 */  bnez       $v0, .L800CD220
/* CDDE0 800CD1E0 2402FFFF */   addiu     $v0, $zero, -1
/* CDDE4 800CD1E4 3C02A404 */  lui        $v0, 0xa404
/* CDDE8 800CD1E8 02202021 */  addu       $a0, $s1, $zero
/* CDDEC 800CD1EC 0C034888 */  jal        osVirtualToPhysical
/* CDDF0 800CD1F0 AC500000 */   sw        $s0, ($v0)
/* CDDF4 800CD1F4 3C03A404 */  lui        $v1, 0xa404
/* CDDF8 800CD1F8 34630004 */  ori        $v1, $v1, 4
/* CDDFC 800CD1FC AC620000 */  sw         $v0, ($v1)
/* CDE00 800CD200 16400003 */  bnez       $s2, .L800CD210
/* CDE04 800CD204 3C03A404 */   lui       $v1, 0xa404
/* CDE08 800CD208 08033485 */  j          .L800CD214
/* CDE0C 800CD20C 3463000C */   ori       $v1, $v1, 0xc
.L800CD210:
/* CDE10 800CD210 34630008 */  ori        $v1, $v1, 8
.L800CD214:
/* CDE14 800CD214 2662FFFF */  addiu      $v0, $s3, -1
/* CDE18 800CD218 AC620000 */  sw         $v0, ($v1)
/* CDE1C 800CD21C 00001021 */  addu       $v0, $zero, $zero
.L800CD220:
/* CDE20 800CD220 8FBF0020 */  lw         $ra, 0x20($sp)
/* CDE24 800CD224 8FB3001C */  lw         $s3, 0x1c($sp)
/* CDE28 800CD228 8FB20018 */  lw         $s2, 0x18($sp)
/* CDE2C 800CD22C 8FB10014 */  lw         $s1, 0x14($sp)
/* CDE30 800CD230 8FB00010 */  lw         $s0, 0x10($sp)
/* CDE34 800CD234 03E00008 */  jr         $ra
/* CDE38 800CD238 27BD0028 */   addiu     $sp, $sp, 0x28
/* CDE3C 800CD23C 00000000 */  nop
