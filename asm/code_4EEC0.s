.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel func_8004E2C0
/* 4EEC0 8004E2C0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4EEC4 8004E2C4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4EEC8 8004E2C8 00808821 */  addu       $s1, $a0, $zero
/* 4EECC 8004E2CC AFB20020 */  sw         $s2, 0x20($sp)
/* 4EED0 8004E2D0 30D200FF */  andi       $s2, $a2, 0xff
/* 4EED4 8004E2D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 4EED8 8004E2D8 AFBF0024 */  sw         $ra, 0x24($sp)
/* 4EEDC 8004E2DC 0C01385A */  jal        set_superMenuClasses
/* 4EEE0 8004E2E0 30F000FF */   andi      $s0, $a3, 0xff
/* 4EEE4 8004E2E4 2E420005 */  sltiu      $v0, $s2, 5
/* 4EEE8 8004E2E8 1040000D */  beqz       $v0, .L8004E320
/* 4EEEC 8004E2EC AE200004 */   sw        $zero, 4($s1)
/* 4EEF0 8004E2F0 3C02800E */  lui        $v0, %hi(D_800DDA78)
/* 4EEF4 8004E2F4 2442DA78 */  addiu      $v0, $v0, %lo(D_800DDA78)
/* 4EEF8 8004E2F8 00121880 */  sll        $v1, $s2, 2
/* 4EEFC 8004E2FC 00621821 */  addu       $v1, $v1, $v0
/* 4EF00 8004E300 8C640000 */  lw         $a0, ($v1)
/* 4EF04 8004E304 00800008 */  jr         $a0
/* 4EF08 8004E308 00000000 */   nop
/* 4EF0C 8004E30C 02202021 */  addu       $a0, $s1, $zero
/* 4EF10 8004E310 0C0139D6 */  jal        func_8004E758
/* 4EF14 8004E314 02002821 */   addu      $a1, $s0, $zero
/* 4EF18 8004E318 08013924 */  j          .L8004E490
/* 4EF1C 8004E31C 02201021 */   addu      $v0, $s1, $zero
.L8004E320:
/* 4EF20 8004E320 0C026259 */  jal        passToMalloc
/* 4EF24 8004E324 2404007C */   addiu     $a0, $zero, 0x7c
/* 4EF28 8004E328 00402021 */  addu       $a0, $v0, $zero
/* 4EF2C 8004E32C 0C02E518 */  jal        borg8_widget
/* 4EF30 8004E330 00002821 */   addu      $a1, $zero, $zero
/* 4EF34 8004E334 2404007C */  addiu      $a0, $zero, 0x7c
/* 4EF38 8004E338 0C026259 */  jal        passToMalloc
/* 4EF3C 8004E33C AE220008 */   sw        $v0, 8($s1)
/* 4EF40 8004E340 00402021 */  addu       $a0, $v0, $zero
/* 4EF44 8004E344 0C02E518 */  jal        borg8_widget
/* 4EF48 8004E348 00002821 */   addu      $a1, $zero, $zero
/* 4EF4C 8004E34C 2404007C */  addiu      $a0, $zero, 0x7c
/* 4EF50 8004E350 0C026259 */  jal        passToMalloc
/* 4EF54 8004E354 AE220000 */   sw        $v0, ($s1)
/* 4EF58 8004E358 00402021 */  addu       $a0, $v0, $zero
/* 4EF5C 8004E35C 0C02E518 */  jal        borg8_widget
/* 4EF60 8004E360 00002821 */   addu      $a1, $zero, $zero
/* 4EF64 8004E364 2404007C */  addiu      $a0, $zero, 0x7c
/* 4EF68 8004E368 0C026259 */  jal        passToMalloc
/* 4EF6C 8004E36C AE22000C */   sw        $v0, 0xc($s1)
/* 4EF70 8004E370 00402021 */  addu       $a0, $v0, $zero
/* 4EF74 8004E374 0C02E518 */  jal        borg8_widget
/* 4EF78 8004E378 00002821 */   addu      $a1, $zero, $zero
/* 4EF7C 8004E37C 2404007C */  addiu      $a0, $zero, 0x7c
/* 4EF80 8004E380 0C026259 */  jal        passToMalloc
/* 4EF84 8004E384 AE220018 */   sw        $v0, 0x18($s1)
/* 4EF88 8004E388 00402021 */  addu       $a0, $v0, $zero
/* 4EF8C 8004E38C 3C05800E */  lui        $a1, %hi(D_800DDA70)
/* 4EF90 8004E390 24A5DA70 */  addiu      $a1, $a1, %lo(D_800DDA70)
/* 4EF94 8004E394 0C02E3A0 */  jal        widgettext_func_2
/* 4EF98 8004E398 240601F4 */   addiu     $a2, $zero, 0x1f4
/* 4EF9C 8004E39C 2404007C */  addiu      $a0, $zero, 0x7c
/* 4EFA0 8004E3A0 0C026259 */  jal        passToMalloc
/* 4EFA4 8004E3A4 AE220020 */   sw        $v0, 0x20($s1)
/* 4EFA8 8004E3A8 00402021 */  addu       $a0, $v0, $zero
/* 4EFAC 8004E3AC 0C02E68C */  jal        widgetscrollmenu_init
/* 4EFB0 8004E3B0 24050009 */   addiu     $a1, $zero, 9
/* 4EFB4 8004E3B4 240400DF */  addiu      $a0, $zero, 0xdf
/* 4EFB8 8004E3B8 0C013885 */  jal        supermenuclasses_func
/* 4EFBC 8004E3BC AE220028 */   sw        $v0, 0x28($s1)
/* 4EFC0 8004E3C0 00402821 */  addu       $a1, $v0, $zero
/* 4EFC4 8004E3C4 8E240000 */  lw         $a0, ($s1)
/* 4EFC8 8004E3C8 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 4EFCC 8004E3CC 00003021 */   addu      $a2, $zero, $zero
/* 4EFD0 8004E3D0 0C013885 */  jal        supermenuclasses_func
/* 4EFD4 8004E3D4 240401C4 */   addiu     $a0, $zero, 0x1c4
/* 4EFD8 8004E3D8 00402821 */  addu       $a1, $v0, $zero
/* 4EFDC 8004E3DC 8E24000C */  lw         $a0, 0xc($s1)
/* 4EFE0 8004E3E0 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 4EFE4 8004E3E4 00003021 */   addu      $a2, $zero, $zero
/* 4EFE8 8004E3E8 0C013885 */  jal        supermenuclasses_func
/* 4EFEC 8004E3EC 240401C3 */   addiu     $a0, $zero, 0x1c3
/* 4EFF0 8004E3F0 00402821 */  addu       $a1, $v0, $zero
/* 4EFF4 8004E3F4 8E240018 */  lw         $a0, 0x18($s1)
/* 4EFF8 8004E3F8 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 4EFFC 8004E3FC 00003021 */   addu      $a2, $zero, $zero
/* 4F000 8004E400 00002821 */  addu       $a1, $zero, $zero
/* 4F004 8004E404 8E28000C */  lw         $t0, 0xc($s1)
/* 4F008 8004E408 00003021 */  addu       $a2, $zero, $zero
/* 4F00C 8004E40C 8D030078 */  lw         $v1, 0x78($t0)
/* 4F010 8004E410 00003821 */  addu       $a3, $zero, $zero
/* 4F014 8004E414 84640048 */  lh         $a0, 0x48($v1)
/* 4F018 8004E418 241000FF */  addiu      $s0, $zero, 0xff
/* 4F01C 8004E41C AFB00010 */  sw         $s0, 0x10($sp)
/* 4F020 8004E420 8C62004C */  lw         $v0, 0x4c($v1)
/* 4F024 8004E424 0040F809 */  jalr       $v0
/* 4F028 8004E428 01042021 */   addu      $a0, $t0, $a0
/* 4F02C 8004E42C 8E280018 */  lw         $t0, 0x18($s1)
/* 4F030 8004E430 00002821 */  addu       $a1, $zero, $zero
/* 4F034 8004E434 8D030078 */  lw         $v1, 0x78($t0)
/* 4F038 8004E438 00003021 */  addu       $a2, $zero, $zero
/* 4F03C 8004E43C 84640048 */  lh         $a0, 0x48($v1)
/* 4F040 8004E440 00003821 */  addu       $a3, $zero, $zero
/* 4F044 8004E444 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F048 8004E448 8C62004C */  lw         $v0, 0x4c($v1)
/* 4F04C 8004E44C 0040F809 */  jalr       $v0
/* 4F050 8004E450 01042021 */   addu      $a0, $t0, $a0
/* 4F054 8004E454 8E240018 */  lw         $a0, 0x18($s1)
/* 4F058 8004E458 0C02DD46 */  jal        set_widgetWidth
/* 4F05C 8004E45C 2405000A */   addiu     $a1, $zero, 0xa
/* 4F060 8004E460 24050014 */  addiu      $a1, $zero, 0x14
/* 4F064 8004E464 8E240000 */  lw         $a0, ($s1)
/* 4F068 8004E468 0C02DD3F */  jal        set_widget_coords
/* 4F06C 8004E46C 240600B4 */   addiu     $a2, $zero, 0xb4
/* 4F070 8004E470 2405001A */  addiu      $a1, $zero, 0x1a
/* 4F074 8004E474 8E240008 */  lw         $a0, 8($s1)
/* 4F078 8004E478 0C02DD3F */  jal        set_widget_coords
/* 4F07C 8004E47C 240600BA */   addiu     $a2, $zero, 0xba
/* 4F080 8004E480 02202021 */  addu       $a0, $s1, $zero
/* 4F084 8004E484 0C01392A */  jal        func_8004E4A8
/* 4F088 8004E488 02402821 */   addu      $a1, $s2, $zero
/* 4F08C 8004E48C 02201021 */  addu       $v0, $s1, $zero
.L8004E490:
/* 4F090 8004E490 8FBF0024 */  lw         $ra, 0x24($sp)
/* 4F094 8004E494 8FB20020 */  lw         $s2, 0x20($sp)
/* 4F098 8004E498 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4F09C 8004E49C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4F0A0 8004E4A0 03E00008 */  jr         $ra
/* 4F0A4 8004E4A4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004E4A8
/* 4F0A8 8004E4A8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 4F0AC 8004E4AC AFB1002C */  sw         $s1, 0x2c($sp)
/* 4F0B0 8004E4B0 00808821 */  addu       $s1, $a0, $zero
/* 4F0B4 8004E4B4 30A300FF */  andi       $v1, $a1, 0xff
/* 4F0B8 8004E4B8 2C620005 */  sltiu      $v0, $v1, 5
/* 4F0BC 8004E4BC AFBF0030 */  sw         $ra, 0x30($sp)
/* 4F0C0 8004E4C0 1040000C */  beqz       $v0, .L8004E4F4
/* 4F0C4 8004E4C4 AFB00028 */   sw        $s0, 0x28($sp)
/* 4F0C8 8004E4C8 3C02800E */  lui        $v0, %hi(D_800DDA90)
/* 4F0CC 8004E4CC 2442DA90 */  addiu      $v0, $v0, %lo(D_800DDA90)
/* 4F0D0 8004E4D0 00031880 */  sll        $v1, $v1, 2
/* 4F0D4 8004E4D4 00621821 */  addu       $v1, $v1, $v0
/* 4F0D8 8004E4D8 8C640000 */  lw         $a0, ($v1)
/* 4F0DC 8004E4DC 00800008 */  jr         $a0
/* 4F0E0 8004E4E0 00000000 */   nop
/* 4F0E4 8004E4E4 0C013A5F */  jal        NOOP_8004e97c
/* 4F0E8 8004E4E8 02202021 */   addu      $a0, $s1, $zero
/* 4F0EC 8004E4EC 080139B5 */  j          .L8004E6D4
/* 4F0F0 8004E4F0 8FBF0030 */   lw        $ra, 0x30($sp)
.L8004E4F4:
/* 4F0F4 8004E4F4 8E260000 */  lw         $a2, ($s1)
/* 4F0F8 8004E4F8 8E23000C */  lw         $v1, 0xc($s1)
/* 4F0FC 8004E4FC 8CC50078 */  lw         $a1, 0x78($a2)
/* 4F100 8004E500 24020140 */  addiu      $v0, $zero, 0x140
/* 4F104 8004E504 A4620066 */  sh         $v0, 0x66($v1)
/* 4F108 8004E508 240200B4 */  addiu      $v0, $zero, 0xb4
/* 4F10C 8004E50C A4620068 */  sh         $v0, 0x68($v1)
/* 4F110 8004E510 A4600064 */  sh         $zero, 0x64($v1)
/* 4F114 8004E514 84A40020 */  lh         $a0, 0x20($a1)
/* 4F118 8004E518 8CA20024 */  lw         $v0, 0x24($a1)
/* 4F11C 8004E51C 0040F809 */  jalr       $v0
/* 4F120 8004E520 00C42021 */   addu      $a0, $a2, $a0
/* 4F124 8004E524 8E23000C */  lw         $v1, 0xc($s1)
/* 4F128 8004E528 244200B4 */  addiu      $v0, $v0, 0xb4
/* 4F12C 8004E52C 00602021 */  addu       $a0, $v1, $zero
/* 4F130 8004E530 A462006A */  sh         $v0, 0x6a($v1)
/* 4F134 8004E534 84850064 */  lh         $a1, 0x64($a0)
/* 4F138 8004E538 0C02DD3F */  jal        set_widget_coords
/* 4F13C 8004E53C 84860068 */   lh        $a2, 0x68($a0)
/* 4F140 8004E540 8E24000C */  lw         $a0, 0xc($s1)
/* 4F144 8004E544 94850066 */  lhu        $a1, 0x66($a0)
/* 4F148 8004E548 94820064 */  lhu        $v0, 0x64($a0)
/* 4F14C 8004E54C 00A22823 */  subu       $a1, $a1, $v0
/* 4F150 8004E550 0C02DD42 */  jal        set_widgetHeight
/* 4F154 8004E554 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 4F158 8004E558 8E24000C */  lw         $a0, 0xc($s1)
/* 4F15C 8004E55C 9485006A */  lhu        $a1, 0x6a($a0)
/* 4F160 8004E560 94820068 */  lhu        $v0, 0x68($a0)
/* 4F164 8004E564 00A22823 */  subu       $a1, $a1, $v0
/* 4F168 8004E568 0C02DD46 */  jal        set_widgetWidth
/* 4F16C 8004E56C 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 4F170 8004E570 8E250000 */  lw         $a1, ($s1)
/* 4F174 8004E574 8CA30078 */  lw         $v1, 0x78($a1)
/* 4F178 8004E578 84640018 */  lh         $a0, 0x18($v1)
/* 4F17C 8004E57C 8C62001C */  lw         $v0, 0x1c($v1)
/* 4F180 8004E580 0040F809 */  jalr       $v0
/* 4F184 8004E584 00A42021 */   addu      $a0, $a1, $a0
/* 4F188 8004E588 8E280020 */  lw         $t0, 0x20($s1)
/* 4F18C 8004E58C 8E27000C */  lw         $a3, 0xc($s1)
/* 4F190 8004E590 2442001A */  addiu      $v0, $v0, 0x1a
/* 4F194 8004E594 A5020064 */  sh         $v0, 0x64($t0)
/* 4F198 8004E598 00021400 */  sll        $v0, $v0, 0x10
/* 4F19C 8004E59C 94E30066 */  lhu        $v1, 0x66($a3)
/* 4F1A0 8004E5A0 00022C03 */  sra        $a1, $v0, 0x10
/* 4F1A4 8004E5A4 2463FFE6 */  addiu      $v1, $v1, -0x1a
/* 4F1A8 8004E5A8 A5030066 */  sh         $v1, 0x66($t0)
/* 4F1AC 8004E5AC 94E60068 */  lhu        $a2, 0x68($a3)
/* 4F1B0 8004E5B0 01002021 */  addu       $a0, $t0, $zero
/* 4F1B4 8004E5B4 24C60004 */  addiu      $a2, $a2, 4
/* 4F1B8 8004E5B8 A5060068 */  sh         $a2, 0x68($t0)
/* 4F1BC 8004E5BC 00063400 */  sll        $a2, $a2, 0x10
/* 4F1C0 8004E5C0 94E2006A */  lhu        $v0, 0x6a($a3)
/* 4F1C4 8004E5C4 00063403 */  sra        $a2, $a2, 0x10
/* 4F1C8 8004E5C8 2442FFFC */  addiu      $v0, $v0, -4
/* 4F1CC 8004E5CC 0C02DD3F */  jal        set_widget_coords
/* 4F1D0 8004E5D0 A502006A */   sh        $v0, 0x6a($t0)
/* 4F1D4 8004E5D4 240500C8 */  addiu      $a1, $zero, 0xc8
/* 4F1D8 8004E5D8 8E280020 */  lw         $t0, 0x20($s1)
/* 4F1DC 8004E5DC 240600C8 */  addiu      $a2, $zero, 0xc8
/* 4F1E0 8004E5E0 8D030078 */  lw         $v1, 0x78($t0)
/* 4F1E4 8004E5E4 240700C8 */  addiu      $a3, $zero, 0xc8
/* 4F1E8 8004E5E8 84640048 */  lh         $a0, 0x48($v1)
/* 4F1EC 8004E5EC 241000FF */  addiu      $s0, $zero, 0xff
/* 4F1F0 8004E5F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F1F4 8004E5F4 8C62004C */  lw         $v0, 0x4c($v1)
/* 4F1F8 8004E5F8 0040F809 */  jalr       $v0
/* 4F1FC 8004E5FC 01042021 */   addu      $a0, $t0, $a0
/* 4F200 8004E600 8E270020 */  lw         $a3, 0x20($s1)
/* 4F204 8004E604 8E230028 */  lw         $v1, 0x28($s1)
/* 4F208 8004E608 94E50064 */  lhu        $a1, 0x64($a3)
/* 4F20C 8004E60C 00602021 */  addu       $a0, $v1, $zero
/* 4F210 8004E610 A4650064 */  sh         $a1, 0x64($v1)
/* 4F214 8004E614 94E20066 */  lhu        $v0, 0x66($a3)
/* 4F218 8004E618 00052C00 */  sll        $a1, $a1, 0x10
/* 4F21C 8004E61C A4620066 */  sh         $v0, 0x66($v1)
/* 4F220 8004E620 94E60068 */  lhu        $a2, 0x68($a3)
/* 4F224 8004E624 00052C03 */  sra        $a1, $a1, 0x10
/* 4F228 8004E628 A4660068 */  sh         $a2, 0x68($v1)
/* 4F22C 8004E62C 00063400 */  sll        $a2, $a2, 0x10
/* 4F230 8004E630 94E2006A */  lhu        $v0, 0x6a($a3)
/* 4F234 8004E634 00063403 */  sra        $a2, $a2, 0x10
/* 4F238 8004E638 0C02DD3F */  jal        set_widget_coords
/* 4F23C 8004E63C A462006A */   sh        $v0, 0x6a($v1)
/* 4F240 8004E640 8E240028 */  lw         $a0, 0x28($s1)
/* 4F244 8004E644 94850066 */  lhu        $a1, 0x66($a0)
/* 4F248 8004E648 94820064 */  lhu        $v0, 0x64($a0)
/* 4F24C 8004E64C 00A22823 */  subu       $a1, $a1, $v0
/* 4F250 8004E650 0C02DD42 */  jal        set_widgetHeight
/* 4F254 8004E654 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 4F258 8004E658 8E280028 */  lw         $t0, 0x28($s1)
/* 4F25C 8004E65C 240500C8 */  addiu      $a1, $zero, 0xc8
/* 4F260 8004E660 8D030078 */  lw         $v1, 0x78($t0)
/* 4F264 8004E664 240600B4 */  addiu      $a2, $zero, 0xb4
/* 4F268 8004E668 84640048 */  lh         $a0, 0x48($v1)
/* 4F26C 8004E66C 24070064 */  addiu      $a3, $zero, 0x64
/* 4F270 8004E670 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F274 8004E674 8C62004C */  lw         $v0, 0x4c($v1)
/* 4F278 8004E678 0040F809 */  jalr       $v0
/* 4F27C 8004E67C 01042021 */   addu      $a0, $t0, $a0
/* 4F280 8004E680 240500C8 */  addiu      $a1, $zero, 0xc8
/* 4F284 8004E684 240600B4 */  addiu      $a2, $zero, 0xb4
/* 4F288 8004E688 24070064 */  addiu      $a3, $zero, 0x64
/* 4F28C 8004E68C 24020032 */  addiu      $v0, $zero, 0x32
/* 4F290 8004E690 8E240028 */  lw         $a0, 0x28($s1)
/* 4F294 8004E694 2403002D */  addiu      $v1, $zero, 0x2d
/* 4F298 8004E698 AFA20014 */  sw         $v0, 0x14($sp)
/* 4F29C 8004E69C 24020019 */  addiu      $v0, $zero, 0x19
/* 4F2A0 8004E6A0 AFA30018 */  sw         $v1, 0x18($sp)
/* 4F2A4 8004E6A4 2403003F */  addiu      $v1, $zero, 0x3f
/* 4F2A8 8004E6A8 AFA2001C */  sw         $v0, 0x1c($sp)
/* 4F2AC 8004E6AC 24020018 */  addiu      $v0, $zero, 0x18
/* 4F2B0 8004E6B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F2B4 8004E6B4 AFA30020 */  sw         $v1, 0x20($sp)
/* 4F2B8 8004E6B8 0C02F085 */  jal        set_widgetSubstruct8
/* 4F2BC 8004E6BC AFA20024 */   sw        $v0, 0x24($sp)
/* 4F2C0 8004E6C0 8E220028 */  lw         $v0, 0x28($s1)
/* 4F2C4 8004E6C4 8C440040 */  lw         $a0, 0x40($v0)
/* 4F2C8 8004E6C8 24030004 */  addiu      $v1, $zero, 4
/* 4F2CC 8004E6CC A0830022 */  sb         $v1, 0x22($a0)
/* 4F2D0 8004E6D0 8FBF0030 */  lw         $ra, 0x30($sp)
.L8004E6D4:
/* 4F2D4 8004E6D4 8FB1002C */  lw         $s1, 0x2c($sp)
/* 4F2D8 8004E6D8 8FB00028 */  lw         $s0, 0x28($sp)
/* 4F2DC 8004E6DC 03E00008 */  jr         $ra
/* 4F2E0 8004E6E0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8004E6E4
/* 4F2E4 8004E6E4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4F2E8 8004E6E8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F2EC 8004E6EC 00808021 */  addu       $s0, $a0, $zero
/* 4F2F0 8004E6F0 AFB10014 */  sw         $s1, 0x14($sp)
/* 4F2F4 8004E6F4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4F2F8 8004E6F8 0C013861 */  jal        supermenuclasses_free
/* 4F2FC 8004E6FC 00A08821 */   addu      $s1, $a1, $zero
/* 4F300 8004E700 8E020000 */  lw         $v0, ($s0)
/* 4F304 8004E704 54400001 */  bnel       $v0, $zero, .L8004E70C
/* 4F308 8004E708 AC40006C */   sw        $zero, 0x6c($v0)
.L8004E70C:
/* 4F30C 8004E70C 8E02000C */  lw         $v0, 0xc($s0)
/* 4F310 8004E710 54400001 */  bnel       $v0, $zero, .L8004E718
/* 4F314 8004E714 AC40006C */   sw        $zero, 0x6c($v0)
.L8004E718:
/* 4F318 8004E718 8E020018 */  lw         $v0, 0x18($s0)
/* 4F31C 8004E71C 54400001 */  bnel       $v0, $zero, .L8004E724
/* 4F320 8004E720 AC40006C */   sw        $zero, 0x6c($v0)
.L8004E724:
/* 4F324 8004E724 8E020008 */  lw         $v0, 8($s0)
/* 4F328 8004E728 54400001 */  bnel       $v0, $zero, .L8004E730
/* 4F32C 8004E72C AC40006C */   sw        $zero, 0x6c($v0)
.L8004E730:
/* 4F330 8004E730 32220001 */  andi       $v0, $s1, 1
/* 4F334 8004E734 10400004 */  beqz       $v0, .L8004E748
/* 4F338 8004E738 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4F33C 8004E73C 0C026262 */  jal        passToFree
/* 4F340 8004E740 02002021 */   addu      $a0, $s0, $zero
/* 4F344 8004E744 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004E748:
/* 4F348 8004E748 8FB10014 */  lw         $s1, 0x14($sp)
/* 4F34C 8004E74C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4F350 8004E750 03E00008 */  jr         $ra
/* 4F354 8004E754 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004E758
/* 4F358 8004E758 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 4F35C 8004E75C AFB00038 */  sw         $s0, 0x38($sp)
/* 4F360 8004E760 00808021 */  addu       $s0, $a0, $zero
/* 4F364 8004E764 00002021 */  addu       $a0, $zero, $zero
/* 4F368 8004E768 AFB1003C */  sw         $s1, 0x3c($sp)
/* 4F36C 8004E76C 30B100FF */  andi       $s1, $a1, 0xff
/* 4F370 8004E770 00002821 */  addu       $a1, $zero, $zero
/* 4F374 8004E774 00003021 */  addu       $a2, $zero, $zero
/* 4F378 8004E778 00003821 */  addu       $a3, $zero, $zero
/* 4F37C 8004E77C 24020140 */  addiu      $v0, $zero, 0x140
/* 4F380 8004E780 240300F0 */  addiu      $v1, $zero, 0xf0
/* 4F384 8004E784 AFBF0040 */  sw         $ra, 0x40($sp)
/* 4F388 8004E788 AFA20010 */  sw         $v0, 0x10($sp)
/* 4F38C 8004E78C 0C013349 */  jal        make_borg8_widget
/* 4F390 8004E790 AFA30014 */   sw        $v1, 0x14($sp)
/* 4F394 8004E794 AE02000C */  sw         $v0, 0xc($s0)
/* 4F398 8004E798 2402000C */  addiu      $v0, $zero, 0xc
/* 4F39C 8004E79C 12220006 */  beq        $s1, $v0, .L8004E7B8
/* 4F3A0 8004E7A0 00001821 */   addu      $v1, $zero, $zero
/* 4F3A4 8004E7A4 2402000A */  addiu      $v0, $zero, 0xa
/* 4F3A8 8004E7A8 12220003 */  beq        $s1, $v0, .L8004E7B8
/* 4F3AC 8004E7AC 2402000B */   addiu     $v0, $zero, 0xb
/* 4F3B0 8004E7B0 16220002 */  bne        $s1, $v0, .L8004E7BC
/* 4F3B4 8004E7B4 00000000 */   nop
.L8004E7B8:
/* 4F3B8 8004E7B8 24030001 */  addiu      $v1, $zero, 1
.L8004E7BC:
/* 4F3BC 8004E7BC 54600028 */  bnel       $v1, $zero, .L8004E860
/* 4F3C0 8004E7C0 2404007C */   addiu     $a0, $zero, 0x7c
/* 4F3C4 8004E7C4 0C026259 */  jal        passToMalloc
/* 4F3C8 8004E7C8 2404007C */   addiu     $a0, $zero, 0x7c
/* 4F3CC 8004E7CC 00402021 */  addu       $a0, $v0, $zero
/* 4F3D0 8004E7D0 3C05800E */  lui        $a1, %hi(D_800DDAA4)
/* 4F3D4 8004E7D4 24A5DAA4 */  addiu      $a1, $a1, %lo(D_800DDAA4)
/* 4F3D8 8004E7D8 0C02E3A0 */  jal        widgettext_func_2
/* 4F3DC 8004E7DC 24060200 */   addiu     $a2, $zero, 0x200
/* 4F3E0 8004E7E0 24050067 */  addiu      $a1, $zero, 0x67
/* 4F3E4 8004E7E4 24060046 */  addiu      $a2, $zero, 0x46
/* 4F3E8 8004E7E8 8C490078 */  lw         $t1, 0x78($v0)
/* 4F3EC 8004E7EC 2407003C */  addiu      $a3, $zero, 0x3c
/* 4F3F0 8004E7F0 AE020020 */  sw         $v0, 0x20($s0)
/* 4F3F4 8004E7F4 85240048 */  lh         $a0, 0x48($t1)
/* 4F3F8 8004E7F8 240300FF */  addiu      $v1, $zero, 0xff
/* 4F3FC 8004E7FC AFA30010 */  sw         $v1, 0x10($sp)
/* 4F400 8004E800 8D28004C */  lw         $t0, 0x4c($t1)
/* 4F404 8004E804 0100F809 */  jalr       $t0
/* 4F408 8004E808 00442021 */   addu      $a0, $v0, $a0
/* 4F40C 8004E80C 24050040 */  addiu      $a1, $zero, 0x40
/* 4F410 8004E810 2406001E */  addiu      $a2, $zero, 0x1e
/* 4F414 8004E814 24070100 */  addiu      $a3, $zero, 0x100
/* 4F418 8004E818 8E040020 */  lw         $a0, 0x20($s0)
/* 4F41C 8004E81C 240200CD */  addiu      $v0, $zero, 0xcd
/* 4F420 8004E820 0C00193A */  jal        func_800064E8
/* 4F424 8004E824 AFA20010 */   sw        $v0, 0x10($sp)
/* 4F428 8004E828 24050040 */  addiu      $a1, $zero, 0x40
/* 4F42C 8004E82C 8E040020 */  lw         $a0, 0x20($s0)
/* 4F430 8004E830 0C02DD3F */  jal        set_widget_coords
/* 4F434 8004E834 2406001E */   addiu     $a2, $zero, 0x1e
/* 4F438 8004E838 24020040 */  addiu      $v0, $zero, 0x40
/* 4F43C 8004E83C 8E040020 */  lw         $a0, 0x20($s0)
/* 4F440 8004E840 24030004 */  addiu      $v1, $zero, 4
/* 4F444 8004E844 16230004 */  bne        $s1, $v1, .L8004E858
/* 4F448 8004E848 A4820064 */   sh        $v0, 0x64($a0)
/* 4F44C 8004E84C 94820066 */  lhu        $v0, 0x66($a0)
/* 4F450 8004E850 2442FFF0 */  addiu      $v0, $v0, -0x10
/* 4F454 8004E854 A4820066 */  sh         $v0, 0x66($a0)
.L8004E858:
/* 4F458 8004E858 08013A3D */  j          .L8004E8F4
/* 4F45C 8004E85C AE000024 */   sw        $zero, 0x24($s0)
.L8004E860:
/* 4F460 8004E860 0C026259 */  jal        passToMalloc
/* 4F464 8004E864 AE000020 */   sw        $zero, 0x20($s0)
/* 4F468 8004E868 00402021 */  addu       $a0, $v0, $zero
/* 4F46C 8004E86C 3C05800E */  lui        $a1, %hi(D_800DDAA4)
/* 4F470 8004E870 24A5DAA4 */  addiu      $a1, $a1, %lo(D_800DDAA4)
/* 4F474 8004E874 0C02E160 */  jal        widgetshadowtext_func_2
/* 4F478 8004E878 24060200 */   addiu     $a2, $zero, 0x200
/* 4F47C 8004E87C 00402021 */  addu       $a0, $v0, $zero
/* 4F480 8004E880 24050040 */  addiu      $a1, $zero, 0x40
/* 4F484 8004E884 2406001E */  addiu      $a2, $zero, 0x1e
/* 4F488 8004E888 24070100 */  addiu      $a3, $zero, 0x100
/* 4F48C 8004E88C AE020024 */  sw         $v0, 0x24($s0)
/* 4F490 8004E890 240200CD */  addiu      $v0, $zero, 0xcd
/* 4F494 8004E894 0C00193A */  jal        func_800064E8
/* 4F498 8004E898 AFA20010 */   sw        $v0, 0x10($sp)
/* 4F49C 8004E89C 8E040024 */  lw         $a0, 0x24($s0)
/* 4F4A0 8004E8A0 84850064 */  lh         $a1, 0x64($a0)
/* 4F4A4 8004E8A4 0C02EF52 */  jal        func_800BBD48
/* 4F4A8 8004E8A8 84860066 */   lh        $a2, 0x66($a0)
/* 4F4AC 8004E8AC 24050067 */  addiu      $a1, $zero, 0x67
/* 4F4B0 8004E8B0 8E090024 */  lw         $t1, 0x24($s0)
/* 4F4B4 8004E8B4 24060046 */  addiu      $a2, $zero, 0x46
/* 4F4B8 8004E8B8 8D280078 */  lw         $t0, 0x78($t1)
/* 4F4BC 8004E8BC 2407003C */  addiu      $a3, $zero, 0x3c
/* 4F4C0 8004E8C0 85040048 */  lh         $a0, 0x48($t0)
/* 4F4C4 8004E8C4 240200FF */  addiu      $v0, $zero, 0xff
/* 4F4C8 8004E8C8 AFA20010 */  sw         $v0, 0x10($sp)
/* 4F4CC 8004E8CC 8D03004C */  lw         $v1, 0x4c($t0)
/* 4F4D0 8004E8D0 0060F809 */  jalr       $v1
/* 4F4D4 8004E8D4 01242021 */   addu      $a0, $t1, $a0
/* 4F4D8 8004E8D8 24050040 */  addiu      $a1, $zero, 0x40
/* 4F4DC 8004E8DC 8E040024 */  lw         $a0, 0x24($s0)
/* 4F4E0 8004E8E0 0C02DD3F */  jal        set_widget_coords
/* 4F4E4 8004E8E4 2406001E */   addiu     $a2, $zero, 0x1e
/* 4F4E8 8004E8E8 8E030024 */  lw         $v1, 0x24($s0)
/* 4F4EC 8004E8EC 24020040 */  addiu      $v0, $zero, 0x40
/* 4F4F0 8004E8F0 A4620064 */  sh         $v0, 0x64($v1)
.L8004E8F4:
/* 4F4F4 8004E8F4 00002021 */  addu       $a0, $zero, $zero
/* 4F4F8 8004E8F8 24050009 */  addiu      $a1, $zero, 9
/* 4F4FC 8004E8FC 2406004B */  addiu      $a2, $zero, 0x4b
/* 4F500 8004E900 24070037 */  addiu      $a3, $zero, 0x37
/* 4F504 8004E904 2402004B */  addiu      $v0, $zero, 0x4b
/* 4F508 8004E908 24030037 */  addiu      $v1, $zero, 0x37
/* 4F50C 8004E90C AFA20010 */  sw         $v0, 0x10($sp)
/* 4F510 8004E910 24020100 */  addiu      $v0, $zero, 0x100
/* 4F514 8004E914 AFA30014 */  sw         $v1, 0x14($sp)
/* 4F518 8004E918 240300CD */  addiu      $v1, $zero, 0xcd
/* 4F51C 8004E91C AFA20018 */  sw         $v0, 0x18($sp)
/* 4F520 8004E920 24020067 */  addiu      $v0, $zero, 0x67
/* 4F524 8004E924 AFA3001C */  sw         $v1, 0x1c($sp)
/* 4F528 8004E928 24030046 */  addiu      $v1, $zero, 0x46
/* 4F52C 8004E92C AFA20020 */  sw         $v0, 0x20($sp)
/* 4F530 8004E930 2402003C */  addiu      $v0, $zero, 0x3c
/* 4F534 8004E934 AFA30024 */  sw         $v1, 0x24($sp)
/* 4F538 8004E938 240300FF */  addiu      $v1, $zero, 0xff
/* 4F53C 8004E93C AFA20028 */  sw         $v0, 0x28($sp)
/* 4F540 8004E940 AFA3002C */  sw         $v1, 0x2c($sp)
/* 4F544 8004E944 0C02F435 */  jal        widgetscrollmenu_init_2
/* 4F548 8004E948 AFA00030 */   sw        $zero, 0x30($sp)
/* 4F54C 8004E94C 8C430040 */  lw         $v1, 0x40($v0)
/* 4F550 8004E950 8FBF0040 */  lw         $ra, 0x40($sp)
/* 4F554 8004E954 8FB1003C */  lw         $s1, 0x3c($sp)
/* 4F558 8004E958 AE020028 */  sw         $v0, 0x28($s0)
/* 4F55C 8004E95C AE000000 */  sw         $zero, ($s0)
/* 4F560 8004E960 AE000008 */  sw         $zero, 8($s0)
/* 4F564 8004E964 AE000018 */  sw         $zero, 0x18($s0)
/* 4F568 8004E968 8FB00038 */  lw         $s0, 0x38($sp)
/* 4F56C 8004E96C 24020004 */  addiu      $v0, $zero, 4
/* 4F570 8004E970 A0620022 */  sb         $v0, 0x22($v1)
/* 4F574 8004E974 03E00008 */  jr         $ra
/* 4F578 8004E978 27BD0048 */   addiu     $sp, $sp, 0x48

