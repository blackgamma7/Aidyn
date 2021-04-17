.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel gauge_trap_danger
/* 5FDC0 8005F1C0 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 5FDC4 8005F1C4 00801821 */  addu       $v1, $a0, $zero
/* 5FDC8 8005F1C8 3C02800F */  lui        $v0, 0x800f
/* 5FDCC 8005F1CC AFBF0078 */  sw         $ra, 0x78($sp)
/* 5FDD0 8005F1D0 AFB30074 */  sw         $s3, 0x74($sp)
/* 5FDD4 8005F1D4 AFB20070 */  sw         $s2, 0x70($sp)
/* 5FDD8 8005F1D8 AFB1006C */  sw         $s1, 0x6c($sp)
/* 5FDDC 8005F1DC AFB00068 */  sw         $s0, 0x68($sp)
/* 5FDE0 8005F1E0 0C017E0D */  jal        trapmenu_func
/* 5FDE4 8005F1E4 AC43F5D0 */   sw        $v1, -0xa30($v0)
/* 5FDE8 8005F1E8 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5FDEC 8005F1EC 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 5FDF0 8005F1F0 94470002 */  lhu        $a3, 2($v0)
/* 5FDF4 8005F1F4 8C66204C */  lw         $a2, 0x204c($v1)
/* 5FDF8 8005F1F8 2CE20003 */  sltiu      $v0, $a3, 3
/* 5FDFC 8005F1FC 10400003 */  beqz       $v0, .L8005F20C
/* 5FE00 8005F200 8CC506C4 */   lw        $a1, 0x6c4($a2)
/* 5FE04 8005F204 08017C87 */  j          .L8005F21C
/* 5FE08 8005F208 8CC606B8 */   lw        $a2, 0x6b8($a2)
.L8005F20C:
/* 5FE0C 8005F20C 2CE20006 */  sltiu      $v0, $a3, 6
/* 5FE10 8005F210 50400006 */  beql       $v0, $zero, .L8005F22C
/* 5FE14 8005F214 8CC606C0 */   lw        $a2, 0x6c0($a2)
/* 5FE18 8005F218 8CC606BC */  lw         $a2, 0x6bc($a2)
.L8005F21C:
/* 5FE1C 8005F21C 0C0333AC */  jal        sprintf
/* 5FE20 8005F220 24642078 */   addiu     $a0, $v1, 0x2078
/* 5FE24 8005F224 08017C8E */  j          .L8005F238
/* 5FE28 8005F228 240400B0 */   addiu     $a0, $zero, 0xb0
.L8005F22C:
/* 5FE2C 8005F22C 0C0333AC */  jal        sprintf
/* 5FE30 8005F230 24642078 */   addiu     $a0, $v1, 0x2078
/* 5FE34 8005F234 240400B0 */  addiu      $a0, $zero, 0xb0
.L8005F238:
/* 5FE38 8005F238 240300E1 */  addiu      $v1, $zero, 0xe1
/* 5FE3C 8005F23C 27B00028 */  addiu      $s0, $sp, 0x28
/* 5FE40 8005F240 240200FF */  addiu      $v0, $zero, 0xff
/* 5FE44 8005F244 A3A30028 */  sb         $v1, 0x28($sp)
/* 5FE48 8005F248 A2020001 */  sb         $v0, 1($s0)
/* 5FE4C 8005F24C A2030002 */  sb         $v1, 2($s0)
/* 5FE50 8005F250 0C026259 */  jal        passToMalloc
/* 5FE54 8005F254 A2020003 */   sb        $v0, 3($s0)
/* 5FE58 8005F258 00402021 */  addu       $a0, $v0, $zero
/* 5FE5C 8005F25C 24050002 */  addiu      $a1, $zero, 2
/* 5FE60 8005F260 3C11800F */  lui        $s1, %hi(gGlobalsText)
/* 5FE64 8005F264 26318920 */  addiu      $s1, $s1, %lo(gGlobalsText)
/* 5FE68 8005F268 02203021 */  addu       $a2, $s1, $zero
/* 5FE6C 8005F26C 24020001 */  addiu      $v0, $zero, 1
/* 5FE70 8005F270 2403000A */  addiu      $v1, $zero, 0xa
/* 5FE74 8005F274 240700B4 */  addiu      $a3, $zero, 0xb4
/* 5FE78 8005F278 AFB00010 */  sw         $s0, 0x10($sp)
/* 5FE7C 8005F27C AFB00014 */  sw         $s0, 0x14($sp)
/* 5FE80 8005F280 AFA20018 */  sw         $v0, 0x18($sp)
/* 5FE84 8005F284 AFA3001C */  sw         $v1, 0x1c($sp)
/* 5FE88 8005F288 0C013461 */  jal        func_8004D184
/* 5FE8C 8005F28C AFA00020 */   sw        $zero, 0x20($sp)
/* 5FE90 8005F290 2404007C */  addiu      $a0, $zero, 0x7c
/* 5FE94 8005F294 2631DF88 */  addiu      $s1, $s1, -0x2078
/* 5FE98 8005F298 8E23204C */  lw         $v1, 0x204c($s1)
/* 5FE9C 8005F29C 00409821 */  addu       $s3, $v0, $zero
/* 5FEA0 8005F2A0 0C026259 */  jal        passToMalloc
/* 5FEA4 8005F2A4 8C7206B0 */   lw        $s2, 0x6b0($v1)
/* 5FEA8 8005F2A8 00408021 */  addu       $s0, $v0, $zero
/* 5FEAC 8005F2AC 0C03353E */  jal        strlen
/* 5FEB0 8005F2B0 02402021 */   addu      $a0, $s2, $zero
/* 5FEB4 8005F2B4 02002021 */  addu       $a0, $s0, $zero
/* 5FEB8 8005F2B8 02402821 */  addu       $a1, $s2, $zero
/* 5FEBC 8005F2BC 24420001 */  addiu      $v0, $v0, 1
/* 5FEC0 8005F2C0 0C02E3A0 */  jal        widgettext_func_2
/* 5FEC4 8005F2C4 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5FEC8 8005F2C8 02602021 */  addu       $a0, $s3, $zero
/* 5FECC 8005F2CC 00402821 */  addu       $a1, $v0, $zero
/* 5FED0 8005F2D0 3C038006 */  lui        $v1, %hi(attempt_trap_disarm)
/* 5FED4 8005F2D4 2463F34C */  addiu      $v1, $v1, %lo(attempt_trap_disarm)
/* 5FED8 8005F2D8 0C013626 */  jal        func_8004D898
/* 5FEDC 8005F2DC AC430018 */   sw        $v1, 0x18($v0)
/* 5FEE0 8005F2E0 8E22204C */  lw         $v0, 0x204c($s1)
/* 5FEE4 8005F2E4 2404007C */  addiu      $a0, $zero, 0x7c
/* 5FEE8 8005F2E8 0C026259 */  jal        passToMalloc
/* 5FEEC 8005F2EC 8C5206AC */   lw        $s2, 0x6ac($v0)
/* 5FEF0 8005F2F0 00408021 */  addu       $s0, $v0, $zero
/* 5FEF4 8005F2F4 0C03353E */  jal        strlen
/* 5FEF8 8005F2F8 02402021 */   addu      $a0, $s2, $zero
/* 5FEFC 8005F2FC 02002021 */  addu       $a0, $s0, $zero
/* 5FF00 8005F300 02402821 */  addu       $a1, $s2, $zero
/* 5FF04 8005F304 24420001 */  addiu      $v0, $v0, 1
/* 5FF08 8005F308 0C02E3A0 */  jal        widgettext_func_2
/* 5FF0C 8005F30C 3046FFFF */   andi      $a2, $v0, 0xffff
/* 5FF10 8005F310 02602021 */  addu       $a0, $s3, $zero
/* 5FF14 8005F314 0C013626 */  jal        func_8004D898
/* 5FF18 8005F318 00402821 */   addu      $a1, $v0, $zero
/* 5FF1C 8005F31C 0C013786 */  jal        func_8004DE18
/* 5FF20 8005F320 02602021 */   addu      $a0, $s3, $zero
/* 5FF24 8005F324 8E241604 */  lw         $a0, 0x1604($s1)
/* 5FF28 8005F328 0C02DC7C */  jal        widgetHandler
/* 5FF2C 8005F32C 02602821 */   addu      $a1, $s3, $zero
/* 5FF30 8005F330 8FBF0078 */  lw         $ra, 0x78($sp)
/* 5FF34 8005F334 8FB30074 */  lw         $s3, 0x74($sp)
/* 5FF38 8005F338 8FB20070 */  lw         $s2, 0x70($sp)
/* 5FF3C 8005F33C 8FB1006C */  lw         $s1, 0x6c($sp)
/* 5FF40 8005F340 8FB00068 */  lw         $s0, 0x68($sp)
/* 5FF44 8005F344 03E00008 */  jr         $ra
/* 5FF48 8005F348 27BD0080 */   addiu     $sp, $sp, 0x80

