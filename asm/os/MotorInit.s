.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osMotorAccess
/* C4D10 800C4110 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* C4D14 800C4114 AFB10014 */  sw         $s1, 0x14($sp)
/* C4D18 800C4118 00808821 */  addu       $s1, $a0, $zero
/* C4D1C 800C411C AFB3001C */  sw         $s3, 0x1c($sp)
/* C4D20 800C4120 00A09821 */  addu       $s3, $a1, $zero
/* C4D24 800C4124 AFBF0020 */  sw         $ra, 0x20($sp)
/* C4D28 800C4128 AFB20018 */  sw         $s2, 0x18($sp)
/* C4D2C 800C412C AFB00010 */  sw         $s0, 0x10($sp)
/* C4D30 800C4130 8E220008 */  lw         $v0, 8($s1)
/* C4D34 800C4134 8E230000 */  lw         $v1, ($s1)
/* C4D38 800C4138 3C04800F */  lui        $a0, %hi(__MotorDataBuf)
/* C4D3C 800C413C 24847A30 */  addiu      $a0, $a0, %lo(__MotorDataBuf)
/* C4D40 800C4140 00021180 */  sll        $v0, $v0, 6
/* C4D44 800C4144 30630008 */  andi       $v1, $v1, 8
/* C4D48 800C4148 14600003 */  bnez       $v1, .L800C4158
/* C4D4C 800C414C 00449021 */   addu      $s2, $v0, $a0
/* C4D50 800C4150 0803108E */  j          .L800C4238
/* C4D54 800C4154 24020005 */   addiu     $v0, $zero, 5
.L800C4158:
/* C4D58 800C4158 0C033265 */  jal        __osSiGetAccess
/* C4D5C 800C415C 00000000 */   nop
/* C4D60 800C4160 8E220008 */  lw         $v0, 8($s1)
/* C4D64 800C4164 24030001 */  addiu      $v1, $zero, 1
/* C4D68 800C4168 00021180 */  sll        $v0, $v0, 6
/* C4D6C 800C416C 3C01800F */  lui        $at, %hi(__MotorDataBuf+0x3C)
/* C4D70 800C4170 00220821 */  addu       $at, $at, $v0
/* C4D74 800C4174 AC237A6C */  sw         $v1, %lo(__MotorDataBuf+0x3C)($at)
/* C4D78 800C4178 8E220008 */  lw         $v0, 8($s1)
/* C4D7C 800C417C 2403001F */  addiu      $v1, $zero, 0x1f
/* C4D80 800C4180 02429021 */  addu       $s2, $s2, $v0
/* C4D84 800C4184 2642001F */  addiu      $v0, $s2, 0x1f
.L800C4188:
/* C4D88 800C4188 A0530006 */  sb         $s3, 6($v0)
/* C4D8C 800C418C 2463FFFF */  addiu      $v1, $v1, -1
/* C4D90 800C4190 0461FFFD */  bgez       $v1, .L800C4188
/* C4D94 800C4194 2442FFFF */   addiu     $v0, $v0, -1
/* C4D98 800C4198 8E250008 */  lw         $a1, 8($s1)
/* C4D9C 800C419C 24040001 */  addiu      $a0, $zero, 1
/* C4DA0 800C41A0 240200FE */  addiu      $v0, $zero, 0xfe
/* C4DA4 800C41A4 3C10800F */  lui        $s0, %hi(__MotorDataBuf)
/* C4DA8 800C41A8 26107A30 */  addiu      $s0, $s0, %lo(__MotorDataBuf)
/* C4DAC 800C41AC 3C01800F */  lui        $at, %hi(__osContLastCmd)
/* C4DB0 800C41B0 A02257A0 */  sb         $v0, %lo(__osContLastCmd)($at)
/* C4DB4 800C41B4 00052980 */  sll        $a1, $a1, 6
/* C4DB8 800C41B8 0C0332F4 */  jal        __osSiRawStartDma
/* C4DBC 800C41BC 00B02821 */   addu      $a1, $a1, $s0
/* C4DC0 800C41C0 8E240004 */  lw         $a0, 4($s1)
/* C4DC4 800C41C4 00002821 */  addu       $a1, $zero, $zero
/* C4DC8 800C41C8 0C0321E4 */  jal        osRecvMesg
/* C4DCC 800C41CC 24060001 */   addiu     $a2, $zero, 1
/* C4DD0 800C41D0 8E250008 */  lw         $a1, 8($s1)
/* C4DD4 800C41D4 00002021 */  addu       $a0, $zero, $zero
/* C4DD8 800C41D8 00052980 */  sll        $a1, $a1, 6
/* C4DDC 800C41DC 0C0332F4 */  jal        __osSiRawStartDma
/* C4DE0 800C41E0 00B02821 */   addu      $a1, $a1, $s0
/* C4DE4 800C41E4 8E240004 */  lw         $a0, 4($s1)
/* C4DE8 800C41E8 00002821 */  addu       $a1, $zero, $zero
/* C4DEC 800C41EC 0C0321E4 */  jal        osRecvMesg
/* C4DF0 800C41F0 24060001 */   addiu     $a2, $zero, 1
/* C4DF4 800C41F4 92420002 */  lbu        $v0, 2($s2)
/* C4DF8 800C41F8 305000C0 */  andi       $s0, $v0, 0xc0
/* C4DFC 800C41FC 1600000B */  bnez       $s0, .L800C422C
/* C4E00 800C4200 00000000 */   nop
/* C4E04 800C4204 16600006 */  bnez       $s3, .L800C4220
/* C4E08 800C4208 240200EB */   addiu     $v0, $zero, 0xeb
/* C4E0C 800C420C 92420026 */  lbu        $v0, 0x26($s2)
/* C4E10 800C4210 10400006 */  beqz       $v0, .L800C422C
/* C4E14 800C4214 00000000 */   nop
/* C4E18 800C4218 0803108B */  j          .L800C422C
/* C4E1C 800C421C 24100004 */   addiu     $s0, $zero, 4
.L800C4220:
/* C4E20 800C4220 92430026 */  lbu        $v1, 0x26($s2)
/* C4E24 800C4224 54620001 */  bnel       $v1, $v0, .L800C422C
/* C4E28 800C4228 24100004 */   addiu     $s0, $zero, 4
.L800C422C:
/* C4E2C 800C422C 0C033280 */  jal        _osSiRelAccess
/* C4E30 800C4230 00000000 */   nop
/* C4E34 800C4234 02001021 */  addu       $v0, $s0, $zero
.L800C4238:
/* C4E38 800C4238 8FBF0020 */  lw         $ra, 0x20($sp)
/* C4E3C 800C423C 8FB3001C */  lw         $s3, 0x1c($sp)
/* C4E40 800C4240 8FB20018 */  lw         $s2, 0x18($sp)
/* C4E44 800C4244 8FB10014 */  lw         $s1, 0x14($sp)
/* C4E48 800C4248 8FB00010 */  lw         $s0, 0x10($sp)
/* C4E4C 800C424C 03E00008 */  jr         $ra
/* C4E50 800C4250 27BD0028 */   addiu     $sp, $sp, 0x28

