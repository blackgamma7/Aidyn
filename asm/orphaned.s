.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ret_a0
/* A9BF0 800A8FF0 03E00008 */  jr         $ra
/* A9BF4 800A8FF4 00801021 */   addu      $v0, $a0, $zero

glabel ofunc_sub_800a8ff8
/* A9BF8 800A8FF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A9BFC 800A8FFC AFB00010 */  sw         $s0, 0x10($sp)
/* A9C00 800A9000 AFBF0014 */  sw         $ra, 0x14($sp)
/* A9C04 800A9004 0C02A3FC */  jal        ret_a0
/* A9C08 800A9008 00A08021 */   addu      $s0, $a1, $zero
/* A9C0C 800A900C 2603FFFF */  addiu      $v1, $s0, -1
/* A9C10 800A9010 00431821 */  addu       $v1, $v0, $v1
/* A9C14 800A9014 0070001B */  divu       $zero, $v1, $s0
/* A9C18 800A9018 00001812 */  mflo       $v1
/* A9C1C 800A901C 52000001 */  beql       $s0, $zero, .L800A9024
/* A9C20 800A9020 000001CD */   break     0, 7
.L800A9024:
/* A9C24 800A9024 00700018 */   mult      $v1, $s0
/* A9C28 800A9028 8FBF0014 */  lw         $ra, 0x14($sp)
/* A9C2C 800A902C 8FB00010 */  lw         $s0, 0x10($sp)
/* A9C30 800A9030 00001812 */  mflo       $v1
/* A9C34 800A9034 00621023 */  subu       $v0, $v1, $v0
/* A9C38 800A9038 03E00008 */  jr         $ra
/* A9C3C 800A903C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800A9040
/* A9C40 800A9040 03E00008 */  jr         $ra
/* A9C44 800A9044 0004102B */   sltu      $v0, $zero, $a0

glabel func_800A9048
/* A9C48 800A9048 3C02800E */  lui        $v0, %hi(D_800E3630)
/* A9C4C 800A904C 03E00008 */  jr         $ra
/* A9C50 800A9050 24423630 */   addiu     $v0, $v0, %lo(D_800E3630)

glabel func_800A9054
/* A9C54 800A9054 03E00008 */  jr         $ra
/* A9C58 800A9058 24021060 */   addiu     $v0, $zero, 0x1060

glabel func_800A905C
/* A9C5C 800A905C 3C02800E */  lui        $v0, %hi(D_800E3638)
/* A9C60 800A9060 03E00008 */  jr         $ra
/* A9C64 800A9064 24423638 */   addiu     $v0, $v0, %lo(D_800E3638)

glabel func_800A9068
/* A9C68 800A9068 3C02800E */  lui        $v0, %hi(D_800E3640)
/* A9C6C 800A906C 03E00008 */  jr         $ra
/* A9C70 800A9070 24423640 */   addiu     $v0, $v0, %lo(D_800E3640)

glabel func_800A9074
/* A9C74 800A9074 3C02800E */  lui        $v0, %hi(D_800E3638)
/* A9C78 800A9078 03E00008 */  jr         $ra
/* A9C7C 800A907C 24423638 */   addiu     $v0, $v0, %lo(D_800E3638)

glabel func_800A9080
/* A9C80 800A9080 3C02800E */  lui        $v0, %hi(D_800E3640)
/* A9C84 800A9084 03E00008 */  jr         $ra
/* A9C88 800A9088 24423640 */   addiu     $v0, $v0, %lo(D_800E3640)

glabel func_800A908C
/* A9C8C 800A908C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A9C90 800A9090 AFB20008 */  sw         $s2, 8($sp)
/* A9C94 800A9094 00A09021 */  addu       $s2, $a1, $zero
/* A9C98 800A9098 AFB40010 */  sw         $s4, 0x10($sp)
/* A9C9C 800A909C 00C0A021 */  addu       $s4, $a2, $zero
/* A9CA0 800A90A0 3098FFFF */  andi       $t8, $a0, 0xffff
/* A9CA4 800A90A4 0004CC02 */  srl        $t9, $a0, 0x10
/* A9CA8 800A90A8 AFB50014 */  sw         $s5, 0x14($sp)
/* A9CAC 800A90AC AFB3000C */  sw         $s3, 0xc($sp)
/* A9CB0 800A90B0 AFB10004 */  sw         $s1, 4($sp)
/* A9CB4 800A90B4 16400003 */  bnez       $s2, .L800A90C4
/* A9CB8 800A90B8 AFB00000 */   sw        $s0, ($sp)
/* A9CBC 800A90BC 0802A48C */  j          .L800A9230
/* A9CC0 800A90C0 24020001 */   addiu     $v0, $zero, 1
.L800A90C4:
/* A9CC4 800A90C4 12800059 */  beqz       $s4, .L800A922C
/* A9CC8 800A90C8 00191400 */   sll       $v0, $t9, 0x10
/* A9CCC 800A90CC 3C158007 */  lui        $s5, 0x8007
/* A9CD0 800A90D0 36B58071 */  ori        $s5, $s5, 0x8071
.L800A90D4:
/* A9CD4 800A90D4 2E8215B0 */  sltiu      $v0, $s4, 0x15b0
/* A9CD8 800A90D8 10400002 */  beqz       $v0, .L800A90E4
/* A9CDC 800A90DC 241315B0 */   addiu     $s3, $zero, 0x15b0
/* A9CE0 800A90E0 02809821 */  addu       $s3, $s4, $zero
.L800A90E4:
/* A9CE4 800A90E4 2A620010 */  slti       $v0, $s3, 0x10
/* A9CE8 800A90E8 14400035 */  bnez       $v0, .L800A91C0
/* A9CEC 800A90EC 0293A023 */   subu      $s4, $s4, $s3
.L800A90F0:
/* A9CF0 800A90F0 92420000 */  lbu        $v0, ($s2)
/* A9CF4 800A90F4 92430001 */  lbu        $v1, 1($s2)
/* A9CF8 800A90F8 92440002 */  lbu        $a0, 2($s2)
/* A9CFC 800A90FC 92450003 */  lbu        $a1, 3($s2)
/* A9D00 800A9100 92460004 */  lbu        $a2, 4($s2)
/* A9D04 800A9104 92470005 */  lbu        $a3, 5($s2)
/* A9D08 800A9108 92480006 */  lbu        $t0, 6($s2)
/* A9D0C 800A910C 92490007 */  lbu        $t1, 7($s2)
/* A9D10 800A9110 924A0008 */  lbu        $t2, 8($s2)
/* A9D14 800A9114 924B0009 */  lbu        $t3, 9($s2)
/* A9D18 800A9118 924C000A */  lbu        $t4, 0xa($s2)
/* A9D1C 800A911C 924D000B */  lbu        $t5, 0xb($s2)
/* A9D20 800A9120 924E000C */  lbu        $t6, 0xc($s2)
/* A9D24 800A9124 924F000D */  lbu        $t7, 0xd($s2)
/* A9D28 800A9128 9250000E */  lbu        $s0, 0xe($s2)
/* A9D2C 800A912C 9251000F */  lbu        $s1, 0xf($s2)
/* A9D30 800A9130 26520010 */  addiu      $s2, $s2, 0x10
/* A9D34 800A9134 2673FFF0 */  addiu      $s3, $s3, -0x10
/* A9D38 800A9138 0302C021 */  addu       $t8, $t8, $v0
/* A9D3C 800A913C 0338C821 */  addu       $t9, $t9, $t8
/* A9D40 800A9140 0303C021 */  addu       $t8, $t8, $v1
/* A9D44 800A9144 0338C821 */  addu       $t9, $t9, $t8
/* A9D48 800A9148 0304C021 */  addu       $t8, $t8, $a0
/* A9D4C 800A914C 0338C821 */  addu       $t9, $t9, $t8
/* A9D50 800A9150 0305C021 */  addu       $t8, $t8, $a1
/* A9D54 800A9154 0338C821 */  addu       $t9, $t9, $t8
/* A9D58 800A9158 0306C021 */  addu       $t8, $t8, $a2
/* A9D5C 800A915C 0338C821 */  addu       $t9, $t9, $t8
/* A9D60 800A9160 0307C021 */  addu       $t8, $t8, $a3
/* A9D64 800A9164 0338C821 */  addu       $t9, $t9, $t8
/* A9D68 800A9168 0308C021 */  addu       $t8, $t8, $t0
/* A9D6C 800A916C 0338C821 */  addu       $t9, $t9, $t8
/* A9D70 800A9170 0309C021 */  addu       $t8, $t8, $t1
/* A9D74 800A9174 0338C821 */  addu       $t9, $t9, $t8
/* A9D78 800A9178 030AC021 */  addu       $t8, $t8, $t2
/* A9D7C 800A917C 0338C821 */  addu       $t9, $t9, $t8
/* A9D80 800A9180 030BC021 */  addu       $t8, $t8, $t3
/* A9D84 800A9184 0338C821 */  addu       $t9, $t9, $t8
/* A9D88 800A9188 030CC021 */  addu       $t8, $t8, $t4
/* A9D8C 800A918C 0338C821 */  addu       $t9, $t9, $t8
/* A9D90 800A9190 030DC021 */  addu       $t8, $t8, $t5
/* A9D94 800A9194 0338C821 */  addu       $t9, $t9, $t8
/* A9D98 800A9198 030EC021 */  addu       $t8, $t8, $t6
/* A9D9C 800A919C 0338C821 */  addu       $t9, $t9, $t8
/* A9DA0 800A91A0 030FC021 */  addu       $t8, $t8, $t7
/* A9DA4 800A91A4 0338C821 */  addu       $t9, $t9, $t8
/* A9DA8 800A91A8 0310C021 */  addu       $t8, $t8, $s0
/* A9DAC 800A91AC 0338C821 */  addu       $t9, $t9, $t8
/* A9DB0 800A91B0 0311C021 */  addu       $t8, $t8, $s1
/* A9DB4 800A91B4 2A620010 */  slti       $v0, $s3, 0x10
/* A9DB8 800A91B8 1040FFCD */  beqz       $v0, .L800A90F0
/* A9DBC 800A91BC 0338C821 */   addu      $t9, $t9, $t8
.L800A91C0:
/* A9DC0 800A91C0 03150019 */  multu      $t8, $s5
/* A9DC4 800A91C4 12600008 */  beqz       $s3, .L800A91E8
/* A9DC8 800A91C8 00000000 */   nop
.L800A91CC:
/* A9DCC 800A91CC 92420000 */  lbu        $v0, ($s2)
/* A9DD0 800A91D0 26520001 */  addiu      $s2, $s2, 1
/* A9DD4 800A91D4 2673FFFF */  addiu      $s3, $s3, -1
/* A9DD8 800A91D8 0302C021 */  addu       $t8, $t8, $v0
/* A9DDC 800A91DC 1E60FFFB */  bgtz       $s3, .L800A91CC
/* A9DE0 800A91E0 0338C821 */   addu      $t9, $t9, $t8
/* A9DE4 800A91E4 03150019 */  multu      $t8, $s5
.L800A91E8:
/* A9DE8 800A91E8 00001810 */  mfhi       $v1
/* A9DEC 800A91EC 00031BC2 */  srl        $v1, $v1, 0xf
/* A9DF0 800A91F0 00031300 */  sll        $v0, $v1, 0xc
/* A9DF4 800A91F4 03350019 */  multu      $t9, $s5
/* A9DF8 800A91F8 00431023 */  subu       $v0, $v0, $v1
/* A9DFC 800A91FC 00021100 */  sll        $v0, $v0, 4
/* A9E00 800A9200 00431021 */  addu       $v0, $v0, $v1
/* A9E04 800A9204 0302C023 */  subu       $t8, $t8, $v0
/* A9E08 800A9208 00002010 */  mfhi       $a0
/* A9E0C 800A920C 000423C2 */  srl        $a0, $a0, 0xf
/* A9E10 800A9210 00041300 */  sll        $v0, $a0, 0xc
/* A9E14 800A9214 00441023 */  subu       $v0, $v0, $a0
/* A9E18 800A9218 00021100 */  sll        $v0, $v0, 4
/* A9E1C 800A921C 00441021 */  addu       $v0, $v0, $a0
/* A9E20 800A9220 1680FFAC */  bnez       $s4, .L800A90D4
/* A9E24 800A9224 0322C823 */   subu      $t9, $t9, $v0
/* A9E28 800A9228 00191400 */  sll        $v0, $t9, 0x10
.L800A922C:
/* A9E2C 800A922C 00581025 */  or         $v0, $v0, $t8
.L800A9230:
/* A9E30 800A9230 8FB50014 */  lw         $s5, 0x14($sp)
/* A9E34 800A9234 8FB40010 */  lw         $s4, 0x10($sp)
/* A9E38 800A9238 8FB3000C */  lw         $s3, 0xc($sp)
/* A9E3C 800A923C 8FB20008 */  lw         $s2, 8($sp)
/* A9E40 800A9240 8FB10004 */  lw         $s1, 4($sp)
/* A9E44 800A9244 8FB00000 */  lw         $s0, ($sp)
/* A9E48 800A9248 03E00008 */  jr         $ra
/* A9E4C 800A924C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ofunc_800a9250
/* A9E50 800A9250 10C0000A */  beqz       $a2, .L800A927C
/* A9E54 800A9254 00001021 */   addu      $v0, $zero, $zero
.L800A9258:
/* A9E58 800A9258 90830000 */  lbu        $v1, ($a0)
/* A9E5C 800A925C 90A20000 */  lbu        $v0, ($a1)
/* A9E60 800A9260 00621023 */  subu       $v0, $v1, $v0
/* A9E64 800A9264 14400005 */  bnez       $v0, .L800A927C
/* A9E68 800A9268 24840001 */   addiu     $a0, $a0, 1
/* A9E6C 800A926C 24C6FFFF */  addiu      $a2, $a2, -1
/* A9E70 800A9270 14C0FFF9 */  bnez       $a2, .L800A9258
/* A9E74 800A9274 24A50001 */   addiu     $a1, $a1, 1
/* A9E78 800A9278 00001021 */  addu       $v0, $zero, $zero
.L800A927C:
/* A9E7C 800A927C 03E00008 */  jr         $ra
/* A9E80 800A9280 00000000 */   nop

