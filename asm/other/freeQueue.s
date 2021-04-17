.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel InitFreeQueueHead
/* D6D30 800D6130 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D6D34 800D6134 AFB10014 */  sw         $s1, 0x14($sp)
/* D6D38 800D6138 3C11800F */  lui        $s1, %hi(queueHeadFreeFlag)
/* D6D3C 800D613C 96225100 */  lhu        $v0, %lo(queueHeadFreeFlag)($s1)
/* D6D40 800D6140 AFB00010 */  sw         $s0, 0x10($sp)
/* D6D44 800D6144 00808021 */  addu       $s0, $a0, $zero
/* D6D48 800D6148 10400006 */  beqz       $v0, .L800D6164
/* D6D4C 800D614C AFBF0018 */   sw        $ra, 0x18($sp)
/* D6D50 800D6150 3C04800E */  lui        $a0, %hi(D_800E50A0)
/* D6D54 800D6154 248450A0 */  addiu      $a0, $a0, %lo(D_800E50A0)
/* D6D58 800D6158 3C05800E */  lui        $a1, %hi(D_800E50B4)
/* D6D5C 800D615C 0C025F2D */  jal        manualCrash
/* D6D60 800D6160 24A550B4 */   addiu     $a1, $a1, %lo(D_800E50B4)
.L800D6164:
/* D6D64 800D6164 02002021 */  addu       $a0, $s0, $zero
/* D6D68 800D6168 00002821 */  addu       $a1, $zero, $zero
/* D6D6C 800D616C 24020001 */  addiu      $v0, $zero, 1
/* D6D70 800D6170 24060800 */  addiu      $a2, $zero, 0x800
/* D6D74 800D6174 A6225100 */  sh         $v0, 0x5100($s1)
/* D6D78 800D6178 0C026380 */  jal        Calloc
/* D6D7C 800D617C A6000800 */   sh        $zero, 0x800($s0)
/* D6D80 800D6180 8FBF0018 */  lw         $ra, 0x18($sp)
/* D6D84 800D6184 8FB10014 */  lw         $s1, 0x14($sp)
/* D6D88 800D6188 8FB00010 */  lw         $s0, 0x10($sp)
/* D6D8C 800D618C 03E00008 */  jr         $ra
/* D6D90 800D6190 27BD0020 */   addiu     $sp, $sp, 0x20

glabel NOOP_800d6194
/* D6D94 800D6194 03E00008 */  jr         $ra
/* D6D98 800D6198 00000000 */   nop