glabel attempt_trap_disarm
/* 5FF4C 8005F34C 3C02800F */  lui        $v0, %hi(ref_obj_pointer)
/* 5FF50 8005F350 8C44F5D0 */  lw         $a0, %lo(ref_obj_pointer)($v0)
/* 5FF54 8005F354 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5FF58 8005F358 1080000F */  beqz       $a0, .L8005F398
/* 5FF5C 8005F35C AFBF0010 */   sw        $ra, 0x10($sp)
/* 5FF60 8005F360 0C017E0D */  jal        trapmenu_func
/* 5FF64 8005F364 00000000 */   nop
/* 5FF68 8005F368 3C03800E */  lui        $v1, %hi(partyPointer)
/* 5FF6C 8005F36C 8C647EA0 */  lw         $a0, %lo(partyPointer)($v1)
/* 5FF70 8005F370 0C02063E */  jal        some_mechanic_check
/* 5FF74 8005F374 90450003 */   lbu       $a1, 3($v0)
/* 5FF78 8005F378 14400005 */  bnez       $v0, .L8005F390
/* 5FF7C 8005F37C 00000000 */   nop
/* 5FF80 8005F380 0C017D31 */  jal        trap_exploxes_func
/* 5FF84 8005F384 00000000 */   nop
/* 5FF88 8005F388 08017CE7 */  j          .L8005F39C
/* 5FF8C 8005F38C 00001021 */   addu      $v0, $zero, $zero
.L8005F390:
/* 5FF90 8005F390 0C017D08 */  jal        drap_disarmed
/* 5FF94 8005F394 00000000 */   nop
.L8005F398:
/* 5FF98 8005F398 00001021 */  addu       $v0, $zero, $zero
.L8005F39C:
/* 5FF9C 8005F39C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5FFA0 8005F3A0 03E00008 */  jr         $ra
/* 5FFA4 8005F3A4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8005F3A8
/* 5FFA8 8005F3A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5FFAC 8005F3AC 00A02021 */  addu       $a0, $a1, $zero
/* 5FFB0 8005F3B0 24050005 */  addiu      $a1, $zero, 5
/* 5FFB4 8005F3B4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5FFB8 8005F3B8 0C02DEC8 */  jal        set_widgets_byte0x70
/* 5FFBC 8005F3BC AFB00010 */   sw        $s0, 0x10($sp)
/* 5FFC0 8005F3C0 3C10800F */  lui        $s0, %hi(ref_obj_pointer)
/* 5FFC4 8005F3C4 8E04F5D0 */  lw         $a0, %lo(ref_obj_pointer)($s0)
/* 5FFC8 8005F3C8 3C02800E */  lui        $v0, %hi(PlayerCharStruct+0x30)
/* 5FFCC 8005F3CC 14800003 */  bnez       $a0, .L8005F3DC
/* 5FFD0 8005F3D0 AC406980 */   sw        $zero, %lo(PlayerCharStruct+0x30)($v0)
/* 5FFD4 8005F3D4 08017D04 */  j          .L8005F410
/* 5FFD8 8005F3D8 00001021 */   addu      $v0, $zero, $zero
.L8005F3DC:
/* 5FFDC 8005F3DC 94830016 */  lhu        $v1, 0x16($a0)
/* 5FFE0 8005F3E0 24020007 */  addiu      $v0, $zero, 7
/* 5FFE4 8005F3E4 14620005 */  bne        $v1, $v0, .L8005F3FC
/* 5FFE8 8005F3E8 24057FFF */   addiu     $a1, $zero, 0x7fff
/* 5FFEC 8005F3EC 9484003E */  lhu        $a0, 0x3e($a0)
/* 5FFF0 8005F3F0 0C00918D */  jal        setEventFlag
/* 5FFF4 8005F3F4 24050001 */   addiu     $a1, $zero, 1
/* 5FFF8 8005F3F8 24057FFF */  addiu      $a1, $zero, 0x7fff
.L8005F3FC:
/* 5FFFC 8005F3FC 8E04F5D0 */  lw         $a0, -0xa30($s0)
/* 60000 8005F400 0C004E4D */  jal        run_voxelFuncs0
/* 60004 8005F404 00003021 */   addu      $a2, $zero, $zero
/* 60008 8005F408 00001021 */  addu       $v0, $zero, $zero
/* 6000C 8005F40C AE00F5D0 */  sw         $zero, -0xa30($s0)
.L8005F410:
/* 60010 8005F410 8FBF0014 */  lw         $ra, 0x14($sp)
/* 60014 8005F414 8FB00010 */  lw         $s0, 0x10($sp)
/* 60018 8005F418 03E00008 */  jr         $ra
/* 6001C 8005F41C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel drap_disarmed
/* 60020 8005F420 27BDFF58 */  addiu      $sp, $sp, -0xa8
/* 60024 8005F424 240200E1 */  addiu      $v0, $zero, 0xe1
/* 60028 8005F428 27A60018 */  addiu      $a2, $sp, 0x18
/* 6002C 8005F42C AFB1009C */  sw         $s1, 0x9c($sp)
/* 60030 8005F430 241100FF */  addiu      $s1, $zero, 0xff
/* 60034 8005F434 AFB00098 */  sw         $s0, 0x98($sp)
/* 60038 8005F438 3C10800E */  lui        $s0, %hi(gGlobals)
/* 6003C 8005F43C 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 60040 8005F440 AFBF00A0 */  sw         $ra, 0xa0($sp)
/* 60044 8005F444 A3A20018 */  sb         $v0, 0x18($sp)
/* 60048 8005F448 A0C20001 */  sb         $v0, 1($a2)
/* 6004C 8005F44C A0C20002 */  sb         $v0, 2($a2)
/* 60050 8005F450 24020001 */  addiu      $v0, $zero, 1
/* 60054 8005F454 A0D10003 */  sb         $s1, 3($a2)
/* 60058 8005F458 A3A00058 */  sb         $zero, 0x58($sp)
/* 6005C 8005F45C A3A00059 */  sb         $zero, 0x59($sp)
/* 60060 8005F460 A3A0005A */  sb         $zero, 0x5a($sp)
/* 60064 8005F464 A3B1005B */  sb         $s1, 0x5b($sp)
/* 60068 8005F468 8E03204C */  lw         $v1, 0x204c($s0)
/* 6006C 8005F46C 24050078 */  addiu      $a1, $zero, 0x78
/* 60070 8005F470 AFA20010 */  sw         $v0, 0x10($sp)
/* 60074 8005F474 8C6406B4 */  lw         $a0, 0x6b4($v1)
/* 60078 8005F478 0C0131E1 */  jal        some_textbox_func
/* 6007C 8005F47C 27A70058 */   addiu     $a3, $sp, 0x58
/* 60080 8005F480 3C03800F */  lui        $v1, %hi(ref_obj_pointer)
/* 60084 8005F484 8C64F5D0 */  lw         $a0, %lo(ref_obj_pointer)($v1)
/* 60088 8005F488 3C038006 */  lui        $v1, %hi(func_8005F3A8)
/* 6008C 8005F48C 2463F3A8 */  addiu      $v1, $v1, %lo(func_8005F3A8)
/* 60090 8005F490 AC430018 */  sw         $v1, 0x18($v0)
/* 60094 8005F494 AC43001C */  sw         $v1, 0x1c($v0)
/* 60098 8005F498 AC400034 */  sw         $zero, 0x34($v0)
/* 6009C 8005F49C AC400030 */  sw         $zero, 0x30($v0)
/* 600A0 8005F4A0 0C017E0D */  jal        trapmenu_func
/* 600A4 8005F4A4 AE0200D8 */   sw        $v0, 0xd8($s0)
/* 600A8 8005F4A8 8FBF00A0 */  lw         $ra, 0xa0($sp)
/* 600AC 8005F4AC A4510000 */  sh         $s1, ($v0)
/* 600B0 8005F4B0 8FB1009C */  lw         $s1, 0x9c($sp)
/* 600B4 8005F4B4 8FB00098 */  lw         $s0, 0x98($sp)
/* 600B8 8005F4B8 A4400002 */  sh         $zero, 2($v0)
/* 600BC 8005F4BC 03E00008 */  jr         $ra
/* 600C0 8005F4C0 27BD00A8 */   addiu     $sp, $sp, 0xa8

