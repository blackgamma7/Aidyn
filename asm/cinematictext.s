.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel cinematictext_init
/* 5E020 8005D420 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 5E024 8005D424 AFB1009C */  sw         $s1, 0x9c($sp)
/* 5E028 8005D428 00808821 */  addu       $s1, $a0, $zero
/* 5E02C 8005D42C 2404021C */  addiu      $a0, $zero, 0x21c
/* 5E030 8005D430 3C05800E */  lui        $a1, %hi(D_800DF0E0)
/* 5E034 8005D434 24A5F0E0 */  addiu      $a1, $a1, %lo(D_800DF0E0)
/* 5E038 8005D438 24060056 */  addiu      $a2, $zero, 0x56
/* 5E03C 8005D43C AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 5E040 8005D440 0C025F9C */  jal        Malloc
/* 5E044 8005D444 AFB00098 */   sw        $s0, 0x98($sp)
/* 5E048 8005D448 3C10800F */  lui        $s0, %hi(cinematictect_pointer)
/* 5E04C 8005D44C 10400028 */  beqz       $v0, .L8005D4F0
/* 5E050 8005D450 AE02F530 */   sw        $v0, %lo(cinematictect_pointer)($s0)
/* 5E054 8005D454 00402021 */  addu       $a0, $v0, $zero
/* 5E058 8005D458 00002821 */  addu       $a1, $zero, $zero
/* 5E05C 8005D45C 0C026380 */  jal        Calloc
/* 5E060 8005D460 2406021C */   addiu     $a2, $zero, 0x21c
/* 5E064 8005D464 12200004 */  beqz       $s1, .L8005D478
/* 5E068 8005D468 8E04F530 */   lw        $a0, -0xad0($s0)
/* 5E06C 8005D46C 02202821 */  addu       $a1, $s1, $zero
/* 5E070 8005D470 0C02626C */  jal        copy_string
/* 5E074 8005D474 2484011A */   addiu     $a0, $a0, 0x11a
.L8005D478:
/* 5E078 8005D478 24040098 */  addiu      $a0, $zero, 0x98
/* 5E07C 8005D47C 8E10F530 */  lw         $s0, -0xad0($s0)
/* 5E080 8005D480 3402FFFF */  ori        $v0, $zero, 0xffff
/* 5E084 8005D484 AE000000 */  sw         $zero, ($s0)
/* 5E088 8005D488 0C026259 */  jal        passToMalloc
/* 5E08C 8005D48C A6020016 */   sh        $v0, 0x16($s0)
/* 5E090 8005D490 00402021 */  addu       $a0, $v0, $zero
/* 5E094 8005D494 27A70018 */  addiu      $a3, $sp, 0x18
/* 5E098 8005D498 00E02821 */  addu       $a1, $a3, $zero
/* 5E09C 8005D49C 24060019 */  addiu      $a2, $zero, 0x19
/* 5E0A0 8005D4A0 240800C8 */  addiu      $t0, $zero, 0xc8
/* 5E0A4 8005D4A4 2402012C */  addiu      $v0, $zero, 0x12c
/* 5E0A8 8005D4A8 240300E6 */  addiu      $v1, $zero, 0xe6
/* 5E0AC 8005D4AC A7A00018 */  sh         $zero, 0x18($sp)
/* 5E0B0 8005D4B0 A4E20004 */  sh         $v0, 4($a3)
/* 5E0B4 8005D4B4 240200E1 */  addiu      $v0, $zero, 0xe1
/* 5E0B8 8005D4B8 A4E80002 */  sh         $t0, 2($a3)
/* 5E0BC 8005D4BC A4E30006 */  sh         $v1, 6($a3)
/* 5E0C0 8005D4C0 A3A20058 */  sb         $v0, 0x58($sp)
/* 5E0C4 8005D4C4 A3A20059 */  sb         $v0, 0x59($sp)
/* 5E0C8 8005D4C8 A3A2005A */  sb         $v0, 0x5a($sp)
/* 5E0CC 8005D4CC 27A20058 */  addiu      $v0, $sp, 0x58
/* 5E0D0 8005D4D0 24030001 */  addiu      $v1, $zero, 1
/* 5E0D4 8005D4D4 24070005 */  addiu      $a3, $zero, 5
/* 5E0D8 8005D4D8 A3A8005B */  sb         $t0, 0x5b($sp)
/* 5E0DC 8005D4DC AFA20010 */  sw         $v0, 0x10($sp)
/* 5E0E0 8005D4E0 0C01799C */  jal        cinematictext_widget
/* 5E0E4 8005D4E4 AFA30014 */   sw        $v1, 0x14($sp)
/* 5E0E8 8005D4E8 0C017683 */  jal        cinematictext_func
/* 5E0EC 8005D4EC AE020004 */   sw        $v0, 4($s0)
.L8005D4F0:
/* 5E0F0 8005D4F0 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 5E0F4 8005D4F4 8FB1009C */  lw         $s1, 0x9c($sp)
/* 5E0F8 8005D4F8 8FB00098 */  lw         $s0, 0x98($sp)
/* 5E0FC 8005D4FC 03E00008 */  jr         $ra
/* 5E100 8005D500 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel Cinematictext_free
/* 5E104 8005D504 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5E108 8005D508 AFB00010 */  sw         $s0, 0x10($sp)
/* 5E10C 8005D50C 3C10800F */  lui        $s0, %hi(cinematictect_pointer)
/* 5E110 8005D510 8E02F530 */  lw         $v0, %lo(cinematictect_pointer)($s0)
/* 5E114 8005D514 10400012 */  beqz       $v0, .L8005D560
/* 5E118 8005D518 AFBF0014 */   sw        $ra, 0x14($sp)
/* 5E11C 8005D51C 0C0176AD */  jal        free_cinematictext_pointer_0x8
/* 5E120 8005D520 00000000 */   nop
/* 5E124 8005D524 8E02F530 */  lw         $v0, -0xad0($s0)
/* 5E128 8005D528 8C460004 */  lw         $a2, 4($v0)
/* 5E12C 8005D52C 10C00006 */  beqz       $a2, .L8005D548
/* 5E130 8005D530 24050003 */   addiu     $a1, $zero, 3
/* 5E134 8005D534 8CC20078 */  lw         $v0, 0x78($a2)
/* 5E138 8005D538 84440008 */  lh         $a0, 8($v0)
/* 5E13C 8005D53C 8C43000C */  lw         $v1, 0xc($v0)
/* 5E140 8005D540 0060F809 */  jalr       $v1
/* 5E144 8005D544 00C42021 */   addu      $a0, $a2, $a0
.L8005D548:
/* 5E148 8005D548 3C05800E */  lui        $a1, %hi(D_800DF0E0)
/* 5E14C 8005D54C 24A5F0E0 */  addiu      $a1, $a1, %lo(D_800DF0E0)
/* 5E150 8005D550 8E04F530 */  lw         $a0, -0xad0($s0)
/* 5E154 8005D554 0C02600C */  jal        Free
/* 5E158 8005D558 24060071 */   addiu     $a2, $zero, 0x71
/* 5E15C 8005D55C AE00F530 */  sw         $zero, -0xad0($s0)
.L8005D560:
/* 5E160 8005D560 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5E164 8005D564 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E168 8005D568 03E00008 */  jr         $ra
/* 5E16C 8005D56C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_caption_timer
/* 5E170 8005D570 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5E174 8005D574 00803821 */  addu       $a3, $a0, $zero
/* 5E178 8005D578 AFB10014 */  sw         $s1, 0x14($sp)
/* 5E17C 8005D57C 00A08821 */  addu       $s1, $a1, $zero
/* 5E180 8005D580 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5E184 8005D584 10E0000E */  beqz       $a3, .L8005D5C0
/* 5E188 8005D588 AFB00010 */   sw        $s0, 0x10($sp)
/* 5E18C 8005D58C 1220000C */  beqz       $s1, .L8005D5C0
/* 5E190 8005D590 3C10800F */   lui       $s0, %hi(cinematictect_pointer)
/* 5E194 8005D594 8E02F530 */  lw         $v0, %lo(cinematictect_pointer)($s0)
/* 5E198 8005D598 10400009 */  beqz       $v0, .L8005D5C0
/* 5E19C 8005D59C 00E02821 */   addu      $a1, $a3, $zero
/* 5E1A0 8005D5A0 8C420004 */  lw         $v0, 4($v0)
/* 5E1A4 8005D5A4 8C430078 */  lw         $v1, 0x78($v0)
/* 5E1A8 8005D5A8 846400C8 */  lh         $a0, 0xc8($v1)
/* 5E1AC 8005D5AC 8C6600CC */  lw         $a2, 0xcc($v1)
/* 5E1B0 8005D5B0 00C0F809 */  jalr       $a2
/* 5E1B4 8005D5B4 00442021 */   addu      $a0, $v0, $a0
/* 5E1B8 8005D5B8 8E02F530 */  lw         $v0, -0xad0($s0)
/* 5E1BC 8005D5BC AC510000 */  sw         $s1, ($v0)
.L8005D5C0:
/* 5E1C0 8005D5C0 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5E1C4 8005D5C4 8FB10014 */  lw         $s1, 0x14($sp)
/* 5E1C8 8005D5C8 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E1CC 8005D5CC 03E00008 */  jr         $ra
/* 5E1D0 8005D5D0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel dec_caption_timer
/* 5E1D4 8005D5D4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 5E1D8 8005D5D8 AFB20020 */  sw         $s2, 0x20($sp)
/* 5E1DC 8005D5DC 3C12800F */  lui        $s2, %hi(cinematictect_pointer)
/* 5E1E0 8005D5E0 8E42F530 */  lw         $v0, %lo(cinematictect_pointer)($s2)
/* 5E1E4 8005D5E4 AFB5002C */  sw         $s5, 0x2c($sp)
/* 5E1E8 8005D5E8 0080A821 */  addu       $s5, $a0, $zero
/* 5E1EC 8005D5EC AFB40028 */  sw         $s4, 0x28($sp)
/* 5E1F0 8005D5F0 00A0A021 */  addu       $s4, $a1, $zero
/* 5E1F4 8005D5F4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 5E1F8 8005D5F8 AFB30024 */  sw         $s3, 0x24($sp)
/* 5E1FC 8005D5FC AFB1001C */  sw         $s1, 0x1c($sp)
/* 5E200 8005D600 10400031 */  beqz       $v0, .L8005D6C8
/* 5E204 8005D604 AFB00018 */   sw        $s0, 0x18($sp)
/* 5E208 8005D608 8C450004 */  lw         $a1, 4($v0)
/* 5E20C 8005D60C 8CA30078 */  lw         $v1, 0x78($a1)
/* 5E210 8005D610 84640028 */  lh         $a0, 0x28($v1)
/* 5E214 8005D614 8C62002C */  lw         $v0, 0x2c($v1)
/* 5E218 8005D618 0040F809 */  jalr       $v0
/* 5E21C 8005D61C 00A42021 */   addu      $a0, $a1, $a0
/* 5E220 8005D620 8E43F530 */  lw         $v1, -0xad0($s2)
/* 5E224 8005D624 8C620000 */  lw         $v0, ($v1)
/* 5E228 8005D628 00549823 */  subu       $s3, $v0, $s4
/* 5E22C 8005D62C 06610003 */  bgez       $s3, .L8005D63C
/* 5E230 8005D630 8EB10000 */   lw        $s1, ($s5)
/* 5E234 8005D634 080175AF */  j          .L8005D6BC
/* 5E238 8005D638 AC600000 */   sw        $zero, ($v1)
.L8005D63C:
/* 5E23C 8005D63C 0C0025B4 */  jal        get_hres
/* 5E240 8005D640 00000000 */   nop
/* 5E244 8005D644 0C0025B7 */  jal        get_vres
/* 5E248 8005D648 00408021 */   addu      $s0, $v0, $zero
/* 5E24C 8005D64C 02202021 */  addu       $a0, $s1, $zero
/* 5E250 8005D650 24050006 */  addiu      $a1, $zero, 6
/* 5E254 8005D654 02003021 */  addu       $a2, $s0, $zero
/* 5E258 8005D658 0C0290ED */  jal        rsp_func
/* 5E25C 8005D65C 00403821 */   addu      $a3, $v0, $zero
/* 5E260 8005D660 00402821 */  addu       $a1, $v0, $zero
/* 5E264 8005D664 00003021 */  addu       $a2, $zero, $zero
/* 5E268 8005D668 00003821 */  addu       $a3, $zero, $zero
/* 5E26C 8005D66C 8E42F530 */  lw         $v0, -0xad0($s2)
/* 5E270 8005D670 240300F0 */  addiu      $v1, $zero, 0xf0
/* 5E274 8005D674 8C490004 */  lw         $t1, 4($v0)
/* 5E278 8005D678 3C01800E */  lui        $at, %hi(D_800DF0F8)
/* 5E27C 8005D67C C420F0F8 */  lwc1       $f0, %lo(D_800DF0F8)($at)
/* 5E280 8005D680 8D280078 */  lw         $t0, 0x78($t1)
/* 5E284 8005D684 3C02800F */  lui        $v0, %hi(D_800F36F8)
/* 5E288 8005D688 E44036F8 */  swc1       $f0, %lo(D_800F36F8)($v0)
/* 5E28C 8005D68C 85040040 */  lh         $a0, 0x40($t0)
/* 5E290 8005D690 24020140 */  addiu      $v0, $zero, 0x140
/* 5E294 8005D694 AFA20010 */  sw         $v0, 0x10($sp)
/* 5E298 8005D698 AFA30014 */  sw         $v1, 0x14($sp)
/* 5E29C 8005D69C 8D020044 */  lw         $v0, 0x44($t0)
/* 5E2A0 8005D6A0 0040F809 */  jalr       $v0
/* 5E2A4 8005D6A4 01242021 */   addu      $a0, $t1, $a0
/* 5E2A8 8005D6A8 8E44F530 */  lw         $a0, -0xad0($s2)
/* 5E2AC 8005D6AC 8C830000 */  lw         $v1, ($a0)
/* 5E2B0 8005D6B0 00408821 */  addu       $s1, $v0, $zero
/* 5E2B4 8005D6B4 00741823 */  subu       $v1, $v1, $s4
/* 5E2B8 8005D6B8 AC830000 */  sw         $v1, ($a0)
.L8005D6BC:
/* 5E2BC 8005D6BC 0C0175C1 */  jal        NOOP_8005d704
/* 5E2C0 8005D6C0 02602021 */   addu      $a0, $s3, $zero
/* 5E2C4 8005D6C4 AEB10000 */  sw         $s1, ($s5)
.L8005D6C8:
/* 5E2C8 8005D6C8 8FBF0030 */  lw         $ra, 0x30($sp)
/* 5E2CC 8005D6CC 8FB5002C */  lw         $s5, 0x2c($sp)
/* 5E2D0 8005D6D0 8FB40028 */  lw         $s4, 0x28($sp)
/* 5E2D4 8005D6D4 8FB30024 */  lw         $s3, 0x24($sp)
/* 5E2D8 8005D6D8 8FB20020 */  lw         $s2, 0x20($sp)
/* 5E2DC 8005D6DC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5E2E0 8005D6E0 8FB00018 */  lw         $s0, 0x18($sp)
/* 5E2E4 8005D6E4 03E00008 */  jr         $ra
/* 5E2E8 8005D6E8 27BD0038 */   addiu     $sp, $sp, 0x38