glabel NOOP_8004e97c
/* 4F57C 8004E97C 03E00008 */  jr         $ra
/* 4F580 8004E980 00000000 */   nop

glabel init_some_Struct
/* 4F584 8004E984 00801021 */  addu       $v0, $a0, $zero
/* 4F588 8004E988 AC450010 */  sw         $a1, 0x10($v0)
/* 4F58C 8004E98C A0400000 */  sb         $zero, ($v0)
/* 4F590 8004E990 AC40001C */  sw         $zero, 0x1c($v0)
/* 4F594 8004E994 AC400008 */  sw         $zero, 8($v0)
/* 4F598 8004E998 AC400020 */  sw         $zero, 0x20($v0)
/* 4F59C 8004E99C AC400004 */  sw         $zero, 4($v0)
/* 4F5A0 8004E9A0 AC40000C */  sw         $zero, 0xc($v0)
/* 4F5A4 8004E9A4 03E00008 */  jr         $ra
/* 4F5A8 8004E9A8 AC400014 */   sw        $zero, 0x14($v0)

glabel StartDialoug
/* 4F5AC 8004E9AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4F5B0 8004E9B0 AFB10014 */  sw         $s1, 0x14($sp)
/* 4F5B4 8004E9B4 00808821 */  addu       $s1, $a0, $zero
/* 4F5B8 8004E9B8 30E700FF */  andi       $a3, $a3, 0xff
/* 4F5BC 8004E9BC AFBF001C */  sw         $ra, 0x1c($sp)
/* 4F5C0 8004E9C0 AFB20018 */  sw         $s2, 0x18($sp)
/* 4F5C4 8004E9C4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F5C8 8004E9C8 AE250014 */  sw         $a1, 0x14($s1)
/* 4F5CC 8004E9CC AE20000C */  sw         $zero, 0xc($s1)
/* 4F5D0 8004E9D0 10A00014 */  beqz       $a1, .L8004EA24
/* 4F5D4 8004E9D4 93B20033 */   lbu       $s2, 0x33($sp)
/* 4F5D8 8004E9D8 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 4F5DC 8004E9DC 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 4F5E0 8004E9E0 02002021 */  addu       $a0, $s0, $zero
/* 4F5E4 8004E9E4 3C05800E */  lui        $a1, %hi(D_800DDAA8)
/* 4F5E8 8004E9E8 24A5DAA8 */  addiu      $a1, $a1, %lo(D_800DDAA8)
/* 4F5EC 8004E9EC A2270024 */  sb         $a3, 0x24($s1)
/* 4F5F0 8004E9F0 AE20001C */  sw         $zero, 0x1c($s1)
/* 4F5F4 8004E9F4 AE200020 */  sw         $zero, 0x20($s1)
/* 4F5F8 8004E9F8 0C0333AC */  jal        sprintf
/* 4F5FC 8004E9FC AE260008 */   sw        $a2, 8($s1)
/* 4F600 8004EA00 0C00B6B8 */  jal        debug_queue
/* 4F604 8004EA04 02002021 */   addu      $a0, $s0, $zero
/* 4F608 8004EA08 8E240008 */  lw         $a0, 8($s1)
/* 4F60C 8004EA0C 8E250014 */  lw         $a1, 0x14($s1)
/* 4F610 8004EA10 0C02DB2E */  jal        func_800B6CB8
/* 4F614 8004EA14 00003021 */   addu      $a2, $zero, $zero
/* 4F618 8004EA18 8E220008 */  lw         $v0, 8($s1)
/* 4F61C 8004EA1C 54400003 */  bnel       $v0, $zero, .L8004EA2C
/* 4F620 8004EA20 90420111 */   lbu       $v0, 0x111($v0)
.L8004EA24:
/* 4F624 8004EA24 08013A9F */  j          .L8004EA7C
/* 4F628 8004EA28 00001021 */   addu      $v0, $zero, $zero
.L8004EA2C:
/* 4F62C 8004EA2C 14400013 */  bnez       $v0, .L8004EA7C
/* 4F630 8004EA30 00001021 */   addu      $v0, $zero, $zero
/* 4F634 8004EA34 02202021 */  addu       $a0, $s1, $zero
/* 4F638 8004EA38 0C013ADD */  jal        big_text_bg_func
/* 4F63C 8004EA3C 02402821 */   addu      $a1, $s2, $zero
/* 4F640 8004EA40 8E220020 */  lw         $v0, 0x20($s1)
/* 4F644 8004EA44 50400003 */  beql       $v0, $zero, .L8004EA54
/* 4F648 8004EA48 8E22000C */   lw        $v0, 0xc($s1)
/* 4F64C 8004EA4C 08013A89 */  j          .L8004EA24
/* 4F650 8004EA50 AE20000C */   sw        $zero, 0xc($s1)
.L8004EA54:
/* 4F654 8004EA54 14400005 */  bnez       $v0, .L8004EA6C
/* 4F658 8004EA58 24020001 */   addiu     $v0, $zero, 1
/* 4F65C 8004EA5C 8E240010 */  lw         $a0, 0x10($s1)
/* 4F660 8004EA60 8E250004 */  lw         $a1, 4($s1)
/* 4F664 8004EA64 0C02DC7C */  jal        widgetHandler
/* 4F668 8004EA68 AE22000C */   sw        $v0, 0xc($s1)
.L8004EA6C:
/* 4F66C 8004EA6C 0C0271BF */  jal        cont_delay
/* 4F670 8004EA70 00002021 */   addu      $a0, $zero, $zero
/* 4F674 8004EA74 0C013B32 */  jal        func_getting_alaron_portait
/* 4F678 8004EA78 02202021 */   addu      $a0, $s1, $zero
.L8004EA7C:
/* 4F67C 8004EA7C 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4F680 8004EA80 8FB20018 */  lw         $s2, 0x18($sp)
/* 4F684 8004EA84 8FB10014 */  lw         $s1, 0x14($sp)
/* 4F688 8004EA88 8FB00010 */  lw         $s0, 0x10($sp)
/* 4F68C 8004EA8C 03E00008 */  jr         $ra
/* 4F690 8004EA90 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004EA94
/* 4F694 8004EA94 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4F698 8004EA98 AFB00010 */  sw         $s0, 0x10($sp)
/* 4F69C 8004EA9C 00808021 */  addu       $s0, $a0, $zero
/* 4F6A0 8004EAA0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4F6A4 8004EAA4 AFB10014 */  sw         $s1, 0x14($sp)
/* 4F6A8 8004EAA8 8E020020 */  lw         $v0, 0x20($s0)
/* 4F6AC 8004EAAC 10400009 */  beqz       $v0, .L8004EAD4
/* 4F6B0 8004EAB0 00A08821 */   addu      $s1, $a1, $zero
/* 4F6B4 8004EAB4 3C02800E */  lui        $v0, %hi(debug_flag)
/* 4F6B8 8004EAB8 944368A0 */  lhu        $v1, %lo(debug_flag)($v0)
/* 4F6BC 8004EABC 10600028 */  beqz       $v1, .L8004EB60
/* 4F6C0 8004EAC0 00001021 */   addu      $v0, $zero, $zero
/* 4F6C4 8004EAC4 0C01618D */  jal        some_debug_func_3
/* 4F6C8 8004EAC8 00000000 */   nop
/* 4F6CC 8004EACC 08013AD8 */  j          .L8004EB60
/* 4F6D0 8004EAD0 00001021 */   addu      $v0, $zero, $zero
.L8004EAD4:
/* 4F6D4 8004EAD4 8E020008 */  lw         $v0, 8($s0)
/* 4F6D8 8004EAD8 10400021 */  beqz       $v0, .L8004EB60
/* 4F6DC 8004EADC 00001021 */   addu      $v0, $zero, $zero
/* 4F6E0 8004EAE0 0C013C6E */  jal        func_8004F1B8
/* 4F6E4 8004EAE4 02002021 */   addu      $a0, $s0, $zero
/* 4F6E8 8004EAE8 8E02001C */  lw         $v0, 0x1c($s0)
/* 4F6EC 8004EAEC 5440000D */  bnel       $v0, $zero, .L8004EB24
/* 4F6F0 8004EAF0 8E020008 */   lw        $v0, 8($s0)
/* 4F6F4 8004EAF4 8E040008 */  lw         $a0, 8($s0)
/* 4F6F8 8004EAF8 90830110 */  lbu        $v1, 0x110($a0)
/* 4F6FC 8004EAFC 240200FF */  addiu      $v0, $zero, 0xff
/* 4F700 8004EB00 10620005 */  beq        $v1, $v0, .L8004EB18
/* 4F704 8004EB04 8E050014 */   lw        $a1, 0x14($s0)
/* 4F708 8004EB08 0C02DB2E */  jal        func_800B6CB8
/* 4F70C 8004EB0C 00603021 */   addu      $a2, $v1, $zero
/* 4F710 8004EB10 08013AC9 */  j          .L8004EB24
/* 4F714 8004EB14 8E020008 */   lw        $v0, 8($s0)
.L8004EB18:
/* 4F718 8004EB18 0C02DB2E */  jal        func_800B6CB8
/* 4F71C 8004EB1C 9226005F */   lbu       $a2, 0x5f($s1)
/* 4F720 8004EB20 8E020008 */  lw         $v0, 8($s0)
.L8004EB24:
/* 4F724 8004EB24 54400003 */  bnel       $v0, $zero, .L8004EB34
/* 4F728 8004EB28 8E02000C */   lw        $v0, 0xc($s0)
/* 4F72C 8004EB2C 08013AD8 */  j          .L8004EB60
/* 4F730 8004EB30 00001021 */   addu      $v0, $zero, $zero
.L8004EB34:
/* 4F734 8004EB34 14400008 */  bnez       $v0, .L8004EB58
/* 4F738 8004EB38 00000000 */   nop
/* 4F73C 8004EB3C 8E020020 */  lw         $v0, 0x20($s0)
/* 4F740 8004EB40 14400005 */  bnez       $v0, .L8004EB58
/* 4F744 8004EB44 24020001 */   addiu     $v0, $zero, 1
/* 4F748 8004EB48 8E040010 */  lw         $a0, 0x10($s0)
/* 4F74C 8004EB4C 8E050004 */  lw         $a1, 4($s0)
/* 4F750 8004EB50 0C02DC7C */  jal        widgetHandler
/* 4F754 8004EB54 AE02000C */   sw        $v0, 0xc($s0)
.L8004EB58:
/* 4F758 8004EB58 0C013B32 */  jal        func_getting_alaron_portait
/* 4F75C 8004EB5C 02002021 */   addu      $a0, $s0, $zero
.L8004EB60:
/* 4F760 8004EB60 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4F764 8004EB64 8FB10014 */  lw         $s1, 0x14($sp)
/* 4F768 8004EB68 8FB00010 */  lw         $s0, 0x10($sp)
/* 4F76C 8004EB6C 03E00008 */  jr         $ra
/* 4F770 8004EB70 27BD0020 */   addiu     $sp, $sp, 0x20

