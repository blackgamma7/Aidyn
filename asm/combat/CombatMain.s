.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel combat_gui_init
/* 8FF00 8008F300 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 8FF04 8008F304 AFB40020 */  sw         $s4, 0x20($sp)
/* 8FF08 8008F308 0000A021 */  addu       $s4, $zero, $zero
/* 8FF0C 8008F30C 2404007C */  addiu      $a0, $zero, 0x7c
/* 8FF10 8008F310 AFB20018 */  sw         $s2, 0x18($sp)
/* 8FF14 8008F314 00009021 */  addu       $s2, $zero, $zero
/* 8FF18 8008F318 AFB10014 */  sw         $s1, 0x14($sp)
/* 8FF1C 8008F31C 3C11800F */  lui        $s1, 0x800f
/* 8FF20 8008F320 AFB7002C */  sw         $s7, 0x2c($sp)
/* 8FF24 8008F324 0220B821 */  addu       $s7, $s1, $zero
/* 8FF28 8008F328 3C02800F */  lui        $v0, %hi(combatPointer)
/* 8FF2C 8008F32C 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 8FF30 8008F330 3C02800F */  lui        $v0, 0x800f
/* 8FF34 8008F334 AFB00010 */  sw         $s0, 0x10($sp)
/* 8FF38 8008F338 3C10800E */  lui        $s0, 0x800e
/* 8FF3C 8008F33C AFBF0030 */  sw         $ra, 0x30($sp)
/* 8FF40 8008F340 AFB60028 */  sw         $s6, 0x28($sp)
/* 8FF44 8008F344 AFB50024 */  sw         $s5, 0x24($sp)
/* 8FF48 8008F348 AFB3001C */  sw         $s3, 0x1c($sp)
/* 8FF4C 8008F34C 8C750028 */  lw         $s5, 0x28($v1)
/* 8FF50 8008F350 261068A8 */  addiu      $s0, $s0, 0x68a8
/* 8FF54 8008F354 A0401CD8 */  sb         $zero, 0x1cd8($v0)
/* 8FF58 8008F358 0C026259 */  jal        passToMalloc
/* 8FF5C 8008F35C 8E1315F8 */   lw        $s3, 0x15f8($s0)
/* 8FF60 8008F360 0C02E658 */  jal        widget_menu_build
/* 8FF64 8008F364 00402021 */   addu      $a0, $v0, $zero
/* 8FF68 8008F368 8E041604 */  lw         $a0, 0x1604($s0)
/* 8FF6C 8008F36C 00402821 */  addu       $a1, $v0, $zero
/* 8FF70 8008F370 0C02DC7C */  jal        widgetHandler
/* 8FF74 8008F374 AE22D504 */   sw        $v0, -0x2afc($s1)
/* 8FF78 8008F378 0C026259 */  jal        passToMalloc
/* 8FF7C 8008F37C 24040084 */   addiu     $a0, $zero, 0x84
/* 8FF80 8008F380 0C025D3C */  jal        make_combat_radar
/* 8FF84 8008F384 00402021 */   addu      $a0, $v0, $zero
/* 8FF88 8008F388 8E26D504 */  lw         $a2, -0x2afc($s1)
/* 8FF8C 8008F38C 3C16800F */  lui        $s6, 0x800f
/* 8FF90 8008F390 8CC30078 */  lw         $v1, 0x78($a2)
/* 8FF94 8008F394 00402821 */  addu       $a1, $v0, $zero
/* 8FF98 8008F398 84640030 */  lh         $a0, 0x30($v1)
/* 8FF9C 8008F39C 8C620034 */  lw         $v0, 0x34($v1)
/* 8FFA0 8008F3A0 0040F809 */  jalr       $v0
/* 8FFA4 8008F3A4 00C42021 */   addu      $a0, $a2, $a0
/* 8FFA8 8008F3A8 3C03800F */  lui        $v1, %hi(combat_gui_tally)
/* 8FFAC 8008F3AC 00608821 */  addu       $s1, $v1, $zero
/* 8FFB0 8008F3B0 92620024 */  lbu        $v0, 0x24($s3)
/* 8FFB4 8008F3B4 02202021 */  addu       $a0, $s1, $zero
/* 8FFB8 8008F3B8 24420002 */  addiu      $v0, $v0, 2
/* 8FFBC 8008F3BC A0621CC4 */  sb         $v0, %lo(combat_gui_tally)($v1)
/* 8FFC0 8008F3C0 00121040 */  sll        $v0, $s2, 1
.L8008F3C4:
/* 8FFC4 8008F3C4 02A21021 */  addu       $v0, $s5, $v0
/* 8FFC8 8008F3C8 94430000 */  lhu        $v1, ($v0)
/* 8FFCC 8008F3CC 10600005 */  beqz       $v1, .L8008F3E4
/* 8FFD0 8008F3D0 26830001 */   addiu     $v1, $s4, 1
/* 8FFD4 8008F3D4 90821CC4 */  lbu        $v0, 0x1cc4($a0)
/* 8FFD8 8008F3D8 3074FFFF */  andi       $s4, $v1, 0xffff
/* 8FFDC 8008F3DC 24420001 */  addiu      $v0, $v0, 1
/* 8FFE0 8008F3E0 A0821CC4 */  sb         $v0, 0x1cc4($a0)
.L8008F3E4:
/* 8FFE4 8008F3E4 26420001 */  addiu      $v0, $s2, 1
/* 8FFE8 8008F3E8 305200FF */  andi       $s2, $v0, 0xff
/* 8FFEC 8008F3EC 2E43000C */  sltiu      $v1, $s2, 0xc
/* 8FFF0 8008F3F0 1460FFF4 */  bnez       $v1, .L8008F3C4
/* 8FFF4 8008F3F4 00121040 */   sll       $v0, $s2, 1
/* 8FFF8 8008F3F8 3C05800E */  lui        $a1, %hi(D_800E19C0)
/* 8FFFC 8008F3FC 24A519C0 */  addiu      $a1, $a1, %lo(D_800E19C0)
/* 90000 8008F400 240600EC */  addiu      $a2, $zero, 0xec
/* 90004 8008F404 92221CC4 */  lbu        $v0, 0x1cc4($s1)
/* 90008 8008F408 00009021 */  addu       $s2, $zero, $zero
/* 9000C 8008F40C 00022040 */  sll        $a0, $v0, 1
/* 90010 8008F410 00822021 */  addu       $a0, $a0, $v0
/* 90014 8008F414 0C025F9C */  jal        Malloc
/* 90018 8008F418 000420C0 */   sll       $a0, $a0, 3
/* 9001C 8008F41C 8EE4D504 */  lw         $a0, -0x2afc($s7)
/* 90020 8008F420 3C10800F */  lui        $s0, 0x800f
/* 90024 8008F424 AEC21CC8 */  sw         $v0, 0x1cc8($s6)
/* 90028 8008F428 92660024 */  lbu        $a2, 0x24($s3)
/* 9002C 8008F42C 0C023F1D */  jal        combat_gui_init_2
/* 90030 8008F430 328500FF */   andi      $a1, $s4, 0xff
/* 90034 8008F434 00002821 */  addu       $a1, $zero, $zero
/* 90038 8008F438 92221CC4 */  lbu        $v0, 0x1cc4($s1)
/* 9003C 8008F43C 8EC41CC8 */  lw         $a0, 0x1cc8($s6)
/* 90040 8008F440 00023040 */  sll        $a2, $v0, 1
/* 90044 8008F444 00C23021 */  addu       $a2, $a2, $v0
/* 90048 8008F448 0C026380 */  jal        Calloc
/* 9004C 8008F44C 000630C0 */   sll       $a2, $a2, 3
/* 90050 8008F450 00121080 */  sll        $v0, $s2, 2
.L8008F454:
/* 90054 8008F454 02621021 */  addu       $v0, $s3, $v0
/* 90058 8008F458 8C420000 */  lw         $v0, ($v0)
/* 9005C 8008F45C 5040000F */  beql       $v0, $zero, .L8008F49C
/* 90060 8008F460 26420001 */   addiu     $v0, $s2, 1
/* 90064 8008F464 94450000 */  lhu        $a1, ($v0)
/* 90068 8008F468 10A0000B */  beqz       $a1, .L8008F498
/* 9006C 8008F46C 24070001 */   addiu     $a3, $zero, 1
/* 90070 8008F470 92061CD8 */  lbu        $a2, 0x1cd8($s0)
/* 90074 8008F474 8EC21CC8 */  lw         $v0, 0x1cc8($s6)
/* 90078 8008F478 00062040 */  sll        $a0, $a2, 1
/* 9007C 8008F47C 00862021 */  addu       $a0, $a0, $a2
/* 90080 8008F480 000420C0 */  sll        $a0, $a0, 3
/* 90084 8008F484 0C023EF9 */  jal        draw_portait_combat
/* 90088 8008F488 00442021 */   addu      $a0, $v0, $a0
/* 9008C 8008F48C 92021CD8 */  lbu        $v0, 0x1cd8($s0)
/* 90090 8008F490 24420001 */  addiu      $v0, $v0, 1
/* 90094 8008F494 A2021CD8 */  sb         $v0, 0x1cd8($s0)
.L8008F498:
/* 90098 8008F498 26420001 */  addiu      $v0, $s2, 1
.L8008F49C:
/* 9009C 8008F49C 305200FF */  andi       $s2, $v0, 0xff
/* 900A0 8008F4A0 2E430004 */  sltiu      $v1, $s2, 4
/* 900A4 8008F4A4 1460FFEB */  bnez       $v1, .L8008F454
/* 900A8 8008F4A8 00121080 */   sll       $v0, $s2, 2
/* 900AC 8008F4AC 00009021 */  addu       $s2, $zero, $zero
/* 900B0 8008F4B0 3C11800F */  lui        $s1, 0x800f
/* 900B4 8008F4B4 3C10800F */  lui        $s0, %hi(combat_gui_incrementer)
/* 900B8 8008F4B8 24130005 */  addiu      $s3, $zero, 5
.L8008F4BC:
/* 900BC 8008F4BC 00002821 */  addu       $a1, $zero, $zero
/* 900C0 8008F4C0 24070001 */  addiu      $a3, $zero, 1
/* 900C4 8008F4C4 92061CD8 */  lbu        $a2, %lo(combat_gui_incrementer)($s0)
/* 900C8 8008F4C8 8E221CC8 */  lw         $v0, 0x1cc8($s1)
/* 900CC 8008F4CC 00062040 */  sll        $a0, $a2, 1
/* 900D0 8008F4D0 00862021 */  addu       $a0, $a0, $a2
/* 900D4 8008F4D4 000420C0 */  sll        $a0, $a0, 3
/* 900D8 8008F4D8 0C023EF9 */  jal        draw_portait_combat
/* 900DC 8008F4DC 00442021 */   addu      $a0, $v0, $a0
/* 900E0 8008F4E0 92031CD8 */  lbu        $v1, 0x1cd8($s0)
/* 900E4 8008F4E4 8E241CC8 */  lw         $a0, 0x1cc8($s1)
/* 900E8 8008F4E8 00031040 */  sll        $v0, $v1, 1
/* 900EC 8008F4EC 00431021 */  addu       $v0, $v0, $v1
/* 900F0 8008F4F0 000210C0 */  sll        $v0, $v0, 3
/* 900F4 8008F4F4 00441021 */  addu       $v0, $v0, $a0
/* 900F8 8008F4F8 26430001 */  addiu      $v1, $s2, 1
/* 900FC 8008F4FC 307200FF */  andi       $s2, $v1, 0xff
/* 90100 8008F500 A053000B */  sb         $s3, 0xb($v0)
/* 90104 8008F504 92021CD8 */  lbu        $v0, 0x1cd8($s0)
/* 90108 8008F508 2E430002 */  sltiu      $v1, $s2, 2
/* 9010C 8008F50C 24420001 */  addiu      $v0, $v0, 1
/* 90110 8008F510 1460FFEA */  bnez       $v1, .L8008F4BC
/* 90114 8008F514 A2021CD8 */   sb        $v0, 0x1cd8($s0)
/* 90118 8008F518 00009021 */  addu       $s2, $zero, $zero
/* 9011C 8008F51C 3C10800F */  lui        $s0, 0x800f
/* 90120 8008F520 00121040 */  sll        $v0, $s2, 1
.L8008F524:
/* 90124 8008F524 02A21021 */  addu       $v0, $s5, $v0
/* 90128 8008F528 94450000 */  lhu        $a1, ($v0)
/* 9012C 8008F52C 10A0000B */  beqz       $a1, .L8008F55C
/* 90130 8008F530 00003821 */   addu      $a3, $zero, $zero
/* 90134 8008F534 92061CD8 */  lbu        $a2, 0x1cd8($s0)
/* 90138 8008F538 8EC21CC8 */  lw         $v0, 0x1cc8($s6)
/* 9013C 8008F53C 00062040 */  sll        $a0, $a2, 1
/* 90140 8008F540 00862021 */  addu       $a0, $a0, $a2
/* 90144 8008F544 000420C0 */  sll        $a0, $a0, 3
/* 90148 8008F548 0C023EF9 */  jal        draw_portait_combat
/* 9014C 8008F54C 00442021 */   addu      $a0, $v0, $a0
/* 90150 8008F550 92021CD8 */  lbu        $v0, 0x1cd8($s0)
/* 90154 8008F554 24420001 */  addiu      $v0, $v0, 1
/* 90158 8008F558 A2021CD8 */  sb         $v0, 0x1cd8($s0)
.L8008F55C:
/* 9015C 8008F55C 26420001 */  addiu      $v0, $s2, 1
/* 90160 8008F560 305200FF */  andi       $s2, $v0, 0xff
/* 90164 8008F564 2E43000C */  sltiu      $v1, $s2, 0xc
/* 90168 8008F568 1460FFEE */  bnez       $v1, .L8008F524
/* 9016C 8008F56C 00121040 */   sll       $v0, $s2, 1
/* 90170 8008F570 0C0243F8 */  jal        make_portait_frame_widget
/* 90174 8008F574 24100001 */   addiu     $s0, $zero, 1
/* 90178 8008F578 24040010 */  addiu      $a0, $zero, 0x10
/* 9017C 8008F57C 3C02800F */  lui        $v0, %hi(unused_C_left_toggle)
/* 90180 8008F580 0C026259 */  jal        passToMalloc
/* 90184 8008F584 AC501CC0 */   sw        $s0, %lo(unused_C_left_toggle)($v0)
/* 90188 8008F588 00402021 */  addu       $a0, $v0, $zero
/* 9018C 8008F58C 0C0358FC */  jal        init_unkGuiSubstruct
/* 90190 8008F590 24050040 */   addiu     $a1, $zero, 0x40
/* 90194 8008F594 8FBF0030 */  lw         $ra, 0x30($sp)
/* 90198 8008F598 8FB7002C */  lw         $s7, 0x2c($sp)
/* 9019C 8008F59C 8FB60028 */  lw         $s6, 0x28($sp)
/* 901A0 8008F5A0 8FB50024 */  lw         $s5, 0x24($sp)
/* 901A4 8008F5A4 8FB40020 */  lw         $s4, 0x20($sp)
/* 901A8 8008F5A8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 901AC 8008F5AC 8FB20018 */  lw         $s2, 0x18($sp)
/* 901B0 8008F5B0 8FB10014 */  lw         $s1, 0x14($sp)
/* 901B4 8008F5B4 3C03800F */  lui        $v1, %hi(combat_gui_substruct)
/* 901B8 8008F5B8 AC621CD0 */  sw         $v0, %lo(combat_gui_substruct)($v1)
/* 901BC 8008F5BC 3C02800F */  lui        $v0, %hi(combat_gui_flag)
/* 901C0 8008F5C0 AC501CD4 */  sw         $s0, %lo(combat_gui_flag)($v0)
/* 901C4 8008F5C4 8FB00010 */  lw         $s0, 0x10($sp)
/* 901C8 8008F5C8 03E00008 */  jr         $ra
/* 901CC 8008F5CC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel combatgui_free
/* 901D0 8008F5D0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 901D4 8008F5D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 901D8 8008F5D8 3C10800F */  lui        $s0, %hi(combat_gui_substruct)
/* 901DC 8008F5DC 8E041CD0 */  lw         $a0, %lo(combat_gui_substruct)($s0)
/* 901E0 8008F5E0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 901E4 8008F5E4 AFB40020 */  sw         $s4, 0x20($sp)
/* 901E8 8008F5E8 AFB3001C */  sw         $s3, 0x1c($sp)
/* 901EC 8008F5EC AFB20018 */  sw         $s2, 0x18($sp)
/* 901F0 8008F5F0 10800004 */  beqz       $a0, .L8008F604
/* 901F4 8008F5F4 AFB10014 */   sw        $s1, 0x14($sp)
/* 901F8 8008F5F8 0C035910 */  jal        some_clearing_func
/* 901FC 8008F5FC 24050003 */   addiu     $a1, $zero, 3
/* 90200 8008F600 AE001CD0 */  sw         $zero, 0x1cd0($s0)
.L8008F604:
/* 90204 8008F604 0C024409 */  jal        free_portait_frame_pointer
/* 90208 8008F608 00008021 */   addu      $s0, $zero, $zero
/* 9020C 8008F60C 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 90210 8008F610 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 90214 8008F614 00409821 */  addu       $s3, $v0, $zero
/* 90218 8008F618 3C11800F */  lui        $s1, 0x800f
/* 9021C 8008F61C 3C14800F */  lui        $s4, 0x800f
/* 90220 8008F620 1060000E */  beqz       $v1, .L8008F65C
/* 90224 8008F624 3C12800F */   lui       $s2, 0x800f
/* 90228 8008F628 00101040 */  sll        $v0, $s0, 1
.L8008F62C:
/* 9022C 8008F62C 00501021 */  addu       $v0, $v0, $s0
/* 90230 8008F630 8E231CC8 */  lw         $v1, 0x1cc8($s1)
/* 90234 8008F634 000210C0 */  sll        $v0, $v0, 3
/* 90238 8008F638 00431021 */  addu       $v0, $v0, $v1
/* 9023C 8008F63C 0C0133E5 */  jal        free_borg8_widget
/* 90240 8008F640 8C440000 */   lw        $a0, ($v0)
/* 90244 8008F644 26030001 */  addiu      $v1, $s0, 1
/* 90248 8008F648 92621CC4 */  lbu        $v0, 0x1cc4($s3)
/* 9024C 8008F64C 307000FF */  andi       $s0, $v1, 0xff
/* 90250 8008F650 0202102B */  sltu       $v0, $s0, $v0
/* 90254 8008F654 1440FFF5 */  bnez       $v0, .L8008F62C
/* 90258 8008F658 00101040 */   sll       $v0, $s0, 1
.L8008F65C:
/* 9025C 8008F65C 8E241CC8 */  lw         $a0, 0x1cc8($s1)
/* 90260 8008F660 10800005 */  beqz       $a0, .L8008F678
/* 90264 8008F664 3C05800E */   lui       $a1, %hi(D_800E19C0)
/* 90268 8008F668 24A519C0 */  addiu      $a1, $a1, %lo(D_800E19C0)
/* 9026C 8008F66C 0C02600C */  jal        Free
/* 90270 8008F670 2406013B */   addiu     $a2, $zero, 0x13b
/* 90274 8008F674 AE201CC8 */  sw         $zero, 0x1cc8($s1)
.L8008F678:
/* 90278 8008F678 8E841CCC */  lw         $a0, 0x1ccc($s4)
/* 9027C 8008F67C 10800005 */  beqz       $a0, .L8008F694
/* 90280 8008F680 3C05800E */   lui       $a1, %hi(D_800E19C0)
/* 90284 8008F684 24A519C0 */  addiu      $a1, $a1, %lo(D_800E19C0)
/* 90288 8008F688 0C02600C */  jal        Free
/* 9028C 8008F68C 24060142 */   addiu     $a2, $zero, 0x142
/* 90290 8008F690 AE801CCC */  sw         $zero, 0x1ccc($s4)
.L8008F694:
/* 90294 8008F694 3C10800E */  lui        $s0, %hi(gGlobals)
/* 90298 8008F698 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 9029C 8008F69C 8E041604 */  lw         $a0, 0x1604($s0)
/* 902A0 8008F6A0 0C02DCB3 */  jal        func_800B72CC
/* 902A4 8008F6A4 8E45D504 */   lw        $a1, -0x2afc($s2)
/* 902A8 8008F6A8 26041624 */  addiu      $a0, $s0, 0x1624
/* 902AC 8008F6AC 2645D504 */  addiu      $a1, $s2, -0x2afc
/* 902B0 8008F6B0 24060006 */  addiu      $a2, $zero, 6
/* 902B4 8008F6B4 0C035867 */  jal        AllocFreeQueueItem
/* 902B8 8008F6B8 00003821 */   addu      $a3, $zero, $zero
/* 902BC 8008F6BC 8FBF0024 */  lw         $ra, 0x24($sp)
/* 902C0 8008F6C0 8FB40020 */  lw         $s4, 0x20($sp)
/* 902C4 8008F6C4 A2601CC4 */  sb         $zero, 0x1cc4($s3)
/* 902C8 8008F6C8 8FB3001C */  lw         $s3, 0x1c($sp)
/* 902CC 8008F6CC AE40D504 */  sw         $zero, -0x2afc($s2)
/* 902D0 8008F6D0 8FB20018 */  lw         $s2, 0x18($sp)
/* 902D4 8008F6D4 8FB10014 */  lw         $s1, 0x14($sp)
/* 902D8 8008F6D8 8FB00010 */  lw         $s0, 0x10($sp)
/* 902DC 8008F6DC 03E00008 */  jr         $ra
/* 902E0 8008F6E0 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8008F6E4
/* 902E4 8008F6E4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 902E8 8008F6E8 3C02800F */  lui        $v0, %hi(screenfade_float)
/* 902EC 8008F6EC C44088E4 */  lwc1       $f0, %lo(screenfade_float)($v0)
/* 902F0 8008F6F0 3C03800F */  lui        $v1, %hi(D_800F36F8)
/* 902F4 8008F6F4 AFB10014 */  sw         $s1, 0x14($sp)
/* 902F8 8008F6F8 00808821 */  addu       $s1, $a0, $zero
/* 902FC 8008F6FC AFB00010 */  sw         $s0, 0x10($sp)
/* 90300 8008F700 E46036F8 */  swc1       $f0, %lo(D_800F36F8)($v1)
/* 90304 8008F704 3C03800F */  lui        $v1, %hi(combat_gui_flag)
/* 90308 8008F708 8C621CD4 */  lw         $v0, %lo(combat_gui_flag)($v1)
/* 9030C 8008F70C 30B000FF */  andi       $s0, $a1, 0xff
/* 90310 8008F710 10400003 */  beqz       $v0, .L8008F720
/* 90314 8008F714 AFBF0018 */   sw        $ra, 0x18($sp)
/* 90318 8008F718 0C024101 */  jal        func_80090404
/* 9031C 8008F71C AC601CD4 */   sw        $zero, 0x1cd4($v1)
.L8008F720:
/* 90320 8008F720 0C023ECF */  jal        func_8008FB3C
/* 90324 8008F724 02002021 */   addu      $a0, $s0, $zero
/* 90328 8008F728 02202021 */  addu       $a0, $s1, $zero
/* 9032C 8008F72C 0C023ED9 */  jal        func_8008FB64
/* 90330 8008F730 02002821 */   addu      $a1, $s0, $zero
/* 90334 8008F734 8FBF0018 */  lw         $ra, 0x18($sp)
/* 90338 8008F738 8FB10014 */  lw         $s1, 0x14($sp)
/* 9033C 8008F73C 8FB00010 */  lw         $s0, 0x10($sp)
/* 90340 8008F740 03E00008 */  jr         $ra
/* 90344 8008F744 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8008F748
/* 90348 8008F748 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 9034C 8008F74C AFB10014 */  sw         $s1, 0x14($sp)
/* 90350 8008F750 00008821 */  addu       $s1, $zero, $zero
/* 90354 8008F754 00003821 */  addu       $a3, $zero, $zero
/* 90358 8008F758 AFB20018 */  sw         $s2, 0x18($sp)
/* 9035C 8008F75C 00C09021 */  addu       $s2, $a2, $zero
/* 90360 8008F760 3086FFFF */  andi       $a2, $a0, 0xffff
/* 90364 8008F764 AFB3001C */  sw         $s3, 0x1c($sp)
/* 90368 8008F768 30B300FF */  andi       $s3, $a1, 0xff
/* 9036C 8008F76C AFBF0020 */  sw         $ra, 0x20($sp)
/* 90370 8008F770 AFB00010 */  sw         $s0, 0x10($sp)
/* 90374 8008F774 08023DE0 */  j          .L8008F780
/* 90378 8008F778 3C10800F */   lui       $s0, %hi(combat_gui_tally)
.L8008F77C:
/* 9037C 8008F77C 304700FF */  andi       $a3, $v0, 0xff
.L8008F780:
/* 90380 8008F780 92051CC4 */  lbu        $a1, %lo(combat_gui_tally)($s0)
/* 90384 8008F784 00E5102B */  sltu       $v0, $a3, $a1
/* 90388 8008F788 1040000D */  beqz       $v0, .L8008F7C0
/* 9038C 8008F78C 3C03800F */   lui       $v1, %hi(combat_gui)
/* 90390 8008F790 00071040 */  sll        $v0, $a3, 1
/* 90394 8008F794 00471021 */  addu       $v0, $v0, $a3
/* 90398 8008F798 8C641CC8 */  lw         $a0, %lo(combat_gui)($v1)
/* 9039C 8008F79C 000210C0 */  sll        $v0, $v0, 3
/* 903A0 8008F7A0 00822021 */  addu       $a0, $a0, $v0
/* 903A4 8008F7A4 9083000B */  lbu        $v1, 0xb($a0)
/* 903A8 8008F7A8 1460FFF4 */  bnez       $v1, .L8008F77C
/* 903AC 8008F7AC 24E20001 */   addiu     $v0, $a3, 1
/* 903B0 8008F7B0 94820008 */  lhu        $v0, 8($a0)
/* 903B4 8008F7B4 1446FFF1 */  bne        $v0, $a2, .L8008F77C
/* 903B8 8008F7B8 24E20001 */   addiu     $v0, $a3, 1
/* 903BC 8008F7BC 00808821 */  addu       $s1, $a0, $zero
.L8008F7C0:
/* 903C0 8008F7C0 16200034 */  bnez       $s1, .L8008F894
/* 903C4 8008F7C4 00003821 */   addu      $a3, $zero, $zero
/* 903C8 8008F7C8 0225102B */  sltu       $v0, $s1, $a1
/* 903CC 8008F7CC 10400013 */  beqz       $v0, .L8008F81C
/* 903D0 8008F7D0 3C09800F */   lui       $t1, 0x800f
/* 903D4 8008F7D4 3C02800F */  lui        $v0, %hi(combat_gui)
/* 903D8 8008F7D8 8C511CC8 */  lw         $s1, %lo(combat_gui)($v0)
/* 903DC 8008F7DC 9223000B */  lbu        $v1, 0xb($s1)
/* 903E0 8008F7E0 24020005 */  addiu      $v0, $zero, 5
/* 903E4 8008F7E4 1062000D */  beq        $v1, $v0, .L8008F81C
/* 903E8 8008F7E8 24080005 */   addiu     $t0, $zero, 5
/* 903EC 8008F7EC 02202021 */  addu       $a0, $s1, $zero
/* 903F0 8008F7F0 24E20001 */  addiu      $v0, $a3, 1
.L8008F7F4:
/* 903F4 8008F7F4 304700FF */  andi       $a3, $v0, 0xff
/* 903F8 8008F7F8 00E5182B */  sltu       $v1, $a3, $a1
/* 903FC 8008F7FC 10600007 */  beqz       $v1, .L8008F81C
/* 90400 8008F800 00071040 */   sll       $v0, $a3, 1
/* 90404 8008F804 00471021 */  addu       $v0, $v0, $a3
/* 90408 8008F808 000210C0 */  sll        $v0, $v0, 3
/* 9040C 8008F80C 00828821 */  addu       $s1, $a0, $v0
/* 90410 8008F810 9223000B */  lbu        $v1, 0xb($s1)
/* 90414 8008F814 1468FFF7 */  bne        $v1, $t0, .L8008F7F4
/* 90418 8008F818 24E20001 */   addiu     $v0, $a3, 1
.L8008F81C:
/* 9041C 8008F81C 8D2413A0 */  lw         $a0, 0x13a0($t1)
/* 90420 8008F820 0C01D531 */  jal        getEntityPortait
/* 90424 8008F824 00C02821 */   addu      $a1, $a2, $zero
/* 90428 8008F828 0C0290E2 */  jal        get_borg_8
/* 9042C 8008F82C 00402021 */   addu      $a0, $v0, $zero
/* 90430 8008F830 8E230000 */  lw         $v1, ($s1)
/* 90434 8008F834 12400003 */  beqz       $s2, .L8008F844
/* 90438 8008F838 AC62006C */   sw        $v0, 0x6c($v1)
/* 9043C 8008F83C 08023E12 */  j          .L8008F848
/* 90440 8008F840 24020003 */   addiu     $v0, $zero, 3
.L8008F844:
/* 90444 8008F844 24020002 */  addiu      $v0, $zero, 2
.L8008F848:
/* 90448 8008F848 A222000B */  sb         $v0, 0xb($s1)
/* 9044C 8008F84C A233000A */  sb         $s3, 0xa($s1)
/* 90450 8008F850 92031CC4 */  lbu        $v1, 0x1cc4($s0)
/* 90454 8008F854 1060000F */  beqz       $v1, .L8008F894
/* 90458 8008F858 00003821 */   addu      $a3, $zero, $zero
/* 9045C 8008F85C 3C02800F */  lui        $v0, %hi(combat_gui_1)
/* 90460 8008F860 8C451CCC */  lw         $a1, %lo(combat_gui_1)($v0)
/* 90464 8008F864 00602021 */  addu       $a0, $v1, $zero
/* 90468 8008F868 00071040 */  sll        $v0, $a3, 1
.L8008F86C:
/* 9046C 8008F86C 00471021 */  addu       $v0, $v0, $a3
/* 90470 8008F870 000210C0 */  sll        $v0, $v0, 3
/* 90474 8008F874 00451021 */  addu       $v0, $v0, $a1
/* 90478 8008F878 8C430014 */  lw         $v1, 0x14($v0)
/* 9047C 8008F87C 1460001D */  bnez       $v1, .L8008F8F4
/* 90480 8008F880 24E20001 */   addiu     $v0, $a3, 1
/* 90484 8008F884 304700FF */  andi       $a3, $v0, 0xff
/* 90488 8008F888 00E4182B */  sltu       $v1, $a3, $a0
/* 9048C 8008F88C 1460FFF7 */  bnez       $v1, .L8008F86C
/* 90490 8008F890 00071040 */   sll       $v0, $a3, 1
.L8008F894:
/* 90494 8008F894 16400002 */  bnez       $s2, .L8008F8A0
/* 90498 8008F898 24020003 */   addiu     $v0, $zero, 3
/* 9049C 8008F89C 24020002 */  addiu      $v0, $zero, 2
.L8008F8A0:
/* 904A0 8008F8A0 A222000B */  sb         $v0, 0xb($s1)
/* 904A4 8008F8A4 A233000A */  sb         $s3, 0xa($s1)
/* 904A8 8008F8A8 0C024041 */  jal        get_combat_gui_index_
/* 904AC 8008F8AC 02402021 */   addu      $a0, $s2, $zero
/* 904B0 8008F8B0 00402021 */  addu       $a0, $v0, $zero
/* 904B4 8008F8B4 240200FF */  addiu      $v0, $zero, 0xff
/* 904B8 8008F8B8 1482000F */  bne        $a0, $v0, .L8008F8F8
/* 904BC 8008F8BC 00000000 */   nop
/* 904C0 8008F8C0 1240002A */  beqz       $s2, .L8008F96C
/* 904C4 8008F8C4 00003821 */   addu      $a3, $zero, $zero
/* 904C8 8008F8C8 92021CC4 */  lbu        $v0, 0x1cc4($s0)
/* 904CC 8008F8CC 1040001D */  beqz       $v0, .L8008F944
/* 904D0 8008F8D0 00003021 */   addu      $a2, $zero, $zero
/* 904D4 8008F8D4 3C02800F */  lui        $v0, %hi(combat_gui)
/* 904D8 8008F8D8 8C451CC8 */  lw         $a1, %lo(combat_gui)($v0)
/* 904DC 8008F8DC 24040004 */  addiu      $a0, $zero, 4
/* 904E0 8008F8E0 90A3000B */  lbu        $v1, 0xb($a1)
/* 904E4 8008F8E4 14640008 */  bne        $v1, $a0, .L8008F908
/* 904E8 8008F8E8 00404021 */   addu      $t0, $v0, $zero
/* 904EC 8008F8EC 08023E51 */  j          .L8008F944
/* 904F0 8008F8F0 00A03021 */   addu      $a2, $a1, $zero
.L8008F8F4:
/* 904F4 8008F8F4 00E02021 */  addu       $a0, $a3, $zero
.L8008F8F8:
/* 904F8 8008F8F8 0C02405D */  jal        func_80090174
/* 904FC 8008F8FC 02202821 */   addu      $a1, $s1, $zero
/* 90500 8008F900 08023E5C */  j          .L8008F970
/* 90504 8008F904 8FBF0020 */   lw        $ra, 0x20($sp)
.L8008F908:
/* 90508 8008F908 24E30001 */  addiu      $v1, $a3, 1
.L8008F90C:
/* 9050C 8008F90C 92021CC4 */  lbu        $v0, 0x1cc4($s0)
/* 90510 8008F910 306700FF */  andi       $a3, $v1, 0xff
/* 90514 8008F914 00E2102B */  sltu       $v0, $a3, $v0
/* 90518 8008F918 1040000A */  beqz       $v0, .L8008F944
/* 9051C 8008F91C 00071040 */   sll       $v0, $a3, 1
/* 90520 8008F920 00471021 */  addu       $v0, $v0, $a3
/* 90524 8008F924 8D031CC8 */  lw         $v1, 0x1cc8($t0)
/* 90528 8008F928 000210C0 */  sll        $v0, $v0, 3
/* 9052C 8008F92C 00621821 */  addu       $v1, $v1, $v0
/* 90530 8008F930 9064000B */  lbu        $a0, 0xb($v1)
/* 90534 8008F934 24020004 */  addiu      $v0, $zero, 4
/* 90538 8008F938 5482FFF4 */  bnel       $a0, $v0, .L8008F90C
/* 9053C 8008F93C 24E30001 */   addiu     $v1, $a3, 1
/* 90540 8008F940 00603021 */  addu       $a2, $v1, $zero
.L8008F944:
/* 90544 8008F944 10C00009 */  beqz       $a2, .L8008F96C
/* 90548 8008F948 24020001 */   addiu     $v0, $zero, 1
/* 9054C 8008F94C 00C02821 */  addu       $a1, $a2, $zero
/* 90550 8008F950 A0C2000B */  sb         $v0, 0xb($a2)
/* 90554 8008F954 92240010 */  lbu        $a0, 0x10($s1)
/* 90558 8008F958 0C02405D */  jal        func_80090174
/* 9055C 8008F95C 90D00010 */   lbu       $s0, 0x10($a2)
/* 90560 8008F960 02002021 */  addu       $a0, $s0, $zero
/* 90564 8008F964 0C02405D */  jal        func_80090174
/* 90568 8008F968 02202821 */   addu      $a1, $s1, $zero
.L8008F96C:
/* 9056C 8008F96C 8FBF0020 */  lw         $ra, 0x20($sp)
.L8008F970:
/* 90570 8008F970 8FB3001C */  lw         $s3, 0x1c($sp)
/* 90574 8008F974 8FB20018 */  lw         $s2, 0x18($sp)
/* 90578 8008F978 8FB10014 */  lw         $s1, 0x14($sp)
/* 9057C 8008F97C 8FB00010 */  lw         $s0, 0x10($sp)
/* 90580 8008F980 03E00008 */  jr         $ra
/* 90584 8008F984 27BD0028 */   addiu     $sp, $sp, 0x28