glabel ofunc_800a9284
/* A9E84 800A9284 10C00003 */  beqz       $a2, .L800A9294
/* A9E88 800A9288 00801821 */   addu      $v1, $a0, $zero
/* A9E8C 800A928C 54850004 */  bnel       $a0, $a1, .L800A92A0
/* A9E90 800A9290 90A20000 */   lbu       $v0, ($a1)
.L800A9294:
/* A9E94 800A9294 03E00008 */  jr         $ra
/* A9E98 800A9298 00801021 */   addu      $v0, $a0, $zero
.L800A929C:
/* A9E9C 800A929C 90A20000 */  lbu        $v0, ($a1)
.L800A92A0:
/* A9EA0 800A92A0 24A50001 */  addiu      $a1, $a1, 1
/* A9EA4 800A92A4 24C6FFFF */  addiu      $a2, $a2, -1
/* A9EA8 800A92A8 A0620000 */  sb         $v0, ($v1)
/* A9EAC 800A92AC 14C0FFFB */  bnez       $a2, .L800A929C
/* A9EB0 800A92B0 24630001 */   addiu     $v1, $v1, 1
/* A9EB4 800A92B4 03E00008 */  jr         $ra
/* A9EB8 800A92B8 00801021 */   addu      $v0, $a0, $zero

glabel func_800A92BC
/* A9EBC 800A92BC 10C00003 */  beqz       $a2, .L800A92CC
/* A9EC0 800A92C0 00801821 */   addu      $v1, $a0, $zero
/* A9EC4 800A92C4 14850003 */  bne        $a0, $a1, .L800A92D4
/* A9EC8 800A92C8 0085102B */   sltu      $v0, $a0, $a1
.L800A92CC:
/* A9ECC 800A92CC 03E00008 */  jr         $ra
/* A9ED0 800A92D0 00801021 */   addu      $v0, $a0, $zero
.L800A92D4:
/* A9ED4 800A92D4 50400009 */  beql       $v0, $zero, .L800A92FC
/* A9ED8 800A92D8 00861821 */   addu      $v1, $a0, $a2
.L800A92DC:
/* A9EDC 800A92DC 90A20000 */  lbu        $v0, ($a1)
/* A9EE0 800A92E0 24A50001 */  addiu      $a1, $a1, 1
/* A9EE4 800A92E4 24C6FFFF */  addiu      $a2, $a2, -1
/* A9EE8 800A92E8 A0620000 */  sb         $v0, ($v1)
/* A9EEC 800A92EC 14C0FFFB */  bnez       $a2, .L800A92DC
/* A9EF0 800A92F0 24630001 */   addiu     $v1, $v1, 1
/* A9EF4 800A92F4 03E00008 */  jr         $ra
/* A9EF8 800A92F8 00801021 */   addu      $v0, $a0, $zero
.L800A92FC:
/* A9EFC 800A92FC 00A62821 */  addu       $a1, $a1, $a2
.L800A9300:
/* A9F00 800A9300 2463FFFF */  addiu      $v1, $v1, -1
/* A9F04 800A9304 24A5FFFF */  addiu      $a1, $a1, -1
/* A9F08 800A9308 90A20000 */  lbu        $v0, ($a1)
/* A9F0C 800A930C 24C6FFFF */  addiu      $a2, $a2, -1
/* A9F10 800A9310 14C0FFFB */  bnez       $a2, .L800A9300
/* A9F14 800A9314 A0620000 */   sb        $v0, ($v1)
/* A9F18 800A9318 00801021 */  addu       $v0, $a0, $zero
/* A9F1C 800A931C 03E00008 */  jr         $ra
/* A9F20 800A9320 00000000 */   nop