glabel big_text_bg_func
/* 4F774 8004EB74 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4F778 8004EB78 AFB10014 */  sw         $s1, 0x14($sp)
/* 4F77C 8004EB7C 00808821 */  addu       $s1, $a0, $zero
/* 4F780 8004EB80 2404007C */  addiu      $a0, $zero, 0x7c
/* 4F784 8004EB84 AFB20018 */  sw         $s2, 0x18($sp)
/* 4F788 8004EB88 30B200FF */  andi       $s2, $a1, 0xff
/* 4F78C 8004EB8C AFBF001C */  sw         $ra, 0x1c($sp)
/* 4F790 8004EB90 0C026259 */  jal        passToMalloc
/* 4F794 8004EB94 AFB00010 */   sw        $s0, 0x10($sp)
/* 4F798 8004EB98 0C02E658 */  jal        widget_menu_build
/* 4F79C 8004EB9C 00402021 */   addu      $a0, $v0, $zero
/* 4F7A0 8004EBA0 2404002C */  addiu      $a0, $zero, 0x2c
/* 4F7A4 8004EBA4 0C026259 */  jal        passToMalloc
/* 4F7A8 8004EBA8 AE220004 */   sw        $v0, 4($s1)
/* 4F7AC 8004EBAC 00402021 */  addu       $a0, $v0, $zero
/* 4F7B0 8004EBB0 8E250010 */  lw         $a1, 0x10($s1)
/* 4F7B4 8004EBB4 92260024 */  lbu        $a2, 0x24($s1)
/* 4F7B8 8004EBB8 0C0138B0 */  jal        func_8004E2C0
/* 4F7BC 8004EBBC 02403821 */   addu      $a3, $s2, $zero
/* 4F7C0 8004EBC0 8E230004 */  lw         $v1, 4($s1)
/* 4F7C4 8004EBC4 00408021 */  addu       $s0, $v0, $zero
/* 4F7C8 8004EBC8 AC700040 */  sw         $s0, 0x40($v1)
/* 4F7CC 8004EBCC 92230024 */  lbu        $v1, 0x24($s1)
/* 4F7D0 8004EBD0 2C620005 */  sltiu      $v0, $v1, 5
/* 4F7D4 8004EBD4 1040000C */  beqz       $v0, .L8004EC08
/* 4F7D8 8004EBD8 3C02800E */   lui       $v0, %hi(D_800DDAB8)
/* 4F7DC 8004EBDC 2442DAB8 */  addiu      $v0, $v0, %lo(D_800DDAB8)
/* 4F7E0 8004EBE0 00031880 */  sll        $v1, $v1, 2
/* 4F7E4 8004EBE4 00621821 */  addu       $v1, $v1, $v0
/* 4F7E8 8004EBE8 8C640000 */  lw         $a0, ($v1)
/* 4F7EC 8004EBEC 00800008 */  jr         $a0
/* 4F7F0 8004EBF0 00000000 */   nop
/* 4F7F4 8004EBF4 02202021 */  addu       $a0, $s1, $zero
/* 4F7F8 8004EBF8 0C013CCB */  jal        make_big_text_BG
/* 4F7FC 8004EBFC 02402821 */   addu      $a1, $s2, $zero
/* 4F800 8004EC00 08013B2D */  j          .L8004ECB4
/* 4F804 8004EC04 8FBF001C */   lw        $ra, 0x1c($sp)
.L8004EC08:
/* 4F808 8004EC08 8E260004 */  lw         $a2, 4($s1)
/* 4F80C 8004EC0C 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F810 8004EC10 8E05000C */  lw         $a1, 0xc($s0)
/* 4F814 8004EC14 84640030 */  lh         $a0, 0x30($v1)
/* 4F818 8004EC18 8C620034 */  lw         $v0, 0x34($v1)
/* 4F81C 8004EC1C 0040F809 */  jalr       $v0
/* 4F820 8004EC20 00C42021 */   addu      $a0, $a2, $a0
/* 4F824 8004EC24 8E260004 */  lw         $a2, 4($s1)
/* 4F828 8004EC28 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F82C 8004EC2C 8E050018 */  lw         $a1, 0x18($s0)
/* 4F830 8004EC30 84640030 */  lh         $a0, 0x30($v1)
/* 4F834 8004EC34 8C620034 */  lw         $v0, 0x34($v1)
/* 4F838 8004EC38 0040F809 */  jalr       $v0
/* 4F83C 8004EC3C 00C42021 */   addu      $a0, $a2, $a0
/* 4F840 8004EC40 8E260004 */  lw         $a2, 4($s1)
/* 4F844 8004EC44 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F848 8004EC48 8E050000 */  lw         $a1, ($s0)
/* 4F84C 8004EC4C 84640030 */  lh         $a0, 0x30($v1)
/* 4F850 8004EC50 8C620034 */  lw         $v0, 0x34($v1)
/* 4F854 8004EC54 0040F809 */  jalr       $v0
/* 4F858 8004EC58 00C42021 */   addu      $a0, $a2, $a0
/* 4F85C 8004EC5C 8E260004 */  lw         $a2, 4($s1)
/* 4F860 8004EC60 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F864 8004EC64 8E050008 */  lw         $a1, 8($s0)
/* 4F868 8004EC68 84640030 */  lh         $a0, 0x30($v1)
/* 4F86C 8004EC6C 8C620034 */  lw         $v0, 0x34($v1)
/* 4F870 8004EC70 0040F809 */  jalr       $v0
/* 4F874 8004EC74 00C42021 */   addu      $a0, $a2, $a0
/* 4F878 8004EC78 8E260004 */  lw         $a2, 4($s1)
/* 4F87C 8004EC7C 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F880 8004EC80 8E050020 */  lw         $a1, 0x20($s0)
/* 4F884 8004EC84 84640030 */  lh         $a0, 0x30($v1)
/* 4F888 8004EC88 8C620034 */  lw         $v0, 0x34($v1)
/* 4F88C 8004EC8C 0040F809 */  jalr       $v0
/* 4F890 8004EC90 00C42021 */   addu      $a0, $a2, $a0
/* 4F894 8004EC94 8E260004 */  lw         $a2, 4($s1)
/* 4F898 8004EC98 8CC30078 */  lw         $v1, 0x78($a2)
/* 4F89C 8004EC9C 8E050028 */  lw         $a1, 0x28($s0)
/* 4F8A0 8004ECA0 84640030 */  lh         $a0, 0x30($v1)
/* 4F8A4 8004ECA4 8C620034 */  lw         $v0, 0x34($v1)
/* 4F8A8 8004ECA8 0040F809 */  jalr       $v0
/* 4F8AC 8004ECAC 00C42021 */   addu      $a0, $a2, $a0
/* 4F8B0 8004ECB0 8FBF001C */  lw         $ra, 0x1c($sp)
.L8004ECB4:
/* 4F8B4 8004ECB4 8FB20018 */  lw         $s2, 0x18($sp)
/* 4F8B8 8004ECB8 8FB10014 */  lw         $s1, 0x14($sp)
/* 4F8BC 8004ECBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 4F8C0 8004ECC0 03E00008 */  jr         $ra
/* 4F8C4 8004ECC4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_getting_alaron_portait
/* 4F8C8 8004ECC8 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 4F8CC 8004ECCC AFB60030 */  sw         $s6, 0x30($sp)
/* 4F8D0 8004ECD0 0000B021 */  addu       $s6, $zero, $zero
/* 4F8D4 8004ECD4 AFB30024 */  sw         $s3, 0x24($sp)
/* 4F8D8 8004ECD8 00809821 */  addu       $s3, $a0, $zero
/* 4F8DC 8004ECDC AFB00018 */  sw         $s0, 0x18($sp)
/* 4F8E0 8004ECE0 241000FF */  addiu      $s0, $zero, 0xff
/* 4F8E4 8004ECE4 AFBF003C */  sw         $ra, 0x3c($sp)
/* 4F8E8 8004ECE8 AFBE0038 */  sw         $fp, 0x38($sp)
/* 4F8EC 8004ECEC AFB70034 */  sw         $s7, 0x34($sp)
/* 4F8F0 8004ECF0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 4F8F4 8004ECF4 AFB40028 */  sw         $s4, 0x28($sp)
/* 4F8F8 8004ECF8 AFB20020 */  sw         $s2, 0x20($sp)
/* 4F8FC 8004ECFC AFB1001C */  sw         $s1, 0x1c($sp)
/* 4F900 8004ED00 8E620008 */  lw         $v0, 8($s3)
/* 4F904 8004ED04 8E630004 */  lw         $v1, 4($s3)
/* 4F908 8004ED08 9044000C */  lbu        $a0, 0xc($v0)
/* 4F90C 8004ED0C 14900003 */  bne        $a0, $s0, .L8004ED1C
/* 4F910 8004ED10 8C710040 */   lw        $s1, 0x40($v1)
/* 4F914 8004ED14 08013C4C */  j          .L8004F130
/* 4F918 8004ED18 00001021 */   addu      $v0, $zero, $zero
.L8004ED1C:
/* 4F91C 8004ED1C 92650024 */  lbu        $a1, 0x24($s3)
/* 4F920 8004ED20 0C01392A */  jal        func_8004E4A8
/* 4F924 8004ED24 02202021 */   addu      $a0, $s1, $zero
/* 4F928 8004ED28 92630024 */  lbu        $v1, 0x24($s3)
/* 4F92C 8004ED2C 2C620002 */  sltiu      $v0, $v1, 2
/* 4F930 8004ED30 54400005 */  bnel       $v0, $zero, .L8004ED48
/* 4F934 8004ED34 8E65001C */   lw        $a1, 0x1c($s3)
/* 4F938 8004ED38 24020003 */  addiu      $v0, $zero, 3
/* 4F93C 8004ED3C 146200DB */  bne        $v1, $v0, .L8004F0AC
/* 4F940 8004ED40 00000000 */   nop
/* 4F944 8004ED44 8E65001C */  lw         $a1, 0x1c($s3)
.L8004ED48:
/* 4F948 8004ED48 14A00022 */  bnez       $a1, .L8004EDD4
/* 4F94C 8004ED4C 3C03800F */   lui       $v1, 0x800f
/* 4F950 8004ED50 8E640008 */  lw         $a0, 8($s3)
/* 4F954 8004ED54 90820018 */  lbu        $v0, 0x18($a0)
/* 4F958 8004ED58 10500005 */  beq        $v0, $s0, .L8004ED70
/* 4F95C 8004ED5C 00000000 */   nop
/* 4F960 8004ED60 94830004 */  lhu        $v1, 4($a0)
/* 4F964 8004ED64 94820010 */  lhu        $v0, 0x10($a0)
/* 4F968 8004ED68 50620001 */  beql       $v1, $v0, .L8004ED70
/* 4F96C 8004ED6C 24160001 */   addiu     $s6, $zero, 1
.L8004ED70:
/* 4F970 8004ED70 14A00018 */  bnez       $a1, .L8004EDD4
/* 4F974 8004ED74 3C03800F */   lui       $v1, %hi(entity_info_array+0x764)
/* 4F978 8004ED78 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 4F97C 8004ED7C 8E630008 */  lw         $v1, 8($s3)
/* 4F980 8004ED80 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 4F984 8004ED84 0C01D531 */  jal        getEntityPortait
/* 4F988 8004ED88 94650004 */   lhu       $a1, %lo(entity_info_array+0x764)($v1)
/* 4F98C 8004ED8C 8E230020 */  lw         $v1, 0x20($s1)
/* 4F990 8004ED90 8E640008 */  lw         $a0, 8($s3)
/* 4F994 8004ED94 8C700040 */  lw         $s0, 0x40($v1)
/* 4F998 8004ED98 8C850008 */  lw         $a1, 8($a0)
/* 4F99C 8004ED9C 8E040000 */  lw         $a0, ($s0)
/* 4F9A0 8004EDA0 0C02626C */  jal        copy_string
/* 4F9A4 8004EDA4 00409021 */   addu      $s2, $v0, $zero
/* 4F9A8 8004EDA8 3C03800F */  lui        $v1, %hi(stat_display_byte)
/* 4F9AC 8004EDAC 906288DC */  lbu        $v0, %lo(stat_display_byte)($v1)
/* 4F9B0 8004EDB0 54400004 */  bnel       $v0, $zero, .L8004EDC4
/* 4F9B4 8004EDB4 8E620008 */   lw        $v0, 8($s3)
/* 4F9B8 8004EDB8 0C013E9F */  jal        look_for_dialouge_v_Num
/* 4F9BC 8004EDBC 8E040000 */   lw        $a0, ($s0)
/* 4F9C0 8004EDC0 8E620008 */  lw         $v0, 8($s3)
.L8004EDC4:
/* 4F9C4 8004EDC4 8E240020 */  lw         $a0, 0x20($s1)
/* 4F9C8 8004EDC8 9043000C */  lbu        $v1, 0xc($v0)
/* 4F9CC 8004EDCC 08013B81 */  j          .L8004EE04
/* 4F9D0 8004EDD0 A483005E */   sh        $v1, 0x5e($a0)
.L8004EDD4:
/* 4F9D4 8004EDD4 3C02800F */  lui        $v0, %hi(entityList+0x99)
/* 4F9D8 8004EDD8 90451449 */  lbu        $a1, %lo(entityList+0x99)($v0)
/* 4F9DC 8004EDDC 8C6413A0 */  lw         $a0, 0x13a0($v1)
/* 4F9E0 8004EDE0 0C01D531 */  jal        getEntityPortait
/* 4F9E4 8004EDE4 34A50200 */   ori       $a1, $a1, 0x200
/* 4F9E8 8004EDE8 8E240020 */  lw         $a0, 0x20($s1)
/* 4F9EC 8004EDEC 0C02EEBC */  jal        func_800BBAF0
/* 4F9F0 8004EDF0 00409021 */   addu      $s2, $v0, $zero
/* 4F9F4 8004EDF4 00402021 */  addu       $a0, $v0, $zero
/* 4F9F8 8004EDF8 3C05800E */  lui        $a1, %hi(D_800DDAA4)
/* 4F9FC 8004EDFC 0C02626C */  jal        copy_string
/* 4FA00 8004EE00 24A5DAA4 */   addiu     $a1, $a1, %lo(D_800DDAA4)
.L8004EE04:
/* 4FA04 8004EE04 0C013885 */  jal        supermenuclasses_func
/* 4FA08 8004EE08 02402021 */   addu      $a0, $s2, $zero
/* 4FA0C 8004EE0C 00402821 */  addu       $a1, $v0, $zero
/* 4FA10 8004EE10 8E240008 */  lw         $a0, 8($s1)
/* 4FA14 8004EE14 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 4FA18 8004EE18 00003021 */   addu      $a2, $zero, $zero
/* 4FA1C 8004EE1C 8E250000 */  lw         $a1, ($s1)
/* 4FA20 8004EE20 8CA30078 */  lw         $v1, 0x78($a1)
/* 4FA24 8004EE24 84640020 */  lh         $a0, 0x20($v1)
/* 4FA28 8004EE28 8C620024 */  lw         $v0, 0x24($v1)
/* 4FA2C 8004EE2C 0040F809 */  jalr       $v0
/* 4FA30 8004EE30 00A42021 */   addu      $a0, $a1, $a0
/* 4FA34 8004EE34 244200B4 */  addiu      $v0, $v0, 0xb4
/* 4FA38 8004EE38 8E630008 */  lw         $v1, 8($s3)
/* 4FA3C 8004EE3C 3050FFFF */  andi       $s0, $v0, 0xffff
/* 4FA40 8004EE40 90640018 */  lbu        $a0, 0x18($v1)
/* 4FA44 8004EE44 240200FF */  addiu      $v0, $zero, 0xff
/* 4FA48 8004EE48 10820003 */  beq        $a0, $v0, .L8004EE58
/* 4FA4C 8004EE4C 3C1E8005 */   lui       $fp, 0x8005
/* 4FA50 8004EE50 52C00006 */  beql       $s6, $zero, .L8004EE6C
/* 4FA54 8004EE54 24120001 */   addiu     $s2, $zero, 1
.L8004EE58:
/* 4FA58 8004EE58 8E62001C */  lw         $v0, 0x1c($s3)
/* 4FA5C 8004EE5C 1040003E */  beqz       $v0, .L8004EF58
/* 4FA60 8004EE60 3C17800E */   lui       $s7, 0x800e
/* 4FA64 8004EE64 24120001 */  addiu      $s2, $zero, 1
/* 4FA68 8004EE68 3C1E8005 */  lui        $fp, 0x8005
.L8004EE6C:
/* 4FA6C 8004EE6C 3C17800E */  lui        $s7, 0x800e
/* 4FA70 8004EE70 8E230020 */  lw         $v1, 0x20($s1)
/* 4FA74 8004EE74 8E240028 */  lw         $a0, 0x28($s1)
/* 4FA78 8004EE78 94620064 */  lhu        $v0, 0x64($v1)
/* 4FA7C 8004EE7C 8E630008 */  lw         $v1, 8($s3)
/* 4FA80 8004EE80 2442000A */  addiu      $v0, $v0, 0xa
/* 4FA84 8004EE84 A4820060 */  sh         $v0, 0x60($a0)
/* 4FA88 8004EE88 A4820064 */  sh         $v0, 0x64($a0)
/* 4FA8C 8004EE8C 90620018 */  lbu        $v0, 0x18($v1)
/* 4FA90 8004EE90 240400FF */  addiu      $a0, $zero, 0xff
/* 4FA94 8004EE94 1044001C */  beq        $v0, $a0, .L8004EF08
/* 4FA98 8004EE98 2614FFFC */   addiu     $s4, $s0, -4
/* 4FA9C 8004EE9C 241500FF */  addiu      $s5, $zero, 0xff
/* 4FAA0 8004EEA0 2410000C */  addiu      $s0, $zero, 0xc
.L8004EEA4:
/* 4FAA4 8004EEA4 0C026259 */  jal        passToMalloc
/* 4FAA8 8004EEA8 2404007C */   addiu     $a0, $zero, 0x7c
/* 4FAAC 8004EEAC 8E630008 */  lw         $v1, 8($s3)
/* 4FAB0 8004EEB0 00402021 */  addu       $a0, $v0, $zero
/* 4FAB4 8004EEB4 00701821 */  addu       $v1, $v1, $s0
/* 4FAB8 8004EEB8 8C650008 */  lw         $a1, 8($v1)
/* 4FABC 8004EEBC 0C02E3A0 */  jal        widgettext_func_2
/* 4FAC0 8004EEC0 24060190 */   addiu     $a2, $zero, 0x190
/* 4FAC4 8004EEC4 8E630008 */  lw         $v1, 8($s3)
/* 4FAC8 8004EEC8 00701821 */  addu       $v1, $v1, $s0
/* 4FACC 8004EECC 9066000C */  lbu        $a2, 0xc($v1)
/* 4FAD0 8004EED0 A052005C */  sb         $s2, 0x5c($v0)
/* 4FAD4 8004EED4 8E240028 */  lw         $a0, 0x28($s1)
/* 4FAD8 8004EED8 00402821 */  addu       $a1, $v0, $zero
/* 4FADC 8004EEDC 0C02E885 */  jal        link_widget_text
/* 4FAE0 8004EEE0 A446005E */   sh        $a2, 0x5e($v0)
/* 4FAE4 8004EEE4 8E630008 */  lw         $v1, 8($s3)
/* 4FAE8 8004EEE8 2610000C */  addiu      $s0, $s0, 0xc
/* 4FAEC 8004EEEC 00701821 */  addu       $v1, $v1, $s0
/* 4FAF0 8004EEF0 9062000C */  lbu        $v0, 0xc($v1)
/* 4FAF4 8004EEF4 10550004 */  beq        $v0, $s5, .L8004EF08
/* 4FAF8 8004EEF8 26520001 */   addiu     $s2, $s2, 1
/* 4FAFC 8004EEFC 2A420009 */  slti       $v0, $s2, 9
/* 4FB00 8004EF00 1440FFE8 */  bnez       $v0, .L8004EEA4
/* 4FB04 8004EF04 00000000 */   nop
.L8004EF08:
/* 4FB08 8004EF08 8E250028 */  lw         $a1, 0x28($s1)
/* 4FB0C 8004EF0C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4FB10 8004EF10 84640028 */  lh         $a0, 0x28($v1)
/* 4FB14 8004EF14 8C62002C */  lw         $v0, 0x2c($v1)
/* 4FB18 8004EF18 0040F809 */  jalr       $v0
/* 4FB1C 8004EF1C 00A42021 */   addu      $a0, $a1, $a0
/* 4FB20 8004EF20 8E240028 */  lw         $a0, 0x28($s1)
/* 4FB24 8004EF24 8C830078 */  lw         $v1, 0x78($a0)
/* 4FB28 8004EF28 A494006A */  sh         $s4, 0x6a($a0)
/* 4FB2C 8004EF2C 84650020 */  lh         $a1, 0x20($v1)
/* 4FB30 8004EF30 8C620024 */  lw         $v0, 0x24($v1)
/* 4FB34 8004EF34 0040F809 */  jalr       $v0
/* 4FB38 8004EF38 00852021 */   addu      $a0, $a0, $a1
/* 4FB3C 8004EF3C 02821023 */  subu       $v0, $s4, $v0
/* 4FB40 8004EF40 8E230028 */  lw         $v1, 0x28($s1)
/* 4FB44 8004EF44 8E64001C */  lw         $a0, 0x1c($s3)
/* 4FB48 8004EF48 3050FFFF */  andi       $s0, $v0, 0xffff
/* 4FB4C 8004EF4C A4700068 */  sh         $s0, 0x68($v1)
/* 4FB50 8004EF50 1480002F */  bnez       $a0, .L8004F010
/* 4FB54 8004EF54 A4700062 */   sh        $s0, 0x62($v1)
.L8004EF58:
/* 4FB58 8004EF58 8E240020 */  lw         $a0, 0x20($s1)
/* 4FB5C 8004EF5C 8C850078 */  lw         $a1, 0x78($a0)
/* 4FB60 8004EF60 2602FFFE */  addiu      $v0, $s0, -2
/* 4FB64 8004EF64 A482006A */  sh         $v0, 0x6a($a0)
/* 4FB68 8004EF68 84A30020 */  lh         $v1, 0x20($a1)
/* 4FB6C 8004EF6C 8CA20024 */  lw         $v0, 0x24($a1)
/* 4FB70 8004EF70 0040F809 */  jalr       $v0
/* 4FB74 8004EF74 00832021 */   addu      $a0, $a0, $v1
/* 4FB78 8004EF78 8E250020 */  lw         $a1, 0x20($s1)
/* 4FB7C 8004EF7C 94A3006A */  lhu        $v1, 0x6a($a1)
/* 4FB80 8004EF80 00621823 */  subu       $v1, $v1, $v0
/* 4FB84 8004EF84 2463FFFC */  addiu      $v1, $v1, -4
/* 4FB88 8004EF88 3070FFFF */  andi       $s0, $v1, 0xffff
/* 4FB8C 8004EF8C 2E0200B4 */  sltiu      $v0, $s0, 0xb4
/* 4FB90 8004EF90 50400001 */  beql       $v0, $zero, .L8004EF98
/* 4FB94 8004EF94 241000B4 */   addiu     $s0, $zero, 0xb4
.L8004EF98:
/* 4FB98 8004EF98 00A02021 */  addu       $a0, $a1, $zero
/* 4FB9C 8004EF9C 26060004 */  addiu      $a2, $s0, 4
/* 4FBA0 8004EFA0 A4A60068 */  sh         $a2, 0x68($a1)
/* 4FBA4 8004EFA4 00063400 */  sll        $a2, $a2, 0x10
/* 4FBA8 8004EFA8 84850064 */  lh         $a1, 0x64($a0)
/* 4FBAC 8004EFAC 0C02DD3F */  jal        set_widget_coords
/* 4FBB0 8004EFB0 00063403 */   sra       $a2, $a2, 0x10
/* 4FBB4 8004EFB4 8E270020 */  lw         $a3, 0x20($s1)
/* 4FBB8 8004EFB8 240500C8 */  addiu      $a1, $zero, 0xc8
/* 4FBBC 8004EFBC 8CE30078 */  lw         $v1, 0x78($a3)
/* 4FBC0 8004EFC0 240600C8 */  addiu      $a2, $zero, 0xc8
/* 4FBC4 8004EFC4 84640048 */  lh         $a0, 0x48($v1)
/* 4FBC8 8004EFC8 240200FF */  addiu      $v0, $zero, 0xff
/* 4FBCC 8004EFCC AFA20010 */  sw         $v0, 0x10($sp)
/* 4FBD0 8004EFD0 8C62004C */  lw         $v0, 0x4c($v1)
/* 4FBD4 8004EFD4 00E42021 */  addu       $a0, $a3, $a0
/* 4FBD8 8004EFD8 0040F809 */  jalr       $v0
/* 4FBDC 8004EFDC 240700C8 */   addiu     $a3, $zero, 0xc8
/* 4FBE0 8004EFE0 8E230020 */  lw         $v1, 0x20($s1)
/* 4FBE4 8004EFE4 24050014 */  addiu      $a1, $zero, 0x14
/* 4FBE8 8004EFE8 84660068 */  lh         $a2, 0x68($v1)
/* 4FBEC 8004EFEC 8E240000 */  lw         $a0, ($s1)
/* 4FBF0 8004EFF0 0C02DD3F */  jal        set_widget_coords
/* 4FBF4 8004EFF4 24C6FFFC */   addiu     $a2, $a2, -4
/* 4FBF8 8004EFF8 8E220000 */  lw         $v0, ($s1)
/* 4FBFC 8004EFFC 2405001A */  addiu      $a1, $zero, 0x1a
/* 4FC00 8004F000 84460062 */  lh         $a2, 0x62($v0)
/* 4FC04 8004F004 8E240008 */  lw         $a0, 8($s1)
/* 4FC08 8004F008 0C02DD3F */  jal        set_widget_coords
/* 4FC0C 8004F00C 24C60006 */   addiu     $a2, $a2, 6
.L8004F010:
/* 4FC10 8004F010 8E22000C */  lw         $v0, 0xc($s1)
/* 4FC14 8004F014 00402021 */  addu       $a0, $v0, $zero
/* 4FC18 8004F018 A4500068 */  sh         $s0, 0x68($v0)
/* 4FC1C 8004F01C 84850064 */  lh         $a1, 0x64($a0)
/* 4FC20 8004F020 0C02DD3F */  jal        set_widget_coords
/* 4FC24 8004F024 02003021 */   addu      $a2, $s0, $zero
/* 4FC28 8004F028 8E24000C */  lw         $a0, 0xc($s1)
/* 4FC2C 8004F02C 9485006A */  lhu        $a1, 0x6a($a0)
/* 4FC30 8004F030 94820068 */  lhu        $v0, 0x68($a0)
/* 4FC34 8004F034 00A22823 */  subu       $a1, $a1, $v0
/* 4FC38 8004F038 0C02DD46 */  jal        set_widgetWidth
/* 4FC3C 8004F03C 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 4FC40 8004F040 8E250018 */  lw         $a1, 0x18($s1)
/* 4FC44 8004F044 8CA30078 */  lw         $v1, 0x78($a1)
/* 4FC48 8004F048 84640020 */  lh         $a0, 0x20($v1)
/* 4FC4C 8004F04C 8C620024 */  lw         $v0, 0x24($v1)
/* 4FC50 8004F050 0040F809 */  jalr       $v0
/* 4FC54 8004F054 00A42021 */   addu      $a0, $a1, $a0
/* 4FC58 8004F058 8E23000C */  lw         $v1, 0xc($s1)
/* 4FC5C 8004F05C 8E240018 */  lw         $a0, 0x18($s1)
/* 4FC60 8004F060 84660062 */  lh         $a2, 0x62($v1)
/* 4FC64 8004F064 84650060 */  lh         $a1, 0x60($v1)
/* 4FC68 8004F068 0C02DD3F */  jal        set_widget_coords
/* 4FC6C 8004F06C 00C23023 */   subu      $a2, $a2, $v0
/* 4FC70 8004F070 8E25000C */  lw         $a1, 0xc($s1)
/* 4FC74 8004F074 8CA30078 */  lw         $v1, 0x78($a1)
/* 4FC78 8004F078 84640018 */  lh         $a0, 0x18($v1)
/* 4FC7C 8004F07C 8C62001C */  lw         $v0, 0x1c($v1)
/* 4FC80 8004F080 0040F809 */  jalr       $v0
/* 4FC84 8004F084 00A42021 */   addu      $a0, $a1, $a0
/* 4FC88 8004F088 8E240018 */  lw         $a0, 0x18($s1)
/* 4FC8C 8004F08C 0C02DD42 */  jal        set_widgetHeight
/* 4FC90 8004F090 00402821 */   addu      $a1, $v0, $zero
/* 4FC94 8004F094 12C00003 */  beqz       $s6, .L8004F0A4
/* 4FC98 8004F098 24020001 */   addiu     $v0, $zero, 1
/* 4FC9C 8004F09C 08013C2F */  j          .L8004F0BC
/* 4FCA0 8004F0A0 AE62001C */   sw        $v0, 0x1c($s3)
.L8004F0A4:
/* 4FCA4 8004F0A4 08013C2F */  j          .L8004F0BC
/* 4FCA8 8004F0A8 AE60001C */   sw        $zero, 0x1c($s3)
.L8004F0AC:
/* 4FCAC 8004F0AC 0C013E04 */  jal        func_8004F810
/* 4FCB0 8004F0B0 02602021 */   addu      $a0, $s3, $zero
/* 4FCB4 8004F0B4 3C1E8005 */  lui        $fp, 0x8005
/* 4FCB8 8004F0B8 3C17800E */  lui        $s7, %hi(debug_flag)
.L8004F0BC:
/* 4FCBC 8004F0BC 3C038005 */  lui        $v1, %hi(D_8004FC70)
/* 4FCC0 8004F0C0 8E650004 */  lw         $a1, 4($s3)
/* 4FCC4 8004F0C4 96E468A0 */  lhu        $a0, %lo(debug_flag)($s7)
/* 4FCC8 8004F0C8 2462FC70 */  addiu      $v0, $v1, %lo(D_8004FC70)
/* 4FCCC 8004F0CC ACA20008 */  sw         $v0, 8($a1)
/* 4FCD0 8004F0D0 3C028005 */  lui        $v0, %hi(D_8004FCC0)
/* 4FCD4 8004F0D4 2443FCC0 */  addiu      $v1, $v0, %lo(D_8004FCC0)
/* 4FCD8 8004F0D8 ACA3000C */  sw         $v1, 0xc($a1)
/* 4FCDC 8004F0DC 3C038005 */  lui        $v1, %hi(D_8004FBD0)
/* 4FCE0 8004F0E0 2462FBD0 */  addiu      $v0, $v1, %lo(D_8004FBD0)
/* 4FCE4 8004F0E4 27C3FC20 */  addiu      $v1, $fp, -0x3e0
/* 4FCE8 8004F0E8 ACA30014 */  sw         $v1, 0x14($a1)
/* 4FCEC 8004F0EC 3C038005 */  lui        $v1, %hi(D_8004FD10)
/* 4FCF0 8004F0F0 ACA20010 */  sw         $v0, 0x10($a1)
/* 4FCF4 8004F0F4 2462FD10 */  addiu      $v0, $v1, %lo(D_8004FD10)
/* 4FCF8 8004F0F8 10800004 */  beqz       $a0, .L8004F10C
/* 4FCFC 8004F0FC ACA20018 */   sw        $v0, 0x18($a1)
/* 4FD00 8004F100 3C028005 */  lui        $v0, %hi(some_debug_func)
/* 4FD04 8004F104 2442FD6C */  addiu      $v0, $v0, %lo(some_debug_func)
/* 4FD08 8004F108 ACA2001C */  sw         $v0, 0x1c($a1)
.L8004F10C:
/* 4FD0C 8004F10C 92630024 */  lbu        $v1, 0x24($s3)
/* 4FD10 8004F110 24020004 */  addiu      $v0, $zero, 4
/* 4FD14 8004F114 14620006 */  bne        $v1, $v0, .L8004F130
/* 4FD18 8004F118 24020001 */   addiu     $v0, $zero, 1
/* 4FD1C 8004F11C 3C028005 */  lui        $v0, %hi(D_8004FDA8)
/* 4FD20 8004F120 8E630004 */  lw         $v1, 4($s3)
/* 4FD24 8004F124 2442FDA8 */  addiu      $v0, $v0, %lo(D_8004FDA8)
/* 4FD28 8004F128 AC62001C */  sw         $v0, 0x1c($v1)
/* 4FD2C 8004F12C 24020001 */  addiu      $v0, $zero, 1
.L8004F130:
/* 4FD30 8004F130 8FBF003C */  lw         $ra, 0x3c($sp)
/* 4FD34 8004F134 8FBE0038 */  lw         $fp, 0x38($sp)
/* 4FD38 8004F138 8FB70034 */  lw         $s7, 0x34($sp)
/* 4FD3C 8004F13C 8FB60030 */  lw         $s6, 0x30($sp)
/* 4FD40 8004F140 8FB5002C */  lw         $s5, 0x2c($sp)
/* 4FD44 8004F144 8FB40028 */  lw         $s4, 0x28($sp)
/* 4FD48 8004F148 8FB30024 */  lw         $s3, 0x24($sp)
/* 4FD4C 8004F14C 8FB20020 */  lw         $s2, 0x20($sp)
/* 4FD50 8004F150 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4FD54 8004F154 8FB00018 */  lw         $s0, 0x18($sp)
/* 4FD58 8004F158 03E00008 */  jr         $ra
/* 4FD5C 8004F15C 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8004F160
/* 4FD60 8004F160 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4FD64 8004F164 AFB00010 */  sw         $s0, 0x10($sp)
/* 4FD68 8004F168 00808021 */  addu       $s0, $a0, $zero
/* 4FD6C 8004F16C AFBF0018 */  sw         $ra, 0x18($sp)
/* 4FD70 8004F170 AFB10014 */  sw         $s1, 0x14($sp)
/* 4FD74 8004F174 8E020004 */  lw         $v0, 4($s0)
/* 4FD78 8004F178 10400005 */  beqz       $v0, .L8004F190
/* 4FD7C 8004F17C 00A08821 */   addu      $s1, $a1, $zero
/* 4FD80 8004F180 0C013C6E */  jal        func_8004F1B8
/* 4FD84 8004F184 00000000 */   nop
/* 4FD88 8004F188 0C013C77 */  jal        func_8004F1DC
/* 4FD8C 8004F18C 02002021 */   addu      $a0, $s0, $zero
.L8004F190:
/* 4FD90 8004F190 32220001 */  andi       $v0, $s1, 1
/* 4FD94 8004F194 10400004 */  beqz       $v0, .L8004F1A8
/* 4FD98 8004F198 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4FD9C 8004F19C 0C026262 */  jal        passToFree
/* 4FDA0 8004F1A0 02002021 */   addu      $a0, $s0, $zero
/* 4FDA4 8004F1A4 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004F1A8:
/* 4FDA8 8004F1A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 4FDAC 8004F1AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 4FDB0 8004F1B0 03E00008 */  jr         $ra
/* 4FDB4 8004F1B4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004F1B8
/* 4FDB8 8004F1B8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4FDBC 8004F1BC AFBF0010 */  sw         $ra, 0x10($sp)
/* 4FDC0 8004F1C0 8C820004 */  lw         $v0, 4($a0)
/* 4FDC4 8004F1C4 8C430040 */  lw         $v1, 0x40($v0)
/* 4FDC8 8004F1C8 0C02F105 */  jal        func_800BC414
/* 4FDCC 8004F1CC 8C640028 */   lw        $a0, 0x28($v1)
/* 4FDD0 8004F1D0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4FDD4 8004F1D4 03E00008 */  jr         $ra
/* 4FDD8 8004F1D8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004F1DC
/* 4FDDC 8004F1DC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4FDE0 8004F1E0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4FDE4 8004F1E4 00808021 */  addu       $s0, $a0, $zero
/* 4FDE8 8004F1E8 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4FDEC 8004F1EC 8E040004 */  lw         $a0, 4($s0)
/* 4FDF0 8004F1F0 10800016 */  beqz       $a0, .L8004F24C
/* 4FDF4 8004F1F4 8FBF0014 */   lw        $ra, 0x14($sp)
/* 4FDF8 8004F1F8 8C840040 */  lw         $a0, 0x40($a0)
/* 4FDFC 8004F1FC 50800004 */  beql       $a0, $zero, .L8004F210
/* 4FE00 8004F200 8E040010 */   lw        $a0, 0x10($s0)
/* 4FE04 8004F204 0C0139B9 */  jal        func_8004E6E4
/* 4FE08 8004F208 24050003 */   addiu     $a1, $zero, 3
/* 4FE0C 8004F20C 8E040010 */  lw         $a0, 0x10($s0)
.L8004F210:
/* 4FE10 8004F210 0C02DCB3 */  jal        func_800B72CC
/* 4FE14 8004F214 8E050004 */   lw        $a1, 4($s0)
/* 4FE18 8004F218 8E060004 */  lw         $a2, 4($s0)
/* 4FE1C 8004F21C 10C00006 */  beqz       $a2, .L8004F238
/* 4FE20 8004F220 24050003 */   addiu     $a1, $zero, 3
/* 4FE24 8004F224 8CC20078 */  lw         $v0, 0x78($a2)
/* 4FE28 8004F228 84440008 */  lh         $a0, 8($v0)
/* 4FE2C 8004F22C 8C43000C */  lw         $v1, 0xc($v0)
/* 4FE30 8004F230 0060F809 */  jalr       $v1
/* 4FE34 8004F234 00C42021 */   addu      $a0, $a2, $a0
.L8004F238:
/* 4FE38 8004F238 24020001 */  addiu      $v0, $zero, 1
/* 4FE3C 8004F23C AE000004 */  sw         $zero, 4($s0)
/* 4FE40 8004F240 AE000008 */  sw         $zero, 8($s0)
/* 4FE44 8004F244 AE02000C */  sw         $v0, 0xc($s0)
/* 4FE48 8004F248 8FBF0014 */  lw         $ra, 0x14($sp)
.L8004F24C:
/* 4FE4C 8004F24C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4FE50 8004F250 03E00008 */  jr         $ra
/* 4FE54 8004F254 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004F258
/* 4FE58 8004F258 24020001 */  addiu      $v0, $zero, 1
/* 4FE5C 8004F25C 03E00008 */  jr         $ra
/* 4FE60 8004F260 AC820020 */   sw        $v0, 0x20($a0)

