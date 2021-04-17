.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_800BB530
/* BC130 800BB530 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* BC134 800BB534 AFB10014 */  sw         $s1, 0x14($sp)
/* BC138 800BB538 00808821 */  addu       $s1, $a0, $zero
/* BC13C 800BB53C AFB20018 */  sw         $s2, 0x18($sp)
/* BC140 800BB540 97B2003A */  lhu        $s2, 0x3a($sp)
/* BC144 800BB544 AFB00010 */  sw         $s0, 0x10($sp)
/* BC148 800BB548 00A08021 */  addu       $s0, $a1, $zero
/* BC14C 800BB54C AFB3001C */  sw         $s3, 0x1c($sp)
/* BC150 800BB550 00C09821 */  addu       $s3, $a2, $zero
/* BC154 800BB554 AFB40020 */  sw         $s4, 0x20($sp)
/* BC158 800BB558 AFBF0024 */  sw         $ra, 0x24($sp)
/* BC15C 800BB55C 0C02DCFC */  jal        widget_init
/* BC160 800BB560 00E0A021 */   addu      $s4, $a3, $zero
/* BC164 800BB564 2404000C */  addiu      $a0, $zero, 0xc
/* BC168 800BB568 3C02800E */  lui        $v0, %hi(D_800E48A0)
/* BC16C 800BB56C 244248A0 */  addiu      $v0, $v0, %lo(D_800E48A0)
/* BC170 800BB570 0C026259 */  jal        passToMalloc
/* BC174 800BB574 AE220078 */   sw        $v0, 0x78($s1)
/* BC178 800BB578 8E650078 */  lw         $a1, 0x78($s3)
/* BC17C 800BB57C AE30007C */  sw         $s0, 0x7c($s1)
/* BC180 800BB580 00408021 */  addu       $s0, $v0, $zero
/* BC184 800BB584 84A40018 */  lh         $a0, 0x18($a1)
/* BC188 800BB588 8CA3001C */  lw         $v1, 0x1c($a1)
/* BC18C 800BB58C 0060F809 */  jalr       $v1
/* BC190 800BB590 02642021 */   addu      $a0, $s3, $a0
/* BC194 800BB594 8E24007C */  lw         $a0, 0x7c($s1)
/* BC198 800BB598 94830060 */  lhu        $v1, 0x60($a0)
/* BC19C 800BB59C 00621823 */  subu       $v1, $v1, $v0
/* BC1A0 800BB5A0 A6230060 */  sh         $v1, 0x60($s1)
/* BC1A4 800BB5A4 94820062 */  lhu        $v0, 0x62($a0)
/* BC1A8 800BB5A8 8E630078 */  lw         $v1, 0x78($s3)
/* BC1AC 800BB5AC A6220062 */  sh         $v0, 0x62($s1)
/* BC1B0 800BB5B0 84640018 */  lh         $a0, 0x18($v1)
/* BC1B4 800BB5B4 8C62001C */  lw         $v0, 0x1c($v1)
/* BC1B8 800BB5B8 0040F809 */  jalr       $v0
/* BC1BC 800BB5BC 02642021 */   addu      $a0, $s3, $a0
/* BC1C0 800BB5C0 A6220074 */  sh         $v0, 0x74($s1)
/* BC1C4 800BB5C4 3402FFFF */  ori        $v0, $zero, 0xffff
/* BC1C8 800BB5C8 16420006 */  bne        $s2, $v0, .L800BB5E4
/* BC1CC 800BB5CC A6320072 */   sh        $s2, 0x72($s1)
/* BC1D0 800BB5D0 8E22007C */  lw         $v0, 0x7c($s1)
/* BC1D4 800BB5D4 9443006A */  lhu        $v1, 0x6a($v0)
/* BC1D8 800BB5D8 94440068 */  lhu        $a0, 0x68($v0)
/* BC1DC 800BB5DC 00641823 */  subu       $v1, $v1, $a0
/* BC1E0 800BB5E0 A6230072 */  sh         $v1, 0x72($s1)
.L800BB5E4:
/* BC1E4 800BB5E4 24020014 */  addiu      $v0, $zero, 0x14
/* BC1E8 800BB5E8 AE130000 */  sw         $s3, ($s0)
/* BC1EC 800BB5EC AE140004 */  sw         $s4, 4($s0)
/* BC1F0 800BB5F0 12400012 */  beqz       $s2, .L800BB63C
/* BC1F4 800BB5F4 A2020008 */   sb        $v0, 8($s0)
/* BC1F8 800BB5F8 86250060 */  lh         $a1, 0x60($s1)
/* BC1FC 800BB5FC 86260062 */  lh         $a2, 0x62($s1)
/* BC200 800BB600 0C02DD3F */  jal        set_widget_coords
/* BC204 800BB604 02602021 */   addu      $a0, $s3, $zero
/* BC208 800BB608 8E050004 */  lw         $a1, 4($s0)
/* BC20C 800BB60C 8CA30078 */  lw         $v1, 0x78($a1)
/* BC210 800BB610 84640020 */  lh         $a0, 0x20($v1)
/* BC214 800BB614 8C620024 */  lw         $v0, 0x24($v1)
/* BC218 800BB618 0040F809 */  jalr       $v0
/* BC21C 800BB61C 00A42021 */   addu      $a0, $a1, $a0
/* BC220 800BB620 8E040004 */  lw         $a0, 4($s0)
/* BC224 800BB624 86260062 */  lh         $a2, 0x62($s1)
/* BC228 800BB628 96230072 */  lhu        $v1, 0x72($s1)
/* BC22C 800BB62C 86250060 */  lh         $a1, 0x60($s1)
/* BC230 800BB630 00C33021 */  addu       $a2, $a2, $v1
/* BC234 800BB634 0C02DD3F */  jal        set_widget_coords
/* BC238 800BB638 00C23023 */   subu      $a2, $a2, $v0
.L800BB63C:
/* BC23C 800BB63C 8E020000 */  lw         $v0, ($s0)
/* BC240 800BB640 8FBF0024 */  lw         $ra, 0x24($sp)
/* BC244 800BB644 8FB40020 */  lw         $s4, 0x20($sp)
/* BC248 800BB648 8FB3001C */  lw         $s3, 0x1c($sp)
/* BC24C 800BB64C 8FB20018 */  lw         $s2, 0x18($sp)
/* BC250 800BB650 A040005B */  sb         $zero, 0x5b($v0)
/* BC254 800BB654 8E030004 */  lw         $v1, 4($s0)
/* BC258 800BB658 02201021 */  addu       $v0, $s1, $zero
/* BC25C 800BB65C A060005B */  sb         $zero, 0x5b($v1)
/* BC260 800BB660 24030001 */  addiu      $v1, $zero, 1
/* BC264 800BB664 AE300040 */  sw         $s0, 0x40($s1)
/* BC268 800BB668 A2230070 */  sb         $v1, 0x70($s1)
/* BC26C 800BB66C 8FB10014 */  lw         $s1, 0x14($sp)
/* BC270 800BB670 8FB00010 */  lw         $s0, 0x10($sp)
/* BC274 800BB674 03E00008 */  jr         $ra
/* BC278 800BB678 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800BB67C
/* BC27C 800BB67C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* BC280 800BB680 AFB10014 */  sw         $s1, 0x14($sp)
/* BC284 800BB684 00808821 */  addu       $s1, $a0, $zero
/* BC288 800BB688 3C02800E */  lui        $v0, %hi(D_800E48A0)
/* BC28C 800BB68C 244248A0 */  addiu      $v0, $v0, %lo(D_800E48A0)
/* BC290 800BB690 AFBF001C */  sw         $ra, 0x1c($sp)
/* BC294 800BB694 AFB20018 */  sw         $s2, 0x18($sp)
/* BC298 800BB698 AFB00010 */  sw         $s0, 0x10($sp)
/* BC29C 800BB69C 8E300040 */  lw         $s0, 0x40($s1)
/* BC2A0 800BB6A0 00A09021 */  addu       $s2, $a1, $zero
/* BC2A4 800BB6A4 12000016 */  beqz       $s0, .L800BB700
/* BC2A8 800BB6A8 AE220078 */   sw        $v0, 0x78($s1)
/* BC2AC 800BB6AC 8E060000 */  lw         $a2, ($s0)
/* BC2B0 800BB6B0 10C00007 */  beqz       $a2, .L800BB6D0
/* BC2B4 800BB6B4 24050003 */   addiu     $a1, $zero, 3
/* BC2B8 800BB6B8 8CC20078 */  lw         $v0, 0x78($a2)
/* BC2BC 800BB6BC 84440008 */  lh         $a0, 8($v0)
/* BC2C0 800BB6C0 8C43000C */  lw         $v1, 0xc($v0)
/* BC2C4 800BB6C4 0060F809 */  jalr       $v1
/* BC2C8 800BB6C8 00C42021 */   addu      $a0, $a2, $a0
/* BC2CC 800BB6CC AE000000 */  sw         $zero, ($s0)
.L800BB6D0:
/* BC2D0 800BB6D0 8E060004 */  lw         $a2, 4($s0)
/* BC2D4 800BB6D4 10C00007 */  beqz       $a2, .L800BB6F4
/* BC2D8 800BB6D8 24050003 */   addiu     $a1, $zero, 3
/* BC2DC 800BB6DC 8CC20078 */  lw         $v0, 0x78($a2)
/* BC2E0 800BB6E0 84440008 */  lh         $a0, 8($v0)
/* BC2E4 800BB6E4 8C43000C */  lw         $v1, 0xc($v0)
/* BC2E8 800BB6E8 0060F809 */  jalr       $v1
/* BC2EC 800BB6EC 00C42021 */   addu      $a0, $a2, $a0
/* BC2F0 800BB6F0 AE000004 */  sw         $zero, 4($s0)
.L800BB6F4:
/* BC2F4 800BB6F4 0C026262 */  jal        passToFree
/* BC2F8 800BB6F8 02002021 */   addu      $a0, $s0, $zero
/* BC2FC 800BB6FC AE200040 */  sw         $zero, 0x40($s1)
.L800BB700:
/* BC300 800BB700 02202021 */  addu       $a0, $s1, $zero
/* BC304 800BB704 0C02DD2B */  jal        free_widget
/* BC308 800BB708 02402821 */   addu      $a1, $s2, $zero
/* BC30C 800BB70C 8FBF001C */  lw         $ra, 0x1c($sp)
/* BC310 800BB710 8FB20018 */  lw         $s2, 0x18($sp)
/* BC314 800BB714 8FB10014 */  lw         $s1, 0x14($sp)
/* BC318 800BB718 8FB00010 */  lw         $s0, 0x10($sp)
/* BC31C 800BB71C 03E00008 */  jr         $ra
/* BC320 800BB720 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800BB724
/* BC324 800BB724 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* BC328 800BB728 AFB1001C */  sw         $s1, 0x1c($sp)
/* BC32C 800BB72C 00068C00 */  sll        $s1, $a2, 0x10
/* BC330 800BB730 00118C03 */  sra        $s1, $s1, 0x10
/* BC334 800BB734 02203021 */  addu       $a2, $s1, $zero
/* BC338 800BB738 AFB5002C */  sw         $s5, 0x2c($sp)
/* BC33C 800BB73C 0080A821 */  addu       $s5, $a0, $zero
/* BC340 800BB740 AFB00018 */  sw         $s0, 0x18($sp)
/* BC344 800BB744 00078400 */  sll        $s0, $a3, 0x10
/* BC348 800BB748 AFBF0030 */  sw         $ra, 0x30($sp)
/* BC34C 800BB74C AFB40028 */  sw         $s4, 0x28($sp)
/* BC350 800BB750 AFB30024 */  sw         $s3, 0x24($sp)
/* BC354 800BB754 AFB20020 */  sw         $s2, 0x20($sp)
/* BC358 800BB758 8EB40040 */  lw         $s4, 0x40($s5)
/* BC35C 800BB75C 00108403 */  sra        $s0, $s0, 0x10
/* BC360 800BB760 8E880000 */  lw         $t0, ($s4)
/* BC364 800BB764 87B3004A */  lh         $s3, 0x4a($sp)
/* BC368 800BB768 8D030078 */  lw         $v1, 0x78($t0)
/* BC36C 800BB76C 87B2004E */  lh         $s2, 0x4e($sp)
/* BC370 800BB770 84640040 */  lh         $a0, 0x40($v1)
/* BC374 800BB774 02003821 */  addu       $a3, $s0, $zero
/* BC378 800BB778 AFB30010 */  sw         $s3, 0x10($sp)
/* BC37C 800BB77C AFB20014 */  sw         $s2, 0x14($sp)
/* BC380 800BB780 8C620044 */  lw         $v0, 0x44($v1)
/* BC384 800BB784 0040F809 */  jalr       $v0
/* BC388 800BB788 01042021 */   addu      $a0, $t0, $a0
/* BC38C 800BB78C 8E880004 */  lw         $t0, 4($s4)
/* BC390 800BB790 00402821 */  addu       $a1, $v0, $zero
/* BC394 800BB794 8D030078 */  lw         $v1, 0x78($t0)
/* BC398 800BB798 02203021 */  addu       $a2, $s1, $zero
/* BC39C 800BB79C 84640040 */  lh         $a0, 0x40($v1)
/* BC3A0 800BB7A0 02003821 */  addu       $a3, $s0, $zero
/* BC3A4 800BB7A4 AFB30010 */  sw         $s3, 0x10($sp)
/* BC3A8 800BB7A8 AFB20014 */  sw         $s2, 0x14($sp)
/* BC3AC 800BB7AC 8C620044 */  lw         $v0, 0x44($v1)
/* BC3B0 800BB7B0 0040F809 */  jalr       $v0
/* BC3B4 800BB7B4 01042021 */   addu      $a0, $t0, $a0
/* BC3B8 800BB7B8 02A02021 */  addu       $a0, $s5, $zero
/* BC3BC 800BB7BC 00402821 */  addu       $a1, $v0, $zero
/* BC3C0 800BB7C0 02203021 */  addu       $a2, $s1, $zero
/* BC3C4 800BB7C4 02003821 */  addu       $a3, $s0, $zero
/* BC3C8 800BB7C8 AFB30010 */  sw         $s3, 0x10($sp)
/* BC3CC 800BB7CC 0C02DE14 */  jal        widget_func_8
/* BC3D0 800BB7D0 AFB20014 */   sw        $s2, 0x14($sp)
/* BC3D4 800BB7D4 8FBF0030 */  lw         $ra, 0x30($sp)
/* BC3D8 800BB7D8 8FB5002C */  lw         $s5, 0x2c($sp)
/* BC3DC 800BB7DC 8FB40028 */  lw         $s4, 0x28($sp)
/* BC3E0 800BB7E0 8FB30024 */  lw         $s3, 0x24($sp)
/* BC3E4 800BB7E4 8FB20020 */  lw         $s2, 0x20($sp)
/* BC3E8 800BB7E8 8FB1001C */  lw         $s1, 0x1c($sp)
/* BC3EC 800BB7EC 8FB00018 */  lw         $s0, 0x18($sp)
/* BC3F0 800BB7F0 03E00008 */  jr         $ra
/* BC3F4 800BB7F4 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_800BB7F8
/* BC3F8 800BB7F8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* BC3FC 800BB7FC AFB30024 */  sw         $s3, 0x24($sp)
/* BC400 800BB800 00809821 */  addu       $s3, $a0, $zero
/* BC404 800BB804 AFBF0028 */  sw         $ra, 0x28($sp)
/* BC408 800BB808 AFB20020 */  sw         $s2, 0x20($sp)
/* BC40C 800BB80C AFB1001C */  sw         $s1, 0x1c($sp)
/* BC410 800BB810 AFB00018 */  sw         $s0, 0x18($sp)
/* BC414 800BB814 96620072 */  lhu        $v0, 0x72($s3)
/* BC418 800BB818 10400012 */  beqz       $v0, .L800BB864
/* BC41C 800BB81C 8E720040 */   lw        $s2, 0x40($s3)
/* BC420 800BB820 8E440000 */  lw         $a0, ($s2)
/* BC424 800BB824 86650060 */  lh         $a1, 0x60($s3)
/* BC428 800BB828 0C02DD3F */  jal        set_widget_coords
/* BC42C 800BB82C 86660062 */   lh        $a2, 0x62($s3)
/* BC430 800BB830 8E450004 */  lw         $a1, 4($s2)
/* BC434 800BB834 8CA30078 */  lw         $v1, 0x78($a1)
/* BC438 800BB838 84640020 */  lh         $a0, 0x20($v1)
/* BC43C 800BB83C 8C620024 */  lw         $v0, 0x24($v1)
/* BC440 800BB840 0040F809 */  jalr       $v0
/* BC444 800BB844 00A42021 */   addu      $a0, $a1, $a0
/* BC448 800BB848 8E440004 */  lw         $a0, 4($s2)
/* BC44C 800BB84C 86660062 */  lh         $a2, 0x62($s3)
/* BC450 800BB850 96630072 */  lhu        $v1, 0x72($s3)
/* BC454 800BB854 86650060 */  lh         $a1, 0x60($s3)
/* BC458 800BB858 00C33021 */  addu       $a2, $a2, $v1
/* BC45C 800BB85C 0C02DD3F */  jal        set_widget_coords
/* BC460 800BB860 00C23023 */   subu      $a2, $a2, $v0
.L800BB864:
/* BC464 800BB864 8E65007C */  lw         $a1, 0x7c($s3)
/* BC468 800BB868 00008821 */  addu       $s1, $zero, $zero
/* BC46C 800BB86C 8CA30078 */  lw         $v1, 0x78($a1)
/* BC470 800BB870 00008021 */  addu       $s0, $zero, $zero
/* BC474 800BB874 84640010 */  lh         $a0, 0x10($v1)
/* BC478 800BB878 8C620014 */  lw         $v0, 0x14($v1)
/* BC47C 800BB87C 0040F809 */  jalr       $v0
/* BC480 800BB880 00A42021 */   addu      $a0, $a1, $a0
/* BC484 800BB884 00401821 */  addu       $v1, $v0, $zero
/* BC488 800BB888 24020009 */  addiu      $v0, $zero, 9
/* BC48C 800BB88C 1062000C */  beq        $v1, $v0, .L800BB8C0
/* BC490 800BB890 2862000A */   slti      $v0, $v1, 0xa
/* BC494 800BB894 10400005 */  beqz       $v0, .L800BB8AC
/* BC498 800BB898 24020008 */   addiu     $v0, $zero, 8
/* BC49C 800BB89C 5062000D */  beql       $v1, $v0, .L800BB8D4
/* BC4A0 800BB8A0 8E62007C */   lw        $v0, 0x7c($s3)
/* BC4A4 800BB8A4 0802EE3C */  j          .L800BB8F0
/* BC4A8 800BB8A8 00000000 */   nop
.L800BB8AC:
/* BC4AC 800BB8AC 2402000B */  addiu      $v0, $zero, 0xb
/* BC4B0 800BB8B0 5062000C */  beql       $v1, $v0, .L800BB8E4
/* BC4B4 800BB8B4 8E62007C */   lw        $v0, 0x7c($s3)
/* BC4B8 800BB8B8 0802EE3C */  j          .L800BB8F0
/* BC4BC 800BB8BC 00000000 */   nop
.L800BB8C0:
/* BC4C0 800BB8C0 8E62007C */  lw         $v0, 0x7c($s3)
/* BC4C4 800BB8C4 8C430040 */  lw         $v1, 0x40($v0)
/* BC4C8 800BB8C8 8C710000 */  lw         $s1, ($v1)
/* BC4CC 800BB8CC 0802EE3C */  j          .L800BB8F0
/* BC4D0 800BB8D0 9470000C */   lhu       $s0, 0xc($v1)
.L800BB8D4:
/* BC4D4 800BB8D4 8C430040 */  lw         $v1, 0x40($v0)
/* BC4D8 800BB8D8 8C710018 */  lw         $s1, 0x18($v1)
/* BC4DC 800BB8DC 0802EE3C */  j          .L800BB8F0
/* BC4E0 800BB8E0 94700020 */   lhu       $s0, 0x20($v1)
.L800BB8E4:
/* BC4E4 800BB8E4 8C430040 */  lw         $v1, 0x40($v0)
/* BC4E8 800BB8E8 8C71000C */  lw         $s1, 0xc($v1)
/* BC4EC 800BB8EC 90700012 */  lbu        $s0, 0x12($v1)
.L800BB8F0:
/* BC4F0 800BB8F0 52200041 */  beql       $s1, $zero, .L800BB9F8
/* BC4F4 800BB8F4 9262005B */   lbu       $v0, 0x5b($s3)
/* BC4F8 800BB8F8 1200003E */  beqz       $s0, .L800BB9F4
/* BC4FC 800BB8FC 00101880 */   sll       $v1, $s0, 2
/* BC500 800BB900 00711821 */  addu       $v1, $v1, $s1
/* BC504 800BB904 8E240000 */  lw         $a0, ($s1)
/* BC508 800BB908 8E65007C */  lw         $a1, 0x7c($s3)
/* BC50C 800BB90C 84820062 */  lh         $v0, 0x62($a0)
/* BC510 800BB910 84A60068 */  lh         $a2, 0x68($a1)
/* BC514 800BB914 0046102A */  slt        $v0, $v0, $a2
/* BC518 800BB918 1440000B */  bnez       $v0, .L800BB948
/* BC51C 800BB91C 8C70FFFC */   lw        $s0, -4($v1)
/* BC520 800BB920 8E430000 */  lw         $v1, ($s2)
/* BC524 800BB924 92440008 */  lbu        $a0, 8($s2)
/* BC528 800BB928 9065005B */  lbu        $a1, 0x5b($v1)
/* BC52C 800BB92C 0085102B */  sltu       $v0, $a0, $a1
/* BC530 800BB930 10400003 */  beqz       $v0, .L800BB940
/* BC534 800BB934 00A41023 */   subu      $v0, $a1, $a0
/* BC538 800BB938 0802EE5D */  j          .L800BB974
/* BC53C 800BB93C A062005B */   sb        $v0, 0x5b($v1)
.L800BB940:
/* BC540 800BB940 0802EE5D */  j          .L800BB974
/* BC544 800BB944 A060005B */   sb        $zero, 0x5b($v1)
.L800BB948:
/* BC548 800BB948 240600FF */  addiu      $a2, $zero, 0xff
/* BC54C 800BB94C 8E430000 */  lw         $v1, ($s2)
/* BC550 800BB950 92450008 */  lbu        $a1, 8($s2)
/* BC554 800BB954 9064005B */  lbu        $a0, 0x5b($v1)
/* BC558 800BB958 00C51023 */  subu       $v0, $a2, $a1
/* BC55C 800BB95C 0082102A */  slt        $v0, $a0, $v0
/* BC560 800BB960 10400003 */  beqz       $v0, .L800BB970
/* BC564 800BB964 00851021 */   addu      $v0, $a0, $a1
/* BC568 800BB968 0802EE5D */  j          .L800BB974
/* BC56C 800BB96C A062005B */   sb        $v0, 0x5b($v1)
.L800BB970:
/* BC570 800BB970 A066005B */  sb         $a2, 0x5b($v1)
.L800BB974:
/* BC574 800BB974 8E030078 */  lw         $v1, 0x78($s0)
/* BC578 800BB978 84640020 */  lh         $a0, 0x20($v1)
/* BC57C 800BB97C 8C620024 */  lw         $v0, 0x24($v1)
/* BC580 800BB980 0040F809 */  jalr       $v0
/* BC584 800BB984 02042021 */   addu      $a0, $s0, $a0
/* BC588 800BB988 8E65007C */  lw         $a1, 0x7c($s3)
/* BC58C 800BB98C 86030062 */  lh         $v1, 0x62($s0)
/* BC590 800BB990 84A4006A */  lh         $a0, 0x6a($a1)
/* BC594 800BB994 00621821 */  addu       $v1, $v1, $v0
/* BC598 800BB998 0083202A */  slt        $a0, $a0, $v1
/* BC59C 800BB99C 1480000B */  bnez       $a0, .L800BB9CC
/* BC5A0 800BB9A0 240600FF */   addiu     $a2, $zero, 0xff
/* BC5A4 800BB9A4 8E430004 */  lw         $v1, 4($s2)
/* BC5A8 800BB9A8 92440008 */  lbu        $a0, 8($s2)
/* BC5AC 800BB9AC 9065005B */  lbu        $a1, 0x5b($v1)
/* BC5B0 800BB9B0 0085102B */  sltu       $v0, $a0, $a1
/* BC5B4 800BB9B4 10400003 */  beqz       $v0, .L800BB9C4
/* BC5B8 800BB9B8 00A41023 */   subu      $v0, $a1, $a0
/* BC5BC 800BB9BC 0802EE7D */  j          .L800BB9F4
/* BC5C0 800BB9C0 A062005B */   sb        $v0, 0x5b($v1)
.L800BB9C4:
/* BC5C4 800BB9C4 0802EE7D */  j          .L800BB9F4
/* BC5C8 800BB9C8 A060005B */   sb        $zero, 0x5b($v1)
.L800BB9CC:
/* BC5CC 800BB9CC 8E430004 */  lw         $v1, 4($s2)
/* BC5D0 800BB9D0 92450008 */  lbu        $a1, 8($s2)
/* BC5D4 800BB9D4 9064005B */  lbu        $a0, 0x5b($v1)
/* BC5D8 800BB9D8 00C51023 */  subu       $v0, $a2, $a1
/* BC5DC 800BB9DC 0082102A */  slt        $v0, $a0, $v0
/* BC5E0 800BB9E0 10400003 */  beqz       $v0, .L800BB9F0
/* BC5E4 800BB9E4 00851021 */   addu      $v0, $a0, $a1
/* BC5E8 800BB9E8 0802EE7D */  j          .L800BB9F4
/* BC5EC 800BB9EC A062005B */   sb        $v0, 0x5b($v1)
.L800BB9F0:
/* BC5F0 800BB9F0 A066005B */  sb         $a2, 0x5b($v1)
.L800BB9F4:
/* BC5F4 800BB9F4 9262005B */  lbu        $v0, 0x5b($s3)
.L800BB9F8:
/* BC5F8 800BB9F8 3C118080 */  lui        $s1, 0x8080
/* BC5FC 800BB9FC 36318081 */  ori        $s1, $s1, 0x8081
/* BC600 800BBA00 00510019 */  multu      $v0, $s1
/* BC604 800BBA04 8E480000 */  lw         $t0, ($s2)
/* BC608 800BBA08 9103005B */  lbu        $v1, 0x5b($t0)
/* BC60C 800BBA0C 00001010 */  mfhi       $v0
/* BC610 800BBA10 000211C2 */  srl        $v0, $v0, 7
/* BC614 800BBA14 304200FF */  andi       $v0, $v0, 0xff
/* BC618 800BBA18 00620018 */  mult       $v1, $v0
/* BC61C 800BBA1C 3C10800F */  lui        $s0, %hi(D_800F36F8)
/* BC620 800BBA20 92650058 */  lbu        $a1, 0x58($s3)
/* BC624 800BBA24 00001812 */  mflo       $v1
/* BC628 800BBA28 C60236F8 */  lwc1       $f2, %lo(D_800F36F8)($s0)
/* BC62C 800BBA2C 44830000 */  mtc1       $v1, $f0
/* BC630 800BBA30 46800020 */  cvt.s.w    $f0, $f0
/* BC634 800BBA34 46020002 */  mul.s      $f0, $f0, $f2
/* BC638 800BBA38 92660059 */  lbu        $a2, 0x59($s3)
/* BC63C 800BBA3C 8D020078 */  lw         $v0, 0x78($t0)
/* BC640 800BBA40 9267005A */  lbu        $a3, 0x5a($s3)
/* BC644 800BBA44 84440048 */  lh         $a0, 0x48($v0)
/* BC648 800BBA48 4600008D */  trunc.w.s  $f2, $f0
/* BC64C 800BBA4C E7A20010 */  swc1       $f2, 0x10($sp)
/* BC650 800BBA50 8C43004C */  lw         $v1, 0x4c($v0)
/* BC654 800BBA54 0060F809 */  jalr       $v1
/* BC658 800BBA58 01042021 */   addu      $a0, $t0, $a0
/* BC65C 800BBA5C 9262005B */  lbu        $v0, 0x5b($s3)
/* BC660 800BBA60 00510019 */  multu      $v0, $s1
/* BC664 800BBA64 8E480004 */  lw         $t0, 4($s2)
/* BC668 800BBA68 9103005B */  lbu        $v1, 0x5b($t0)
/* BC66C 800BBA6C 00001010 */  mfhi       $v0
/* BC670 800BBA70 000211C2 */  srl        $v0, $v0, 7
/* BC674 800BBA74 304200FF */  andi       $v0, $v0, 0xff
/* BC678 800BBA78 00620018 */  mult       $v1, $v0
/* BC67C 800BBA7C 92650058 */  lbu        $a1, 0x58($s3)
/* BC680 800BBA80 00001812 */  mflo       $v1
/* BC684 800BBA84 C60236F8 */  lwc1       $f2, 0x36f8($s0)
/* BC688 800BBA88 44830000 */  mtc1       $v1, $f0
/* BC68C 800BBA8C 46800020 */  cvt.s.w    $f0, $f0
/* BC690 800BBA90 46020002 */  mul.s      $f0, $f0, $f2
/* BC694 800BBA94 92660059 */  lbu        $a2, 0x59($s3)
/* BC698 800BBA98 8D030078 */  lw         $v1, 0x78($t0)
/* BC69C 800BBA9C 9267005A */  lbu        $a3, 0x5a($s3)
/* BC6A0 800BBAA0 84640048 */  lh         $a0, 0x48($v1)
/* BC6A4 800BBAA4 4600008D */  trunc.w.s  $f2, $f0
/* BC6A8 800BBAA8 E7A20010 */  swc1       $f2, 0x10($sp)
/* BC6AC 800BBAAC 8C62004C */  lw         $v0, 0x4c($v1)
/* BC6B0 800BBAB0 0040F809 */  jalr       $v0
/* BC6B4 800BBAB4 01042021 */   addu      $a0, $t0, $a0
/* BC6B8 800BBAB8 0C02DE51 */  jal        func_800B7944
/* BC6BC 800BBABC 02602021 */   addu      $a0, $s3, $zero
/* BC6C0 800BBAC0 8FBF0028 */  lw         $ra, 0x28($sp)
/* BC6C4 800BBAC4 8FB30024 */  lw         $s3, 0x24($sp)
/* BC6C8 800BBAC8 8FB20020 */  lw         $s2, 0x20($sp)
/* BC6CC 800BBACC 8FB1001C */  lw         $s1, 0x1c($sp)
/* BC6D0 800BBAD0 8FB00018 */  lw         $s0, 0x18($sp)
/* BC6D4 800BBAD4 03E00008 */  jr         $ra
/* BC6D8 800BBAD8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel ret7
/* BC6DC 800BBADC 03E00008 */  jr         $ra
/* BC6E0 800BBAE0 24020007 */   addiu     $v0, $zero, 7
/* BC6E4 800BBAE4 00000000 */  nop
/* BC6E8 800BBAE8 00000000 */  nop
/* BC6EC 800BBAEC 00000000 */  nop