glabel trap_exploxes_func
/* 600C4 8005F4C4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 600C8 8005F4C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 600CC 8005F4CC 3C11800F */  lui        $s1, %hi(ref_obj_pointer)
/* 600D0 8005F4D0 8E22F5D0 */  lw         $v0, %lo(ref_obj_pointer)($s1)
/* 600D4 8005F4D4 AFBF0020 */  sw         $ra, 0x20($sp)
/* 600D8 8005F4D8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 600DC 8005F4DC AFB20018 */  sw         $s2, 0x18($sp)
/* 600E0 8005F4E0 AFB00010 */  sw         $s0, 0x10($sp)
/* 600E4 8005F4E4 00402021 */  addu       $a0, $v0, $zero
/* 600E8 8005F4E8 0C017E0D */  jal        trapmenu_func
/* 600EC 8005F4EC 94530016 */   lhu       $s3, 0x16($v0)
/* 600F0 8005F4F0 94520002 */  lhu        $s2, 2($v0)
/* 600F4 8005F4F4 8E25F5D0 */  lw         $a1, -0xa30($s1)
/* 600F8 8005F4F8 240300FF */  addiu      $v1, $zero, 0xff
/* 600FC 8005F4FC A4400002 */  sh         $zero, 2($v0)
/* 60100 8005F500 A4430000 */  sh         $v1, ($v0)
/* 60104 8005F504 94A40016 */  lhu        $a0, 0x16($a1)
/* 60108 8005F508 24020001 */  addiu      $v0, $zero, 1
/* 6010C 8005F50C 14820005 */  bne        $a0, $v0, .L8005F524
/* 60110 8005F510 3C10800E */   lui       $s0, %hi(gGlobals)
/* 60114 8005F514 00A02021 */  addu       $a0, $a1, $zero
/* 60118 8005F518 260268A8 */  addiu      $v0, $s0, %lo(gGlobals)
/* 6011C 8005F51C 0C004DDD */  jal        open_explosive_chest
/* 60120 8005F520 8C450200 */   lw        $a1, 0x200($v0)
.L8005F524:
/* 60124 8005F524 260268A8 */  addiu      $v0, $s0, 0x68a8
/* 60128 8005F528 8C43204C */  lw         $v1, 0x204c($v0)
/* 6012C 8005F52C 00122400 */  sll        $a0, $s2, 0x10
/* 60130 8005F530 8C6506CC */  lw         $a1, 0x6cc($v1)
/* 60134 8005F534 0C017D64 */  jal        take_explosive_damage
/* 60138 8005F538 00042403 */   sra       $a0, $a0, 0x10
/* 6013C 8005F53C 00402021 */  addu       $a0, $v0, $zero
/* 60140 8005F540 1080000C */  beqz       $a0, .L8005F574
/* 60144 8005F544 3C028001 */   lui       $v0, %hi(func_80014ECC)
/* 60148 8005F548 24424ECC */  addiu      $v0, $v0, %lo(func_80014ECC)
/* 6014C 8005F54C 24030007 */  addiu      $v1, $zero, 7
/* 60150 8005F550 AC820018 */  sw         $v0, 0x18($a0)
/* 60154 8005F554 16630006 */  bne        $s3, $v1, .L8005F570
/* 60158 8005F558 AC82001C */   sw        $v0, 0x1c($a0)
/* 6015C 8005F55C 3C028006 */  lui        $v0, %hi(func_8005F3A8)
/* 60160 8005F560 2442F3A8 */  addiu      $v0, $v0, %lo(func_8005F3A8)
/* 60164 8005F564 AC82001C */  sw         $v0, 0x1c($a0)
/* 60168 8005F568 08017D5D */  j          .L8005F574
/* 6016C 8005F56C AC820018 */   sw        $v0, 0x18($a0)
.L8005F570:
/* 60170 8005F570 AE20F5D0 */  sw         $zero, -0xa30($s1)
.L8005F574:
/* 60174 8005F574 8FBF0020 */  lw         $ra, 0x20($sp)
/* 60178 8005F578 8FB3001C */  lw         $s3, 0x1c($sp)
/* 6017C 8005F57C 8FB20018 */  lw         $s2, 0x18($sp)
/* 60180 8005F580 8FB10014 */  lw         $s1, 0x14($sp)
/* 60184 8005F584 8FB00010 */  lw         $s0, 0x10($sp)
/* 60188 8005F588 03E00008 */  jr         $ra
/* 6018C 8005F58C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel take_explosive_damage
/* 60190 8005F590 27BDFB98 */  addiu      $sp, $sp, -0x468
/* 60194 8005F594 AFBE0460 */  sw         $fp, 0x460($sp)
/* 60198 8005F598 0000F021 */  addu       $fp, $zero, $zero
/* 6019C 8005F59C 00042400 */  sll        $a0, $a0, 0x10
/* 601A0 8005F5A0 AFB60458 */  sw         $s6, 0x458($sp)
/* 601A4 8005F5A4 0004B403 */  sra        $s6, $a0, 0x10
/* 601A8 8005F5A8 3C02800E */  lui        $v0, %hi(gGlobals)
/* 601AC 8005F5AC AFB00440 */  sw         $s0, 0x440($sp)
/* 601B0 8005F5B0 245068A8 */  addiu      $s0, $v0, %lo(gGlobals)
/* 601B4 8005F5B4 AFBF0464 */  sw         $ra, 0x464($sp)
/* 601B8 8005F5B8 AFB7045C */  sw         $s7, 0x45c($sp)
/* 601BC 8005F5BC AFB50454 */  sw         $s5, 0x454($sp)
/* 601C0 8005F5C0 AFB40450 */  sw         $s4, 0x450($sp)
/* 601C4 8005F5C4 AFB3044C */  sw         $s3, 0x44c($sp)
/* 601C8 8005F5C8 AFB20448 */  sw         $s2, 0x448($sp)
/* 601CC 8005F5CC AFB10444 */  sw         $s1, 0x444($sp)
/* 601D0 8005F5D0 AFA00430 */  sw         $zero, 0x430($sp)
/* 601D4 8005F5D4 AFA00434 */  sw         $zero, 0x434($sp)
/* 601D8 8005F5D8 AFA00438 */  sw         $zero, 0x438($sp)
/* 601DC 8005F5DC 10A00011 */  beqz       $a1, .L8005F624
/* 601E0 8005F5E0 8E1115F8 */   lw        $s1, 0x15f8($s0)
/* 601E4 8005F5E4 0C02626C */  jal        copy_string
/* 601E8 8005F5E8 27A40030 */   addiu     $a0, $sp, 0x30
/* 601EC 8005F5EC 24020001 */  addiu      $v0, $zero, 1
/* 601F0 8005F5F0 27A50030 */  addiu      $a1, $sp, 0x30
/* 601F4 8005F5F4 00003021 */  addu       $a2, $zero, $zero
/* 601F8 8005F5F8 AFA20430 */  sw         $v0, 0x430($sp)
/* 601FC 8005F5FC 8E041600 */  lw         $a0, 0x1600($s0)
/* 60200 8005F600 24070140 */  addiu      $a3, $zero, 0x140
/* 60204 8005F604 0C02D4A4 */  jal        func_800B5290
/* 60208 8005F608 AFA20438 */   sw        $v0, 0x438($sp)
/* 6020C 8005F60C AFA20434 */  sw         $v0, 0x434($sp)
/* 60210 8005F610 8E041600 */  lw         $a0, 0x1600($s0)
/* 60214 8005F614 3C063F80 */  lui        $a2, 0x3f80
/* 60218 8005F618 0C02D44A */  jal        func_800B5128
/* 6021C 8005F61C 27A50030 */   addiu     $a1, $sp, 0x30
/* 60220 8005F620 0040F021 */  addu       $fp, $v0, $zero
.L8005F624:
/* 60224 8005F624 0000B821 */  addu       $s7, $zero, $zero
/* 60228 8005F628 27B50330 */  addiu      $s5, $sp, 0x330
/* 6022C 8005F62C 0220A021 */  addu       $s4, $s1, $zero
.L8005F630:
/* 60230 8005F630 8E920000 */  lw         $s2, ($s4)
/* 60234 8005F634 52400053 */  beql       $s2, $zero, .L8005F784
/* 60238 8005F638 26F70001 */   addiu     $s7, $s7, 1
/* 6023C 8005F63C 0C01DF1D */  jal        isDead
/* 60240 8005F640 02402021 */   addu      $a0, $s2, $zero
/* 60244 8005F644 5440004F */  bnel       $v0, $zero, .L8005F784
/* 60248 8005F648 26F70001 */   addiu     $s7, $s7, 1
/* 6024C 8005F64C 24040001 */  addiu      $a0, $zero, 1
/* 60250 8005F650 0C002D03 */  jal        RollD
/* 60254 8005F654 24050004 */   addiu     $a1, $zero, 4
/* 60258 8005F658 02C20018 */  mult       $s6, $v0
/* 6025C 8005F65C 00001012 */  mflo       $v0
/* 60260 8005F660 28420002 */  slti       $v0, $v0, 2
/* 60264 8005F664 14400008 */  bnez       $v0, .L8005F688
/* 60268 8005F668 24110001 */   addiu     $s1, $zero, 1
/* 6026C 8005F66C 24040001 */  addiu      $a0, $zero, 1
/* 60270 8005F670 0C002D03 */  jal        RollD
/* 60274 8005F674 24050004 */   addiu     $a1, $zero, 4
/* 60278 8005F678 02C20018 */  mult       $s6, $v0
/* 6027C 8005F67C 00001012 */  mflo       $v0
/* 60280 8005F680 00021400 */  sll        $v0, $v0, 0x10
/* 60284 8005F684 00028C03 */  sra        $s1, $v0, 0x10
.L8005F688:
/* 60288 8005F688 8E500018 */  lw         $s0, 0x18($s2)
/* 6028C 8005F68C 24050003 */  addiu      $a1, $zero, 3
/* 60290 8005F690 0C02128F */  jal        getModdedStat
/* 60294 8005F694 02002021 */   addu      $a0, $s0, $zero
/* 60298 8005F698 0222102A */  slt        $v0, $s1, $v0
/* 6029C 8005F69C 10400006 */  beqz       $v0, .L8005F6B8
/* 602A0 8005F6A0 02002021 */   addu      $a0, $s0, $zero
/* 602A4 8005F6A4 24050003 */  addiu      $a1, $zero, 3
/* 602A8 8005F6A8 0C02123F */  jal        addModdedStat
/* 602AC 8005F6AC 00113023 */   negu      $a2, $s1
/* 602B0 8005F6B0 08017DB6 */  j          .L8005F6D8
/* 602B4 8005F6B4 27B00230 */   addiu     $s0, $sp, 0x230
.L8005F6B8:
/* 602B8 8005F6B8 0C02128F */  jal        getModdedStat
/* 602BC 8005F6BC 24050003 */   addiu     $a1, $zero, 3
/* 602C0 8005F6C0 02002021 */  addu       $a0, $s0, $zero
/* 602C4 8005F6C4 24050003 */  addiu      $a1, $zero, 3
/* 602C8 8005F6C8 00021023 */  negu       $v0, $v0
/* 602CC 8005F6CC 0C02123F */  jal        addModdedStat
/* 602D0 8005F6D0 24460001 */   addiu     $a2, $v0, 1
/* 602D4 8005F6D4 27B00230 */  addiu      $s0, $sp, 0x230
.L8005F6D8:
/* 602D8 8005F6D8 02002021 */  addu       $a0, $s0, $zero
/* 602DC 8005F6DC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 602E0 8005F6E0 245368A8 */  addiu      $s3, $v0, %lo(gGlobals)
/* 602E4 8005F6E4 8E62204C */  lw         $v0, 0x204c($s3)
/* 602E8 8005F6E8 8E460004 */  lw         $a2, 4($s2)
/* 602EC 8005F6EC 8C4506C8 */  lw         $a1, 0x6c8($v0)
/* 602F0 8005F6F0 0C0333AC */  jal        sprintf
/* 602F4 8005F6F4 02203821 */   addu      $a3, $s1, $zero
/* 602F8 8005F6F8 8E641600 */  lw         $a0, 0x1600($s3)
/* 602FC 8005F6FC 3C063F80 */  lui        $a2, 0x3f80
/* 60300 8005F700 0C02D44A */  jal        func_800B5128
/* 60304 8005F704 02002821 */   addu      $a1, $s0, $zero
/* 60308 8005F708 00401821 */  addu       $v1, $v0, $zero
/* 6030C 8005F70C 03C3102B */  sltu       $v0, $fp, $v1
/* 60310 8005F710 54400001 */  bnel       $v0, $zero, .L8005F718
/* 60314 8005F714 0060F021 */   addu      $fp, $v1, $zero
.L8005F718:
/* 60318 8005F718 8FA50430 */  lw         $a1, 0x430($sp)
/* 6031C 8005F71C 14A0000D */  bnez       $a1, .L8005F754
/* 60320 8005F720 02A02021 */   addu      $a0, $s5, $zero
/* 60324 8005F724 27A40030 */  addiu      $a0, $sp, 0x30
/* 60328 8005F728 0C02626C */  jal        copy_string
/* 6032C 8005F72C 02002821 */   addu      $a1, $s0, $zero
/* 60330 8005F730 24020001 */  addiu      $v0, $zero, 1
/* 60334 8005F734 27A50030 */  addiu      $a1, $sp, 0x30
/* 60338 8005F738 00003021 */  addu       $a2, $zero, $zero
/* 6033C 8005F73C AFA20430 */  sw         $v0, 0x430($sp)
/* 60340 8005F740 8E641600 */  lw         $a0, 0x1600($s3)
/* 60344 8005F744 0C02D4A4 */  jal        func_800B5290
/* 60348 8005F748 24070140 */   addiu     $a3, $zero, 0x140
/* 6034C 8005F74C 08017DDD */  j          .L8005F774
/* 60350 8005F750 AFA20434 */   sw        $v0, 0x434($sp)
.L8005F754:
/* 60354 8005F754 3C02800E */  lui        $v0, %hi(D_800DF410)
/* 60358 8005F758 2445F410 */  addiu      $a1, $v0, %lo(D_800DF410)
/* 6035C 8005F75C 27A60030 */  addiu      $a2, $sp, 0x30
/* 60360 8005F760 0C0333AC */  jal        sprintf
/* 60364 8005F764 02003821 */   addu      $a3, $s0, $zero
/* 60368 8005F768 27A40030 */  addiu      $a0, $sp, 0x30
/* 6036C 8005F76C 0C02626C */  jal        copy_string
/* 60370 8005F770 02A02821 */   addu      $a1, $s5, $zero
.L8005F774:
/* 60374 8005F774 8FA50438 */  lw         $a1, 0x438($sp)
/* 60378 8005F778 24A50001 */  addiu      $a1, $a1, 1
/* 6037C 8005F77C AFA50438 */  sw         $a1, 0x438($sp)
/* 60380 8005F780 26F70001 */  addiu      $s7, $s7, 1
.L8005F784:
/* 60384 8005F784 2EE20004 */  sltiu      $v0, $s7, 4
/* 60388 8005F788 1440FFA9 */  bnez       $v0, .L8005F630
/* 6038C 8005F78C 26940004 */   addiu     $s4, $s4, 4
/* 60390 8005F790 27A40030 */  addiu      $a0, $sp, 0x30
/* 60394 8005F794 27C50010 */  addiu      $a1, $fp, 0x10
/* 60398 8005F798 30A5FFFF */  andi       $a1, $a1, 0xffff
/* 6039C 8005F79C 240200FF */  addiu      $v0, $zero, 0xff
/* 603A0 8005F7A0 AFA20010 */  sw         $v0, 0x10($sp)
/* 603A4 8005F7A4 AFA20014 */  sw         $v0, 0x14($sp)
/* 603A8 8005F7A8 AFA20018 */  sw         $v0, 0x18($sp)
/* 603AC 8005F7AC 8FA20434 */  lw         $v0, 0x434($sp)
/* 603B0 8005F7B0 240700FF */  addiu      $a3, $zero, 0xff
/* 603B4 8005F7B4 24460002 */  addiu      $a2, $v0, 2
/* 603B8 8005F7B8 8FA20438 */  lw         $v0, 0x438($sp)
/* 603BC 8005F7BC 24030032 */  addiu      $v1, $zero, 0x32
/* 603C0 8005F7C0 AFA3001C */  sw         $v1, 0x1c($sp)
/* 603C4 8005F7C4 AFA30020 */  sw         $v1, 0x20($sp)
/* 603C8 8005F7C8 AFA30024 */  sw         $v1, 0x24($sp)
/* 603CC 8005F7CC 00C20018 */  mult       $a2, $v0
/* 603D0 8005F7D0 24030001 */  addiu      $v1, $zero, 1
/* 603D4 8005F7D4 AFA3002C */  sw         $v1, 0x2c($sp)
/* 603D8 8005F7D8 24020096 */  addiu      $v0, $zero, 0x96
/* 603DC 8005F7DC AFA20028 */  sw         $v0, 0x28($sp)
/* 603E0 8005F7E0 00003012 */  mflo       $a2
/* 603E4 8005F7E4 0C013174 */  jal        another_textbox_func
/* 603E8 8005F7E8 30C6FFFF */   andi      $a2, $a2, 0xffff
/* 603EC 8005F7EC 00401821 */  addu       $v1, $v0, $zero
/* 603F0 8005F7F0 3C05800E */  lui        $a1, 0x800e
/* 603F4 8005F7F4 8FBF0464 */  lw         $ra, 0x464($sp)
/* 603F8 8005F7F8 8FBE0460 */  lw         $fp, 0x460($sp)
/* 603FC 8005F7FC 8FB7045C */  lw         $s7, 0x45c($sp)
/* 60400 8005F800 8FB60458 */  lw         $s6, 0x458($sp)
/* 60404 8005F804 8FB50454 */  lw         $s5, 0x454($sp)
/* 60408 8005F808 8FB40450 */  lw         $s4, 0x450($sp)
/* 6040C 8005F80C 8FB3044C */  lw         $s3, 0x44c($sp)
/* 60410 8005F810 8FB20448 */  lw         $s2, 0x448($sp)
/* 60414 8005F814 8FB10444 */  lw         $s1, 0x444($sp)
/* 60418 8005F818 8FB00440 */  lw         $s0, 0x440($sp)
/* 6041C 8005F81C 24A468A8 */  addiu      $a0, $a1, 0x68a8
/* 60420 8005F820 AC8300D8 */  sw         $v1, 0xd8($a0)
/* 60424 8005F824 AC600034 */  sw         $zero, 0x34($v1)
/* 60428 8005F828 AC600030 */  sw         $zero, 0x30($v1)
/* 6042C 8005F82C 03E00008 */  jr         $ra
/* 60430 8005F830 27BD0468 */   addiu     $sp, $sp, 0x468