glabel ofunc_sub_800a9324
/* A9F24 800A9324 00801021 */  addu       $v0, $a0, $zero
/* A9F28 800A9328 10C00005 */  beqz       $a2, .L800A9340
/* A9F2C 800A932C 00401821 */   addu      $v1, $v0, $zero
.L800A9330:
/* A9F30 800A9330 A0650000 */  sb         $a1, ($v1)
/* A9F34 800A9334 24C6FFFF */  addiu      $a2, $a2, -1
/* A9F38 800A9338 14C0FFFD */  bnez       $a2, .L800A9330
/* A9F3C 800A933C 24630001 */   addiu     $v1, $v1, 1
.L800A9340:
/* A9F40 800A9340 03E00008 */  jr         $ra
/* A9F44 800A9344 00000000 */   nop

glabel ret1
/* A9F48 800A9348 03E00008 */  jr         $ra
/* A9F4C 800A934C 24020001 */   addiu     $v0, $zero, 1

glabel ret1_800A9350
/* A9F50 800A9350 03E00008 */  jr         $ra
/* A9F54 800A9354 24020001 */   addiu     $v0, $zero, 1

glabel ofunc_sub_800a9358
/* A9F58 800A9358 27BDFF50 */  addiu      $sp, $sp, -0xb0
/* A9F5C 800A935C AFB400A8 */  sw         $s4, 0xa8($sp)
/* A9F60 800A9360 27B40050 */  addiu      $s4, $sp, 0x50
/* A9F64 800A9364 AFB200A0 */  sw         $s2, 0xa0($sp)
/* A9F68 800A9368 27B20010 */  addiu      $s2, $sp, 0x10
/* A9F6C 800A936C AFB300A4 */  sw         $s3, 0xa4($sp)
/* A9F70 800A9370 27B30090 */  addiu      $s3, $sp, 0x90
/* A9F74 800A9374 2403000F */  addiu      $v1, $zero, 0xf
/* A9F78 800A9378 27A2005F */  addiu      $v0, $sp, 0x5f
/* A9F7C 800A937C AFBF00AC */  sw         $ra, 0xac($sp)
/* A9F80 800A9380 AFB1009C */  sw         $s1, 0x9c($sp)
/* A9F84 800A9384 AFB00098 */  sw         $s0, 0x98($sp)
.L800A9388:
/* A9F88 800A9388 A0430000 */  sb         $v1, ($v0)
/* A9F8C 800A938C 2463FFFF */  addiu      $v1, $v1, -1
/* A9F90 800A9390 0461FFFD */  bgez       $v1, .L800A9388
/* A9F94 800A9394 2442FFFF */   addiu     $v0, $v0, -1
/* A9F98 800A9398 27A40010 */  addiu      $a0, $sp, 0x10
/* A9F9C 800A939C 0C02A3FE */  jal        ofunc_sub_800a8ff8
/* A9FA0 800A93A0 24050004 */   addiu     $a1, $zero, 4
/* A9FA4 800A93A4 02428821 */  addu       $s1, $s2, $v0
/* A9FA8 800A93A8 02321023 */  subu       $v0, $s1, $s2
/* A9FAC 800A93AC 04410002 */  bgez       $v0, .L800A93B8
/* A9FB0 800A93B0 24100001 */   addiu     $s0, $zero, 1
/* A9FB4 800A93B4 00008021 */  addu       $s0, $zero, $zero
.L800A93B8:
/* A9FB8 800A93B8 28420004 */  slti       $v0, $v0, 4
/* A9FBC 800A93BC 14400002 */  bnez       $v0, .L800A93C8
/* A9FC0 800A93C0 32100001 */   andi      $s0, $s0, 1
/* A9FC4 800A93C4 00008021 */  addu       $s0, $zero, $zero
.L800A93C8:
/* A9FC8 800A93C8 02602021 */  addu       $a0, $s3, $zero
/* A9FCC 800A93CC 240500FF */  addiu      $a1, $zero, 0xff
/* A9FD0 800A93D0 0C02A4C9 */  jal        ofunc_sub_800a9324
/* A9FD4 800A93D4 24060004 */   addiu     $a2, $zero, 4
/* A9FD8 800A93D8 97A30090 */  lhu        $v1, 0x90($sp)
/* A9FDC 800A93DC 3402FFFF */  ori        $v0, $zero, 0xffff
/* A9FE0 800A93E0 10620002 */  beq        $v1, $v0, .L800A93EC
/* A9FE4 800A93E4 32100001 */   andi      $s0, $s0, 1
/* A9FE8 800A93E8 00008021 */  addu       $s0, $zero, $zero
.L800A93EC:
/* A9FEC 800A93EC 8FA20090 */  lw         $v0, 0x90($sp)
/* A9FF0 800A93F0 2403FFFF */  addiu      $v1, $zero, -1
/* A9FF4 800A93F4 10430002 */  beq        $v0, $v1, .L800A9400
/* A9FF8 800A93F8 32100001 */   andi      $s0, $s0, 1
/* A9FFC 800A93FC 00008021 */  addu       $s0, $zero, $zero
.L800A9400:
/* AA000 800A9400 10430002 */  beq        $v0, $v1, .L800A940C
/* AA004 800A9404 32100001 */   andi      $s0, $s0, 1
/* AA008 800A9408 00008021 */  addu       $s0, $zero, $zero
.L800A940C:
/* AA00C 800A940C 10430002 */  beq        $v0, $v1, .L800A9418
/* AA010 800A9410 32100001 */   andi      $s0, $s0, 1
/* AA014 800A9414 00008021 */  addu       $s0, $zero, $zero
.L800A9418:
/* AA018 800A9418 24020001 */  addiu      $v0, $zero, 1
/* AA01C 800A941C 1602000C */  bne        $s0, $v0, .L800A9450
/* AA020 800A9420 02602021 */   addu      $a0, $s3, $zero
/* AA024 800A9424 02202021 */  addu       $a0, $s1, $zero
/* AA028 800A9428 02201021 */  addu       $v0, $s1, $zero
/* AA02C 800A942C 24030007 */  addiu      $v1, $zero, 7
.L800A9430:
/* AA030 800A9430 10440002 */  beq        $v0, $a0, .L800A943C
/* AA034 800A9434 32100001 */   andi      $s0, $s0, 1
/* AA038 800A9438 00008021 */  addu       $s0, $zero, $zero
.L800A943C:
/* AA03C 800A943C 24840004 */  addiu      $a0, $a0, 4
/* AA040 800A9440 2463FFFF */  addiu      $v1, $v1, -1
/* AA044 800A9444 0461FFFA */  bgez       $v1, .L800A9430
/* AA048 800A9448 24420004 */   addiu     $v0, $v0, 4
/* AA04C 800A944C 02602021 */  addu       $a0, $s3, $zero
.L800A9450:
/* AA050 800A9450 00002821 */  addu       $a1, $zero, $zero
/* AA054 800A9454 0C02A4C9 */  jal        ofunc_sub_800a9324
/* AA058 800A9458 24060004 */   addiu     $a2, $zero, 4
/* AA05C 800A945C 8FA20090 */  lw         $v0, 0x90($sp)
/* AA060 800A9460 10400002 */  beqz       $v0, .L800A946C
/* AA064 800A9464 32100001 */   andi      $s0, $s0, 1
/* AA068 800A9468 00008021 */  addu       $s0, $zero, $zero
.L800A946C:
/* AA06C 800A946C 10400002 */  beqz       $v0, .L800A9478
/* AA070 800A9470 32100001 */   andi      $s0, $s0, 1
/* AA074 800A9474 00008021 */  addu       $s0, $zero, $zero
.L800A9478:
/* AA078 800A9478 32100001 */  andi       $s0, $s0, 1
/* AA07C 800A947C 24020001 */  addiu      $v0, $zero, 1
/* AA080 800A9480 56020043 */  bnel       $s0, $v0, .L800A9590
/* AA084 800A9484 02001021 */   addu      $v0, $s0, $zero
/* AA088 800A9488 26240004 */  addiu      $a0, $s1, 4
/* AA08C 800A948C 24030009 */  addiu      $v1, $zero, 9
/* AA090 800A9490 26220024 */  addiu      $v0, $s1, 0x24
.L800A9494:
/* AA094 800A9494 AC510000 */  sw         $s1, ($v0)
/* AA098 800A9498 2463FFFF */  addiu      $v1, $v1, -1
/* AA09C 800A949C 0461FFFD */  bgez       $v1, .L800A9494
/* AA0A0 800A94A0 2442FFFC */   addiu     $v0, $v0, -4
/* AA0A4 800A94A4 00002821 */  addu       $a1, $zero, $zero
/* AA0A8 800A94A8 0C02A4C9 */  jal        ofunc_sub_800a9324
/* AA0AC 800A94AC 24060020 */   addiu     $a2, $zero, 0x20
/* AA0B0 800A94B0 8E230000 */  lw         $v1, ($s1)
/* AA0B4 800A94B4 10710002 */  beq        $v1, $s1, .L800A94C0
/* AA0B8 800A94B8 32100001 */   andi      $s0, $s0, 1
/* AA0BC 800A94BC 00008021 */  addu       $s0, $zero, $zero
.L800A94C0:
/* AA0C0 800A94C0 8E250024 */  lw         $a1, 0x24($s1)
/* AA0C4 800A94C4 26240004 */  addiu      $a0, $s1, 4
/* AA0C8 800A94C8 24030007 */  addiu      $v1, $zero, 7
.L800A94CC:
/* AA0CC 800A94CC 8C820000 */  lw         $v0, ($a0)
/* AA0D0 800A94D0 10400002 */  beqz       $v0, .L800A94DC
/* AA0D4 800A94D4 32100001 */   andi      $s0, $s0, 1
/* AA0D8 800A94D8 00008021 */  addu       $s0, $zero, $zero
.L800A94DC:
/* AA0DC 800A94DC 2463FFFF */  addiu      $v1, $v1, -1
/* AA0E0 800A94E0 0461FFFA */  bgez       $v1, .L800A94CC
/* AA0E4 800A94E4 24840004 */   addiu     $a0, $a0, 4
/* AA0E8 800A94E8 10B10002 */  beq        $a1, $s1, .L800A94F4
/* AA0EC 800A94EC 32100001 */   andi      $s0, $s0, 1
/* AA0F0 800A94F0 00008021 */  addu       $s0, $zero, $zero
.L800A94F4:
/* AA0F4 800A94F4 24120001 */  addiu      $s2, $zero, 1
/* AA0F8 800A94F8 16120025 */  bne        $s0, $s2, .L800A9590
/* AA0FC 800A94FC 02001021 */   addu      $v0, $s0, $zero
/* AA100 800A9500 27B10051 */  addiu      $s1, $sp, 0x51
/* AA104 800A9504 02202021 */  addu       $a0, $s1, $zero
/* AA108 800A9508 0C02A3FE */  jal        ofunc_sub_800a8ff8
/* AA10C 800A950C 24050004 */   addiu     $a1, $zero, 4
/* AA110 800A9510 24440001 */  addiu      $a0, $v0, 1
/* AA114 800A9514 02841821 */  addu       $v1, $s4, $a0
/* AA118 800A9518 30620003 */  andi       $v0, $v1, 3
/* AA11C 800A951C 54400001 */  bnel       $v0, $zero, .L800A9524
/* AA120 800A9520 00008021 */   addu      $s0, $zero, $zero
.L800A9524:
/* AA124 800A9524 14800002 */  bnez       $a0, .L800A9530
/* AA128 800A9528 32100001 */   andi      $s0, $s0, 1
/* AA12C 800A952C 00008021 */  addu       $s0, $zero, $zero
.L800A9530:
/* AA130 800A9530 0071102B */  sltu       $v0, $v1, $s1
/* AA134 800A9534 10400002 */  beqz       $v0, .L800A9540
/* AA138 800A9538 32100001 */   andi      $s0, $s0, 1
/* AA13C 800A953C 00008021 */  addu       $s0, $zero, $zero
.L800A9540:
/* AA140 800A9540 2C820005 */  sltiu      $v0, $a0, 5
/* AA144 800A9544 14400002 */  bnez       $v0, .L800A9550
/* AA148 800A9548 32100001 */   andi      $s0, $s0, 1
/* AA14C 800A954C 00008021 */  addu       $s0, $zero, $zero
.L800A9550:
/* AA150 800A9550 27A20055 */  addiu      $v0, $sp, 0x55
/* AA154 800A9554 0062102B */  sltu       $v0, $v1, $v0
/* AA158 800A9558 14400002 */  bnez       $v0, .L800A9564
/* AA15C 800A955C 32100001 */   andi      $s0, $s0, 1
/* AA160 800A9560 00008021 */  addu       $s0, $zero, $zero
.L800A9564:
/* AA164 800A9564 5612000A */  bnel       $s0, $s2, .L800A9590
/* AA168 800A9568 02001021 */   addu      $v0, $s0, $zero
/* AA16C 800A956C 03A41021 */  addu       $v0, $sp, $a0
/* AA170 800A9570 8C630000 */  lw         $v1, ($v1)
/* AA174 800A9574 14600002 */  bnez       $v1, .L800A9580
/* AA178 800A9578 8C420054 */   lw        $v0, 0x54($v0)
/* AA17C 800A957C 00008021 */  addu       $s0, $zero, $zero
.L800A9580:
/* AA180 800A9580 14400002 */  bnez       $v0, .L800A958C
/* AA184 800A9584 32100001 */   andi      $s0, $s0, 1
/* AA188 800A9588 00008021 */  addu       $s0, $zero, $zero
.L800A958C:
/* AA18C 800A958C 02001021 */  addu       $v0, $s0, $zero
.L800A9590:
/* AA190 800A9590 8FBF00AC */  lw         $ra, 0xac($sp)
/* AA194 800A9594 8FB400A8 */  lw         $s4, 0xa8($sp)
/* AA198 800A9598 8FB300A4 */  lw         $s3, 0xa4($sp)
/* AA19C 800A959C 8FB200A0 */  lw         $s2, 0xa0($sp)
/* AA1A0 800A95A0 8FB1009C */  lw         $s1, 0x9c($sp)
/* AA1A4 800A95A4 8FB00098 */  lw         $s0, 0x98($sp)
/* AA1A8 800A95A8 03E00008 */  jr         $ra
/* AA1AC 800A95AC 27BD00B0 */   addiu     $sp, $sp, 0xb0