glabel pass_to_draw_crossbones
/* 90588 8008F988 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9058C 8008F98C 3084FFFF */  andi       $a0, $a0, 0xffff
/* 90590 8008F990 30A500FF */  andi       $a1, $a1, 0xff
/* 90594 8008F994 2406016D */  addiu      $a2, $zero, 0x16d
/* 90598 8008F998 AFBF0010 */  sw         $ra, 0x10($sp)
/* 9059C 8008F99C 0C023E76 */  jal        draw_crossbones_2
/* 905A0 8008F9A0 00003821 */   addu      $a3, $zero, $zero
/* 905A4 8008F9A4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 905A8 8008F9A8 03E00008 */  jr         $ra
/* 905AC 8008F9AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel flee_draw_crossbones
/* 905B0 8008F9B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 905B4 8008F9B4 3084FFFF */  andi       $a0, $a0, 0xffff
/* 905B8 8008F9B8 30A500FF */  andi       $a1, $a1, 0xff
/* 905BC 8008F9BC 2406016D */  addiu      $a2, $zero, 0x16d
/* 905C0 8008F9C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 905C4 8008F9C4 0C023E76 */  jal        draw_crossbones_2
/* 905C8 8008F9C8 24070001 */   addiu     $a3, $zero, 1
/* 905CC 8008F9CC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 905D0 8008F9D0 03E00008 */  jr         $ra
/* 905D4 8008F9D4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel draw_crossbones_2
/* 905D8 8008F9D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 905DC 8008F9DC 00004021 */  addu       $t0, $zero, $zero
/* 905E0 8008F9E0 AFB00010 */  sw         $s0, 0x10($sp)
/* 905E4 8008F9E4 00008021 */  addu       $s0, $zero, $zero
/* 905E8 8008F9E8 AFB10014 */  sw         $s1, 0x14($sp)
/* 905EC 8008F9EC 00E08821 */  addu       $s1, $a3, $zero
/* 905F0 8008F9F0 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 905F4 8008F9F4 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 905F8 8008F9F8 30A500FF */  andi       $a1, $a1, 0xff
/* 905FC 8008F9FC 1060001B */  beqz       $v1, .L8008FA6C
/* 90600 8008FA00 AFBF0018 */   sw        $ra, 0x18($sp)
/* 90604 8008FA04 3C02800F */  lui        $v0, %hi(combat_gui)
/* 90608 8008FA08 8C491CC8 */  lw         $t1, %lo(combat_gui)($v0)
/* 9060C 8008FA0C 240C0001 */  addiu      $t4, $zero, 1
/* 90610 8008FA10 240B0004 */  addiu      $t3, $zero, 4
/* 90614 8008FA14 240A0005 */  addiu      $t2, $zero, 5
/* 90618 8008FA18 00603821 */  addu       $a3, $v1, $zero
/* 9061C 8008FA1C 00081040 */  sll        $v0, $t0, 1
.L8008FA20:
/* 90620 8008FA20 00481021 */  addu       $v0, $v0, $t0
/* 90624 8008FA24 000210C0 */  sll        $v0, $v0, 3
/* 90628 8008FA28 01222021 */  addu       $a0, $t1, $v0
/* 9062C 8008FA2C 9083000A */  lbu        $v1, 0xa($a0)
/* 90630 8008FA30 1465000A */  bne        $v1, $a1, .L8008FA5C
/* 90634 8008FA34 25020001 */   addiu     $v0, $t0, 1
/* 90638 8008FA38 9082000B */  lbu        $v0, 0xb($a0)
/* 9063C 8008FA3C 50400007 */  beql       $v0, $zero, .L8008FA5C
/* 90640 8008FA40 25020001 */   addiu     $v0, $t0, 1
/* 90644 8008FA44 504C0005 */  beql       $v0, $t4, .L8008FA5C
/* 90648 8008FA48 25020001 */   addiu     $v0, $t0, 1
/* 9064C 8008FA4C 504B0003 */  beql       $v0, $t3, .L8008FA5C
/* 90650 8008FA50 25020001 */   addiu     $v0, $t0, 1
/* 90654 8008FA54 144A000E */  bne        $v0, $t2, .L8008FA90
/* 90658 8008FA58 25020001 */   addiu     $v0, $t0, 1
.L8008FA5C:
/* 9065C 8008FA5C 304800FF */  andi       $t0, $v0, 0xff
/* 90660 8008FA60 0107182B */  sltu       $v1, $t0, $a3
/* 90664 8008FA64 1460FFEE */  bnez       $v1, .L8008FA20
/* 90668 8008FA68 00081040 */   sll       $v0, $t0, 1
.L8008FA6C:
/* 9066C 8008FA6C 02002021 */  addu       $a0, $s0, $zero
/* 90670 8008FA70 0C0242DC */  jal        draw_crossbone
/* 90674 8008FA74 00C02821 */   addu      $a1, $a2, $zero
/* 90678 8008FA78 9203000B */  lbu        $v1, 0xb($s0)
/* 9067C 8008FA7C 24020003 */  addiu      $v0, $zero, 3
/* 90680 8008FA80 10620005 */  beq        $v1, $v0, .L8008FA98
/* 90684 8008FA84 24020001 */   addiu     $v0, $zero, 1
/* 90688 8008FA88 08023EA9 */  j          .L8008FAA4
/* 9068C 8008FA8C A202000B */   sb        $v0, 0xb($s0)
.L8008FA90:
/* 90690 8008FA90 08023E9B */  j          .L8008FA6C
/* 90694 8008FA94 00808021 */   addu      $s0, $a0, $zero
.L8008FA98:
/* 90698 8008FA98 24020004 */  addiu      $v0, $zero, 4
/* 9069C 8008FA9C A202000B */  sb         $v0, 0xb($s0)
/* 906A0 8008FAA0 AE110014 */  sw         $s1, 0x14($s0)
.L8008FAA4:
/* 906A4 8008FAA4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 906A8 8008FAA8 8FB10014 */  lw         $s1, 0x14($sp)
/* 906AC 8008FAAC 8FB00010 */  lw         $s0, 0x10($sp)
/* 906B0 8008FAB0 03E00008 */  jr         $ra
/* 906B4 8008FAB4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel draw_dead_crossbones
/* 906B8 8008FAB8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 906BC 8008FABC 00002821 */  addu       $a1, $zero, $zero
/* 906C0 8008FAC0 3087FFFF */  andi       $a3, $a0, 0xffff
/* 906C4 8008FAC4 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 906C8 8008FAC8 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 906CC 8008FACC 00405821 */  addu       $t3, $v0, $zero
/* 906D0 8008FAD0 10600017 */  beqz       $v1, .L8008FB30
/* 906D4 8008FAD4 AFBF0010 */   sw        $ra, 0x10($sp)
/* 906D8 8008FAD8 3C08800F */  lui        $t0, %hi(combat_gui)
/* 906DC 8008FADC 24090001 */  addiu      $t1, $zero, 1
/* 906E0 8008FAE0 240A0001 */  addiu      $t2, $zero, 1
/* 906E4 8008FAE4 00003021 */  addu       $a2, $zero, $zero
.L8008FAE8:
/* 906E8 8008FAE8 8D021CC8 */  lw         $v0, %lo(combat_gui)($t0)
/* 906EC 8008FAEC 00462021 */  addu       $a0, $v0, $a2
/* 906F0 8008FAF0 9083000B */  lbu        $v1, 0xb($a0)
/* 906F4 8008FAF4 1460000A */  bnez       $v1, .L8008FB20
/* 906F8 8008FAF8 91621CC4 */   lbu       $v0, 0x1cc4($t3)
/* 906FC 8008FAFC 94820008 */  lhu        $v0, 8($a0)
/* 90700 8008FB00 14470007 */  bne        $v0, $a3, .L8008FB20
/* 90704 8008FB04 91621CC4 */   lbu       $v0, 0x1cc4($t3)
/* 90708 8008FB08 2405016D */  addiu      $a1, $zero, 0x16d
/* 9070C 8008FB0C A089000B */  sb         $t1, 0xb($a0)
/* 90710 8008FB10 0C0242DC */  jal        draw_crossbone
/* 90714 8008FB14 AC8A0014 */   sw        $t2, 0x14($a0)
/* 90718 8008FB18 08023ECD */  j          .L8008FB34
/* 9071C 8008FB1C 8FBF0010 */   lw        $ra, 0x10($sp)
.L8008FB20:
/* 90720 8008FB20 24A50001 */  addiu      $a1, $a1, 1
/* 90724 8008FB24 00A2102B */  sltu       $v0, $a1, $v0
/* 90728 8008FB28 1440FFEF */  bnez       $v0, .L8008FAE8
/* 9072C 8008FB2C 24C60018 */   addiu     $a2, $a2, 0x18
.L8008FB30:
/* 90730 8008FB30 8FBF0010 */  lw         $ra, 0x10($sp)
.L8008FB34:
/* 90734 8008FB34 03E00008 */  jr         $ra
/* 90738 8008FB38 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008FB3C
/* 9073C 8008FB3C 308500FF */  andi       $a1, $a0, 0xff
/* 90740 8008FB40 3C02800F */  lui        $v0, %hi(combat_gui_substruct)
/* 90744 8008FB44 8C441CD0 */  lw         $a0, %lo(combat_gui_substruct)($v0)
/* 90748 8008FB48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9074C 8008FB4C AFBF0010 */  sw         $ra, 0x10($sp)
/* 90750 8008FB50 0C03593A */  jal        func_800D64E8
/* 90754 8008FB54 00000000 */   nop
/* 90758 8008FB58 8FBF0010 */  lw         $ra, 0x10($sp)
/* 9075C 8008FB5C 03E00008 */  jr         $ra
/* 90760 8008FB60 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8008FB64
/* 90764 8008FB64 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 90768 8008FB68 AFB20018 */  sw         $s2, 0x18($sp)
/* 9076C 8008FB6C 00809021 */  addu       $s2, $a0, $zero
/* 90770 8008FB70 AFB10014 */  sw         $s1, 0x14($sp)
/* 90774 8008FB74 30B100FF */  andi       $s1, $a1, 0xff
/* 90778 8008FB78 AFBF001C */  sw         $ra, 0x1c($sp)
/* 9077C 8008FB7C 0C0025B4 */  jal        get_hres
/* 90780 8008FB80 AFB00010 */   sw        $s0, 0x10($sp)
/* 90784 8008FB84 0C0025B7 */  jal        get_vres
/* 90788 8008FB88 00408021 */   addu      $s0, $v0, $zero
/* 9078C 8008FB8C 02402021 */  addu       $a0, $s2, $zero
/* 90790 8008FB90 24050006 */  addiu      $a1, $zero, 6
/* 90794 8008FB94 02003021 */  addu       $a2, $s0, $zero
/* 90798 8008FB98 0C0290ED */  jal        rsp_func
/* 9079C 8008FB9C 00403821 */   addu      $a3, $v0, $zero
/* 907A0 8008FBA0 02202021 */  addu       $a0, $s1, $zero
/* 907A4 8008FBA4 0C02422F */  jal        three_combat_gui_funcs
/* 907A8 8008FBA8 00408021 */   addu      $s0, $v0, $zero
/* 907AC 8008FBAC 02002021 */  addu       $a0, $s0, $zero
/* 907B0 8008FBB0 0C02441C */  jal        setCombatPortait
/* 907B4 8008FBB4 02202821 */   addu      $a1, $s1, $zero
/* 907B8 8008FBB8 0C015E9C */  jal        func_80057A70
/* 907BC 8008FBBC 00402021 */   addu      $a0, $v0, $zero
/* 907C0 8008FBC0 00402021 */  addu       $a0, $v0, $zero
/* 907C4 8008FBC4 0C02423A */  jal        func_800908E8
/* 907C8 8008FBC8 02202821 */   addu      $a1, $s1, $zero
/* 907CC 8008FBCC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 907D0 8008FBD0 8FB20018 */  lw         $s2, 0x18($sp)
/* 907D4 8008FBD4 8FB10014 */  lw         $s1, 0x14($sp)
/* 907D8 8008FBD8 8FB00010 */  lw         $s0, 0x10($sp)
/* 907DC 8008FBDC 03E00008 */  jr         $ra
/* 907E0 8008FBE0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel draw_portait_combat
/* 907E4 8008FBE4 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 907E8 8008FBE8 00001021 */  addu       $v0, $zero, $zero
/* 907EC 8008FBEC AFB1001C */  sw         $s1, 0x1c($sp)
/* 907F0 8008FBF0 00808821 */  addu       $s1, $a0, $zero
/* 907F4 8008FBF4 AFB20020 */  sw         $s2, 0x20($sp)
/* 907F8 8008FBF8 00E09021 */  addu       $s2, $a3, $zero
/* 907FC 8008FBFC AFB00018 */  sw         $s0, 0x18($sp)
/* 90800 8008FC00 30B0FFFF */  andi       $s0, $a1, 0xffff
/* 90804 8008FC04 12000007 */  beqz       $s0, .L8008FC24
/* 90808 8008FC08 AFBF0024 */   sw        $ra, 0x24($sp)
/* 9080C 8008FC0C 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 90810 8008FC10 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 90814 8008FC14 0C01D531 */  jal        getEntityPortait
/* 90818 8008FC18 02002821 */   addu      $a1, $s0, $zero
/* 9081C 8008FC1C 0C0290E2 */  jal        get_borg_8
/* 90820 8008FC20 00402021 */   addu      $a0, $v0, $zero
.L8008FC24:
/* 90824 8008FC24 00402821 */  addu       $a1, $v0, $zero
/* 90828 8008FC28 3C02800F */  lui        $v0, %hi(D_800ED504)
/* 9082C 8008FC2C 24030001 */  addiu      $v1, $zero, 1
/* 90830 8008FC30 240600A0 */  addiu      $a2, $zero, 0xa0
/* 90834 8008FC34 8C44D504 */  lw         $a0, %lo(D_800ED504)($v0)
/* 90838 8008FC38 24070078 */  addiu      $a3, $zero, 0x78
/* 9083C 8008FC3C 0C024012 */  jal        func_80090048
/* 90840 8008FC40 AFA30010 */   sw        $v1, 0x10($sp)
/* 90844 8008FC44 8FBF0024 */  lw         $ra, 0x24($sp)
/* 90848 8008FC48 AE32000C */  sw         $s2, 0xc($s1)
/* 9084C 8008FC4C 8FB20020 */  lw         $s2, 0x20($sp)
/* 90850 8008FC50 AE220000 */  sw         $v0, ($s1)
/* 90854 8008FC54 240200FF */  addiu      $v0, $zero, 0xff
/* 90858 8008FC58 A6300008 */  sh         $s0, 8($s1)
/* 9085C 8008FC5C A222000A */  sb         $v0, 0xa($s1)
/* 90860 8008FC60 A2220010 */  sb         $v0, 0x10($s1)
/* 90864 8008FC64 8FB1001C */  lw         $s1, 0x1c($sp)
/* 90868 8008FC68 8FB00018 */  lw         $s0, 0x18($sp)
/* 9086C 8008FC6C 03E00008 */  jr         $ra
/* 90870 8008FC70 27BD0028 */   addiu     $sp, $sp, 0x28

