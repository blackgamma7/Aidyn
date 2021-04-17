.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel quicksort_sub_sub
/* BE260 800BD660 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* BE264 800BD664 AFB20028 */  sw         $s2, 0x28($sp)
/* BE268 800BD668 00E09021 */  addu       $s2, $a3, $zero
/* BE26C 800BD66C 00B20018 */  mult       $a1, $s2
/* BE270 800BD670 AFB3002C */  sw         $s3, 0x2c($sp)
/* BE274 800BD674 AFA60050 */  sw         $a2, 0x50($sp)
/* BE278 800BD678 24D30001 */  addiu      $s3, $a2, 1
/* BE27C 800BD67C AFB50034 */  sw         $s5, 0x34($sp)
/* BE280 800BD680 24B5FFFF */  addiu      $s5, $a1, -1
/* BE284 800BD684 00003812 */  mflo       $a3
/* BE288 800BD688 AFBF0044 */  sw         $ra, 0x44($sp)
/* BE28C 800BD68C AFBE0040 */  sw         $fp, 0x40($sp)
/* BE290 800BD690 02720018 */  mult       $s3, $s2
/* BE294 800BD694 AFB7003C */  sw         $s7, 0x3c($sp)
/* BE298 800BD698 AFB60038 */  sw         $s6, 0x38($sp)
/* BE29C 800BD69C AFB40030 */  sw         $s4, 0x30($sp)
/* BE2A0 800BD6A0 AFB10024 */  sw         $s1, 0x24($sp)
/* BE2A4 800BD6A4 00001812 */  mflo       $v1
/* BE2A8 800BD6A8 AFB00020 */  sw         $s0, 0x20($sp)
/* BE2AC 800BD6AC AFA40048 */  sw         $a0, 0x48($sp)
/* BE2B0 800BD6B0 02B20018 */  mult       $s5, $s2
/* BE2B4 800BD6B4 00873821 */  addu       $a3, $a0, $a3
/* BE2B8 800BD6B8 AFA70010 */  sw         $a3, 0x10($sp)
/* BE2BC 800BD6BC 0064B021 */  addu       $s6, $v1, $a0
/* BE2C0 800BD6C0 0060F021 */  addu       $fp, $v1, $zero
/* BE2C4 800BD6C4 00001012 */  mflo       $v0
/* BE2C8 800BD6C8 0044A021 */  addu       $s4, $v0, $a0
/* BE2CC 800BD6CC 0040B821 */  addu       $s7, $v0, $zero
/* BE2D0 800BD6D0 8FA20048 */  lw         $v0, 0x48($sp)
.L800BD6D4:
/* BE2D4 800BD6D4 00578021 */  addu       $s0, $v0, $s7
/* BE2D8 800BD6D8 8FA30050 */  lw         $v1, 0x50($sp)
.L800BD6DC:
/* BE2DC 800BD6DC 12A3000B */  beq        $s5, $v1, .L800BD70C
/* BE2E0 800BD6E0 02128021 */   addu      $s0, $s0, $s2
/* BE2E4 800BD6E4 0292A021 */  addu       $s4, $s4, $s2
/* BE2E8 800BD6E8 02F2B821 */  addu       $s7, $s7, $s2
/* BE2EC 800BD6EC 26B50001 */  addiu      $s5, $s5, 1
/* BE2F0 800BD6F0 8FA50010 */  lw         $a1, 0x10($sp)
/* BE2F4 800BD6F4 8FA60058 */  lw         $a2, 0x58($sp)
/* BE2F8 800BD6F8 00C0F809 */  jalr       $a2
/* BE2FC 800BD6FC 02002021 */   addu      $a0, $s0, $zero
/* BE300 800BD700 2403FFFF */  addiu      $v1, $zero, -1
/* BE304 800BD704 1043FFF5 */  beq        $v0, $v1, .L800BD6DC
/* BE308 800BD708 8FA30050 */   lw        $v1, 0x50($sp)
.L800BD70C:
/* BE30C 800BD70C 8FA40048 */  lw         $a0, 0x48($sp)
/* BE310 800BD710 24030001 */  addiu      $v1, $zero, 1
/* BE314 800BD714 00128823 */  negu       $s1, $s2
/* BE318 800BD718 009E8021 */  addu       $s0, $a0, $fp
.L800BD71C:
/* BE31C 800BD71C 1260000C */  beqz       $s3, .L800BD750
/* BE320 800BD720 02128023 */   subu      $s0, $s0, $s2
/* BE324 800BD724 02D1B021 */  addu       $s6, $s6, $s1
/* BE328 800BD728 03D1F021 */  addu       $fp, $fp, $s1
/* BE32C 800BD72C 2673FFFF */  addiu      $s3, $s3, -1
/* BE330 800BD730 8FA50010 */  lw         $a1, 0x10($sp)
/* BE334 800BD734 8FA60058 */  lw         $a2, 0x58($sp)
/* BE338 800BD738 02002021 */  addu       $a0, $s0, $zero
/* BE33C 800BD73C 00C0F809 */  jalr       $a2
/* BE340 800BD740 AFA30018 */   sw        $v1, 0x18($sp)
/* BE344 800BD744 8FA30018 */  lw         $v1, 0x18($sp)
/* BE348 800BD748 1043FFF4 */  beq        $v0, $v1, .L800BD71C
/* BE34C 800BD74C 00000000 */   nop
.L800BD750:
/* BE350 800BD750 02B3102A */  slt        $v0, $s5, $s3
/* BE354 800BD754 10400010 */  beqz       $v0, .L800BD798
/* BE358 800BD758 02802821 */   addu      $a1, $s4, $zero
/* BE35C 800BD75C 3C02800F */  lui        $v0, %hi(quicksort_pointer)
/* BE360 800BD760 8C445714 */  lw         $a0, %lo(quicksort_pointer)($v0)
/* BE364 800BD764 0C033547 */  jal        memcpy
/* BE368 800BD768 02403021 */   addu      $a2, $s2, $zero
/* BE36C 800BD76C 02802021 */  addu       $a0, $s4, $zero
/* BE370 800BD770 02C02821 */  addu       $a1, $s6, $zero
/* BE374 800BD774 0C033547 */  jal        memcpy
/* BE378 800BD778 02403021 */   addu      $a2, $s2, $zero
/* BE37C 800BD77C 02C02021 */  addu       $a0, $s6, $zero
/* BE380 800BD780 3C03800F */  lui        $v1, %hi(quicksort_pointer)
/* BE384 800BD784 8C655714 */  lw         $a1, %lo(quicksort_pointer)($v1)
/* BE388 800BD788 0C033547 */  jal        memcpy
/* BE38C 800BD78C 02403021 */   addu      $a2, $s2, $zero
/* BE390 800BD790 0802F5B5 */  j          .L800BD6D4
/* BE394 800BD794 8FA20048 */   lw        $v0, 0x48($sp)
.L800BD798:
/* BE398 800BD798 02601021 */  addu       $v0, $s3, $zero
/* BE39C 800BD79C 8FBF0044 */  lw         $ra, 0x44($sp)
/* BE3A0 800BD7A0 8FBE0040 */  lw         $fp, 0x40($sp)
/* BE3A4 800BD7A4 8FB7003C */  lw         $s7, 0x3c($sp)
/* BE3A8 800BD7A8 8FB60038 */  lw         $s6, 0x38($sp)
/* BE3AC 800BD7AC 8FB50034 */  lw         $s5, 0x34($sp)
/* BE3B0 800BD7B0 8FB40030 */  lw         $s4, 0x30($sp)
/* BE3B4 800BD7B4 8FB3002C */  lw         $s3, 0x2c($sp)
/* BE3B8 800BD7B8 8FB20028 */  lw         $s2, 0x28($sp)
/* BE3BC 800BD7BC 8FB10024 */  lw         $s1, 0x24($sp)
/* BE3C0 800BD7C0 8FB00020 */  lw         $s0, 0x20($sp)
/* BE3C4 800BD7C4 03E00008 */  jr         $ra
/* BE3C8 800BD7C8 27BD0048 */   addiu     $sp, $sp, 0x48