glabel ofunc_sub_800a95b0
/* AA1B0 800A95B0 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* AA1B4 800A95B4 AFBF0058 */  sw         $ra, 0x58($sp)
/* AA1B8 800A95B8 AFB10054 */  sw         $s1, 0x54($sp)
/* AA1BC 800A95BC 0C02A4D2 */  jal        ret1
/* AA1C0 800A95C0 AFB00050 */   sw        $s0, 0x50($sp)
/* AA1C4 800A95C4 0C02A4D4 */  jal        ret1_800A9350
/* AA1C8 800A95C8 30500001 */   andi      $s0, $v0, 1
/* AA1CC 800A95CC 02028024 */  and        $s0, $s0, $v0
/* AA1D0 800A95D0 24020001 */  addiu      $v0, $zero, 1
/* AA1D4 800A95D4 12020003 */  beq        $s0, $v0, .L800A95E4
/* AA1D8 800A95D8 24110001 */   addiu     $s1, $zero, 1
/* AA1DC 800A95DC 0802A5A7 */  j          .L800A969C
/* AA1E0 800A95E0 2402FFFF */   addiu     $v0, $zero, -1
.L800A95E4:
/* AA1E4 800A95E4 2403000F */  addiu      $v1, $zero, 0xf
/* AA1E8 800A95E8 27A2001F */  addiu      $v0, $sp, 0x1f
.L800A95EC:
/* AA1EC 800A95EC A0430000 */  sb         $v1, ($v0)
/* AA1F0 800A95F0 2463FFFF */  addiu      $v1, $v1, -1
/* AA1F4 800A95F4 0461FFFD */  bgez       $v1, .L800A95EC
/* AA1F8 800A95F8 2442FFFF */   addiu     $v0, $v0, -1
/* AA1FC 800A95FC 02208021 */  addu       $s0, $s1, $zero
/* AA200 800A9600 24020001 */  addiu      $v0, $zero, 1
/* AA204 800A9604 16020021 */  bne        $s0, $v0, .L800A968C
/* AA208 800A9608 00000000 */   nop
/* AA20C 800A960C 0C02A5AC */  jal        ret_some_bool
/* AA210 800A9610 00000000 */   nop
/* AA214 800A9614 54400001 */  bnel       $v0, $zero, .L800A961C
/* AA218 800A9618 00008021 */   addu      $s0, $zero, $zero
.L800A961C:
/* AA21C 800A961C 1611001B */  bne        $s0, $s1, .L800A968C
/* AA220 800A9620 24020001 */   addiu     $v0, $zero, 1
/* AA224 800A9624 00001821 */  addu       $v1, $zero, $zero
/* AA228 800A9628 02008821 */  addu       $s1, $s0, $zero
/* AA22C 800A962C 3C02800F */  lui        $v0, %hi(D_800F3590)
/* AA230 800A9630 8C423590 */  lw         $v0, %lo(D_800F3590)($v0)
/* AA234 800A9634 10400009 */  beqz       $v0, .L800A965C
/* AA238 800A9638 3C04800F */   lui       $a0, %hi(D_800F5650)
/* AA23C 800A963C 00403021 */  addu       $a2, $v0, $zero
/* AA240 800A9640 24855650 */  addiu      $a1, $a0, %lo(D_800F5650)
.L800A9644:
/* AA244 800A9644 2462FFFD */  addiu      $v0, $v1, -3
/* AA248 800A9648 ACA20000 */  sw         $v0, ($a1)
/* AA24C 800A964C 24630001 */  addiu      $v1, $v1, 1
/* AA250 800A9650 0066102B */  sltu       $v0, $v1, $a2
/* AA254 800A9654 1440FFFB */  bnez       $v0, .L800A9644
/* AA258 800A9658 24A50004 */   addiu     $a1, $a1, 4
.L800A965C:
/* AA25C 800A965C 0C02A5B8 */  jal        ofunc_sub_800a96e0
/* AA260 800A9660 24845650 */   addiu     $a0, $a0, 0x5650
/* AA264 800A9664 10400002 */  beqz       $v0, .L800A9670
/* AA268 800A9668 02208021 */   addu      $s0, $s1, $zero
/* AA26C 800A966C 00008021 */  addu       $s0, $zero, $zero
.L800A9670:
/* AA270 800A9670 24020001 */  addiu      $v0, $zero, 1
/* AA274 800A9674 16020005 */  bne        $s0, $v0, .L800A968C
/* AA278 800A9678 00000000 */   nop
/* AA27C 800A967C 0C02A4D6 */  jal        ofunc_sub_800a9358
/* AA280 800A9680 00000000 */   nop
/* AA284 800A9684 30500001 */  andi       $s0, $v0, 1
/* AA288 800A9688 24020001 */  addiu      $v0, $zero, 1
.L800A968C:
/* AA28C 800A968C 12020002 */  beq        $s0, $v0, .L800A9698
/* AA290 800A9690 00001821 */   addu      $v1, $zero, $zero
/* AA294 800A9694 2403FFFF */  addiu      $v1, $zero, -1
.L800A9698:
/* AA298 800A9698 00601021 */  addu       $v0, $v1, $zero
.L800A969C:
/* AA29C 800A969C 8FBF0058 */  lw         $ra, 0x58($sp)
/* AA2A0 800A96A0 8FB10054 */  lw         $s1, 0x54($sp)
/* AA2A4 800A96A4 8FB00050 */  lw         $s0, 0x50($sp)
/* AA2A8 800A96A8 03E00008 */  jr         $ra
/* AA2AC 800A96AC 27BD0060 */   addiu     $sp, $sp, 0x60