glabel combat_gui_init_2
/* 90874 8008FC74 27BDFFA8 */  addiu      $sp, $sp, -0x58
/* 90878 8008FC78 AFB20038 */  sw         $s2, 0x38($sp)
/* 9087C 8008FC7C 24120012 */  addiu      $s2, $zero, 0x12
/* 90880 8008FC80 AFB3003C */  sw         $s3, 0x3c($sp)
/* 90884 8008FC84 00009821 */  addu       $s3, $zero, $zero
/* 90888 8008FC88 AFB7004C */  sw         $s7, 0x4c($sp)
/* 9088C 8008FC8C 0080B821 */  addu       $s7, $a0, $zero
/* 90890 8008FC90 AFB60048 */  sw         $s6, 0x48($sp)
/* 90894 8008FC94 30B600FF */  andi       $s6, $a1, 0xff
/* 90898 8008FC98 AFB50044 */  sw         $s5, 0x44($sp)
/* 9089C 8008FC9C 30D500FF */  andi       $s5, $a2, 0xff
/* 908A0 8008FCA0 02D51021 */  addu       $v0, $s6, $s5
/* 908A4 8008FCA4 24420002 */  addiu      $v0, $v0, 2
/* 908A8 8008FCA8 304200FF */  andi       $v0, $v0, 0xff
/* 908AC 8008FCAC AFB00030 */  sw         $s0, 0x30($sp)
/* 908B0 8008FCB0 00028040 */  sll        $s0, $v0, 1
/* 908B4 8008FCB4 02028021 */  addu       $s0, $s0, $v0
/* 908B8 8008FCB8 001080C0 */  sll        $s0, $s0, 3
/* 908BC 8008FCBC 02002021 */  addu       $a0, $s0, $zero
/* 908C0 8008FCC0 3C05800E */  lui        $a1, %hi(D_800E19C0)
/* 908C4 8008FCC4 24A519C0 */  addiu      $a1, $a1, %lo(D_800E19C0)
/* 908C8 8008FCC8 2406028C */  addiu      $a2, $zero, 0x28c
/* 908CC 8008FCCC AFBF0054 */  sw         $ra, 0x54($sp)
/* 908D0 8008FCD0 AFBE0050 */  sw         $fp, 0x50($sp)
/* 908D4 8008FCD4 AFB40040 */  sw         $s4, 0x40($sp)
/* 908D8 8008FCD8 0C025F9C */  jal        Malloc
/* 908DC 8008FCDC AFB10034 */   sw        $s1, 0x34($sp)
/* 908E0 8008FCE0 3C11800F */  lui        $s1, %hi(combat_gui_1)
/* 908E4 8008FCE4 00402021 */  addu       $a0, $v0, $zero
/* 908E8 8008FCE8 00002821 */  addu       $a1, $zero, $zero
/* 908EC 8008FCEC 02003021 */  addu       $a2, $s0, $zero
/* 908F0 8008FCF0 0C026380 */  jal        Calloc
/* 908F4 8008FCF4 AE221CCC */   sw        $v0, %lo(combat_gui_1)($s1)
/* 908F8 8008FCF8 12A0001A */  beqz       $s5, .L8008FD64
/* 908FC 8008FCFC 00008021 */   addu      $s0, $zero, $zero
/* 90900 8008FD00 24110002 */  addiu      $s1, $zero, 2
/* 90904 8008FD04 24140017 */  addiu      $s4, $zero, 0x17
/* 90908 8008FD08 241E0001 */  addiu      $fp, $zero, 1
/* 9090C 8008FD0C 02602021 */  addu       $a0, $s3, $zero
.L8008FD10:
/* 90910 8008FD10 24820001 */  addiu      $v0, $a0, 1
/* 90914 8008FD14 3053FFFF */  andi       $s3, $v0, 0xffff
/* 90918 8008FD18 02E02821 */  addu       $a1, $s7, $zero
/* 9091C 8008FD1C 2406010E */  addiu      $a2, $zero, 0x10e
/* 90920 8008FD20 02403821 */  addu       $a3, $s2, $zero
/* 90924 8008FD24 240201C6 */  addiu      $v0, $zero, 0x1c6
/* 90928 8008FD28 AFB10010 */  sw         $s1, 0x10($sp)
/* 9092C 8008FD2C AFA20014 */  sw         $v0, 0x14($sp)
/* 90930 8008FD30 AFB40018 */  sw         $s4, 0x18($sp)
/* 90934 8008FD34 AFB4001C */  sw         $s4, 0x1c($sp)
/* 90938 8008FD38 AFA00020 */  sw         $zero, 0x20($sp)
/* 9093C 8008FD3C AFB10024 */  sw         $s1, 0x24($sp)
/* 90940 8008FD40 0C023FDF */  jal        draw_radar_blip
/* 90944 8008FD44 AFBE0028 */   sw        $fp, 0x28($sp)
/* 90948 8008FD48 2642001C */  addiu      $v0, $s2, 0x1c
/* 9094C 8008FD4C 3052FFFF */  andi       $s2, $v0, 0xffff
/* 90950 8008FD50 26030001 */  addiu      $v1, $s0, 1
/* 90954 8008FD54 307000FF */  andi       $s0, $v1, 0xff
/* 90958 8008FD58 0215102B */  sltu       $v0, $s0, $s5
/* 9095C 8008FD5C 1440FFEC */  bnez       $v0, .L8008FD10
/* 90960 8008FD60 02602021 */   addu      $a0, $s3, $zero
.L8008FD64:
/* 90964 8008FD64 00008021 */  addu       $s0, $zero, $zero
/* 90968 8008FD68 24150002 */  addiu      $s5, $zero, 2
/* 9096C 8008FD6C 241101C6 */  addiu      $s1, $zero, 0x1c6
/* 90970 8008FD70 24140017 */  addiu      $s4, $zero, 0x17
/* 90974 8008FD74 241E0001 */  addiu      $fp, $zero, 1
.L8008FD78:
/* 90978 8008FD78 02602021 */  addu       $a0, $s3, $zero
/* 9097C 8008FD7C 24820001 */  addiu      $v0, $a0, 1
/* 90980 8008FD80 3053FFFF */  andi       $s3, $v0, 0xffff
/* 90984 8008FD84 02E02821 */  addu       $a1, $s7, $zero
/* 90988 8008FD88 2406010E */  addiu      $a2, $zero, 0x10e
/* 9098C 8008FD8C 02403821 */  addu       $a3, $s2, $zero
/* 90990 8008FD90 AFB50010 */  sw         $s5, 0x10($sp)
/* 90994 8008FD94 AFB10014 */  sw         $s1, 0x14($sp)
/* 90998 8008FD98 AFB40018 */  sw         $s4, 0x18($sp)
/* 9099C 8008FD9C AFB4001C */  sw         $s4, 0x1c($sp)
/* 909A0 8008FDA0 AFA00020 */  sw         $zero, 0x20($sp)
/* 909A4 8008FDA4 AFB50024 */  sw         $s5, 0x24($sp)
/* 909A8 8008FDA8 0C023FDF */  jal        draw_radar_blip
/* 909AC 8008FDAC AFA00028 */   sw        $zero, 0x28($sp)
/* 909B0 8008FDB0 2642001C */  addiu      $v0, $s2, 0x1c
/* 909B4 8008FDB4 3052FFFF */  andi       $s2, $v0, 0xffff
/* 909B8 8008FDB8 26030001 */  addiu      $v1, $s0, 1
/* 909BC 8008FDBC 307000FF */  andi       $s0, $v1, 0xff
/* 909C0 8008FDC0 00131040 */  sll        $v0, $s3, 1
/* 909C4 8008FDC4 00531021 */  addu       $v0, $v0, $s3
/* 909C8 8008FDC8 3C04800F */  lui        $a0, %hi(combat_gui_1)
/* 909CC 8008FDCC 8C831CCC */  lw         $v1, %lo(combat_gui_1)($a0)
/* 909D0 8008FDD0 000210C0 */  sll        $v0, $v0, 3
/* 909D4 8008FDD4 00431021 */  addu       $v0, $v0, $v1
/* 909D8 8008FDD8 2E030002 */  sltiu      $v1, $s0, 2
/* 909DC 8008FDDC 1460FFE6 */  bnez       $v1, .L8008FD78
/* 909E0 8008FDE0 AC5EFFFC */   sw        $fp, -4($v0)
/* 909E4 8008FDE4 24120012 */  addiu      $s2, $zero, 0x12
/* 909E8 8008FDE8 12C0001C */  beqz       $s6, .L8008FE5C
/* 909EC 8008FDEC 00008021 */   addu      $s0, $zero, $zero
/* 909F0 8008FDF0 241E0002 */  addiu      $fp, $zero, 2
/* 909F4 8008FDF4 241501C6 */  addiu      $s5, $zero, 0x1c6
/* 909F8 8008FDF8 24140017 */  addiu      $s4, $zero, 0x17
/* 909FC 8008FDFC 24110001 */  addiu      $s1, $zero, 1
/* 90A00 8008FE00 02602021 */  addu       $a0, $s3, $zero
.L8008FE04:
/* 90A04 8008FE04 24820001 */  addiu      $v0, $a0, 1
/* 90A08 8008FE08 3053FFFF */  andi       $s3, $v0, 0xffff
/* 90A0C 8008FE0C 02E02821 */  addu       $a1, $s7, $zero
/* 90A10 8008FE10 24060015 */  addiu      $a2, $zero, 0x15
/* 90A14 8008FE14 02403821 */  addu       $a3, $s2, $zero
/* 90A18 8008FE18 AFBE0010 */  sw         $fp, 0x10($sp)
/* 90A1C 8008FE1C AFB50014 */  sw         $s5, 0x14($sp)
/* 90A20 8008FE20 AFB40018 */  sw         $s4, 0x18($sp)
/* 90A24 8008FE24 AFB4001C */  sw         $s4, 0x1c($sp)
/* 90A28 8008FE28 AFB10020 */  sw         $s1, 0x20($sp)
/* 90A2C 8008FE2C AFA00024 */  sw         $zero, 0x24($sp)
/* 90A30 8008FE30 0C023FDF */  jal        draw_radar_blip
/* 90A34 8008FE34 AFB10028 */   sw        $s1, 0x28($sp)
/* 90A38 8008FE38 2642001C */  addiu      $v0, $s2, 0x1c
/* 90A3C 8008FE3C 3052FFFF */  andi       $s2, $v0, 0xffff
/* 90A40 8008FE40 26030001 */  addiu      $v1, $s0, 1
/* 90A44 8008FE44 307000FF */  andi       $s0, $v1, 0xff
/* 90A48 8008FE48 0216102B */  sltu       $v0, $s0, $s6
/* 90A4C 8008FE4C 10400003 */  beqz       $v0, .L8008FE5C
/* 90A50 8008FE50 2E020004 */   sltiu     $v0, $s0, 4
/* 90A54 8008FE54 1440FFEB */  bnez       $v0, .L8008FE04
/* 90A58 8008FE58 02602021 */   addu      $a0, $s3, $zero
.L8008FE5C:
/* 90A5C 8008FE5C 02D01023 */  subu       $v0, $s6, $s0
/* 90A60 8008FE60 00008021 */  addu       $s0, $zero, $zero
/* 90A64 8008FE64 3054FFFF */  andi       $s4, $v0, 0xffff
/* 90A68 8008FE68 1280001C */  beqz       $s4, .L8008FEDC
/* 90A6C 8008FE6C 0240A821 */   addu      $s5, $s2, $zero
/* 90A70 8008FE70 24110001 */  addiu      $s1, $zero, 1
/* 90A74 8008FE74 241E000B */  addiu      $fp, $zero, 0xb
/* 90A78 8008FE78 2416000A */  addiu      $s6, $zero, 0xa
/* 90A7C 8008FE7C 02602021 */  addu       $a0, $s3, $zero
.L8008FE80:
/* 90A80 8008FE80 24820001 */  addiu      $v0, $a0, 1
/* 90A84 8008FE84 3053FFFF */  andi       $s3, $v0, 0xffff
/* 90A88 8008FE88 02E02821 */  addu       $a1, $s7, $zero
/* 90A8C 8008FE8C 24060015 */  addiu      $a2, $zero, 0x15
/* 90A90 8008FE90 02403821 */  addu       $a3, $s2, $zero
/* 90A94 8008FE94 240201C7 */  addiu      $v0, $zero, 0x1c7
/* 90A98 8008FE98 AFB10010 */  sw         $s1, 0x10($sp)
/* 90A9C 8008FE9C AFA20014 */  sw         $v0, 0x14($sp)
/* 90AA0 8008FEA0 AFBE0018 */  sw         $fp, 0x18($sp)
/* 90AA4 8008FEA4 AFB6001C */  sw         $s6, 0x1c($sp)
/* 90AA8 8008FEA8 AFB10020 */  sw         $s1, 0x20($sp)
/* 90AAC 8008FEAC AFA00024 */  sw         $zero, 0x24($sp)
/* 90AB0 8008FEB0 0C023FDF */  jal        draw_radar_blip
/* 90AB4 8008FEB4 AFB10028 */   sw        $s1, 0x28($sp)
/* 90AB8 8008FEB8 2642000C */  addiu      $v0, $s2, 0xc
/* 90ABC 8008FEBC 3052FFFF */  andi       $s2, $v0, 0xffff
/* 90AC0 8008FEC0 26030001 */  addiu      $v1, $s0, 1
/* 90AC4 8008FEC4 307000FF */  andi       $s0, $v1, 0xff
/* 90AC8 8008FEC8 0214102B */  sltu       $v0, $s0, $s4
/* 90ACC 8008FECC 10400003 */  beqz       $v0, .L8008FEDC
/* 90AD0 8008FED0 2E020004 */   sltiu     $v0, $s0, 4
/* 90AD4 8008FED4 1440FFEA */  bnez       $v0, .L8008FE80
/* 90AD8 8008FED8 02602021 */   addu      $a0, $s3, $zero
.L8008FEDC:
/* 90ADC 8008FEDC 0214102B */  sltu       $v0, $s0, $s4
/* 90AE0 8008FEE0 1040001A */  beqz       $v0, .L8008FF4C
/* 90AE4 8008FEE4 02A09021 */   addu      $s2, $s5, $zero
/* 90AE8 8008FEE8 24110001 */  addiu      $s1, $zero, 1
/* 90AEC 8008FEEC 241E01C7 */  addiu      $fp, $zero, 0x1c7
/* 90AF0 8008FEF0 2416000B */  addiu      $s6, $zero, 0xb
/* 90AF4 8008FEF4 2415000A */  addiu      $s5, $zero, 0xa
/* 90AF8 8008FEF8 02602021 */  addu       $a0, $s3, $zero
.L8008FEFC:
/* 90AFC 8008FEFC 24820001 */  addiu      $v0, $a0, 1
/* 90B00 8008FF00 3053FFFF */  andi       $s3, $v0, 0xffff
/* 90B04 8008FF04 02E02821 */  addu       $a1, $s7, $zero
/* 90B08 8008FF08 24060023 */  addiu      $a2, $zero, 0x23
/* 90B0C 8008FF0C 02403821 */  addu       $a3, $s2, $zero
/* 90B10 8008FF10 AFB10010 */  sw         $s1, 0x10($sp)
/* 90B14 8008FF14 AFBE0014 */  sw         $fp, 0x14($sp)
/* 90B18 8008FF18 AFB60018 */  sw         $s6, 0x18($sp)
/* 90B1C 8008FF1C AFB5001C */  sw         $s5, 0x1c($sp)
/* 90B20 8008FF20 AFB10020 */  sw         $s1, 0x20($sp)
/* 90B24 8008FF24 AFA00024 */  sw         $zero, 0x24($sp)
/* 90B28 8008FF28 0C023FDF */  jal        draw_radar_blip
/* 90B2C 8008FF2C AFB10028 */   sw        $s1, 0x28($sp)
/* 90B30 8008FF30 2642000C */  addiu      $v0, $s2, 0xc
/* 90B34 8008FF34 3052FFFF */  andi       $s2, $v0, 0xffff
/* 90B38 8008FF38 26030001 */  addiu      $v1, $s0, 1
/* 90B3C 8008FF3C 307000FF */  andi       $s0, $v1, 0xff
/* 90B40 8008FF40 0214102B */  sltu       $v0, $s0, $s4
/* 90B44 8008FF44 1440FFED */  bnez       $v0, .L8008FEFC
/* 90B48 8008FF48 02602021 */   addu      $a0, $s3, $zero
.L8008FF4C:
/* 90B4C 8008FF4C 8FBF0054 */  lw         $ra, 0x54($sp)
/* 90B50 8008FF50 8FBE0050 */  lw         $fp, 0x50($sp)
/* 90B54 8008FF54 8FB7004C */  lw         $s7, 0x4c($sp)
/* 90B58 8008FF58 8FB60048 */  lw         $s6, 0x48($sp)
/* 90B5C 8008FF5C 8FB50044 */  lw         $s5, 0x44($sp)
/* 90B60 8008FF60 8FB40040 */  lw         $s4, 0x40($sp)
/* 90B64 8008FF64 8FB3003C */  lw         $s3, 0x3c($sp)
/* 90B68 8008FF68 8FB20038 */  lw         $s2, 0x38($sp)
/* 90B6C 8008FF6C 8FB10034 */  lw         $s1, 0x34($sp)
/* 90B70 8008FF70 8FB00030 */  lw         $s0, 0x30($sp)
/* 90B74 8008FF74 03E00008 */  jr         $ra
/* 90B78 8008FF78 27BD0058 */   addiu     $sp, $sp, 0x58