glabel trapmenu_func
/* 60434 8005F834 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 60438 8005F838 AFBF0010 */  sw         $ra, 0x10($sp)
/* 6043C 8005F83C 94830016 */  lhu        $v1, 0x16($a0)
/* 60440 8005F840 24020001 */  addiu      $v0, $zero, 1
/* 60444 8005F844 14620003 */  bne        $v1, $v0, .L8005F854
/* 60448 8005F848 24020007 */   addiu     $v0, $zero, 7
/* 6044C 8005F84C 08017E1E */  j          .L8005F878
/* 60450 8005F850 24820034 */   addiu     $v0, $a0, 0x34
.L8005F854:
/* 60454 8005F854 10620007 */  beq        $v1, $v0, .L8005F874
/* 60458 8005F858 3C05800E */   lui       $a1, %hi(D_800DF438)
/* 6045C 8005F85C 3C04800E */  lui        $a0, %hi(D_800DF418)
/* 60460 8005F860 2484F418 */  addiu      $a0, $a0, %lo(D_800DF418)
/* 60464 8005F864 0C025F2D */  jal        manualCrash
/* 60468 8005F868 24A5F438 */   addiu     $a1, $a1, %lo(D_800DF438)
/* 6046C 8005F86C 08017E1E */  j          .L8005F878
/* 60470 8005F870 00001021 */   addu      $v0, $zero, $zero
.L8005F874:
/* 60474 8005F874 24820030 */  addiu      $v0, $a0, 0x30
.L8005F878:
/* 60478 8005F878 8FBF0010 */  lw         $ra, 0x10($sp)
/* 6047C 8005F87C 03E00008 */  jr         $ra
/* 60480 8005F880 27BD0018 */   addiu     $sp, $sp, 0x18
/* 60484 8005F884 00000000 */  nop
/* 60488 8005F888 00000000 */  nop
/* 6048C 8005F88C 00000000 */  nop