glabel quicksort_sub
/* BE3CC 800BD7CC 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* BE3D0 800BD7D0 AFB40028 */  sw         $s4, 0x28($sp)
/* BE3D4 800BD7D4 0080A021 */  addu       $s4, $a0, $zero
/* BE3D8 800BD7D8 3C04800F */  lui        $a0, %hi(rng_quicksort)
/* BE3DC 800BD7DC 24845710 */  addiu      $a0, $a0, %lo(rng_quicksort)
/* BE3E0 800BD7E0 AFB30024 */  sw         $s3, 0x24($sp)
/* BE3E4 800BD7E4 00A09821 */  addu       $s3, $a1, $zero
/* BE3E8 800BD7E8 AFB60030 */  sw         $s6, 0x30($sp)
/* BE3EC 800BD7EC 00C0B021 */  addu       $s6, $a2, $zero
/* BE3F0 800BD7F0 AFB70034 */  sw         $s7, 0x34($sp)
/* BE3F4 800BD7F4 8FB70050 */  lw         $s7, 0x50($sp)
/* BE3F8 800BD7F8 AFB20020 */  sw         $s2, 0x20($sp)
/* BE3FC 800BD7FC 00E09021 */  addu       $s2, $a3, $zero
/* BE400 800BD800 AFBF0038 */  sw         $ra, 0x38($sp)
/* BE404 800BD804 AFB5002C */  sw         $s5, 0x2c($sp)
/* BE408 800BD808 AFB1001C */  sw         $s1, 0x1c($sp)
/* BE40C 800BD80C 0C0273A9 */  jal        rand_range_
/* BE410 800BD810 AFB00018 */   sw        $s0, 0x18($sp)
/* BE414 800BD814 00520018 */  mult       $v0, $s2
/* BE418 800BD818 00008012 */  mflo       $s0
/* BE41C 800BD81C 02403021 */  addu       $a2, $s2, $zero
/* BE420 800BD820 00000000 */  nop
/* BE424 800BD824 02720018 */  mult       $s3, $s2
/* BE428 800BD828 3C15800F */  lui        $s5, %hi(quicksort_pointer)
/* BE42C 800BD82C 8EA45714 */  lw         $a0, %lo(quicksort_pointer)($s5)
/* BE430 800BD830 02908021 */  addu       $s0, $s4, $s0
/* BE434 800BD834 02002821 */  addu       $a1, $s0, $zero
/* BE438 800BD838 00008812 */  mflo       $s1
/* BE43C 800BD83C 0C033547 */  jal        memcpy
/* BE440 800BD840 02918821 */   addu      $s1, $s4, $s1
/* BE444 800BD844 02002021 */  addu       $a0, $s0, $zero
/* BE448 800BD848 02202821 */  addu       $a1, $s1, $zero
/* BE44C 800BD84C 0C033547 */  jal        memcpy
/* BE450 800BD850 02403021 */   addu      $a2, $s2, $zero
/* BE454 800BD854 02202021 */  addu       $a0, $s1, $zero
/* BE458 800BD858 8EA55714 */  lw         $a1, 0x5714($s5)
/* BE45C 800BD85C 0C033547 */  jal        memcpy
/* BE460 800BD860 02403021 */   addu      $a2, $s2, $zero
/* BE464 800BD864 02802021 */  addu       $a0, $s4, $zero
/* BE468 800BD868 02602821 */  addu       $a1, $s3, $zero
/* BE46C 800BD86C 02C03021 */  addu       $a2, $s6, $zero
/* BE470 800BD870 02403821 */  addu       $a3, $s2, $zero
/* BE474 800BD874 0C02F598 */  jal        quicksort_sub_sub
/* BE478 800BD878 AFB70010 */   sw        $s7, 0x10($sp)
/* BE47C 800BD87C 8FBF0038 */  lw         $ra, 0x38($sp)
/* BE480 800BD880 8FB70034 */  lw         $s7, 0x34($sp)
/* BE484 800BD884 8FB60030 */  lw         $s6, 0x30($sp)
/* BE488 800BD888 8FB5002C */  lw         $s5, 0x2c($sp)
/* BE48C 800BD88C 8FB40028 */  lw         $s4, 0x28($sp)
/* BE490 800BD890 8FB30024 */  lw         $s3, 0x24($sp)
/* BE494 800BD894 8FB20020 */  lw         $s2, 0x20($sp)
/* BE498 800BD898 8FB1001C */  lw         $s1, 0x1c($sp)
/* BE49C 800BD89C 8FB00018 */  lw         $s0, 0x18($sp)
/* BE4A0 800BD8A0 03E00008 */  jr         $ra
/* BE4A4 800BD8A4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel quicksort
/* BE4A8 800BD8A8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BE4AC 800BD8AC AFB20020 */  sw         $s2, 0x20($sp)
/* BE4B0 800BD8B0 00809021 */  addu       $s2, $a0, $zero
/* BE4B4 800BD8B4 AFB00018 */  sw         $s0, 0x18($sp)
/* BE4B8 800BD8B8 00A08021 */  addu       $s0, $a1, $zero
/* BE4BC 800BD8BC AFB1001C */  sw         $s1, 0x1c($sp)
/* BE4C0 800BD8C0 00C08821 */  addu       $s1, $a2, $zero
/* BE4C4 800BD8C4 AFB30024 */  sw         $s3, 0x24($sp)
/* BE4C8 800BD8C8 00E09821 */  addu       $s3, $a3, $zero
/* BE4CC 800BD8CC AFB5002C */  sw         $s5, 0x2c($sp)
/* BE4D0 800BD8D0 8FB50048 */  lw         $s5, 0x48($sp)
/* BE4D4 800BD8D4 2622FFFE */  addiu      $v0, $s1, -2
/* BE4D8 800BD8D8 AFBF0034 */  sw         $ra, 0x34($sp)
/* BE4DC 800BD8DC AFB60030 */  sw         $s6, 0x30($sp)
/* BE4E0 800BD8E0 16020032 */  bne        $s0, $v0, .L800BD9AC
/* BE4E4 800BD8E4 AFB40028 */   sw        $s4, 0x28($sp)
/* BE4E8 800BD8E8 02130018 */  mult       $s0, $s3
/* BE4EC 800BD8EC 00001012 */  mflo       $v0
/* BE4F0 800BD8F0 02429021 */  addu       $s2, $s2, $v0
/* BE4F4 800BD8F4 02538821 */  addu       $s1, $s2, $s3
/* BE4F8 800BD8F8 02402021 */  addu       $a0, $s2, $zero
/* BE4FC 800BD8FC 02202821 */  addu       $a1, $s1, $zero
/* BE500 800BD900 02A0F809 */  jalr       $s5
/* BE504 800BD904 0233A021 */   addu      $s4, $s1, $s3
/* BE508 800BD908 24160001 */  addiu      $s6, $zero, 1
/* BE50C 800BD90C 1456000F */  bne        $v0, $s6, .L800BD94C
/* BE510 800BD910 02202021 */   addu      $a0, $s1, $zero
/* BE514 800BD914 02402821 */  addu       $a1, $s2, $zero
/* BE518 800BD918 3C10800F */  lui        $s0, %hi(quicksort_pointer)
/* BE51C 800BD91C 8E045714 */  lw         $a0, %lo(quicksort_pointer)($s0)
/* BE520 800BD920 0C033547 */  jal        memcpy
/* BE524 800BD924 02603021 */   addu      $a2, $s3, $zero
/* BE528 800BD928 02402021 */  addu       $a0, $s2, $zero
/* BE52C 800BD92C 02202821 */  addu       $a1, $s1, $zero
/* BE530 800BD930 0C033547 */  jal        memcpy
/* BE534 800BD934 02603021 */   addu      $a2, $s3, $zero
/* BE538 800BD938 02202021 */  addu       $a0, $s1, $zero
/* BE53C 800BD93C 8E055714 */  lw         $a1, 0x5714($s0)
/* BE540 800BD940 0C033547 */  jal        memcpy
/* BE544 800BD944 02603021 */   addu      $a2, $s3, $zero
/* BE548 800BD948 02202021 */  addu       $a0, $s1, $zero
.L800BD94C:
/* BE54C 800BD94C 02A0F809 */  jalr       $s5
/* BE550 800BD950 02802821 */   addu      $a1, $s4, $zero
/* BE554 800BD954 1456000F */  bne        $v0, $s6, .L800BD994
/* BE558 800BD958 02402021 */   addu      $a0, $s2, $zero
/* BE55C 800BD95C 02202821 */  addu       $a1, $s1, $zero
/* BE560 800BD960 3C10800F */  lui        $s0, %hi(quicksort_pointer)
/* BE564 800BD964 8E045714 */  lw         $a0, %lo(quicksort_pointer)($s0)
/* BE568 800BD968 0C033547 */  jal        memcpy
/* BE56C 800BD96C 02603021 */   addu      $a2, $s3, $zero
/* BE570 800BD970 02202021 */  addu       $a0, $s1, $zero
/* BE574 800BD974 02802821 */  addu       $a1, $s4, $zero
/* BE578 800BD978 0C033547 */  jal        memcpy
/* BE57C 800BD97C 02603021 */   addu      $a2, $s3, $zero
/* BE580 800BD980 02802021 */  addu       $a0, $s4, $zero
/* BE584 800BD984 8E055714 */  lw         $a1, 0x5714($s0)
/* BE588 800BD988 0C033547 */  jal        memcpy
/* BE58C 800BD98C 02603021 */   addu      $a2, $s3, $zero
/* BE590 800BD990 02402021 */  addu       $a0, $s2, $zero
.L800BD994:
/* BE594 800BD994 02A0F809 */  jalr       $s5
/* BE598 800BD998 02202821 */   addu      $a1, $s1, $zero
/* BE59C 800BD99C 14560034 */  bne        $v0, $s6, .L800BDA70
/* BE5A0 800BD9A0 8FBF0034 */   lw        $ra, 0x34($sp)
/* BE5A4 800BD9A4 0802F679 */  j          .L800BD9E4
/* BE5A8 800BD9A8 02402821 */   addu      $a1, $s2, $zero
.L800BD9AC:
/* BE5AC 800BD9AC 2622FFFF */  addiu      $v0, $s1, -1
/* BE5B0 800BD9B0 1602001A */  bne        $s0, $v0, .L800BDA1C
/* BE5B4 800BD9B4 0211102A */   slt       $v0, $s0, $s1
/* BE5B8 800BD9B8 02130018 */  mult       $s0, $s3
/* BE5BC 800BD9BC 00001012 */  mflo       $v0
/* BE5C0 800BD9C0 02429021 */  addu       $s2, $s2, $v0
/* BE5C4 800BD9C4 02538821 */  addu       $s1, $s2, $s3
/* BE5C8 800BD9C8 02402021 */  addu       $a0, $s2, $zero
/* BE5CC 800BD9CC 02A0F809 */  jalr       $s5
/* BE5D0 800BD9D0 02202821 */   addu      $a1, $s1, $zero
/* BE5D4 800BD9D4 24030001 */  addiu      $v1, $zero, 1
/* BE5D8 800BD9D8 14430025 */  bne        $v0, $v1, .L800BDA70
/* BE5DC 800BD9DC 8FBF0034 */   lw        $ra, 0x34($sp)
/* BE5E0 800BD9E0 02402821 */  addu       $a1, $s2, $zero
.L800BD9E4:
/* BE5E4 800BD9E4 3C10800F */  lui        $s0, %hi(quicksort_pointer)
/* BE5E8 800BD9E8 8E045714 */  lw         $a0, %lo(quicksort_pointer)($s0)
/* BE5EC 800BD9EC 0C033547 */  jal        memcpy
/* BE5F0 800BD9F0 02603021 */   addu      $a2, $s3, $zero
/* BE5F4 800BD9F4 02402021 */  addu       $a0, $s2, $zero
/* BE5F8 800BD9F8 02202821 */  addu       $a1, $s1, $zero
/* BE5FC 800BD9FC 0C033547 */  jal        memcpy
/* BE600 800BDA00 02603021 */   addu      $a2, $s3, $zero
/* BE604 800BDA04 02202021 */  addu       $a0, $s1, $zero
/* BE608 800BDA08 8E055714 */  lw         $a1, 0x5714($s0)
/* BE60C 800BDA0C 0C033547 */  jal        memcpy
/* BE610 800BDA10 02603021 */   addu      $a2, $s3, $zero
/* BE614 800BDA14 0802F69C */  j          .L800BDA70
/* BE618 800BDA18 8FBF0034 */   lw        $ra, 0x34($sp)
.L800BDA1C:
/* BE61C 800BDA1C 10400013 */  beqz       $v0, .L800BDA6C
/* BE620 800BDA20 02402021 */   addu      $a0, $s2, $zero
/* BE624 800BDA24 02002821 */  addu       $a1, $s0, $zero
/* BE628 800BDA28 02203021 */  addu       $a2, $s1, $zero
/* BE62C 800BDA2C 02603821 */  addu       $a3, $s3, $zero
/* BE630 800BDA30 0C02F5F3 */  jal        quicksort_sub
/* BE634 800BDA34 AFB50010 */   sw        $s5, 0x10($sp)
/* BE638 800BDA38 02402021 */  addu       $a0, $s2, $zero
/* BE63C 800BDA3C 02002821 */  addu       $a1, $s0, $zero
/* BE640 800BDA40 00408021 */  addu       $s0, $v0, $zero
/* BE644 800BDA44 02003021 */  addu       $a2, $s0, $zero
/* BE648 800BDA48 02603821 */  addu       $a3, $s3, $zero
/* BE64C 800BDA4C 0C02F62A */  jal        quicksort
/* BE650 800BDA50 AFB50010 */   sw        $s5, 0x10($sp)
/* BE654 800BDA54 02402021 */  addu       $a0, $s2, $zero
/* BE658 800BDA58 26050001 */  addiu      $a1, $s0, 1
/* BE65C 800BDA5C 02203021 */  addu       $a2, $s1, $zero
/* BE660 800BDA60 02603821 */  addu       $a3, $s3, $zero
/* BE664 800BDA64 0C02F62A */  jal        quicksort
/* BE668 800BDA68 AFB50010 */   sw        $s5, 0x10($sp)
.L800BDA6C:
/* BE66C 800BDA6C 8FBF0034 */  lw         $ra, 0x34($sp)
.L800BDA70:
/* BE670 800BDA70 8FB60030 */  lw         $s6, 0x30($sp)
/* BE674 800BDA74 8FB5002C */  lw         $s5, 0x2c($sp)
/* BE678 800BDA78 8FB40028 */  lw         $s4, 0x28($sp)
/* BE67C 800BDA7C 8FB30024 */  lw         $s3, 0x24($sp)
/* BE680 800BDA80 8FB20020 */  lw         $s2, 0x20($sp)
/* BE684 800BDA84 8FB1001C */  lw         $s1, 0x1c($sp)
/* BE688 800BDA88 8FB00018 */  lw         $s0, 0x18($sp)
/* BE68C 800BDA8C 03E00008 */  jr         $ra
/* BE690 800BDA90 27BD0038 */   addiu     $sp, $sp, 0x38