glabel draw_radar_blip
/* 90B7C 8008FF7C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 90B80 8008FF80 3083FFFF */  andi       $v1, $a0, 0xffff
/* 90B84 8008FF84 3C08800F */  lui        $t0, %hi(combat_gui_1)
/* 90B88 8008FF88 8FA40044 */  lw         $a0, 0x44($sp)
/* 90B8C 8008FF8C 00031040 */  sll        $v0, $v1, 1
/* 90B90 8008FF90 AFB00018 */  sw         $s0, 0x18($sp)
/* 90B94 8008FF94 8D101CCC */  lw         $s0, %lo(combat_gui_1)($t0)
/* 90B98 8008FF98 8FAB0050 */  lw         $t3, 0x50($sp)
/* 90B9C 8008FF9C 00431021 */  addu       $v0, $v0, $v1
/* 90BA0 8008FFA0 AFB40028 */  sw         $s4, 0x28($sp)
/* 90BA4 8008FFA4 8FB40058 */  lw         $s4, 0x58($sp)
/* 90BA8 8008FFA8 97A80042 */  lhu        $t0, 0x42($sp)
/* 90BAC 8008FFAC 97A9004A */  lhu        $t1, 0x4a($sp)
/* 90BB0 8008FFB0 97AA004E */  lhu        $t2, 0x4e($sp)
/* 90BB4 8008FFB4 97A30056 */  lhu        $v1, 0x56($sp)
/* 90BB8 8008FFB8 000210C0 */  sll        $v0, $v0, 3
/* 90BBC 8008FFBC AFB30024 */  sw         $s3, 0x24($sp)
/* 90BC0 8008FFC0 30D3FFFF */  andi       $s3, $a2, 0xffff
/* 90BC4 8008FFC4 AFB20020 */  sw         $s2, 0x20($sp)
/* 90BC8 8008FFC8 30F2FFFF */  andi       $s2, $a3, 0xffff
/* 90BCC 8008FFCC AFB1001C */  sw         $s1, 0x1c($sp)
/* 90BD0 8008FFD0 00A08821 */  addu       $s1, $a1, $zero
/* 90BD4 8008FFD4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 90BD8 8008FFD8 02028021 */  addu       $s0, $s0, $v0
/* 90BDC 8008FFDC 24020001 */  addiu      $v0, $zero, 1
/* 90BE0 8008FFE0 AE02000C */  sw         $v0, 0xc($s0)
/* 90BE4 8008FFE4 02681021 */  addu       $v0, $s3, $t0
/* 90BE8 8008FFE8 00621821 */  addu       $v1, $v1, $v0
/* 90BEC 8008FFEC 02484021 */  addu       $t0, $s2, $t0
/* 90BF0 8008FFF0 A6030004 */  sh         $v1, 4($s0)
/* 90BF4 8008FFF4 A6080006 */  sh         $t0, 6($s0)
/* 90BF8 8008FFF8 A6090008 */  sh         $t1, 8($s0)
/* 90BFC 8008FFFC A60A000A */  sh         $t2, 0xa($s0)
/* 90C00 80090000 AE0B0010 */  sw         $t3, 0x10($s0)
/* 90C04 80090004 0C0290E2 */  jal        get_borg_8
/* 90C08 80090008 AE000014 */   sw        $zero, 0x14($s0)
/* 90C0C 8009000C 02202021 */  addu       $a0, $s1, $zero
/* 90C10 80090010 00402821 */  addu       $a1, $v0, $zero
/* 90C14 80090014 02603021 */  addu       $a2, $s3, $zero
/* 90C18 80090018 02403821 */  addu       $a3, $s2, $zero
/* 90C1C 8009001C 0C024012 */  jal        func_80090048
/* 90C20 80090020 AFB40010 */   sw        $s4, 0x10($sp)
/* 90C24 80090024 8FBF002C */  lw         $ra, 0x2c($sp)
/* 90C28 80090028 8FB40028 */  lw         $s4, 0x28($sp)
/* 90C2C 8009002C 8FB30024 */  lw         $s3, 0x24($sp)
/* 90C30 80090030 8FB20020 */  lw         $s2, 0x20($sp)
/* 90C34 80090034 8FB1001C */  lw         $s1, 0x1c($sp)
/* 90C38 80090038 AE020000 */  sw         $v0, ($s0)
/* 90C3C 8009003C 8FB00018 */  lw         $s0, 0x18($sp)
/* 90C40 80090040 03E00008 */  jr         $ra
/* 90C44 80090044 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80090048
/* 90C48 80090048 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 90C4C 8009004C AFB3001C */  sw         $s3, 0x1c($sp)
/* 90C50 80090050 00809821 */  addu       $s3, $a0, $zero
/* 90C54 80090054 AFB10014 */  sw         $s1, 0x14($sp)
/* 90C58 80090058 8FB10040 */  lw         $s1, 0x40($sp)
/* 90C5C 8009005C 24040080 */  addiu      $a0, $zero, 0x80
/* 90C60 80090060 AFB00010 */  sw         $s0, 0x10($sp)
/* 90C64 80090064 00A08021 */  addu       $s0, $a1, $zero
/* 90C68 80090068 AFB40020 */  sw         $s4, 0x20($sp)
/* 90C6C 8009006C 30D4FFFF */  andi       $s4, $a2, 0xffff
/* 90C70 80090070 AFB50024 */  sw         $s5, 0x24($sp)
/* 90C74 80090074 30F5FFFF */  andi       $s5, $a3, 0xffff
/* 90C78 80090078 AFBF0028 */  sw         $ra, 0x28($sp)
/* 90C7C 8009007C 0C026259 */  jal        passToMalloc
/* 90C80 80090080 AFB20018 */   sw        $s2, 0x18($sp)
/* 90C84 80090084 00409021 */  addu       $s2, $v0, $zero
/* 90C88 80090088 02402021 */  addu       $a0, $s2, $zero
/* 90C8C 8009008C 0C02E518 */  jal        borg8_widget
/* 90C90 80090090 02002821 */   addu      $a1, $s0, $zero
/* 90C94 80090094 3C03800E */  lui        $v1, %hi(D_800E19F0)
/* 90C98 80090098 246319F0 */  addiu      $v1, $v1, %lo(D_800E19F0)
/* 90C9C 8009009C AE430078 */  sw         $v1, 0x78($s2)
/* 90CA0 800900A0 16400003 */  bnez       $s2, .L800900B0
/* 90CA4 800900A4 AE51007C */   sw        $s1, 0x7c($s2)
/* 90CA8 800900A8 08024038 */  j          .L800900E0
/* 90CAC 800900AC 00001021 */   addu      $v0, $zero, $zero
.L800900B0:
/* 90CB0 800900B0 02402021 */  addu       $a0, $s2, $zero
/* 90CB4 800900B4 02802821 */  addu       $a1, $s4, $zero
/* 90CB8 800900B8 0C02DD3F */  jal        set_widget_coords
/* 90CBC 800900BC 02A03021 */   addu      $a2, $s5, $zero
/* 90CC0 800900C0 12600006 */  beqz       $s3, .L800900DC
/* 90CC4 800900C4 02402821 */   addu      $a1, $s2, $zero
/* 90CC8 800900C8 8E630078 */  lw         $v1, 0x78($s3)
/* 90CCC 800900CC 84640030 */  lh         $a0, 0x30($v1)
/* 90CD0 800900D0 8C620034 */  lw         $v0, 0x34($v1)
/* 90CD4 800900D4 0040F809 */  jalr       $v0
/* 90CD8 800900D8 02642021 */   addu      $a0, $s3, $a0
.L800900DC:
/* 90CDC 800900DC 02401021 */  addu       $v0, $s2, $zero
.L800900E0:
/* 90CE0 800900E0 8FBF0028 */  lw         $ra, 0x28($sp)
/* 90CE4 800900E4 8FB50024 */  lw         $s5, 0x24($sp)
/* 90CE8 800900E8 8FB40020 */  lw         $s4, 0x20($sp)
/* 90CEC 800900EC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 90CF0 800900F0 8FB20018 */  lw         $s2, 0x18($sp)
/* 90CF4 800900F4 8FB10014 */  lw         $s1, 0x14($sp)
/* 90CF8 800900F8 8FB00010 */  lw         $s0, 0x10($sp)
/* 90CFC 800900FC 03E00008 */  jr         $ra
/* 90D00 80090100 27BD0030 */   addiu     $sp, $sp, 0x30

glabel get_combat_gui_index_
/* 90D04 80090104 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 90D08 80090108 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 90D0C 8009010C 10600017 */  beqz       $v1, .L8009016C
/* 90D10 80090110 00003021 */   addu      $a2, $zero, $zero
/* 90D14 80090114 3C02800F */  lui        $v0, %hi(combat_gui_1)
/* 90D18 80090118 8C481CCC */  lw         $t0, %lo(combat_gui_1)($v0)
/* 90D1C 8009011C 00603821 */  addu       $a3, $v1, $zero
/* 90D20 80090120 00061040 */  sll        $v0, $a2, 1
.L80090124:
/* 90D24 80090124 00461021 */  addu       $v0, $v0, $a2
/* 90D28 80090128 000210C0 */  sll        $v0, $v0, 3
/* 90D2C 8009012C 01022821 */  addu       $a1, $t0, $v0
/* 90D30 80090130 8CA30010 */  lw         $v1, 0x10($a1)
/* 90D34 80090134 14640009 */  bne        $v1, $a0, .L8009015C
/* 90D38 80090138 24C20001 */   addiu     $v0, $a2, 1
/* 90D3C 8009013C 8CA2000C */  lw         $v0, 0xc($a1)
/* 90D40 80090140 10400006 */  beqz       $v0, .L8009015C
/* 90D44 80090144 24C20001 */   addiu     $v0, $a2, 1
/* 90D48 80090148 8CA20014 */  lw         $v0, 0x14($a1)
/* 90D4C 8009014C 14400003 */  bnez       $v0, .L8009015C
/* 90D50 80090150 24C20001 */   addiu     $v0, $a2, 1
/* 90D54 80090154 03E00008 */  jr         $ra
/* 90D58 80090158 00C01021 */   addu      $v0, $a2, $zero
.L8009015C:
/* 90D5C 8009015C 304600FF */  andi       $a2, $v0, 0xff
/* 90D60 80090160 00C7182B */  sltu       $v1, $a2, $a3
/* 90D64 80090164 1460FFEF */  bnez       $v1, .L80090124
/* 90D68 80090168 00061040 */   sll       $v0, $a2, 1
.L8009016C:
/* 90D6C 8009016C 03E00008 */  jr         $ra
/* 90D70 80090170 240200FF */   addiu     $v0, $zero, 0xff

glabel func_80090174
/* 90D74 80090174 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* 90D78 80090178 308600FF */  andi       $a2, $a0, 0xff
/* 90D7C 8009017C 24040018 */  addiu      $a0, $zero, 0x18
/* 90D80 80090180 3C07800F */  lui        $a3, %hi(combat_gui_1)
/* 90D84 80090184 00061040 */  sll        $v0, $a2, 1
/* 90D88 80090188 00461021 */  addu       $v0, $v0, $a2
/* 90D8C 8009018C 8CE31CCC */  lw         $v1, %lo(combat_gui_1)($a3)
/* 90D90 80090190 000210C0 */  sll        $v0, $v0, 3
/* 90D94 80090194 AFB1001C */  sw         $s1, 0x1c($sp)
/* 90D98 80090198 00A08821 */  addu       $s1, $a1, $zero
/* 90D9C 8009019C AFBF003C */  sw         $ra, 0x3c($sp)
/* 90DA0 800901A0 AFBE0038 */  sw         $fp, 0x38($sp)
/* 90DA4 800901A4 AFB70034 */  sw         $s7, 0x34($sp)
/* 90DA8 800901A8 AFB60030 */  sw         $s6, 0x30($sp)
/* 90DAC 800901AC AFB5002C */  sw         $s5, 0x2c($sp)
/* 90DB0 800901B0 AFB40028 */  sw         $s4, 0x28($sp)
/* 90DB4 800901B4 AFB30024 */  sw         $s3, 0x24($sp)
/* 90DB8 800901B8 AFB20020 */  sw         $s2, 0x20($sp)
/* 90DBC 800901BC AFB00018 */  sw         $s0, 0x18($sp)
/* 90DC0 800901C0 F7B40040 */  sdc1       $f20, 0x40($sp)
/* 90DC4 800901C4 00628021 */  addu       $s0, $v1, $v0
/* 90DC8 800901C8 AE00000C */  sw         $zero, 0xc($s0)
/* 90DCC 800901CC A2260010 */  sb         $a2, 0x10($s1)
/* 90DD0 800901D0 8E030000 */  lw         $v1, ($s0)
/* 90DD4 800901D4 24020001 */  addiu      $v0, $zero, 1
/* 90DD8 800901D8 AC62007C */  sw         $v0, 0x7c($v1)
/* 90DDC 800901DC 0C026259 */  jal        passToMalloc
/* 90DE0 800901E0 AE000014 */   sw        $zero, 0x14($s0)
/* 90DE4 800901E4 3C03800E */  lui        $v1, %hi(D_800E51C8)
/* 90DE8 800901E8 247E51C8 */  addiu      $fp, $v1, %lo(D_800E51C8)
/* 90DEC 800901EC 3C01800E */  lui        $at, %hi(D_800E19D4)
/* 90DF0 800901F0 C43419D4 */  lwc1       $f20, %lo(D_800E19D4)($at)
/* 90DF4 800901F4 8E250000 */  lw         $a1, ($s1)
/* 90DF8 800901F8 3C12800F */  lui        $s2, 0x800f
/* 90DFC 800901FC AC400000 */  sw         $zero, ($v0)
/* 90E00 80090200 AC5E0008 */  sw         $fp, 8($v0)
/* 90E04 80090204 24A30060 */  addiu      $v1, $a1, 0x60
/* 90E08 80090208 E4540004 */  swc1       $f20, 4($v0)
/* 90E0C 8009020C AC43000C */  sw         $v1, 0xc($v0)
/* 90E10 80090210 84A40060 */  lh         $a0, 0x60($a1)
/* 90E14 80090214 00402821 */  addu       $a1, $v0, $zero
/* 90E18 80090218 44840000 */  mtc1       $a0, $f0
/* 90E1C 8009021C 46800020 */  cvt.s.w    $f0, $f0
/* 90E20 80090220 E4400010 */  swc1       $f0, 0x10($v0)
/* 90E24 80090224 86030004 */  lh         $v1, 4($s0)
/* 90E28 80090228 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90E2C 8009022C 44830000 */  mtc1       $v1, $f0
/* 90E30 80090230 46800020 */  cvt.s.w    $f0, $f0
/* 90E34 80090234 0C035923 */  jal        func_800D648C
/* 90E38 80090238 E4400014 */   swc1      $f0, 0x14($v0)
/* 90E3C 8009023C 0C026259 */  jal        passToMalloc
/* 90E40 80090240 24040050 */   addiu     $a0, $zero, 0x50
/* 90E44 80090244 00402021 */  addu       $a0, $v0, $zero
/* 90E48 80090248 26160006 */  addiu      $s6, $s0, 6
/* 90E4C 8009024C 02C03021 */  addu       $a2, $s6, $zero
/* 90E50 80090250 2407003C */  addiu      $a3, $zero, 0x3c
/* 90E54 80090254 3C02800F */  lui        $v0, %hi(double_array_1)
/* 90E58 80090258 8E250000 */  lw         $a1, ($s1)
/* 90E5C 8009025C 24575140 */  addiu      $s7, $v0, %lo(double_array_1)
/* 90E60 80090260 AFB70010 */  sw         $s7, 0x10($sp)
/* 90E64 80090264 0C035A50 */  jal        func_800D6940
/* 90E68 80090268 24A50062 */   addiu     $a1, $a1, 0x62
/* 90E6C 8009026C 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90E70 80090270 0C035923 */  jal        func_800D648C
/* 90E74 80090274 00402821 */   addu      $a1, $v0, $zero
/* 90E78 80090278 0C026259 */  jal        passToMalloc
/* 90E7C 8009027C 24040050 */   addiu     $a0, $zero, 0x50
/* 90E80 80090280 00402021 */  addu       $a0, $v0, $zero
/* 90E84 80090284 26150008 */  addiu      $s5, $s0, 8
/* 90E88 80090288 02A03021 */  addu       $a2, $s5, $zero
/* 90E8C 8009028C 2407003C */  addiu      $a3, $zero, 0x3c
/* 90E90 80090290 3C02800F */  lui        $v0, %hi(double_array_0)
/* 90E94 80090294 8E250000 */  lw         $a1, ($s1)
/* 90E98 80090298 24535110 */  addiu      $s3, $v0, %lo(double_array_0)
/* 90E9C 8009029C AFB30010 */  sw         $s3, 0x10($sp)
/* 90EA0 800902A0 0C035AA4 */  jal        func_800D6A90
/* 90EA4 800902A4 24A50074 */   addiu     $a1, $a1, 0x74
/* 90EA8 800902A8 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90EAC 800902AC 0C035923 */  jal        func_800D648C
/* 90EB0 800902B0 00402821 */   addu      $a1, $v0, $zero
/* 90EB4 800902B4 0C026259 */  jal        passToMalloc
/* 90EB8 800902B8 24040050 */   addiu     $a0, $zero, 0x50
/* 90EBC 800902BC 00402021 */  addu       $a0, $v0, $zero
/* 90EC0 800902C0 2614000A */  addiu      $s4, $s0, 0xa
/* 90EC4 800902C4 02803021 */  addu       $a2, $s4, $zero
/* 90EC8 800902C8 8E250000 */  lw         $a1, ($s1)
/* 90ECC 800902CC 2407003C */  addiu      $a3, $zero, 0x3c
/* 90ED0 800902D0 AFB30010 */  sw         $s3, 0x10($sp)
/* 90ED4 800902D4 0C035AA4 */  jal        func_800D6A90
/* 90ED8 800902D8 24A50072 */   addiu     $a1, $a1, 0x72
/* 90EDC 800902DC 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90EE0 800902E0 0C035923 */  jal        func_800D648C
/* 90EE4 800902E4 00402821 */   addu      $a1, $v0, $zero
/* 90EE8 800902E8 8E220004 */  lw         $v0, 4($s1)
/* 90EEC 800902EC 10400039 */  beqz       $v0, .L800903D4
/* 90EF0 800902F0 8FBF003C */   lw        $ra, 0x3c($sp)
/* 90EF4 800902F4 0C026259 */  jal        passToMalloc
/* 90EF8 800902F8 24040018 */   addiu     $a0, $zero, 0x18
/* 90EFC 800902FC 8E250004 */  lw         $a1, 4($s1)
/* 90F00 80090300 AC400000 */  sw         $zero, ($v0)
/* 90F04 80090304 E4540004 */  swc1       $f20, 4($v0)
/* 90F08 80090308 AC5E0008 */  sw         $fp, 8($v0)
/* 90F0C 8009030C 24A30060 */  addiu      $v1, $a1, 0x60
/* 90F10 80090310 AC43000C */  sw         $v1, 0xc($v0)
/* 90F14 80090314 84A40060 */  lh         $a0, 0x60($a1)
/* 90F18 80090318 00402821 */  addu       $a1, $v0, $zero
/* 90F1C 8009031C 44840000 */  mtc1       $a0, $f0
/* 90F20 80090320 46800020 */  cvt.s.w    $f0, $f0
/* 90F24 80090324 E4400010 */  swc1       $f0, 0x10($v0)
/* 90F28 80090328 86030004 */  lh         $v1, 4($s0)
/* 90F2C 8009032C 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90F30 80090330 44830000 */  mtc1       $v1, $f0
/* 90F34 80090334 46800020 */  cvt.s.w    $f0, $f0
/* 90F38 80090338 0C035923 */  jal        func_800D648C
/* 90F3C 8009033C E4400014 */   swc1      $f0, 0x14($v0)
/* 90F40 80090340 0C026259 */  jal        passToMalloc
/* 90F44 80090344 24040050 */   addiu     $a0, $zero, 0x50
/* 90F48 80090348 00402021 */  addu       $a0, $v0, $zero
/* 90F4C 8009034C 02C03021 */  addu       $a2, $s6, $zero
/* 90F50 80090350 8E250004 */  lw         $a1, 4($s1)
/* 90F54 80090354 2407003C */  addiu      $a3, $zero, 0x3c
/* 90F58 80090358 AFB70010 */  sw         $s7, 0x10($sp)
/* 90F5C 8009035C 0C035A50 */  jal        func_800D6940
/* 90F60 80090360 24A50062 */   addiu     $a1, $a1, 0x62
/* 90F64 80090364 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90F68 80090368 0C035923 */  jal        func_800D648C
/* 90F6C 8009036C 00402821 */   addu      $a1, $v0, $zero
/* 90F70 80090370 0C026259 */  jal        passToMalloc
/* 90F74 80090374 24040050 */   addiu     $a0, $zero, 0x50
/* 90F78 80090378 00402021 */  addu       $a0, $v0, $zero
/* 90F7C 8009037C 02A03021 */  addu       $a2, $s5, $zero
/* 90F80 80090380 8E250004 */  lw         $a1, 4($s1)
/* 90F84 80090384 2407003C */  addiu      $a3, $zero, 0x3c
/* 90F88 80090388 AFB30010 */  sw         $s3, 0x10($sp)
/* 90F8C 8009038C 0C035AA4 */  jal        func_800D6A90
/* 90F90 80090390 24A50074 */   addiu     $a1, $a1, 0x74
/* 90F94 80090394 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90F98 80090398 0C035923 */  jal        func_800D648C
/* 90F9C 8009039C 00402821 */   addu      $a1, $v0, $zero
/* 90FA0 800903A0 0C026259 */  jal        passToMalloc
/* 90FA4 800903A4 24040050 */   addiu     $a0, $zero, 0x50
/* 90FA8 800903A8 00402021 */  addu       $a0, $v0, $zero
/* 90FAC 800903AC 02803021 */  addu       $a2, $s4, $zero
/* 90FB0 800903B0 8E250004 */  lw         $a1, 4($s1)
/* 90FB4 800903B4 2407003C */  addiu      $a3, $zero, 0x3c
/* 90FB8 800903B8 AFB30010 */  sw         $s3, 0x10($sp)
/* 90FBC 800903BC 0C035AA4 */  jal        func_800D6A90
/* 90FC0 800903C0 24A50072 */   addiu     $a1, $a1, 0x72
/* 90FC4 800903C4 8E441CD0 */  lw         $a0, 0x1cd0($s2)
/* 90FC8 800903C8 0C035923 */  jal        func_800D648C
/* 90FCC 800903CC 00402821 */   addu      $a1, $v0, $zero
/* 90FD0 800903D0 8FBF003C */  lw         $ra, 0x3c($sp)
.L800903D4:
/* 90FD4 800903D4 8FBE0038 */  lw         $fp, 0x38($sp)
/* 90FD8 800903D8 8FB70034 */  lw         $s7, 0x34($sp)
/* 90FDC 800903DC 8FB60030 */  lw         $s6, 0x30($sp)
/* 90FE0 800903E0 8FB5002C */  lw         $s5, 0x2c($sp)
/* 90FE4 800903E4 8FB40028 */  lw         $s4, 0x28($sp)
/* 90FE8 800903E8 8FB30024 */  lw         $s3, 0x24($sp)
/* 90FEC 800903EC 8FB20020 */  lw         $s2, 0x20($sp)
/* 90FF0 800903F0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 90FF4 800903F4 8FB00018 */  lw         $s0, 0x18($sp)
/* 90FF8 800903F8 D7B40040 */  ldc1       $f20, 0x40($sp)
/* 90FFC 800903FC 03E00008 */  jr         $ra
/* 91000 80090400 27BD0048 */   addiu     $sp, $sp, 0x48

