.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osEPiRawReadIo
/* C8E00 800C8200 3C02A460 */  lui        $v0, 0xa460
/* C8E04 800C8204 34420010 */  ori        $v0, $v0, 0x10
/* C8E08 800C8208 8C420000 */  lw         $v0, ($v0)
/* C8E0C 800C820C 30420003 */  andi       $v0, $v0, 3
/* C8E10 800C8210 10400006 */  beqz       $v0, .L800C822C
/* C8E14 800C8214 3C03A460 */   lui       $v1, 0xa460
/* C8E18 800C8218 34630010 */  ori        $v1, $v1, 0x10
.L800C821C:
/* C8E1C 800C821C 8C620000 */  lw         $v0, ($v1)
/* C8E20 800C8220 30420003 */  andi       $v0, $v0, 3
/* C8E24 800C8224 1440FFFD */  bnez       $v0, .L800C821C
/* C8E28 800C8228 00000000 */   nop
.L800C822C:
/* C8E2C 800C822C 90880009 */  lbu        $t0, 9($a0)
/* C8E30 800C8230 00081080 */  sll        $v0, $t0, 2
/* C8E34 800C8234 3C07800F */  lui        $a3, %hi(__osCurrentHandle)
/* C8E38 800C8238 00E23821 */  addu       $a3, $a3, $v0
/* C8E3C 800C823C 8CE73890 */  lw         $a3, %lo(__osCurrentHandle)($a3)
/* C8E40 800C8240 90820004 */  lbu        $v0, 4($a0)
/* C8E44 800C8244 90E30004 */  lbu        $v1, 4($a3)
/* C8E48 800C8248 1062003F */  beq        $v1, $v0, .L800C8348
/* C8E4C 800C824C 00000000 */   nop
/* C8E50 800C8250 1500001A */  bnez       $t0, .L800C82BC
/* C8E54 800C8254 00E01821 */   addu      $v1, $a3, $zero
/* C8E58 800C8258 90620005 */  lbu        $v0, 5($v1)
/* C8E5C 800C825C 90870005 */  lbu        $a3, 5($a0)
/* C8E60 800C8260 10470003 */  beq        $v0, $a3, .L800C8270
/* C8E64 800C8264 3C02A460 */   lui       $v0, 0xa460
/* C8E68 800C8268 34420014 */  ori        $v0, $v0, 0x14
/* C8E6C 800C826C AC470000 */  sw         $a3, ($v0)
.L800C8270:
/* C8E70 800C8270 90620006 */  lbu        $v0, 6($v1)
/* C8E74 800C8274 90870006 */  lbu        $a3, 6($a0)
/* C8E78 800C8278 10470003 */  beq        $v0, $a3, .L800C8288
/* C8E7C 800C827C 3C02A460 */   lui       $v0, 0xa460
/* C8E80 800C8280 3442001C */  ori        $v0, $v0, 0x1c
/* C8E84 800C8284 AC470000 */  sw         $a3, ($v0)
.L800C8288:
/* C8E88 800C8288 90620007 */  lbu        $v0, 7($v1)
/* C8E8C 800C828C 90870007 */  lbu        $a3, 7($a0)
/* C8E90 800C8290 10470003 */  beq        $v0, $a3, .L800C82A0
/* C8E94 800C8294 3C02A460 */   lui       $v0, 0xa460
/* C8E98 800C8298 34420020 */  ori        $v0, $v0, 0x20
/* C8E9C 800C829C AC470000 */  sw         $a3, ($v0)
.L800C82A0:
/* C8EA0 800C82A0 90620008 */  lbu        $v0, 8($v1)
/* C8EA4 800C82A4 90870008 */  lbu        $a3, 8($a0)
/* C8EA8 800C82A8 1047001D */  beq        $v0, $a3, .L800C8320
/* C8EAC 800C82AC 00000000 */   nop
/* C8EB0 800C82B0 3C02A460 */  lui        $v0, 0xa460
/* C8EB4 800C82B4 080320C7 */  j          .L800C831C
/* C8EB8 800C82B8 34420018 */   ori       $v0, $v0, 0x18
.L800C82BC:
/* C8EBC 800C82BC 90620005 */  lbu        $v0, 5($v1)
/* C8EC0 800C82C0 90870005 */  lbu        $a3, 5($a0)
/* C8EC4 800C82C4 10470003 */  beq        $v0, $a3, .L800C82D4
/* C8EC8 800C82C8 3C02A460 */   lui       $v0, 0xa460
/* C8ECC 800C82CC 34420024 */  ori        $v0, $v0, 0x24
/* C8ED0 800C82D0 AC470000 */  sw         $a3, ($v0)
.L800C82D4:
/* C8ED4 800C82D4 90620006 */  lbu        $v0, 6($v1)
/* C8ED8 800C82D8 90870006 */  lbu        $a3, 6($a0)
/* C8EDC 800C82DC 10470003 */  beq        $v0, $a3, .L800C82EC
/* C8EE0 800C82E0 3C02A460 */   lui       $v0, 0xa460
/* C8EE4 800C82E4 3442002C */  ori        $v0, $v0, 0x2c
/* C8EE8 800C82E8 AC470000 */  sw         $a3, ($v0)
.L800C82EC:
/* C8EEC 800C82EC 90620007 */  lbu        $v0, 7($v1)
/* C8EF0 800C82F0 90870007 */  lbu        $a3, 7($a0)
/* C8EF4 800C82F4 10470003 */  beq        $v0, $a3, .L800C8304
/* C8EF8 800C82F8 3C02A460 */   lui       $v0, 0xa460
/* C8EFC 800C82FC 34420030 */  ori        $v0, $v0, 0x30
/* C8F00 800C8300 AC470000 */  sw         $a3, ($v0)
.L800C8304:
/* C8F04 800C8304 90620008 */  lbu        $v0, 8($v1)
/* C8F08 800C8308 90870008 */  lbu        $a3, 8($a0)
/* C8F0C 800C830C 10470004 */  beq        $v0, $a3, .L800C8320
/* C8F10 800C8310 00000000 */   nop
/* C8F14 800C8314 3C02A460 */  lui        $v0, 0xa460
/* C8F18 800C8318 34420028 */  ori        $v0, $v0, 0x28
.L800C831C:
/* C8F1C 800C831C AC470000 */  sw         $a3, ($v0)
.L800C8320:
/* C8F20 800C8320 90820004 */  lbu        $v0, 4($a0)
/* C8F24 800C8324 A0620004 */  sb         $v0, 4($v1)
/* C8F28 800C8328 90820005 */  lbu        $v0, 5($a0)
/* C8F2C 800C832C A0620005 */  sb         $v0, 5($v1)
/* C8F30 800C8330 90820006 */  lbu        $v0, 6($a0)
/* C8F34 800C8334 A0620006 */  sb         $v0, 6($v1)
/* C8F38 800C8338 90820007 */  lbu        $v0, 7($a0)
/* C8F3C 800C833C A0620007 */  sb         $v0, 7($v1)
/* C8F40 800C8340 90820008 */  lbu        $v0, 8($a0)
/* C8F44 800C8344 A0620008 */  sb         $v0, 8($v1)
.L800C8348:
/* C8F48 800C8348 8C82000C */  lw         $v0, 0xc($a0)
/* C8F4C 800C834C 3C03A000 */  lui        $v1, 0xa000
/* C8F50 800C8350 00451025 */  or         $v0, $v0, $a1
/* C8F54 800C8354 00431025 */  or         $v0, $v0, $v1
/* C8F58 800C8358 8C420000 */  lw         $v0, ($v0)
/* C8F5C 800C835C ACC20000 */  sw         $v0, ($a2)
/* C8F60 800C8360 03E00008 */  jr         $ra
/* C8F64 800C8364 00001021 */   addu      $v0, $zero, $zero
/* C8F68 800C8368 00000000 */  nop
/* C8F6C 800C836C 00000000 */  nop
