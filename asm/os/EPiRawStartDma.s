.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osEPiRawStartDma
/* C8C10 800C8010 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C8C14 800C8014 AFB00010 */  sw         $s0, 0x10($sp)
/* C8C18 800C8018 00808021 */  addu       $s0, $a0, $zero
/* C8C1C 800C801C AFB10014 */  sw         $s1, 0x14($sp)
/* C8C20 800C8020 00A08821 */  addu       $s1, $a1, $zero
/* C8C24 800C8024 AFB20018 */  sw         $s2, 0x18($sp)
/* C8C28 800C8028 00C09021 */  addu       $s2, $a2, $zero
/* C8C2C 800C802C 3C02A460 */  lui        $v0, 0xa460
/* C8C30 800C8030 34420010 */  ori        $v0, $v0, 0x10
/* C8C34 800C8034 AFBF0020 */  sw         $ra, 0x20($sp)
/* C8C38 800C8038 AFB3001C */  sw         $s3, 0x1c($sp)
/* C8C3C 800C803C 8C420000 */  lw         $v0, ($v0)
/* C8C40 800C8040 8FB30038 */  lw         $s3, 0x38($sp)
/* C8C44 800C8044 30420003 */  andi       $v0, $v0, 3
/* C8C48 800C8048 10400007 */  beqz       $v0, .L800C8068
/* C8C4C 800C804C 00E02021 */   addu      $a0, $a3, $zero
/* C8C50 800C8050 3C03A460 */  lui        $v1, 0xa460
/* C8C54 800C8054 34630010 */  ori        $v1, $v1, 0x10
.L800C8058:
/* C8C58 800C8058 8C620000 */  lw         $v0, ($v1)
/* C8C5C 800C805C 30420003 */  andi       $v0, $v0, 3
/* C8C60 800C8060 1440FFFD */  bnez       $v0, .L800C8058
/* C8C64 800C8064 00000000 */   nop
.L800C8068:
/* C8C68 800C8068 92060009 */  lbu        $a2, 9($s0)
/* C8C6C 800C806C 00061080 */  sll        $v0, $a2, 2
/* C8C70 800C8070 3C05800F */  lui        $a1, %hi(__osCurrentHandle)
/* C8C74 800C8074 00A22821 */  addu       $a1, $a1, $v0
/* C8C78 800C8078 8CA53890 */  lw         $a1, %lo(__osCurrentHandle)($a1)
/* C8C7C 800C807C 92020004 */  lbu        $v0, 4($s0)
/* C8C80 800C8080 90A30004 */  lbu        $v1, 4($a1)
/* C8C84 800C8084 1062003D */  beq        $v1, $v0, .L800C817C
/* C8C88 800C8088 00000000 */   nop
/* C8C8C 800C808C 14C00019 */  bnez       $a2, .L800C80F4
/* C8C90 800C8090 00A01821 */   addu      $v1, $a1, $zero
/* C8C94 800C8094 90620005 */  lbu        $v0, 5($v1)
/* C8C98 800C8098 92050005 */  lbu        $a1, 5($s0)
/* C8C9C 800C809C 10450003 */  beq        $v0, $a1, .L800C80AC
/* C8CA0 800C80A0 3C02A460 */   lui       $v0, 0xa460
/* C8CA4 800C80A4 34420014 */  ori        $v0, $v0, 0x14
/* C8CA8 800C80A8 AC450000 */  sw         $a1, ($v0)
.L800C80AC:
/* C8CAC 800C80AC 90620006 */  lbu        $v0, 6($v1)
/* C8CB0 800C80B0 92050006 */  lbu        $a1, 6($s0)
/* C8CB4 800C80B4 10450003 */  beq        $v0, $a1, .L800C80C4
/* C8CB8 800C80B8 3C02A460 */   lui       $v0, 0xa460
/* C8CBC 800C80BC 3442001C */  ori        $v0, $v0, 0x1c
/* C8CC0 800C80C0 AC450000 */  sw         $a1, ($v0)
.L800C80C4:
/* C8CC4 800C80C4 90620007 */  lbu        $v0, 7($v1)
/* C8CC8 800C80C8 92050007 */  lbu        $a1, 7($s0)
/* C8CCC 800C80CC 10450003 */  beq        $v0, $a1, .L800C80DC
/* C8CD0 800C80D0 3C02A460 */   lui       $v0, 0xa460
/* C8CD4 800C80D4 34420020 */  ori        $v0, $v0, 0x20
/* C8CD8 800C80D8 AC450000 */  sw         $a1, ($v0)
.L800C80DC:
/* C8CDC 800C80DC 90620008 */  lbu        $v0, 8($v1)
/* C8CE0 800C80E0 92050008 */  lbu        $a1, 8($s0)
/* C8CE4 800C80E4 1045001B */  beq        $v0, $a1, .L800C8154
/* C8CE8 800C80E8 3C02A460 */   lui       $v0, 0xa460
/* C8CEC 800C80EC 08032054 */  j          .L800C8150
/* C8CF0 800C80F0 34420018 */   ori       $v0, $v0, 0x18
.L800C80F4:
/* C8CF4 800C80F4 90620005 */  lbu        $v0, 5($v1)
/* C8CF8 800C80F8 92050005 */  lbu        $a1, 5($s0)
/* C8CFC 800C80FC 10450003 */  beq        $v0, $a1, .L800C810C
/* C8D00 800C8100 3C02A460 */   lui       $v0, 0xa460
/* C8D04 800C8104 34420024 */  ori        $v0, $v0, 0x24
/* C8D08 800C8108 AC450000 */  sw         $a1, ($v0)
.L800C810C:
/* C8D0C 800C810C 90620006 */  lbu        $v0, 6($v1)
/* C8D10 800C8110 92050006 */  lbu        $a1, 6($s0)
/* C8D14 800C8114 10450003 */  beq        $v0, $a1, .L800C8124
/* C8D18 800C8118 3C02A460 */   lui       $v0, 0xa460
/* C8D1C 800C811C 3442002C */  ori        $v0, $v0, 0x2c
/* C8D20 800C8120 AC450000 */  sw         $a1, ($v0)
.L800C8124:
/* C8D24 800C8124 90620007 */  lbu        $v0, 7($v1)
/* C8D28 800C8128 92050007 */  lbu        $a1, 7($s0)
/* C8D2C 800C812C 10450003 */  beq        $v0, $a1, .L800C813C
/* C8D30 800C8130 3C02A460 */   lui       $v0, 0xa460
/* C8D34 800C8134 34420030 */  ori        $v0, $v0, 0x30
/* C8D38 800C8138 AC450000 */  sw         $a1, ($v0)
.L800C813C:
/* C8D3C 800C813C 90620008 */  lbu        $v0, 8($v1)
/* C8D40 800C8140 92050008 */  lbu        $a1, 8($s0)
/* C8D44 800C8144 10450003 */  beq        $v0, $a1, .L800C8154
/* C8D48 800C8148 3C02A460 */   lui       $v0, 0xa460
/* C8D4C 800C814C 34420028 */  ori        $v0, $v0, 0x28
.L800C8150:
/* C8D50 800C8150 AC450000 */  sw         $a1, ($v0)
.L800C8154:
/* C8D54 800C8154 92020004 */  lbu        $v0, 4($s0)
/* C8D58 800C8158 A0620004 */  sb         $v0, 4($v1)
/* C8D5C 800C815C 92020005 */  lbu        $v0, 5($s0)
/* C8D60 800C8160 A0620005 */  sb         $v0, 5($v1)
/* C8D64 800C8164 92020006 */  lbu        $v0, 6($s0)
/* C8D68 800C8168 A0620006 */  sb         $v0, 6($v1)
/* C8D6C 800C816C 92020007 */  lbu        $v0, 7($s0)
/* C8D70 800C8170 A0620007 */  sb         $v0, 7($v1)
/* C8D74 800C8174 92020008 */  lbu        $v0, 8($s0)
/* C8D78 800C8178 A0620008 */  sb         $v0, 8($v1)
.L800C817C:
/* C8D7C 800C817C 0C034888 */  jal        osVirtualToPhysical
/* C8D80 800C8180 00000000 */   nop
/* C8D84 800C8184 3C04A460 */  lui        $a0, 0xa460
/* C8D88 800C8188 34840004 */  ori        $a0, $a0, 4
/* C8D8C 800C818C 3C03A460 */  lui        $v1, 0xa460
/* C8D90 800C8190 AC620000 */  sw         $v0, ($v1)
/* C8D94 800C8194 8E02000C */  lw         $v0, 0xc($s0)
/* C8D98 800C8198 3C031FFF */  lui        $v1, 0x1fff
/* C8D9C 800C819C 3463FFFF */  ori        $v1, $v1, 0xffff
/* C8DA0 800C81A0 00521025 */  or         $v0, $v0, $s2
/* C8DA4 800C81A4 00431024 */  and        $v0, $v0, $v1
/* C8DA8 800C81A8 AC820000 */  sw         $v0, ($a0)
/* C8DAC 800C81AC 12200005 */  beqz       $s1, .L800C81C4
/* C8DB0 800C81B0 24020001 */   addiu     $v0, $zero, 1
/* C8DB4 800C81B4 12220006 */  beq        $s1, $v0, .L800C81D0
/* C8DB8 800C81B8 3C03A460 */   lui       $v1, 0xa460
/* C8DBC 800C81BC 08032078 */  j          .L800C81E0
/* C8DC0 800C81C0 2402FFFF */   addiu     $v0, $zero, -1
.L800C81C4:
/* C8DC4 800C81C4 3C03A460 */  lui        $v1, 0xa460
/* C8DC8 800C81C8 08032075 */  j          .L800C81D4
/* C8DCC 800C81CC 3463000C */   ori       $v1, $v1, 0xc
.L800C81D0:
/* C8DD0 800C81D0 34630008 */  ori        $v1, $v1, 8
.L800C81D4:
/* C8DD4 800C81D4 2662FFFF */  addiu      $v0, $s3, -1
/* C8DD8 800C81D8 AC620000 */  sw         $v0, ($v1)
/* C8DDC 800C81DC 00001021 */  addu       $v0, $zero, $zero
.L800C81E0:
/* C8DE0 800C81E0 8FBF0020 */  lw         $ra, 0x20($sp)
/* C8DE4 800C81E4 8FB3001C */  lw         $s3, 0x1c($sp)
/* C8DE8 800C81E8 8FB20018 */  lw         $s2, 0x18($sp)
/* C8DEC 800C81EC 8FB10014 */  lw         $s1, 0x14($sp)
/* C8DF0 800C81F0 8FB00010 */  lw         $s0, 0x10($sp)
/* C8DF4 800C81F4 03E00008 */  jr         $ra
/* C8DF8 800C81F8 27BD0028 */   addiu     $sp, $sp, 0x28
/* C8DFC 800C81FC 00000000 */  nop