glabel ofunc_clearCaptionTimer
/* 5E2EC 8005D6EC 3C02800F */  lui        $v0, %hi(cinematictect_pointer)
/* 5E2F0 8005D6F0 8C42F530 */  lw         $v0, %lo(cinematictect_pointer)($v0)
/* 5E2F4 8005D6F4 54400001 */  bnel       $v0, $zero, .L8005D6FC
/* 5E2F8 8005D6F8 AC400000 */   sw        $zero, ($v0)
.L8005D6FC:
/* 5E2FC 8005D6FC 03E00008 */  jr         $ra
/* 5E300 8005D700 00000000 */   nop

glabel NOOP_8005d704
/* 5E304 8005D704 03E00008 */  jr         $ra
/* 5E308 8005D708 00000000 */   nop

glabel func_8005D70C
/* 5E30C 8005D70C 90A30000 */  lbu        $v1, ($a1)
/* 5E310 8005D710 10600009 */  beqz       $v1, .L8005D738
/* 5E314 8005D714 00000000 */   nop
.L8005D718:
/* 5E318 8005D718 90820000 */  lbu        $v0, ($a0)
/* 5E31C 8005D71C 10620003 */  beq        $v1, $v0, .L8005D72C
/* 5E320 8005D720 24A50001 */   addiu     $a1, $a1, 1
/* 5E324 8005D724 03E00008 */  jr         $ra
/* 5E328 8005D728 00001021 */   addu      $v0, $zero, $zero
.L8005D72C:
/* 5E32C 8005D72C 90A30000 */  lbu        $v1, ($a1)
/* 5E330 8005D730 1460FFF9 */  bnez       $v1, .L8005D718
/* 5E334 8005D734 24840001 */   addiu     $a0, $a0, 1
.L8005D738:
/* 5E338 8005D738 03E00008 */  jr         $ra
/* 5E33C 8005D73C 24020001 */   addiu     $v0, $zero, 1