glabel func_80090404
/* 91004 80090404 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 91008 80090408 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 9100C 8009040C 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 91010 80090410 AFB10014 */  sw         $s1, 0x14($sp)
/* 91014 80090414 00008821 */  addu       $s1, $zero, $zero
/* 91018 80090418 AFB50024 */  sw         $s5, 0x24($sp)
/* 9101C 8009041C 0040A821 */  addu       $s5, $v0, $zero
/* 91020 80090420 AFBF0028 */  sw         $ra, 0x28($sp)
/* 91024 80090424 AFB40020 */  sw         $s4, 0x20($sp)
/* 91028 80090428 AFB3001C */  sw         $s3, 0x1c($sp)
/* 9102C 8009042C AFB20018 */  sw         $s2, 0x18($sp)
/* 91030 80090430 1060001C */  beqz       $v1, .L800904A4
/* 91034 80090434 AFB00010 */   sw        $s0, 0x10($sp)
/* 91038 80090438 3C14800F */  lui        $s4, %hi(combat_gui)
/* 9103C 8009043C 241300FF */  addiu      $s3, $zero, 0xff
/* 91040 80090440 24120005 */  addiu      $s2, $zero, 5
/* 91044 80090444 00111040 */  sll        $v0, $s1, 1
.L80090448:
/* 91048 80090448 00511021 */  addu       $v0, $v0, $s1
/* 9104C 8009044C 8E841CC8 */  lw         $a0, %lo(combat_gui)($s4)
/* 91050 80090450 000210C0 */  sll        $v0, $v0, 3
/* 91054 80090454 00828021 */  addu       $s0, $a0, $v0
/* 91058 80090458 92030010 */  lbu        $v1, 0x10($s0)
/* 9105C 8009045C 1473000C */  bne        $v1, $s3, .L80090490
/* 91060 80090460 26230001 */   addiu     $v1, $s1, 1
/* 91064 80090464 9202000B */  lbu        $v0, 0xb($s0)
/* 91068 80090468 1052000A */  beq        $v0, $s2, .L80090494
/* 9106C 8009046C 92A21CC4 */   lbu       $v0, 0x1cc4($s5)
/* 91070 80090470 8E04000C */  lw         $a0, 0xc($s0)
/* 91074 80090474 0C024041 */  jal        get_combat_gui_index_
/* 91078 80090478 38840001 */   xori      $a0, $a0, 1
/* 9107C 8009047C A2020010 */  sb         $v0, 0x10($s0)
/* 91080 80090480 304400FF */  andi       $a0, $v0, 0xff
/* 91084 80090484 0C02405D */  jal        func_80090174
/* 91088 80090488 02002821 */   addu      $a1, $s0, $zero
/* 9108C 8009048C 26230001 */  addiu      $v1, $s1, 1
.L80090490:
/* 91090 80090490 92A21CC4 */  lbu        $v0, 0x1cc4($s5)
.L80090494:
/* 91094 80090494 3071FFFF */  andi       $s1, $v1, 0xffff
/* 91098 80090498 0222102B */  sltu       $v0, $s1, $v0
/* 9109C 8009049C 1440FFEA */  bnez       $v0, .L80090448
/* 910A0 800904A0 00111040 */   sll       $v0, $s1, 1
.L800904A4:
/* 910A4 800904A4 8FBF0028 */  lw         $ra, 0x28($sp)
/* 910A8 800904A8 8FB50024 */  lw         $s5, 0x24($sp)
/* 910AC 800904AC 8FB40020 */  lw         $s4, 0x20($sp)
/* 910B0 800904B0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 910B4 800904B4 8FB20018 */  lw         $s2, 0x18($sp)
/* 910B8 800904B8 8FB10014 */  lw         $s1, 0x14($sp)
/* 910BC 800904BC 8FB00010 */  lw         $s0, 0x10($sp)
/* 910C0 800904C0 03E00008 */  jr         $ra
/* 910C4 800904C4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800904C8
/* 910C8 800904C8 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 910CC 800904CC 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 910D0 800904D0 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 910D4 800904D4 AFB00018 */  sw         $s0, 0x18($sp)
/* 910D8 800904D8 00008021 */  addu       $s0, $zero, $zero
/* 910DC 800904DC AFB40028 */  sw         $s4, 0x28($sp)
/* 910E0 800904E0 0040A021 */  addu       $s4, $v0, $zero
/* 910E4 800904E4 AFBF002C */  sw         $ra, 0x2c($sp)
/* 910E8 800904E8 AFB30024 */  sw         $s3, 0x24($sp)
/* 910EC 800904EC AFB20020 */  sw         $s2, 0x20($sp)
/* 910F0 800904F0 10600015 */  beqz       $v1, .L80090548
/* 910F4 800904F4 AFB1001C */   sw        $s1, 0x1c($sp)
/* 910F8 800904F8 3C13800F */  lui        $s3, %hi(combat_gui_1)
/* 910FC 800904FC 241200C8 */  addiu      $s2, $zero, 0xc8
/* 91100 80090500 00008821 */  addu       $s1, $zero, $zero
.L80090504:
/* 91104 80090504 8E621CCC */  lw         $v0, %lo(combat_gui_1)($s3)
/* 91108 80090508 00511021 */  addu       $v0, $v0, $s1
/* 9110C 8009050C 8C430000 */  lw         $v1, ($v0)
/* 91110 80090510 26100001 */  addiu      $s0, $s0, 1
/* 91114 80090514 8C670078 */  lw         $a3, 0x78($v1)
/* 91118 80090518 00002821 */  addu       $a1, $zero, $zero
/* 9111C 8009051C 84E40048 */  lh         $a0, 0x48($a3)
/* 91120 80090520 00003021 */  addu       $a2, $zero, $zero
/* 91124 80090524 AFB20010 */  sw         $s2, 0x10($sp)
/* 91128 80090528 00642021 */  addu       $a0, $v1, $a0
/* 9112C 8009052C 8CE3004C */  lw         $v1, 0x4c($a3)
/* 91130 80090530 0060F809 */  jalr       $v1
/* 91134 80090534 00003821 */   addu      $a3, $zero, $zero
/* 91138 80090538 92821CC4 */  lbu        $v0, 0x1cc4($s4)
/* 9113C 8009053C 0202102B */  sltu       $v0, $s0, $v0
/* 91140 80090540 1440FFF0 */  bnez       $v0, .L80090504
/* 91144 80090544 26310018 */   addiu     $s1, $s1, 0x18
.L80090548:
/* 91148 80090548 8FBF002C */  lw         $ra, 0x2c($sp)
/* 9114C 8009054C 8FB40028 */  lw         $s4, 0x28($sp)
/* 91150 80090550 8FB30024 */  lw         $s3, 0x24($sp)
/* 91154 80090554 8FB20020 */  lw         $s2, 0x20($sp)
/* 91158 80090558 8FB1001C */  lw         $s1, 0x1c($sp)
/* 9115C 8009055C 8FB00018 */  lw         $s0, 0x18($sp)
/* 91160 80090560 03E00008 */  jr         $ra
/* 91164 80090564 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80090568
/* 91168 80090568 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 9116C 8009056C 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 91170 80090570 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 91174 80090574 AFB00018 */  sw         $s0, 0x18($sp)
/* 91178 80090578 00008021 */  addu       $s0, $zero, $zero
/* 9117C 8009057C AFB40028 */  sw         $s4, 0x28($sp)
/* 91180 80090580 0040A021 */  addu       $s4, $v0, $zero
/* 91184 80090584 AFBF002C */  sw         $ra, 0x2c($sp)
/* 91188 80090588 AFB30024 */  sw         $s3, 0x24($sp)
/* 9118C 8009058C AFB20020 */  sw         $s2, 0x20($sp)
/* 91190 80090590 10600020 */  beqz       $v1, .L80090614
/* 91194 80090594 AFB1001C */   sw        $s1, 0x1c($sp)
/* 91198 80090598 3C13800F */  lui        $s3, %hi(combat_gui)
/* 9119C 8009059C 3C12800F */  lui        $s2, 0x800f
/* 911A0 800905A0 00008821 */  addu       $s1, $zero, $zero
.L800905A4:
/* 911A4 800905A4 8E621CC8 */  lw         $v0, %lo(combat_gui)($s3)
/* 911A8 800905A8 00512021 */  addu       $a0, $v0, $s1
/* 911AC 800905AC 8C830014 */  lw         $v1, 0x14($a0)
/* 911B0 800905B0 10600013 */  beqz       $v1, .L80090600
/* 911B4 800905B4 240500FF */   addiu     $a1, $zero, 0xff
/* 911B8 800905B8 90820010 */  lbu        $v0, 0x10($a0)
/* 911BC 800905BC 10450010 */  beq        $v0, $a1, .L80090600
/* 911C0 800905C0 00401821 */   addu      $v1, $v0, $zero
/* 911C4 800905C4 00031040 */  sll        $v0, $v1, 1
/* 911C8 800905C8 00431021 */  addu       $v0, $v0, $v1
/* 911CC 800905CC 8E441CCC */  lw         $a0, 0x1ccc($s2)
/* 911D0 800905D0 000210C0 */  sll        $v0, $v0, 3
/* 911D4 800905D4 00441021 */  addu       $v0, $v0, $a0
/* 911D8 800905D8 8C430000 */  lw         $v1, ($v0)
/* 911DC 800905DC 8C670078 */  lw         $a3, 0x78($v1)
/* 911E0 800905E0 84E40048 */  lh         $a0, 0x48($a3)
/* 911E4 800905E4 240600A4 */  addiu      $a2, $zero, 0xa4
/* 911E8 800905E8 AFA50010 */  sw         $a1, 0x10($sp)
/* 911EC 800905EC 240500C8 */  addiu      $a1, $zero, 0xc8
/* 911F0 800905F0 8CE2004C */  lw         $v0, 0x4c($a3)
/* 911F4 800905F4 00003821 */  addu       $a3, $zero, $zero
/* 911F8 800905F8 0040F809 */  jalr       $v0
/* 911FC 800905FC 00642021 */   addu      $a0, $v1, $a0
.L80090600:
/* 91200 80090600 92821CC4 */  lbu        $v0, 0x1cc4($s4)
/* 91204 80090604 26100001 */  addiu      $s0, $s0, 1
/* 91208 80090608 0202102B */  sltu       $v0, $s0, $v0
/* 9120C 8009060C 1440FFE5 */  bnez       $v0, .L800905A4
/* 91210 80090610 26310018 */   addiu     $s1, $s1, 0x18
.L80090614:
/* 91214 80090614 8FBF002C */  lw         $ra, 0x2c($sp)
/* 91218 80090618 8FB40028 */  lw         $s4, 0x28($sp)
/* 9121C 8009061C 8FB30024 */  lw         $s3, 0x24($sp)
/* 91220 80090620 8FB20020 */  lw         $s2, 0x20($sp)
/* 91224 80090624 8FB1001C */  lw         $s1, 0x1c($sp)
/* 91228 80090628 8FB00018 */  lw         $s0, 0x18($sp)
/* 9122C 8009062C 03E00008 */  jr         $ra
/* 91230 80090630 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_80090634
/* 91234 80090634 3C02800F */  lui        $v0, %hi(combat_gui_tally)
/* 91238 80090638 90431CC4 */  lbu        $v1, %lo(combat_gui_tally)($v0)
/* 9123C 8009063C 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 91240 80090640 AFB20020 */  sw         $s2, 0x20($sp)
/* 91244 80090644 00009021 */  addu       $s2, $zero, $zero
/* 91248 80090648 AFBF003C */  sw         $ra, 0x3c($sp)
/* 9124C 8009064C AFBE0038 */  sw         $fp, 0x38($sp)
/* 91250 80090650 AFB70034 */  sw         $s7, 0x34($sp)
/* 91254 80090654 AFB60030 */  sw         $s6, 0x30($sp)
/* 91258 80090658 AFB5002C */  sw         $s5, 0x2c($sp)
/* 9125C 8009065C AFB40028 */  sw         $s4, 0x28($sp)
/* 91260 80090660 AFB30024 */  sw         $s3, 0x24($sp)
/* 91264 80090664 AFB1001C */  sw         $s1, 0x1c($sp)
/* 91268 80090668 10600088 */  beqz       $v1, .L8009088C
/* 9126C 8009066C AFB00018 */   sw        $s0, 0x18($sp)
/* 91270 80090670 3C1E800F */  lui        $fp, 0x800f
/* 91274 80090674 24170096 */  addiu      $s7, $zero, 0x96
/* 91278 80090678 3C02800E */  lui        $v0, %hi(gGlobals)
/* 9127C 8009067C 245668A8 */  addiu      $s6, $v0, %lo(gGlobals)
/* 91280 80090680 241500FF */  addiu      $s5, $zero, 0xff
/* 91284 80090684 00121040 */  sll        $v0, $s2, 1
.L80090688:
/* 91288 80090688 00521021 */  addu       $v0, $v0, $s2
/* 9128C 8009068C 8FC31CC8 */  lw         $v1, 0x1cc8($fp)
/* 91290 80090690 000210C0 */  sll        $v0, $v0, 3
/* 91294 80090694 00628821 */  addu       $s1, $v1, $v0
/* 91298 80090698 9223000B */  lbu        $v1, 0xb($s1)
/* 9129C 8009069C 10600074 */  beqz       $v1, .L80090870
/* 912A0 800906A0 24020001 */   addiu     $v0, $zero, 1
/* 912A4 800906A4 10620072 */  beq        $v1, $v0, .L80090870
/* 912A8 800906A8 24020004 */   addiu     $v0, $zero, 4
/* 912AC 800906AC 10620070 */  beq        $v1, $v0, .L80090870
/* 912B0 800906B0 24020005 */   addiu     $v0, $zero, 5
/* 912B4 800906B4 1062006E */  beq        $v1, $v0, .L80090870
/* 912B8 800906B8 241300FF */   addiu     $s3, $zero, 0xff
/* 912BC 800906BC 92220010 */  lbu        $v0, 0x10($s1)
/* 912C0 800906C0 1053006B */  beq        $v0, $s3, .L80090870
/* 912C4 800906C4 3C05800F */   lui       $a1, %hi(combat_gui_1)
/* 912C8 800906C8 00022040 */  sll        $a0, $v0, 1
/* 912CC 800906CC 00822021 */  addu       $a0, $a0, $v0
/* 912D0 800906D0 000420C0 */  sll        $a0, $a0, 3
/* 912D4 800906D4 8CA31CCC */  lw         $v1, %lo(combat_gui_1)($a1)
/* 912D8 800906D8 3C05800F */  lui        $a1, %hi(combatPointer)
/* 912DC 800906DC 00A0A021 */  addu       $s4, $a1, $zero
/* 912E0 800906E0 9222000A */  lbu        $v0, 0xa($s1)
/* 912E4 800906E4 00832021 */  addu       $a0, $a0, $v1
/* 912E8 800906E8 8CA3F760 */  lw         $v1, %lo(combatPointer)($a1)
/* 912EC 800906EC 00021080 */  sll        $v0, $v0, 2
/* 912F0 800906F0 00621821 */  addu       $v1, $v1, $v0
/* 912F4 800906F4 8C6252D0 */  lw         $v0, 0x52d0($v1)
/* 912F8 800906F8 10400010 */  beqz       $v0, .L8009073C
/* 912FC 800906FC 8C900000 */   lw        $s0, ($a0)
/* 91300 80090700 8C440044 */  lw         $a0, 0x44($v0)
/* 91304 80090704 5080000E */  beql       $a0, $zero, .L80090740
/* 91308 80090708 9222000A */   lbu       $v0, 0xa($s1)
/* 9130C 8009070C 0C0192CB */  jal        func_80064B2C
/* 91310 80090710 00000000 */   nop
/* 91314 80090714 10400009 */  beqz       $v0, .L8009073C
/* 91318 80090718 240500C8 */   addiu     $a1, $zero, 0xc8
/* 9131C 8009071C 8E020078 */  lw         $v0, 0x78($s0)
/* 91320 80090720 240600A4 */  addiu      $a2, $zero, 0xa4
/* 91324 80090724 84440048 */  lh         $a0, 0x48($v0)
/* 91328 80090728 00003821 */  addu       $a3, $zero, $zero
/* 9132C 8009072C AFB30010 */  sw         $s3, 0x10($sp)
/* 91330 80090730 8C43004C */  lw         $v1, 0x4c($v0)
/* 91334 80090734 0060F809 */  jalr       $v1
/* 91338 80090738 02042021 */   addu      $a0, $s0, $a0
.L8009073C:
/* 9133C 8009073C 9222000A */  lbu        $v0, 0xa($s1)
.L80090740:
/* 91340 80090740 8E83F760 */  lw         $v1, -0x8a0($s4)
/* 91344 80090744 00021080 */  sll        $v0, $v0, 2
/* 91348 80090748 00621821 */  addu       $v1, $v1, $v0
/* 9134C 8009074C 8C644E64 */  lw         $a0, 0x4e64($v1)
/* 91350 80090750 10800009 */  beqz       $a0, .L80090778
/* 91354 80090754 00002821 */   addu      $a1, $zero, $zero
/* 91358 80090758 8E020078 */  lw         $v0, 0x78($s0)
/* 9135C 8009075C 240600C8 */  addiu      $a2, $zero, 0xc8
/* 91360 80090760 84440048 */  lh         $a0, 0x48($v0)
/* 91364 80090764 00003821 */  addu       $a3, $zero, $zero
/* 91368 80090768 AFB70010 */  sw         $s7, 0x10($sp)
/* 9136C 8009076C 8C43004C */  lw         $v1, 0x4c($v0)
/* 91370 80090770 0060F809 */  jalr       $v1
/* 91374 80090774 02042021 */   addu      $a0, $s0, $a0
.L80090778:
/* 91378 80090778 9222000A */  lbu        $v0, 0xa($s1)
/* 9137C 8009077C 8E83F760 */  lw         $v1, -0x8a0($s4)
/* 91380 80090780 00021080 */  sll        $v0, $v0, 2
/* 91384 80090784 00621821 */  addu       $v1, $v1, $v0
/* 91388 80090788 8C644F0C */  lw         $a0, 0x4f0c($v1)
/* 9138C 8009078C 10800009 */  beqz       $a0, .L800907B4
/* 91390 80090790 240500C8 */   addiu     $a1, $zero, 0xc8
/* 91394 80090794 8E020078 */  lw         $v0, 0x78($s0)
/* 91398 80090798 00003021 */  addu       $a2, $zero, $zero
/* 9139C 8009079C 84440048 */  lh         $a0, 0x48($v0)
/* 913A0 800907A0 00003821 */  addu       $a3, $zero, $zero
/* 913A4 800907A4 AFB70010 */  sw         $s7, 0x10($sp)
/* 913A8 800907A8 8C43004C */  lw         $v1, 0x4c($v0)
/* 913AC 800907AC 0060F809 */  jalr       $v1
/* 913B0 800907B0 02042021 */   addu      $a0, $s0, $a0
.L800907B4:
/* 913B4 800907B4 9222000A */  lbu        $v0, 0xa($s1)
/* 913B8 800907B8 8E85F760 */  lw         $a1, -0x8a0($s4)
/* 913BC 800907BC 00022080 */  sll        $a0, $v0, 2
/* 913C0 800907C0 00A41821 */  addu       $v1, $a1, $a0
/* 913C4 800907C4 8C624EAC */  lw         $v0, 0x4eac($v1)
/* 913C8 800907C8 10400012 */  beqz       $v0, .L80090814
/* 913CC 800907CC 00601021 */   addu      $v0, $v1, $zero
/* 913D0 800907D0 8C434E64 */  lw         $v1, 0x4e64($v0)
/* 913D4 800907D4 1060000F */  beqz       $v1, .L80090814
/* 913D8 800907D8 24020009 */   addiu     $v0, $zero, 9
/* 913DC 800907DC 92C313C8 */  lbu        $v1, 0x13c8($s6)
/* 913E0 800907E0 10620003 */  beq        $v1, $v0, .L800907F0
/* 913E4 800907E4 24020012 */   addiu     $v0, $zero, 0x12
/* 913E8 800907E8 5462000B */  bnel       $v1, $v0, .L80090818
/* 913EC 800907EC 9222000A */   lbu       $v0, 0xa($s1)
.L800907F0:
/* 913F0 800907F0 00002821 */  addu       $a1, $zero, $zero
/* 913F4 800907F4 8E020078 */  lw         $v0, 0x78($s0)
/* 913F8 800907F8 240600FF */  addiu      $a2, $zero, 0xff
/* 913FC 800907FC 84440048 */  lh         $a0, 0x48($v0)
/* 91400 80090800 00003821 */  addu       $a3, $zero, $zero
/* 91404 80090804 AFB50010 */  sw         $s5, 0x10($sp)
/* 91408 80090808 8C43004C */  lw         $v1, 0x4c($v0)
/* 9140C 8009080C 0060F809 */  jalr       $v1
/* 91410 80090810 02042021 */   addu      $a0, $s0, $a0
.L80090814:
/* 91414 80090814 9222000A */  lbu        $v0, 0xa($s1)
.L80090818:
/* 91418 80090818 8E84F760 */  lw         $a0, -0x8a0($s4)
/* 9141C 8009081C 00022880 */  sll        $a1, $v0, 2
/* 91420 80090820 00851821 */  addu       $v1, $a0, $a1
/* 91424 80090824 8C624F54 */  lw         $v0, 0x4f54($v1)
/* 91428 80090828 10400011 */  beqz       $v0, .L80090870
/* 9142C 8009082C 00601021 */   addu      $v0, $v1, $zero
/* 91430 80090830 8C434F0C */  lw         $v1, 0x4f0c($v0)
/* 91434 80090834 1060000F */  beqz       $v1, .L80090874
/* 91438 80090838 26430001 */   addiu     $v1, $s2, 1
/* 9143C 8009083C 92C213C8 */  lbu        $v0, 0x13c8($s6)
/* 91440 80090840 2442FFF6 */  addiu      $v0, $v0, -0xa
/* 91444 80090844 2C420002 */  sltiu      $v0, $v0, 2
/* 91448 80090848 1040000A */  beqz       $v0, .L80090874
/* 9144C 8009084C 240500FF */   addiu     $a1, $zero, 0xff
/* 91450 80090850 8E020078 */  lw         $v0, 0x78($s0)
/* 91454 80090854 00003021 */  addu       $a2, $zero, $zero
/* 91458 80090858 84440048 */  lh         $a0, 0x48($v0)
/* 9145C 8009085C 00003821 */  addu       $a3, $zero, $zero
/* 91460 80090860 AFB50010 */  sw         $s5, 0x10($sp)
/* 91464 80090864 8C43004C */  lw         $v1, 0x4c($v0)
/* 91468 80090868 0060F809 */  jalr       $v1
/* 9146C 8009086C 02042021 */   addu      $a0, $s0, $a0
.L80090870:
/* 91470 80090870 26430001 */  addiu      $v1, $s2, 1
.L80090874:
/* 91474 80090874 3C04800F */  lui        $a0, %hi(combat_gui_tally)
/* 91478 80090878 90821CC4 */  lbu        $v0, %lo(combat_gui_tally)($a0)
/* 9147C 8009087C 307200FF */  andi       $s2, $v1, 0xff
/* 91480 80090880 0242102B */  sltu       $v0, $s2, $v0
/* 91484 80090884 1440FF80 */  bnez       $v0, .L80090688
/* 91488 80090888 00121040 */   sll       $v0, $s2, 1
.L8009088C:
/* 9148C 8009088C 8FBF003C */  lw         $ra, 0x3c($sp)
/* 91490 80090890 8FBE0038 */  lw         $fp, 0x38($sp)
/* 91494 80090894 8FB70034 */  lw         $s7, 0x34($sp)
/* 91498 80090898 8FB60030 */  lw         $s6, 0x30($sp)
/* 9149C 8009089C 8FB5002C */  lw         $s5, 0x2c($sp)
/* 914A0 800908A0 8FB40028 */  lw         $s4, 0x28($sp)
/* 914A4 800908A4 8FB30024 */  lw         $s3, 0x24($sp)
/* 914A8 800908A8 8FB20020 */  lw         $s2, 0x20($sp)
/* 914AC 800908AC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 914B0 800908B0 8FB00018 */  lw         $s0, 0x18($sp)
/* 914B4 800908B4 03E00008 */  jr         $ra
/* 914B8 800908B8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel three_combat_gui_funcs
/* 914BC 800908BC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 914C0 800908C0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 914C4 800908C4 0C024132 */  jal        func_800904C8
/* 914C8 800908C8 00000000 */   nop
/* 914CC 800908CC 0C02415A */  jal        func_80090568
/* 914D0 800908D0 00000000 */   nop
/* 914D4 800908D4 0C02418D */  jal        func_80090634
/* 914D8 800908D8 00000000 */   nop
/* 914DC 800908DC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 914E0 800908E0 03E00008 */  jr         $ra
/* 914E4 800908E4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800908E8
/* 914E8 800908E8 27BDFEF0 */  addiu      $sp, $sp, -0x110
/* 914EC 800908EC AFB60100 */  sw         $s6, 0x100($sp)
/* 914F0 800908F0 0080B021 */  addu       $s6, $a0, $zero
/* 914F4 800908F4 3C02800E */  lui        $v0, 0x800e
/* 914F8 800908F8 AFBF010C */  sw         $ra, 0x10c($sp)
/* 914FC 800908FC AFBE0108 */  sw         $fp, 0x108($sp)
/* 91500 80090900 AFB70104 */  sw         $s7, 0x104($sp)
/* 91504 80090904 AFB500FC */  sw         $s5, 0xfc($sp)
/* 91508 80090908 AFB400F8 */  sw         $s4, 0xf8($sp)
/* 9150C 8009090C AFB300F4 */  sw         $s3, 0xf4($sp)
/* 91510 80090910 AFB200F0 */  sw         $s2, 0xf0($sp)
/* 91514 80090914 AFB100EC */  sw         $s1, 0xec($sp)
/* 91518 80090918 AFB000E8 */  sw         $s0, 0xe8($sp)
/* 9151C 8009091C 244619D8 */  addiu      $a2, $v0, 0x19d8
/* 91520 80090920 88C30000 */  lwl        $v1, ($a2)
/* 91524 80090924 98C30003 */  lwr        $v1, 3($a2)
/* 91528 80090928 ABA30028 */  swl        $v1, 0x28($sp)
/* 9152C 8009092C BBA3002B */  swr        $v1, 0x2b($sp)
/* 91530 80090930 3C03800F */  lui        $v1, %hi(combat_gui_tally)
/* 91534 80090934 90621CC4 */  lbu        $v0, %lo(combat_gui_tally)($v1)
/* 91538 80090938 10400080 */  beqz       $v0, .L80090B3C
/* 9153C 8009093C 0000A821 */   addu      $s5, $zero, $zero
/* 91540 80090940 27B700A8 */  addiu      $s7, $sp, 0xa8
/* 91544 80090944 241E00FF */  addiu      $fp, $zero, 0xff
/* 91548 80090948 00151040 */  sll        $v0, $s5, 1
.L8009094C:
/* 9154C 8009094C 00551021 */  addu       $v0, $v0, $s5
/* 91550 80090950 3C04800F */  lui        $a0, %hi(combat_gui)
/* 91554 80090954 8C831CC8 */  lw         $v1, %lo(combat_gui)($a0)
/* 91558 80090958 000210C0 */  sll        $v0, $v0, 3
/* 9155C 8009095C 00628021 */  addu       $s0, $v1, $v0
/* 91560 80090960 9203000B */  lbu        $v1, 0xb($s0)
/* 91564 80090964 1060006E */  beqz       $v1, .L80090B20
/* 91568 80090968 24020001 */   addiu     $v0, $zero, 1
/* 9156C 8009096C 1062006C */  beq        $v1, $v0, .L80090B20
/* 91570 80090970 24020004 */   addiu     $v0, $zero, 4
/* 91574 80090974 1062006A */  beq        $v1, $v0, .L80090B20
/* 91578 80090978 24020005 */   addiu     $v0, $zero, 5
/* 9157C 8009097C 10620068 */  beq        $v1, $v0, .L80090B20
/* 91580 80090980 3C04800F */   lui       $a0, %hi(combatPointer)
/* 91584 80090984 9202000A */  lbu        $v0, 0xa($s0)
/* 91588 80090988 8C83F760 */  lw         $v1, %lo(combatPointer)($a0)
/* 9158C 8009098C 00021080 */  sll        $v0, $v0, 2
/* 91590 80090990 00621821 */  addu       $v1, $v1, $v0
/* 91594 80090994 8C6452D0 */  lw         $a0, 0x52d0($v1)
/* 91598 80090998 8C910040 */  lw         $s1, 0x40($a0)
/* 9159C 8009099C 02E02021 */  addu       $a0, $s7, $zero
/* 915A0 800909A0 0C023C80 */  jal        func_8008F200
/* 915A4 800909A4 02202821 */   addu      $a1, $s1, $zero
/* 915A8 800909A8 02E02021 */  addu       $a0, $s7, $zero
/* 915AC 800909AC 3C05800E */  lui        $a1, %hi(gGlobals)
/* 915B0 800909B0 24A568A8 */  addiu      $a1, $a1, %lo(gGlobals)
/* 915B4 800909B4 8CA6203C */  lw         $a2, 0x203c($a1)
/* 915B8 800909B8 0C00AFB4 */  jal        some_portait_math
/* 915BC 800909BC 27A50068 */   addiu     $a1, $sp, 0x68
/* 915C0 800909C0 3C06800F */  lui        $a2, %hi(combat_gui_1)
/* 915C4 800909C4 9204000B */  lbu        $a0, 0xb($s0)
/* 915C8 800909C8 92030010 */  lbu        $v1, 0x10($s0)
/* 915CC 800909CC 8CC51CCC */  lw         $a1, %lo(combat_gui_1)($a2)
/* 915D0 800909D0 38840002 */  xori       $a0, $a0, 2
/* 915D4 800909D4 0004202B */  sltu       $a0, $zero, $a0
/* 915D8 800909D8 00031040 */  sll        $v0, $v1, 1
/* 915DC 800909DC 00431021 */  addu       $v0, $v0, $v1
/* 915E0 800909E0 000210C0 */  sll        $v0, $v0, 3
/* 915E4 800909E4 00A29021 */  addu       $s2, $a1, $v0
/* 915E8 800909E8 00042040 */  sll        $a0, $a0, 1
/* 915EC 800909EC 27A20028 */  addiu      $v0, $sp, 0x28
/* 915F0 800909F0 00441021 */  addu       $v0, $v0, $a0
/* 915F4 800909F4 96430004 */  lhu        $v1, 4($s2)
/* 915F8 800909F8 94450000 */  lhu        $a1, ($v0)
/* 915FC 800909FC 02202021 */  addu       $a0, $s1, $zero
/* 91600 80090A00 00651821 */  addu       $v1, $v1, $a1
/* 91604 80090A04 0C01DED7 */  jal        getHPCurrent
/* 91608 80090A08 3074FFFF */   andi      $s4, $v1, 0xffff
/* 9160C 80090A0C 02202021 */  addu       $a0, $s1, $zero
/* 91610 80090A10 0C01DEBD */  jal        getHPMax
/* 91614 80090A14 00408021 */   addu      $s0, $v0, $zero
/* 91618 80090A18 44901000 */  mtc1       $s0, $f2
/* 9161C 80090A1C 468010A0 */  cvt.s.w    $f2, $f2
/* 91620 80090A20 44820000 */  mtc1       $v0, $f0
/* 91624 80090A24 46800020 */  cvt.s.w    $f0, $f0
/* 91628 80090A28 3C01800E */  lui        $at, %hi(D_800E19DC)
/* 9162C 80090A2C C42419DC */  lwc1       $f4, %lo(D_800E19DC)($at)
/* 91630 80090A30 46001083 */  div.s      $f2, $f2, $f0
/* 91634 80090A34 4602203C */  c.lt.s     $f4, $f2
/* 91638 80090A38 00000000 */  nop
/* 9163C 80090A3C 45030001 */  bc1tl      .L80090A44
/* 91640 80090A40 46002086 */   mov.s     $f2, $f4
.L80090A44:
/* 91644 80090A44 9644000A */  lhu        $a0, 0xa($s2)
/* 91648 80090A48 96430006 */  lhu        $v1, 6($s2)
/* 9164C 80090A4C 9642000A */  lhu        $v0, 0xa($s2)
/* 91650 80090A50 44840000 */  mtc1       $a0, $f0
/* 91654 80090A54 46800020 */  cvt.s.w    $f0, $f0
/* 91658 80090A58 46020002 */  mul.s      $f0, $f0, $f2
/* 9165C 80090A5C 00622821 */  addu       $a1, $v1, $v0
/* 91660 80090A60 3C01800E */  lui        $at, %hi(D_800E19E0)
/* 91664 80090A64 C42219E0 */  lwc1       $f2, %lo(D_800E19E0)($at)
/* 91668 80090A68 4600103E */  c.le.s     $f2, $f0
/* 9166C 80090A6C 00000000 */  nop
/* 91670 80090A70 45010005 */  bc1t       .L80090A88
/* 91674 80090A74 00603021 */   addu      $a2, $v1, $zero
/* 91678 80090A78 4600008D */  trunc.w.s  $f2, $f0
/* 9167C 80090A7C 44021000 */  mfc1       $v0, $f2
/* 91680 80090A80 080242A8 */  j          .L80090AA0
/* 91684 80090A84 00A21023 */   subu      $v0, $a1, $v0
.L80090A88:
/* 91688 80090A88 46020001 */  sub.s      $f0, $f0, $f2
/* 9168C 80090A8C 4600008D */  trunc.w.s  $f2, $f0
/* 91690 80090A90 44021000 */  mfc1       $v0, $f2
/* 91694 80090A94 3C038000 */  lui        $v1, 0x8000
/* 91698 80090A98 00431025 */  or         $v0, $v0, $v1
/* 9169C 80090A9C 00A21023 */  subu       $v0, $a1, $v0
.L80090AA0:
/* 916A0 80090AA0 3050FFFF */  andi       $s0, $v0, 0xffff
/* 916A4 80090AA4 26830003 */  addiu      $v1, $s4, 3
/* 916A8 80090AA8 00C41021 */  addu       $v0, $a2, $a0
/* 916AC 80090AAC 3051FFFF */  andi       $s1, $v0, 0xffff
/* 916B0 80090AB0 16110003 */  bne        $s0, $s1, .L80090AC0
/* 916B4 80090AB4 3073FFFF */   andi      $s3, $v1, 0xffff
/* 916B8 80090AB8 2602FFFF */  addiu      $v0, $s0, -1
/* 916BC 80090ABC 3050FFFF */  andi       $s0, $v0, 0xffff
.L80090AC0:
/* 916C0 80090AC0 02C02021 */  addu       $a0, $s6, $zero
/* 916C4 80090AC4 02802821 */  addu       $a1, $s4, $zero
/* 916C8 80090AC8 96460006 */  lhu        $a2, 6($s2)
/* 916CC 80090ACC 02603821 */  addu       $a3, $s3, $zero
/* 916D0 80090AD0 AFB10010 */  sw         $s1, 0x10($sp)
/* 916D4 80090AD4 AFA00014 */  sw         $zero, 0x14($sp)
/* 916D8 80090AD8 AFA00018 */  sw         $zero, 0x18($sp)
/* 916DC 80090ADC AFA0001C */  sw         $zero, 0x1c($sp)
/* 916E0 80090AE0 0C0299E5 */  jal        gsFadeInOut
/* 916E4 80090AE4 AFBE0020 */   sw        $fp, 0x20($sp)
/* 916E8 80090AE8 00402021 */  addu       $a0, $v0, $zero
/* 916EC 80090AEC 02802821 */  addu       $a1, $s4, $zero
/* 916F0 80090AF0 02003021 */  addu       $a2, $s0, $zero
/* 916F4 80090AF4 93A20068 */  lbu        $v0, 0x68($sp)
/* 916F8 80090AF8 93A30069 */  lbu        $v1, 0x69($sp)
/* 916FC 80090AFC 93A8006A */  lbu        $t0, 0x6a($sp)
/* 91700 80090B00 02603821 */  addu       $a3, $s3, $zero
/* 91704 80090B04 AFB10010 */  sw         $s1, 0x10($sp)
/* 91708 80090B08 AFBE0020 */  sw         $fp, 0x20($sp)
/* 9170C 80090B0C AFA20014 */  sw         $v0, 0x14($sp)
/* 91710 80090B10 AFA30018 */  sw         $v1, 0x18($sp)
/* 91714 80090B14 0C0299E5 */  jal        gsFadeInOut
/* 91718 80090B18 AFA8001C */   sw        $t0, 0x1c($sp)
/* 9171C 80090B1C 0040B021 */  addu       $s6, $v0, $zero
.L80090B20:
/* 91720 80090B20 26A30001 */  addiu      $v1, $s5, 1
/* 91724 80090B24 3C04800F */  lui        $a0, %hi(combat_gui_tally)
/* 91728 80090B28 90821CC4 */  lbu        $v0, %lo(combat_gui_tally)($a0)
/* 9172C 80090B2C 3075FFFF */  andi       $s5, $v1, 0xffff
/* 91730 80090B30 02A2102B */  sltu       $v0, $s5, $v0
/* 91734 80090B34 1440FF85 */  bnez       $v0, .L8009094C
/* 91738 80090B38 00151040 */   sll       $v0, $s5, 1
.L80090B3C:
/* 9173C 80090B3C 02C01021 */  addu       $v0, $s6, $zero
/* 91740 80090B40 8FBF010C */  lw         $ra, 0x10c($sp)
/* 91744 80090B44 8FBE0108 */  lw         $fp, 0x108($sp)
/* 91748 80090B48 8FB70104 */  lw         $s7, 0x104($sp)
/* 9174C 80090B4C 8FB60100 */  lw         $s6, 0x100($sp)
/* 91750 80090B50 8FB500FC */  lw         $s5, 0xfc($sp)
/* 91754 80090B54 8FB400F8 */  lw         $s4, 0xf8($sp)
/* 91758 80090B58 8FB300F4 */  lw         $s3, 0xf4($sp)
/* 9175C 80090B5C 8FB200F0 */  lw         $s2, 0xf0($sp)
/* 91760 80090B60 8FB100EC */  lw         $s1, 0xec($sp)
/* 91764 80090B64 8FB000E8 */  lw         $s0, 0xe8($sp)
/* 91768 80090B68 03E00008 */  jr         $ra
/* 9176C 80090B6C 27BD0110 */   addiu     $sp, $sp, 0x110