glabel func_8004F264
/* 4FE64 8004F264 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4FE68 8004F268 AFB00010 */  sw         $s0, 0x10($sp)
/* 4FE6C 8004F26C 00808021 */  addu       $s0, $a0, $zero
/* 4FE70 8004F270 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4FE74 8004F274 AFB10014 */  sw         $s1, 0x14($sp)
/* 4FE78 8004F278 8E020020 */  lw         $v0, 0x20($s0)
/* 4FE7C 8004F27C 10400026 */  beqz       $v0, .L8004F318
/* 4FE80 8004F280 00001021 */   addu      $v0, $zero, $zero
/* 4FE84 8004F284 8E040008 */  lw         $a0, 8($s0)
/* 4FE88 8004F288 10800024 */  beqz       $a0, .L8004F31C
/* 4FE8C 8004F28C 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4FE90 8004F290 8E050014 */  lw         $a1, 0x14($s0)
/* 4FE94 8004F294 10A00022 */  beqz       $a1, .L8004F320
/* 4FE98 8004F298 8FB10014 */   lw        $s1, 0x14($sp)
/* 4FE9C 8004F29C 90820111 */  lbu        $v0, 0x111($a0)
/* 4FEA0 8004F2A0 1440001F */  bnez       $v0, .L8004F320
/* 4FEA4 8004F2A4 00001021 */   addu      $v0, $zero, $zero
/* 4FEA8 8004F2A8 AE000020 */  sw         $zero, 0x20($s0)
/* 4FEAC 8004F2AC 90820110 */  lbu        $v0, 0x110($a0)
/* 4FEB0 8004F2B0 241100FF */  addiu      $s1, $zero, 0xff
/* 4FEB4 8004F2B4 10510019 */  beq        $v0, $s1, .L8004F31C
/* 4FEB8 8004F2B8 00001021 */   addu      $v0, $zero, $zero
/* 4FEBC 8004F2BC 0C02DB2E */  jal        func_800B6CB8
/* 4FEC0 8004F2C0 90860110 */   lbu       $a2, 0x110($a0)
/* 4FEC4 8004F2C4 8E020020 */  lw         $v0, 0x20($s0)
/* 4FEC8 8004F2C8 14400013 */  bnez       $v0, .L8004F318
/* 4FECC 8004F2CC 00001021 */   addu      $v0, $zero, $zero
/* 4FED0 8004F2D0 8E030008 */  lw         $v1, 8($s0)
/* 4FED4 8004F2D4 10600011 */  beqz       $v1, .L8004F31C
/* 4FED8 8004F2D8 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4FEDC 8004F2DC 90620111 */  lbu        $v0, 0x111($v1)
/* 4FEE0 8004F2E0 1440000E */  bnez       $v0, .L8004F31C
/* 4FEE4 8004F2E4 00001021 */   addu      $v0, $zero, $zero
/* 4FEE8 8004F2E8 8E02000C */  lw         $v0, 0xc($s0)
/* 4FEEC 8004F2EC 14400008 */  bnez       $v0, .L8004F310
/* 4FEF0 8004F2F0 00000000 */   nop
/* 4FEF4 8004F2F4 90620110 */  lbu        $v0, 0x110($v1)
/* 4FEF8 8004F2F8 14510005 */  bne        $v0, $s1, .L8004F310
/* 4FEFC 8004F2FC 24020001 */   addiu     $v0, $zero, 1
/* 4FF00 8004F300 8E040010 */  lw         $a0, 0x10($s0)
/* 4FF04 8004F304 8E050004 */  lw         $a1, 4($s0)
/* 4FF08 8004F308 0C02DC7C */  jal        widgetHandler
/* 4FF0C 8004F30C AE02000C */   sw        $v0, 0xc($s0)
.L8004F310:
/* 4FF10 8004F310 0C013B32 */  jal        func_getting_alaron_portait
/* 4FF14 8004F314 02002021 */   addu      $a0, $s0, $zero
.L8004F318:
/* 4FF18 8004F318 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004F31C:
/* 4FF1C 8004F31C 8FB10014 */  lw         $s1, 0x14($sp)
.L8004F320:
/* 4FF20 8004F320 8FB00010 */  lw         $s0, 0x10($sp)
/* 4FF24 8004F324 03E00008 */  jr         $ra
/* 4FF28 8004F328 27BD0020 */   addiu     $sp, $sp, 0x20