glabel osMotorInit
/* C4E54 800C4254 27BDFF88 */  addiu      $sp, $sp, -0x78
/* C4E58 800C4258 AFB00060 */  sw         $s0, 0x60($sp)
/* C4E5C 800C425C 00808021 */  addu       $s0, $a0, $zero
/* C4E60 800C4260 AFB20068 */  sw         $s2, 0x68($sp)
/* C4E64 800C4264 00A09021 */  addu       $s2, $a1, $zero
/* C4E68 800C4268 AFB10064 */  sw         $s1, 0x64($sp)
/* C4E6C 800C426C 00C08821 */  addu       $s1, $a2, $zero
/* C4E70 800C4270 02402021 */  addu       $a0, $s2, $zero
/* C4E74 800C4274 240500FE */  addiu      $a1, $zero, 0xfe
/* C4E78 800C4278 240200FF */  addiu      $v0, $zero, 0xff
/* C4E7C 800C427C AFBF0070 */  sw         $ra, 0x70($sp)
/* C4E80 800C4280 AFB3006C */  sw         $s3, 0x6c($sp)
/* C4E84 800C4284 AE500004 */  sw         $s0, 4($s2)
/* C4E88 800C4288 AE510008 */  sw         $s1, 8($s2)
/* C4E8C 800C428C A2420065 */  sb         $v0, 0x65($s2)
/* C4E90 800C4290 0C031DC8 */  jal        __osPfsSelectBank
/* C4E94 800C4294 AE400000 */   sw        $zero, ($s2)
/* C4E98 800C4298 24130002 */  addiu      $s3, $zero, 2
/* C4E9C 800C429C 14530003 */  bne        $v0, $s3, .L800C42AC
/* C4EA0 800C42A0 02402021 */   addu      $a0, $s2, $zero
/* C4EA4 800C42A4 0C031DC8 */  jal        __osPfsSelectBank
/* C4EA8 800C42A8 24050080 */   addiu     $a1, $zero, 0x80
.L800C42AC:
/* C4EAC 800C42AC 14400074 */  bnez       $v0, .L800C4480
/* C4EB0 800C42B0 02002021 */   addu      $a0, $s0, $zero
/* C4EB4 800C42B4 02202821 */  addu       $a1, $s1, $zero
/* C4EB8 800C42B8 24060400 */  addiu      $a2, $zero, 0x400
/* C4EBC 800C42BC 0C0309EC */  jal        __osContRamRead
/* C4EC0 800C42C0 27A70010 */   addiu     $a3, $sp, 0x10
/* C4EC4 800C42C4 50530001 */  beql       $v0, $s3, .L800C42CC
/* C4EC8 800C42C8 24020004 */   addiu     $v0, $zero, 4
.L800C42CC:
/* C4ECC 800C42CC 1440006C */  bnez       $v0, .L800C4480
/* C4ED0 800C42D0 00000000 */   nop
/* C4ED4 800C42D4 93A3002F */  lbu        $v1, 0x2f($sp)
/* C4ED8 800C42D8 240200FE */  addiu      $v0, $zero, 0xfe
/* C4EDC 800C42DC 10620013 */  beq        $v1, $v0, .L800C432C
/* C4EE0 800C42E0 02402021 */   addu      $a0, $s2, $zero
/* C4EE4 800C42E4 0C031DC8 */  jal        __osPfsSelectBank
/* C4EE8 800C42E8 24050080 */   addiu     $a1, $zero, 0x80
/* C4EEC 800C42EC 50530001 */  beql       $v0, $s3, .L800C42F4
/* C4EF0 800C42F0 24020004 */   addiu     $v0, $zero, 4
.L800C42F4:
/* C4EF4 800C42F4 14400062 */  bnez       $v0, .L800C4480
/* C4EF8 800C42F8 02002021 */   addu      $a0, $s0, $zero
/* C4EFC 800C42FC 02202821 */  addu       $a1, $s1, $zero
/* C4F00 800C4300 24060400 */  addiu      $a2, $zero, 0x400
/* C4F04 800C4304 0C0309EC */  jal        __osContRamRead
/* C4F08 800C4308 27A70010 */   addiu     $a3, $sp, 0x10
/* C4F0C 800C430C 50530001 */  beql       $v0, $s3, .L800C4314
/* C4F10 800C4310 24020004 */   addiu     $v0, $zero, 4
.L800C4314:
/* C4F14 800C4314 1440005A */  bnez       $v0, .L800C4480
/* C4F18 800C4318 00000000 */   nop
/* C4F1C 800C431C 93A3002F */  lbu        $v1, 0x2f($sp)
/* C4F20 800C4320 24020080 */  addiu      $v0, $zero, 0x80
/* C4F24 800C4324 10620003 */  beq        $v1, $v0, .L800C4334
/* C4F28 800C4328 00000000 */   nop
.L800C432C:
/* C4F2C 800C432C 08031120 */  j          .L800C4480
/* C4F30 800C4330 2402000B */   addiu     $v0, $zero, 0xb
.L800C4334:
/* C4F34 800C4334 8E420000 */  lw         $v0, ($s2)
/* C4F38 800C4338 30420008 */  andi       $v0, $v0, 8
/* C4F3C 800C433C 1440004E */  bnez       $v0, .L800C4478
/* C4F40 800C4340 24020008 */   addiu     $v0, $zero, 8
/* C4F44 800C4344 00111980 */  sll        $v1, $s1, 6
/* C4F48 800C4348 3C02800F */  lui        $v0, %hi(__MotorDataBuf)
/* C4F4C 800C434C 24427A30 */  addiu      $v0, $v0, %lo(__MotorDataBuf)
/* C4F50 800C4350 00628021 */  addu       $s0, $v1, $v0
/* C4F54 800C4354 24040600 */  addiu      $a0, $zero, 0x600
/* C4F58 800C4358 240200FF */  addiu      $v0, $zero, 0xff
/* C4F5C 800C435C A3A20030 */  sb         $v0, 0x30($sp)
/* C4F60 800C4360 24020023 */  addiu      $v0, $zero, 0x23
/* C4F64 800C4364 A3A20031 */  sb         $v0, 0x31($sp)
/* C4F68 800C4368 24020001 */  addiu      $v0, $zero, 1
/* C4F6C 800C436C A3A20032 */  sb         $v0, 0x32($sp)
/* C4F70 800C4370 24020003 */  addiu      $v0, $zero, 3
/* C4F74 800C4374 A3A20033 */  sb         $v0, 0x33($sp)
/* C4F78 800C4378 240200C0 */  addiu      $v0, $zero, 0xc0
/* C4F7C 800C437C 0C030BB4 */  jal        __osContAddressCrc
/* C4F80 800C4380 A3A20034 */   sb        $v0, 0x34($sp)
/* C4F84 800C4384 12200008 */  beqz       $s1, .L800C43A8
/* C4F88 800C4388 A3A20035 */   sb        $v0, 0x35($sp)
/* C4F8C 800C438C 1A200006 */  blez       $s1, .L800C43A8
/* C4F90 800C4390 00001821 */   addu      $v1, $zero, $zero
.L800C4394:
/* C4F94 800C4394 A2000000 */  sb         $zero, ($s0)
/* C4F98 800C4398 24630001 */  addiu      $v1, $v1, 1
/* C4F9C 800C439C 0071102A */  slt        $v0, $v1, $s1
/* C4FA0 800C43A0 1440FFFC */  bnez       $v0, .L800C4394
/* C4FA4 800C43A4 26100001 */   addiu     $s0, $s0, 1
.L800C43A8:
/* C4FA8 800C43A8 27A60030 */  addiu      $a2, $sp, 0x30
/* C4FAC 800C43AC 00D01025 */  or         $v0, $a2, $s0
/* C4FB0 800C43B0 30420003 */  andi       $v0, $v0, 3
/* C4FB4 800C43B4 10400017 */  beqz       $v0, .L800C4414
/* C4FB8 800C43B8 02003821 */   addu      $a3, $s0, $zero
/* C4FBC 800C43BC 27A80050 */  addiu      $t0, $sp, 0x50
.L800C43C0:
/* C4FC0 800C43C0 88C20000 */  lwl        $v0, ($a2)
/* C4FC4 800C43C4 98C20003 */  lwr        $v0, 3($a2)
/* C4FC8 800C43C8 88C30004 */  lwl        $v1, 4($a2)
/* C4FCC 800C43CC 98C30007 */  lwr        $v1, 7($a2)
/* C4FD0 800C43D0 88C40008 */  lwl        $a0, 8($a2)
/* C4FD4 800C43D4 98C4000B */  lwr        $a0, 0xb($a2)
/* C4FD8 800C43D8 88C5000C */  lwl        $a1, 0xc($a2)
/* C4FDC 800C43DC 98C5000F */  lwr        $a1, 0xf($a2)
/* C4FE0 800C43E0 A8E20000 */  swl        $v0, ($a3)
/* C4FE4 800C43E4 B8E20003 */  swr        $v0, 3($a3)
/* C4FE8 800C43E8 A8E30004 */  swl        $v1, 4($a3)
/* C4FEC 800C43EC B8E30007 */  swr        $v1, 7($a3)
/* C4FF0 800C43F0 A8E40008 */  swl        $a0, 8($a3)
/* C4FF4 800C43F4 B8E4000B */  swr        $a0, 0xb($a3)
/* C4FF8 800C43F8 A8E5000C */  swl        $a1, 0xc($a3)
/* C4FFC 800C43FC B8E5000F */  swr        $a1, 0xf($a3)
/* C5000 800C4400 24C60010 */  addiu      $a2, $a2, 0x10
/* C5004 800C4404 14C8FFEE */  bne        $a2, $t0, .L800C43C0
/* C5008 800C4408 24E70010 */   addiu     $a3, $a3, 0x10
/* C500C 800C440C 08031111 */  j          .L800C4444
/* C5010 800C4410 00000000 */   nop
.L800C4414:
/* C5014 800C4414 27A80050 */  addiu      $t0, $sp, 0x50
.L800C4418:
/* C5018 800C4418 8CC20000 */  lw         $v0, ($a2)
/* C501C 800C441C 8CC30004 */  lw         $v1, 4($a2)
/* C5020 800C4420 8CC40008 */  lw         $a0, 8($a2)
/* C5024 800C4424 8CC5000C */  lw         $a1, 0xc($a2)
/* C5028 800C4428 ACE20000 */  sw         $v0, ($a3)
/* C502C 800C442C ACE30004 */  sw         $v1, 4($a3)
/* C5030 800C4430 ACE40008 */  sw         $a0, 8($a3)
/* C5034 800C4434 ACE5000C */  sw         $a1, 0xc($a3)
/* C5038 800C4438 24C60010 */  addiu      $a2, $a2, 0x10
/* C503C 800C443C 14C8FFF6 */  bne        $a2, $t0, .L800C4418
/* C5040 800C4440 24E70010 */   addiu     $a3, $a3, 0x10
.L800C4444:
/* C5044 800C4444 88C20000 */  lwl        $v0, ($a2)
/* C5048 800C4448 98C20003 */  lwr        $v0, 3($a2)
/* C504C 800C444C 80C30004 */  lb         $v1, 4($a2)
/* C5050 800C4450 80C40005 */  lb         $a0, 5($a2)
/* C5054 800C4454 80C50006 */  lb         $a1, 6($a2)
/* C5058 800C4458 A8E20000 */  swl        $v0, ($a3)
/* C505C 800C445C B8E20003 */  swr        $v0, 3($a3)
/* C5060 800C4460 A0E30004 */  sb         $v1, 4($a3)
/* C5064 800C4464 A0E40005 */  sb         $a0, 5($a3)
/* C5068 800C4468 A0E50006 */  sb         $a1, 6($a3)
/* C506C 800C446C 240200FE */  addiu      $v0, $zero, 0xfe
/* C5070 800C4470 A2020027 */  sb         $v0, 0x27($s0)
/* C5074 800C4474 24020008 */  addiu      $v0, $zero, 8
.L800C4478:
/* C5078 800C4478 AE420000 */  sw         $v0, ($s2)
/* C507C 800C447C 00001021 */  addu       $v0, $zero, $zero
.L800C4480:
/* C5080 800C4480 8FBF0070 */  lw         $ra, 0x70($sp)
/* C5084 800C4484 8FB3006C */  lw         $s3, 0x6c($sp)
/* C5088 800C4488 8FB20068 */  lw         $s2, 0x68($sp)
/* C508C 800C448C 8FB10064 */  lw         $s1, 0x64($sp)
/* C5090 800C4490 8FB00060 */  lw         $s0, 0x60($sp)
/* C5094 800C4494 03E00008 */  jr         $ra
/* C5098 800C4498 27BD0078 */   addiu     $sp, $sp, 0x78
/* C509C 800C449C 00000000 */  nop