glabel draw_crossbone
/* 91770 80090B70 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 91774 80090B74 AFB00018 */  sw         $s0, 0x18($sp)
/* 91778 80090B78 00808021 */  addu       $s0, $a0, $zero
/* 9177C 80090B7C AFBF001C */  sw         $ra, 0x1c($sp)
/* 91780 80090B80 0C0290E2 */  jal        get_borg_8
/* 91784 80090B84 00A02021 */   addu      $a0, $a1, $zero
/* 91788 80090B88 00402821 */  addu       $a1, $v0, $zero
/* 9178C 80090B8C 8E030000 */  lw         $v1, ($s0)
/* 91790 80090B90 24020001 */  addiu      $v0, $zero, 1
/* 91794 80090B94 94660060 */  lhu        $a2, 0x60($v1)
/* 91798 80090B98 94670062 */  lhu        $a3, 0x62($v1)
/* 9179C 80090B9C 00602021 */  addu       $a0, $v1, $zero
/* 917A0 80090BA0 0C024012 */  jal        func_80090048
/* 917A4 80090BA4 AFA20010 */   sw        $v0, 0x10($sp)
/* 917A8 80090BA8 8E050000 */  lw         $a1, ($s0)
/* 917AC 80090BAC 8CA30078 */  lw         $v1, 0x78($a1)
/* 917B0 80090BB0 AE020004 */  sw         $v0, 4($s0)
/* 917B4 80090BB4 84640018 */  lh         $a0, 0x18($v1)
/* 917B8 80090BB8 8C62001C */  lw         $v0, 0x1c($v1)
/* 917BC 80090BBC 0040F809 */  jalr       $v0
/* 917C0 80090BC0 00A42021 */   addu      $a0, $a1, $a0
/* 917C4 80090BC4 8E040004 */  lw         $a0, 4($s0)
/* 917C8 80090BC8 0C02DD42 */  jal        set_widgetHeight
/* 917CC 80090BCC 00402821 */   addu      $a1, $v0, $zero
/* 917D0 80090BD0 8E050000 */  lw         $a1, ($s0)
/* 917D4 80090BD4 8CA30078 */  lw         $v1, 0x78($a1)
/* 917D8 80090BD8 84640020 */  lh         $a0, 0x20($v1)
/* 917DC 80090BDC 8C620024 */  lw         $v0, 0x24($v1)
/* 917E0 80090BE0 0040F809 */  jalr       $v0
/* 917E4 80090BE4 00A42021 */   addu      $a0, $a1, $a0
/* 917E8 80090BE8 8E040004 */  lw         $a0, 4($s0)
/* 917EC 80090BEC 0C02DD46 */  jal        set_widgetWidth
/* 917F0 80090BF0 00402821 */   addu      $a1, $v0, $zero
/* 917F4 80090BF4 8E020004 */  lw         $v0, 4($s0)
/* 917F8 80090BF8 24040018 */  addiu      $a0, $zero, 0x18
/* 917FC 80090BFC 0C026259 */  jal        passToMalloc
/* 91800 80090C00 A040005B */   sb        $zero, 0x5b($v0)
/* 91804 80090C04 3C03800F */  lui        $v1, %hi(combat_gui_substruct)
/* 91808 80090C08 8C641CD0 */  lw         $a0, %lo(combat_gui_substruct)($v1)
/* 9180C 80090C0C 3C03800E */  lui        $v1, 0x800e
/* 91810 80090C10 8E050004 */  lw         $a1, 4($s0)
/* 91814 80090C14 3C01800E */  lui        $at, %hi(D_800E19E4)
/* 91818 80090C18 C42019E4 */  lwc1       $f0, %lo(D_800E19E4)($at)
/* 9181C 80090C1C 3C01800E */  lui        $at, %hi(D_800E19E8)
/* 91820 80090C20 C42219E8 */  lwc1       $f2, %lo(D_800E19E8)($at)
/* 91824 80090C24 24635198 */  addiu      $v1, $v1, 0x5198
/* 91828 80090C28 AC400000 */  sw         $zero, ($v0)
/* 9182C 80090C2C AC430008 */  sw         $v1, 8($v0)
/* 91830 80090C30 24A3005B */  addiu      $v1, $a1, 0x5b
/* 91834 80090C34 E4400004 */  swc1       $f0, 4($v0)
/* 91838 80090C38 AC43000C */  sw         $v1, 0xc($v0)
/* 9183C 80090C3C 90A6005B */  lbu        $a2, 0x5b($a1)
/* 91840 80090C40 00402821 */  addu       $a1, $v0, $zero
/* 91844 80090C44 E4420014 */  swc1       $f2, 0x14($v0)
/* 91848 80090C48 44860000 */  mtc1       $a2, $f0
/* 9184C 80090C4C 46800020 */  cvt.s.w    $f0, $f0
/* 91850 80090C50 0C035923 */  jal        func_800D648C
/* 91854 80090C54 E4400010 */   swc1      $f0, 0x10($v0)
/* 91858 80090C58 8FBF001C */  lw         $ra, 0x1c($sp)
/* 9185C 80090C5C 8FB00018 */  lw         $s0, 0x18($sp)
/* 91860 80090C60 03E00008 */  jr         $ra
/* 91864 80090C64 27BD0020 */   addiu     $sp, $sp, 0x20

