.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osInitialize
/* C3DA0 800C31A0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C3DA4 800C31A4 AFBF0024 */  sw         $ra, 0x24($sp)
/* C3DA8 800C31A8 AFB20020 */  sw         $s2, 0x20($sp)
/* C3DAC 800C31AC AFB1001C */  sw         $s1, 0x1c($sp)
/* C3DB0 800C31B0 0C030D6C */  jal        osGetSR
/* C3DB4 800C31B4 AFB00018 */   sw        $s0, 0x18($sp)
/* C3DB8 800C31B8 3C042000 */  lui        $a0, 0x2000
/* C3DBC 800C31BC 0C0331F0 */  jal        __osGetSR_
/* C3DC0 800C31C0 00442025 */   or        $a0, $v0, $a0
/* C3DC4 800C31C4 3C040100 */  lui        $a0, 0x100
/* C3DC8 800C31C8 0C0331B4 */  jal        __osSetFpcCsr
/* C3DCC 800C31CC 34840800 */   ori       $a0, $a0, 0x800
/* C3DD0 800C31D0 3C041FC0 */  lui        $a0, 0x1fc0
.L800C31D4:
/* C3DD4 800C31D4 348407FC */  ori        $a0, $a0, 0x7fc
/* C3DD8 800C31D8 0C033320 */  jal        __osSiRawReadIo
/* C3DDC 800C31DC 27A50010 */   addiu     $a1, $sp, 0x10
/* C3DE0 800C31E0 1440FFFC */  bnez       $v0, .L800C31D4
/* C3DE4 800C31E4 3C041FC0 */   lui       $a0, 0x1fc0
.L800C31E8:
/* C3DE8 800C31E8 8FA50010 */  lw         $a1, 0x10($sp)
/* C3DEC 800C31EC 3C041FC0 */  lui        $a0, 0x1fc0
/* C3DF0 800C31F0 348407FC */  ori        $a0, $a0, 0x7fc
/* C3DF4 800C31F4 0C03333C */  jal        __osSiRawWriteIo
/* C3DF8 800C31F8 34A50008 */   ori       $a1, $a1, 8
/* C3DFC 800C31FC 1440FFFA */  bnez       $v0, .L800C31E8
/* C3E00 800C3200 00000000 */   nop
/* C3E04 800C3204 3C02800C */  lui        $v0, %hi(__osExceptionPreamble)
/* C3E08 800C3208 2442EF90 */  addiu      $v0, $v0, %lo(__osExceptionPreamble)
/* C3E0C 800C320C 3C068000 */  lui        $a2, 0x8000
/* C3E10 800C3210 8C430000 */  lw         $v1, ($v0)
/* C3E14 800C3214 8C440004 */  lw         $a0, 4($v0)
/* C3E18 800C3218 8C450008 */  lw         $a1, 8($v0)
/* C3E1C 800C321C ACC30000 */  sw         $v1, ($a2)
/* C3E20 800C3220 ACC40004 */  sw         $a0, 4($a2)
/* C3E24 800C3224 ACC50008 */  sw         $a1, 8($a2)
/* C3E28 800C3228 8C43000C */  lw         $v1, 0xc($v0)
/* C3E2C 800C322C ACC3000C */  sw         $v1, 0xc($a2)
/* C3E30 800C3230 3C068000 */  lui        $a2, 0x8000
/* C3E34 800C3234 34C60080 */  ori        $a2, $a2, 0x80
/* C3E38 800C3238 8C430000 */  lw         $v1, ($v0)
/* C3E3C 800C323C 8C440004 */  lw         $a0, 4($v0)
/* C3E40 800C3240 8C450008 */  lw         $a1, 8($v0)
/* C3E44 800C3244 ACC30000 */  sw         $v1, ($a2)
/* C3E48 800C3248 ACC40004 */  sw         $a0, 4($a2)
/* C3E4C 800C324C ACC50008 */  sw         $a1, 8($a2)
/* C3E50 800C3250 8C43000C */  lw         $v1, 0xc($v0)
/* C3E54 800C3254 ACC3000C */  sw         $v1, 0xc($a2)
/* C3E58 800C3258 3C068000 */  lui        $a2, 0x8000
/* C3E5C 800C325C 34C60100 */  ori        $a2, $a2, 0x100
/* C3E60 800C3260 8C430000 */  lw         $v1, ($v0)
/* C3E64 800C3264 8C440004 */  lw         $a0, 4($v0)
/* C3E68 800C3268 8C450008 */  lw         $a1, 8($v0)
/* C3E6C 800C326C ACC30000 */  sw         $v1, ($a2)
/* C3E70 800C3270 ACC40004 */  sw         $a0, 4($a2)
/* C3E74 800C3274 ACC50008 */  sw         $a1, 8($a2)
/* C3E78 800C3278 8C43000C */  lw         $v1, 0xc($v0)
/* C3E7C 800C327C ACC3000C */  sw         $v1, 0xc($a2)
/* C3E80 800C3280 3C068000 */  lui        $a2, 0x8000
/* C3E84 800C3284 34C60180 */  ori        $a2, $a2, 0x180
/* C3E88 800C3288 8C430000 */  lw         $v1, ($v0)
/* C3E8C 800C328C 8C440004 */  lw         $a0, 4($v0)
/* C3E90 800C3290 8C450008 */  lw         $a1, 8($v0)
/* C3E94 800C3294 ACC30000 */  sw         $v1, ($a2)
/* C3E98 800C3298 ACC40004 */  sw         $a0, 4($a2)
/* C3E9C 800C329C ACC50008 */  sw         $a1, 8($a2)
/* C3EA0 800C32A0 8C43000C */  lw         $v1, 0xc($v0)
/* C3EA4 800C32A4 ACC3000C */  sw         $v1, 0xc($a2)
/* C3EA8 800C32A8 3C048000 */  lui        $a0, 0x8000
/* C3EAC 800C32AC 0C034A30 */  jal        osWritebackDCache
/* C3EB0 800C32B0 24050190 */   addiu     $a1, $zero, 0x190
/* C3EB4 800C32B4 3C048000 */  lui        $a0, 0x8000
/* C3EB8 800C32B8 0C030DE0 */  jal        osInvalICache
/* C3EBC 800C32BC 24050190 */   addiu     $a1, $zero, 0x190
/* C3EC0 800C32C0 0C030D37 */  jal        createSpeedParam
/* C3EC4 800C32C4 00000000 */   nop
/* C3EC8 800C32C8 0C034724 */  jal        osUnmapTLBAll
/* C3ECC 800C32CC 00000000 */   nop
/* C3ED0 800C32D0 0C03102C */  jal        osMapTLBRdb
/* C3ED4 800C32D4 00000000 */   nop
/* C3ED8 800C32D8 3C02800F */  lui        $v0, %hi(initialize_data_0000)
/* C3EDC 800C32DC 8C423830 */  lw         $v0, %lo(initialize_data_0000)($v0)
/* C3EE0 800C32E0 3C03800F */  lui        $v1, %hi(initialize_data_0004)
/* C3EE4 800C32E4 8C633834 */  lw         $v1, %lo(initialize_data_0004)($v1)
/* C3EE8 800C32E8 00022040 */  sll        $a0, $v0, 1
/* C3EEC 800C32EC 000337C2 */  srl        $a2, $v1, 0x1f
/* C3EF0 800C32F0 00862025 */  or         $a0, $a0, $a2
/* C3EF4 800C32F4 00032840 */  sll        $a1, $v1, 1
/* C3EF8 800C32F8 00A32821 */  addu       $a1, $a1, $v1
/* C3EFC 800C32FC 00A3302B */  sltu       $a2, $a1, $v1
/* C3F00 800C3300 00822021 */  addu       $a0, $a0, $v0
/* C3F04 800C3304 00862021 */  addu       $a0, $a0, $a2
/* C3F08 800C3308 24060000 */  addiu      $a2, $zero, 0
/* C3F0C 800C330C 0C02F6D8 */  jal        udivdi3
/* C3F10 800C3310 24070004 */   addiu     $a3, $zero, 4
/* C3F14 800C3314 3C048000 */  lui        $a0, %hi(osResetType)
/* C3F18 800C3318 8C84030C */  lw         $a0, %lo(osResetType)($a0)
/* C3F1C 800C331C 3C01800F */  lui        $at, %hi(initialize_data_0000)
/* C3F20 800C3320 AC223830 */  sw         $v0, %lo(initialize_data_0000)($at)
/* C3F24 800C3324 3C01800F */  lui        $at, %hi(initialize_data_0004)
/* C3F28 800C3328 14800005 */  bnez       $a0, .L800C3340
/* C3F2C 800C332C AC233834 */   sw        $v1, %lo(initialize_data_0004)($at)
/* C3F30 800C3330 3C048000 */  lui        $a0, %hi(osAppNMIBuffer)
/* C3F34 800C3334 2484031C */  addiu      $a0, $a0, %lo(osAppNMIBuffer)
/* C3F38 800C3338 0C02F9AC */  jal        _bzero
/* C3F3C 800C333C 24050040 */   addiu     $a1, $zero, 0x40
.L800C3340:
/* C3F40 800C3340 3C038000 */  lui        $v1, %hi(osTvType)
/* C3F44 800C3344 8C630300 */  lw         $v1, %lo(osTvType)($v1)
/* C3F48 800C3348 54600004 */  bnel       $v1, $zero, .L800C335C
/* C3F4C 800C334C 24020002 */   addiu     $v0, $zero, 2
/* C3F50 800C3350 3C0202F5 */  lui        $v0, 0x2f5
/* C3F54 800C3354 08030CDC */  j          .L800C3370
/* C3F58 800C3358 3442B2D2 */   ori       $v0, $v0, 0xb2d2
.L800C335C:
/* C3F5C 800C335C 14620003 */  bne        $v1, $v0, .L800C336C
/* C3F60 800C3360 3C0202E6 */   lui       $v0, 0x2e6
/* C3F64 800C3364 08030CDC */  j          .L800C3370
/* C3F68 800C3368 3442025C */   ori       $v0, $v0, 0x25c
.L800C336C:
/* C3F6C 800C336C 3442D354 */  ori        $v0, $v0, 0xd354
.L800C3370:
/* C3F70 800C3370 3C01800F */  lui        $at, %hi(osViClock)
/* C3F74 800C3374 0C030D68 */  jal        __osGetCause
/* C3F78 800C3378 AC223838 */   sw        $v0, %lo(osViClock)($at)
/* C3F7C 800C337C 30421000 */  andi       $v0, $v0, 0x1000
/* C3F80 800C3380 10400003 */  beqz       $v0, .L800C3390
/* C3F84 800C3384 3C02A450 */   lui       $v0, 0xa450
.L800C3388:
/* C3F88 800C3388 08030CE2 */  j          .L800C3388
/* C3F8C 800C338C 00000000 */   nop
.L800C3390:
/* C3F90 800C3390 34420008 */  ori        $v0, $v0, 8
/* C3F94 800C3394 3C03A450 */  lui        $v1, 0xa450
/* C3F98 800C3398 34630010 */  ori        $v1, $v1, 0x10
/* C3F9C 800C339C 3C04A450 */  lui        $a0, 0xa450
/* C3FA0 800C33A0 3C05800F */  lui        $a1, %hi(__kmc_pt_mode)
/* C3FA4 800C33A4 8CA57840 */  lw         $a1, %lo(__kmc_pt_mode)($a1)
/* C3FA8 800C33A8 34840014 */  ori        $a0, $a0, 0x14
/* C3FAC 800C33AC 24120001 */  addiu      $s2, $zero, 1
/* C3FB0 800C33B0 AC520000 */  sw         $s2, ($v0)
/* C3FB4 800C33B4 24023FFF */  addiu      $v0, $zero, 0x3fff
/* C3FB8 800C33B8 AC620000 */  sw         $v0, ($v1)
/* C3FBC 800C33BC 2402000F */  addiu      $v0, $zero, 0xf
/* C3FC0 800C33C0 AC820000 */  sw         $v0, ($a0)
/* C3FC4 800C33C4 14A0003F */  bnez       $a1, .L800C34C4
/* C3FC8 800C33C8 3C10BFF0 */   lui       $s0, 0xbff0
/* C3FCC 800C33CC 36108004 */  ori        $s0, $s0, 0x8004
/* C3FD0 800C33D0 3C11BFF0 */  lui        $s1, 0xbff0
/* C3FD4 800C33D4 8E230000 */  lw         $v1, ($s1)
/* C3FD8 800C33D8 3C024B4D */  lui        $v0, 0x4b4d
/* C3FDC 800C33DC 34424300 */  ori        $v0, $v0, 0x4300
/* C3FE0 800C33E0 14620038 */  bne        $v1, $v0, .L800C34C4
/* C3FE4 800C33E4 3C048000 */   lui       $a0, 0x8000
/* C3FE8 800C33E8 3C02800C */  lui        $v0, %hi(__ptExceptionPreamble)
/* C3FEC 800C33EC 2442EFA0 */  addiu      $v0, $v0, %lo(__ptExceptionPreamble)
/* C3FF0 800C33F0 8C430000 */  lw         $v1, ($v0)
/* C3FF4 800C33F4 24420004 */  addiu      $v0, $v0, 4
/* C3FF8 800C33F8 3C018000 */  lui        $at, %hi(GEN_EXCEPTION)
/* C3FFC 800C33FC AC230180 */  sw         $v1, %lo(GEN_EXCEPTION)($at)
/* C4000 800C3400 8C430000 */  lw         $v1, ($v0)
/* C4004 800C3404 24420004 */  addiu      $v0, $v0, 4
/* C4008 800C3408 3C018000 */  lui        $at, %hi(D_80000184)
/* C400C 800C340C AC230184 */  sw         $v1, %lo(D_80000184)($at)
/* C4010 800C3410 8C430000 */  lw         $v1, ($v0)
/* C4014 800C3414 2442000C */  addiu      $v0, $v0, 0xc
/* C4018 800C3418 3C018000 */  lui        $at, %hi(D_80000188)
/* C401C 800C341C AC230188 */  sw         $v1, %lo(D_80000188)($at)
/* C4020 800C3420 8C430000 */  lw         $v1, ($v0)
/* C4024 800C3424 24420004 */  addiu      $v0, $v0, 4
/* C4028 800C3428 3C018000 */  lui        $at, %hi(D_80000194)
/* C402C 800C342C AC230194 */  sw         $v1, %lo(D_80000194)($at)
/* C4030 800C3430 8C430000 */  lw         $v1, ($v0)
/* C4034 800C3434 3C018000 */  lui        $at, %hi(D_80000198)
/* C4038 800C3438 AC230198 */  sw         $v1, %lo(D_80000198)($at)
/* C403C 800C343C 8C420004 */  lw         $v0, 4($v0)
/* C4040 800C3440 34840180 */  ori        $a0, $a0, 0x180
/* C4044 800C3444 3C018000 */  lui        $at, %hi(D_8000019C)
/* C4048 800C3448 AC22019C */  sw         $v0, %lo(D_8000019C)($at)
/* C404C 800C344C 0C034A30 */  jal        osWritebackDCache
/* C4050 800C3450 24050024 */   addiu     $a1, $zero, 0x24
/* C4054 800C3454 3C048000 */  lui        $a0, 0x8000
/* C4058 800C3458 34840180 */  ori        $a0, $a0, 0x180
/* C405C 800C345C 0C030DE0 */  jal        osInvalICache
/* C4060 800C3460 24050024 */   addiu     $a1, $zero, 0x24
/* C4064 800C3464 8E020000 */  lw         $v0, ($s0)
/* C4068 800C3468 3C01800F */  lui        $at, %hi(__kmc_pt_mode)
/* C406C 800C346C AC327840 */  sw         $s2, %lo(__kmc_pt_mode)($at)
/* C4070 800C3470 30420010 */  andi       $v0, $v0, 0x10
/* C4074 800C3474 14400013 */  bnez       $v0, .L800C34C4
/* C4078 800C3478 00000000 */   nop
/* C407C 800C347C 3C06BFF0 */  lui        $a2, %hi(D_BFF00004)
/* C4080 800C3480 8CC60004 */  lw         $a2, %lo(D_BFF00004)($a2)
/* C4084 800C3484 10D1000A */  beq        $a2, $s1, .L800C34B0
/* C4088 800C3488 3C022000 */   lui       $v0, 0x2000
/* C408C 800C348C 00C22825 */  or         $a1, $a2, $v0
/* C4090 800C3490 24040800 */  addiu      $a0, $zero, 0x800
/* C4094 800C3494 3C03BFF0 */  lui        $v1, 0xbff0
.L800C3498:
/* C4098 800C3498 8C620000 */  lw         $v0, ($v1)
/* C409C 800C349C 24630004 */  addiu      $v1, $v1, 4
/* C40A0 800C34A0 2484FFFF */  addiu      $a0, $a0, -1
/* C40A4 800C34A4 ACA20000 */  sw         $v0, ($a1)
/* C40A8 800C34A8 1480FFFB */  bnez       $a0, .L800C3498
/* C40AC 800C34AC 24A50004 */   addiu     $a1, $a1, 4
.L800C34B0:
/* C40B0 800C34B0 3C044B4D */  lui        $a0, 0x4b4d
/* C40B4 800C34B4 34844300 */  ori        $a0, $a0, 0x4300
/* C40B8 800C34B8 24C20008 */  addiu      $v0, $a2, 8
/* C40BC 800C34BC 0040F809 */  jalr       $v0
/* C40C0 800C34C0 00002821 */   addu      $a1, $zero, $zero
.L800C34C4:
/* C40C4 800C34C4 8FBF0024 */  lw         $ra, 0x24($sp)
/* C40C8 800C34C8 8FB20020 */  lw         $s2, 0x20($sp)
/* C40CC 800C34CC 8FB1001C */  lw         $s1, 0x1c($sp)
/* C40D0 800C34D0 8FB00018 */  lw         $s0, 0x18($sp)
/* C40D4 800C34D4 03E00008 */  jr         $ra
/* C40D8 800C34D8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel createSpeedParam
/* C40DC 800C34DC 3C05A460 */  lui        $a1, 0xa460
/* C40E0 800C34E0 34A50014 */  ori        $a1, $a1, 0x14
/* C40E4 800C34E4 3C06A460 */  lui        $a2, 0xa460
/* C40E8 800C34E8 34C60018 */  ori        $a2, $a2, 0x18
/* C40EC 800C34EC 3C07A460 */  lui        $a3, 0xa460
/* C40F0 800C34F0 34E7001C */  ori        $a3, $a3, 0x1c
/* C40F4 800C34F4 3C08A460 */  lui        $t0, 0xa460
/* C40F8 800C34F8 35080020 */  ori        $t0, $t0, 0x20
/* C40FC 800C34FC 3C09A460 */  lui        $t1, 0xa460
/* C4100 800C3500 35290024 */  ori        $t1, $t1, 0x24
/* C4104 800C3504 3C04A460 */  lui        $a0, 0xa460
/* C4108 800C3508 34840028 */  ori        $a0, $a0, 0x28
/* C410C 800C350C 3C03A460 */  lui        $v1, 0xa460
/* C4110 800C3510 3463002C */  ori        $v1, $v1, 0x2c
/* C4114 800C3514 3C02A460 */  lui        $v0, 0xa460
/* C4118 800C3518 34420030 */  ori        $v0, $v0, 0x30
/* C411C 800C351C 8CA50000 */  lw         $a1, ($a1)
/* C4120 800C3520 8CC60000 */  lw         $a2, ($a2)
/* C4124 800C3524 8CE70000 */  lw         $a3, ($a3)
/* C4128 800C3528 8D080000 */  lw         $t0, ($t0)
/* C412C 800C352C 8D290000 */  lw         $t1, ($t1)
/* C4130 800C3530 8C840000 */  lw         $a0, ($a0)
/* C4134 800C3534 8C630000 */  lw         $v1, ($v1)
/* C4138 800C3538 8C4A0000 */  lw         $t2, ($v0)
/* C413C 800C353C 24020007 */  addiu      $v0, $zero, 7
/* C4140 800C3540 3C018010 */  lui        $at, %hi(D_800F9434)
/* C4144 800C3544 A0229434 */  sb         $v0, %lo(D_800F9434)($at)
/* C4148 800C3548 3C018010 */  lui        $at, %hi(D_800F94AC)
/* C414C 800C354C A02294AC */  sb         $v0, %lo(D_800F94AC)($at)
/* C4150 800C3550 3C018010 */  lui        $at, %hi(D_800F9435)
/* C4154 800C3554 A0259435 */  sb         $a1, %lo(D_800F9435)($at)
/* C4158 800C3558 3C018010 */  lui        $at, %hi(D_800F9438)
/* C415C 800C355C A0269438 */  sb         $a2, %lo(D_800F9438)($at)
/* C4160 800C3560 3C018010 */  lui        $at, %hi(D_800F9436)
/* C4164 800C3564 A0279436 */  sb         $a3, %lo(D_800F9436)($at)
/* C4168 800C3568 3C018010 */  lui        $at, %hi(__Dom1SpeedParam)
/* C416C 800C356C A0289437 */  sb         $t0, %lo(__Dom1SpeedParam)($at)
/* C4170 800C3570 3C018010 */  lui        $at, %hi(D_800F94AD)
/* C4174 800C3574 A02994AD */  sb         $t1, %lo(D_800F94AD)($at)
/* C4178 800C3578 3C018010 */  lui        $at, %hi(D_800F94B0)
/* C417C 800C357C A02494B0 */  sb         $a0, %lo(D_800F94B0)($at)
/* C4180 800C3580 3C018010 */  lui        $at, %hi(D_800F94AE)
/* C4184 800C3584 A02394AE */  sb         $v1, %lo(D_800F94AE)($at)
/* C4188 800C3588 3C018010 */  lui        $at, %hi(__Dom2SpeedParam)
/* C418C 800C358C 03E00008 */  jr         $ra
/* C4190 800C3590 A02A94AF */   sb        $t2, %lo(__Dom2SpeedParam)($at)
/* C4194 800C3594 00000000 */  nop
/* C4198 800C3598 00000000 */  nop
/* C419C 800C359C 00000000 */  nop