glabel alaron_name_func
/* 5E340 8005D740 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 5E344 8005D744 AFB10014 */  sw         $s1, 0x14($sp)
/* 5E348 8005D748 00808821 */  addu       $s1, $a0, $zero
/* 5E34C 8005D74C AFB00010 */  sw         $s0, 0x10($sp)
/* 5E350 8005D750 00A08021 */  addu       $s0, $a1, $zero
/* 5E354 8005D754 AFB40020 */  sw         $s4, 0x20($sp)
/* 5E358 8005D758 00E0A021 */  addu       $s4, $a3, $zero
/* 5E35C 8005D75C 02802021 */  addu       $a0, $s4, $zero
/* 5E360 8005D760 AFB20018 */  sw         $s2, 0x18($sp)
/* 5E364 8005D764 00C09021 */  addu       $s2, $a2, $zero
/* 5E368 8005D768 AFBF0028 */  sw         $ra, 0x28($sp)
/* 5E36C 8005D76C AFB50024 */  sw         $s5, 0x24($sp)
/* 5E370 8005D770 0C03353E */  jal        strlen
/* 5E374 8005D774 AFB3001C */   sw        $s3, 0x1c($sp)
/* 5E378 8005D778 02402021 */  addu       $a0, $s2, $zero
/* 5E37C 8005D77C 0C03353E */  jal        strlen
/* 5E380 8005D780 305500FF */   andi      $s5, $v0, 0xff
/* 5E384 8005D784 92030000 */  lbu        $v1, ($s0)
/* 5E388 8005D788 10600012 */  beqz       $v1, .L8005D7D4
/* 5E38C 8005D78C 305300FF */   andi      $s3, $v0, 0xff
/* 5E390 8005D790 02002021 */  addu       $a0, $s0, $zero
.L8005D794:
/* 5E394 8005D794 0C0175C3 */  jal        func_8005D70C
/* 5E398 8005D798 02802821 */   addu      $a1, $s4, $zero
/* 5E39C 8005D79C 14400006 */  bnez       $v0, .L8005D7B8
/* 5E3A0 8005D7A0 02202021 */   addu      $a0, $s1, $zero
/* 5E3A4 8005D7A4 92020000 */  lbu        $v0, ($s0)
/* 5E3A8 8005D7A8 26100001 */  addiu      $s0, $s0, 1
/* 5E3AC 8005D7AC A2220000 */  sb         $v0, ($s1)
/* 5E3B0 8005D7B0 080175F2 */  j          .L8005D7C8
/* 5E3B4 8005D7B4 26310001 */   addiu     $s1, $s1, 1
.L8005D7B8:
/* 5E3B8 8005D7B8 0C02626C */  jal        copy_string
/* 5E3BC 8005D7BC 02402821 */   addu      $a1, $s2, $zero
/* 5E3C0 8005D7C0 02338821 */  addu       $s1, $s1, $s3
/* 5E3C4 8005D7C4 02158021 */  addu       $s0, $s0, $s5
.L8005D7C8:
/* 5E3C8 8005D7C8 92020000 */  lbu        $v0, ($s0)
/* 5E3CC 8005D7CC 1440FFF1 */  bnez       $v0, .L8005D794
/* 5E3D0 8005D7D0 02002021 */   addu      $a0, $s0, $zero
.L8005D7D4:
/* 5E3D4 8005D7D4 8FBF0028 */  lw         $ra, 0x28($sp)
/* 5E3D8 8005D7D8 8FB50024 */  lw         $s5, 0x24($sp)
/* 5E3DC 8005D7DC 8FB40020 */  lw         $s4, 0x20($sp)
/* 5E3E0 8005D7E0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5E3E4 8005D7E4 8FB20018 */  lw         $s2, 0x18($sp)
/* 5E3E8 8005D7E8 A2200000 */  sb         $zero, ($s1)
/* 5E3EC 8005D7EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 5E3F0 8005D7F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E3F4 8005D7F4 03E00008 */  jr         $ra
/* 5E3F8 8005D7F8 27BD0030 */   addiu     $sp, $sp, 0x30