glabel passto_free_borg8_widget
/* 91868 80090C68 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 9186C 80090C6C AFBF0010 */  sw         $ra, 0x10($sp)
/* 91870 80090C70 0C02E543 */  jal        free_borg8_widget_800b950c
/* 91874 80090C74 00000000 */   nop
/* 91878 80090C78 8FBF0010 */  lw         $ra, 0x10($sp)
/* 9187C 80090C7C 03E00008 */  jr         $ra
/* 91880 80090C80 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80090C84
/* 91884 80090C84 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 91888 80090C88 00063400 */  sll        $a2, $a2, 0x10
/* 9188C 80090C8C 00063403 */  sra        $a2, $a2, 0x10
/* 91890 80090C90 00073C00 */  sll        $a3, $a3, 0x10
/* 91894 80090C94 87A80032 */  lh         $t0, 0x32($sp)
/* 91898 80090C98 00073C03 */  sra        $a3, $a3, 0x10
/* 9189C 80090C9C AFBF0018 */  sw         $ra, 0x18($sp)
/* 918A0 80090CA0 8C82007C */  lw         $v0, 0x7c($a0)
/* 918A4 80090CA4 10400006 */  beqz       $v0, .L80090CC0
/* 918A8 80090CA8 87A30036 */   lh        $v1, 0x36($sp)
/* 918AC 80090CAC AFA80010 */  sw         $t0, 0x10($sp)
/* 918B0 80090CB0 0C02E559 */  jal        func_800B9564
/* 918B4 80090CB4 AFA30014 */   sw        $v1, 0x14($sp)
/* 918B8 80090CB8 08024332 */  j          .L80090CC8
/* 918BC 80090CBC 8FBF0018 */   lw        $ra, 0x18($sp)
.L80090CC0:
/* 918C0 80090CC0 00A01021 */  addu       $v0, $a1, $zero
/* 918C4 80090CC4 8FBF0018 */  lw         $ra, 0x18($sp)
.L80090CC8:
/* 918C8 80090CC8 03E00008 */  jr         $ra
/* 918CC 80090CCC 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80090CD0
/* 918D0 80090CD0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 918D4 80090CD4 244668A8 */  addiu      $a2, $v0, %lo(gGlobals)
/* 918D8 80090CD8 90C30040 */  lbu        $v1, 0x40($a2)
/* 918DC 80090CDC 24020002 */  addiu      $v0, $zero, 2
/* 918E0 80090CE0 10620005 */  beq        $v1, $v0, .L80090CF8
/* 918E4 80090CE4 3C02800F */   lui       $v0, %hi(combatPointer)
/* 918E8 80090CE8 03E00008 */  jr         $ra
/* 918EC 80090CEC 2402FFFF */   addiu     $v0, $zero, -1
.L80090CF0:
/* 918F0 80090CF0 03E00008 */  jr         $ra
/* 918F4 80090CF4 00021603 */   sra       $v0, $v0, 0x18
.L80090CF8:
/* 918F8 80090CF8 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 918FC 80090CFC 90620001 */  lbu        $v0, 1($v1)
/* 91900 80090D00 1040000D */  beqz       $v0, .L80090D38
/* 91904 80090D04 00002821 */   addu      $a1, $zero, $zero
/* 91908 80090D08 24C713FC */  addiu      $a3, $a2, 0x13fc
/* 9190C 80090D0C 00403021 */  addu       $a2, $v0, $zero
/* 91910 80090D10 00051080 */  sll        $v0, $a1, 2
.L80090D14:
/* 91914 80090D14 00471021 */  addu       $v0, $v0, $a3
/* 91918 80090D18 8C430000 */  lw         $v1, ($v0)
/* 9191C 80090D1C 1083FFF4 */  beq        $a0, $v1, .L80090CF0
/* 91920 80090D20 00051600 */   sll       $v0, $a1, 0x18
/* 91924 80090D24 24A20001 */  addiu      $v0, $a1, 1
/* 91928 80090D28 3045FFFF */  andi       $a1, $v0, 0xffff
/* 9192C 80090D2C 00A6182B */  sltu       $v1, $a1, $a2
/* 91930 80090D30 1460FFF8 */  bnez       $v1, .L80090D14
/* 91934 80090D34 00051080 */   sll       $v0, $a1, 2
.L80090D38:
/* 91938 80090D38 03E00008 */  jr         $ra
/* 9193C 80090D3C 2402FFFF */   addiu     $v0, $zero, -1

glabel get_some_weapon_id
/* 91940 80090D40 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91944 80090D44 AFBF0010 */  sw         $ra, 0x10($sp)
/* 91948 80090D48 0C024334 */  jal        func_80090CD0
/* 9194C 80090D4C 00000000 */   nop
/* 91950 80090D50 00402021 */  addu       $a0, $v0, $zero
/* 91954 80090D54 2402FFFF */  addiu      $v0, $zero, -1
/* 91958 80090D58 1082000D */  beq        $a0, $v0, .L80090D90
/* 9195C 80090D5C 3C03800F */   lui       $v1, %hi(combatPointer)
/* 91960 80090D60 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 91964 80090D64 00042080 */  sll        $a0, $a0, 2
/* 91968 80090D68 00441021 */  addu       $v0, $v0, $a0
/* 9196C 80090D6C 8C4352D0 */  lw         $v1, 0x52d0($v0)
/* 91970 80090D70 8C620040 */  lw         $v0, 0x40($v1)
/* 91974 80090D74 50400007 */  beql       $v0, $zero, .L80090D94
/* 91978 80090D78 00001021 */   addu      $v0, $zero, $zero
/* 9197C 80090D7C 8C420024 */  lw         $v0, 0x24($v0)
/* 91980 80090D80 50400004 */  beql       $v0, $zero, .L80090D94
/* 91984 80090D84 00001021 */   addu      $v0, $zero, $zero
/* 91988 80090D88 08024365 */  j          .L80090D94
/* 9198C 80090D8C 94420000 */   lhu       $v0, ($v0)
.L80090D90:
/* 91990 80090D90 00001021 */  addu       $v0, $zero, $zero
.L80090D94:
/* 91994 80090D94 8FBF0010 */  lw         $ra, 0x10($sp)
/* 91998 80090D98 03E00008 */  jr         $ra
/* 9199C 80090D9C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80090DA0
/* 919A0 80090DA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 919A4 80090DA4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 919A8 80090DA8 0C024334 */  jal        func_80090CD0
/* 919AC 80090DAC 00000000 */   nop
/* 919B0 80090DB0 00402021 */  addu       $a0, $v0, $zero
/* 919B4 80090DB4 2402FFFF */  addiu      $v0, $zero, -1
/* 919B8 80090DB8 1082000E */  beq        $a0, $v0, .L80090DF4
/* 919BC 80090DBC 3C03800F */   lui       $v1, %hi(combatPointer)
/* 919C0 80090DC0 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 919C4 80090DC4 00042080 */  sll        $a0, $a0, 2
/* 919C8 80090DC8 00441021 */  addu       $v0, $v0, $a0
/* 919CC 80090DCC 8C4352D0 */  lw         $v1, 0x52d0($v0)
/* 919D0 80090DD0 8C620040 */  lw         $v0, 0x40($v1)
/* 919D4 80090DD4 50400008 */  beql       $v0, $zero, .L80090DF8
/* 919D8 80090DD8 00001021 */   addu      $v0, $zero, $zero
/* 919DC 80090DDC 8C420020 */  lw         $v0, 0x20($v0)
/* 919E0 80090DE0 8C420000 */  lw         $v0, ($v0)
/* 919E4 80090DE4 50400004 */  beql       $v0, $zero, .L80090DF8
/* 919E8 80090DE8 00001021 */   addu      $v0, $zero, $zero
/* 919EC 80090DEC 0802437E */  j          .L80090DF8
/* 919F0 80090DF0 94420000 */   lhu       $v0, ($v0)
.L80090DF4:
/* 919F4 80090DF4 00001021 */  addu       $v0, $zero, $zero
.L80090DF8:
/* 919F8 80090DF8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 919FC 80090DFC 03E00008 */  jr         $ra
/* 91A00 80090E00 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80090E04
/* 91A04 80090E04 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91A08 80090E08 AFBF0010 */  sw         $ra, 0x10($sp)
/* 91A0C 80090E0C 0C024334 */  jal        func_80090CD0
/* 91A10 80090E10 00000000 */   nop
/* 91A14 80090E14 00402021 */  addu       $a0, $v0, $zero
/* 91A18 80090E18 2402FFFF */  addiu      $v0, $zero, -1
/* 91A1C 80090E1C 1082000E */  beq        $a0, $v0, .L80090E58
/* 91A20 80090E20 3C03800F */   lui       $v1, %hi(combatPointer)
/* 91A24 80090E24 8C62F760 */  lw         $v0, %lo(combatPointer)($v1)
/* 91A28 80090E28 00042080 */  sll        $a0, $a0, 2
/* 91A2C 80090E2C 00441021 */  addu       $v0, $v0, $a0
/* 91A30 80090E30 8C4352D0 */  lw         $v1, 0x52d0($v0)
/* 91A34 80090E34 8C620040 */  lw         $v0, 0x40($v1)
/* 91A38 80090E38 50400008 */  beql       $v0, $zero, .L80090E5C
/* 91A3C 80090E3C 00001021 */   addu      $v0, $zero, $zero
/* 91A40 80090E40 8C420020 */  lw         $v0, 0x20($v0)
/* 91A44 80090E44 8C420004 */  lw         $v0, 4($v0)
/* 91A48 80090E48 50400004 */  beql       $v0, $zero, .L80090E5C
/* 91A4C 80090E4C 00001021 */   addu      $v0, $zero, $zero
/* 91A50 80090E50 08024397 */  j          .L80090E5C
/* 91A54 80090E54 94420000 */   lhu       $v0, ($v0)
.L80090E58:
/* 91A58 80090E58 00001021 */  addu       $v0, $zero, $zero
.L80090E5C:
/* 91A5C 80090E5C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 91A60 80090E60 03E00008 */  jr         $ra
/* 91A64 80090E64 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80090E68
/* 91A68 80090E68 27BDFDA0 */  addiu      $sp, $sp, -0x260
/* 91A6C 80090E6C 27A30010 */  addiu      $v1, $sp, 0x10
/* 91A70 80090E70 3C02800E */  lui        $v0, %hi(D_800E1AC0)
/* 91A74 80090E74 24451AC0 */  addiu      $a1, $v0, %lo(D_800E1AC0)
/* 91A78 80090E78 30A20003 */  andi       $v0, $a1, 3
/* 91A7C 80090E7C AFB10254 */  sw         $s1, 0x254($sp)
/* 91A80 80090E80 00608821 */  addu       $s1, $v1, $zero
/* 91A84 80090E84 AFBF0258 */  sw         $ra, 0x258($sp)
/* 91A88 80090E88 10400017 */  beqz       $v0, .L80090EE8
/* 91A8C 80090E8C AFB00250 */   sw        $s0, 0x250($sp)
/* 91A90 80090E90 24A20210 */  addiu      $v0, $a1, 0x210
.L80090E94:
/* 91A94 80090E94 88A60000 */  lwl        $a2, ($a1)
/* 91A98 80090E98 98A60003 */  lwr        $a2, 3($a1)
/* 91A9C 80090E9C 88A70004 */  lwl        $a3, 4($a1)
/* 91AA0 80090EA0 98A70007 */  lwr        $a3, 7($a1)
/* 91AA4 80090EA4 88A80008 */  lwl        $t0, 8($a1)
/* 91AA8 80090EA8 98A8000B */  lwr        $t0, 0xb($a1)
/* 91AAC 80090EAC 88A9000C */  lwl        $t1, 0xc($a1)
/* 91AB0 80090EB0 98A9000F */  lwr        $t1, 0xf($a1)
/* 91AB4 80090EB4 A8660000 */  swl        $a2, ($v1)
/* 91AB8 80090EB8 B8660003 */  swr        $a2, 3($v1)
/* 91ABC 80090EBC A8670004 */  swl        $a3, 4($v1)
/* 91AC0 80090EC0 B8670007 */  swr        $a3, 7($v1)
/* 91AC4 80090EC4 A8680008 */  swl        $t0, 8($v1)
/* 91AC8 80090EC8 B868000B */  swr        $t0, 0xb($v1)
/* 91ACC 80090ECC A869000C */  swl        $t1, 0xc($v1)
/* 91AD0 80090ED0 B869000F */  swr        $t1, 0xf($v1)
/* 91AD4 80090ED4 24A50010 */  addiu      $a1, $a1, 0x10
/* 91AD8 80090ED8 14A2FFEE */  bne        $a1, $v0, .L80090E94
/* 91ADC 80090EDC 24630010 */   addiu     $v1, $v1, 0x10
/* 91AE0 80090EE0 080243C6 */  j          .L80090F18
/* 91AE4 80090EE4 00000000 */   nop
.L80090EE8:
/* 91AE8 80090EE8 24A20210 */  addiu      $v0, $a1, 0x210
.L80090EEC:
/* 91AEC 80090EEC 8CA60000 */  lw         $a2, ($a1)
/* 91AF0 80090EF0 8CA70004 */  lw         $a3, 4($a1)
/* 91AF4 80090EF4 8CA80008 */  lw         $t0, 8($a1)
/* 91AF8 80090EF8 8CA9000C */  lw         $t1, 0xc($a1)
/* 91AFC 80090EFC AC660000 */  sw         $a2, ($v1)
/* 91B00 80090F00 AC670004 */  sw         $a3, 4($v1)
/* 91B04 80090F04 AC680008 */  sw         $t0, 8($v1)
/* 91B08 80090F08 AC69000C */  sw         $t1, 0xc($v1)
/* 91B0C 80090F0C 24A50010 */  addiu      $a1, $a1, 0x10
/* 91B10 80090F10 14A2FFF6 */  bne        $a1, $v0, .L80090EEC
/* 91B14 80090F14 24630010 */   addiu     $v1, $v1, 0x10
.L80090F18:
/* 91B18 80090F18 88A20000 */  lwl        $v0, ($a1)
/* 91B1C 80090F1C 98A20003 */  lwr        $v0, 3($a1)
/* 91B20 80090F20 88A60004 */  lwl        $a2, 4($a1)
/* 91B24 80090F24 98A60007 */  lwr        $a2, 7($a1)
/* 91B28 80090F28 A8620000 */  swl        $v0, ($v1)
/* 91B2C 80090F2C B8620003 */  swr        $v0, 3($v1)
/* 91B30 80090F30 A8660004 */  swl        $a2, 4($v1)
/* 91B34 80090F34 0C024350 */  jal        get_some_weapon_id
/* 91B38 80090F38 B8660007 */   swr       $a2, 7($v1)
/* 91B3C 80090F3C 1440000D */  bnez       $v0, .L80090F74
/* 91B40 80090F40 00402021 */   addu      $a0, $v0, $zero
/* 91B44 80090F44 080243F3 */  j          .L80090FCC
/* 91B48 80090F48 00001021 */   addu      $v0, $zero, $zero
.L80090F4C:
/* 91B4C 80090F4C 248468A8 */  addiu      $a0, $a0, 0x68a8
/* 91B50 80090F50 00002821 */  addu       $a1, $zero, $zero
/* 91B54 80090F54 0C02734D */  jal        rand_func
/* 91B58 80090F58 24060001 */   addiu     $a2, $zero, 1
/* 91B5C 80090F5C 00021040 */  sll        $v0, $v0, 1
/* 91B60 80090F60 001018C0 */  sll        $v1, $s0, 3
/* 91B64 80090F64 00431021 */  addu       $v0, $v0, $v1
/* 91B68 80090F68 02221021 */  addu       $v0, $s1, $v0
/* 91B6C 80090F6C 080243F3 */  j          .L80090FCC
/* 91B70 80090F70 94420000 */   lhu       $v0, ($v0)
.L80090F74:
/* 91B74 80090F74 00002821 */  addu       $a1, $zero, $zero
/* 91B78 80090F78 0C01D77A */  jal        GetIDIndex
/* 91B7C 80090F7C 00003021 */   addu      $a2, $zero, $zero
/* 91B80 80090F80 00402821 */  addu       $a1, $v0, $zero
/* 91B84 80090F84 3C04800F */  lui        $a0, %hi(weapons_with_borg5)
/* 91B88 80090F88 90831490 */  lbu        $v1, %lo(weapons_with_borg5)($a0)
/* 91B8C 80090F8C 240200FF */  addiu      $v0, $zero, 0xff
/* 91B90 80090F90 1062000D */  beq        $v1, $v0, .L80090FC8
/* 91B94 80090F94 00008021 */   addu      $s0, $zero, $zero
/* 91B98 80090F98 24841490 */  addiu      $a0, $a0, 0x1490
/* 91B9C 80090F9C 240600FF */  addiu      $a2, $zero, 0xff
/* 91BA0 80090FA0 02041021 */  addu       $v0, $s0, $a0
.L80090FA4:
/* 91BA4 80090FA4 90430000 */  lbu        $v1, ($v0)
/* 91BA8 80090FA8 5065FFE8 */  beql       $v1, $a1, .L80090F4C
/* 91BAC 80090FAC 3C04800E */   lui       $a0, 0x800e
/* 91BB0 80090FB0 26020001 */  addiu      $v0, $s0, 1
/* 91BB4 80090FB4 3050FFFF */  andi       $s0, $v0, 0xffff
/* 91BB8 80090FB8 02041821 */  addu       $v1, $s0, $a0
/* 91BBC 80090FBC 90620000 */  lbu        $v0, ($v1)
/* 91BC0 80090FC0 1446FFF8 */  bne        $v0, $a2, .L80090FA4
/* 91BC4 80090FC4 02041021 */   addu      $v0, $s0, $a0
.L80090FC8:
/* 91BC8 80090FC8 00001021 */  addu       $v0, $zero, $zero
.L80090FCC:
/* 91BCC 80090FCC 8FBF0258 */  lw         $ra, 0x258($sp)
/* 91BD0 80090FD0 8FB10254 */  lw         $s1, 0x254($sp)
/* 91BD4 80090FD4 8FB00250 */  lw         $s0, 0x250($sp)
/* 91BD8 80090FD8 03E00008 */  jr         $ra
/* 91BDC 80090FDC 27BD0260 */   addiu     $sp, $sp, 0x260