glabel ret_some_bool
/* AA2B0 800A96B0 3C03800E */  lui        $v1, %hi(D_800E364C)
/* AA2B4 800A96B4 2464364C */  addiu      $a0, $v1, %lo(D_800E364C)
/* AA2B8 800A96B8 8C62364C */  lw         $v0, 0x364c($v1)
/* AA2BC 800A96BC 8C850004 */  lw         $a1, 4($a0)
/* AA2C0 800A96C0 8C830008 */  lw         $v1, 8($a0)
/* AA2C4 800A96C4 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* AA2C8 800A96C8 AFA20000 */  sw         $v0, ($sp)
/* AA2CC 800A96CC 2C420001 */  sltiu      $v0, $v0, 1
/* AA2D0 800A96D0 AFA50004 */  sw         $a1, 4($sp)
/* AA2D4 800A96D4 AFA30008 */  sw         $v1, 8($sp)
/* AA2D8 800A96D8 03E00008 */  jr         $ra
/* AA2DC 800A96DC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel ofunc_sub_800a96e0
/* AA2E0 800A96E0 8C830000 */  lw         $v1, ($a0)
/* AA2E4 800A96E4 2402FFFD */  addiu      $v0, $zero, -3
/* AA2E8 800A96E8 14620009 */  bne        $v1, $v0, .L800A9710
/* AA2EC 800A96EC 00002821 */   addu      $a1, $zero, $zero
/* AA2F0 800A96F0 8C830004 */  lw         $v1, 4($a0)
/* AA2F4 800A96F4 2402FFFE */  addiu      $v0, $zero, -2
/* AA2F8 800A96F8 54620006 */  bnel       $v1, $v0, .L800A9714
/* AA2FC 800A96FC 24050001 */   addiu     $a1, $zero, 1
/* AA300 800A9700 8C830008 */  lw         $v1, 8($a0)
/* AA304 800A9704 2402FFFF */  addiu      $v0, $zero, -1
/* AA308 800A9708 10620002 */  beq        $v1, $v0, .L800A9714
/* AA30C 800A970C 00000000 */   nop
.L800A9710:
/* AA310 800A9710 24050001 */  addiu      $a1, $zero, 1
.L800A9714:
/* AA314 800A9714 03E00008 */  jr         $ra
/* AA318 800A9718 00A01021 */   addu      $v0, $a1, $zero

glabel func_800A971C
/* AA31C 800A971C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* AA320 800A9720 3C03800F */  lui        $v1, 0x800f
/* AA324 800A9724 8FA80028 */  lw         $t0, 0x28($sp)
/* AA328 800A9728 8FA9002C */  lw         $t1, 0x2c($sp)
/* AA32C 800A972C 8FAA0030 */  lw         $t2, 0x30($sp)
/* AA330 800A9730 8FAB0034 */  lw         $t3, 0x34($sp)
/* AA334 800A9734 8FAC0038 */  lw         $t4, 0x38($sp)
/* AA338 800A9738 8FAD003C */  lw         $t5, 0x3c($sp)
/* AA33C 800A973C 24020001 */  addiu      $v0, $zero, 1
/* AA340 800A9740 AFBF0010 */  sw         $ra, 0x10($sp)
/* AA344 800A9744 10800031 */  beqz       $a0, .L800A980C
/* AA348 800A9748 AC623594 */   sw        $v0, 0x3594($v1)
/* AA34C 800A974C 2403FFFF */  addiu      $v1, $zero, -1
/* AA350 800A9750 10A30004 */  beq        $a1, $v1, .L800A9764
/* AA354 800A9754 00002021 */   addu      $a0, $zero, $zero
/* AA358 800A9758 24020002 */  addiu      $v0, $zero, 2
/* AA35C 800A975C 14A20022 */  bne        $a1, $v0, .L800A97E8
/* AA360 800A9760 00000000 */   nop
.L800A9764:
/* AA364 800A9764 10C30003 */  beq        $a2, $v1, .L800A9774
/* AA368 800A9768 24020004 */   addiu     $v0, $zero, 4
/* AA36C 800A976C 14C2001E */  bne        $a2, $v0, .L800A97E8
/* AA370 800A9770 00000000 */   nop
.L800A9774:
/* AA374 800A9774 10E30003 */  beq        $a3, $v1, .L800A9784
/* AA378 800A9778 24020004 */   addiu     $v0, $zero, 4
/* AA37C 800A977C 14E2001A */  bne        $a3, $v0, .L800A97E8
/* AA380 800A9780 00000000 */   nop
.L800A9784:
/* AA384 800A9784 11030003 */  beq        $t0, $v1, .L800A9794
/* AA388 800A9788 24020004 */   addiu     $v0, $zero, 4
/* AA38C 800A978C 15020016 */  bne        $t0, $v0, .L800A97E8
/* AA390 800A9790 00000000 */   nop
.L800A9794:
/* AA394 800A9794 11230003 */  beq        $t1, $v1, .L800A97A4
/* AA398 800A9798 24020004 */   addiu     $v0, $zero, 4
/* AA39C 800A979C 15220012 */  bne        $t1, $v0, .L800A97E8
/* AA3A0 800A97A0 00000000 */   nop
.L800A97A4:
/* AA3A4 800A97A4 11430003 */  beq        $t2, $v1, .L800A97B4
/* AA3A8 800A97A8 24020004 */   addiu     $v0, $zero, 4
/* AA3AC 800A97AC 1542000E */  bne        $t2, $v0, .L800A97E8
/* AA3B0 800A97B0 00000000 */   nop
.L800A97B4:
/* AA3B4 800A97B4 11630003 */  beq        $t3, $v1, .L800A97C4
/* AA3B8 800A97B8 24020004 */   addiu     $v0, $zero, 4
/* AA3BC 800A97BC 1562000A */  bne        $t3, $v0, .L800A97E8
/* AA3C0 800A97C0 00000000 */   nop
.L800A97C4:
/* AA3C4 800A97C4 11830003 */  beq        $t4, $v1, .L800A97D4
/* AA3C8 800A97C8 24020004 */   addiu     $v0, $zero, 4
/* AA3CC 800A97CC 15820006 */  bne        $t4, $v0, .L800A97E8
/* AA3D0 800A97D0 00000000 */   nop
.L800A97D4:
/* AA3D4 800A97D4 11A30003 */  beq        $t5, $v1, .L800A97E4
/* AA3D8 800A97D8 24020004 */   addiu     $v0, $zero, 4
/* AA3DC 800A97DC 15A20002 */  bne        $t5, $v0, .L800A97E8
/* AA3E0 800A97E0 00000000 */   nop
.L800A97E4:
/* AA3E4 800A97E4 24040001 */  addiu      $a0, $zero, 1
.L800A97E8:
/* AA3E8 800A97E8 10800009 */  beqz       $a0, .L800A9810
/* AA3EC 800A97EC 2402FFFF */   addiu     $v0, $zero, -1
/* AA3F0 800A97F0 0C02A56C */  jal        ofunc_sub_800a95b0
/* AA3F4 800A97F4 00000000 */   nop
/* AA3F8 800A97F8 00402021 */  addu       $a0, $v0, $zero
/* AA3FC 800A97FC 50800004 */  beql       $a0, $zero, .L800A9810
/* AA400 800A9800 00001021 */   addu      $v0, $zero, $zero
/* AA404 800A9804 0802A605 */  j          .L800A9814
/* AA408 800A9808 8FBF0010 */   lw        $ra, 0x10($sp)
.L800A980C:
/* AA40C 800A980C 2402FFFF */  addiu      $v0, $zero, -1
.L800A9810:
/* AA410 800A9810 8FBF0010 */  lw         $ra, 0x10($sp)
.L800A9814:
/* AA414 800A9814 03E00008 */  jr         $ra
/* AA418 800A9818 27BD0018 */   addiu     $sp, $sp, 0x18