glabel cinematic_import_player_name
/* 5E3FC 8005D7FC 27BDFCE0 */  addiu      $sp, $sp, -0x320
/* 5E400 8005D800 AFB20318 */  sw         $s2, 0x318($sp)
/* 5E404 8005D804 3C12800F */  lui        $s2, %hi(cinematictect_pointer)
/* 5E408 8005D808 3C02800F */  lui        $v0, %hi(cinematic_runtime)
/* 5E40C 8005D80C 8E45F530 */  lw         $a1, %lo(cinematictect_pointer)($s2)
/* 5E410 8005D810 8C43F534 */  lw         $v1, %lo(cinematic_runtime)($v0)
/* 5E414 8005D814 AFBF031C */  sw         $ra, 0x31c($sp)
/* 5E418 8005D818 AFB10314 */  sw         $s1, 0x314($sp)
/* 5E41C 8005D81C AFB00310 */  sw         $s0, 0x310($sp)
/* 5E420 8005D820 94A40016 */  lhu        $a0, 0x16($a1)
/* 5E424 8005D824 0064182B */  sltu       $v1, $v1, $a0
/* 5E428 8005D828 14600020 */  bnez       $v1, .L8005D8AC
/* 5E42C 8005D82C 8FBF031C */   lw        $ra, 0x31c($sp)
/* 5E430 8005D830 27A40010 */  addiu      $a0, $sp, 0x10
/* 5E434 8005D834 0C02626C */  jal        copy_string
/* 5E438 8005D838 24A5001A */   addiu     $a1, $a1, 0x1a
/* 5E43C 8005D83C 27B00210 */  addiu      $s0, $sp, 0x210
/* 5E440 8005D840 8E45F530 */  lw         $a1, -0xad0($s2)
/* 5E444 8005D844 02002021 */  addu       $a0, $s0, $zero
/* 5E448 8005D848 0C02626C */  jal        copy_string
/* 5E44C 8005D84C 24A5011A */   addiu     $a1, $a1, 0x11a
/* 5E450 8005D850 27B10110 */  addiu      $s1, $sp, 0x110
/* 5E454 8005D854 02202021 */  addu       $a0, $s1, $zero
/* 5E458 8005D858 02003021 */  addu       $a2, $s0, $zero
/* 5E45C 8005D85C 3C07800E */  lui        $a3, %hi(D_800DF0FC)
/* 5E460 8005D860 8E45F530 */  lw         $a1, -0xad0($s2)
/* 5E464 8005D864 24E7F0FC */  addiu      $a3, $a3, %lo(D_800DF0FC)
/* 5E468 8005D868 0C0175D0 */  jal        alaron_name_func
/* 5E46C 8005D86C 24A5001A */   addiu     $a1, $a1, 0x1a
/* 5E470 8005D870 0C026422 */  jal        alaron_name_cleanup
/* 5E474 8005D874 02002021 */   addu      $a0, $s0, $zero
/* 5E478 8005D878 27A40010 */  addiu      $a0, $sp, 0x10
/* 5E47C 8005D87C 02202821 */  addu       $a1, $s1, $zero
/* 5E480 8005D880 02003021 */  addu       $a2, $s0, $zero
/* 5E484 8005D884 3C07800E */  lui        $a3, %hi(D_800DF104)
/* 5E488 8005D888 0C0175D0 */  jal        alaron_name_func
/* 5E48C 8005D88C 24E7F104 */   addiu     $a3, $a3, %lo(D_800DF104)
/* 5E490 8005D890 8E42F530 */  lw         $v0, -0xad0($s2)
/* 5E494 8005D894 94450018 */  lhu        $a1, 0x18($v0)
/* 5E498 8005D898 0C01755C */  jal        set_caption_timer
/* 5E49C 8005D89C 27A40010 */   addiu     $a0, $sp, 0x10
/* 5E4A0 8005D8A0 0C017638 */  jal        cinematic_text_2
/* 5E4A4 8005D8A4 00000000 */   nop
/* 5E4A8 8005D8A8 8FBF031C */  lw         $ra, 0x31c($sp)
.L8005D8AC:
/* 5E4AC 8005D8AC 8FB20318 */  lw         $s2, 0x318($sp)
/* 5E4B0 8005D8B0 8FB10314 */  lw         $s1, 0x314($sp)
/* 5E4B4 8005D8B4 8FB00310 */  lw         $s0, 0x310($sp)
/* 5E4B8 8005D8B8 03E00008 */  jr         $ra
/* 5E4BC 8005D8BC 27BD0320 */   addiu     $sp, $sp, 0x320