glabel quicksort_func
/* BE694 800BDA94 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BE698 800BDA98 AFB5002C */  sw         $s5, 0x2c($sp)
/* BE69C 800BDA9C 0080A821 */  addu       $s5, $a0, $zero
/* BE6A0 800BDAA0 AFB30024 */  sw         $s3, 0x24($sp)
/* BE6A4 800BDAA4 00C09821 */  addu       $s3, $a2, $zero
/* BE6A8 800BDAA8 02602021 */  addu       $a0, $s3, $zero
/* BE6AC 800BDAAC AFB20020 */  sw         $s2, 0x20($sp)
/* BE6B0 800BDAB0 00A09021 */  addu       $s2, $a1, $zero
/* BE6B4 800BDAB4 3C02800E */  lui        $v0, %hi(D_800E4A70)
/* BE6B8 800BDAB8 AFB40028 */  sw         $s4, 0x28($sp)
/* BE6BC 800BDABC 24544A70 */  addiu      $s4, $v0, %lo(D_800E4A70)
/* BE6C0 800BDAC0 02802821 */  addu       $a1, $s4, $zero
/* BE6C4 800BDAC4 24060106 */  addiu      $a2, $zero, 0x106
/* BE6C8 800BDAC8 AFB00018 */  sw         $s0, 0x18($sp)
/* BE6CC 800BDACC 00E08021 */  addu       $s0, $a3, $zero
/* BE6D0 800BDAD0 AFB1001C */  sw         $s1, 0x1c($sp)
/* BE6D4 800BDAD4 AFBF0030 */  sw         $ra, 0x30($sp)
/* BE6D8 800BDAD8 0C025F9C */  jal        Malloc
/* BE6DC 800BDADC 3C11800F */   lui       $s1, %hi(quicksort_pointer)
/* BE6E0 800BDAE0 12400007 */  beqz       $s2, .L800BDB00
/* BE6E4 800BDAE4 AE225714 */   sw        $v0, %lo(quicksort_pointer)($s1)
/* BE6E8 800BDAE8 AFB00010 */  sw         $s0, 0x10($sp)
/* BE6EC 800BDAEC 02A02021 */  addu       $a0, $s5, $zero
/* BE6F0 800BDAF0 00002821 */  addu       $a1, $zero, $zero
/* BE6F4 800BDAF4 2646FFFF */  addiu      $a2, $s2, -1
/* BE6F8 800BDAF8 0C02F62A */  jal        quicksort
/* BE6FC 800BDAFC 02603821 */   addu      $a3, $s3, $zero
.L800BDB00:
/* BE700 800BDB00 02802821 */  addu       $a1, $s4, $zero
/* BE704 800BDB04 8E245714 */  lw         $a0, 0x5714($s1)
/* BE708 800BDB08 0C02600C */  jal        Free
/* BE70C 800BDB0C 2406010B */   addiu     $a2, $zero, 0x10b
/* BE710 800BDB10 8FBF0030 */  lw         $ra, 0x30($sp)
/* BE714 800BDB14 8FB5002C */  lw         $s5, 0x2c($sp)
/* BE718 800BDB18 8FB40028 */  lw         $s4, 0x28($sp)
/* BE71C 800BDB1C 8FB30024 */  lw         $s3, 0x24($sp)
/* BE720 800BDB20 8FB20020 */  lw         $s2, 0x20($sp)
/* BE724 800BDB24 8FB1001C */  lw         $s1, 0x1c($sp)
/* BE728 800BDB28 8FB00018 */  lw         $s0, 0x18($sp)
/* BE72C 800BDB2C 03E00008 */  jr         $ra
/* BE730 800BDB30 27BD0038 */   addiu     $sp, $sp, 0x38

glabel NOOP_800bdb34
/* BE734 800BDB34 03E00008 */  jr         $ra
/* BE738 800BDB38 00000000 */   nop

glabel passto_NOOP_800bdb34
/* BE73C 800BDB3C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* BE740 800BDB40 24040001 */  addiu      $a0, $zero, 1
/* BE744 800BDB44 AFBF0010 */  sw         $ra, 0x10($sp)
/* BE748 800BDB48 0C02F6CD */  jal        NOOP_800bdb34
/* BE74C 800BDB4C 3405FFFF */   ori       $a1, $zero, 0xffff
/* BE750 800BDB50 8FBF0010 */  lw         $ra, 0x10($sp)
/* BE754 800BDB54 03E00008 */  jr         $ra
/* BE758 800BDB58 27BD0018 */   addiu     $sp, $sp, 0x18
/* BE75C 800BDB5C 00000000 */  nop