glabel AllocFreeQueueItem
/* D6D9C 800D619C 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* D6DA0 800D61A0 AFB3009C */  sw         $s3, 0x9c($sp)
/* D6DA4 800D61A4 00A09821 */  addu       $s3, $a1, $zero
/* D6DA8 800D61A8 AFB10094 */  sw         $s1, 0x94($sp)
/* D6DAC 800D61AC 30D1FFFF */  andi       $s1, $a2, 0xffff
/* D6DB0 800D61B0 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* D6DB4 800D61B4 AFB20098 */  sw         $s2, 0x98($sp)
/* D6DB8 800D61B8 AFB00090 */  sw         $s0, 0x90($sp)
/* D6DBC 800D61BC 94820800 */  lhu        $v0, 0x800($a0)
/* D6DC0 800D61C0 30F2FFFF */  andi       $s2, $a3, 0xffff
/* D6DC4 800D61C4 24430001 */  addiu      $v1, $v0, 1
/* D6DC8 800D61C8 3042FFFF */  andi       $v0, $v0, 0xffff
/* D6DCC 800D61CC 000210C0 */  sll        $v0, $v0, 3
/* D6DD0 800D61D0 A4830800 */  sh         $v1, 0x800($a0)
/* D6DD4 800D61D4 3063FFFF */  andi       $v1, $v1, 0xffff
/* D6DD8 800D61D8 2C630100 */  sltiu      $v1, $v1, 0x100
/* D6DDC 800D61DC 14600006 */  bnez       $v1, .L800D61F8
/* D6DE0 800D61E0 00828021 */   addu      $s0, $a0, $v0
/* D6DE4 800D61E4 3C04800E */  lui        $a0, %hi(D_800E50CC)
/* D6DE8 800D61E8 248450CC */  addiu      $a0, $a0, %lo(D_800E50CC)
/* D6DEC 800D61EC 3C05800E */  lui        $a1, %hi(D_800E50E0)
/* D6DF0 800D61F0 0C025F2D */  jal        manualCrash
/* D6DF4 800D61F4 24A550E0 */   addiu     $a1, $a1, %lo(D_800E50E0)
.L800D61F8:
/* D6DF8 800D61F8 2E220009 */  sltiu      $v0, $s1, 9
/* D6DFC 800D61FC 5440000B */  bnel       $v0, $zero, .L800D622C
/* D6E00 800D6200 8E620000 */   lw        $v0, ($s3)
/* D6E04 800D6204 27A40010 */  addiu      $a0, $sp, 0x10
/* D6E08 800D6208 3C05800E */  lui        $a1, %hi(D_800E5110)
/* D6E0C 800D620C 24A55110 */  addiu      $a1, $a1, %lo(D_800E5110)
/* D6E10 800D6210 0C0333AC */  jal        sprintf
/* D6E14 800D6214 02203021 */   addu      $a2, $s1, $zero
/* D6E18 800D6218 3C04800E */  lui        $a0, %hi(D_800E50CC)
/* D6E1C 800D621C 248450CC */  addiu      $a0, $a0, %lo(D_800E50CC)
/* D6E20 800D6220 0C025F2D */  jal        manualCrash
/* D6E24 800D6224 27A50010 */   addiu     $a1, $sp, 0x10
/* D6E28 800D6228 8E620000 */  lw         $v0, ($s3)
.L800D622C:
/* D6E2C 800D622C 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* D6E30 800D6230 A6120006 */  sh         $s2, 6($s0)
/* D6E34 800D6234 8FB20098 */  lw         $s2, 0x98($sp)
/* D6E38 800D6238 A6110004 */  sh         $s1, 4($s0)
/* D6E3C 800D623C 8FB10094 */  lw         $s1, 0x94($sp)
/* D6E40 800D6240 AE020000 */  sw         $v0, ($s0)
/* D6E44 800D6244 AE600000 */  sw         $zero, ($s3)
/* D6E48 800D6248 8FB3009C */  lw         $s3, 0x9c($sp)
/* D6E4C 800D624C 8FB00090 */  lw         $s0, 0x90($sp)
/* D6E50 800D6250 03E00008 */  jr         $ra
/* D6E54 800D6254 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel processQueueFree
/* D6E58 800D6258 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* D6E5C 800D625C AFB10094 */  sw         $s1, 0x94($sp)
/* D6E60 800D6260 00808821 */  addu       $s1, $a0, $zero
/* D6E64 800D6264 AFBF009C */  sw         $ra, 0x9c($sp)
/* D6E68 800D6268 AFB20098 */  sw         $s2, 0x98($sp)
/* D6E6C 800D626C AFB00090 */  sw         $s0, 0x90($sp)
/* D6E70 800D6270 96220800 */  lhu        $v0, 0x800($s1)
/* D6E74 800D6274 10400057 */  beqz       $v0, .L800D63D4
/* D6E78 800D6278 00009021 */   addu      $s2, $zero, $zero
/* D6E7C 800D627C 10400054 */  beqz       $v0, .L800D63D0
/* D6E80 800D6280 00008021 */   addu      $s0, $zero, $zero
/* D6E84 800D6284 001010C0 */  sll        $v0, $s0, 3
.L800D6288:
/* D6E88 800D6288 02222821 */  addu       $a1, $s1, $v0
/* D6E8C 800D628C 94A20006 */  lhu        $v0, 6($a1)
/* D6E90 800D6290 1040000A */  beqz       $v0, .L800D62BC
/* D6E94 800D6294 2442FFFF */   addiu     $v0, $v0, -1
/* D6E98 800D6298 001218C0 */  sll        $v1, $s2, 3
/* D6E9C 800D629C A4A20006 */  sh         $v0, 6($a1)
/* D6EA0 800D62A0 8CA20000 */  lw         $v0, ($a1)
/* D6EA4 800D62A4 00711821 */  addu       $v1, $v1, $s1
/* D6EA8 800D62A8 AC620000 */  sw         $v0, ($v1)
/* D6EAC 800D62AC 8CA40004 */  lw         $a0, 4($a1)
/* D6EB0 800D62B0 26520001 */  addiu      $s2, $s2, 1
/* D6EB4 800D62B4 080358EE */  j          .L800D63B8
/* D6EB8 800D62B8 AC640004 */   sw        $a0, 4($v1)
.L800D62BC:
/* D6EBC 800D62BC 94A60004 */  lhu        $a2, 4($a1)
/* D6EC0 800D62C0 2CC20009 */  sltiu      $v0, $a2, 9
/* D6EC4 800D62C4 10400007 */  beqz       $v0, .L800D62E4
/* D6EC8 800D62C8 3C02800E */   lui       $v0, %hi(D_800E5168)
/* D6ECC 800D62CC 24425168 */  addiu      $v0, $v0, %lo(D_800E5168)
/* D6ED0 800D62D0 00061880 */  sll        $v1, $a2, 2
/* D6ED4 800D62D4 00621821 */  addu       $v1, $v1, $v0
/* D6ED8 800D62D8 8C640000 */  lw         $a0, ($v1)
/* D6EDC 800D62DC 00800008 */  jr         $a0
/* D6EE0 800D62E0 00000000 */   nop
.L800D62E4:
/* D6EE4 800D62E4 27A40010 */  addiu      $a0, $sp, 0x10
/* D6EE8 800D62E8 3C05800E */  lui        $a1, %hi(D_800E5124)
/* D6EEC 800D62EC 0C0333AC */  jal        sprintf
/* D6EF0 800D62F0 24A55124 */   addiu     $a1, $a1, %lo(D_800E5124)
/* D6EF4 800D62F4 3C04800E */  lui        $a0, %hi(D_800E513C)
/* D6EF8 800D62F8 2484513C */  addiu      $a0, $a0, %lo(D_800E513C)
/* D6EFC 800D62FC 0C025F2D */  jal        manualCrash
/* D6F00 800D6300 27A50010 */   addiu     $a1, $sp, 0x10
/* D6F04 800D6304 080358EF */  j          .L800D63BC
/* D6F08 800D6308 26030001 */   addiu     $v1, $s0, 1
/* D6F0C 800D630C 0C027F2A */  jal        func_8009FCA8
/* D6F10 800D6310 8CA40000 */   lw        $a0, ($a1)
/* D6F14 800D6314 080358EF */  j          .L800D63BC
/* D6F18 800D6318 26030001 */   addiu     $v1, $s0, 1
/* D6F1C 800D631C 0C027EEC */  jal        borganim_free
/* D6F20 800D6320 8CA40000 */   lw        $a0, ($a1)
/* D6F24 800D6324 080358EF */  j          .L800D63BC
/* D6F28 800D6328 26030001 */   addiu     $v1, $s0, 1
/* D6F2C 800D632C 0C027F06 */  jal        passto_borg_6_free
/* D6F30 800D6330 8CA40000 */   lw        $a0, ($a1)
/* D6F34 800D6334 080358EF */  j          .L800D63BC
/* D6F38 800D6338 26030001 */   addiu     $v1, $s0, 1
/* D6F3C 800D633C 0C028C37 */  jal        borg1_free
/* D6F40 800D6340 8CA40000 */   lw        $a0, ($a1)
/* D6F44 800D6344 080358EF */  j          .L800D63BC
/* D6F48 800D6348 26030001 */   addiu     $v1, $s0, 1
/* D6F4C 800D634C 0C0299C0 */  jal        borg8_free
/* D6F50 800D6350 8CA40000 */   lw        $a0, ($a1)
/* D6F54 800D6354 080358EF */  j          .L800D63BC
/* D6F58 800D6358 26030001 */   addiu     $v1, $s0, 1
/* D6F5C 800D635C 0C029CF5 */  jal        passto_borg13_free
/* D6F60 800D6360 8CA40000 */   lw        $a0, ($a1)
/* D6F64 800D6364 080358EF */  j          .L800D63BC
/* D6F68 800D6368 26030001 */   addiu     $v1, $s0, 1
/* D6F6C 800D636C 8CA60000 */  lw         $a2, ($a1)
/* D6F70 800D6370 10C00011 */  beqz       $a2, .L800D63B8
/* D6F74 800D6374 24050003 */   addiu     $a1, $zero, 3
/* D6F78 800D6378 8CC20078 */  lw         $v0, 0x78($a2)
/* D6F7C 800D637C 84440008 */  lh         $a0, 8($v0)
/* D6F80 800D6380 8C43000C */  lw         $v1, 0xc($v0)
/* D6F84 800D6384 0060F809 */  jalr       $v1
/* D6F88 800D6388 00C42021 */   addu      $a0, $a2, $a0
/* D6F8C 800D638C 080358EF */  j          .L800D63BC
/* D6F90 800D6390 26030001 */   addiu     $v1, $s0, 1
/* D6F94 800D6394 8CA40000 */  lw         $a0, ($a1)
/* D6F98 800D6398 3C05800E */  lui        $a1, %hi(D_800E5150)
/* D6F9C 800D639C 24A55150 */  addiu      $a1, $a1, %lo(D_800E5150)
/* D6FA0 800D63A0 0C02600C */  jal        Free
/* D6FA4 800D63A4 240600AA */   addiu     $a2, $zero, 0xaa
/* D6FA8 800D63A8 080358EF */  j          .L800D63BC
/* D6FAC 800D63AC 26030001 */   addiu     $v1, $s0, 1
/* D6FB0 800D63B0 0C029C07 */  jal        free_borg_12
/* D6FB4 800D63B4 8CA40000 */   lw        $a0, ($a1)
.L800D63B8:
/* D6FB8 800D63B8 26030001 */  addiu      $v1, $s0, 1
.L800D63BC:
/* D6FBC 800D63BC 96220800 */  lhu        $v0, 0x800($s1)
/* D6FC0 800D63C0 3070FFFF */  andi       $s0, $v1, 0xffff
/* D6FC4 800D63C4 0202102B */  sltu       $v0, $s0, $v0
/* D6FC8 800D63C8 1440FFAF */  bnez       $v0, .L800D6288
/* D6FCC 800D63CC 001010C0 */   sll       $v0, $s0, 3
.L800D63D0:
/* D6FD0 800D63D0 A6320800 */  sh         $s2, 0x800($s1)
.L800D63D4:
/* D6FD4 800D63D4 8FBF009C */  lw         $ra, 0x9c($sp)
/* D6FD8 800D63D8 8FB20098 */  lw         $s2, 0x98($sp)
/* D6FDC 800D63DC 8FB10094 */  lw         $s1, 0x94($sp)
/* D6FE0 800D63E0 8FB00090 */  lw         $s0, 0x90($sp)
/* D6FE4 800D63E4 03E00008 */  jr         $ra
/* D6FE8 800D63E8 27BD00A0 */   addiu     $sp, $sp, 0xa0
/* D6FEC 800D63EC 00000000 */  nop