glabel make_portait_frame_widget
/* 91BE0 80090FE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91BE4 80090FE4 AFB00010 */  sw         $s0, 0x10($sp)
/* 91BE8 80090FE8 3C10800F */  lui        $s0, %hi(portait_frame_pointer)
/* 91BEC 80090FEC 8E021CE0 */  lw         $v0, %lo(portait_frame_pointer)($s0)
/* 91BF0 80090FF0 14400008 */  bnez       $v0, .L80091014
/* 91BF4 80090FF4 AFBF0014 */   sw        $ra, 0x14($sp)
/* 91BF8 80090FF8 0C026259 */  jal        passToMalloc
/* 91BFC 80090FFC 240400A8 */   addiu     $a0, $zero, 0xa8
/* 91C00 80091000 0C02447E */  jal        draw_portait_frame
/* 91C04 80091004 00402021 */   addu      $a0, $v0, $zero
/* 91C08 80091008 AE021CE0 */  sw         $v0, 0x1ce0($s0)
/* 91C0C 8009100C 3C02800F */  lui        $v0, %hi(CombatPortraitCurrent)
/* 91C10 80091010 A4401CE4 */  sh         $zero, %lo(CombatPortraitCurrent)($v0)
.L80091014:
/* 91C14 80091014 8FBF0014 */  lw         $ra, 0x14($sp)
/* 91C18 80091018 8FB00010 */  lw         $s0, 0x10($sp)
/* 91C1C 8009101C 03E00008 */  jr         $ra
/* 91C20 80091020 27BD0018 */   addiu     $sp, $sp, 0x18

glabel free_portait_frame_pointer
/* 91C24 80091024 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91C28 80091028 AFB00010 */  sw         $s0, 0x10($sp)
/* 91C2C 8009102C 3C10800F */  lui        $s0, %hi(portait_frame_pointer)
/* 91C30 80091030 8E031CE0 */  lw         $v1, %lo(portait_frame_pointer)($s0)
/* 91C34 80091034 1060000A */  beqz       $v1, .L80091060
/* 91C38 80091038 AFBF0014 */   sw        $ra, 0x14($sp)
/* 91C3C 8009103C 8C620078 */  lw         $v0, 0x78($v1)
/* 91C40 80091040 84440008 */  lh         $a0, 8($v0)
/* 91C44 80091044 00642021 */  addu       $a0, $v1, $a0
/* 91C48 80091048 8C43000C */  lw         $v1, 0xc($v0)
/* 91C4C 8009104C 0060F809 */  jalr       $v1
/* 91C50 80091050 24050003 */   addiu     $a1, $zero, 3
/* 91C54 80091054 3C02800F */  lui        $v0, %hi(CombatPortraitCurrent)
/* 91C58 80091058 AE001CE0 */  sw         $zero, 0x1ce0($s0)
/* 91C5C 8009105C A4401CE4 */  sh         $zero, %lo(CombatPortraitCurrent)($v0)
.L80091060:
/* 91C60 80091060 8FBF0014 */  lw         $ra, 0x14($sp)
/* 91C64 80091064 8FB00010 */  lw         $s0, 0x10($sp)
/* 91C68 80091068 03E00008 */  jr         $ra
/* 91C6C 8009106C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel setCombatPortait
/* 91C70 80091070 3C02800F */  lui        $v0, %hi(portait_frame_pointer)
/* 91C74 80091074 8C431CE0 */  lw         $v1, %lo(portait_frame_pointer)($v0)
/* 91C78 80091078 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 91C7C 8009107C AFB00018 */  sw         $s0, 0x18($sp)
/* 91C80 80091080 30B000FF */  andi       $s0, $a1, 0xff
/* 91C84 80091084 AFB30024 */  sw         $s3, 0x24($sp)
/* 91C88 80091088 00809821 */  addu       $s3, $a0, $zero
/* 91C8C 8009108C AFB20020 */  sw         $s2, 0x20($sp)
/* 91C90 80091090 00409021 */  addu       $s2, $v0, $zero
/* 91C94 80091094 AFBF0028 */  sw         $ra, 0x28($sp)
/* 91C98 80091098 10600009 */  beqz       $v1, .L800910C0
/* 91C9C 8009109C AFB1001C */   sw        $s1, 0x1c($sp)
/* 91CA0 800910A0 3C02800F */  lui        $v0, %hi(combatPointer)
/* 91CA4 800910A4 8C43F760 */  lw         $v1, %lo(combatPointer)($v0)
/* 91CA8 800910A8 8C62002C */  lw         $v0, 0x2c($v1)
/* 91CAC 800910AC 5040002D */  beql       $v0, $zero, .L80091164
/* 91CB0 800910B0 02601021 */   addu      $v0, $s3, $zero
/* 91CB4 800910B4 8C420040 */  lw         $v0, 0x40($v0)
/* 91CB8 800910B8 14400003 */  bnez       $v0, .L800910C8
/* 91CBC 800910BC 3C03800F */   lui       $v1, %hi(CombatPortraitCurrent)
.L800910C0:
/* 91CC0 800910C0 08024459 */  j          .L80091164
/* 91CC4 800910C4 02601021 */   addu      $v0, $s3, $zero
.L800910C8:
/* 91CC8 800910C8 94450000 */  lhu        $a1, ($v0)
/* 91CCC 800910CC 94621CE4 */  lhu        $v0, %lo(CombatPortraitCurrent)($v1)
/* 91CD0 800910D0 10A20008 */  beq        $a1, $v0, .L800910F4
/* 91CD4 800910D4 3C02800F */   lui       $v0, %hi(EntityPointer)
/* 91CD8 800910D8 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 91CDC 800910DC A4651CE4 */  sh         $a1, 0x1ce4($v1)
/* 91CE0 800910E0 0C01D531 */  jal        getEntityPortait
/* 91CE4 800910E4 30A5FFFF */   andi      $a1, $a1, 0xffff
/* 91CE8 800910E8 8E441CE0 */  lw         $a0, 0x1ce0($s2)
/* 91CEC 800910EC 0C0244CB */  jal        func_printing_portrait
/* 91CF0 800910F0 00402821 */   addu      $a1, $v0, $zero
.L800910F4:
/* 91CF4 800910F4 2602FFFF */  addiu      $v0, $s0, -1
/* 91CF8 800910F8 305000FF */  andi       $s0, $v0, 0xff
/* 91CFC 800910FC 240300FF */  addiu      $v1, $zero, 0xff
/* 91D00 80091100 1203000B */  beq        $s0, $v1, .L80091130
/* 91D04 80091104 241100FF */   addiu     $s1, $zero, 0xff
/* 91D08 80091108 8E451CE0 */  lw         $a1, 0x1ce0($s2)
.L8009110C:
/* 91D0C 8009110C 8CA30078 */  lw         $v1, 0x78($a1)
/* 91D10 80091110 84640028 */  lh         $a0, 0x28($v1)
/* 91D14 80091114 8C62002C */  lw         $v0, 0x2c($v1)
/* 91D18 80091118 0040F809 */  jalr       $v0
/* 91D1C 8009111C 00A42021 */   addu      $a0, $a1, $a0
/* 91D20 80091120 2603FFFF */  addiu      $v1, $s0, -1
/* 91D24 80091124 307000FF */  andi       $s0, $v1, 0xff
/* 91D28 80091128 1611FFF8 */  bne        $s0, $s1, .L8009110C
/* 91D2C 8009112C 8E451CE0 */   lw        $a1, 0x1ce0($s2)
.L80091130:
/* 91D30 80091130 8E461CE0 */  lw         $a2, 0x1ce0($s2)
/* 91D34 80091134 02602821 */  addu       $a1, $s3, $zero
/* 91D38 80091138 8CC70078 */  lw         $a3, 0x78($a2)
/* 91D3C 8009113C 24020140 */  addiu      $v0, $zero, 0x140
/* 91D40 80091140 84E40040 */  lh         $a0, 0x40($a3)
/* 91D44 80091144 240300F0 */  addiu      $v1, $zero, 0xf0
/* 91D48 80091148 AFA20010 */  sw         $v0, 0x10($sp)
/* 91D4C 8009114C AFA30014 */  sw         $v1, 0x14($sp)
/* 91D50 80091150 8CE20044 */  lw         $v0, 0x44($a3)
/* 91D54 80091154 00003821 */  addu       $a3, $zero, $zero
/* 91D58 80091158 00C42021 */  addu       $a0, $a2, $a0
/* 91D5C 8009115C 0040F809 */  jalr       $v0
/* 91D60 80091160 00003021 */   addu      $a2, $zero, $zero
.L80091164:
/* 91D64 80091164 8FBF0028 */  lw         $ra, 0x28($sp)
/* 91D68 80091168 8FB30024 */  lw         $s3, 0x24($sp)
/* 91D6C 8009116C 8FB20020 */  lw         $s2, 0x20($sp)
/* 91D70 80091170 8FB1001C */  lw         $s1, 0x1c($sp)
/* 91D74 80091174 8FB00018 */  lw         $s0, 0x18($sp)
/* 91D78 80091178 03E00008 */  jr         $ra
/* 91D7C 8009117C 27BD0030 */   addiu     $sp, $sp, 0x30

glabel combat_widget_print_func
/* 91D80 80091180 3C02800F */  lui        $v0, %hi(portait_frame_pointer)
/* 91D84 80091184 8C461CE0 */  lw         $a2, %lo(portait_frame_pointer)($v0)
/* 91D88 80091188 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91D8C 8009118C AFBF0010 */  sw         $ra, 0x10($sp)
/* 91D90 80091190 8CC70078 */  lw         $a3, 0x78($a2)
/* 91D94 80091194 00802821 */  addu       $a1, $a0, $zero
/* 91D98 80091198 84E200C8 */  lh         $v0, 0xc8($a3)
/* 91D9C 8009119C 8CE300CC */  lw         $v1, 0xcc($a3)
/* 91DA0 800911A0 0060F809 */  jalr       $v1
/* 91DA4 800911A4 00C22021 */   addu      $a0, $a2, $v0
/* 91DA8 800911A8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 91DAC 800911AC 03E00008 */  jr         $ra
/* 91DB0 800911B0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel get_alaron_portait
/* 91DB4 800911B4 3085FFFF */  andi       $a1, $a0, 0xffff
/* 91DB8 800911B8 3C02800F */  lui        $v0, %hi(EntityPointer)
/* 91DBC 800911BC 8C4413A0 */  lw         $a0, %lo(EntityPointer)($v0)
/* 91DC0 800911C0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91DC4 800911C4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 91DC8 800911C8 0C01D531 */  jal        getEntityPortait
/* 91DCC 800911CC AFB00010 */   sw        $s0, 0x10($sp)
/* 91DD0 800911D0 3C10800F */  lui        $s0, %hi(portait_frame_pointer)
/* 91DD4 800911D4 8E041CE0 */  lw         $a0, %lo(portait_frame_pointer)($s0)
/* 91DD8 800911D8 0C0244CB */  jal        func_printing_portrait
/* 91DDC 800911DC 00402821 */   addu      $a1, $v0, $zero
/* 91DE0 800911E0 0C0244F3 */  jal        func_800913CC
/* 91DE4 800911E4 8E041CE0 */   lw        $a0, 0x1ce0($s0)
/* 91DE8 800911E8 8FBF0014 */  lw         $ra, 0x14($sp)
/* 91DEC 800911EC 8FB00010 */  lw         $s0, 0x10($sp)
/* 91DF0 800911F0 03E00008 */  jr         $ra
/* 91DF4 800911F4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel draw_portait_frame
/* 91DF8 800911F8 27BDFF60 */  addiu      $sp, $sp, -0xa0
/* 91DFC 800911FC AFB00098 */  sw         $s0, 0x98($sp)
/* 91E00 80091200 00808021 */  addu       $s0, $a0, $zero
/* 91E04 80091204 27A90018 */  addiu      $t1, $sp, 0x18
/* 91E08 80091208 01202821 */  addu       $a1, $t1, $zero
/* 91E0C 8009120C 2406004C */  addiu      $a2, $zero, 0x4c
/* 91E10 80091210 2407000A */  addiu      $a3, $zero, 0xa
/* 91E14 80091214 240200B4 */  addiu      $v0, $zero, 0xb4
/* 91E18 80091218 240300F6 */  addiu      $v1, $zero, 0xf6
/* 91E1C 8009121C 240800F0 */  addiu      $t0, $zero, 0xf0
/* 91E20 80091220 AFBF009C */  sw         $ra, 0x9c($sp)
/* 91E24 80091224 A7A00018 */  sh         $zero, 0x18($sp)
/* 91E28 80091228 A5220002 */  sh         $v0, 2($t1)
/* 91E2C 8009122C 240200E1 */  addiu      $v0, $zero, 0xe1
/* 91E30 80091230 A5230004 */  sh         $v1, 4($t1)
/* 91E34 80091234 240300C8 */  addiu      $v1, $zero, 0xc8
/* 91E38 80091238 A5280006 */  sh         $t0, 6($t1)
/* 91E3C 8009123C A3A20058 */  sb         $v0, 0x58($sp)
/* 91E40 80091240 A3A20059 */  sb         $v0, 0x59($sp)
/* 91E44 80091244 A3A2005A */  sb         $v0, 0x5a($sp)
/* 91E48 80091248 27A20058 */  addiu      $v0, $sp, 0x58
/* 91E4C 8009124C A3A3005B */  sb         $v1, 0x5b($sp)
/* 91E50 80091250 AFA20010 */  sw         $v0, 0x10($sp)
/* 91E54 80091254 0C01799C */  jal        cinematictext_widget
/* 91E58 80091258 AFA00014 */   sw        $zero, 0x14($sp)
/* 91E5C 8009125C 240400DF */  addiu      $a0, $zero, 0xdf
/* 91E60 80091260 3C02800E */  lui        $v0, %hi(D_800E1CE0)
/* 91E64 80091264 24421CE0 */  addiu      $v0, $v0, %lo(D_800E1CE0)
/* 91E68 80091268 AE020078 */  sw         $v0, 0x78($s0)
/* 91E6C 8009126C 0C0290E2 */  jal        get_borg_8
/* 91E70 80091270 AE0000A4 */   sw        $zero, 0xa4($s0)
/* 91E74 80091274 02002021 */  addu       $a0, $s0, $zero
/* 91E78 80091278 00402821 */  addu       $a1, $v0, $zero
/* 91E7C 8009127C 24060014 */  addiu      $a2, $zero, 0x14
/* 91E80 80091280 0C02F3E9 */  jal        func_800BCFA4
/* 91E84 80091284 240700AE */   addiu     $a3, $zero, 0xae
/* 91E88 80091288 2404007C */  addiu      $a0, $zero, 0x7c
/* 91E8C 8009128C 0C026259 */  jal        passToMalloc
/* 91E90 80091290 AE02009C */   sw        $v0, 0x9c($s0)
/* 91E94 80091294 00402021 */  addu       $a0, $v0, $zero
/* 91E98 80091298 0C02E518 */  jal        borg8_widget
/* 91E9C 8009129C 00002821 */   addu      $a1, $zero, $zero
/* 91EA0 800912A0 00402021 */  addu       $a0, $v0, $zero
/* 91EA4 800912A4 2405001A */  addiu      $a1, $zero, 0x1a
/* 91EA8 800912A8 240600B4 */  addiu      $a2, $zero, 0xb4
/* 91EAC 800912AC 0C02DD3F */  jal        set_widget_coords
/* 91EB0 800912B0 AE020098 */   sw        $v0, 0x98($s0)
/* 91EB4 800912B4 8E050098 */  lw         $a1, 0x98($s0)
/* 91EB8 800912B8 0C02DEDC */  jal        link_widgets
/* 91EBC 800912BC 02002021 */   addu      $a0, $s0, $zero
/* 91EC0 800912C0 8FBF009C */  lw         $ra, 0x9c($sp)
/* 91EC4 800912C4 02001021 */  addu       $v0, $s0, $zero
/* 91EC8 800912C8 AE0000A0 */  sw         $zero, 0xa0($s0)
/* 91ECC 800912CC 8FB00098 */  lw         $s0, 0x98($sp)
/* 91ED0 800912D0 03E00008 */  jr         $ra
/* 91ED4 800912D4 27BD00A0 */   addiu     $sp, $sp, 0xa0

glabel func_800912D8
/* 91ED8 800912D8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 91EDC 800912DC AFB00010 */  sw         $s0, 0x10($sp)
/* 91EE0 800912E0 00808021 */  addu       $s0, $a0, $zero
/* 91EE4 800912E4 3C02800E */  lui        $v0, %hi(D_800E1CE0)
/* 91EE8 800912E8 24421CE0 */  addiu      $v0, $v0, %lo(D_800E1CE0)
/* 91EEC 800912EC AFBF0018 */  sw         $ra, 0x18($sp)
/* 91EF0 800912F0 AFB10014 */  sw         $s1, 0x14($sp)
/* 91EF4 800912F4 8E04009C */  lw         $a0, 0x9c($s0)
/* 91EF8 800912F8 00A08821 */  addu       $s1, $a1, $zero
/* 91EFC 800912FC 0C0133E5 */  jal        free_borg8_widget
/* 91F00 80091300 AE020078 */   sw        $v0, 0x78($s0)
/* 91F04 80091304 0C0133E5 */  jal        free_borg8_widget
/* 91F08 80091308 8E040098 */   lw        $a0, 0x98($s0)
/* 91F0C 8009130C 02002021 */  addu       $a0, $s0, $zero
/* 91F10 80091310 0C017A27 */  jal        func_8005E89C
/* 91F14 80091314 02202821 */   addu      $a1, $s1, $zero
/* 91F18 80091318 8FBF0018 */  lw         $ra, 0x18($sp)
/* 91F1C 8009131C 8FB10014 */  lw         $s1, 0x14($sp)
/* 91F20 80091320 8FB00010 */  lw         $s0, 0x10($sp)
/* 91F24 80091324 03E00008 */  jr         $ra
/* 91F28 80091328 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_printing_portrait
/* 91F2C 8009132C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 91F30 80091330 AFB10014 */  sw         $s1, 0x14($sp)
/* 91F34 80091334 00808821 */  addu       $s1, $a0, $zero
/* 91F38 80091338 AFBF0018 */  sw         $ra, 0x18($sp)
/* 91F3C 8009133C AFB00010 */  sw         $s0, 0x10($sp)
/* 91F40 80091340 8E2200A4 */  lw         $v0, 0xa4($s1)
/* 91F44 80091344 14400012 */  bnez       $v0, .L80091390
/* 91F48 80091348 00A08021 */   addu      $s0, $a1, $zero
/* 91F4C 8009134C 8E2200A0 */  lw         $v0, 0xa0($s1)
/* 91F50 80091350 12020010 */  beq        $s0, $v0, .L80091394
/* 91F54 80091354 8FBF0018 */   lw        $ra, 0x18($sp)
/* 91F58 80091358 8E240098 */  lw         $a0, 0x98($s1)
/* 91F5C 8009135C 0C0133E5 */  jal        free_borg8_widget
/* 91F60 80091360 AE3000A0 */   sw        $s0, 0xa0($s1)
/* 91F64 80091364 0C0290E2 */  jal        get_borg_8
/* 91F68 80091368 02002021 */   addu      $a0, $s0, $zero
/* 91F6C 8009136C 00408021 */  addu       $s0, $v0, $zero
/* 91F70 80091370 8E220098 */  lw         $v0, 0x98($s1)
/* 91F74 80091374 9605000A */  lhu        $a1, 0xa($s0)
/* 91F78 80091378 00402021 */  addu       $a0, $v0, $zero
/* 91F7C 8009137C 0C02DD42 */  jal        set_widgetHeight
/* 91F80 80091380 AC50006C */   sw        $s0, 0x6c($v0)
/* 91F84 80091384 8E240098 */  lw         $a0, 0x98($s1)
/* 91F88 80091388 0C02DD46 */  jal        set_widgetWidth
/* 91F8C 8009138C 9605000C */   lhu       $a1, 0xc($s0)
.L80091390:
/* 91F90 80091390 8FBF0018 */  lw         $ra, 0x18($sp)
.L80091394:
/* 91F94 80091394 8FB10014 */  lw         $s1, 0x14($sp)
/* 91F98 80091398 8FB00010 */  lw         $s0, 0x10($sp)
/* 91F9C 8009139C 03E00008 */  jr         $ra
/* 91FA0 800913A0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800913A4
/* 91FA4 800913A4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 91FA8 800913A8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 91FAC 800913AC 8C8200A4 */  lw         $v0, 0xa4($a0)
/* 91FB0 800913B0 14400004 */  bnez       $v0, .L800913C4
/* 91FB4 800913B4 8FBF0010 */   lw        $ra, 0x10($sp)
/* 91FB8 800913B8 0C017A3C */  jal        func_8005E8F0
/* 91FBC 800913BC 00000000 */   nop
/* 91FC0 800913C0 8FBF0010 */  lw         $ra, 0x10($sp)
.L800913C4:
/* 91FC4 800913C4 03E00008 */  jr         $ra
/* 91FC8 800913C8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800913CC
/* 91FCC 800913CC 24020001 */  addiu      $v0, $zero, 1
/* 91FD0 800913D0 03E00008 */  jr         $ra
/* 91FD4 800913D4 AC8200A4 */   sw        $v0, 0xa4($a0)
/* 91FD8 800913D8 00000000 */  nop
/* 91FDC 800913DC 00000000 */  nop
