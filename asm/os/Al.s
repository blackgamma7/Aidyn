.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alInit
/* CD940 800CCD40 3C02800F */  lui        $v0, %hi(alGlobals)
/* CD944 800CCD44 8C4239F0 */  lw         $v0, %lo(alGlobals)($v0)
/* CD948 800CCD48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD94C 800CCD4C 14400004 */  bnez       $v0, .L800CCD60
/* CD950 800CCD50 AFBF0010 */   sw        $ra, 0x10($sp)
/* CD954 800CCD54 3C01800F */  lui        $at, %hi(alGlobals)
/* CD958 800CCD58 0C0336E4 */  jal        alSynNew
/* CD95C 800CCD5C AC2439F0 */   sw        $a0, %lo(alGlobals)($at)
.L800CCD60:
/* CD960 800CCD60 8FBF0010 */  lw         $ra, 0x10($sp)
/* CD964 800CCD64 03E00008 */  jr         $ra
/* CD968 800CCD68 27BD0018 */   addiu     $sp, $sp, 0x18

glabel alClose
/* CD96C 800CCD6C 3C02800F */  lui        $v0, %hi(alGlobals)
/* CD970 800CCD70 8C4239F0 */  lw         $v0, %lo(alGlobals)($v0)
/* CD974 800CCD74 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* CD978 800CCD78 10400005 */  beqz       $v0, .L800CCD90
/* CD97C 800CCD7C AFBF0010 */   sw        $ra, 0x10($sp)
/* CD980 800CCD80 0C0335E0 */  jal        alSynDelete
/* CD984 800CCD84 00000000 */   nop
/* CD988 800CCD88 3C01800F */  lui        $at, %hi(alGlobals)
/* CD98C 800CCD8C AC2039F0 */  sw         $zero, %lo(alGlobals)($at)
.L800CCD90:
/* CD990 800CCD90 8FBF0010 */  lw         $ra, 0x10($sp)
/* CD994 800CCD94 03E00008 */  jr         $ra
/* CD998 800CCD98 27BD0018 */   addiu     $sp, $sp, 0x18

glabel alLink
/* CD99C 800CCD9C 8CA20000 */  lw         $v0, ($a1)
/* CD9A0 800CCDA0 AC850004 */  sw         $a1, 4($a0)
/* CD9A4 800CCDA4 AC820000 */  sw         $v0, ($a0)
/* CD9A8 800CCDA8 8CA20000 */  lw         $v0, ($a1)
/* CD9AC 800CCDAC 54400001 */  bnel       $v0, $zero, .L800CCDB4
/* CD9B0 800CCDB0 AC440004 */   sw        $a0, 4($v0)
.L800CCDB4:
/* CD9B4 800CCDB4 03E00008 */  jr         $ra
/* CD9B8 800CCDB8 ACA40000 */   sw        $a0, ($a1)

glabel alUnlink
/* CD9BC 800CCDBC 8C830000 */  lw         $v1, ($a0)
/* CD9C0 800CCDC0 10600003 */  beqz       $v1, .L800CCDD0
/* CD9C4 800CCDC4 00000000 */   nop
/* CD9C8 800CCDC8 8C820004 */  lw         $v0, 4($a0)
/* CD9CC 800CCDCC AC620004 */  sw         $v0, 4($v1)
.L800CCDD0:
/* CD9D0 800CCDD0 8C830004 */  lw         $v1, 4($a0)
/* CD9D4 800CCDD4 10600003 */  beqz       $v1, .L800CCDE4
/* CD9D8 800CCDD8 00000000 */   nop
/* CD9DC 800CCDDC 8C820000 */  lw         $v0, ($a0)
/* CD9E0 800CCDE0 AC620000 */  sw         $v0, ($v1)
.L800CCDE4:
/* CD9E4 800CCDE4 03E00008 */  jr         $ra
/* CD9E8 800CCDE8 00000000 */   nop
/* CD9EC 800CCDEC 00000000 */  nop