glabel ofunc_sub_800a981c
/* AA41C 800A981C 27BDFFF8 */  addiu      $sp, $sp, -8
/* AA420 800A9820 AFB10004 */  sw         $s1, 4($sp)
/* AA424 800A9824 00C08821 */  addu       $s1, $a2, $zero
/* AA428 800A9828 02204021 */  addu       $t0, $s1, $zero
/* AA42C 800A982C AFB00000 */  sw         $s0, ($sp)
/* AA430 800A9830 00808021 */  addu       $s0, $a0, $zero
/* AA434 800A9834 02006821 */  addu       $t5, $s0, $zero
/* AA438 800A9838 25A90004 */  addiu      $t1, $t5, 4
/* AA43C 800A983C 0205C021 */  addu       $t8, $s0, $a1
/* AA440 800A9840 8FB90018 */  lw         $t9, 0x18($sp)
/* AA444 800A9844 0802A6A2 */  j          .L800A9A88
/* AA448 800A9848 2706FFF3 */   addiu     $a2, $t8, -0xd
.L800A984C:
/* AA44C 800A984C 00591021 */  addu       $v0, $v0, $t9
/* AA450 800A9850 AC490000 */  sw         $t1, ($v0)
/* AA454 800A9854 012D1823 */  subu       $v1, $t1, $t5
/* AA458 800A9858 1860001C */  blez       $v1, .L800A98CC
/* AA45C 800A985C 25290003 */   addiu     $t1, $t1, 3
/* AA460 800A9860 2C620004 */  sltiu      $v0, $v1, 4
/* AA464 800A9864 10400005 */  beqz       $v0, .L800A987C
/* AA468 800A9868 00602021 */   addu      $a0, $v1, $zero
/* AA46C 800A986C 9102FFFE */  lbu        $v0, -2($t0)
/* AA470 800A9870 00431025 */  or         $v0, $v0, $v1
/* AA474 800A9874 0802A62D */  j          .L800A98B4
/* AA478 800A9878 A102FFFE */   sb        $v0, -2($t0)
.L800A987C:
/* AA47C 800A987C 2C620013 */  sltiu      $v0, $v1, 0x13
/* AA480 800A9880 10400003 */  beqz       $v0, .L800A9890
/* AA484 800A9884 2462FFFD */   addiu     $v0, $v1, -3
/* AA488 800A9888 0802A62C */  j          .L800A98B0
/* AA48C 800A988C A1020000 */   sb        $v0, ($t0)
.L800A9890:
/* AA490 800A9890 0802A627 */  j          .L800A989C
/* AA494 800A9894 2463FFEE */   addiu     $v1, $v1, -0x12
.L800A9898:
/* AA498 800A9898 2463FF01 */  addiu      $v1, $v1, -0xff
.L800A989C:
/* AA49C 800A989C A1000000 */  sb         $zero, ($t0)
/* AA4A0 800A98A0 2C620100 */  sltiu      $v0, $v1, 0x100
/* AA4A4 800A98A4 1040FFFC */  beqz       $v0, .L800A9898
/* AA4A8 800A98A8 25080001 */   addiu     $t0, $t0, 1
/* AA4AC 800A98AC A1030000 */  sb         $v1, ($t0)
.L800A98B0:
/* AA4B0 800A98B0 25080001 */  addiu      $t0, $t0, 1
.L800A98B4:
/* AA4B4 800A98B4 91A20000 */  lbu        $v0, ($t5)
/* AA4B8 800A98B8 25AD0001 */  addiu      $t5, $t5, 1
/* AA4BC 800A98BC 2484FFFF */  addiu      $a0, $a0, -1
/* AA4C0 800A98C0 A1020000 */  sb         $v0, ($t0)
/* AA4C4 800A98C4 1480FFFB */  bnez       $a0, .L800A98B4
/* AA4C8 800A98C8 25080001 */   addiu     $t0, $t0, 1
.L800A98CC:
/* AA4CC 800A98CC 90A30003 */  lbu        $v1, 3($a1)
/* AA4D0 800A98D0 91220000 */  lbu        $v0, ($t1)
/* AA4D4 800A98D4 14620015 */  bne        $v1, $v0, .L800A992C
/* AA4D8 800A98D8 25290001 */   addiu     $t1, $t1, 1
/* AA4DC 800A98DC 90A30004 */  lbu        $v1, 4($a1)
/* AA4E0 800A98E0 91220000 */  lbu        $v0, ($t1)
/* AA4E4 800A98E4 14620011 */  bne        $v1, $v0, .L800A992C
/* AA4E8 800A98E8 25290001 */   addiu     $t1, $t1, 1
/* AA4EC 800A98EC 90A30005 */  lbu        $v1, 5($a1)
/* AA4F0 800A98F0 91220000 */  lbu        $v0, ($t1)
/* AA4F4 800A98F4 1462000D */  bne        $v1, $v0, .L800A992C
/* AA4F8 800A98F8 25290001 */   addiu     $t1, $t1, 1
/* AA4FC 800A98FC 90A30006 */  lbu        $v1, 6($a1)
/* AA500 800A9900 91220000 */  lbu        $v0, ($t1)
/* AA504 800A9904 14620009 */  bne        $v1, $v0, .L800A992C
/* AA508 800A9908 25290001 */   addiu     $t1, $t1, 1
/* AA50C 800A990C 90A30007 */  lbu        $v1, 7($a1)
/* AA510 800A9910 91220000 */  lbu        $v0, ($t1)
/* AA514 800A9914 14620005 */  bne        $v1, $v0, .L800A992C
/* AA518 800A9918 25290001 */   addiu     $t1, $t1, 1
/* AA51C 800A991C 90A30008 */  lbu        $v1, 8($a1)
/* AA520 800A9920 91220000 */  lbu        $v0, ($t1)
/* AA524 800A9924 1062001C */  beq        $v1, $v0, .L800A9998
/* AA528 800A9928 25290001 */   addiu     $t1, $t1, 1
.L800A992C:
/* AA52C 800A992C 2529FFFF */  addiu      $t1, $t1, -1
/* AA530 800A9930 11E0000B */  beqz       $t7, .L800A9960
/* AA534 800A9934 012D2023 */   subu      $a0, $t1, $t5
/* AA538 800A9938 254AFFFF */  addiu      $t2, $t2, -1
/* AA53C 800A993C 2482FFFF */  addiu      $v0, $a0, -1
/* AA540 800A9940 00021140 */  sll        $v0, $v0, 5
/* AA544 800A9944 31430007 */  andi       $v1, $t2, 7
/* AA548 800A9948 00031880 */  sll        $v1, $v1, 2
/* AA54C 800A994C 00431025 */  or         $v0, $v0, $v1
/* AA550 800A9950 A1020000 */  sb         $v0, ($t0)
/* AA554 800A9954 25080001 */  addiu      $t0, $t0, 1
/* AA558 800A9958 0802A69D */  j          .L800A9A74
/* AA55C 800A995C 000A10C2 */   srl       $v0, $t2, 3
.L800A9960:
/* AA560 800A9960 2D424001 */  sltiu      $v0, $t2, 0x4001
/* AA564 800A9964 10400005 */  beqz       $v0, .L800A997C
/* AA568 800A9968 2482FFFE */   addiu     $v0, $a0, -2
/* AA56C 800A996C 254AFFFF */  addiu      $t2, $t2, -1
/* AA570 800A9970 34420020 */  ori        $v0, $v0, 0x20
/* AA574 800A9974 0802A698 */  j          .L800A9A60
/* AA578 800A9978 A1020000 */   sb        $v0, ($t0)
.L800A997C:
/* AA57C 800A997C 254AC000 */  addiu      $t2, $t2, -0x4000
/* AA580 800A9980 31434000 */  andi       $v1, $t2, 0x4000
/* AA584 800A9984 00031AC2 */  srl        $v1, $v1, 0xb
/* AA588 800A9988 34420010 */  ori        $v0, $v0, 0x10
/* AA58C 800A998C 00621825 */  or         $v1, $v1, $v0
/* AA590 800A9990 0802A698 */  j          .L800A9A60
/* AA594 800A9994 A1030000 */   sb        $v1, ($t0)
.L800A9998:
/* AA598 800A9998 24A40009 */  addiu      $a0, $a1, 9
/* AA59C 800A999C 0138102B */  sltu       $v0, $t1, $t8
/* AA5A0 800A99A0 1040000D */  beqz       $v0, .L800A99D8
/* AA5A4 800A99A4 2D4B4001 */   sltiu     $t3, $t2, 0x4001
/* AA5A8 800A99A8 90A30009 */  lbu        $v1, 9($a1)
/* AA5AC 800A99AC 91220000 */  lbu        $v0, ($t1)
/* AA5B0 800A99B0 14620009 */  bne        $v1, $v0, .L800A99D8
/* AA5B4 800A99B4 00000000 */   nop
/* AA5B8 800A99B8 25290001 */  addiu      $t1, $t1, 1
.L800A99BC:
/* AA5BC 800A99BC 0138102B */  sltu       $v0, $t1, $t8
/* AA5C0 800A99C0 10400005 */  beqz       $v0, .L800A99D8
/* AA5C4 800A99C4 24840001 */   addiu     $a0, $a0, 1
/* AA5C8 800A99C8 90830000 */  lbu        $v1, ($a0)
/* AA5CC 800A99CC 91220000 */  lbu        $v0, ($t1)
/* AA5D0 800A99D0 5062FFFA */  beql       $v1, $v0, .L800A99BC
/* AA5D4 800A99D4 25290001 */   addiu     $t1, $t1, 1
.L800A99D8:
/* AA5D8 800A99D8 1160000B */  beqz       $t3, .L800A9A08
/* AA5DC 800A99DC 012D2023 */   subu      $a0, $t1, $t5
/* AA5E0 800A99E0 2C820022 */  sltiu      $v0, $a0, 0x22
/* AA5E4 800A99E4 10400005 */  beqz       $v0, .L800A99FC
/* AA5E8 800A99E8 254AFFFF */   addiu     $t2, $t2, -1
/* AA5EC 800A99EC 2482FFFE */  addiu      $v0, $a0, -2
/* AA5F0 800A99F0 34420020 */  ori        $v0, $v0, 0x20
/* AA5F4 800A99F4 0802A698 */  j          .L800A9A60
/* AA5F8 800A99F8 A1020000 */   sb        $v0, ($t0)
.L800A99FC:
/* AA5FC 800A99FC 2484FFDF */  addiu      $a0, $a0, -0x21
/* AA600 800A9A00 0802A690 */  j          .L800A9A40
/* AA604 800A9A04 24020020 */   addiu     $v0, $zero, 0x20
.L800A9A08:
/* AA608 800A9A08 2C82000A */  sltiu      $v0, $a0, 0xa
/* AA60C 800A9A0C 10400008 */  beqz       $v0, .L800A9A30
/* AA610 800A9A10 254AC000 */   addiu     $t2, $t2, -0x4000
/* AA614 800A9A14 31434000 */  andi       $v1, $t2, 0x4000
/* AA618 800A9A18 00031AC2 */  srl        $v1, $v1, 0xb
/* AA61C 800A9A1C 2482FFFE */  addiu      $v0, $a0, -2
/* AA620 800A9A20 34420010 */  ori        $v0, $v0, 0x10
/* AA624 800A9A24 00621825 */  or         $v1, $v1, $v0
/* AA628 800A9A28 0802A698 */  j          .L800A9A60
/* AA62C 800A9A2C A1030000 */   sb        $v1, ($t0)
.L800A9A30:
/* AA630 800A9A30 2484FFF7 */  addiu      $a0, $a0, -9
/* AA634 800A9A34 31424000 */  andi       $v0, $t2, 0x4000
/* AA638 800A9A38 000212C2 */  srl        $v0, $v0, 0xb
/* AA63C 800A9A3C 34420010 */  ori        $v0, $v0, 0x10
.L800A9A40:
/* AA640 800A9A40 0802A694 */  j          .L800A9A50
/* AA644 800A9A44 A1020000 */   sb        $v0, ($t0)
.L800A9A48:
/* AA648 800A9A48 2484FF01 */  addiu      $a0, $a0, -0xff
/* AA64C 800A9A4C A1000000 */  sb         $zero, ($t0)
.L800A9A50:
/* AA650 800A9A50 2C820100 */  sltiu      $v0, $a0, 0x100
/* AA654 800A9A54 1040FFFC */  beqz       $v0, .L800A9A48
/* AA658 800A9A58 25080001 */   addiu     $t0, $t0, 1
/* AA65C 800A9A5C A1040000 */  sb         $a0, ($t0)
.L800A9A60:
/* AA660 800A9A60 25080001 */  addiu      $t0, $t0, 1
/* AA664 800A9A64 000A1080 */  sll        $v0, $t2, 2
/* AA668 800A9A68 A1020000 */  sb         $v0, ($t0)
/* AA66C 800A9A6C 25080001 */  addiu      $t0, $t0, 1
/* AA670 800A9A70 000A1182 */  srl        $v0, $t2, 6
.L800A9A74:
/* AA674 800A9A74 A1020000 */  sb         $v0, ($t0)
/* AA678 800A9A78 01206821 */  addu       $t5, $t1, $zero
/* AA67C 800A9A7C 01A6102B */  sltu       $v0, $t5, $a2
/* AA680 800A9A80 10400046 */  beqz       $v0, .L800A9B9C
/* AA684 800A9A84 25080001 */   addiu     $t0, $t0, 1
.L800A9A88:
/* AA688 800A9A88 912C0003 */  lbu        $t4, 3($t1)
.L800A9A8C:
/* AA68C 800A9A8C 91220002 */  lbu        $v0, 2($t1)
/* AA690 800A9A90 91240001 */  lbu        $a0, 1($t1)
/* AA694 800A9A94 91250000 */  lbu        $a1, ($t1)
/* AA698 800A9A98 000C1980 */  sll        $v1, $t4, 6
/* AA69C 800A9A9C 00621826 */  xor        $v1, $v1, $v0
/* AA6A0 800A9AA0 00031940 */  sll        $v1, $v1, 5
/* AA6A4 800A9AA4 00641826 */  xor        $v1, $v1, $a0
/* AA6A8 800A9AA8 00031940 */  sll        $v1, $v1, 5
/* AA6AC 800A9AAC 00651826 */  xor        $v1, $v1, $a1
/* AA6B0 800A9AB0 00031140 */  sll        $v0, $v1, 5
/* AA6B4 800A9AB4 00431021 */  addu       $v0, $v0, $v1
/* AA6B8 800A9AB8 00025942 */  srl        $t3, $v0, 5
/* AA6BC 800A9ABC 31643FFF */  andi       $a0, $t3, 0x3fff
/* AA6C0 800A9AC0 00041080 */  sll        $v0, $a0, 2
/* AA6C4 800A9AC4 00591021 */  addu       $v0, $v0, $t9
/* AA6C8 800A9AC8 8C450000 */  lw         $a1, ($v0)
/* AA6CC 800A9ACC 00B0182B */  sltu       $v1, $a1, $s0
/* AA6D0 800A9AD0 1460002C */  bnez       $v1, .L800A9B84
/* AA6D4 800A9AD4 00041080 */   sll       $v0, $a0, 2
/* AA6D8 800A9AD8 01255023 */  subu       $t2, $t1, $a1
/* AA6DC 800A9ADC 11400029 */  beqz       $t2, .L800A9B84
/* AA6E0 800A9AE0 340EBFFF */   ori       $t6, $zero, 0xbfff
/* AA6E4 800A9AE4 01CA102B */  sltu       $v0, $t6, $t2
/* AA6E8 800A9AE8 14400026 */  bnez       $v0, .L800A9B84
/* AA6EC 800A9AEC 00041080 */   sll       $v0, $a0, 2
/* AA6F0 800A9AF0 2D4F0801 */  sltiu      $t7, $t2, 0x801
/* AA6F4 800A9AF4 55E00017 */  bnel       $t7, $zero, .L800A9B54
/* AA6F8 800A9AF8 90A30000 */   lbu       $v1, ($a1)
/* AA6FC 800A9AFC 90A20003 */  lbu        $v0, 3($a1)
/* AA700 800A9B00 104C0013 */  beq        $v0, $t4, .L800A9B50
/* AA704 800A9B04 316207FF */   andi      $v0, $t3, 0x7ff
/* AA708 800A9B08 3844201F */  xori       $a0, $v0, 0x201f
/* AA70C 800A9B0C 00041880 */  sll        $v1, $a0, 2
/* AA710 800A9B10 00791821 */  addu       $v1, $v1, $t9
/* AA714 800A9B14 8C650000 */  lw         $a1, ($v1)
/* AA718 800A9B18 00B0102B */  sltu       $v0, $a1, $s0
/* AA71C 800A9B1C 14400019 */  bnez       $v0, .L800A9B84
/* AA720 800A9B20 00041080 */   sll       $v0, $a0, 2
/* AA724 800A9B24 01255023 */  subu       $t2, $t1, $a1
/* AA728 800A9B28 11400015 */  beqz       $t2, .L800A9B80
/* AA72C 800A9B2C 01CA102B */   sltu      $v0, $t6, $t2
/* AA730 800A9B30 14400014 */  bnez       $v0, .L800A9B84
/* AA734 800A9B34 00041080 */   sll       $v0, $a0, 2
/* AA738 800A9B38 2D420801 */  sltiu      $v0, $t2, 0x801
/* AA73C 800A9B3C 14400004 */  bnez       $v0, .L800A9B50
/* AA740 800A9B40 00407821 */   addu      $t7, $v0, $zero
/* AA744 800A9B44 90A20003 */  lbu        $v0, 3($a1)
/* AA748 800A9B48 144C000E */  bne        $v0, $t4, .L800A9B84
/* AA74C 800A9B4C 00041080 */   sll       $v0, $a0, 2
.L800A9B50:
/* AA750 800A9B50 90A30000 */  lbu        $v1, ($a1)
.L800A9B54:
/* AA754 800A9B54 91220000 */  lbu        $v0, ($t1)
/* AA758 800A9B58 1462000A */  bne        $v1, $v0, .L800A9B84
/* AA75C 800A9B5C 00041080 */   sll       $v0, $a0, 2
/* AA760 800A9B60 90A30001 */  lbu        $v1, 1($a1)
/* AA764 800A9B64 91220001 */  lbu        $v0, 1($t1)
/* AA768 800A9B68 14620006 */  bne        $v1, $v0, .L800A9B84
/* AA76C 800A9B6C 00041080 */   sll       $v0, $a0, 2
/* AA770 800A9B70 90A30002 */  lbu        $v1, 2($a1)
/* AA774 800A9B74 91220002 */  lbu        $v0, 2($t1)
/* AA778 800A9B78 1062FF34 */  beq        $v1, $v0, .L800A984C
/* AA77C 800A9B7C 00041080 */   sll       $v0, $a0, 2
.L800A9B80:
/* AA780 800A9B80 00041080 */  sll        $v0, $a0, 2
.L800A9B84:
/* AA784 800A9B84 00591021 */  addu       $v0, $v0, $t9
/* AA788 800A9B88 AC490000 */  sw         $t1, ($v0)
/* AA78C 800A9B8C 25290001 */  addiu      $t1, $t1, 1
/* AA790 800A9B90 0126102B */  sltu       $v0, $t1, $a2
/* AA794 800A9B94 5440FFBD */  bnel       $v0, $zero, .L800A9A8C
/* AA798 800A9B98 912C0003 */   lbu       $t4, 3($t1)
.L800A9B9C:
/* AA79C 800A9B9C 01111023 */  subu       $v0, $t0, $s1
/* AA7A0 800A9BA0 8FB10004 */  lw         $s1, 4($sp)
/* AA7A4 800A9BA4 8FB00000 */  lw         $s0, ($sp)
/* AA7A8 800A9BA8 ACE20000 */  sw         $v0, ($a3)
/* AA7AC 800A9BAC 030D1023 */  subu       $v0, $t8, $t5
/* AA7B0 800A9BB0 03E00008 */  jr         $ra
/* AA7B4 800A9BB4 27BD0008 */   addiu     $sp, $sp, 8

