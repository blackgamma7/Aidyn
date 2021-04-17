.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800AF200
/* AFE00 800AF200 3C01800E */  lui        $at, %hi(D_800E3760)
/* AFE04 800AF204 C4203760 */  lwc1       $f0, %lo(D_800E3760)($at)
/* AFE08 800AF208 AC80000C */  sw         $zero, 0xc($a0)
/* AFE0C 800AF20C AC800010 */  sw         $zero, 0x10($a0)
/* AFE10 800AF210 AC800008 */  sw         $zero, 8($a0)
/* AFE14 800AF214 A4800014 */  sh         $zero, 0x14($a0)
/* AFE18 800AF218 AC800018 */  sw         $zero, 0x18($a0)
/* AFE1C 800AF21C AC80001C */  sw         $zero, 0x1c($a0)
/* AFE20 800AF220 AC800020 */  sw         $zero, 0x20($a0)
/* AFE24 800AF224 AC800024 */  sw         $zero, 0x24($a0)
/* AFE28 800AF228 E4800000 */  swc1       $f0, ($a0)
/* AFE2C 800AF22C 03E00008 */  jr         $ra
/* AFE30 800AF230 E4800004 */   swc1      $f0, 4($a0)

glabel set_vec7
/* AFE34 800AF234 3C01800E */  lui        $at, %hi(D_800E3764)
/* AFE38 800AF238 C4223764 */  lwc1       $f2, %lo(D_800E3764)($at)
/* AFE3C 800AF23C 44800000 */  mtc1       $zero, $f0
/* AFE40 800AF240 E4820018 */  swc1       $f2, 0x18($a0)
/* AFE44 800AF244 E4800008 */  swc1       $f0, 8($a0)
/* AFE48 800AF248 E4800004 */  swc1       $f0, 4($a0)
/* AFE4C 800AF24C E4800000 */  swc1       $f0, ($a0)
/* AFE50 800AF250 E4800014 */  swc1       $f0, 0x14($a0)
/* AFE54 800AF254 E4800010 */  swc1       $f0, 0x10($a0)
/* AFE58 800AF258 03E00008 */  jr         $ra
/* AFE5C 800AF25C E480000C */   swc1      $f0, 0xc($a0)

glabel set_collision_dat
/* AFE60 800AF260 C7A20010 */  lwc1       $f2, 0x10($sp)
/* AFE64 800AF264 C7A40014 */  lwc1       $f4, 0x14($sp)
/* AFE68 800AF268 C7A60018 */  lwc1       $f6, 0x18($sp)
/* AFE6C 800AF26C C7A8001C */  lwc1       $f8, 0x1c($sp)
/* AFE70 800AF270 44800000 */  mtc1       $zero, $f0
/* AFE74 800AF274 AC850000 */  sw         $a1, ($a0)
/* AFE78 800AF278 AC860004 */  sw         $a2, 4($a0)
/* AFE7C 800AF27C AC870008 */  sw         $a3, 8($a0)
/* AFE80 800AF280 A480001E */  sh         $zero, 0x1e($a0)
/* AFE84 800AF284 A480001C */  sh         $zero, 0x1c($a0)
/* AFE88 800AF288 E482000C */  swc1       $f2, 0xc($a0)
/* AFE8C 800AF28C E4840010 */  swc1       $f4, 0x10($a0)
/* AFE90 800AF290 E4860014 */  swc1       $f6, 0x14($a0)
/* AFE94 800AF294 E4880018 */  swc1       $f8, 0x18($a0)
/* AFE98 800AF298 E4800028 */  swc1       $f0, 0x28($a0)
/* AFE9C 800AF29C E4800024 */  swc1       $f0, 0x24($a0)
/* AFEA0 800AF2A0 E4800020 */  swc1       $f0, 0x20($a0)
/* AFEA4 800AF2A4 E4800034 */  swc1       $f0, 0x34($a0)
/* AFEA8 800AF2A8 E4800030 */  swc1       $f0, 0x30($a0)
/* AFEAC 800AF2AC 03E00008 */  jr         $ra
/* AFEB0 800AF2B0 E480002C */   swc1      $f0, 0x2c($a0)