glabel Ofunc_clear_cinematic_runtime
/* 5E4C0 8005D8C0 3C02800F */  lui        $v0, %hi(cinematic_runtime)
/* 5E4C4 8005D8C4 03E00008 */  jr         $ra
/* 5E4C8 8005D8C8 AC40F534 */   sw        $zero, %lo(cinematic_runtime)($v0)

glabel inc_cinematic_runtime
/* 5E4CC 8005D8CC 3C03800F */  lui        $v1, %hi(cinematic_runtime)
/* 5E4D0 8005D8D0 8C62F534 */  lw         $v0, %lo(cinematic_runtime)($v1)
/* 5E4D4 8005D8D4 00451021 */  addu       $v0, $v0, $a1
/* 5E4D8 8005D8D8 03E00008 */  jr         $ra
/* 5E4DC 8005D8DC AC62F534 */   sw        $v0, -0xacc($v1)

glabel cinematic_text_2
/* 5E4E0 8005D8E0 27BDFBD0 */  addiu      $sp, $sp, -0x430
/* 5E4E4 8005D8E4 AFB20428 */  sw         $s2, 0x428($sp)
/* 5E4E8 8005D8E8 3C12800F */  lui        $s2, %hi(cinematictect_pointer)
/* 5E4EC 8005D8EC 8E45F530 */  lw         $a1, %lo(cinematictect_pointer)($s2)
/* 5E4F0 8005D8F0 AFBF042C */  sw         $ra, 0x42c($sp)
/* 5E4F4 8005D8F4 AFB10424 */  sw         $s1, 0x424($sp)
/* 5E4F8 8005D8F8 AFB00420 */  sw         $s0, 0x420($sp)
/* 5E4FC 8005D8FC 94A20014 */  lhu        $v0, 0x14($a1)
/* 5E500 8005D900 94A30012 */  lhu        $v1, 0x12($a1)
/* 5E504 8005D904 0043102B */  sltu       $v0, $v0, $v1
/* 5E508 8005D908 14400004 */  bnez       $v0, .L8005D91C
/* 5E50C 8005D90C 27A40018 */   addiu     $a0, $sp, 0x18
/* 5E510 8005D910 3402FFFF */  ori        $v0, $zero, 0xffff
/* 5E514 8005D914 0801767D */  j          .L8005D9F4
/* 5E518 8005D918 A4A20016 */   sh        $v0, 0x16($a1)
.L8005D91C:
/* 5E51C 8005D91C 8CA2000C */  lw         $v0, 0xc($a1)
/* 5E520 8005D920 24070001 */  addiu      $a3, $zero, 1
/* 5E524 8005D924 94460000 */  lhu        $a2, ($v0)
/* 5E528 8005D928 24420002 */  addiu      $v0, $v0, 2
/* 5E52C 8005D92C 24430002 */  addiu      $v1, $v0, 2
/* 5E530 8005D930 ACA3000C */  sw         $v1, 0xc($a1)
/* 5E534 8005D934 94500002 */  lhu        $s0, 2($v0)
/* 5E538 8005D938 24420004 */  addiu      $v0, $v0, 4
/* 5E53C 8005D93C ACA2000C */  sw         $v0, 0xc($a1)
/* 5E540 8005D940 3C02800E */  lui        $v0, %hi(D_800DF0E0)
/* 5E544 8005D944 2442F0E0 */  addiu      $v0, $v0, %lo(D_800DF0E0)
/* 5E548 8005D948 24030107 */  addiu      $v1, $zero, 0x107
/* 5E54C 8005D94C 3C05B200 */  lui        $a1, %hi(cinematic_text+0x60)
/* 5E550 8005D950 24A5B1A0 */  addiu      $a1, $a1, %lo(cinematic_text+0x60)
/* 5E554 8005D954 AFA00418 */  sw         $zero, 0x418($sp)
/* 5E558 8005D958 AFA20010 */  sw         $v0, 0x10($sp)
/* 5E55C 8005D95C AFA30014 */  sw         $v1, 0x14($sp)
/* 5E560 8005D960 00C52821 */  addu       $a1, $a2, $a1
/* 5E564 8005D964 26100001 */  addiu      $s0, $s0, 1
/* 5E568 8005D968 3210FFFE */  andi       $s0, $s0, 0xfffe
/* 5E56C 8005D96C 0C027269 */  jal        RomCopy
/* 5E570 8005D970 02003021 */   addu      $a2, $s0, $zero
/* 5E574 8005D974 27A40018 */  addiu      $a0, $sp, 0x18
/* 5E578 8005D978 02002821 */  addu       $a1, $s0, $zero
/* 5E57C 8005D97C 27A60218 */  addiu      $a2, $sp, 0x218
/* 5E580 8005D980 27B10418 */  addiu      $s1, $sp, 0x418
/* 5E584 8005D984 02203821 */  addu       $a3, $s1, $zero
/* 5E588 8005D988 0C02A73B */  jal        decompress_LZ01
/* 5E58C 8005D98C AFA00010 */   sw        $zero, 0x10($sp)
/* 5E590 8005D990 27A5021C */  addiu      $a1, $sp, 0x21c
/* 5E594 8005D994 8E44F530 */  lw         $a0, -0xad0($s2)
/* 5E598 8005D998 96300002 */  lhu        $s0, 2($s1)
/* 5E59C 8005D99C 2484001A */  addiu      $a0, $a0, 0x1a
/* 5E5A0 8005D9A0 2610FFFC */  addiu      $s0, $s0, -4
/* 5E5A4 8005D9A4 0C033547 */  jal        memcpy
/* 5E5A8 8005D9A8 02003021 */   addu      $a2, $s0, $zero
/* 5E5AC 8005D9AC 24050010 */  addiu      $a1, $zero, 0x10
/* 5E5B0 8005D9B0 24060103 */  addiu      $a2, $zero, 0x103
/* 5E5B4 8005D9B4 00108400 */  sll        $s0, $s0, 0x10
/* 5E5B8 8005D9B8 00103C03 */  sra        $a3, $s0, 0x10
/* 5E5BC 8005D9BC 8E44F530 */  lw         $a0, -0xad0($s2)
/* 5E5C0 8005D9C0 97B10218 */  lhu        $s1, 0x218($sp)
/* 5E5C4 8005D9C4 97B0021A */  lhu        $s0, 0x21a($sp)
/* 5E5C8 8005D9C8 0C035669 */  jal        decrypt_string
/* 5E5CC 8005D9CC 2484001A */   addiu     $a0, $a0, 0x1a
/* 5E5D0 8005D9D0 00111040 */  sll        $v0, $s1, 1
/* 5E5D4 8005D9D4 8E43F530 */  lw         $v1, -0xad0($s2)
/* 5E5D8 8005D9D8 02118023 */  subu       $s0, $s0, $s1
/* 5E5DC 8005D9DC A4620016 */  sh         $v0, 0x16($v1)
/* 5E5E0 8005D9E0 94620014 */  lhu        $v0, 0x14($v1)
/* 5E5E4 8005D9E4 00108040 */  sll        $s0, $s0, 1
/* 5E5E8 8005D9E8 A4700018 */  sh         $s0, 0x18($v1)
/* 5E5EC 8005D9EC 24420001 */  addiu      $v0, $v0, 1
/* 5E5F0 8005D9F0 A4620014 */  sh         $v0, 0x14($v1)
.L8005D9F4:
/* 5E5F4 8005D9F4 8FBF042C */  lw         $ra, 0x42c($sp)
/* 5E5F8 8005D9F8 8FB20428 */  lw         $s2, 0x428($sp)
/* 5E5FC 8005D9FC 8FB10424 */  lw         $s1, 0x424($sp)
/* 5E600 8005DA00 8FB00420 */  lw         $s0, 0x420($sp)
/* 5E604 8005DA04 03E00008 */  jr         $ra
/* 5E608 8005DA08 27BD0430 */   addiu     $sp, $sp, 0x430