glabel func_800A9BB8
/* AA7B8 800A9BB8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* AA7BC 800A9BBC AFB1001C */  sw         $s1, 0x1c($sp)
/* AA7C0 800A9BC0 00C08821 */  addu       $s1, $a2, $zero
/* AA7C4 800A9BC4 02201821 */  addu       $v1, $s1, $zero
/* AA7C8 800A9BC8 AFB20020 */  sw         $s2, 0x20($sp)
/* AA7CC 800A9BCC 00809021 */  addu       $s2, $a0, $zero
/* AA7D0 800A9BD0 AFB00018 */  sw         $s0, 0x18($sp)
/* AA7D4 800A9BD4 00A08021 */  addu       $s0, $a1, $zero
/* AA7D8 800A9BD8 AFB30024 */  sw         $s3, 0x24($sp)
/* AA7DC 800A9BDC 00E09821 */  addu       $s3, $a3, $zero
/* AA7E0 800A9BE0 2E02000E */  sltiu      $v0, $s0, 0xe
/* AA7E4 800A9BE4 10400003 */  beqz       $v0, .L800A9BF4
/* AA7E8 800A9BE8 AFBF0028 */   sw        $ra, 0x28($sp)
/* AA7EC 800A9BEC 0802A707 */  j          .L800A9C1C
/* AA7F0 800A9BF0 02003821 */   addu      $a3, $s0, $zero
.L800A9BF4:
/* AA7F4 800A9BF4 02402021 */  addu       $a0, $s2, $zero
/* AA7F8 800A9BF8 02002821 */  addu       $a1, $s0, $zero
/* AA7FC 800A9BFC 02203021 */  addu       $a2, $s1, $zero
/* AA800 800A9C00 8FA20040 */  lw         $v0, 0x40($sp)
/* AA804 800A9C04 02603821 */  addu       $a3, $s3, $zero
/* AA808 800A9C08 0C02A607 */  jal        ofunc_sub_800a981c
/* AA80C 800A9C0C AFA20010 */   sw        $v0, 0x10($sp)
/* AA810 800A9C10 8E630000 */  lw         $v1, ($s3)
/* AA814 800A9C14 00403821 */  addu       $a3, $v0, $zero
/* AA818 800A9C18 02231821 */  addu       $v1, $s1, $v1
.L800A9C1C:
/* AA81C 800A9C1C 10E00022 */  beqz       $a3, .L800A9CA8
/* AA820 800A9C20 02501021 */   addu      $v0, $s2, $s0
/* AA824 800A9C24 14710006 */  bne        $v1, $s1, .L800A9C40
/* AA828 800A9C28 00472023 */   subu      $a0, $v0, $a3
/* AA82C 800A9C2C 2CE200EF */  sltiu      $v0, $a3, 0xef
/* AA830 800A9C30 10400003 */  beqz       $v0, .L800A9C40
/* AA834 800A9C34 24E20011 */   addiu     $v0, $a3, 0x11
/* AA838 800A9C38 0802A723 */  j          .L800A9C8C
/* AA83C 800A9C3C A0620000 */   sb        $v0, ($v1)
.L800A9C40:
/* AA840 800A9C40 2CE20004 */  sltiu      $v0, $a3, 4
/* AA844 800A9C44 10400005 */  beqz       $v0, .L800A9C5C
/* AA848 800A9C48 2CE20013 */   sltiu     $v0, $a3, 0x13
/* AA84C 800A9C4C 9062FFFE */  lbu        $v0, -2($v1)
/* AA850 800A9C50 00471025 */  or         $v0, $v0, $a3
/* AA854 800A9C54 0802A724 */  j          .L800A9C90
/* AA858 800A9C58 A062FFFE */   sb        $v0, -2($v1)
.L800A9C5C:
/* AA85C 800A9C5C 10400003 */  beqz       $v0, .L800A9C6C
/* AA860 800A9C60 24E2FFFD */   addiu     $v0, $a3, -3
/* AA864 800A9C64 0802A723 */  j          .L800A9C8C
/* AA868 800A9C68 A0620000 */   sb        $v0, ($v1)
.L800A9C6C:
/* AA86C 800A9C6C 0802A71E */  j          .L800A9C78
/* AA870 800A9C70 24E6FFEE */   addiu     $a2, $a3, -0x12
.L800A9C74:
/* AA874 800A9C74 24C6FF01 */  addiu      $a2, $a2, -0xff
.L800A9C78:
/* AA878 800A9C78 A0600000 */  sb         $zero, ($v1)
/* AA87C 800A9C7C 2CC20100 */  sltiu      $v0, $a2, 0x100
/* AA880 800A9C80 1040FFFC */  beqz       $v0, .L800A9C74
/* AA884 800A9C84 24630001 */   addiu     $v1, $v1, 1
/* AA888 800A9C88 A0660000 */  sb         $a2, ($v1)
.L800A9C8C:
/* AA88C 800A9C8C 24630001 */  addiu      $v1, $v1, 1
.L800A9C90:
/* AA890 800A9C90 90820000 */  lbu        $v0, ($a0)
/* AA894 800A9C94 24840001 */  addiu      $a0, $a0, 1
/* AA898 800A9C98 24E7FFFF */  addiu      $a3, $a3, -1
/* AA89C 800A9C9C A0620000 */  sb         $v0, ($v1)
/* AA8A0 800A9CA0 14E0FFFB */  bnez       $a3, .L800A9C90
/* AA8A4 800A9CA4 24630001 */   addiu     $v1, $v1, 1
.L800A9CA8:
/* AA8A8 800A9CA8 24020011 */  addiu      $v0, $zero, 0x11
/* AA8AC 800A9CAC A0620000 */  sb         $v0, ($v1)
/* AA8B0 800A9CB0 24630001 */  addiu      $v1, $v1, 1
/* AA8B4 800A9CB4 A0600000 */  sb         $zero, ($v1)
/* AA8B8 800A9CB8 24630001 */  addiu      $v1, $v1, 1
/* AA8BC 800A9CBC A0600000 */  sb         $zero, ($v1)
/* AA8C0 800A9CC0 24630001 */  addiu      $v1, $v1, 1
/* AA8C4 800A9CC4 8FBF0028 */  lw         $ra, 0x28($sp)
/* AA8C8 800A9CC8 00711823 */  subu       $v1, $v1, $s1
/* AA8CC 800A9CCC AE630000 */  sw         $v1, ($s3)
/* AA8D0 800A9CD0 8FB30024 */  lw         $s3, 0x24($sp)
/* AA8D4 800A9CD4 8FB20020 */  lw         $s2, 0x20($sp)
/* AA8D8 800A9CD8 8FB1001C */  lw         $s1, 0x1c($sp)
/* AA8DC 800A9CDC 8FB00018 */  lw         $s0, 0x18($sp)
/* AA8E0 800A9CE0 00001021 */  addu       $v0, $zero, $zero
/* AA8E4 800A9CE4 03E00008 */  jr         $ra
/* AA8E8 800A9CE8 27BD0030 */   addiu     $sp, $sp, 0x30