glabel make_big_text_BG
/* 4FF2C 8004F32C 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 4FF30 8004F330 AFB20030 */  sw         $s2, 0x30($sp)
/* 4FF34 8004F334 00809021 */  addu       $s2, $a0, $zero
/* 4FF38 8004F338 30A500FF */  andi       $a1, $a1, 0xff
/* 4FF3C 8004F33C AFBF0034 */  sw         $ra, 0x34($sp)
/* 4FF40 8004F340 AFB1002C */  sw         $s1, 0x2c($sp)
/* 4FF44 8004F344 AFB00028 */  sw         $s0, 0x28($sp)
/* 4FF48 8004F348 8E420004 */  lw         $v0, 4($s2)
/* 4FF4C 8004F34C 2CA3000D */  sltiu      $v1, $a1, 0xd
/* 4FF50 8004F350 10600105 */  beqz       $v1, .L8004F768
/* 4FF54 8004F354 8C510040 */   lw        $s1, 0x40($v0)
/* 4FF58 8004F358 3C02800E */  lui        $v0, %hi(D_800DDAD0)
/* 4FF5C 8004F35C 2442DAD0 */  addiu      $v0, $v0, %lo(D_800DDAD0)
/* 4FF60 8004F360 00051880 */  sll        $v1, $a1, 2
/* 4FF64 8004F364 00621821 */  addu       $v1, $v1, $v0
/* 4FF68 8004F368 8C640000 */  lw         $a0, ($v1)
/* 4FF6C 8004F36C 00800008 */  jr         $a0
/* 4FF70 8004F370 00000000 */   nop
/* 4FF74 8004F374 0C013885 */  jal        supermenuclasses_func
/* 4FF78 8004F378 24043606 */   addiu     $a0, $zero, 0x3606
/* 4FF7C 8004F37C 00402821 */  addu       $a1, $v0, $zero
/* 4FF80 8004F380 8E24000C */  lw         $a0, 0xc($s1)
/* 4FF84 8004F384 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 4FF88 8004F388 00003021 */   addu      $a2, $zero, $zero
/* 4FF8C 8004F38C 24050036 */  addiu      $a1, $zero, 0x36
/* 4FF90 8004F390 8E280020 */  lw         $t0, 0x20($s1)
/* 4FF94 8004F394 24060040 */  addiu      $a2, $zero, 0x40
/* 4FF98 8004F398 8D030078 */  lw         $v1, 0x78($t0)
/* 4FF9C 8004F39C 00003821 */  addu       $a3, $zero, $zero
/* 4FFA0 8004F3A0 84640048 */  lh         $a0, 0x48($v1)
/* 4FFA4 8004F3A4 241000FF */  addiu      $s0, $zero, 0xff
/* 4FFA8 8004F3A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4FFAC 8004F3AC 8C62004C */  lw         $v0, 0x4c($v1)
/* 4FFB0 8004F3B0 0040F809 */  jalr       $v0
/* 4FFB4 8004F3B4 01042021 */   addu      $a0, $t0, $a0
/* 4FFB8 8004F3B8 8E280028 */  lw         $t0, 0x28($s1)
/* 4FFBC 8004F3BC 24050036 */  addiu      $a1, $zero, 0x36
/* 4FFC0 8004F3C0 8D030078 */  lw         $v1, 0x78($t0)
/* 4FFC4 8004F3C4 24060040 */  addiu      $a2, $zero, 0x40
/* 4FFC8 8004F3C8 84640048 */  lh         $a0, 0x48($v1)
/* 4FFCC 8004F3CC 00003821 */  addu       $a3, $zero, $zero
/* 4FFD0 8004F3D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4FFD4 8004F3D4 8C62004C */  lw         $v0, 0x4c($v1)
/* 4FFD8 8004F3D8 0040F809 */  jalr       $v0
/* 4FFDC 8004F3DC 01042021 */   addu      $a0, $t0, $a0
/* 4FFE0 8004F3E0 00002821 */  addu       $a1, $zero, $zero
/* 4FFE4 8004F3E4 00003021 */  addu       $a2, $zero, $zero
/* 4FFE8 8004F3E8 240200BD */  addiu      $v0, $zero, 0xbd
/* 4FFEC 8004F3EC 24030063 */  addiu      $v1, $zero, 0x63
/* 4FFF0 8004F3F0 AFA20014 */  sw         $v0, 0x14($sp)
/* 4FFF4 8004F3F4 08013D52 */  j          .L8004F548
/* 4FFF8 8004F3F8 240200CD */   addiu     $v0, $zero, 0xcd
/* 4FFFC 8004F3FC 0C013885 */  jal        supermenuclasses_func
/* 50000 8004F400 24043603 */   addiu     $a0, $zero, 0x3603
/* 50004 8004F404 00402821 */  addu       $a1, $v0, $zero
/* 50008 8004F408 8E24000C */  lw         $a0, 0xc($s1)
/* 5000C 8004F40C 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 50010 8004F410 00003021 */   addu      $a2, $zero, $zero
/* 50014 8004F414 00002821 */  addu       $a1, $zero, $zero
/* 50018 8004F418 8E280020 */  lw         $t0, 0x20($s1)
/* 5001C 8004F41C 24060029 */  addiu      $a2, $zero, 0x29
/* 50020 8004F420 8D030078 */  lw         $v1, 0x78($t0)
/* 50024 8004F424 24070044 */  addiu      $a3, $zero, 0x44
/* 50028 8004F428 84640048 */  lh         $a0, 0x48($v1)
/* 5002C 8004F42C 241000FF */  addiu      $s0, $zero, 0xff
/* 50030 8004F430 AFB00010 */  sw         $s0, 0x10($sp)
/* 50034 8004F434 8C62004C */  lw         $v0, 0x4c($v1)
/* 50038 8004F438 0040F809 */  jalr       $v0
/* 5003C 8004F43C 01042021 */   addu      $a0, $t0, $a0
/* 50040 8004F440 8E280028 */  lw         $t0, 0x28($s1)
/* 50044 8004F444 00002821 */  addu       $a1, $zero, $zero
/* 50048 8004F448 8D030078 */  lw         $v1, 0x78($t0)
/* 5004C 8004F44C 24060029 */  addiu      $a2, $zero, 0x29
/* 50050 8004F450 84640048 */  lh         $a0, 0x48($v1)
/* 50054 8004F454 24070044 */  addiu      $a3, $zero, 0x44
/* 50058 8004F458 AFB00010 */  sw         $s0, 0x10($sp)
/* 5005C 8004F45C 8C62004C */  lw         $v0, 0x4c($v1)
/* 50060 8004F460 0040F809 */  jalr       $v0
/* 50064 8004F464 01042021 */   addu      $a0, $t0, $a0
/* 50068 8004F468 00002821 */  addu       $a1, $zero, $zero
/* 5006C 8004F46C 00003021 */  addu       $a2, $zero, $zero
/* 50070 8004F470 240200AD */  addiu      $v0, $zero, 0xad
/* 50074 8004F474 240300A2 */  addiu      $v1, $zero, 0xa2
/* 50078 8004F478 AFA20014 */  sw         $v0, 0x14($sp)
/* 5007C 8004F47C 08013D52 */  j          .L8004F548
/* 50080 8004F480 24020033 */   addiu     $v0, $zero, 0x33
/* 50084 8004F484 08013DD2 */  j          .L8004F748
/* 50088 8004F488 24043605 */   addiu     $a0, $zero, 0x3605
/* 5008C 8004F48C 08013DD2 */  j          .L8004F748
/* 50090 8004F490 24043608 */   addiu     $a0, $zero, 0x3608
/* 50094 8004F494 0C013885 */  jal        supermenuclasses_func
/* 50098 8004F498 24043604 */   addiu     $a0, $zero, 0x3604
/* 5009C 8004F49C 00402821 */  addu       $a1, $v0, $zero
/* 500A0 8004F4A0 8E24000C */  lw         $a0, 0xc($s1)
/* 500A4 8004F4A4 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 500A8 8004F4A8 00003021 */   addu      $a2, $zero, $zero
/* 500AC 8004F4AC 24050041 */  addiu      $a1, $zero, 0x41
/* 500B0 8004F4B0 8E280024 */  lw         $t0, 0x24($s1)
/* 500B4 8004F4B4 2406001B */  addiu      $a2, $zero, 0x1b
/* 500B8 8004F4B8 8D030078 */  lw         $v1, 0x78($t0)
/* 500BC 8004F4BC 00003821 */  addu       $a3, $zero, $zero
/* 500C0 8004F4C0 84640048 */  lh         $a0, 0x48($v1)
/* 500C4 8004F4C4 241000FF */  addiu      $s0, $zero, 0xff
/* 500C8 8004F4C8 AFB00010 */  sw         $s0, 0x10($sp)
/* 500CC 8004F4CC 8C62004C */  lw         $v0, 0x4c($v1)
/* 500D0 8004F4D0 0040F809 */  jalr       $v0
/* 500D4 8004F4D4 01042021 */   addu      $a0, $t0, $a0
/* 500D8 8004F4D8 8E280028 */  lw         $t0, 0x28($s1)
/* 500DC 8004F4DC 24050041 */  addiu      $a1, $zero, 0x41
/* 500E0 8004F4E0 8D030078 */  lw         $v1, 0x78($t0)
/* 500E4 8004F4E4 2406001B */  addiu      $a2, $zero, 0x1b
/* 500E8 8004F4E8 84640048 */  lh         $a0, 0x48($v1)
/* 500EC 8004F4EC 00003821 */  addu       $a3, $zero, $zero
/* 500F0 8004F4F0 AFB00010 */  sw         $s0, 0x10($sp)
/* 500F4 8004F4F4 8C62004C */  lw         $v0, 0x4c($v1)
/* 500F8 8004F4F8 0040F809 */  jalr       $v0
/* 500FC 8004F4FC 01042021 */   addu      $a0, $t0, $a0
/* 50100 8004F500 00002821 */  addu       $a1, $zero, $zero
/* 50104 8004F504 00003021 */  addu       $a2, $zero, $zero
/* 50108 8004F508 8E230024 */  lw         $v1, 0x24($s1)
/* 5010C 8004F50C 24020001 */  addiu      $v0, $zero, 1
/* 50110 8004F510 8C640040 */  lw         $a0, 0x40($v1)
/* 50114 8004F514 240300A6 */  addiu      $v1, $zero, 0xa6
/* 50118 8004F518 A4820014 */  sh         $v0, 0x14($a0)
/* 5011C 8004F51C A4820016 */  sh         $v0, 0x16($a0)
/* 50120 8004F520 240200F2 */  addiu      $v0, $zero, 0xf2
/* 50124 8004F524 A0820019 */  sb         $v0, 0x19($a0)
/* 50128 8004F528 240200CC */  addiu      $v0, $zero, 0xcc
/* 5012C 8004F52C A082001B */  sb         $v0, 0x1b($a0)
/* 50130 8004F530 240200DC */  addiu      $v0, $zero, 0xdc
/* 50134 8004F534 A083001A */  sb         $v1, 0x1a($a0)
/* 50138 8004F538 24030080 */  addiu      $v1, $zero, 0x80
/* 5013C 8004F53C A0900018 */  sb         $s0, 0x18($a0)
/* 50140 8004F540 AFA20014 */  sw         $v0, 0x14($sp)
/* 50144 8004F544 2402001E */  addiu      $v0, $zero, 0x1e
.L8004F548:
/* 50148 8004F548 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5014C 8004F54C 24020014 */  addiu      $v0, $zero, 0x14
/* 50150 8004F550 AFB00010 */  sw         $s0, 0x10($sp)
/* 50154 8004F554 AFA30018 */  sw         $v1, 0x18($sp)
/* 50158 8004F558 AFB00020 */  sw         $s0, 0x20($sp)
/* 5015C 8004F55C AFA20024 */  sw         $v0, 0x24($sp)
/* 50160 8004F560 8E240028 */  lw         $a0, 0x28($s1)
/* 50164 8004F564 0C02F085 */  jal        set_widgetSubstruct8
/* 50168 8004F568 00003821 */   addu      $a3, $zero, $zero
/* 5016C 8004F56C 08013DE1 */  j          .L8004F784
/* 50170 8004F570 8E460004 */   lw        $a2, 4($s2)
/* 50174 8004F574 0C013885 */  jal        supermenuclasses_func
/* 50178 8004F578 24043602 */   addiu     $a0, $zero, 0x3602
/* 5017C 8004F57C 00402821 */  addu       $a1, $v0, $zero
/* 50180 8004F580 8E24000C */  lw         $a0, 0xc($s1)
/* 50184 8004F584 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 50188 8004F588 00003021 */   addu      $a2, $zero, $zero
/* 5018C 8004F58C 2405001E */  addiu      $a1, $zero, 0x1e
/* 50190 8004F590 8E280024 */  lw         $t0, 0x24($s1)
/* 50194 8004F594 2406001A */  addiu      $a2, $zero, 0x1a
/* 50198 8004F598 8D030078 */  lw         $v1, 0x78($t0)
/* 5019C 8004F59C 00003821 */  addu       $a3, $zero, $zero
/* 501A0 8004F5A0 84640048 */  lh         $a0, 0x48($v1)
/* 501A4 8004F5A4 241000FF */  addiu      $s0, $zero, 0xff
/* 501A8 8004F5A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 501AC 8004F5AC 8C62004C */  lw         $v0, 0x4c($v1)
/* 501B0 8004F5B0 0040F809 */  jalr       $v0
/* 501B4 8004F5B4 01042021 */   addu      $a0, $t0, $a0
/* 501B8 8004F5B8 8E280028 */  lw         $t0, 0x28($s1)
/* 501BC 8004F5BC 2405001E */  addiu      $a1, $zero, 0x1e
/* 501C0 8004F5C0 8D030078 */  lw         $v1, 0x78($t0)
/* 501C4 8004F5C4 2406001A */  addiu      $a2, $zero, 0x1a
/* 501C8 8004F5C8 84640048 */  lh         $a0, 0x48($v1)
/* 501CC 8004F5CC 00003821 */  addu       $a3, $zero, $zero
/* 501D0 8004F5D0 AFB00010 */  sw         $s0, 0x10($sp)
/* 501D4 8004F5D4 8C62004C */  lw         $v0, 0x4c($v1)
/* 501D8 8004F5D8 0040F809 */  jalr       $v0
/* 501DC 8004F5DC 01042021 */   addu      $a0, $t0, $a0
/* 501E0 8004F5E0 2405000E */  addiu      $a1, $zero, 0xe
/* 501E4 8004F5E4 00003021 */  addu       $a2, $zero, $zero
/* 501E8 8004F5E8 8E230024 */  lw         $v1, 0x24($s1)
/* 501EC 8004F5EC 24020001 */  addiu      $v0, $zero, 1
/* 501F0 8004F5F0 8C640040 */  lw         $a0, 0x40($v1)
/* 501F4 8004F5F4 2403FFFF */  addiu      $v1, $zero, -1
/* 501F8 8004F5F8 A4820014 */  sh         $v0, 0x14($a0)
/* 501FC 8004F5FC 240200D9 */  addiu      $v0, $zero, 0xd9
/* 50200 8004F600 A4830016 */  sh         $v1, 0x16($a0)
/* 50204 8004F604 240300D1 */  addiu      $v1, $zero, 0xd1
/* 50208 8004F608 A0820018 */  sb         $v0, 0x18($a0)
/* 5020C 8004F60C 240200CC */  addiu      $v0, $zero, 0xcc
/* 50210 8004F610 A0830019 */  sb         $v1, 0x19($a0)
/* 50214 8004F614 240300B1 */  addiu      $v1, $zero, 0xb1
/* 50218 8004F618 A083001B */  sb         $v1, 0x1b($a0)
/* 5021C 8004F61C 240300FE */  addiu      $v1, $zero, 0xfe
/* 50220 8004F620 A082001A */  sb         $v0, 0x1a($a0)
/* 50224 8004F624 240200DE */  addiu      $v0, $zero, 0xde
/* 50228 8004F628 AFA2001C */  sw         $v0, 0x1c($sp)
/* 5022C 8004F62C 24020014 */  addiu      $v0, $zero, 0x14
/* 50230 8004F630 AFB00010 */  sw         $s0, 0x10($sp)
/* 50234 8004F634 AFA30014 */  sw         $v1, 0x14($sp)
/* 50238 8004F638 AFA30018 */  sw         $v1, 0x18($sp)
/* 5023C 8004F63C AFB00020 */  sw         $s0, 0x20($sp)
/* 50240 8004F640 AFA20024 */  sw         $v0, 0x24($sp)
/* 50244 8004F644 8E240028 */  lw         $a0, 0x28($s1)
/* 50248 8004F648 0C02F085 */  jal        set_widgetSubstruct8
/* 5024C 8004F64C 2407003D */   addiu     $a3, $zero, 0x3d
/* 50250 8004F650 08013DE1 */  j          .L8004F784
/* 50254 8004F654 8E460004 */   lw        $a2, 4($s2)
/* 50258 8004F658 0C013885 */  jal        supermenuclasses_func
/* 5025C 8004F65C 24043607 */   addiu     $a0, $zero, 0x3607
/* 50260 8004F660 00402821 */  addu       $a1, $v0, $zero
/* 50264 8004F664 8E24000C */  lw         $a0, 0xc($s1)
/* 50268 8004F668 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 5026C 8004F66C 00003021 */   addu      $a2, $zero, $zero
/* 50270 8004F670 00002821 */  addu       $a1, $zero, $zero
/* 50274 8004F674 8E280024 */  lw         $t0, 0x24($s1)
/* 50278 8004F678 00003021 */  addu       $a2, $zero, $zero
/* 5027C 8004F67C 8D030078 */  lw         $v1, 0x78($t0)
/* 50280 8004F680 00003821 */  addu       $a3, $zero, $zero
/* 50284 8004F684 84640048 */  lh         $a0, 0x48($v1)
/* 50288 8004F688 241000FF */  addiu      $s0, $zero, 0xff
/* 5028C 8004F68C AFB00010 */  sw         $s0, 0x10($sp)
/* 50290 8004F690 8C62004C */  lw         $v0, 0x4c($v1)
/* 50294 8004F694 0040F809 */  jalr       $v0
/* 50298 8004F698 01042021 */   addu      $a0, $t0, $a0
/* 5029C 8004F69C 8E280028 */  lw         $t0, 0x28($s1)
/* 502A0 8004F6A0 00002821 */  addu       $a1, $zero, $zero
/* 502A4 8004F6A4 8D030078 */  lw         $v1, 0x78($t0)
/* 502A8 8004F6A8 00003021 */  addu       $a2, $zero, $zero
/* 502AC 8004F6AC 84640048 */  lh         $a0, 0x48($v1)
/* 502B0 8004F6B0 00003821 */  addu       $a3, $zero, $zero
/* 502B4 8004F6B4 AFB00010 */  sw         $s0, 0x10($sp)
/* 502B8 8004F6B8 8C62004C */  lw         $v0, 0x4c($v1)
/* 502BC 8004F6BC 0040F809 */  jalr       $v0
/* 502C0 8004F6C0 01042021 */   addu      $a0, $t0, $a0
/* 502C4 8004F6C4 24050085 */  addiu      $a1, $zero, 0x85
/* 502C8 8004F6C8 2406000D */  addiu      $a2, $zero, 0xd
/* 502CC 8004F6CC 8E220024 */  lw         $v0, 0x24($s1)
/* 502D0 8004F6D0 24030001 */  addiu      $v1, $zero, 1
/* 502D4 8004F6D4 8C440040 */  lw         $a0, 0x40($v0)
/* 502D8 8004F6D8 240200E6 */  addiu      $v0, $zero, 0xe6
/* 502DC 8004F6DC A4830014 */  sh         $v1, 0x14($a0)
/* 502E0 8004F6E0 A4830016 */  sh         $v1, 0x16($a0)
/* 502E4 8004F6E4 240300E1 */  addiu      $v1, $zero, 0xe1
/* 502E8 8004F6E8 A0820018 */  sb         $v0, 0x18($a0)
/* 502EC 8004F6EC 240200DD */  addiu      $v0, $zero, 0xdd
/* 502F0 8004F6F0 A0830019 */  sb         $v1, 0x19($a0)
/* 502F4 8004F6F4 240300B1 */  addiu      $v1, $zero, 0xb1
/* 502F8 8004F6F8 A082001A */  sb         $v0, 0x1a($a0)
/* 502FC 8004F6FC 240200E2 */  addiu      $v0, $zero, 0xe2
/* 50300 8004F700 A083001B */  sb         $v1, 0x1b($a0)
/* 50304 8004F704 24030090 */  addiu      $v1, $zero, 0x90
/* 50308 8004F708 AFA20014 */  sw         $v0, 0x14($sp)
/* 5030C 8004F70C 2402003F */  addiu      $v0, $zero, 0x3f
/* 50310 8004F710 AFA2001C */  sw         $v0, 0x1c($sp)
/* 50314 8004F714 24020014 */  addiu      $v0, $zero, 0x14
/* 50318 8004F718 AFB00010 */  sw         $s0, 0x10($sp)
/* 5031C 8004F71C AFA30018 */  sw         $v1, 0x18($sp)
/* 50320 8004F720 AFB00020 */  sw         $s0, 0x20($sp)
/* 50324 8004F724 AFA20024 */  sw         $v0, 0x24($sp)
/* 50328 8004F728 8E240028 */  lw         $a0, 0x28($s1)
/* 5032C 8004F72C 0C02F085 */  jal        set_widgetSubstruct8
/* 50330 8004F730 2407000D */   addiu     $a3, $zero, 0xd
/* 50334 8004F734 08013DE1 */  j          .L8004F784
/* 50338 8004F738 8E460004 */   lw        $a2, 4($s2)
/* 5033C 8004F73C 08013DD2 */  j          .L8004F748
/* 50340 8004F740 24043608 */   addiu     $a0, $zero, 0x3608
/* 50344 8004F744 24040182 */  addiu      $a0, $zero, 0x182
.L8004F748:
/* 50348 8004F748 0C013885 */  jal        supermenuclasses_func
/* 5034C 8004F74C 00000000 */   nop
/* 50350 8004F750 8E24000C */  lw         $a0, 0xc($s1)
/* 50354 8004F754 00402821 */  addu       $a1, $v0, $zero
/* 50358 8004F758 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 5035C 8004F75C 00003021 */   addu      $a2, $zero, $zero
/* 50360 8004F760 08013DE1 */  j          .L8004F784
/* 50364 8004F764 8E460004 */   lw        $a2, 4($s2)
.L8004F768:
/* 50368 8004F768 0C013885 */  jal        supermenuclasses_func
/* 5036C 8004F76C 24040182 */   addiu     $a0, $zero, 0x182
/* 50370 8004F770 8E24000C */  lw         $a0, 0xc($s1)
/* 50374 8004F774 00402821 */  addu       $a1, $v0, $zero
/* 50378 8004F778 0C02F12B */  jal        set_widget_heightWidth_borg8
/* 5037C 8004F77C 00003021 */   addu      $a2, $zero, $zero
/* 50380 8004F780 8E460004 */  lw         $a2, 4($s2)
.L8004F784:
/* 50384 8004F784 8CC30078 */  lw         $v1, 0x78($a2)
/* 50388 8004F788 8E25000C */  lw         $a1, 0xc($s1)
/* 5038C 8004F78C 84640030 */  lh         $a0, 0x30($v1)
/* 50390 8004F790 8C620034 */  lw         $v0, 0x34($v1)
/* 50394 8004F794 0040F809 */  jalr       $v0
/* 50398 8004F798 00C42021 */   addu      $a0, $a2, $a0
/* 5039C 8004F79C 8E250020 */  lw         $a1, 0x20($s1)
/* 503A0 8004F7A0 10A00008 */  beqz       $a1, .L8004F7C4
/* 503A4 8004F7A4 8E460004 */   lw        $a2, 4($s2)
/* 503A8 8004F7A8 8CC30078 */  lw         $v1, 0x78($a2)
/* 503AC 8004F7AC 84640030 */  lh         $a0, 0x30($v1)
/* 503B0 8004F7B0 8C620034 */  lw         $v0, 0x34($v1)
/* 503B4 8004F7B4 0040F809 */  jalr       $v0
/* 503B8 8004F7B8 00C42021 */   addu      $a0, $a2, $a0
/* 503BC 8004F7BC 08013DF8 */  j          .L8004F7E0
/* 503C0 8004F7C0 8E460004 */   lw        $a2, 4($s2)
.L8004F7C4:
/* 503C4 8004F7C4 8CC30078 */  lw         $v1, 0x78($a2)
/* 503C8 8004F7C8 8E250024 */  lw         $a1, 0x24($s1)
/* 503CC 8004F7CC 84640030 */  lh         $a0, 0x30($v1)
/* 503D0 8004F7D0 8C620034 */  lw         $v0, 0x34($v1)
/* 503D4 8004F7D4 0040F809 */  jalr       $v0
/* 503D8 8004F7D8 00C42021 */   addu      $a0, $a2, $a0
/* 503DC 8004F7DC 8E460004 */  lw         $a2, 4($s2)
.L8004F7E0:
/* 503E0 8004F7E0 8CC30078 */  lw         $v1, 0x78($a2)
/* 503E4 8004F7E4 8E250028 */  lw         $a1, 0x28($s1)
/* 503E8 8004F7E8 84640030 */  lh         $a0, 0x30($v1)
/* 503EC 8004F7EC 8C620034 */  lw         $v0, 0x34($v1)
/* 503F0 8004F7F0 0040F809 */  jalr       $v0
/* 503F4 8004F7F4 00C42021 */   addu      $a0, $a2, $a0
/* 503F8 8004F7F8 8FBF0034 */  lw         $ra, 0x34($sp)
/* 503FC 8004F7FC 8FB20030 */  lw         $s2, 0x30($sp)
/* 50400 8004F800 8FB1002C */  lw         $s1, 0x2c($sp)
/* 50404 8004F804 8FB00028 */  lw         $s0, 0x28($sp)
/* 50408 8004F808 03E00008 */  jr         $ra
/* 5040C 8004F80C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8004F810
/* 50410 8004F810 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 50414 8004F814 AFB50024 */  sw         $s5, 0x24($sp)
/* 50418 8004F818 3C15800E */  lui        $s5, 0x800e
/* 5041C 8004F81C AFB3001C */  sw         $s3, 0x1c($sp)
/* 50420 8004F820 00809821 */  addu       $s3, $a0, $zero
/* 50424 8004F824 240500FF */  addiu      $a1, $zero, 0xff
/* 50428 8004F828 AFBF0028 */  sw         $ra, 0x28($sp)
/* 5042C 8004F82C AFB40020 */  sw         $s4, 0x20($sp)
/* 50430 8004F830 AFB20018 */  sw         $s2, 0x18($sp)
/* 50434 8004F834 AFB10014 */  sw         $s1, 0x14($sp)
/* 50438 8004F838 AFB00010 */  sw         $s0, 0x10($sp)
/* 5043C 8004F83C 8E640008 */  lw         $a0, 8($s3)
/* 50440 8004F840 8E630004 */  lw         $v1, 4($s3)
/* 50444 8004F844 90820018 */  lbu        $v0, 0x18($a0)
/* 50448 8004F848 384200FF */  xori       $v0, $v0, 0xff
/* 5044C 8004F84C 10400044 */  beqz       $v0, .L8004F960
/* 50450 8004F850 8C710040 */   lw        $s1, 0x40($v1)
/* 50454 8004F854 90820018 */  lbu        $v0, 0x18($a0)
/* 50458 8004F858 10450041 */  beq        $v0, $a1, .L8004F960
/* 5045C 8004F85C 24140001 */   addiu     $s4, $zero, 1
/* 50460 8004F860 2412000C */  addiu      $s2, $zero, 0xc
/* 50464 8004F864 8E220020 */  lw         $v0, 0x20($s1)
.L8004F868:
/* 50468 8004F868 10400013 */  beqz       $v0, .L8004F8B8
/* 5046C 8004F86C 00000000 */   nop
/* 50470 8004F870 0C026259 */  jal        passToMalloc
/* 50474 8004F874 2404007C */   addiu     $a0, $zero, 0x7c
/* 50478 8004F878 8E630008 */  lw         $v1, 8($s3)
/* 5047C 8004F87C 00402021 */  addu       $a0, $v0, $zero
/* 50480 8004F880 00721821 */  addu       $v1, $v1, $s2
/* 50484 8004F884 8C650008 */  lw         $a1, 8($v1)
/* 50488 8004F888 0C02E3A0 */  jal        widgettext_func_2
/* 5048C 8004F88C 24060190 */   addiu     $a2, $zero, 0x190
/* 50490 8004F890 8E630008 */  lw         $v1, 8($s3)
/* 50494 8004F894 00721821 */  addu       $v1, $v1, $s2
/* 50498 8004F898 9066000C */  lbu        $a2, 0xc($v1)
/* 5049C 8004F89C A054005C */  sb         $s4, 0x5c($v0)
/* 504A0 8004F8A0 8E240028 */  lw         $a0, 0x28($s1)
/* 504A4 8004F8A4 00402821 */  addu       $a1, $v0, $zero
/* 504A8 8004F8A8 0C02E885 */  jal        link_widget_text
/* 504AC 8004F8AC A446005E */   sh        $a2, 0x5e($v0)
/* 504B0 8004F8B0 08013E4F */  j          .L8004F93C
/* 504B4 8004F8B4 2652000C */   addiu     $s2, $s2, 0xc
.L8004F8B8:
/* 504B8 8004F8B8 0C026259 */  jal        passToMalloc
/* 504BC 8004F8BC 2404007C */   addiu     $a0, $zero, 0x7c
/* 504C0 8004F8C0 8E630008 */  lw         $v1, 8($s3)
/* 504C4 8004F8C4 00402021 */  addu       $a0, $v0, $zero
/* 504C8 8004F8C8 00721821 */  addu       $v1, $v1, $s2
/* 504CC 8004F8CC 8C650008 */  lw         $a1, 8($v1)
/* 504D0 8004F8D0 0C02E160 */  jal        widgetshadowtext_func_2
/* 504D4 8004F8D4 24060190 */   addiu     $a2, $zero, 0x190
/* 504D8 8004F8D8 8E630008 */  lw         $v1, 8($s3)
/* 504DC 8004F8DC 00721821 */  addu       $v1, $v1, $s2
/* 504E0 8004F8E0 9066000C */  lbu        $a2, 0xc($v1)
/* 504E4 8004F8E4 00408021 */  addu       $s0, $v0, $zero
/* 504E8 8004F8E8 A214005C */  sb         $s4, 0x5c($s0)
/* 504EC 8004F8EC 8E240028 */  lw         $a0, 0x28($s1)
/* 504F0 8004F8F0 02002821 */  addu       $a1, $s0, $zero
/* 504F4 8004F8F4 0C02E885 */  jal        link_widget_text
/* 504F8 8004F8F8 A606005E */   sh        $a2, 0x5e($s0)
/* 504FC 8004F8FC 8E230024 */  lw         $v1, 0x24($s1)
/* 50500 8004F900 8C640040 */  lw         $a0, 0x40($v1)
/* 50504 8004F904 8E050040 */  lw         $a1, 0x40($s0)
/* 50508 8004F908 94820014 */  lhu        $v0, 0x14($a0)
/* 5050C 8004F90C A4A20014 */  sh         $v0, 0x14($a1)
/* 50510 8004F910 94830016 */  lhu        $v1, 0x16($a0)
/* 50514 8004F914 A4A30016 */  sh         $v1, 0x16($a1)
/* 50518 8004F918 90820018 */  lbu        $v0, 0x18($a0)
/* 5051C 8004F91C A0A20018 */  sb         $v0, 0x18($a1)
/* 50520 8004F920 90830019 */  lbu        $v1, 0x19($a0)
/* 50524 8004F924 A0A30019 */  sb         $v1, 0x19($a1)
/* 50528 8004F928 9082001A */  lbu        $v0, 0x1a($a0)
/* 5052C 8004F92C A0A2001A */  sb         $v0, 0x1a($a1)
/* 50530 8004F930 9083001B */  lbu        $v1, 0x1b($a0)
/* 50534 8004F934 A0A3001B */  sb         $v1, 0x1b($a1)
/* 50538 8004F938 2652000C */  addiu      $s2, $s2, 0xc
.L8004F93C:
/* 5053C 8004F93C 8E620008 */  lw         $v0, 8($s3)
/* 50540 8004F940 00521021 */  addu       $v0, $v0, $s2
/* 50544 8004F944 9044000C */  lbu        $a0, 0xc($v0)
/* 50548 8004F948 240300FF */  addiu      $v1, $zero, 0xff
/* 5054C 8004F94C 10830004 */  beq        $a0, $v1, .L8004F960
/* 50550 8004F950 26940001 */   addiu     $s4, $s4, 1
/* 50554 8004F954 2A820009 */  slti       $v0, $s4, 9
/* 50558 8004F958 5440FFC3 */  bnel       $v0, $zero, .L8004F868
/* 5055C 8004F95C 8E220020 */   lw        $v0, 0x20($s1)
.L8004F960:
/* 50560 8004F960 8E240020 */  lw         $a0, 0x20($s1)
/* 50564 8004F964 10800009 */  beqz       $a0, .L8004F98C
/* 50568 8004F968 00000000 */   nop
/* 5056C 8004F96C 0C02EEBC */  jal        func_800BBAF0
/* 50570 8004F970 00000000 */   nop
/* 50574 8004F974 8E630008 */  lw         $v1, 8($s3)
/* 50578 8004F978 8C650008 */  lw         $a1, 8($v1)
/* 5057C 8004F97C 0C02626C */  jal        copy_string
/* 50580 8004F980 00402021 */   addu      $a0, $v0, $zero
/* 50584 8004F984 08013E6A */  j          .L8004F9A8
/* 50588 8004F988 26A268A8 */   addiu     $v0, $s5, 0x68a8
.L8004F98C:
/* 5058C 8004F98C 0C02EEBC */  jal        func_800BBAF0
/* 50590 8004F990 8E240024 */   lw        $a0, 0x24($s1)
/* 50594 8004F994 8E630008 */  lw         $v1, 8($s3)
/* 50598 8004F998 8C650008 */  lw         $a1, 8($v1)
/* 5059C 8004F99C 0C02626C */  jal        copy_string
/* 505A0 8004F9A0 00402021 */   addu      $a0, $v0, $zero
/* 505A4 8004F9A4 26A268A8 */  addiu      $v0, $s5, 0x68a8
.L8004F9A8:
/* 505A8 8004F9A8 90432034 */  lbu        $v1, 0x2034($v0)
/* 505AC 8004F9AC 5460000F */  bnel       $v1, $zero, .L8004F9EC
/* 505B0 8004F9B0 8E260020 */   lw        $a2, 0x20($s1)
/* 505B4 8004F9B4 8E240020 */  lw         $a0, 0x20($s1)
/* 505B8 8004F9B8 10800007 */  beqz       $a0, .L8004F9D8
/* 505BC 8004F9BC 00000000 */   nop
/* 505C0 8004F9C0 0C02EEBC */  jal        func_800BBAF0
/* 505C4 8004F9C4 00000000 */   nop
/* 505C8 8004F9C8 0C013E9F */  jal        look_for_dialouge_v_Num
/* 505CC 8004F9CC 00402021 */   addu      $a0, $v0, $zero
/* 505D0 8004F9D0 08013E7B */  j          .L8004F9EC
/* 505D4 8004F9D4 8E260020 */   lw        $a2, 0x20($s1)
.L8004F9D8:
/* 505D8 8004F9D8 0C02EEBC */  jal        func_800BBAF0
/* 505DC 8004F9DC 8E240024 */   lw        $a0, 0x24($s1)
/* 505E0 8004F9E0 0C013E9F */  jal        look_for_dialouge_v_Num
/* 505E4 8004F9E4 00402021 */   addu      $a0, $v0, $zero
/* 505E8 8004F9E8 8E260020 */  lw         $a2, 0x20($s1)
.L8004F9EC:
/* 505EC 8004F9EC 10C0000A */  beqz       $a2, .L8004FA18
/* 505F0 8004F9F0 8E620008 */   lw        $v0, 8($s3)
/* 505F4 8004F9F4 8CC50078 */  lw         $a1, 0x78($a2)
/* 505F8 8004F9F8 9043000C */  lbu        $v1, 0xc($v0)
/* 505FC 8004F9FC A4C3005E */  sh         $v1, 0x5e($a2)
/* 50600 8004FA00 84A40020 */  lh         $a0, 0x20($a1)
/* 50604 8004FA04 8CA20024 */  lw         $v0, 0x24($a1)
/* 50608 8004FA08 0040F809 */  jalr       $v0
/* 5060C 8004FA0C 00C42021 */   addu      $a0, $a2, $a0
/* 50610 8004FA10 08013E8F */  j          .L8004FA3C
/* 50614 8004FA14 8E240020 */   lw        $a0, 0x20($s1)
.L8004FA18:
/* 50618 8004FA18 8E240024 */  lw         $a0, 0x24($s1)
/* 5061C 8004FA1C 9043000C */  lbu        $v1, 0xc($v0)
/* 50620 8004FA20 8C850078 */  lw         $a1, 0x78($a0)
/* 50624 8004FA24 A483005E */  sh         $v1, 0x5e($a0)
/* 50628 8004FA28 84A60020 */  lh         $a2, 0x20($a1)
/* 5062C 8004FA2C 8CA20024 */  lw         $v0, 0x24($a1)
/* 50630 8004FA30 0040F809 */  jalr       $v0
/* 50634 8004FA34 00862021 */   addu      $a0, $a0, $a2
/* 50638 8004FA38 8E240024 */  lw         $a0, 0x24($s1)
.L8004FA3C:
/* 5063C 8004FA3C 94830062 */  lhu        $v1, 0x62($a0)
/* 50640 8004FA40 00621821 */  addu       $v1, $v1, $v0
/* 50644 8004FA44 8E220028 */  lw         $v0, 0x28($s1)
/* 50648 8004FA48 24630004 */  addiu      $v1, $v1, 4
/* 5064C 8004FA4C A4430062 */  sh         $v1, 0x62($v0)
/* 50650 8004FA50 8FBF0028 */  lw         $ra, 0x28($sp)
/* 50654 8004FA54 8FB50024 */  lw         $s5, 0x24($sp)
/* 50658 8004FA58 8FB40020 */  lw         $s4, 0x20($sp)
/* 5065C 8004FA5C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 50660 8004FA60 8FB20018 */  lw         $s2, 0x18($sp)
/* 50664 8004FA64 8FB10014 */  lw         $s1, 0x14($sp)
/* 50668 8004FA68 8FB00010 */  lw         $s0, 0x10($sp)
/* 5066C 8004FA6C 03E00008 */  jr         $ra
/* 50670 8004FA70 27BD0030 */   addiu     $sp, $sp, 0x30