glabel GetVoxelOffset
/* AFEB4 800AF2B4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* AFEB8 800AF2B8 AFBF0010 */  sw         $ra, 0x10($sp)
/* AFEBC 800AF2BC 00052C00 */  sll        $a1, $a1, 0x10
/* AFEC0 800AF2C0 00052C03 */  sra        $a1, $a1, 0x10
/* AFEC4 800AF2C4 00063400 */  sll        $a2, $a2, 0x10
/* AFEC8 800AF2C8 00063403 */  sra        $a2, $a2, 0x10
/* AFECC 800AF2CC 04A0000C */  bltz       $a1, .L800AF300
/* AFED0 800AF2D0 00C03821 */   addu      $a3, $a2, $zero
/* AFED4 800AF2D4 04C2000B */  bltzl      $a2, .L800AF304
/* AFED8 800AF2D8 3C04800E */   lui       $a0, %hi(D_800E001C)
/* AFEDC 800AF2DC 9483001C */  lhu        $v1, %lo(D_800E001C)($a0)
/* AFEE0 800AF2E0 00A3102A */  slt        $v0, $a1, $v1
/* AFEE4 800AF2E4 50400007 */  beql       $v0, $zero, .L800AF304
/* AFEE8 800AF2E8 3C04800E */   lui       $a0, %hi(D_800E001E)
/* AFEEC 800AF2EC 9482001E */  lhu        $v0, %lo(D_800E001E)($a0)
/* AFEF0 800AF2F0 00C2102A */  slt        $v0, $a2, $v0
/* AFEF4 800AF2F4 00E30018 */  mult       $a3, $v1
/* AFEF8 800AF2F8 14400008 */  bnez       $v0, .L800AF31C
/* AFEFC 800AF2FC 00000000 */   nop
.L800AF300:
/* AFF00 800AF300 3C04800E */  lui        $a0, %hi(D_800E3768)
.L800AF304:
/* AFF04 800AF304 3C05800E */  lui        $a1, %hi(D_800E3778)
/* AFF08 800AF308 24843768 */  addiu      $a0, $a0, %lo(D_800E3768)
/* AFF0C 800AF30C 0C025F2D */  jal        manualCrash
/* AFF10 800AF310 24A53778 */   addiu     $a1, $a1, %lo(D_800E3778)
/* AFF14 800AF314 0802BCCB */  j          .L800AF32C
/* AFF18 800AF318 00001021 */   addu      $v0, $zero, $zero
.L800AF31C:
/* AFF1C 800AF31C 00001012 */  mflo       $v0
/* AFF20 800AF320 00A21021 */  addu       $v0, $a1, $v0
/* AFF24 800AF324 00021400 */  sll        $v0, $v0, 0x10
/* AFF28 800AF328 00021403 */  sra        $v0, $v0, 0x10
.L800AF32C:
/* AFF2C 800AF32C 8FBF0010 */  lw         $ra, 0x10($sp)
/* AFF30 800AF330 03E00008 */  jr         $ra
/* AFF34 800AF334 27BD0018 */   addiu     $sp, $sp, 0x18

glabel borg9_get_unkStruct
/* AFF38 800AF338 00052C00 */  sll        $a1, $a1, 0x10
/* AFF3C 800AF33C 00052C03 */  sra        $a1, $a1, 0x10
/* AFF40 800AF340 00063400 */  sll        $a2, $a2, 0x10
/* AFF44 800AF344 04A10002 */  bgez       $a1, .L800AF350
/* AFF48 800AF348 00061C03 */   sra       $v1, $a2, 0x10
/* AFF4C 800AF34C 00002821 */  addu       $a1, $zero, $zero
.L800AF350:
/* AFF50 800AF350 04620001 */  bltzl      $v1, .L800AF358
/* AFF54 800AF354 00001821 */   addu      $v1, $zero, $zero
.L800AF358:
/* AFF58 800AF358 9486001C */  lhu        $a2, 0x1c($a0)
/* AFF5C 800AF35C 00A6102A */  slt        $v0, $a1, $a2
/* AFF60 800AF360 14400004 */  bnez       $v0, .L800AF374
/* AFF64 800AF364 9487001E */   lhu       $a3, 0x1e($a0)
/* AFF68 800AF368 24C2FFFF */  addiu      $v0, $a2, -1
/* AFF6C 800AF36C 00021400 */  sll        $v0, $v0, 0x10
/* AFF70 800AF370 00022C03 */  sra        $a1, $v0, 0x10
.L800AF374:
/* AFF74 800AF374 0067102A */  slt        $v0, $v1, $a3
/* AFF78 800AF378 00660018 */  mult       $v1, $a2
/* AFF7C 800AF37C 14400005 */  bnez       $v0, .L800AF394
/* AFF80 800AF380 00000000 */   nop
/* AFF84 800AF384 24E2FFFF */  addiu      $v0, $a3, -1
/* AFF88 800AF388 00021400 */  sll        $v0, $v0, 0x10
/* AFF8C 800AF38C 00021C03 */  sra        $v1, $v0, 0x10
/* AFF90 800AF390 00660018 */  mult       $v1, $a2
.L800AF394:
/* AFF94 800AF394 8C840048 */  lw         $a0, 0x48($a0)
/* AFF98 800AF398 00001812 */  mflo       $v1
/* AFF9C 800AF39C 00651821 */  addu       $v1, $v1, $a1
/* AFFA0 800AF3A0 00031080 */  sll        $v0, $v1, 2
/* AFFA4 800AF3A4 00431021 */  addu       $v0, $v0, $v1
/* AFFA8 800AF3A8 00021080 */  sll        $v0, $v0, 2
/* AFFAC 800AF3AC 03E00008 */  jr         $ra
/* AFFB0 800AF3B0 00821021 */   addu      $v0, $a0, $v0
/* AFFB4 800AF3B4 00000000 */  nop
/* AFFB8 800AF3B8 00000000 */  nop
/* AFFBC 800AF3BC 00000000 */  nop
