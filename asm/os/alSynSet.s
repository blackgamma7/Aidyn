.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alSynSetPan
/* CE430 800CD830 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* CE434 800CD834 AFB00010 */  sw         $s0, 0x10($sp)
/* CE438 800CD838 00A08021 */  addu       $s0, $a1, $zero
/* CE43C 800CD83C AFBF001C */  sw         $ra, 0x1c($sp)
/* CE440 800CD840 AFB20018 */  sw         $s2, 0x18($sp)
/* CE444 800CD844 AFB10014 */  sw         $s1, 0x14($sp)
/* CE448 800CD848 8E020008 */  lw         $v0, 8($s0)
/* CE44C 800CD84C 00808821 */  addu       $s1, $a0, $zero
/* CE450 800CD850 10400015 */  beqz       $v0, .L800CD8A8
/* CE454 800CD854 00C09021 */   addu      $s2, $a2, $zero
/* CE458 800CD858 0C033803 */  jal        __allocParam
/* CE45C 800CD85C 00000000 */   nop
/* CE460 800CD860 00403021 */  addu       $a2, $v0, $zero
/* CE464 800CD864 10C00010 */  beqz       $a2, .L800CD8A8
/* CE468 800CD868 00000000 */   nop
/* CE46C 800CD86C 8E020008 */  lw         $v0, 8($s0)
/* CE470 800CD870 8E23001C */  lw         $v1, 0x1c($s1)
/* CE474 800CD874 8C4400D8 */  lw         $a0, 0xd8($v0)
/* CE478 800CD878 2402000C */  addiu      $v0, $zero, 0xc
/* CE47C 800CD87C A4C20008 */  sh         $v0, 8($a2)
/* CE480 800CD880 324200FF */  andi       $v0, $s2, 0xff
/* CE484 800CD884 ACC2000C */  sw         $v0, 0xc($a2)
/* CE488 800CD888 ACC00000 */  sw         $zero, ($a2)
/* CE48C 800CD88C 00641821 */  addu       $v1, $v1, $a0
/* CE490 800CD890 ACC30004 */  sw         $v1, 4($a2)
/* CE494 800CD894 8E020008 */  lw         $v0, 8($s0)
/* CE498 800CD898 8C44000C */  lw         $a0, 0xc($v0)
/* CE49C 800CD89C 8C820008 */  lw         $v0, 8($a0)
/* CE4A0 800CD8A0 0040F809 */  jalr       $v0
/* CE4A4 800CD8A4 24050003 */   addiu     $a1, $zero, 3
.L800CD8A8:
/* CE4A8 800CD8A8 8FBF001C */  lw         $ra, 0x1c($sp)
/* CE4AC 800CD8AC 8FB20018 */  lw         $s2, 0x18($sp)
/* CE4B0 800CD8B0 8FB10014 */  lw         $s1, 0x14($sp)
/* CE4B4 800CD8B4 8FB00010 */  lw         $s0, 0x10($sp)
/* CE4B8 800CD8B8 03E00008 */  jr         $ra
/* CE4BC 800CD8BC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel alSynSetPitch
/* CE4C0 800CD8C0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CE4C4 800CD8C4 AFB00010 */  sw         $s0, 0x10($sp)
/* CE4C8 800CD8C8 00A08021 */  addu       $s0, $a1, $zero
/* CE4CC 800CD8CC AFBF0018 */  sw         $ra, 0x18($sp)
/* CE4D0 800CD8D0 AFB10014 */  sw         $s1, 0x14($sp)
/* CE4D4 800CD8D4 F7B40020 */  sdc1       $f20, 0x20($sp)
/* CE4D8 800CD8D8 8E020008 */  lw         $v0, 8($s0)
/* CE4DC 800CD8DC 4486A000 */  mtc1       $a2, $f20
/* CE4E0 800CD8E0 00000000 */  nop
/* CE4E4 800CD8E4 10400014 */  beqz       $v0, .L800CD938
/* CE4E8 800CD8E8 00808821 */   addu      $s1, $a0, $zero
/* CE4EC 800CD8EC 0C033803 */  jal        __allocParam
/* CE4F0 800CD8F0 00000000 */   nop
/* CE4F4 800CD8F4 00403021 */  addu       $a2, $v0, $zero
/* CE4F8 800CD8F8 10C0000F */  beqz       $a2, .L800CD938
/* CE4FC 800CD8FC 00000000 */   nop
/* CE500 800CD900 8E020008 */  lw         $v0, 8($s0)
/* CE504 800CD904 8E23001C */  lw         $v1, 0x1c($s1)
/* CE508 800CD908 8C4400D8 */  lw         $a0, 0xd8($v0)
/* CE50C 800CD90C 24020007 */  addiu      $v0, $zero, 7
/* CE510 800CD910 A4C20008 */  sh         $v0, 8($a2)
/* CE514 800CD914 E4D4000C */  swc1       $f20, 0xc($a2)
/* CE518 800CD918 ACC00000 */  sw         $zero, ($a2)
/* CE51C 800CD91C 00641821 */  addu       $v1, $v1, $a0
/* CE520 800CD920 ACC30004 */  sw         $v1, 4($a2)
/* CE524 800CD924 8E020008 */  lw         $v0, 8($s0)
/* CE528 800CD928 8C44000C */  lw         $a0, 0xc($v0)
/* CE52C 800CD92C 8C820008 */  lw         $v0, 8($a0)
/* CE530 800CD930 0040F809 */  jalr       $v0
/* CE534 800CD934 24050003 */   addiu     $a1, $zero, 3
.L800CD938:
/* CE538 800CD938 8FBF0018 */  lw         $ra, 0x18($sp)
/* CE53C 800CD93C 8FB10014 */  lw         $s1, 0x14($sp)
/* CE540 800CD940 8FB00010 */  lw         $s0, 0x10($sp)
/* CE544 800CD944 D7B40020 */  ldc1       $f20, 0x20($sp)
/* CE548 800CD948 03E00008 */  jr         $ra
/* CE54C 800CD94C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel alSynSetVol
/* CE550 800CD950 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* CE554 800CD954 AFB20018 */  sw         $s2, 0x18($sp)
/* CE558 800CD958 00809021 */  addu       $s2, $a0, $zero
/* CE55C 800CD95C AFB10014 */  sw         $s1, 0x14($sp)
/* CE560 800CD960 00A08821 */  addu       $s1, $a1, $zero
/* CE564 800CD964 AFBF0024 */  sw         $ra, 0x24($sp)
/* CE568 800CD968 AFB40020 */  sw         $s4, 0x20($sp)
/* CE56C 800CD96C AFB3001C */  sw         $s3, 0x1c($sp)
/* CE570 800CD970 AFB00010 */  sw         $s0, 0x10($sp)
/* CE574 800CD974 8E220008 */  lw         $v0, 8($s1)
/* CE578 800CD978 00C0A021 */  addu       $s4, $a2, $zero
/* CE57C 800CD97C 1040001A */  beqz       $v0, .L800CD9E8
/* CE580 800CD980 00E09821 */   addu      $s3, $a3, $zero
/* CE584 800CD984 0C033803 */  jal        __allocParam
/* CE588 800CD988 00000000 */   nop
/* CE58C 800CD98C 00408021 */  addu       $s0, $v0, $zero
/* CE590 800CD990 12000015 */  beqz       $s0, .L800CD9E8
/* CE594 800CD994 02402021 */   addu      $a0, $s2, $zero
/* CE598 800CD998 8E220008 */  lw         $v0, 8($s1)
/* CE59C 800CD99C 8C83001C */  lw         $v1, 0x1c($a0)
/* CE5A0 800CD9A0 8C4600D8 */  lw         $a2, 0xd8($v0)
/* CE5A4 800CD9A4 02602821 */  addu       $a1, $s3, $zero
/* CE5A8 800CD9A8 2402000B */  addiu      $v0, $zero, 0xb
/* CE5AC 800CD9AC A6020008 */  sh         $v0, 8($s0)
/* CE5B0 800CD9B0 00141400 */  sll        $v0, $s4, 0x10
/* CE5B4 800CD9B4 00021403 */  sra        $v0, $v0, 0x10
/* CE5B8 800CD9B8 AE02000C */  sw         $v0, 0xc($s0)
/* CE5BC 800CD9BC 00661821 */  addu       $v1, $v1, $a2
/* CE5C0 800CD9C0 0C03384B */  jal        _timeToSamples
/* CE5C4 800CD9C4 AE030004 */   sw        $v1, 4($s0)
/* CE5C8 800CD9C8 AE020010 */  sw         $v0, 0x10($s0)
/* CE5CC 800CD9CC AE000000 */  sw         $zero, ($s0)
/* CE5D0 800CD9D0 8E220008 */  lw         $v0, 8($s1)
/* CE5D4 800CD9D4 8C44000C */  lw         $a0, 0xc($v0)
/* CE5D8 800CD9D8 8C820008 */  lw         $v0, 8($a0)
/* CE5DC 800CD9DC 24050003 */  addiu      $a1, $zero, 3
/* CE5E0 800CD9E0 0040F809 */  jalr       $v0
/* CE5E4 800CD9E4 02003021 */   addu      $a2, $s0, $zero
.L800CD9E8:
/* CE5E8 800CD9E8 8FBF0024 */  lw         $ra, 0x24($sp)
/* CE5EC 800CD9EC 8FB40020 */  lw         $s4, 0x20($sp)
/* CE5F0 800CD9F0 8FB3001C */  lw         $s3, 0x1c($sp)
/* CE5F4 800CD9F4 8FB20018 */  lw         $s2, 0x18($sp)
/* CE5F8 800CD9F8 8FB10014 */  lw         $s1, 0x14($sp)
/* CE5FC 800CD9FC 8FB00010 */  lw         $s0, 0x10($sp)
/* CE600 800CDA00 03E00008 */  jr         $ra
/* CE604 800CDA04 27BD0028 */   addiu     $sp, $sp, 0x28
/* CE608 800CDA08 00000000 */  nop
/* CE60C 800CDA0C 00000000 */  nop