glabel ofunc_sub_dialouge
/* 50674 8004FA74 03E00008 */  jr         $ra
/* 50678 8004FA78 AC850014 */   sw        $a1, 0x14($a0)

glabel look_for_dialouge_v_Num
/* 5067C 8004FA7C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 50680 8004FA80 AFB10014 */  sw         $s1, 0x14($sp)
/* 50684 8004FA84 00008821 */  addu       $s1, $zero, $zero
/* 50688 8004FA88 AFB00010 */  sw         $s0, 0x10($sp)
/* 5068C 8004FA8C AFBF0018 */  sw         $ra, 0x18($sp)
/* 50690 8004FA90 0C03353E */  jal        strlen
/* 50694 8004FA94 00808021 */   addu      $s0, $a0, $zero
/* 50698 8004FA98 24480001 */  addiu      $t0, $v0, 1
/* 5069C 8004FA9C 92030000 */  lbu        $v1, ($s0)
/* 506A0 8004FAA0 24020020 */  addiu      $v0, $zero, 0x20
/* 506A4 8004FAA4 14620007 */  bne        $v1, $v0, .L8004FAC4
/* 506A8 8004FAA8 00002021 */   addu      $a0, $zero, $zero
/* 506AC 8004FAAC 24050020 */  addiu      $a1, $zero, 0x20
/* 506B0 8004FAB0 24840001 */  addiu      $a0, $a0, 1
.L8004FAB4:
/* 506B4 8004FAB4 02041021 */  addu       $v0, $s0, $a0
/* 506B8 8004FAB8 90430000 */  lbu        $v1, ($v0)
/* 506BC 8004FABC 5065FFFD */  beql       $v1, $a1, .L8004FAB4
/* 506C0 8004FAC0 24840001 */   addiu     $a0, $a0, 1
.L8004FAC4:
/* 506C4 8004FAC4 01043823 */  subu       $a3, $t0, $a0
/* 506C8 8004FAC8 18E00009 */  blez       $a3, .L8004FAF0
/* 506CC 8004FACC 00002821 */   addu      $a1, $zero, $zero
/* 506D0 8004FAD0 00903021 */  addu       $a2, $a0, $s0
.L8004FAD4:
/* 506D4 8004FAD4 90C40000 */  lbu        $a0, ($a2)
/* 506D8 8004FAD8 24C60001 */  addiu      $a2, $a2, 1
/* 506DC 8004FADC 02051821 */  addu       $v1, $s0, $a1
/* 506E0 8004FAE0 24A50001 */  addiu      $a1, $a1, 1
/* 506E4 8004FAE4 00A7102A */  slt        $v0, $a1, $a3
/* 506E8 8004FAE8 1440FFFA */  bnez       $v0, .L8004FAD4
/* 506EC 8004FAEC A0640000 */   sb        $a0, ($v1)
.L8004FAF0:
/* 506F0 8004FAF0 92030000 */  lbu        $v1, ($s0)
/* 506F4 8004FAF4 24020076 */  addiu      $v0, $zero, 0x76
/* 506F8 8004FAF8 10620003 */  beq        $v1, $v0, .L8004FB08
/* 506FC 8004FAFC 24020056 */   addiu     $v0, $zero, 0x56
/* 50700 8004FB00 1462000D */  bne        $v1, $v0, .L8004FB38
/* 50704 8004FB04 00000000 */   nop
.L8004FB08:
/* 50708 8004FB08 24040001 */  addiu      $a0, $zero, 1
/* 5070C 8004FB0C 02041821 */  addu       $v1, $s0, $a0
.L8004FB10:
/* 50710 8004FB10 90620000 */  lbu        $v0, ($v1)
/* 50714 8004FB14 2442FFD0 */  addiu      $v0, $v0, -0x30
/* 50718 8004FB18 2C42000A */  sltiu      $v0, $v0, 0xa
/* 5071C 8004FB1C 10400026 */  beqz       $v0, .L8004FBB8
/* 50720 8004FB20 8FBF0018 */   lw        $ra, 0x18($sp)
/* 50724 8004FB24 24840001 */  addiu      $a0, $a0, 1
/* 50728 8004FB28 28820005 */  slti       $v0, $a0, 5
/* 5072C 8004FB2C 1440FFF8 */  bnez       $v0, .L8004FB10
/* 50730 8004FB30 02041821 */   addu      $v1, $s0, $a0
/* 50734 8004FB34 24110001 */  addiu      $s1, $zero, 1
.L8004FB38:
/* 50738 8004FB38 12200009 */  beqz       $s1, .L8004FB60
/* 5073C 8004FB3C 2502FFFB */   addiu     $v0, $t0, -5
/* 50740 8004FB40 18400007 */  blez       $v0, .L8004FB60
/* 50744 8004FB44 02001821 */   addu      $v1, $s0, $zero
/* 50748 8004FB48 00402821 */  addu       $a1, $v0, $zero
.L8004FB4C:
/* 5074C 8004FB4C 90620005 */  lbu        $v0, 5($v1)
/* 50750 8004FB50 24A5FFFF */  addiu      $a1, $a1, -1
/* 50754 8004FB54 A0620000 */  sb         $v0, ($v1)
/* 50758 8004FB58 14A0FFFC */  bnez       $a1, .L8004FB4C
/* 5075C 8004FB5C 24630001 */   addiu     $v1, $v1, 1
.L8004FB60:
/* 50760 8004FB60 92030000 */  lbu        $v1, ($s0)
/* 50764 8004FB64 24020020 */  addiu      $v0, $zero, 0x20
/* 50768 8004FB68 14620007 */  bne        $v1, $v0, .L8004FB88
/* 5076C 8004FB6C 00002021 */   addu      $a0, $zero, $zero
/* 50770 8004FB70 24050020 */  addiu      $a1, $zero, 0x20
/* 50774 8004FB74 24840001 */  addiu      $a0, $a0, 1
.L8004FB78:
/* 50778 8004FB78 02041021 */  addu       $v0, $s0, $a0
/* 5077C 8004FB7C 90430000 */  lbu        $v1, ($v0)
/* 50780 8004FB80 5065FFFD */  beql       $v1, $a1, .L8004FB78
/* 50784 8004FB84 24840001 */   addiu     $a0, $a0, 1
.L8004FB88:
/* 50788 8004FB88 01043823 */  subu       $a3, $t0, $a0
/* 5078C 8004FB8C 18E00009 */  blez       $a3, .L8004FBB4
/* 50790 8004FB90 00002821 */   addu      $a1, $zero, $zero
/* 50794 8004FB94 00903021 */  addu       $a2, $a0, $s0
.L8004FB98:
/* 50798 8004FB98 90C40000 */  lbu        $a0, ($a2)
/* 5079C 8004FB9C 24C60001 */  addiu      $a2, $a2, 1
/* 507A0 8004FBA0 02051821 */  addu       $v1, $s0, $a1
/* 507A4 8004FBA4 24A50001 */  addiu      $a1, $a1, 1
/* 507A8 8004FBA8 00A7102A */  slt        $v0, $a1, $a3
/* 507AC 8004FBAC 1440FFFA */  bnez       $v0, .L8004FB98
/* 507B0 8004FBB0 A0640000 */   sb        $a0, ($v1)
.L8004FBB4:
/* 507B4 8004FBB4 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004FBB8:
/* 507B8 8004FBB8 8FB10014 */  lw         $s1, 0x14($sp)
/* 507BC 8004FBBC 8FB00010 */  lw         $s0, 0x10($sp)
/* 507C0 8004FBC0 03E00008 */  jr         $ra
/* 507C4 8004FBC4 27BD0020 */   addiu     $sp, $sp, 0x20
/* 507C8 8004FBC8 00000000 */  nop
/* 507CC 8004FBCC 00000000 */  nop
