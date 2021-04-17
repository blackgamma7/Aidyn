.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osEPiRawWriteIo
/* C8F70 800C8370 3C02A460 */  lui        $v0, 0xa460
/* C8F74 800C8374 34420010 */  ori        $v0, $v0, 0x10
/* C8F78 800C8378 8C420000 */  lw         $v0, ($v0)
/* C8F7C 800C837C 30420003 */  andi       $v0, $v0, 3
/* C8F80 800C8380 10400006 */  beqz       $v0, .L800C839C
/* C8F84 800C8384 3C03A460 */   lui       $v1, 0xa460
/* C8F88 800C8388 34630010 */  ori        $v1, $v1, 0x10
.L800C838C:
/* C8F8C 800C838C 8C620000 */  lw         $v0, ($v1)
/* C8F90 800C8390 30420003 */  andi       $v0, $v0, 3
/* C8F94 800C8394 1440FFFD */  bnez       $v0, .L800C838C
/* C8F98 800C8398 00000000 */   nop
.L800C839C:
/* C8F9C 800C839C 90880009 */  lbu        $t0, 9($a0)
/* C8FA0 800C83A0 00081080 */  sll        $v0, $t0, 2
/* C8FA4 800C83A4 3C07800F */  lui        $a3, %hi(__osCurrentHandle)
/* C8FA8 800C83A8 00E23821 */  addu       $a3, $a3, $v0
/* C8FAC 800C83AC 8CE73890 */  lw         $a3, %lo(__osCurrentHandle)($a3)
/* C8FB0 800C83B0 90820004 */  lbu        $v0, 4($a0)
/* C8FB4 800C83B4 90E30004 */  lbu        $v1, 4($a3)
/* C8FB8 800C83B8 1062003F */  beq        $v1, $v0, .L800C84B8
/* C8FBC 800C83BC 00000000 */   nop
/* C8FC0 800C83C0 1500001A */  bnez       $t0, .L800C842C
/* C8FC4 800C83C4 00E01821 */   addu      $v1, $a3, $zero
/* C8FC8 800C83C8 90620005 */  lbu        $v0, 5($v1)
/* C8FCC 800C83CC 90870005 */  lbu        $a3, 5($a0)
/* C8FD0 800C83D0 10470003 */  beq        $v0, $a3, .L800C83E0
/* C8FD4 800C83D4 3C02A460 */   lui       $v0, 0xa460
/* C8FD8 800C83D8 34420014 */  ori        $v0, $v0, 0x14
/* C8FDC 800C83DC AC470000 */  sw         $a3, ($v0)
.L800C83E0:
/* C8FE0 800C83E0 90620006 */  lbu        $v0, 6($v1)
/* C8FE4 800C83E4 90870006 */  lbu        $a3, 6($a0)
/* C8FE8 800C83E8 10470003 */  beq        $v0, $a3, .L800C83F8
/* C8FEC 800C83EC 3C02A460 */   lui       $v0, 0xa460
/* C8FF0 800C83F0 3442001C */  ori        $v0, $v0, 0x1c
/* C8FF4 800C83F4 AC470000 */  sw         $a3, ($v0)
.L800C83F8:
/* C8FF8 800C83F8 90620007 */  lbu        $v0, 7($v1)
/* C8FFC 800C83FC 90870007 */  lbu        $a3, 7($a0)
/* C9000 800C8400 10470003 */  beq        $v0, $a3, .L800C8410
/* C9004 800C8404 3C02A460 */   lui       $v0, 0xa460
/* C9008 800C8408 34420020 */  ori        $v0, $v0, 0x20
/* C900C 800C840C AC470000 */  sw         $a3, ($v0)
.L800C8410:
/* C9010 800C8410 90620008 */  lbu        $v0, 8($v1)
/* C9014 800C8414 90870008 */  lbu        $a3, 8($a0)
/* C9018 800C8418 1047001D */  beq        $v0, $a3, .L800C8490
/* C901C 800C841C 00000000 */   nop
/* C9020 800C8420 3C02A460 */  lui        $v0, 0xa460
/* C9024 800C8424 08032123 */  j          .L800C848C
/* C9028 800C8428 34420018 */   ori       $v0, $v0, 0x18
.L800C842C:
/* C902C 800C842C 90620005 */  lbu        $v0, 5($v1)
/* C9030 800C8430 90870005 */  lbu        $a3, 5($a0)
/* C9034 800C8434 10470003 */  beq        $v0, $a3, .L800C8444
/* C9038 800C8438 3C02A460 */   lui       $v0, 0xa460
/* C903C 800C843C 34420024 */  ori        $v0, $v0, 0x24
/* C9040 800C8440 AC470000 */  sw         $a3, ($v0)
.L800C8444:
/* C9044 800C8444 90620006 */  lbu        $v0, 6($v1)
/* C9048 800C8448 90870006 */  lbu        $a3, 6($a0)
/* C904C 800C844C 10470003 */  beq        $v0, $a3, .L800C845C
/* C9050 800C8450 3C02A460 */   lui       $v0, 0xa460
/* C9054 800C8454 3442002C */  ori        $v0, $v0, 0x2c
/* C9058 800C8458 AC470000 */  sw         $a3, ($v0)
.L800C845C:
/* C905C 800C845C 90620007 */  lbu        $v0, 7($v1)
/* C9060 800C8460 90870007 */  lbu        $a3, 7($a0)
/* C9064 800C8464 10470003 */  beq        $v0, $a3, .L800C8474
/* C9068 800C8468 3C02A460 */   lui       $v0, 0xa460
/* C906C 800C846C 34420030 */  ori        $v0, $v0, 0x30
/* C9070 800C8470 AC470000 */  sw         $a3, ($v0)
.L800C8474:
/* C9074 800C8474 90620008 */  lbu        $v0, 8($v1)
/* C9078 800C8478 90870008 */  lbu        $a3, 8($a0)
/* C907C 800C847C 10470004 */  beq        $v0, $a3, .L800C8490
/* C9080 800C8480 00000000 */   nop
/* C9084 800C8484 3C02A460 */  lui        $v0, 0xa460
/* C9088 800C8488 34420028 */  ori        $v0, $v0, 0x28
.L800C848C:
/* C908C 800C848C AC470000 */  sw         $a3, ($v0)
.L800C8490:
/* C9090 800C8490 90820004 */  lbu        $v0, 4($a0)
/* C9094 800C8494 A0620004 */  sb         $v0, 4($v1)
/* C9098 800C8498 90820005 */  lbu        $v0, 5($a0)
/* C909C 800C849C A0620005 */  sb         $v0, 5($v1)
/* C90A0 800C84A0 90820006 */  lbu        $v0, 6($a0)
/* C90A4 800C84A4 A0620006 */  sb         $v0, 6($v1)
/* C90A8 800C84A8 90820007 */  lbu        $v0, 7($a0)
/* C90AC 800C84AC A0620007 */  sb         $v0, 7($v1)
/* C90B0 800C84B0 90820008 */  lbu        $v0, 8($a0)
/* C90B4 800C84B4 A0620008 */  sb         $v0, 8($v1)
.L800C84B8:
/* C90B8 800C84B8 8C82000C */  lw         $v0, 0xc($a0)
/* C90BC 800C84BC 3C03A000 */  lui        $v1, 0xa000
/* C90C0 800C84C0 00451025 */  or         $v0, $v0, $a1
/* C90C4 800C84C4 00431025 */  or         $v0, $v0, $v1
/* C90C8 800C84C8 AC460000 */  sw         $a2, ($v0)
/* C90CC 800C84CC 03E00008 */  jr         $ra
/* C90D0 800C84D0 00001021 */   addu      $v0, $zero, $zero
/* C90D4 800C84D4 00000000 */  nop
/* C90D8 800C84D8 00000000 */  nop
/* C90DC 800C84DC 00000000 */  nop