glabel cinematictext_func
/* 5E60C 8005DA0C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5E610 8005DA10 AFB00018 */  sw         $s0, 0x18($sp)
/* 5E614 8005DA14 3C10B200 */  lui        $s0, %hi(romstring_controller)
/* 5E618 8005DA18 2610C0C0 */  addiu      $s0, $s0, %lo(romstring_controller)
/* 5E61C 8005DA1C AFB1001C */  sw         $s1, 0x1c($sp)
/* 5E620 8005DA20 3C11B200 */  lui        $s1, %hi(cinematic_text_dat)
/* 5E624 8005DA24 2631BEB0 */  addiu      $s1, $s1, %lo(cinematic_text_dat)
/* 5E628 8005DA28 02118023 */  subu       $s0, $s0, $s1
/* 5E62C 8005DA2C 02002021 */  addu       $a0, $s0, $zero
/* 5E630 8005DA30 AFB20020 */  sw         $s2, 0x20($sp)
/* 5E634 8005DA34 3C12800E */  lui        $s2, %hi(D_800DF0E0)
/* 5E638 8005DA38 2652F0E0 */  addiu      $s2, $s2, %lo(D_800DF0E0)
/* 5E63C 8005DA3C 02402821 */  addu       $a1, $s2, $zero
/* 5E640 8005DA40 AFBF0024 */  sw         $ra, 0x24($sp)
/* 5E644 8005DA44 0C025F9C */  jal        Malloc
/* 5E648 8005DA48 2406011D */   addiu     $a2, $zero, 0x11d
/* 5E64C 8005DA4C 02202821 */  addu       $a1, $s1, $zero
/* 5E650 8005DA50 3C11800F */  lui        $s1, %hi(cinematictect_pointer)
/* 5E654 8005DA54 8E23F530 */  lw         $v1, %lo(cinematictect_pointer)($s1)
/* 5E658 8005DA58 02003021 */  addu       $a2, $s0, $zero
/* 5E65C 8005DA5C AC620008 */  sw         $v0, 8($v1)
/* 5E660 8005DA60 AC62000C */  sw         $v0, 0xc($v1)
/* 5E664 8005DA64 2402011F */  addiu      $v0, $zero, 0x11f
/* 5E668 8005DA68 AFB20010 */  sw         $s2, 0x10($sp)
/* 5E66C 8005DA6C AFA20014 */  sw         $v0, 0x14($sp)
/* 5E670 8005DA70 8C64000C */  lw         $a0, 0xc($v1)
/* 5E674 8005DA74 0C027269 */  jal        RomCopy
/* 5E678 8005DA78 24070001 */   addiu     $a3, $zero, 1
/* 5E67C 8005DA7C 8E23F530 */  lw         $v1, -0xad0($s1)
/* 5E680 8005DA80 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5E684 8005DA84 8FB20020 */  lw         $s2, 0x20($sp)
/* 5E688 8005DA88 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5E68C 8005DA8C 8C62000C */  lw         $v0, 0xc($v1)
/* 5E690 8005DA90 8FB00018 */  lw         $s0, 0x18($sp)
/* 5E694 8005DA94 94440000 */  lhu        $a0, ($v0)
/* 5E698 8005DA98 24420002 */  addiu      $v0, $v0, 2
/* 5E69C 8005DA9C AC62000C */  sw         $v0, 0xc($v1)
/* 5E6A0 8005DAA0 A4600014 */  sh         $zero, 0x14($v1)
/* 5E6A4 8005DAA4 A4600012 */  sh         $zero, 0x12($v1)
/* 5E6A8 8005DAA8 A4640010 */  sh         $a0, 0x10($v1)
/* 5E6AC 8005DAAC 03E00008 */  jr         $ra
/* 5E6B0 8005DAB0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel free_cinematictext_pointer_0x8
/* 5E6B4 8005DAB4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5E6B8 8005DAB8 AFB00010 */  sw         $s0, 0x10($sp)
/* 5E6BC 8005DABC 3C10800F */  lui        $s0, %hi(cinematictect_pointer)
/* 5E6C0 8005DAC0 3C05800E */  lui        $a1, %hi(D_800DF0E0)
/* 5E6C4 8005DAC4 8E02F530 */  lw         $v0, %lo(cinematictect_pointer)($s0)
/* 5E6C8 8005DAC8 24A5F0E0 */  addiu      $a1, $a1, %lo(D_800DF0E0)
/* 5E6CC 8005DACC AFBF0014 */  sw         $ra, 0x14($sp)
/* 5E6D0 8005DAD0 8C440008 */  lw         $a0, 8($v0)
/* 5E6D4 8005DAD4 0C02600C */  jal        Free
/* 5E6D8 8005DAD8 24060129 */   addiu     $a2, $zero, 0x129
/* 5E6DC 8005DADC 8E02F530 */  lw         $v0, -0xad0($s0)
/* 5E6E0 8005DAE0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5E6E4 8005DAE4 8FB00010 */  lw         $s0, 0x10($sp)
/* 5E6E8 8005DAE8 AC400008 */  sw         $zero, 8($v0)
/* 5E6EC 8005DAEC 03E00008 */  jr         $ra
/* 5E6F0 8005DAF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel cinematic_seqs
/* 5E6F4 8005DAF4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5E6F8 8005DAF8 3402FFFF */  ori        $v0, $zero, 0xffff
/* 5E6FC 8005DAFC 1082002B */  beq        $a0, $v0, .L8005DBAC
/* 5E700 8005DB00 AFBF0010 */   sw        $ra, 0x10($sp)
/* 5E704 8005DB04 3C03800F */  lui        $v1, %hi(cinematictect_pointer)
/* 5E708 8005DB08 8C65F530 */  lw         $a1, %lo(cinematictect_pointer)($v1)
/* 5E70C 8005DB0C 94A20010 */  lhu        $v0, 0x10($a1)
/* 5E710 8005DB10 0044102B */  sltu       $v0, $v0, $a0
/* 5E714 8005DB14 14400025 */  bnez       $v0, .L8005DBAC
/* 5E718 8005DB18 00606021 */   addu      $t4, $v1, $zero
/* 5E71C 8005DB1C 8CA20008 */  lw         $v0, 8($a1)
/* 5E720 8005DB20 00001821 */  addu       $v1, $zero, $zero
/* 5E724 8005DB24 24420002 */  addiu      $v0, $v0, 2
/* 5E728 8005DB28 10800016 */  beqz       $a0, .L8005DB84
/* 5E72C 8005DB2C ACA2000C */   sw        $v0, 0xc($a1)
/* 5E730 8005DB30 00A05021 */  addu       $t2, $a1, $zero
/* 5E734 8005DB34 01405821 */  addu       $t3, $t2, $zero
/* 5E738 8005DB38 00003021 */  addu       $a2, $zero, $zero
.L8005DB3C:
/* 5E73C 8005DB3C 8D42000C */  lw         $v0, 0xc($t2)
/* 5E740 8005DB40 24690001 */  addiu      $t1, $v1, 1
/* 5E744 8005DB44 94480000 */  lhu        $t0, ($v0)
/* 5E748 8005DB48 24420002 */  addiu      $v0, $v0, 2
/* 5E74C 8005DB4C 11000009 */  beqz       $t0, .L8005DB74
/* 5E750 8005DB50 AD42000C */   sw        $v0, 0xc($t2)
/* 5E754 8005DB54 01603821 */  addu       $a3, $t3, $zero
/* 5E758 8005DB58 8CE5000C */  lw         $a1, 0xc($a3)
.L8005DB5C:
/* 5E75C 8005DB5C 24C20001 */  addiu      $v0, $a2, 1
/* 5E760 8005DB60 3046FFFF */  andi       $a2, $v0, 0xffff
/* 5E764 8005DB64 00C8182B */  sltu       $v1, $a2, $t0
/* 5E768 8005DB68 1460FFFC */  bnez       $v1, .L8005DB5C
/* 5E76C 8005DB6C 24A50006 */   addiu     $a1, $a1, 6
/* 5E770 8005DB70 ACE5000C */  sw         $a1, 0xc($a3)
.L8005DB74:
/* 5E774 8005DB74 01201821 */  addu       $v1, $t1, $zero
/* 5E778 8005DB78 0064102B */  sltu       $v0, $v1, $a0
/* 5E77C 8005DB7C 1440FFEF */  bnez       $v0, .L8005DB3C
/* 5E780 8005DB80 00003021 */   addu      $a2, $zero, $zero
.L8005DB84:
/* 5E784 8005DB84 8D83F530 */  lw         $v1, -0xad0($t4)
/* 5E788 8005DB88 8C62000C */  lw         $v0, 0xc($v1)
/* 5E78C 8005DB8C 94440000 */  lhu        $a0, ($v0)
/* 5E790 8005DB90 24420002 */  addiu      $v0, $v0, 2
/* 5E794 8005DB94 AC62000C */  sw         $v0, 0xc($v1)
/* 5E798 8005DB98 A4600014 */  sh         $zero, 0x14($v1)
/* 5E79C 8005DB9C 0C017638 */  jal        cinematic_text_2
/* 5E7A0 8005DBA0 A4640012 */   sh        $a0, 0x12($v1)
/* 5E7A4 8005DBA4 3C02800F */  lui        $v0, %hi(cinematic_runtime)
/* 5E7A8 8005DBA8 AC40F534 */  sw         $zero, %lo(cinematic_runtime)($v0)
.L8005DBAC:
/* 5E7AC 8005DBAC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5E7B0 8005DBB0 03E00008 */  jr         $ra
/* 5E7B4 8005DBB4 27BD0018 */   addiu     $sp, $sp, 0x18
/* 5E7B8 8005DBB8 00000000 */  nop
/* 5E7BC 8005DBBC 00000000 */  nop
