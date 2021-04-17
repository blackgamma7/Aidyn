.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel ret0_800a42b0
/* A4EB0 800A42B0 03E00008 */  jr         $ra
/* A4EB4 800A42B4 00001021 */   addu      $v0, $zero, $zero

glabel borg8_func_a
/* A4EB8 800A42B8 94830008 */  lhu        $v1, 8($a0)
/* A4EBC 800A42BC 24020004 */  addiu      $v0, $zero, 4
/* A4EC0 800A42C0 10620003 */  beq        $v1, $v0, .L800A42D0
/* A4EC4 800A42C4 24020007 */   addiu     $v0, $zero, 7
/* A4EC8 800A42C8 54620005 */  bnel       $v1, $v0, .L800A42E0
/* A4ECC 800A42CC AC800010 */   sw        $zero, 0x10($a0)
.L800A42D0:
/* A4ED0 800A42D0 8C820010 */  lw         $v0, 0x10($a0)
/* A4ED4 800A42D4 24420008 */  addiu      $v0, $v0, 8
/* A4ED8 800A42D8 00441021 */  addu       $v0, $v0, $a0
/* A4EDC 800A42DC AC820010 */  sw         $v0, 0x10($a0)
.L800A42E0:
/* A4EE0 800A42E0 8C820014 */  lw         $v0, 0x14($a0)
/* A4EE4 800A42E4 24420008 */  addiu      $v0, $v0, 8
/* A4EE8 800A42E8 00441021 */  addu       $v0, $v0, $a0
/* A4EEC 800A42EC 03E00008 */  jr         $ra
/* A4EF0 800A42F0 AC820014 */   sw        $v0, 0x14($a0)

glabel borg8_free_ofunc
/* A4EF4 800A42F4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A4EF8 800A42F8 AFB00010 */  sw         $s0, 0x10($sp)
/* A4EFC 800A42FC 00808021 */  addu       $s0, $a0, $zero
/* A4F00 800A4300 AFBF0018 */  sw         $ra, 0x18($sp)
/* A4F04 800A4304 0C02608C */  jal        get_memUsed
/* A4F08 800A4308 AFB10014 */   sw        $s1, 0x14($sp)
/* A4F0C 800A430C 00408821 */  addu       $s1, $v0, $zero
/* A4F10 800A4310 8E040000 */  lw         $a0, ($s0)
/* A4F14 800A4314 2402FFFF */  addiu      $v0, $zero, -1
/* A4F18 800A4318 14820007 */  bne        $a0, $v0, .L800A4338
/* A4F1C 800A431C 3C05800E */   lui       $a1, %hi(D_800E3270)
/* A4F20 800A4320 02002021 */  addu       $a0, $s0, $zero
/* A4F24 800A4324 24A53270 */  addiu      $a1, $a1, %lo(D_800E3270)
/* A4F28 800A4328 0C02600C */  jal        Free
/* A4F2C 800A432C 2406008F */   addiu     $a2, $zero, 0x8f
/* A4F30 800A4330 080290D0 */  j          .L800A4340
/* A4F34 800A4334 00000000 */   nop
.L800A4338:
/* A4F38 800A4338 0C028B7F */  jal        dec_borg_count
/* A4F3C 800A433C 00000000 */   nop
.L800A4340:
/* A4F40 800A4340 0C02608C */  jal        get_memUsed
/* A4F44 800A4344 00000000 */   nop
/* A4F48 800A4348 3C06800F */  lui        $a2, %hi(borg_mem)
/* A4F4C 800A434C 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A4F50 800A4350 02221023 */  subu       $v0, $s1, $v0
/* A4F54 800A4354 3C05800F */  lui        $a1, %hi(borg_count)
/* A4F58 800A4358 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A4F5C 800A435C 8CC30020 */  lw         $v1, 0x20($a2)
/* A4F60 800A4360 8CA40020 */  lw         $a0, 0x20($a1)
/* A4F64 800A4364 8FBF0018 */  lw         $ra, 0x18($sp)
/* A4F68 800A4368 8FB10014 */  lw         $s1, 0x14($sp)
/* A4F6C 800A436C 8FB00010 */  lw         $s0, 0x10($sp)
/* A4F70 800A4370 00621823 */  subu       $v1, $v1, $v0
/* A4F74 800A4374 2484FFFF */  addiu      $a0, $a0, -1
/* A4F78 800A4378 ACC30020 */  sw         $v1, 0x20($a2)
/* A4F7C 800A437C ACA40020 */  sw         $a0, 0x20($a1)
/* A4F80 800A4380 03E00008 */  jr         $ra
/* A4F84 800A4384 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_borg_8
/* A4F88 800A4388 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* A4F8C 800A438C AFB00010 */  sw         $s0, 0x10($sp)
/* A4F90 800A4390 AFBF0014 */  sw         $ra, 0x14($sp)
/* A4F94 800A4394 0C028918 */  jal        setBorgFlag
/* A4F98 800A4398 00808021 */   addu      $s0, $a0, $zero
/* A4F9C 800A439C 0C028A22 */  jal        getBorgItem
/* A4FA0 800A43A0 02002021 */   addu      $a0, $s0, $zero
/* A4FA4 800A43A4 8FBF0014 */  lw         $ra, 0x14($sp)
/* A4FA8 800A43A8 8FB00010 */  lw         $s0, 0x10($sp)
/* A4FAC 800A43AC 03E00008 */  jr         $ra
/* A4FB0 800A43B0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel rsp_func
/* A4FB4 800A43B4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* A4FB8 800A43B8 AFBE0030 */  sw         $fp, 0x30($sp)
/* A4FBC 800A43BC 0080F021 */  addu       $fp, $a0, $zero
/* A4FC0 800A43C0 AFBE0000 */  sw         $fp, ($sp)
/* A4FC4 800A43C4 27DE0008 */  addiu      $fp, $fp, 8
/* A4FC8 800A43C8 AFBE0004 */  sw         $fp, 4($sp)
/* A4FCC 800A43CC 27DE0008 */  addiu      $fp, $fp, 8
/* A4FD0 800A43D0 AFB00010 */  sw         $s0, 0x10($sp)
/* A4FD4 800A43D4 3C10E300 */  lui        $s0, 0xe300
/* A4FD8 800A43D8 36100A01 */  ori        $s0, $s0, 0xa01
/* A4FDC 800A43DC AFBE0008 */  sw         $fp, 8($sp)
/* A4FE0 800A43E0 27DE0008 */  addiu      $fp, $fp, 8
/* A4FE4 800A43E4 3C0FE300 */  lui        $t7, 0xe300
/* A4FE8 800A43E8 35EF0800 */  ori        $t7, $t7, 0x800
/* A4FEC 800A43EC AFBE000C */  sw         $fp, 0xc($sp)
/* A4FF0 800A43F0 27DE0008 */  addiu      $fp, $fp, 8
/* A4FF4 800A43F4 3C0EE300 */  lui        $t6, 0xe300
/* A4FF8 800A43F8 35CE1801 */  ori        $t6, $t6, 0x1801
/* A4FFC 800A43FC 03C0C821 */  addu       $t9, $fp, $zero
/* A5000 800A4400 27DE0008 */  addiu      $fp, $fp, 8
/* A5004 800A4404 3C0DE300 */  lui        $t5, 0xe300
/* A5008 800A4408 35AD1A01 */  ori        $t5, $t5, 0x1a01
/* A500C 800A440C 03C0C021 */  addu       $t8, $fp, $zero
/* A5010 800A4410 27DE0008 */  addiu      $fp, $fp, 8
/* A5014 800A4414 3C0CE300 */  lui        $t4, 0xe300
/* A5018 800A4418 358C0C00 */  ori        $t4, $t4, 0xc00
/* A501C 800A441C AFB7002C */  sw         $s7, 0x2c($sp)
/* A5020 800A4420 03C0B821 */  addu       $s7, $fp, $zero
/* A5024 800A4424 27DE0008 */  addiu      $fp, $fp, 8
/* A5028 800A4428 3C0BE300 */  lui        $t3, 0xe300
/* A502C 800A442C 356B0F00 */  ori        $t3, $t3, 0xf00
/* A5030 800A4430 AFB60028 */  sw         $s6, 0x28($sp)
/* A5034 800A4434 03C0B021 */  addu       $s6, $fp, $zero
/* A5038 800A4438 27DE0008 */  addiu      $fp, $fp, 8
/* A503C 800A443C 3C0AE300 */  lui        $t2, 0xe300
/* A5040 800A4440 354A1201 */  ori        $t2, $t2, 0x1201
/* A5044 800A4444 AFB50024 */  sw         $s5, 0x24($sp)
/* A5048 800A4448 03C0A821 */  addu       $s5, $fp, $zero
/* A504C 800A444C 27DE0008 */  addiu      $fp, $fp, 8
/* A5050 800A4450 3C09E300 */  lui        $t1, 0xe300
/* A5054 800A4454 35291402 */  ori        $t1, $t1, 0x1402
/* A5058 800A4458 AFB40020 */  sw         $s4, 0x20($sp)
/* A505C 800A445C 03C0A021 */  addu       $s4, $fp, $zero
/* A5060 800A4460 27DE0008 */  addiu      $fp, $fp, 8
/* A5064 800A4464 3C08E300 */  lui        $t0, 0xe300
/* A5068 800A4468 35080D01 */  ori        $t0, $t0, 0xd01
/* A506C 800A446C AFB20018 */  sw         $s2, 0x18($sp)
/* A5070 800A4470 03C09021 */  addu       $s2, $fp, $zero
/* A5074 800A4474 27DE0008 */  addiu      $fp, $fp, 8
/* A5078 800A4478 3C04E300 */  lui        $a0, 0xe300
/* A507C 800A447C 34841700 */  ori        $a0, $a0, 0x1700
/* A5080 800A4480 AFB10014 */  sw         $s1, 0x14($sp)
/* A5084 800A4484 03C08821 */  addu       $s1, $fp, $zero
/* A5088 800A4488 27DE0008 */  addiu      $fp, $fp, 8
/* A508C 800A448C AFB3001C */  sw         $s3, 0x1c($sp)
/* A5090 800A4490 03C09821 */  addu       $s3, $fp, $zero
/* A5094 800A4494 30C6FFFF */  andi       $a2, $a2, 0xffff
/* A5098 800A4498 3C02800F */  lui        $v0, 0x800f
/* A509C 800A449C 44860000 */  mtc1       $a2, $f0
/* A50A0 800A44A0 46800020 */  cvt.s.w    $f0, $f0
/* A50A4 800A44A4 3C01800E */  lui        $at, %hi(D_800E3288)
/* A50A8 800A44A8 C4223288 */  lwc1       $f2, %lo(D_800E3288)($at)
/* A50AC 800A44AC 30E7FFFF */  andi       $a3, $a3, 0xffff
/* A50B0 800A44B0 46020003 */  div.s      $f0, $f0, $f2
/* A50B4 800A44B4 3C01800E */  lui        $at, %hi(D_800E328C)
/* A50B8 800A44B8 C422328C */  lwc1       $f2, %lo(D_800E328C)($at)
/* A50BC 800A44BC 3C03800F */  lui        $v1, %hi(V_scale)
/* A50C0 800A44C0 E4403520 */  swc1       $f0, 0x3520($v0)
/* A50C4 800A44C4 44870000 */  mtc1       $a3, $f0
/* A50C8 800A44C8 46800020 */  cvt.s.w    $f0, $f0
/* A50CC 800A44CC 46020003 */  div.s      $f0, $f0, $f2
/* A50D0 800A44D0 E4603524 */  swc1       $f0, %lo(V_scale)($v1)
/* A50D4 800A44D4 8FA30000 */  lw         $v1, ($sp)
/* A50D8 800A44D8 3C02E700 */  lui        $v0, 0xe700
/* A50DC 800A44DC AC620000 */  sw         $v0, ($v1)
/* A50E0 800A44E0 AC600004 */  sw         $zero, 4($v1)
/* A50E4 800A44E4 8FA20004 */  lw         $v0, 4($sp)
/* A50E8 800A44E8 27DE0008 */  addiu      $fp, $fp, 8
/* A50EC 800A44EC AC500000 */  sw         $s0, ($v0)
/* A50F0 800A44F0 AC400004 */  sw         $zero, 4($v0)
/* A50F4 800A44F4 8FA30008 */  lw         $v1, 8($sp)
/* A50F8 800A44F8 3C020080 */  lui        $v0, 0x80
/* A50FC 800A44FC AC6F0000 */  sw         $t7, ($v1)
/* A5100 800A4500 AC620004 */  sw         $v0, 4($v1)
/* A5104 800A4504 8FA2000C */  lw         $v0, 0xc($sp)
/* A5108 800A4508 30A5FFFF */  andi       $a1, $a1, 0xffff
/* A510C 800A450C AC4E0000 */  sw         $t6, ($v0)
/* A5110 800A4510 AC400004 */  sw         $zero, 4($v0)
/* A5114 800A4514 24022000 */  addiu      $v0, $zero, 0x2000
/* A5118 800A4518 AF2D0000 */  sw         $t5, ($t9)
/* A511C 800A451C AF200004 */  sw         $zero, 4($t9)
/* A5120 800A4520 AF0C0000 */  sw         $t4, ($t8)
/* A5124 800A4524 AF000004 */  sw         $zero, 4($t8)
/* A5128 800A4528 AEEB0000 */  sw         $t3, ($s7)
/* A512C 800A452C AEE00004 */  sw         $zero, 4($s7)
/* A5130 800A4530 AECA0000 */  sw         $t2, ($s6)
/* A5134 800A4534 AEC20004 */  sw         $v0, 4($s6)
/* A5138 800A4538 24020C00 */  addiu      $v0, $zero, 0xc00
/* A513C 800A453C AEA20004 */  sw         $v0, 4($s5)
/* A5140 800A4540 3C02D900 */  lui        $v0, 0xd900
/* A5144 800A4544 AEA90000 */  sw         $t1, ($s5)
/* A5148 800A4548 AE880000 */  sw         $t0, ($s4)
/* A514C 800A454C AE800004 */  sw         $zero, 4($s4)
/* A5150 800A4550 AE440000 */  sw         $a0, ($s2)
/* A5154 800A4554 AE400004 */  sw         $zero, 4($s2)
/* A5158 800A4558 AE220000 */  sw         $v0, ($s1)
/* A515C 800A455C 3C02D700 */  lui        $v0, 0xd700
/* A5160 800A4560 AE200004 */  sw         $zero, 4($s1)
/* A5164 800A4564 AE620000 */  sw         $v0, ($s3)
/* A5168 800A4568 30A20002 */  andi       $v0, $a1, 2
/* A516C 800A456C 10400008 */  beqz       $v0, .L800A4590
/* A5170 800A4570 AE600004 */   sw        $zero, 4($s3)
/* A5174 800A4574 03C02021 */  addu       $a0, $fp, $zero
/* A5178 800A4578 27DE0008 */  addiu      $fp, $fp, 8
/* A517C 800A457C 3C03E200 */  lui        $v1, 0xe200
/* A5180 800A4580 3463001C */  ori        $v1, $v1, 0x1c
/* A5184 800A4584 3C020050 */  lui        $v0, 0x50
/* A5188 800A4588 0802916A */  j          .L800A45A8
/* A518C 800A458C 34424240 */   ori       $v0, $v0, 0x4240
.L800A4590:
/* A5190 800A4590 03C02021 */  addu       $a0, $fp, $zero
/* A5194 800A4594 27DE0008 */  addiu      $fp, $fp, 8
/* A5198 800A4598 3C03E200 */  lui        $v1, 0xe200
/* A519C 800A459C 3463001C */  ori        $v1, $v1, 0x1c
/* A51A0 800A45A0 3C020F0A */  lui        $v0, 0xf0a
/* A51A4 800A45A4 34424000 */  ori        $v0, $v0, 0x4000
.L800A45A8:
/* A51A8 800A45A8 AC830000 */  sw         $v1, ($a0)
/* A51AC 800A45AC AC820004 */  sw         $v0, 4($a0)
/* A51B0 800A45B0 30A20004 */  andi       $v0, $a1, 4
/* A51B4 800A45B4 10400007 */  beqz       $v0, .L800A45D4
/* A51B8 800A45B8 03C02021 */   addu      $a0, $fp, $zero
/* A51BC 800A45BC 27DE0008 */  addiu      $fp, $fp, 8
/* A51C0 800A45C0 3C03FC11 */  lui        $v1, 0xfc11
/* A51C4 800A45C4 34639623 */  ori        $v1, $v1, 0x9623
/* A51C8 800A45C8 3C02FF2F */  lui        $v0, 0xff2f
/* A51CC 800A45CC 0802917A */  j          .L800A45E8
/* A51D0 800A45D0 3442FFFF */   ori       $v0, $v0, 0xffff
.L800A45D4:
/* A51D4 800A45D4 27DE0008 */  addiu      $fp, $fp, 8
/* A51D8 800A45D8 3C03FCFF */  lui        $v1, 0xfcff
/* A51DC 800A45DC 3463FFFF */  ori        $v1, $v1, 0xffff
/* A51E0 800A45E0 3C02FFFC */  lui        $v0, 0xfffc
/* A51E4 800A45E4 3442F279 */  ori        $v0, $v0, 0xf279
.L800A45E8:
/* A51E8 800A45E8 AC830000 */  sw         $v1, ($a0)
/* A51EC 800A45EC AC820004 */  sw         $v0, 4($a0)
/* A51F0 800A45F0 03C01021 */  addu       $v0, $fp, $zero
/* A51F4 800A45F4 8FBE0030 */  lw         $fp, 0x30($sp)
/* A51F8 800A45F8 8FB7002C */  lw         $s7, 0x2c($sp)
/* A51FC 800A45FC 8FB60028 */  lw         $s6, 0x28($sp)
/* A5200 800A4600 8FB50024 */  lw         $s5, 0x24($sp)
/* A5204 800A4604 8FB40020 */  lw         $s4, 0x20($sp)
/* A5208 800A4608 8FB3001C */  lw         $s3, 0x1c($sp)
/* A520C 800A460C 8FB20018 */  lw         $s2, 0x18($sp)
/* A5210 800A4610 8FB10014 */  lw         $s1, 0x14($sp)
/* A5214 800A4614 8FB00010 */  lw         $s0, 0x10($sp)
/* A5218 800A4618 03E00008 */  jr         $ra
/* A521C 800A461C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel N64BorgImageDraw
/* A5220 800A4620 27BDFF20 */  addiu      $sp, $sp, -0xe0
/* A5224 800A4624 AFB000B8 */  sw         $s0, 0xb8($sp)
/* A5228 800A4628 00808021 */  addu       $s0, $a0, $zero
/* A522C 800A462C 02001821 */  addu       $v1, $s0, $zero
/* A5230 800A4630 26100008 */  addiu      $s0, $s0, 8
/* A5234 800A4634 3C02800F */  lui        $v0, %hi(h_scale)
/* A5238 800A4638 C4463520 */  lwc1       $f6, %lo(h_scale)($v0)
/* A523C 800A463C 3C02800F */  lui        $v0, %hi(V_scale)
/* A5240 800A4640 02004021 */  addu       $t0, $s0, $zero
/* A5244 800A4644 C7A80100 */  lwc1       $f8, 0x100($sp)
/* A5248 800A4648 C7AC0104 */  lwc1       $f12, 0x104($sp)
/* A524C 800A464C C44A3524 */  lwc1       $f10, %lo(V_scale)($v0)
/* A5250 800A4650 AFBE00D8 */  sw         $fp, 0xd8($sp)
/* A5254 800A4654 97BE00F2 */  lhu        $fp, 0xf2($sp)
/* A5258 800A4658 97A200FA */  lhu        $v0, 0xfa($sp)
/* A525C 800A465C 00A07821 */  addu       $t7, $a1, $zero
/* A5260 800A4660 AFBF00DC */  sw         $ra, 0xdc($sp)
/* A5264 800A4664 AFB700D4 */  sw         $s7, 0xd4($sp)
/* A5268 800A4668 AFB600D0 */  sw         $s6, 0xd0($sp)
/* A526C 800A466C AFB500CC */  sw         $s5, 0xcc($sp)
/* A5270 800A4670 AFB400C8 */  sw         $s4, 0xc8($sp)
/* A5274 800A4674 46064202 */  mul.s      $f8, $f8, $f6
/* A5278 800A4678 AFB300C4 */  sw         $s3, 0xc4($sp)
/* A527C 800A467C AFB200C0 */  sw         $s2, 0xc0($sp)
/* A5280 800A4680 AFB100BC */  sw         $s1, 0xbc($sp)
/* A5284 800A4684 8DE40014 */  lw         $a0, 0x14($t7)
/* A5288 800A4688 460A6302 */  mul.s      $f12, $f12, $f10
/* A528C 800A468C 3C01800E */  lui        $at, %hi(D_800E32D4)
/* A5290 800A4690 C42032D4 */  lwc1       $f0, %lo(D_800E32D4)($at)
/* A5294 800A4694 44867000 */  mtc1       $a2, $f14
/* A5298 800A4698 005E9023 */  subu       $s2, $v0, $fp
/* A529C 800A469C 44921000 */  mtc1       $s2, $f2
/* A52A0 800A46A0 468010A0 */  cvt.s.w    $f2, $f2
/* A52A4 800A46A4 46067102 */  mul.s      $f4, $f14, $f6
/* A52A8 800A46A8 AFA40010 */  sw         $a0, 0x10($sp)
/* A52AC 800A46AC 95F5000A */  lhu        $s5, 0xa($t7)
/* A52B0 800A46B0 44877000 */  mtc1       $a3, $f14
/* A52B4 800A46B4 3C02E700 */  lui        $v0, 0xe700
/* A52B8 800A46B8 AC620000 */  sw         $v0, ($v1)
/* A52BC 800A46BC 3C02FA00 */  lui        $v0, 0xfa00
/* A52C0 800A46C0 AC600004 */  sw         $zero, 4($v1)
/* A52C4 800A46C4 460A7182 */  mul.s      $f6, $f14, $f10
/* A52C8 800A46C8 AD020000 */  sw         $v0, ($t0)
/* A52CC 800A46CC 97A500F6 */  lhu        $a1, 0xf6($sp)
/* A52D0 800A46D0 93A2010B */  lbu        $v0, 0x10b($sp)
/* A52D4 800A46D4 93A3010F */  lbu        $v1, 0x10f($sp)
/* A52D8 800A46D8 46081082 */  mul.s      $f2, $f2, $f8
/* A52DC 800A46DC 93A40113 */  lbu        $a0, 0x113($sp)
/* A52E0 800A46E0 00021600 */  sll        $v0, $v0, 0x18
/* A52E4 800A46E4 00031C00 */  sll        $v1, $v1, 0x10
/* A52E8 800A46E8 00431025 */  or         $v0, $v0, $v1
/* A52EC 800A46EC 46002102 */  mul.s      $f4, $f4, $f0
/* A52F0 800A46F0 00042200 */  sll        $a0, $a0, 8
/* A52F4 800A46F4 93A30117 */  lbu        $v1, 0x117($sp)
/* A52F8 800A46F8 00441025 */  or         $v0, $v0, $a0
/* A52FC 800A46FC 00431025 */  or         $v0, $v0, $v1
/* A5300 800A4700 46001082 */  mul.s      $f2, $f2, $f0
/* A5304 800A4704 AD020004 */  sw         $v0, 4($t0)
/* A5308 800A4708 97A300FE */  lhu        $v1, 0xfe($sp)
/* A530C 800A470C 00A0C021 */  addu       $t8, $a1, $zero
/* A5310 800A4710 00652823 */  subu       $a1, $v1, $a1
/* A5314 800A4714 46003182 */  mul.s      $f6, $f6, $f0
/* A5318 800A4718 4600100D */  trunc.w.s  $f0, $f2
/* A531C 800A471C 44140000 */  mfc1       $s4, $f0
/* A5320 800A4720 3C01800E */  lui        $at, %hi(D_800E32D8)
/* A5324 800A4724 C42032D8 */  lwc1       $f0, %lo(D_800E32D8)($at)
/* A5328 800A4728 4600208D */  trunc.w.s  $f2, $f4
/* A532C 800A472C 44191000 */  mfc1       $t9, $f2
/* A5330 800A4730 46080203 */  div.s      $f8, $f0, $f8
/* A5334 800A4734 4600408D */  trunc.w.s  $f2, $f8
/* A5338 800A4738 E7A20014 */  swc1       $f2, 0x14($sp)
/* A533C 800A473C 460C0003 */  div.s      $f0, $f0, $f12
/* A5340 800A4740 95E30008 */  lhu        $v1, 8($t7)
/* A5344 800A4744 4600008D */  trunc.w.s  $f2, $f0
/* A5348 800A4748 E7A20018 */  swc1       $f2, 0x18($sp)
/* A534C 800A474C 2463FFFF */  addiu      $v1, $v1, -1
/* A5350 800A4750 2C620009 */  sltiu      $v0, $v1, 9
/* A5354 800A4754 104007C0 */  beqz       $v0, .L800A6658
/* A5358 800A4758 26100008 */   addiu     $s0, $s0, 8
/* A535C 800A475C 3C02800E */  lui        $v0, %hi(D_800E32E0)
/* A5360 800A4760 244232E0 */  addiu      $v0, $v0, %lo(D_800E32E0)
/* A5364 800A4764 00031880 */  sll        $v1, $v1, 2
/* A5368 800A4768 00621821 */  addu       $v1, $v1, $v0
/* A536C 800A476C 8C640000 */  lw         $a0, ($v1)
/* A5370 800A4770 00800008 */  jr         $a0
/* A5374 800A4774 00000000 */   nop
/* A5378 800A4778 2A420002 */  slti       $v0, $s2, 2
/* A537C 800A477C 10400003 */  beqz       $v0, .L800A478C
/* A5380 800A4780 24020002 */   addiu     $v0, $zero, 2
/* A5384 800A4784 080291E7 */  j          .L800A479C
/* A5388 800A4788 00521023 */   subu      $v0, $v0, $s2
.L800A478C:
/* A538C 800A478C 32430001 */  andi       $v1, $s2, 1
/* A5390 800A4790 14600002 */  bnez       $v1, .L800A479C
/* A5394 800A4794 00431023 */   subu      $v0, $v0, $v1
/* A5398 800A4798 00001021 */  addu       $v0, $zero, $zero
.L800A479C:
/* A539C 800A479C 02421821 */  addu       $v1, $s2, $v0
/* A53A0 800A47A0 00032080 */  sll        $a0, $v1, 2
/* A53A4 800A47A4 24021000 */  addiu      $v0, $zero, 0x1000
/* A53A8 800A47A8 0044001B */  divu       $zero, $v0, $a0
/* A53AC 800A47AC 00001012 */  mflo       $v0
/* A53B0 800A47B0 50800001 */  beql       $a0, $zero, .L800A47B8
/* A53B4 800A47B4 000001CD */   break     0, 7
.L800A47B8:
/* A53B8 800A47B8 244DFFFF */   addiu     $t5, $v0, -1
/* A53BC 800A47BC 00AD001B */  divu       $zero, $a1, $t5
/* A53C0 800A47C0 00001812 */  mflo       $v1
/* A53C4 800A47C4 51A00001 */  beql       $t5, $zero, .L800A47CC
/* A53C8 800A47C8 000001CD */   break     0, 7
.L800A47CC:
/* A53CC 800A47CC 00608821 */   addu      $s1, $v1, $zero
/* A53D0 800A47D0 022D0018 */  mult       $s1, $t5
/* A53D4 800A47D4 00001012 */  mflo       $v0
/* A53D8 800A47D8 00A29823 */  subu       $s3, $a1, $v0
/* A53DC 800A47DC 16600003 */  bnez       $s3, .L800A47EC
/* A53E0 800A47E0 00000000 */   nop
/* A53E4 800A47E4 2631FFFF */  addiu      $s1, $s1, -1
/* A53E8 800A47E8 01A09821 */  addu       $s3, $t5, $zero
.L800A47EC:
/* A53EC 800A47EC 448D1000 */  mtc1       $t5, $f2
/* A53F0 800A47F0 468010A1 */  cvt.d.w    $f2, $f2
/* A53F4 800A47F4 05A10004 */  bgez       $t5, .L800A4808
/* A53F8 800A47F8 02001821 */   addu      $v1, $s0, $zero
/* A53FC 800A47FC 3C01800E */  lui        $at, %hi(D_800E3308)
/* A5400 800A4800 D4203308 */  ldc1       $f0, %lo(D_800E3308)($at)
/* A5404 800A4804 46201080 */  add.d      $f2, $f2, $f0
.L800A4808:
/* A5408 800A4808 26100008 */  addiu      $s0, $s0, 8
/* A540C 800A480C 3C02E300 */  lui        $v0, 0xe300
/* A5410 800A4810 34421001 */  ori        $v0, $v0, 0x1001
/* A5414 800A4814 00007821 */  addu       $t7, $zero, $zero
/* A5418 800A4818 26B5FFFF */  addiu      $s5, $s5, -1
/* A541C 800A481C 27C4FFFF */  addiu      $a0, $fp, -1
/* A5420 800A4820 001EB880 */  sll        $s7, $fp, 2
/* A5424 800A4824 AFA40080 */  sw         $a0, 0x80($sp)
/* A5428 800A4828 2644FFFF */  addiu      $a0, $s2, -1
/* A542C 800A482C 0334A021 */  addu       $s4, $t9, $s4
/* A5430 800A4830 0019CC00 */  sll        $t9, $t9, 0x10
/* A5434 800A4834 44932000 */  mtc1       $s3, $f4
/* A5438 800A4838 46802121 */  cvt.d.w    $f4, $f4
/* A543C 800A483C AFB70088 */  sw         $s7, 0x88($sp)
/* A5440 800A4840 8FB70014 */  lw         $s7, 0x14($sp)
/* A5444 800A4844 46201020 */  cvt.s.d    $f0, $f2
/* A5448 800A4848 AFA4008C */  sw         $a0, 0x8c($sp)
/* A544C 800A484C 8FA40018 */  lw         $a0, 0x18($sp)
/* A5450 800A4850 3C01800E */  lui        $at, %hi(D_800E3310)
/* A5454 800A4854 C4223310 */  lwc1       $f2, %lo(D_800E3310)($at)
/* A5458 800A4858 460C0002 */  mul.s      $f0, $f0, $f12
/* A545C 800A485C AFB50090 */  sw         $s5, 0x90($sp)
/* A5460 800A4860 AFB4007C */  sw         $s4, 0x7c($sp)
/* A5464 800A4864 AFB9009C */  sw         $t9, 0x9c($sp)
/* A5468 800A4868 32F7FFFF */  andi       $s7, $s7, 0xffff
/* A546C 800A486C 3084FFFF */  andi       $a0, $a0, 0xffff
/* A5470 800A4870 AFB700A4 */  sw         $s7, 0xa4($sp)
/* A5474 800A4874 2677FFFF */  addiu      $s7, $s3, -1
/* A5478 800A4878 AFA400A8 */  sw         $a0, 0xa8($sp)
/* A547C 800A487C AFB70094 */  sw         $s7, 0x94($sp)
/* A5480 800A4880 AC620000 */  sw         $v0, ($v1)
/* A5484 800A4884 46020082 */  mul.s      $f2, $f0, $f2
/* A5488 800A4888 122000C7 */  beqz       $s1, .L800A4BA8
/* A548C 800A488C AC600004 */   sw        $zero, 4($v1)
/* A5490 800A4890 32A30FFF */  andi       $v1, $s5, 0xfff
/* A5494 800A4894 3C02FD18 */  lui        $v0, 0xfd18
/* A5498 800A4898 00621825 */  or         $v1, $v1, $v0
/* A549C 800A489C AFA3001C */  sw         $v1, 0x1c($sp)
/* A54A0 800A48A0 3C03F518 */  lui        $v1, 0xf518
/* A54A4 800A48A4 8FA20080 */  lw         $v0, 0x80($sp)
/* A54A8 800A48A8 8FB700A4 */  lw         $s7, 0xa4($sp)
/* A54AC 800A48AC 00522821 */  addu       $a1, $v0, $s2
/* A54B0 800A48B0 00BE1023 */  subu       $v0, $a1, $fp
/* A54B4 800A48B4 00021040 */  sll        $v0, $v0, 1
/* A54B8 800A48B8 24420009 */  addiu      $v0, $v0, 9
/* A54BC 800A48BC 000210C3 */  sra        $v0, $v0, 3
/* A54C0 800A48C0 304201FF */  andi       $v0, $v0, 0x1ff
/* A54C4 800A48C4 00021240 */  sll        $v0, $v0, 9
/* A54C8 800A48C8 00431025 */  or         $v0, $v0, $v1
/* A54CC 800A48CC 00052880 */  sll        $a1, $a1, 2
/* A54D0 800A48D0 30A50FFF */  andi       $a1, $a1, 0xfff
/* A54D4 800A48D4 8FA30088 */  lw         $v1, 0x88($sp)
/* A54D8 800A48D8 0005AB00 */  sll        $s5, $a1, 0xc
/* A54DC 800A48DC AFA200B0 */  sw         $v0, 0xb0($sp)
/* A54E0 800A48E0 000D1080 */  sll        $v0, $t5, 2
/* A54E4 800A48E4 30640FFF */  andi       $a0, $v1, 0xfff
/* A54E8 800A48E8 0004B300 */  sll        $s6, $a0, 0xc
/* A54EC 800A48EC 8FA4008C */  lw         $a0, 0x8c($sp)
/* A54F0 800A48F0 30420FFF */  andi       $v0, $v0, 0xfff
/* A54F4 800A48F4 00041880 */  sll        $v1, $a0, 2
/* A54F8 800A48F8 30630FFF */  andi       $v1, $v1, 0xfff
/* A54FC 800A48FC 00031B00 */  sll        $v1, $v1, 0xc
/* A5500 800A4900 00621825 */  or         $v1, $v1, $v0
/* A5504 800A4904 00142400 */  sll        $a0, $s4, 0x10
/* A5508 800A4908 00042403 */  sra        $a0, $a0, 0x10
/* A550C 800A490C 8FB4009C */  lw         $s4, 0x9c($sp)
/* A5510 800A4910 30820FFF */  andi       $v0, $a0, 0xfff
/* A5514 800A4914 AFA30020 */  sw         $v1, 0x20($sp)
/* A5518 800A4918 8FA300A8 */  lw         $v1, 0xa8($sp)
/* A551C 800A491C 00021300 */  sll        $v0, $v0, 0xc
/* A5520 800A4920 AFA20028 */  sw         $v0, 0x28($sp)
/* A5524 800A4924 00171400 */  sll        $v0, $s7, 0x10
/* A5528 800A4928 AFA40024 */  sw         $a0, 0x24($sp)
/* A552C 800A492C 00431025 */  or         $v0, $v0, $v1
/* A5530 800A4930 AFA2002C */  sw         $v0, 0x2c($sp)
.L800A4934:
/* A5534 800A4934 02001021 */  addu       $v0, $s0, $zero
/* A5538 800A4938 26100008 */  addiu      $s0, $s0, 8
/* A553C 800A493C 02002021 */  addu       $a0, $s0, $zero
/* A5540 800A4940 26100008 */  addiu      $s0, $s0, 8
/* A5544 800A4944 3C030708 */  lui        $v1, 0x708
/* A5548 800A4948 34630200 */  ori        $v1, $v1, 0x200
/* A554C 800A494C 02003821 */  addu       $a3, $s0, $zero
/* A5550 800A4950 26100008 */  addiu      $s0, $s0, 8
/* A5554 800A4954 02004021 */  addu       $t0, $s0, $zero
/* A5558 800A4958 26100008 */  addiu      $s0, $s0, 8
/* A555C 800A495C 02004821 */  addu       $t1, $s0, $zero
/* A5560 800A4960 26100008 */  addiu      $s0, $s0, 8
/* A5564 800A4964 02005021 */  addu       $t2, $s0, $zero
/* A5568 800A4968 26100008 */  addiu      $s0, $s0, 8
/* A556C 800A496C 3C060008 */  lui        $a2, 8
/* A5570 800A4970 34C60200 */  ori        $a2, $a2, 0x200
/* A5574 800A4974 02005821 */  addu       $t3, $s0, $zero
/* A5578 800A4978 26100008 */  addiu      $s0, $s0, 8
/* A557C 800A497C 02006021 */  addu       $t4, $s0, $zero
/* A5580 800A4980 26100008 */  addiu      $s0, $s0, 8
/* A5584 800A4984 030D2821 */  addu       $a1, $t8, $t5
/* A5588 800A4988 8FB7001C */  lw         $s7, 0x1c($sp)
/* A558C 800A498C 00A0C821 */  addu       $t9, $a1, $zero
/* A5590 800A4990 AC570000 */  sw         $s7, ($v0)
/* A5594 800A4994 8FB70010 */  lw         $s7, 0x10($sp)
/* A5598 800A4998 00052880 */  sll        $a1, $a1, 2
/* A559C 800A499C AC570004 */  sw         $s7, 4($v0)
/* A55A0 800A49A0 8FA200B0 */  lw         $v0, 0xb0($sp)
/* A55A4 800A49A4 30A50FFF */  andi       $a1, $a1, 0xfff
/* A55A8 800A49A8 AC830004 */  sw         $v1, 4($a0)
/* A55AC 800A49AC 3C03E700 */  lui        $v1, 0xe700
/* A55B0 800A49B0 3C17F200 */  lui        $s7, 0xf200
/* A55B4 800A49B4 AC820000 */  sw         $v0, ($a0)
/* A55B8 800A49B8 3C02E600 */  lui        $v0, 0xe600
/* A55BC 800A49BC 00182080 */  sll        $a0, $t8, 2
/* A55C0 800A49C0 30840FFF */  andi       $a0, $a0, 0xfff
/* A55C4 800A49C4 ACE20000 */  sw         $v0, ($a3)
/* A55C8 800A49C8 3C02F400 */  lui        $v0, 0xf400
/* A55CC 800A49CC 00821025 */  or         $v0, $a0, $v0
/* A55D0 800A49D0 02C21025 */  or         $v0, $s6, $v0
/* A55D4 800A49D4 ACE00004 */  sw         $zero, 4($a3)
/* A55D8 800A49D8 AD020000 */  sw         $v0, ($t0)
/* A55DC 800A49DC 3C020700 */  lui        $v0, 0x700
/* A55E0 800A49E0 00A21025 */  or         $v0, $a1, $v0
/* A55E4 800A49E4 02A21025 */  or         $v0, $s5, $v0
/* A55E8 800A49E8 00972025 */  or         $a0, $a0, $s7
/* A55EC 800A49EC 02C42025 */  or         $a0, $s6, $a0
/* A55F0 800A49F0 AD020004 */  sw         $v0, 4($t0)
/* A55F4 800A49F4 AD230000 */  sw         $v1, ($t1)
/* A55F8 800A49F8 AD200004 */  sw         $zero, 4($t1)
/* A55FC 800A49FC 8FA300B0 */  lw         $v1, 0xb0($sp)
/* A5600 800A4A00 02A52825 */  or         $a1, $s5, $a1
/* A5604 800A4A04 AD460004 */  sw         $a2, 4($t2)
/* A5608 800A4A08 AD430000 */  sw         $v1, ($t2)
/* A560C 800A4A0C AD640000 */  sw         $a0, ($t3)
/* A5610 800A4A10 AD650004 */  sw         $a1, 4($t3)
/* A5614 800A4A14 AD970000 */  sw         $s7, ($t4)
/* A5618 800A4A18 8FA20020 */  lw         $v0, 0x20($sp)
/* A561C 800A4A1C 02007021 */  addu       $t6, $s0, $zero
/* A5620 800A4A20 AD820004 */  sw         $v0, 4($t4)
/* A5624 800A4A24 8FA30024 */  lw         $v1, 0x24($sp)
/* A5628 800A4A28 18600005 */  blez       $v1, .L800A4A40
/* A562C 800A4A2C 26100008 */   addiu     $s0, $s0, 8
/* A5630 800A4A30 8FA40028 */  lw         $a0, 0x28($sp)
/* A5634 800A4A34 3C02E400 */  lui        $v0, 0xe400
/* A5638 800A4A38 08029291 */  j          .L800A4A44
/* A563C 800A4A3C 00821025 */   or        $v0, $a0, $v0
.L800A4A40:
/* A5640 800A4A40 3C02E400 */  lui        $v0, 0xe400
.L800A4A44:
/* A5644 800A4A44 46023000 */  add.s      $f0, $f6, $f2
/* A5648 800A4A48 00401821 */  addu       $v1, $v0, $zero
/* A564C 800A4A4C 4600020D */  trunc.w.s  $f8, $f0
/* A5650 800A4A50 44024000 */  mfc1       $v0, $f8
/* A5654 800A4A54 00021400 */  sll        $v0, $v0, 0x10
/* A5658 800A4A58 00021403 */  sra        $v0, $v0, 0x10
/* A565C 800A4A5C 18400002 */  blez       $v0, .L800A4A68
/* A5660 800A4A60 30420FFF */   andi      $v0, $v0, 0xfff
/* A5664 800A4A64 00621825 */  or         $v1, $v1, $v0
.L800A4A68:
/* A5668 800A4A68 00141403 */  sra        $v0, $s4, 0x10
/* A566C 800A4A6C 18400004 */  blez       $v0, .L800A4A80
/* A5670 800A4A70 ADC30000 */   sw        $v1, ($t6)
/* A5674 800A4A74 30420FFF */  andi       $v0, $v0, 0xfff
/* A5678 800A4A78 080292A1 */  j          .L800A4A84
/* A567C 800A4A7C 00021300 */   sll       $v0, $v0, 0xc
.L800A4A80:
/* A5680 800A4A80 00001021 */  addu       $v0, $zero, $zero
.L800A4A84:
/* A5684 800A4A84 00401821 */  addu       $v1, $v0, $zero
/* A5688 800A4A88 4600300D */  trunc.w.s  $f0, $f6
/* A568C 800A4A8C 44020000 */  mfc1       $v0, $f0
/* A5690 800A4A90 00021400 */  sll        $v0, $v0, 0x10
/* A5694 800A4A94 00021403 */  sra        $v0, $v0, 0x10
/* A5698 800A4A98 18400002 */  blez       $v0, .L800A4AA4
/* A569C 800A4A9C 30420FFF */   andi      $v0, $v0, 0xfff
/* A56A0 800A4AA0 00621825 */  or         $v1, $v1, $v0
.L800A4AA4:
/* A56A4 800A4AA4 02003021 */  addu       $a2, $s0, $zero
/* A56A8 800A4AA8 26100008 */  addiu      $s0, $s0, 8
/* A56AC 800A4AAC 3C02E100 */  lui        $v0, 0xe100
/* A56B0 800A4AB0 ADC30004 */  sw         $v1, 4($t6)
/* A56B4 800A4AB4 00141C03 */  sra        $v1, $s4, 0x10
/* A56B8 800A4AB8 04610014 */  bgez       $v1, .L800A4B0C
/* A56BC 800A4ABC ACC20000 */   sw        $v0, ($a2)
/* A56C0 800A4AC0 8FB70014 */  lw         $s7, 0x14($sp)
/* A56C4 800A4AC4 00171400 */  sll        $v0, $s7, 0x10
/* A56C8 800A4AC8 00021403 */  sra        $v0, $v0, 0x10
/* A56CC 800A4ACC 00620018 */  mult       $v1, $v0
/* A56D0 800A4AD0 04410007 */  bgez       $v0, .L800A4AF0
/* A56D4 800A4AD4 00000000 */   nop
/* A56D8 800A4AD8 00001012 */  mflo       $v0
/* A56DC 800A4ADC 000211C3 */  sra        $v0, $v0, 7
/* A56E0 800A4AE0 04410008 */  bgez       $v0, .L800A4B04
/* A56E4 800A4AE4 00021023 */   negu      $v0, $v0
/* A56E8 800A4AE8 080292C0 */  j          .L800A4B00
/* A56EC 800A4AEC 00001021 */   addu      $v0, $zero, $zero
.L800A4AF0:
/* A56F0 800A4AF0 00001012 */  mflo       $v0
/* A56F4 800A4AF4 000211C3 */  sra        $v0, $v0, 7
/* A56F8 800A4AF8 5C400001 */  bgtzl      $v0, .L800A4B00
/* A56FC 800A4AFC 00001021 */   addu      $v0, $zero, $zero
.L800A4B00:
/* A5700 800A4B00 00021023 */  negu       $v0, $v0
.L800A4B04:
/* A5704 800A4B04 080292C4 */  j          .L800A4B10
/* A5708 800A4B08 00022C00 */   sll       $a1, $v0, 0x10
.L800A4B0C:
/* A570C 800A4B0C 00002821 */  addu       $a1, $zero, $zero
.L800A4B10:
/* A5710 800A4B10 4600300D */  trunc.w.s  $f0, $f6
/* A5714 800A4B14 44030000 */  mfc1       $v1, $f0
/* A5718 800A4B18 04630017 */  bgezl      $v1, .L800A4B78
/* A571C 800A4B1C 00A01821 */   addu      $v1, $a1, $zero
/* A5720 800A4B20 8FA40018 */  lw         $a0, 0x18($sp)
/* A5724 800A4B24 00041400 */  sll        $v0, $a0, 0x10
/* A5728 800A4B28 00022403 */  sra        $a0, $v0, 0x10
/* A572C 800A4B2C 04810009 */  bgez       $a0, .L800A4B54
/* A5730 800A4B30 00031400 */   sll       $v0, $v1, 0x10
/* A5734 800A4B34 00021403 */  sra        $v0, $v0, 0x10
/* A5738 800A4B38 00440018 */  mult       $v0, $a0
/* A573C 800A4B3C 00001012 */  mflo       $v0
/* A5740 800A4B40 000211C3 */  sra        $v0, $v0, 7
/* A5744 800A4B44 0441000A */  bgez       $v0, .L800A4B70
/* A5748 800A4B48 00021023 */   negu      $v0, $v0
/* A574C 800A4B4C 080292DB */  j          .L800A4B6C
/* A5750 800A4B50 00001021 */   addu      $v0, $zero, $zero
.L800A4B54:
/* A5754 800A4B54 00021403 */  sra        $v0, $v0, 0x10
/* A5758 800A4B58 00440018 */  mult       $v0, $a0
/* A575C 800A4B5C 00001012 */  mflo       $v0
/* A5760 800A4B60 000211C3 */  sra        $v0, $v0, 7
/* A5764 800A4B64 5C400001 */  bgtzl      $v0, .L800A4B6C
/* A5768 800A4B68 00001021 */   addu      $v0, $zero, $zero
.L800A4B6C:
/* A576C 800A4B6C 00021023 */  negu       $v0, $v0
.L800A4B70:
/* A5770 800A4B70 3042FFFF */  andi       $v0, $v0, 0xffff
/* A5774 800A4B74 00A21825 */  or         $v1, $a1, $v0
.L800A4B78:
/* A5778 800A4B78 02001021 */  addu       $v0, $s0, $zero
/* A577C 800A4B7C 26100008 */  addiu      $s0, $s0, 8
/* A5780 800A4B80 0320C021 */  addu       $t8, $t9, $zero
/* A5784 800A4B84 25EF0001 */  addiu      $t7, $t7, 1
/* A5788 800A4B88 ACC30004 */  sw         $v1, 4($a2)
/* A578C 800A4B8C 3C03F100 */  lui        $v1, 0xf100
/* A5790 800A4B90 AC430000 */  sw         $v1, ($v0)
/* A5794 800A4B94 8FA3002C */  lw         $v1, 0x2c($sp)
/* A5798 800A4B98 AC430004 */  sw         $v1, 4($v0)
/* A579C 800A4B9C 01F1182B */  sltu       $v1, $t7, $s1
/* A57A0 800A4BA0 1460FF64 */  bnez       $v1, .L800A4934
/* A57A4 800A4BA4 46023180 */   add.s     $f6, $f6, $f2
.L800A4BA8:
/* A57A8 800A4BA8 06610004 */  bgez       $s3, .L800A4BBC
/* A57AC 800A4BAC 46202006 */   mov.d     $f0, $f4
/* A57B0 800A4BB0 3C01800E */  lui        $at, %hi(D_800E3318)
/* A57B4 800A4BB4 D4203318 */  ldc1       $f0, %lo(D_800E3318)($at)
/* A57B8 800A4BB8 46202000 */  add.d      $f0, $f4, $f0
.L800A4BBC:
/* A57BC 800A4BBC 02002821 */  addu       $a1, $s0, $zero
/* A57C0 800A4BC0 26100008 */  addiu      $s0, $s0, 8
/* A57C4 800A4BC4 02004021 */  addu       $t0, $s0, $zero
/* A57C8 800A4BC8 26100008 */  addiu      $s0, $s0, 8
/* A57CC 800A4BCC 3C040708 */  lui        $a0, 0x708
/* A57D0 800A4BD0 34840200 */  ori        $a0, $a0, 0x200
/* A57D4 800A4BD4 02003821 */  addu       $a3, $s0, $zero
/* A57D8 800A4BD8 26100008 */  addiu      $s0, $s0, 8
/* A57DC 800A4BDC 02005021 */  addu       $t2, $s0, $zero
/* A57E0 800A4BE0 26100008 */  addiu      $s0, $s0, 8
/* A57E4 800A4BE4 02005821 */  addu       $t3, $s0, $zero
/* A57E8 800A4BE8 26100008 */  addiu      $s0, $s0, 8
/* A57EC 800A4BEC 02006021 */  addu       $t4, $s0, $zero
/* A57F0 800A4BF0 26100008 */  addiu      $s0, $s0, 8
/* A57F4 800A4BF4 3C090008 */  lui        $t1, 8
/* A57F8 800A4BF8 35290200 */  ori        $t1, $t1, 0x200
/* A57FC 800A4BFC 02006821 */  addu       $t5, $s0, $zero
/* A5800 800A4C00 26100008 */  addiu      $s0, $s0, 8
/* A5804 800A4C04 02007021 */  addu       $t6, $s0, $zero
/* A5808 800A4C08 26100008 */  addiu      $s0, $s0, 8
/* A580C 800A4C0C 02007821 */  addu       $t7, $s0, $zero
/* A5810 800A4C10 3C03FD18 */  lui        $v1, 0xfd18
/* A5814 800A4C14 46200020 */  cvt.s.d    $f0, $f0
/* A5818 800A4C18 8FB70090 */  lw         $s7, 0x90($sp)
/* A581C 800A4C1C 3C01800E */  lui        $at, %hi(D_800E3320)
/* A5820 800A4C20 C4223320 */  lwc1       $f2, %lo(D_800E3320)($at)
/* A5824 800A4C24 32E20FFF */  andi       $v0, $s7, 0xfff
/* A5828 800A4C28 00431025 */  or         $v0, $v0, $v1
/* A582C 800A4C2C ACA20000 */  sw         $v0, ($a1)
/* A5830 800A4C30 8FA20010 */  lw         $v0, 0x10($sp)
/* A5834 800A4C34 460C0002 */  mul.s      $f0, $f0, $f12
/* A5838 800A4C38 ACA20004 */  sw         $v0, 4($a1)
/* A583C 800A4C3C 8FA30080 */  lw         $v1, 0x80($sp)
/* A5840 800A4C40 3C02F518 */  lui        $v0, 0xf518
/* A5844 800A4C44 AD040004 */  sw         $a0, 4($t0)
/* A5848 800A4C48 00723021 */  addu       $a2, $v1, $s2
/* A584C 800A4C4C 00DE2823 */  subu       $a1, $a2, $fp
/* A5850 800A4C50 00052840 */  sll        $a1, $a1, 1
/* A5854 800A4C54 24A50009 */  addiu      $a1, $a1, 9
/* A5858 800A4C58 000528C3 */  sra        $a1, $a1, 3
/* A585C 800A4C5C 30A501FF */  andi       $a1, $a1, 0x1ff
/* A5860 800A4C60 00052A40 */  sll        $a1, $a1, 9
/* A5864 800A4C64 00A22825 */  or         $a1, $a1, $v0
/* A5868 800A4C68 3C02E600 */  lui        $v0, 0xe600
/* A586C 800A4C6C AD050000 */  sw         $a1, ($t0)
/* A5870 800A4C70 ACE20000 */  sw         $v0, ($a3)
/* A5874 800A4C74 ACE00004 */  sw         $zero, 4($a3)
/* A5878 800A4C78 00183880 */  sll        $a3, $t8, 2
/* A587C 800A4C7C 30E70FFF */  andi       $a3, $a3, 0xfff
/* A5880 800A4C80 3C02F400 */  lui        $v0, 0xf400
/* A5884 800A4C84 00E21025 */  or         $v0, $a3, $v0
/* A5888 800A4C88 00063080 */  sll        $a2, $a2, 2
/* A588C 800A4C8C 30C60FFF */  andi       $a2, $a2, 0xfff
/* A5890 800A4C90 00063300 */  sll        $a2, $a2, 0xc
/* A5894 800A4C94 8FA40088 */  lw         $a0, 0x88($sp)
/* A5898 800A4C98 3C03E700 */  lui        $v1, 0xe700
/* A589C 800A4C9C 30880FFF */  andi       $t0, $a0, 0xfff
/* A58A0 800A4CA0 00084300 */  sll        $t0, $t0, 0xc
/* A58A4 800A4CA4 01021025 */  or         $v0, $t0, $v0
/* A58A8 800A4CA8 2704FFFF */  addiu      $a0, $t8, -1
/* A58AC 800A4CAC 00932021 */  addu       $a0, $a0, $s3
/* A58B0 800A4CB0 00042080 */  sll        $a0, $a0, 2
/* A58B4 800A4CB4 30840FFF */  andi       $a0, $a0, 0xfff
/* A58B8 800A4CB8 AD420000 */  sw         $v0, ($t2)
/* A58BC 800A4CBC 3C020700 */  lui        $v0, 0x700
/* A58C0 800A4CC0 00821025 */  or         $v0, $a0, $v0
/* A58C4 800A4CC4 00C21025 */  or         $v0, $a2, $v0
/* A58C8 800A4CC8 AD420004 */  sw         $v0, 4($t2)
/* A58CC 800A4CCC 3C02F200 */  lui        $v0, 0xf200
/* A58D0 800A4CD0 00E23825 */  or         $a3, $a3, $v0
/* A58D4 800A4CD4 01074025 */  or         $t0, $t0, $a3
/* A58D8 800A4CD8 00C43025 */  or         $a2, $a2, $a0
/* A58DC 800A4CDC AD630000 */  sw         $v1, ($t3)
/* A58E0 800A4CE0 AD600004 */  sw         $zero, 4($t3)
/* A58E4 800A4CE4 AD850000 */  sw         $a1, ($t4)
/* A58E8 800A4CE8 AD890004 */  sw         $t1, 4($t4)
/* A58EC 800A4CEC ADA80000 */  sw         $t0, ($t5)
/* A58F0 800A4CF0 ADA60004 */  sw         $a2, 4($t5)
/* A58F4 800A4CF4 ADC20000 */  sw         $v0, ($t6)
/* A58F8 800A4CF8 8FB7008C */  lw         $s7, 0x8c($sp)
/* A58FC 800A4CFC 8FA40094 */  lw         $a0, 0x94($sp)
/* A5900 800A4D00 00171080 */  sll        $v0, $s7, 2
/* A5904 800A4D04 30420FFF */  andi       $v0, $v0, 0xfff
/* A5908 800A4D08 00021300 */  sll        $v0, $v0, 0xc
/* A590C 800A4D0C 00041880 */  sll        $v1, $a0, 2
/* A5910 800A4D10 30630FFF */  andi       $v1, $v1, 0xfff
/* A5914 800A4D14 00431025 */  or         $v0, $v0, $v1
/* A5918 800A4D18 ADC20004 */  sw         $v0, 4($t6)
/* A591C 800A4D1C 8FB7007C */  lw         $s7, 0x7c($sp)
/* A5920 800A4D20 46020082 */  mul.s      $f2, $f0, $f2
/* A5924 800A4D24 00171400 */  sll        $v0, $s7, 0x10
/* A5928 800A4D28 00021403 */  sra        $v0, $v0, 0x10
/* A592C 800A4D2C 18400006 */  blez       $v0, .L800A4D48
/* A5930 800A4D30 26100008 */   addiu     $s0, $s0, 8
/* A5934 800A4D34 30420FFF */  andi       $v0, $v0, 0xfff
/* A5938 800A4D38 00021300 */  sll        $v0, $v0, 0xc
/* A593C 800A4D3C 3C03E400 */  lui        $v1, 0xe400
/* A5940 800A4D40 08029353 */  j          .L800A4D4C
/* A5944 800A4D44 00431025 */   or        $v0, $v0, $v1
.L800A4D48:
/* A5948 800A4D48 3C02E400 */  lui        $v0, 0xe400
.L800A4D4C:
/* A594C 800A4D4C 46023000 */  add.s      $f0, $f6, $f2
/* A5950 800A4D50 00402021 */  addu       $a0, $v0, $zero
/* A5954 800A4D54 4600008D */  trunc.w.s  $f2, $f0
/* A5958 800A4D58 44021000 */  mfc1       $v0, $f2
/* A595C 800A4D5C 00021400 */  sll        $v0, $v0, 0x10
/* A5960 800A4D60 00021403 */  sra        $v0, $v0, 0x10
/* A5964 800A4D64 18400002 */  blez       $v0, .L800A4D70
/* A5968 800A4D68 30420FFF */   andi      $v0, $v0, 0xfff
/* A596C 800A4D6C 00822025 */  or         $a0, $a0, $v0
.L800A4D70:
/* A5970 800A4D70 ADE40000 */  sw         $a0, ($t7)
/* A5974 800A4D74 8FA4009C */  lw         $a0, 0x9c($sp)
/* A5978 800A4D78 00041403 */  sra        $v0, $a0, 0x10
/* A597C 800A4D7C 18400003 */  blez       $v0, .L800A4D8C
/* A5980 800A4D80 30420FFF */   andi      $v0, $v0, 0xfff
/* A5984 800A4D84 08029364 */  j          .L800A4D90
/* A5988 800A4D88 00021300 */   sll       $v0, $v0, 0xc
.L800A4D8C:
/* A598C 800A4D8C 00001021 */  addu       $v0, $zero, $zero
.L800A4D90:
/* A5990 800A4D90 00401821 */  addu       $v1, $v0, $zero
/* A5994 800A4D94 4600300D */  trunc.w.s  $f0, $f6
/* A5998 800A4D98 44020000 */  mfc1       $v0, $f0
/* A599C 800A4D9C 00021400 */  sll        $v0, $v0, 0x10
/* A59A0 800A4DA0 00021403 */  sra        $v0, $v0, 0x10
/* A59A4 800A4DA4 18400002 */  blez       $v0, .L800A4DB0
/* A59A8 800A4DA8 30420FFF */   andi      $v0, $v0, 0xfff
/* A59AC 800A4DAC 00621825 */  or         $v1, $v1, $v0
.L800A4DB0:
/* A59B0 800A4DB0 02003021 */  addu       $a2, $s0, $zero
/* A59B4 800A4DB4 3C02E100 */  lui        $v0, 0xe100
/* A59B8 800A4DB8 ADE30004 */  sw         $v1, 4($t7)
/* A59BC 800A4DBC ACC20000 */  sw         $v0, ($a2)
/* A59C0 800A4DC0 8FB7009C */  lw         $s7, 0x9c($sp)
/* A59C4 800A4DC4 00171C03 */  sra        $v1, $s7, 0x10
/* A59C8 800A4DC8 04610014 */  bgez       $v1, .L800A4E1C
/* A59CC 800A4DCC 26100008 */   addiu     $s0, $s0, 8
/* A59D0 800A4DD0 8FA40014 */  lw         $a0, 0x14($sp)
/* A59D4 800A4DD4 00041400 */  sll        $v0, $a0, 0x10
/* A59D8 800A4DD8 00021403 */  sra        $v0, $v0, 0x10
/* A59DC 800A4DDC 00620018 */  mult       $v1, $v0
/* A59E0 800A4DE0 04410007 */  bgez       $v0, .L800A4E00
/* A59E4 800A4DE4 00000000 */   nop
/* A59E8 800A4DE8 00001012 */  mflo       $v0
/* A59EC 800A4DEC 000211C3 */  sra        $v0, $v0, 7
/* A59F0 800A4DF0 04410008 */  bgez       $v0, .L800A4E14
/* A59F4 800A4DF4 00021023 */   negu      $v0, $v0
/* A59F8 800A4DF8 08029384 */  j          .L800A4E10
/* A59FC 800A4DFC 00001021 */   addu      $v0, $zero, $zero
.L800A4E00:
/* A5A00 800A4E00 00001012 */  mflo       $v0
/* A5A04 800A4E04 000211C3 */  sra        $v0, $v0, 7
/* A5A08 800A4E08 5C400001 */  bgtzl      $v0, .L800A4E10
/* A5A0C 800A4E0C 00001021 */   addu      $v0, $zero, $zero
.L800A4E10:
/* A5A10 800A4E10 00021023 */  negu       $v0, $v0
.L800A4E14:
/* A5A14 800A4E14 08029388 */  j          .L800A4E20
/* A5A18 800A4E18 00022C00 */   sll       $a1, $v0, 0x10
.L800A4E1C:
/* A5A1C 800A4E1C 00002821 */  addu       $a1, $zero, $zero
.L800A4E20:
/* A5A20 800A4E20 4600300D */  trunc.w.s  $f0, $f6
/* A5A24 800A4E24 44030000 */  mfc1       $v1, $f0
/* A5A28 800A4E28 04610600 */  bgez       $v1, .L800A662C
/* A5A2C 800A4E2C 00A01021 */   addu      $v0, $a1, $zero
/* A5A30 800A4E30 8FA40018 */  lw         $a0, 0x18($sp)
/* A5A34 800A4E34 00041400 */  sll        $v0, $a0, 0x10
/* A5A38 800A4E38 00022403 */  sra        $a0, $v0, 0x10
/* A5A3C 800A4E3C 048105F2 */  bgez       $a0, .L800A6608
/* A5A40 800A4E40 00031400 */   sll       $v0, $v1, 0x10
/* A5A44 800A4E44 00021403 */  sra        $v0, $v0, 0x10
/* A5A48 800A4E48 00440018 */  mult       $v0, $a0
/* A5A4C 800A4E4C 00001012 */  mflo       $v0
/* A5A50 800A4E50 000211C3 */  sra        $v0, $v0, 7
/* A5A54 800A4E54 044305F3 */  bgezl      $v0, .L800A6624
/* A5A58 800A4E58 00021023 */   negu      $v0, $v0
/* A5A5C 800A4E5C 08029988 */  j          .L800A6620
/* A5A60 800A4E60 00001021 */   addu      $v0, $zero, $zero
/* A5A64 800A4E64 2A420004 */  slti       $v0, $s2, 4
/* A5A68 800A4E68 10400003 */  beqz       $v0, .L800A4E78
/* A5A6C 800A4E6C 24020004 */   addiu     $v0, $zero, 4
/* A5A70 800A4E70 080293A2 */  j          .L800A4E88
/* A5A74 800A4E74 00521023 */   subu      $v0, $v0, $s2
.L800A4E78:
/* A5A78 800A4E78 32430003 */  andi       $v1, $s2, 3
/* A5A7C 800A4E7C 14600002 */  bnez       $v1, .L800A4E88
/* A5A80 800A4E80 00431023 */   subu      $v0, $v0, $v1
/* A5A84 800A4E84 00001021 */  addu       $v0, $zero, $zero
.L800A4E88:
/* A5A88 800A4E88 02421821 */  addu       $v1, $s2, $v0
/* A5A8C 800A4E8C 00032040 */  sll        $a0, $v1, 1
/* A5A90 800A4E90 24021000 */  addiu      $v0, $zero, 0x1000
/* A5A94 800A4E94 0044001B */  divu       $zero, $v0, $a0
/* A5A98 800A4E98 00001012 */  mflo       $v0
/* A5A9C 800A4E9C 50800001 */  beql       $a0, $zero, .L800A4EA4
/* A5AA0 800A4EA0 000001CD */   break     0, 7
.L800A4EA4:
/* A5AA4 800A4EA4 244DFFFF */   addiu     $t5, $v0, -1
/* A5AA8 800A4EA8 00AD001B */  divu       $zero, $a1, $t5
/* A5AAC 800A4EAC 00001812 */  mflo       $v1
/* A5AB0 800A4EB0 51A00001 */  beql       $t5, $zero, .L800A4EB8
/* A5AB4 800A4EB4 000001CD */   break     0, 7
.L800A4EB8:
/* A5AB8 800A4EB8 00608821 */   addu      $s1, $v1, $zero
/* A5ABC 800A4EBC 022D0018 */  mult       $s1, $t5
/* A5AC0 800A4EC0 00001012 */  mflo       $v0
/* A5AC4 800A4EC4 00A29823 */  subu       $s3, $a1, $v0
/* A5AC8 800A4EC8 16600003 */  bnez       $s3, .L800A4ED8
/* A5ACC 800A4ECC 00000000 */   nop
/* A5AD0 800A4ED0 2631FFFF */  addiu      $s1, $s1, -1
/* A5AD4 800A4ED4 01A09821 */  addu       $s3, $t5, $zero
.L800A4ED8:
/* A5AD8 800A4ED8 448D1000 */  mtc1       $t5, $f2
/* A5ADC 800A4EDC 468010A1 */  cvt.d.w    $f2, $f2
/* A5AE0 800A4EE0 05A30005 */  bgezl      $t5, .L800A4EF8
/* A5AE4 800A4EE4 46201020 */   cvt.s.d   $f0, $f2
/* A5AE8 800A4EE8 3C01800E */  lui        $at, %hi(D_800E3328)
/* A5AEC 800A4EEC D4203328 */  ldc1       $f0, %lo(D_800E3328)($at)
/* A5AF0 800A4EF0 46201080 */  add.d      $f2, $f2, $f0
/* A5AF4 800A4EF4 46201020 */  cvt.s.d    $f0, $f2
.L800A4EF8:
/* A5AF8 800A4EF8 460C0002 */  mul.s      $f0, $f0, $f12
/* A5AFC 800A4EFC 24020002 */  addiu      $v0, $zero, 2
/* A5B00 800A4F00 3C01800E */  lui        $at, %hi(D_800E3330)
/* A5B04 800A4F04 C4223330 */  lwc1       $f2, %lo(D_800E3330)($at)
/* A5B08 800A4F08 95E30008 */  lhu        $v1, 8($t7)
/* A5B0C 800A4F0C 46020082 */  mul.s      $f2, $f0, $f2
/* A5B10 800A4F10 14620002 */  bne        $v1, $v0, .L800A4F1C
/* A5B14 800A4F14 240E0003 */   addiu     $t6, $zero, 3
/* A5B18 800A4F18 00007021 */  addu       $t6, $zero, $zero
.L800A4F1C:
/* A5B1C 800A4F1C 02001821 */  addu       $v1, $s0, $zero
/* A5B20 800A4F20 26100008 */  addiu      $s0, $s0, 8
/* A5B24 800A4F24 3C02E300 */  lui        $v0, 0xe300
/* A5B28 800A4F28 34421001 */  ori        $v0, $v0, 0x1001
/* A5B2C 800A4F2C 00007821 */  addu       $t7, $zero, $zero
/* A5B30 800A4F30 26B5FFFF */  addiu      $s5, $s5, -1
/* A5B34 800A4F34 27C4FFFF */  addiu      $a0, $fp, -1
/* A5B38 800A4F38 001EB880 */  sll        $s7, $fp, 2
/* A5B3C 800A4F3C AFA40080 */  sw         $a0, 0x80($sp)
/* A5B40 800A4F40 2644FFFF */  addiu      $a0, $s2, -1
/* A5B44 800A4F44 0334A021 */  addu       $s4, $t9, $s4
/* A5B48 800A4F48 0019CC00 */  sll        $t9, $t9, 0x10
/* A5B4C 800A4F4C AFB70088 */  sw         $s7, 0x88($sp)
/* A5B50 800A4F50 8FB70014 */  lw         $s7, 0x14($sp)
/* A5B54 800A4F54 44932000 */  mtc1       $s3, $f4
/* A5B58 800A4F58 46802121 */  cvt.d.w    $f4, $f4
/* A5B5C 800A4F5C AFA4008C */  sw         $a0, 0x8c($sp)
/* A5B60 800A4F60 8FA40018 */  lw         $a0, 0x18($sp)
/* A5B64 800A4F64 31CE0007 */  andi       $t6, $t6, 7
/* A5B68 800A4F68 AFB50090 */  sw         $s5, 0x90($sp)
/* A5B6C 800A4F6C AFB4007C */  sw         $s4, 0x7c($sp)
/* A5B70 800A4F70 AFB9009C */  sw         $t9, 0x9c($sp)
/* A5B74 800A4F74 AFAE00A0 */  sw         $t6, 0xa0($sp)
/* A5B78 800A4F78 32F7FFFF */  andi       $s7, $s7, 0xffff
/* A5B7C 800A4F7C 3084FFFF */  andi       $a0, $a0, 0xffff
/* A5B80 800A4F80 AFB700A4 */  sw         $s7, 0xa4($sp)
/* A5B84 800A4F84 2677FFFF */  addiu      $s7, $s3, -1
/* A5B88 800A4F88 AFA400A8 */  sw         $a0, 0xa8($sp)
/* A5B8C 800A4F8C AFB70094 */  sw         $s7, 0x94($sp)
/* A5B90 800A4F90 AC620000 */  sw         $v0, ($v1)
/* A5B94 800A4F94 122000CA */  beqz       $s1, .L800A52C0
/* A5B98 800A4F98 AC600004 */   sw        $zero, 4($v1)
/* A5B9C 800A4F9C 000E2D40 */  sll        $a1, $t6, 0x15
/* A5BA0 800A4FA0 32A20FFF */  andi       $v0, $s5, 0xfff
/* A5BA4 800A4FA4 3C03FD10 */  lui        $v1, 0xfd10
/* A5BA8 800A4FA8 00431025 */  or         $v0, $v0, $v1
/* A5BAC 800A4FAC 00A21025 */  or         $v0, $a1, $v0
/* A5BB0 800A4FB0 3C03F510 */  lui        $v1, 0xf510
/* A5BB4 800A4FB4 AFA20030 */  sw         $v0, 0x30($sp)
/* A5BB8 800A4FB8 8FA20080 */  lw         $v0, 0x80($sp)
/* A5BBC 800A4FBC 8FB70088 */  lw         $s7, 0x88($sp)
/* A5BC0 800A4FC0 00522021 */  addu       $a0, $v0, $s2
/* A5BC4 800A4FC4 009E1023 */  subu       $v0, $a0, $fp
/* A5BC8 800A4FC8 00021040 */  sll        $v0, $v0, 1
/* A5BCC 800A4FCC 24420009 */  addiu      $v0, $v0, 9
/* A5BD0 800A4FD0 000210C3 */  sra        $v0, $v0, 3
/* A5BD4 800A4FD4 304201FF */  andi       $v0, $v0, 0x1ff
/* A5BD8 800A4FD8 00021240 */  sll        $v0, $v0, 9
/* A5BDC 800A4FDC 00431025 */  or         $v0, $v0, $v1
/* A5BE0 800A4FE0 00A22825 */  or         $a1, $a1, $v0
/* A5BE4 800A4FE4 32E30FFF */  andi       $v1, $s7, 0xfff
/* A5BE8 800A4FE8 0003B300 */  sll        $s6, $v1, 0xc
/* A5BEC 800A4FEC 00042080 */  sll        $a0, $a0, 2
/* A5BF0 800A4FF0 30840FFF */  andi       $a0, $a0, 0xfff
/* A5BF4 800A4FF4 0004AB00 */  sll        $s5, $a0, 0xc
/* A5BF8 800A4FF8 00142400 */  sll        $a0, $s4, 0x10
/* A5BFC 800A4FFC 8FA2008C */  lw         $v0, 0x8c($sp)
/* A5C00 800A5000 8FB4009C */  lw         $s4, 0x9c($sp)
/* A5C04 800A5004 00042403 */  sra        $a0, $a0, 0x10
/* A5C08 800A5008 AFA500B0 */  sw         $a1, 0xb0($sp)
/* A5C0C 800A500C AFA40038 */  sw         $a0, 0x38($sp)
/* A5C10 800A5010 00021880 */  sll        $v1, $v0, 2
/* A5C14 800A5014 30630FFF */  andi       $v1, $v1, 0xfff
/* A5C18 800A5018 00031B00 */  sll        $v1, $v1, 0xc
/* A5C1C 800A501C 000D1080 */  sll        $v0, $t5, 2
/* A5C20 800A5020 30420FFF */  andi       $v0, $v0, 0xfff
/* A5C24 800A5024 00621825 */  or         $v1, $v1, $v0
/* A5C28 800A5028 30820FFF */  andi       $v0, $a0, 0xfff
/* A5C2C 800A502C AFA30034 */  sw         $v1, 0x34($sp)
/* A5C30 800A5030 8FA300A4 */  lw         $v1, 0xa4($sp)
/* A5C34 800A5034 8FA400A8 */  lw         $a0, 0xa8($sp)
/* A5C38 800A5038 00021300 */  sll        $v0, $v0, 0xc
/* A5C3C 800A503C AFA2003C */  sw         $v0, 0x3c($sp)
/* A5C40 800A5040 00031400 */  sll        $v0, $v1, 0x10
/* A5C44 800A5044 00441025 */  or         $v0, $v0, $a0
/* A5C48 800A5048 AFA20040 */  sw         $v0, 0x40($sp)
.L800A504C:
/* A5C4C 800A504C 02001021 */  addu       $v0, $s0, $zero
/* A5C50 800A5050 26100008 */  addiu      $s0, $s0, 8
/* A5C54 800A5054 02002021 */  addu       $a0, $s0, $zero
/* A5C58 800A5058 26100008 */  addiu      $s0, $s0, 8
/* A5C5C 800A505C 3C030708 */  lui        $v1, 0x708
/* A5C60 800A5060 34630200 */  ori        $v1, $v1, 0x200
/* A5C64 800A5064 02003821 */  addu       $a3, $s0, $zero
/* A5C68 800A5068 26100008 */  addiu      $s0, $s0, 8
/* A5C6C 800A506C 02004021 */  addu       $t0, $s0, $zero
/* A5C70 800A5070 26100008 */  addiu      $s0, $s0, 8
/* A5C74 800A5074 02004821 */  addu       $t1, $s0, $zero
/* A5C78 800A5078 26100008 */  addiu      $s0, $s0, 8
/* A5C7C 800A507C 02005021 */  addu       $t2, $s0, $zero
/* A5C80 800A5080 26100008 */  addiu      $s0, $s0, 8
/* A5C84 800A5084 3C060008 */  lui        $a2, 8
/* A5C88 800A5088 34C60200 */  ori        $a2, $a2, 0x200
/* A5C8C 800A508C 02005821 */  addu       $t3, $s0, $zero
/* A5C90 800A5090 26100008 */  addiu      $s0, $s0, 8
/* A5C94 800A5094 02006021 */  addu       $t4, $s0, $zero
/* A5C98 800A5098 26100008 */  addiu      $s0, $s0, 8
/* A5C9C 800A509C 030D2821 */  addu       $a1, $t8, $t5
/* A5CA0 800A50A0 8FB70030 */  lw         $s7, 0x30($sp)
/* A5CA4 800A50A4 00A0C821 */  addu       $t9, $a1, $zero
/* A5CA8 800A50A8 AC570000 */  sw         $s7, ($v0)
/* A5CAC 800A50AC 8FB70010 */  lw         $s7, 0x10($sp)
/* A5CB0 800A50B0 00052880 */  sll        $a1, $a1, 2
/* A5CB4 800A50B4 AC570004 */  sw         $s7, 4($v0)
/* A5CB8 800A50B8 8FA200B0 */  lw         $v0, 0xb0($sp)
/* A5CBC 800A50BC 30A50FFF */  andi       $a1, $a1, 0xfff
/* A5CC0 800A50C0 AC830004 */  sw         $v1, 4($a0)
/* A5CC4 800A50C4 3C03E700 */  lui        $v1, 0xe700
/* A5CC8 800A50C8 3C17F200 */  lui        $s7, 0xf200
/* A5CCC 800A50CC AC820000 */  sw         $v0, ($a0)
/* A5CD0 800A50D0 3C02E600 */  lui        $v0, 0xe600
/* A5CD4 800A50D4 00182080 */  sll        $a0, $t8, 2
/* A5CD8 800A50D8 30840FFF */  andi       $a0, $a0, 0xfff
/* A5CDC 800A50DC ACE20000 */  sw         $v0, ($a3)
/* A5CE0 800A50E0 3C02F400 */  lui        $v0, 0xf400
/* A5CE4 800A50E4 00821025 */  or         $v0, $a0, $v0
/* A5CE8 800A50E8 02C21025 */  or         $v0, $s6, $v0
/* A5CEC 800A50EC ACE00004 */  sw         $zero, 4($a3)
/* A5CF0 800A50F0 AD020000 */  sw         $v0, ($t0)
/* A5CF4 800A50F4 3C020700 */  lui        $v0, 0x700
/* A5CF8 800A50F8 00A21025 */  or         $v0, $a1, $v0
/* A5CFC 800A50FC 02A21025 */  or         $v0, $s5, $v0
/* A5D00 800A5100 00972025 */  or         $a0, $a0, $s7
/* A5D04 800A5104 02C42025 */  or         $a0, $s6, $a0
/* A5D08 800A5108 AD020004 */  sw         $v0, 4($t0)
/* A5D0C 800A510C AD230000 */  sw         $v1, ($t1)
/* A5D10 800A5110 AD200004 */  sw         $zero, 4($t1)
/* A5D14 800A5114 8FA300B0 */  lw         $v1, 0xb0($sp)
/* A5D18 800A5118 02A52825 */  or         $a1, $s5, $a1
/* A5D1C 800A511C AD460004 */  sw         $a2, 4($t2)
/* A5D20 800A5120 AD430000 */  sw         $v1, ($t2)
/* A5D24 800A5124 AD640000 */  sw         $a0, ($t3)
/* A5D28 800A5128 AD650004 */  sw         $a1, 4($t3)
/* A5D2C 800A512C AD970000 */  sw         $s7, ($t4)
/* A5D30 800A5130 8FA20034 */  lw         $v0, 0x34($sp)
/* A5D34 800A5134 02007021 */  addu       $t6, $s0, $zero
/* A5D38 800A5138 AD820004 */  sw         $v0, 4($t4)
/* A5D3C 800A513C 8FA30038 */  lw         $v1, 0x38($sp)
/* A5D40 800A5140 18600005 */  blez       $v1, .L800A5158
/* A5D44 800A5144 26100008 */   addiu     $s0, $s0, 8
/* A5D48 800A5148 8FA4003C */  lw         $a0, 0x3c($sp)
/* A5D4C 800A514C 3C02E400 */  lui        $v0, 0xe400
/* A5D50 800A5150 08029457 */  j          .L800A515C
/* A5D54 800A5154 00821025 */   or        $v0, $a0, $v0
.L800A5158:
/* A5D58 800A5158 3C02E400 */  lui        $v0, 0xe400
.L800A515C:
/* A5D5C 800A515C 46023000 */  add.s      $f0, $f6, $f2
/* A5D60 800A5160 00401821 */  addu       $v1, $v0, $zero
/* A5D64 800A5164 4600020D */  trunc.w.s  $f8, $f0
/* A5D68 800A5168 44024000 */  mfc1       $v0, $f8
/* A5D6C 800A516C 00021400 */  sll        $v0, $v0, 0x10
/* A5D70 800A5170 00021403 */  sra        $v0, $v0, 0x10
/* A5D74 800A5174 18400002 */  blez       $v0, .L800A5180
/* A5D78 800A5178 30420FFF */   andi      $v0, $v0, 0xfff
/* A5D7C 800A517C 00621825 */  or         $v1, $v1, $v0
.L800A5180:
/* A5D80 800A5180 00141403 */  sra        $v0, $s4, 0x10
/* A5D84 800A5184 18400004 */  blez       $v0, .L800A5198
/* A5D88 800A5188 ADC30000 */   sw        $v1, ($t6)
/* A5D8C 800A518C 30420FFF */  andi       $v0, $v0, 0xfff
/* A5D90 800A5190 08029467 */  j          .L800A519C
/* A5D94 800A5194 00021300 */   sll       $v0, $v0, 0xc
.L800A5198:
/* A5D98 800A5198 00001021 */  addu       $v0, $zero, $zero
.L800A519C:
/* A5D9C 800A519C 00401821 */  addu       $v1, $v0, $zero
/* A5DA0 800A51A0 4600300D */  trunc.w.s  $f0, $f6
/* A5DA4 800A51A4 44020000 */  mfc1       $v0, $f0
/* A5DA8 800A51A8 00021400 */  sll        $v0, $v0, 0x10
/* A5DAC 800A51AC 00021403 */  sra        $v0, $v0, 0x10
/* A5DB0 800A51B0 18400002 */  blez       $v0, .L800A51BC
/* A5DB4 800A51B4 30420FFF */   andi      $v0, $v0, 0xfff
/* A5DB8 800A51B8 00621825 */  or         $v1, $v1, $v0
.L800A51BC:
/* A5DBC 800A51BC 02003021 */  addu       $a2, $s0, $zero
/* A5DC0 800A51C0 26100008 */  addiu      $s0, $s0, 8
/* A5DC4 800A51C4 3C02E100 */  lui        $v0, 0xe100
/* A5DC8 800A51C8 ADC30004 */  sw         $v1, 4($t6)
/* A5DCC 800A51CC 00141C03 */  sra        $v1, $s4, 0x10
/* A5DD0 800A51D0 04610014 */  bgez       $v1, .L800A5224
/* A5DD4 800A51D4 ACC20000 */   sw        $v0, ($a2)
/* A5DD8 800A51D8 8FB70014 */  lw         $s7, 0x14($sp)
/* A5DDC 800A51DC 00171400 */  sll        $v0, $s7, 0x10
/* A5DE0 800A51E0 00021403 */  sra        $v0, $v0, 0x10
/* A5DE4 800A51E4 00620018 */  mult       $v1, $v0
/* A5DE8 800A51E8 04410007 */  bgez       $v0, .L800A5208
/* A5DEC 800A51EC 00000000 */   nop
/* A5DF0 800A51F0 00001012 */  mflo       $v0
/* A5DF4 800A51F4 000211C3 */  sra        $v0, $v0, 7
/* A5DF8 800A51F8 04410008 */  bgez       $v0, .L800A521C
/* A5DFC 800A51FC 00021023 */   negu      $v0, $v0
/* A5E00 800A5200 08029486 */  j          .L800A5218
/* A5E04 800A5204 00001021 */   addu      $v0, $zero, $zero
.L800A5208:
/* A5E08 800A5208 00001012 */  mflo       $v0
/* A5E0C 800A520C 000211C3 */  sra        $v0, $v0, 7
/* A5E10 800A5210 5C400001 */  bgtzl      $v0, .L800A5218
/* A5E14 800A5214 00001021 */   addu      $v0, $zero, $zero
.L800A5218:
/* A5E18 800A5218 00021023 */  negu       $v0, $v0
.L800A521C:
/* A5E1C 800A521C 0802948A */  j          .L800A5228
/* A5E20 800A5220 00022C00 */   sll       $a1, $v0, 0x10
.L800A5224:
/* A5E24 800A5224 00002821 */  addu       $a1, $zero, $zero
.L800A5228:
/* A5E28 800A5228 4600300D */  trunc.w.s  $f0, $f6
/* A5E2C 800A522C 44030000 */  mfc1       $v1, $f0
/* A5E30 800A5230 04630017 */  bgezl      $v1, .L800A5290
/* A5E34 800A5234 00A01821 */   addu      $v1, $a1, $zero
/* A5E38 800A5238 8FA40018 */  lw         $a0, 0x18($sp)
/* A5E3C 800A523C 00041400 */  sll        $v0, $a0, 0x10
/* A5E40 800A5240 00022403 */  sra        $a0, $v0, 0x10
/* A5E44 800A5244 04810009 */  bgez       $a0, .L800A526C
/* A5E48 800A5248 00031400 */   sll       $v0, $v1, 0x10
/* A5E4C 800A524C 00021403 */  sra        $v0, $v0, 0x10
/* A5E50 800A5250 00440018 */  mult       $v0, $a0
/* A5E54 800A5254 00001012 */  mflo       $v0
/* A5E58 800A5258 000211C3 */  sra        $v0, $v0, 7
/* A5E5C 800A525C 0441000A */  bgez       $v0, .L800A5288
/* A5E60 800A5260 00021023 */   negu      $v0, $v0
/* A5E64 800A5264 080294A1 */  j          .L800A5284
/* A5E68 800A5268 00001021 */   addu      $v0, $zero, $zero
.L800A526C:
/* A5E6C 800A526C 00021403 */  sra        $v0, $v0, 0x10
/* A5E70 800A5270 00440018 */  mult       $v0, $a0
/* A5E74 800A5274 00001012 */  mflo       $v0
/* A5E78 800A5278 000211C3 */  sra        $v0, $v0, 7
/* A5E7C 800A527C 5C400001 */  bgtzl      $v0, .L800A5284
/* A5E80 800A5280 00001021 */   addu      $v0, $zero, $zero
.L800A5284:
/* A5E84 800A5284 00021023 */  negu       $v0, $v0
.L800A5288:
/* A5E88 800A5288 3042FFFF */  andi       $v0, $v0, 0xffff
/* A5E8C 800A528C 00A21825 */  or         $v1, $a1, $v0
.L800A5290:
/* A5E90 800A5290 02001021 */  addu       $v0, $s0, $zero
/* A5E94 800A5294 26100008 */  addiu      $s0, $s0, 8
/* A5E98 800A5298 0320C021 */  addu       $t8, $t9, $zero
/* A5E9C 800A529C 25EF0001 */  addiu      $t7, $t7, 1
/* A5EA0 800A52A0 ACC30004 */  sw         $v1, 4($a2)
/* A5EA4 800A52A4 3C03F100 */  lui        $v1, 0xf100
/* A5EA8 800A52A8 AC430000 */  sw         $v1, ($v0)
/* A5EAC 800A52AC 8FA30040 */  lw         $v1, 0x40($sp)
/* A5EB0 800A52B0 AC430004 */  sw         $v1, 4($v0)
/* A5EB4 800A52B4 01F1182B */  sltu       $v1, $t7, $s1
/* A5EB8 800A52B8 1460FF64 */  bnez       $v1, .L800A504C
/* A5EBC 800A52BC 46023180 */   add.s     $f6, $f6, $f2
.L800A52C0:
/* A5EC0 800A52C0 06610004 */  bgez       $s3, .L800A52D4
/* A5EC4 800A52C4 46202006 */   mov.d     $f0, $f4
/* A5EC8 800A52C8 3C01800E */  lui        $at, %hi(D_800E3338)
/* A5ECC 800A52CC D4203338 */  ldc1       $f0, %lo(D_800E3338)($at)
/* A5ED0 800A52D0 46202000 */  add.d      $f0, $f4, $f0
.L800A52D4:
/* A5ED4 800A52D4 02003021 */  addu       $a2, $s0, $zero
/* A5ED8 800A52D8 26100008 */  addiu      $s0, $s0, 8
/* A5EDC 800A52DC 02003821 */  addu       $a3, $s0, $zero
/* A5EE0 800A52E0 26100008 */  addiu      $s0, $s0, 8
/* A5EE4 800A52E4 3C040708 */  lui        $a0, 0x708
/* A5EE8 800A52E8 34840200 */  ori        $a0, $a0, 0x200
/* A5EEC 800A52EC 02005021 */  addu       $t2, $s0, $zero
/* A5EF0 800A52F0 26100008 */  addiu      $s0, $s0, 8
/* A5EF4 800A52F4 02005821 */  addu       $t3, $s0, $zero
/* A5EF8 800A52F8 26100008 */  addiu      $s0, $s0, 8
/* A5EFC 800A52FC 02006021 */  addu       $t4, $s0, $zero
/* A5F00 800A5300 26100008 */  addiu      $s0, $s0, 8
/* A5F04 800A5304 02006821 */  addu       $t5, $s0, $zero
/* A5F08 800A5308 26100008 */  addiu      $s0, $s0, 8
/* A5F0C 800A530C 3C090008 */  lui        $t1, 8
/* A5F10 800A5310 35290200 */  ori        $t1, $t1, 0x200
/* A5F14 800A5314 02007021 */  addu       $t6, $s0, $zero
/* A5F18 800A5318 26100008 */  addiu      $s0, $s0, 8
/* A5F1C 800A531C 02007821 */  addu       $t7, $s0, $zero
/* A5F20 800A5320 26100008 */  addiu      $s0, $s0, 8
/* A5F24 800A5324 02008821 */  addu       $s1, $s0, $zero
/* A5F28 800A5328 46200020 */  cvt.s.d    $f0, $f0
/* A5F2C 800A532C 460C0002 */  mul.s      $f0, $f0, $f12
/* A5F30 800A5330 8FB700A0 */  lw         $s7, 0xa0($sp)
/* A5F34 800A5334 8FA30090 */  lw         $v1, 0x90($sp)
/* A5F38 800A5338 3C01800E */  lui        $at, %hi(D_800E3340)
/* A5F3C 800A533C C4223340 */  lwc1       $f2, %lo(D_800E3340)($at)
/* A5F40 800A5340 00174540 */  sll        $t0, $s7, 0x15
/* A5F44 800A5344 30620FFF */  andi       $v0, $v1, 0xfff
/* A5F48 800A5348 3C03FD10 */  lui        $v1, 0xfd10
/* A5F4C 800A534C 00431025 */  or         $v0, $v0, $v1
/* A5F50 800A5350 01021025 */  or         $v0, $t0, $v0
/* A5F54 800A5354 ACC20000 */  sw         $v0, ($a2)
/* A5F58 800A5358 8FB70010 */  lw         $s7, 0x10($sp)
/* A5F5C 800A535C 3C03F510 */  lui        $v1, 0xf510
/* A5F60 800A5360 ACD70004 */  sw         $s7, 4($a2)
/* A5F64 800A5364 00183080 */  sll        $a2, $t8, 2
/* A5F68 800A5368 8FA20080 */  lw         $v0, 0x80($sp)
/* A5F6C 800A536C 30C60FFF */  andi       $a2, $a2, 0xfff
/* A5F70 800A5370 ACE40004 */  sw         $a0, 4($a3)
/* A5F74 800A5374 2704FFFF */  addiu      $a0, $t8, -1
/* A5F78 800A5378 00932021 */  addu       $a0, $a0, $s3
/* A5F7C 800A537C 00042080 */  sll        $a0, $a0, 2
/* A5F80 800A5380 30840FFF */  andi       $a0, $a0, 0xfff
/* A5F84 800A5384 00522821 */  addu       $a1, $v0, $s2
/* A5F88 800A5388 00BE1023 */  subu       $v0, $a1, $fp
/* A5F8C 800A538C 00021040 */  sll        $v0, $v0, 1
/* A5F90 800A5390 24420009 */  addiu      $v0, $v0, 9
/* A5F94 800A5394 000210C3 */  sra        $v0, $v0, 3
/* A5F98 800A5398 304201FF */  andi       $v0, $v0, 0x1ff
/* A5F9C 800A539C 00021240 */  sll        $v0, $v0, 9
/* A5FA0 800A53A0 00431025 */  or         $v0, $v0, $v1
/* A5FA4 800A53A4 01024025 */  or         $t0, $t0, $v0
/* A5FA8 800A53A8 3C02E600 */  lui        $v0, 0xe600
/* A5FAC 800A53AC ACE80000 */  sw         $t0, ($a3)
/* A5FB0 800A53B0 AD420000 */  sw         $v0, ($t2)
/* A5FB4 800A53B4 3C02F400 */  lui        $v0, 0xf400
/* A5FB8 800A53B8 00C21025 */  or         $v0, $a2, $v0
/* A5FBC 800A53BC 00052880 */  sll        $a1, $a1, 2
/* A5FC0 800A53C0 30A50FFF */  andi       $a1, $a1, 0xfff
/* A5FC4 800A53C4 AD400004 */  sw         $zero, 4($t2)
/* A5FC8 800A53C8 8FA30088 */  lw         $v1, 0x88($sp)
/* A5FCC 800A53CC 00052B00 */  sll        $a1, $a1, 0xc
/* A5FD0 800A53D0 30670FFF */  andi       $a3, $v1, 0xfff
/* A5FD4 800A53D4 00073B00 */  sll        $a3, $a3, 0xc
/* A5FD8 800A53D8 00E21025 */  or         $v0, $a3, $v0
/* A5FDC 800A53DC AD620000 */  sw         $v0, ($t3)
/* A5FE0 800A53E0 3C020700 */  lui        $v0, 0x700
/* A5FE4 800A53E4 00821025 */  or         $v0, $a0, $v0
/* A5FE8 800A53E8 00A21025 */  or         $v0, $a1, $v0
/* A5FEC 800A53EC 3C03E700 */  lui        $v1, 0xe700
/* A5FF0 800A53F0 AD620004 */  sw         $v0, 4($t3)
/* A5FF4 800A53F4 3C02F200 */  lui        $v0, 0xf200
/* A5FF8 800A53F8 00C23025 */  or         $a2, $a2, $v0
/* A5FFC 800A53FC 00E63825 */  or         $a3, $a3, $a2
/* A6000 800A5400 00A42825 */  or         $a1, $a1, $a0
/* A6004 800A5404 AD830000 */  sw         $v1, ($t4)
/* A6008 800A5408 AD800004 */  sw         $zero, 4($t4)
/* A600C 800A540C ADA80000 */  sw         $t0, ($t5)
/* A6010 800A5410 ADA90004 */  sw         $t1, 4($t5)
/* A6014 800A5414 ADC70000 */  sw         $a3, ($t6)
/* A6018 800A5418 ADC50004 */  sw         $a1, 4($t6)
/* A601C 800A541C ADE20000 */  sw         $v0, ($t7)
/* A6020 800A5420 8FA4008C */  lw         $a0, 0x8c($sp)
/* A6024 800A5424 8FB70094 */  lw         $s7, 0x94($sp)
/* A6028 800A5428 00041080 */  sll        $v0, $a0, 2
/* A602C 800A542C 30420FFF */  andi       $v0, $v0, 0xfff
/* A6030 800A5430 00021300 */  sll        $v0, $v0, 0xc
/* A6034 800A5434 00171880 */  sll        $v1, $s7, 2
/* A6038 800A5438 30630FFF */  andi       $v1, $v1, 0xfff
/* A603C 800A543C 00431025 */  or         $v0, $v0, $v1
/* A6040 800A5440 ADE20004 */  sw         $v0, 4($t7)
/* A6044 800A5444 8FA3007C */  lw         $v1, 0x7c($sp)
/* A6048 800A5448 46020082 */  mul.s      $f2, $f0, $f2
/* A604C 800A544C 00031400 */  sll        $v0, $v1, 0x10
/* A6050 800A5450 00021403 */  sra        $v0, $v0, 0x10
/* A6054 800A5454 18400006 */  blez       $v0, .L800A5470
/* A6058 800A5458 26100008 */   addiu     $s0, $s0, 8
/* A605C 800A545C 30420FFF */  andi       $v0, $v0, 0xfff
/* A6060 800A5460 00021300 */  sll        $v0, $v0, 0xc
/* A6064 800A5464 3C03E400 */  lui        $v1, 0xe400
/* A6068 800A5468 0802951D */  j          .L800A5474
/* A606C 800A546C 00431025 */   or        $v0, $v0, $v1
.L800A5470:
/* A6070 800A5470 3C02E400 */  lui        $v0, 0xe400
.L800A5474:
/* A6074 800A5474 46023000 */  add.s      $f0, $f6, $f2
/* A6078 800A5478 00402021 */  addu       $a0, $v0, $zero
/* A607C 800A547C 4600008D */  trunc.w.s  $f2, $f0
/* A6080 800A5480 44021000 */  mfc1       $v0, $f2
/* A6084 800A5484 00021400 */  sll        $v0, $v0, 0x10
/* A6088 800A5488 00021403 */  sra        $v0, $v0, 0x10
/* A608C 800A548C 18400002 */  blez       $v0, .L800A5498
/* A6090 800A5490 30420FFF */   andi      $v0, $v0, 0xfff
/* A6094 800A5494 00822025 */  or         $a0, $a0, $v0
.L800A5498:
/* A6098 800A5498 AE240000 */  sw         $a0, ($s1)
/* A609C 800A549C 8FA4009C */  lw         $a0, 0x9c($sp)
/* A60A0 800A54A0 00041403 */  sra        $v0, $a0, 0x10
/* A60A4 800A54A4 18400003 */  blez       $v0, .L800A54B4
/* A60A8 800A54A8 30420FFF */   andi      $v0, $v0, 0xfff
/* A60AC 800A54AC 0802952E */  j          .L800A54B8
/* A60B0 800A54B0 00021300 */   sll       $v0, $v0, 0xc
.L800A54B4:
/* A60B4 800A54B4 00001021 */  addu       $v0, $zero, $zero
.L800A54B8:
/* A60B8 800A54B8 00401821 */  addu       $v1, $v0, $zero
/* A60BC 800A54BC 4600300D */  trunc.w.s  $f0, $f6
/* A60C0 800A54C0 44020000 */  mfc1       $v0, $f0
/* A60C4 800A54C4 00021400 */  sll        $v0, $v0, 0x10
/* A60C8 800A54C8 00021403 */  sra        $v0, $v0, 0x10
/* A60CC 800A54CC 18400002 */  blez       $v0, .L800A54D8
/* A60D0 800A54D0 30420FFF */   andi      $v0, $v0, 0xfff
/* A60D4 800A54D4 00621825 */  or         $v1, $v1, $v0
.L800A54D8:
/* A60D8 800A54D8 02003021 */  addu       $a2, $s0, $zero
/* A60DC 800A54DC 3C02E100 */  lui        $v0, 0xe100
/* A60E0 800A54E0 AE230004 */  sw         $v1, 4($s1)
/* A60E4 800A54E4 ACC20000 */  sw         $v0, ($a2)
/* A60E8 800A54E8 8FB7009C */  lw         $s7, 0x9c($sp)
/* A60EC 800A54EC 00171C03 */  sra        $v1, $s7, 0x10
/* A60F0 800A54F0 04610014 */  bgez       $v1, .L800A5544
/* A60F4 800A54F4 26100008 */   addiu     $s0, $s0, 8
/* A60F8 800A54F8 8FA40014 */  lw         $a0, 0x14($sp)
/* A60FC 800A54FC 00041400 */  sll        $v0, $a0, 0x10
/* A6100 800A5500 00021403 */  sra        $v0, $v0, 0x10
/* A6104 800A5504 00620018 */  mult       $v1, $v0
/* A6108 800A5508 04410007 */  bgez       $v0, .L800A5528
/* A610C 800A550C 00000000 */   nop
/* A6110 800A5510 00001012 */  mflo       $v0
/* A6114 800A5514 000211C3 */  sra        $v0, $v0, 7
/* A6118 800A5518 04410008 */  bgez       $v0, .L800A553C
/* A611C 800A551C 00021023 */   negu      $v0, $v0
/* A6120 800A5520 0802954E */  j          .L800A5538
/* A6124 800A5524 00001021 */   addu      $v0, $zero, $zero
.L800A5528:
/* A6128 800A5528 00001012 */  mflo       $v0
/* A612C 800A552C 000211C3 */  sra        $v0, $v0, 7
/* A6130 800A5530 5C400001 */  bgtzl      $v0, .L800A5538
/* A6134 800A5534 00001021 */   addu      $v0, $zero, $zero
.L800A5538:
/* A6138 800A5538 00021023 */  negu       $v0, $v0
.L800A553C:
/* A613C 800A553C 08029552 */  j          .L800A5548
/* A6140 800A5540 00022C00 */   sll       $a1, $v0, 0x10
.L800A5544:
/* A6144 800A5544 00002821 */  addu       $a1, $zero, $zero
.L800A5548:
/* A6148 800A5548 4600300D */  trunc.w.s  $f0, $f6
/* A614C 800A554C 44030000 */  mfc1       $v1, $f0
/* A6150 800A5550 04610436 */  bgez       $v1, .L800A662C
/* A6154 800A5554 00A01021 */   addu      $v0, $a1, $zero
/* A6158 800A5558 8FA40018 */  lw         $a0, 0x18($sp)
/* A615C 800A555C 00041400 */  sll        $v0, $a0, 0x10
/* A6160 800A5560 00022403 */  sra        $a0, $v0, 0x10
/* A6164 800A5564 04810428 */  bgez       $a0, .L800A6608
/* A6168 800A5568 00031400 */   sll       $v0, $v1, 0x10
/* A616C 800A556C 00021403 */  sra        $v0, $v0, 0x10
/* A6170 800A5570 00440018 */  mult       $v0, $a0
/* A6174 800A5574 00001012 */  mflo       $v0
/* A6178 800A5578 000211C3 */  sra        $v0, $v0, 7
/* A617C 800A557C 04430429 */  bgezl      $v0, .L800A6624
/* A6180 800A5580 00021023 */   negu      $v0, $v0
/* A6184 800A5584 08029988 */  j          .L800A6620
/* A6188 800A5588 00001021 */   addu      $v0, $zero, $zero
/* A618C 800A558C 2A420008 */  slti       $v0, $s2, 8
/* A6190 800A5590 10400003 */  beqz       $v0, .L800A55A0
/* A6194 800A5594 24020008 */   addiu     $v0, $zero, 8
/* A6198 800A5598 0802956C */  j          .L800A55B0
/* A619C 800A559C 00521023 */   subu      $v0, $v0, $s2
.L800A55A0:
/* A61A0 800A55A0 32430007 */  andi       $v1, $s2, 7
/* A61A4 800A55A4 14600002 */  bnez       $v1, .L800A55B0
/* A61A8 800A55A8 00431023 */   subu      $v0, $v0, $v1
/* A61AC 800A55AC 00001021 */  addu       $v0, $zero, $zero
.L800A55B0:
/* A61B0 800A55B0 95E30008 */  lhu        $v1, 8($t7)
/* A61B4 800A55B4 02422021 */  addu       $a0, $s2, $v0
/* A61B8 800A55B8 24020004 */  addiu      $v0, $zero, 4
/* A61BC 800A55BC 14620003 */  bne        $v1, $v0, .L800A55CC
/* A61C0 800A55C0 00603021 */   addu      $a2, $v1, $zero
/* A61C4 800A55C4 08029574 */  j          .L800A55D0
/* A61C8 800A55C8 24020800 */   addiu     $v0, $zero, 0x800
.L800A55CC:
/* A61CC 800A55CC 24021000 */  addiu      $v0, $zero, 0x1000
.L800A55D0:
/* A61D0 800A55D0 0044001B */  divu       $zero, $v0, $a0
/* A61D4 800A55D4 00001012 */  mflo       $v0
/* A61D8 800A55D8 50800001 */  beql       $a0, $zero, .L800A55E0
/* A61DC 800A55DC 000001CD */   break     0, 7
.L800A55E0:
/* A61E0 800A55E0 244DFFFF */   addiu     $t5, $v0, -1
/* A61E4 800A55E4 00AD001B */  divu       $zero, $a1, $t5
/* A61E8 800A55E8 00001812 */  mflo       $v1
/* A61EC 800A55EC 51A00001 */  beql       $t5, $zero, .L800A55F4
/* A61F0 800A55F0 000001CD */   break     0, 7
.L800A55F4:
/* A61F4 800A55F4 00608821 */   addu      $s1, $v1, $zero
/* A61F8 800A55F8 022D0018 */  mult       $s1, $t5
/* A61FC 800A55FC 00001012 */  mflo       $v0
/* A6200 800A5600 00A29823 */  subu       $s3, $a1, $v0
/* A6204 800A5604 16600003 */  bnez       $s3, .L800A5614
/* A6208 800A5608 00000000 */   nop
/* A620C 800A560C 2631FFFF */  addiu      $s1, $s1, -1
/* A6210 800A5610 01A09821 */  addu       $s3, $t5, $zero
.L800A5614:
/* A6214 800A5614 448D1000 */  mtc1       $t5, $f2
/* A6218 800A5618 468010A1 */  cvt.d.w    $f2, $f2
/* A621C 800A561C 05A30005 */  bgezl      $t5, .L800A5634
/* A6220 800A5620 46201020 */   cvt.s.d   $f0, $f2
/* A6224 800A5624 3C01800E */  lui        $at, %hi(D_800E3348)
/* A6228 800A5628 D4203348 */  ldc1       $f0, %lo(D_800E3348)($at)
/* A622C 800A562C 46201080 */  add.d      $f2, $f2, $f0
/* A6230 800A5630 46201020 */  cvt.s.d    $f0, $f2
.L800A5634:
/* A6234 800A5634 460C0002 */  mul.s      $f0, $f0, $f12
/* A6238 800A5638 3C01800E */  lui        $at, %hi(D_800E3350)
/* A623C 800A563C C4223350 */  lwc1       $f2, %lo(D_800E3350)($at)
/* A6240 800A5640 30C3FFFF */  andi       $v1, $a2, 0xffff
/* A6244 800A5644 24020004 */  addiu      $v0, $zero, 4
/* A6248 800A5648 46020082 */  mul.s      $f2, $f0, $f2
/* A624C 800A564C 14620031 */  bne        $v1, $v0, .L800A5714
/* A6250 800A5650 24020005 */   addiu     $v0, $zero, 5
/* A6254 800A5654 240E0002 */  addiu      $t6, $zero, 2
/* A6258 800A5658 02003021 */  addu       $a2, $s0, $zero
/* A625C 800A565C 26100008 */  addiu      $s0, $s0, 8
/* A6260 800A5660 3C03E300 */  lui        $v1, 0xe300
/* A6264 800A5664 34631001 */  ori        $v1, $v1, 0x1001
/* A6268 800A5668 02003821 */  addu       $a3, $s0, $zero
/* A626C 800A566C 26100008 */  addiu      $s0, $s0, 8
/* A6270 800A5670 02004021 */  addu       $t0, $s0, $zero
/* A6274 800A5674 26100008 */  addiu      $s0, $s0, 8
/* A6278 800A5678 02005821 */  addu       $t3, $s0, $zero
/* A627C 800A567C 26100008 */  addiu      $s0, $s0, 8
/* A6280 800A5680 3C04F500 */  lui        $a0, 0xf500
/* A6284 800A5684 34840100 */  ori        $a0, $a0, 0x100
/* A6288 800A5688 02004821 */  addu       $t1, $s0, $zero
/* A628C 800A568C 26100008 */  addiu      $s0, $s0, 8
/* A6290 800A5690 02006021 */  addu       $t4, $s0, $zero
/* A6294 800A5694 26100008 */  addiu      $s0, $s0, 8
/* A6298 800A5698 3C05073F */  lui        $a1, 0x73f
/* A629C 800A569C 34A5C000 */  ori        $a1, $a1, 0xc000
/* A62A0 800A56A0 02005021 */  addu       $t2, $s0, $zero
/* A62A4 800A56A4 26100008 */  addiu      $s0, $s0, 8
/* A62A8 800A56A8 34028000 */  ori        $v0, $zero, 0x8000
/* A62AC 800A56AC ACC30000 */  sw         $v1, ($a2)
/* A62B0 800A56B0 3C03FD10 */  lui        $v1, 0xfd10
/* A62B4 800A56B4 ACC20004 */  sw         $v0, 4($a2)
/* A62B8 800A56B8 02003021 */  addu       $a2, $s0, $zero
/* A62BC 800A56BC 26100008 */  addiu      $s0, $s0, 8
/* A62C0 800A56C0 ACE30000 */  sw         $v1, ($a3)
/* A62C4 800A56C4 8DE30010 */  lw         $v1, 0x10($t7)
/* A62C8 800A56C8 3C02E800 */  lui        $v0, 0xe800
/* A62CC 800A56CC ACE30004 */  sw         $v1, 4($a3)
/* A62D0 800A56D0 AD020000 */  sw         $v0, ($t0)
/* A62D4 800A56D4 3C020700 */  lui        $v0, 0x700
/* A62D8 800A56D8 3C03E600 */  lui        $v1, 0xe600
/* A62DC 800A56DC AD000004 */  sw         $zero, 4($t0)
/* A62E0 800A56E0 AD620004 */  sw         $v0, 4($t3)
/* A62E4 800A56E4 3C02F000 */  lui        $v0, 0xf000
/* A62E8 800A56E8 AD640000 */  sw         $a0, ($t3)
/* A62EC 800A56EC AD230000 */  sw         $v1, ($t1)
/* A62F0 800A56F0 AD200004 */  sw         $zero, 4($t1)
/* A62F4 800A56F4 AD820000 */  sw         $v0, ($t4)
/* A62F8 800A56F8 3C02E700 */  lui        $v0, 0xe700
/* A62FC 800A56FC AD850004 */  sw         $a1, 4($t4)
/* A6300 800A5700 AD420000 */  sw         $v0, ($t2)
/* A6304 800A5704 AD400004 */  sw         $zero, 4($t2)
/* A6308 800A5708 ACC30000 */  sw         $v1, ($a2)
/* A630C 800A570C 080295CE */  j          .L800A5738
/* A6310 800A5710 ACC00004 */   sw        $zero, 4($a2)
.L800A5714:
/* A6314 800A5714 14620002 */  bne        $v1, $v0, .L800A5720
/* A6318 800A5718 240E0004 */   addiu     $t6, $zero, 4
/* A631C 800A571C 240E0003 */  addiu      $t6, $zero, 3
.L800A5720:
/* A6320 800A5720 02001821 */  addu       $v1, $s0, $zero
/* A6324 800A5724 26100008 */  addiu      $s0, $s0, 8
/* A6328 800A5728 3C02E300 */  lui        $v0, 0xe300
/* A632C 800A572C 34421001 */  ori        $v0, $v0, 0x1001
/* A6330 800A5730 AC620000 */  sw         $v0, ($v1)
/* A6334 800A5734 AC600004 */  sw         $zero, 4($v1)
.L800A5738:
/* A6338 800A5738 00007821 */  addu       $t7, $zero, $zero
/* A633C 800A573C 26B5FFFF */  addiu      $s5, $s5, -1
/* A6340 800A5740 27C2FFFF */  addiu      $v0, $fp, -1
/* A6344 800A5744 001E1880 */  sll        $v1, $fp, 2
/* A6348 800A5748 2644FFFF */  addiu      $a0, $s2, -1
/* A634C 800A574C 0334A021 */  addu       $s4, $t9, $s4
/* A6350 800A5750 0019CC00 */  sll        $t9, $t9, 0x10
/* A6354 800A5754 8FB70014 */  lw         $s7, 0x14($sp)
/* A6358 800A5758 44932000 */  mtc1       $s3, $f4
/* A635C 800A575C 46802121 */  cvt.d.w    $f4, $f4
/* A6360 800A5760 AFA30088 */  sw         $v1, 0x88($sp)
/* A6364 800A5764 2663FFFF */  addiu      $v1, $s3, -1
/* A6368 800A5768 AFA20080 */  sw         $v0, 0x80($sp)
/* A636C 800A576C 8FA20018 */  lw         $v0, 0x18($sp)
/* A6370 800A5770 31CE0007 */  andi       $t6, $t6, 7
/* A6374 800A5774 AFB50090 */  sw         $s5, 0x90($sp)
/* A6378 800A5778 AFA4008C */  sw         $a0, 0x8c($sp)
/* A637C 800A577C AFB4007C */  sw         $s4, 0x7c($sp)
/* A6380 800A5780 AFB9009C */  sw         $t9, 0x9c($sp)
/* A6384 800A5784 AFA30094 */  sw         $v1, 0x94($sp)
/* A6388 800A5788 AFAE00A0 */  sw         $t6, 0xa0($sp)
/* A638C 800A578C 32F7FFFF */  andi       $s7, $s7, 0xffff
/* A6390 800A5790 3042FFFF */  andi       $v0, $v0, 0xffff
/* A6394 800A5794 AFB700A4 */  sw         $s7, 0xa4($sp)
/* A6398 800A5798 122000C9 */  beqz       $s1, .L800A5AC0
/* A639C 800A579C AFA200A8 */   sw        $v0, 0xa8($sp)
/* A63A0 800A57A0 000E2D40 */  sll        $a1, $t6, 0x15
/* A63A4 800A57A4 32A20FFF */  andi       $v0, $s5, 0xfff
/* A63A8 800A57A8 3C03FD08 */  lui        $v1, 0xfd08
/* A63AC 800A57AC 00431025 */  or         $v0, $v0, $v1
/* A63B0 800A57B0 00A21025 */  or         $v0, $a1, $v0
/* A63B4 800A57B4 8FB70080 */  lw         $s7, 0x80($sp)
/* A63B8 800A57B8 3C03F508 */  lui        $v1, 0xf508
/* A63BC 800A57BC AFA20044 */  sw         $v0, 0x44($sp)
/* A63C0 800A57C0 02F22021 */  addu       $a0, $s7, $s2
/* A63C4 800A57C4 009E1023 */  subu       $v0, $a0, $fp
/* A63C8 800A57C8 24420008 */  addiu      $v0, $v0, 8
/* A63CC 800A57CC 000210C3 */  sra        $v0, $v0, 3
/* A63D0 800A57D0 304201FF */  andi       $v0, $v0, 0x1ff
/* A63D4 800A57D4 00021240 */  sll        $v0, $v0, 9
/* A63D8 800A57D8 00431025 */  or         $v0, $v0, $v1
/* A63DC 800A57DC 00A22825 */  or         $a1, $a1, $v0
/* A63E0 800A57E0 00042080 */  sll        $a0, $a0, 2
/* A63E4 800A57E4 30840FFF */  andi       $a0, $a0, 0xfff
/* A63E8 800A57E8 0004AB00 */  sll        $s5, $a0, 0xc
/* A63EC 800A57EC 8FA20088 */  lw         $v0, 0x88($sp)
/* A63F0 800A57F0 8FA4008C */  lw         $a0, 0x8c($sp)
/* A63F4 800A57F4 8FB700A4 */  lw         $s7, 0xa4($sp)
/* A63F8 800A57F8 AFA500B0 */  sw         $a1, 0xb0($sp)
/* A63FC 800A57FC 30430FFF */  andi       $v1, $v0, 0xfff
/* A6400 800A5800 0003B300 */  sll        $s6, $v1, 0xc
/* A6404 800A5804 00041880 */  sll        $v1, $a0, 2
/* A6408 800A5808 30630FFF */  andi       $v1, $v1, 0xfff
/* A640C 800A580C 00031B00 */  sll        $v1, $v1, 0xc
/* A6410 800A5810 000D1080 */  sll        $v0, $t5, 2
/* A6414 800A5814 30420FFF */  andi       $v0, $v0, 0xfff
/* A6418 800A5818 00621825 */  or         $v1, $v1, $v0
/* A641C 800A581C 00142400 */  sll        $a0, $s4, 0x10
/* A6420 800A5820 00042403 */  sra        $a0, $a0, 0x10
/* A6424 800A5824 30820FFF */  andi       $v0, $a0, 0xfff
/* A6428 800A5828 00021300 */  sll        $v0, $v0, 0xc
/* A642C 800A582C AFA30048 */  sw         $v1, 0x48($sp)
/* A6430 800A5830 8FA300A8 */  lw         $v1, 0xa8($sp)
/* A6434 800A5834 0320A021 */  addu       $s4, $t9, $zero
/* A6438 800A5838 AFA20050 */  sw         $v0, 0x50($sp)
/* A643C 800A583C 00171400 */  sll        $v0, $s7, 0x10
/* A6440 800A5840 AFA4004C */  sw         $a0, 0x4c($sp)
/* A6444 800A5844 00431025 */  or         $v0, $v0, $v1
/* A6448 800A5848 AFA20054 */  sw         $v0, 0x54($sp)
.L800A584C:
/* A644C 800A584C 02001021 */  addu       $v0, $s0, $zero
/* A6450 800A5850 26100008 */  addiu      $s0, $s0, 8
/* A6454 800A5854 02002021 */  addu       $a0, $s0, $zero
/* A6458 800A5858 26100008 */  addiu      $s0, $s0, 8
/* A645C 800A585C 3C030708 */  lui        $v1, 0x708
/* A6460 800A5860 34630200 */  ori        $v1, $v1, 0x200
/* A6464 800A5864 02003821 */  addu       $a3, $s0, $zero
/* A6468 800A5868 26100008 */  addiu      $s0, $s0, 8
/* A646C 800A586C 02004021 */  addu       $t0, $s0, $zero
/* A6470 800A5870 26100008 */  addiu      $s0, $s0, 8
/* A6474 800A5874 02004821 */  addu       $t1, $s0, $zero
/* A6478 800A5878 26100008 */  addiu      $s0, $s0, 8
/* A647C 800A587C 02005021 */  addu       $t2, $s0, $zero
/* A6480 800A5880 26100008 */  addiu      $s0, $s0, 8
/* A6484 800A5884 3C060008 */  lui        $a2, 8
/* A6488 800A5888 34C60200 */  ori        $a2, $a2, 0x200
/* A648C 800A588C 02005821 */  addu       $t3, $s0, $zero
/* A6490 800A5890 26100008 */  addiu      $s0, $s0, 8
/* A6494 800A5894 02006021 */  addu       $t4, $s0, $zero
/* A6498 800A5898 26100008 */  addiu      $s0, $s0, 8
/* A649C 800A589C 030D2821 */  addu       $a1, $t8, $t5
/* A64A0 800A58A0 8FB70044 */  lw         $s7, 0x44($sp)
/* A64A4 800A58A4 00A0C821 */  addu       $t9, $a1, $zero
/* A64A8 800A58A8 AC570000 */  sw         $s7, ($v0)
/* A64AC 800A58AC 8FB70010 */  lw         $s7, 0x10($sp)
/* A64B0 800A58B0 00052880 */  sll        $a1, $a1, 2
/* A64B4 800A58B4 AC570004 */  sw         $s7, 4($v0)
/* A64B8 800A58B8 8FA200B0 */  lw         $v0, 0xb0($sp)
/* A64BC 800A58BC 30A50FFF */  andi       $a1, $a1, 0xfff
/* A64C0 800A58C0 AC830004 */  sw         $v1, 4($a0)
/* A64C4 800A58C4 3C03E700 */  lui        $v1, 0xe700
/* A64C8 800A58C8 3C17F200 */  lui        $s7, 0xf200
/* A64CC 800A58CC AC820000 */  sw         $v0, ($a0)
/* A64D0 800A58D0 3C02E600 */  lui        $v0, 0xe600
/* A64D4 800A58D4 00182080 */  sll        $a0, $t8, 2
/* A64D8 800A58D8 30840FFF */  andi       $a0, $a0, 0xfff
/* A64DC 800A58DC ACE20000 */  sw         $v0, ($a3)
/* A64E0 800A58E0 3C02F400 */  lui        $v0, 0xf400
/* A64E4 800A58E4 00821025 */  or         $v0, $a0, $v0
/* A64E8 800A58E8 02C21025 */  or         $v0, $s6, $v0
/* A64EC 800A58EC ACE00004 */  sw         $zero, 4($a3)
/* A64F0 800A58F0 AD020000 */  sw         $v0, ($t0)
/* A64F4 800A58F4 3C020700 */  lui        $v0, 0x700
/* A64F8 800A58F8 00A21025 */  or         $v0, $a1, $v0
/* A64FC 800A58FC 02A21025 */  or         $v0, $s5, $v0
/* A6500 800A5900 00972025 */  or         $a0, $a0, $s7
/* A6504 800A5904 02C42025 */  or         $a0, $s6, $a0
/* A6508 800A5908 AD020004 */  sw         $v0, 4($t0)
/* A650C 800A590C AD230000 */  sw         $v1, ($t1)
/* A6510 800A5910 AD200004 */  sw         $zero, 4($t1)
/* A6514 800A5914 8FA300B0 */  lw         $v1, 0xb0($sp)
/* A6518 800A5918 02A52825 */  or         $a1, $s5, $a1
/* A651C 800A591C AD460004 */  sw         $a2, 4($t2)
/* A6520 800A5920 AD430000 */  sw         $v1, ($t2)
/* A6524 800A5924 AD640000 */  sw         $a0, ($t3)
/* A6528 800A5928 AD650004 */  sw         $a1, 4($t3)
/* A652C 800A592C AD970000 */  sw         $s7, ($t4)
/* A6530 800A5930 8FA20048 */  lw         $v0, 0x48($sp)
/* A6534 800A5934 02007021 */  addu       $t6, $s0, $zero
/* A6538 800A5938 AD820004 */  sw         $v0, 4($t4)
/* A653C 800A593C 8FA3004C */  lw         $v1, 0x4c($sp)
/* A6540 800A5940 18600005 */  blez       $v1, .L800A5958
/* A6544 800A5944 26100008 */   addiu     $s0, $s0, 8
/* A6548 800A5948 8FA40050 */  lw         $a0, 0x50($sp)
/* A654C 800A594C 3C02E400 */  lui        $v0, 0xe400
/* A6550 800A5950 08029657 */  j          .L800A595C
/* A6554 800A5954 00821025 */   or        $v0, $a0, $v0
.L800A5958:
/* A6558 800A5958 3C02E400 */  lui        $v0, 0xe400
.L800A595C:
/* A655C 800A595C 46023000 */  add.s      $f0, $f6, $f2
/* A6560 800A5960 00401821 */  addu       $v1, $v0, $zero
/* A6564 800A5964 4600020D */  trunc.w.s  $f8, $f0
/* A6568 800A5968 44024000 */  mfc1       $v0, $f8
/* A656C 800A596C 00021400 */  sll        $v0, $v0, 0x10
/* A6570 800A5970 00021403 */  sra        $v0, $v0, 0x10
/* A6574 800A5974 18400002 */  blez       $v0, .L800A5980
/* A6578 800A5978 30420FFF */   andi      $v0, $v0, 0xfff
/* A657C 800A597C 00621825 */  or         $v1, $v1, $v0
.L800A5980:
/* A6580 800A5980 00141403 */  sra        $v0, $s4, 0x10
/* A6584 800A5984 18400004 */  blez       $v0, .L800A5998
/* A6588 800A5988 ADC30000 */   sw        $v1, ($t6)
/* A658C 800A598C 30420FFF */  andi       $v0, $v0, 0xfff
/* A6590 800A5990 08029667 */  j          .L800A599C
/* A6594 800A5994 00021300 */   sll       $v0, $v0, 0xc
.L800A5998:
/* A6598 800A5998 00001021 */  addu       $v0, $zero, $zero
.L800A599C:
/* A659C 800A599C 00401821 */  addu       $v1, $v0, $zero
/* A65A0 800A59A0 4600300D */  trunc.w.s  $f0, $f6
/* A65A4 800A59A4 44020000 */  mfc1       $v0, $f0
/* A65A8 800A59A8 00021400 */  sll        $v0, $v0, 0x10
/* A65AC 800A59AC 00021403 */  sra        $v0, $v0, 0x10
/* A65B0 800A59B0 18400002 */  blez       $v0, .L800A59BC
/* A65B4 800A59B4 30420FFF */   andi      $v0, $v0, 0xfff
/* A65B8 800A59B8 00621825 */  or         $v1, $v1, $v0
.L800A59BC:
/* A65BC 800A59BC 02003021 */  addu       $a2, $s0, $zero
/* A65C0 800A59C0 26100008 */  addiu      $s0, $s0, 8
/* A65C4 800A59C4 3C02E100 */  lui        $v0, 0xe100
/* A65C8 800A59C8 ADC30004 */  sw         $v1, 4($t6)
/* A65CC 800A59CC 00141C03 */  sra        $v1, $s4, 0x10
/* A65D0 800A59D0 04610014 */  bgez       $v1, .L800A5A24
/* A65D4 800A59D4 ACC20000 */   sw        $v0, ($a2)
/* A65D8 800A59D8 8FB70014 */  lw         $s7, 0x14($sp)
/* A65DC 800A59DC 00171400 */  sll        $v0, $s7, 0x10
/* A65E0 800A59E0 00021403 */  sra        $v0, $v0, 0x10
/* A65E4 800A59E4 00620018 */  mult       $v1, $v0
/* A65E8 800A59E8 04410007 */  bgez       $v0, .L800A5A08
/* A65EC 800A59EC 00000000 */   nop
/* A65F0 800A59F0 00001012 */  mflo       $v0
/* A65F4 800A59F4 000211C3 */  sra        $v0, $v0, 7
/* A65F8 800A59F8 04410008 */  bgez       $v0, .L800A5A1C
/* A65FC 800A59FC 00021023 */   negu      $v0, $v0
/* A6600 800A5A00 08029686 */  j          .L800A5A18
/* A6604 800A5A04 00001021 */   addu      $v0, $zero, $zero
.L800A5A08:
/* A6608 800A5A08 00001012 */  mflo       $v0
/* A660C 800A5A0C 000211C3 */  sra        $v0, $v0, 7
/* A6610 800A5A10 5C400001 */  bgtzl      $v0, .L800A5A18
/* A6614 800A5A14 00001021 */   addu      $v0, $zero, $zero
.L800A5A18:
/* A6618 800A5A18 00021023 */  negu       $v0, $v0
.L800A5A1C:
/* A661C 800A5A1C 0802968A */  j          .L800A5A28
/* A6620 800A5A20 00022C00 */   sll       $a1, $v0, 0x10
.L800A5A24:
/* A6624 800A5A24 00002821 */  addu       $a1, $zero, $zero
.L800A5A28:
/* A6628 800A5A28 4600300D */  trunc.w.s  $f0, $f6
/* A662C 800A5A2C 44030000 */  mfc1       $v1, $f0
/* A6630 800A5A30 04630017 */  bgezl      $v1, .L800A5A90
/* A6634 800A5A34 00A01821 */   addu      $v1, $a1, $zero
/* A6638 800A5A38 8FA40018 */  lw         $a0, 0x18($sp)
/* A663C 800A5A3C 00041400 */  sll        $v0, $a0, 0x10
/* A6640 800A5A40 00022403 */  sra        $a0, $v0, 0x10
/* A6644 800A5A44 04810009 */  bgez       $a0, .L800A5A6C
/* A6648 800A5A48 00031400 */   sll       $v0, $v1, 0x10
/* A664C 800A5A4C 00021403 */  sra        $v0, $v0, 0x10
/* A6650 800A5A50 00440018 */  mult       $v0, $a0
/* A6654 800A5A54 00001012 */  mflo       $v0
/* A6658 800A5A58 000211C3 */  sra        $v0, $v0, 7
/* A665C 800A5A5C 0441000A */  bgez       $v0, .L800A5A88
/* A6660 800A5A60 00021023 */   negu      $v0, $v0
/* A6664 800A5A64 080296A1 */  j          .L800A5A84
/* A6668 800A5A68 00001021 */   addu      $v0, $zero, $zero
.L800A5A6C:
/* A666C 800A5A6C 00021403 */  sra        $v0, $v0, 0x10
/* A6670 800A5A70 00440018 */  mult       $v0, $a0
/* A6674 800A5A74 00001012 */  mflo       $v0
/* A6678 800A5A78 000211C3 */  sra        $v0, $v0, 7
/* A667C 800A5A7C 5C400001 */  bgtzl      $v0, .L800A5A84
/* A6680 800A5A80 00001021 */   addu      $v0, $zero, $zero
.L800A5A84:
/* A6684 800A5A84 00021023 */  negu       $v0, $v0
.L800A5A88:
/* A6688 800A5A88 3042FFFF */  andi       $v0, $v0, 0xffff
/* A668C 800A5A8C 00A21825 */  or         $v1, $a1, $v0
.L800A5A90:
/* A6690 800A5A90 02001021 */  addu       $v0, $s0, $zero
/* A6694 800A5A94 26100008 */  addiu      $s0, $s0, 8
/* A6698 800A5A98 0320C021 */  addu       $t8, $t9, $zero
/* A669C 800A5A9C 25EF0001 */  addiu      $t7, $t7, 1
/* A66A0 800A5AA0 ACC30004 */  sw         $v1, 4($a2)
/* A66A4 800A5AA4 3C03F100 */  lui        $v1, 0xf100
/* A66A8 800A5AA8 AC430000 */  sw         $v1, ($v0)
/* A66AC 800A5AAC 8FA30054 */  lw         $v1, 0x54($sp)
/* A66B0 800A5AB0 AC430004 */  sw         $v1, 4($v0)
/* A66B4 800A5AB4 01F1182B */  sltu       $v1, $t7, $s1
/* A66B8 800A5AB8 1460FF64 */  bnez       $v1, .L800A584C
/* A66BC 800A5ABC 46023180 */   add.s     $f6, $f6, $f2
.L800A5AC0:
/* A66C0 800A5AC0 06610004 */  bgez       $s3, .L800A5AD4
/* A66C4 800A5AC4 46202006 */   mov.d     $f0, $f4
/* A66C8 800A5AC8 3C01800E */  lui        $at, %hi(D_800E3358)
/* A66CC 800A5ACC D4203358 */  ldc1       $f0, %lo(D_800E3358)($at)
/* A66D0 800A5AD0 46202000 */  add.d      $f0, $f4, $f0
.L800A5AD4:
/* A66D4 800A5AD4 02003021 */  addu       $a2, $s0, $zero
/* A66D8 800A5AD8 26100008 */  addiu      $s0, $s0, 8
/* A66DC 800A5ADC 02003821 */  addu       $a3, $s0, $zero
/* A66E0 800A5AE0 26100008 */  addiu      $s0, $s0, 8
/* A66E4 800A5AE4 3C040708 */  lui        $a0, 0x708
/* A66E8 800A5AE8 34840200 */  ori        $a0, $a0, 0x200
/* A66EC 800A5AEC 02005021 */  addu       $t2, $s0, $zero
/* A66F0 800A5AF0 26100008 */  addiu      $s0, $s0, 8
/* A66F4 800A5AF4 02005821 */  addu       $t3, $s0, $zero
/* A66F8 800A5AF8 26100008 */  addiu      $s0, $s0, 8
/* A66FC 800A5AFC 02006021 */  addu       $t4, $s0, $zero
/* A6700 800A5B00 26100008 */  addiu      $s0, $s0, 8
/* A6704 800A5B04 02006821 */  addu       $t5, $s0, $zero
/* A6708 800A5B08 26100008 */  addiu      $s0, $s0, 8
/* A670C 800A5B0C 3C090008 */  lui        $t1, 8
/* A6710 800A5B10 35290200 */  ori        $t1, $t1, 0x200
/* A6714 800A5B14 02007021 */  addu       $t6, $s0, $zero
/* A6718 800A5B18 26100008 */  addiu      $s0, $s0, 8
/* A671C 800A5B1C 02007821 */  addu       $t7, $s0, $zero
/* A6720 800A5B20 26100008 */  addiu      $s0, $s0, 8
/* A6724 800A5B24 02008821 */  addu       $s1, $s0, $zero
/* A6728 800A5B28 46200020 */  cvt.s.d    $f0, $f0
/* A672C 800A5B2C 460C0002 */  mul.s      $f0, $f0, $f12
/* A6730 800A5B30 8FB700A0 */  lw         $s7, 0xa0($sp)
/* A6734 800A5B34 8FA30090 */  lw         $v1, 0x90($sp)
/* A6738 800A5B38 3C01800E */  lui        $at, %hi(D_800E3360)
/* A673C 800A5B3C C4223360 */  lwc1       $f2, %lo(D_800E3360)($at)
/* A6740 800A5B40 00174540 */  sll        $t0, $s7, 0x15
/* A6744 800A5B44 30620FFF */  andi       $v0, $v1, 0xfff
/* A6748 800A5B48 3C03FD08 */  lui        $v1, 0xfd08
/* A674C 800A5B4C 00431025 */  or         $v0, $v0, $v1
/* A6750 800A5B50 01021025 */  or         $v0, $t0, $v0
/* A6754 800A5B54 ACC20000 */  sw         $v0, ($a2)
/* A6758 800A5B58 8FB70010 */  lw         $s7, 0x10($sp)
/* A675C 800A5B5C 3C03F508 */  lui        $v1, 0xf508
/* A6760 800A5B60 ACD70004 */  sw         $s7, 4($a2)
/* A6764 800A5B64 00183080 */  sll        $a2, $t8, 2
/* A6768 800A5B68 8FA20080 */  lw         $v0, 0x80($sp)
/* A676C 800A5B6C 30C60FFF */  andi       $a2, $a2, 0xfff
/* A6770 800A5B70 ACE40004 */  sw         $a0, 4($a3)
/* A6774 800A5B74 2704FFFF */  addiu      $a0, $t8, -1
/* A6778 800A5B78 00932021 */  addu       $a0, $a0, $s3
/* A677C 800A5B7C 00042080 */  sll        $a0, $a0, 2
/* A6780 800A5B80 30840FFF */  andi       $a0, $a0, 0xfff
/* A6784 800A5B84 00522821 */  addu       $a1, $v0, $s2
/* A6788 800A5B88 00BE1023 */  subu       $v0, $a1, $fp
/* A678C 800A5B8C 24420008 */  addiu      $v0, $v0, 8
/* A6790 800A5B90 000210C3 */  sra        $v0, $v0, 3
/* A6794 800A5B94 304201FF */  andi       $v0, $v0, 0x1ff
/* A6798 800A5B98 00021240 */  sll        $v0, $v0, 9
/* A679C 800A5B9C 00431025 */  or         $v0, $v0, $v1
/* A67A0 800A5BA0 01024025 */  or         $t0, $t0, $v0
/* A67A4 800A5BA4 3C02E600 */  lui        $v0, 0xe600
/* A67A8 800A5BA8 ACE80000 */  sw         $t0, ($a3)
/* A67AC 800A5BAC AD420000 */  sw         $v0, ($t2)
/* A67B0 800A5BB0 3C02F400 */  lui        $v0, 0xf400
/* A67B4 800A5BB4 00C21025 */  or         $v0, $a2, $v0
/* A67B8 800A5BB8 00052880 */  sll        $a1, $a1, 2
/* A67BC 800A5BBC 30A50FFF */  andi       $a1, $a1, 0xfff
/* A67C0 800A5BC0 AD400004 */  sw         $zero, 4($t2)
/* A67C4 800A5BC4 8FA30088 */  lw         $v1, 0x88($sp)
/* A67C8 800A5BC8 00052B00 */  sll        $a1, $a1, 0xc
/* A67CC 800A5BCC 30670FFF */  andi       $a3, $v1, 0xfff
/* A67D0 800A5BD0 00073B00 */  sll        $a3, $a3, 0xc
/* A67D4 800A5BD4 00E21025 */  or         $v0, $a3, $v0
/* A67D8 800A5BD8 AD620000 */  sw         $v0, ($t3)
/* A67DC 800A5BDC 3C020700 */  lui        $v0, 0x700
/* A67E0 800A5BE0 00821025 */  or         $v0, $a0, $v0
/* A67E4 800A5BE4 00A21025 */  or         $v0, $a1, $v0
/* A67E8 800A5BE8 3C03E700 */  lui        $v1, 0xe700
/* A67EC 800A5BEC AD620004 */  sw         $v0, 4($t3)
/* A67F0 800A5BF0 3C02F200 */  lui        $v0, 0xf200
/* A67F4 800A5BF4 00C23025 */  or         $a2, $a2, $v0
/* A67F8 800A5BF8 00E63825 */  or         $a3, $a3, $a2
/* A67FC 800A5BFC 00A42825 */  or         $a1, $a1, $a0
/* A6800 800A5C00 AD830000 */  sw         $v1, ($t4)
/* A6804 800A5C04 AD800004 */  sw         $zero, 4($t4)
/* A6808 800A5C08 ADA80000 */  sw         $t0, ($t5)
/* A680C 800A5C0C ADA90004 */  sw         $t1, 4($t5)
/* A6810 800A5C10 ADC70000 */  sw         $a3, ($t6)
/* A6814 800A5C14 ADC50004 */  sw         $a1, 4($t6)
/* A6818 800A5C18 ADE20000 */  sw         $v0, ($t7)
/* A681C 800A5C1C 8FA4008C */  lw         $a0, 0x8c($sp)
/* A6820 800A5C20 8FB70094 */  lw         $s7, 0x94($sp)
/* A6824 800A5C24 00041080 */  sll        $v0, $a0, 2
/* A6828 800A5C28 30420FFF */  andi       $v0, $v0, 0xfff
/* A682C 800A5C2C 00021300 */  sll        $v0, $v0, 0xc
/* A6830 800A5C30 00171880 */  sll        $v1, $s7, 2
/* A6834 800A5C34 30630FFF */  andi       $v1, $v1, 0xfff
/* A6838 800A5C38 00431025 */  or         $v0, $v0, $v1
/* A683C 800A5C3C ADE20004 */  sw         $v0, 4($t7)
/* A6840 800A5C40 8FA3007C */  lw         $v1, 0x7c($sp)
/* A6844 800A5C44 46020082 */  mul.s      $f2, $f0, $f2
/* A6848 800A5C48 00031400 */  sll        $v0, $v1, 0x10
/* A684C 800A5C4C 00021403 */  sra        $v0, $v0, 0x10
/* A6850 800A5C50 18400006 */  blez       $v0, .L800A5C6C
/* A6854 800A5C54 26100008 */   addiu     $s0, $s0, 8
/* A6858 800A5C58 30420FFF */  andi       $v0, $v0, 0xfff
/* A685C 800A5C5C 00021300 */  sll        $v0, $v0, 0xc
/* A6860 800A5C60 3C03E400 */  lui        $v1, 0xe400
/* A6864 800A5C64 0802971C */  j          .L800A5C70
/* A6868 800A5C68 00431025 */   or        $v0, $v0, $v1
.L800A5C6C:
/* A686C 800A5C6C 3C02E400 */  lui        $v0, 0xe400
.L800A5C70:
/* A6870 800A5C70 46023000 */  add.s      $f0, $f6, $f2
/* A6874 800A5C74 00402021 */  addu       $a0, $v0, $zero
/* A6878 800A5C78 4600008D */  trunc.w.s  $f2, $f0
/* A687C 800A5C7C 44021000 */  mfc1       $v0, $f2
/* A6880 800A5C80 00021400 */  sll        $v0, $v0, 0x10
/* A6884 800A5C84 00021403 */  sra        $v0, $v0, 0x10
/* A6888 800A5C88 18400002 */  blez       $v0, .L800A5C94
/* A688C 800A5C8C 30420FFF */   andi      $v0, $v0, 0xfff
/* A6890 800A5C90 00822025 */  or         $a0, $a0, $v0
.L800A5C94:
/* A6894 800A5C94 AE240000 */  sw         $a0, ($s1)
/* A6898 800A5C98 8FA4009C */  lw         $a0, 0x9c($sp)
/* A689C 800A5C9C 00041403 */  sra        $v0, $a0, 0x10
/* A68A0 800A5CA0 18400003 */  blez       $v0, .L800A5CB0
/* A68A4 800A5CA4 30420FFF */   andi      $v0, $v0, 0xfff
/* A68A8 800A5CA8 0802972D */  j          .L800A5CB4
/* A68AC 800A5CAC 00021300 */   sll       $v0, $v0, 0xc
.L800A5CB0:
/* A68B0 800A5CB0 00001021 */  addu       $v0, $zero, $zero
.L800A5CB4:
/* A68B4 800A5CB4 00401821 */  addu       $v1, $v0, $zero
/* A68B8 800A5CB8 4600300D */  trunc.w.s  $f0, $f6
/* A68BC 800A5CBC 44020000 */  mfc1       $v0, $f0
/* A68C0 800A5CC0 00021400 */  sll        $v0, $v0, 0x10
/* A68C4 800A5CC4 00021403 */  sra        $v0, $v0, 0x10
/* A68C8 800A5CC8 18400002 */  blez       $v0, .L800A5CD4
/* A68CC 800A5CCC 30420FFF */   andi      $v0, $v0, 0xfff
/* A68D0 800A5CD0 00621825 */  or         $v1, $v1, $v0
.L800A5CD4:
/* A68D4 800A5CD4 02003021 */  addu       $a2, $s0, $zero
/* A68D8 800A5CD8 3C02E100 */  lui        $v0, 0xe100
/* A68DC 800A5CDC AE230004 */  sw         $v1, 4($s1)
/* A68E0 800A5CE0 ACC20000 */  sw         $v0, ($a2)
/* A68E4 800A5CE4 8FB7009C */  lw         $s7, 0x9c($sp)
/* A68E8 800A5CE8 00171C03 */  sra        $v1, $s7, 0x10
/* A68EC 800A5CEC 04610014 */  bgez       $v1, .L800A5D40
/* A68F0 800A5CF0 26100008 */   addiu     $s0, $s0, 8
/* A68F4 800A5CF4 8FA40014 */  lw         $a0, 0x14($sp)
/* A68F8 800A5CF8 00041400 */  sll        $v0, $a0, 0x10
/* A68FC 800A5CFC 00021403 */  sra        $v0, $v0, 0x10
/* A6900 800A5D00 00620018 */  mult       $v1, $v0
/* A6904 800A5D04 04410007 */  bgez       $v0, .L800A5D24
/* A6908 800A5D08 00000000 */   nop
/* A690C 800A5D0C 00001012 */  mflo       $v0
/* A6910 800A5D10 000211C3 */  sra        $v0, $v0, 7
/* A6914 800A5D14 04410008 */  bgez       $v0, .L800A5D38
/* A6918 800A5D18 00021023 */   negu      $v0, $v0
/* A691C 800A5D1C 0802974D */  j          .L800A5D34
/* A6920 800A5D20 00001021 */   addu      $v0, $zero, $zero
.L800A5D24:
/* A6924 800A5D24 00001012 */  mflo       $v0
/* A6928 800A5D28 000211C3 */  sra        $v0, $v0, 7
/* A692C 800A5D2C 5C400001 */  bgtzl      $v0, .L800A5D34
/* A6930 800A5D30 00001021 */   addu      $v0, $zero, $zero
.L800A5D34:
/* A6934 800A5D34 00021023 */  negu       $v0, $v0
.L800A5D38:
/* A6938 800A5D38 08029751 */  j          .L800A5D44
/* A693C 800A5D3C 00022C00 */   sll       $a1, $v0, 0x10
.L800A5D40:
/* A6940 800A5D40 00002821 */  addu       $a1, $zero, $zero
.L800A5D44:
/* A6944 800A5D44 4600300D */  trunc.w.s  $f0, $f6
/* A6948 800A5D48 44030000 */  mfc1       $v1, $f0
/* A694C 800A5D4C 04610237 */  bgez       $v1, .L800A662C
/* A6950 800A5D50 00A01021 */   addu      $v0, $a1, $zero
/* A6954 800A5D54 8FA40018 */  lw         $a0, 0x18($sp)
/* A6958 800A5D58 00041400 */  sll        $v0, $a0, 0x10
/* A695C 800A5D5C 00022403 */  sra        $a0, $v0, 0x10
/* A6960 800A5D60 04810229 */  bgez       $a0, .L800A6608
/* A6964 800A5D64 00031400 */   sll       $v0, $v1, 0x10
/* A6968 800A5D68 00021403 */  sra        $v0, $v0, 0x10
/* A696C 800A5D6C 00440018 */  mult       $v0, $a0
/* A6970 800A5D70 00001012 */  mflo       $v0
/* A6974 800A5D74 000211C3 */  sra        $v0, $v0, 7
/* A6978 800A5D78 0443022A */  bgezl      $v0, .L800A6624
/* A697C 800A5D7C 00021023 */   negu      $v0, $v0
/* A6980 800A5D80 08029988 */  j          .L800A6620
/* A6984 800A5D84 00001021 */   addu      $v0, $zero, $zero
/* A6988 800A5D88 2A420010 */  slti       $v0, $s2, 0x10
/* A698C 800A5D8C 10400003 */  beqz       $v0, .L800A5D9C
/* A6990 800A5D90 24020010 */   addiu     $v0, $zero, 0x10
/* A6994 800A5D94 0802976B */  j          .L800A5DAC
/* A6998 800A5D98 00521023 */   subu      $v0, $v0, $s2
.L800A5D9C:
/* A699C 800A5D9C 3243000F */  andi       $v1, $s2, 0xf
/* A69A0 800A5DA0 14600002 */  bnez       $v1, .L800A5DAC
/* A69A4 800A5DA4 00431023 */   subu      $v0, $v0, $v1
/* A69A8 800A5DA8 00001021 */  addu       $v0, $zero, $zero
.L800A5DAC:
/* A69AC 800A5DAC 02421021 */  addu       $v0, $s2, $v0
/* A69B0 800A5DB0 95E30008 */  lhu        $v1, 8($t7)
/* A69B4 800A5DB4 00022042 */  srl        $a0, $v0, 1
/* A69B8 800A5DB8 24020007 */  addiu      $v0, $zero, 7
/* A69BC 800A5DBC 14620003 */  bne        $v1, $v0, .L800A5DCC
/* A69C0 800A5DC0 00603021 */   addu      $a2, $v1, $zero
/* A69C4 800A5DC4 08029774 */  j          .L800A5DD0
/* A69C8 800A5DC8 24020800 */   addiu     $v0, $zero, 0x800
.L800A5DCC:
/* A69CC 800A5DCC 24021000 */  addiu      $v0, $zero, 0x1000
.L800A5DD0:
/* A69D0 800A5DD0 0044001B */  divu       $zero, $v0, $a0
/* A69D4 800A5DD4 00001012 */  mflo       $v0
/* A69D8 800A5DD8 50800001 */  beql       $a0, $zero, .L800A5DE0
/* A69DC 800A5DDC 000001CD */   break     0, 7
.L800A5DE0:
/* A69E0 800A5DE0 244DFFFF */   addiu     $t5, $v0, -1
/* A69E4 800A5DE4 00AD001B */  divu       $zero, $a1, $t5
/* A69E8 800A5DE8 00001812 */  mflo       $v1
/* A69EC 800A5DEC 51A00001 */  beql       $t5, $zero, .L800A5DF4
/* A69F0 800A5DF0 000001CD */   break     0, 7
.L800A5DF4:
/* A69F4 800A5DF4 00608821 */   addu      $s1, $v1, $zero
/* A69F8 800A5DF8 022D0018 */  mult       $s1, $t5
/* A69FC 800A5DFC 00001012 */  mflo       $v0
/* A6A00 800A5E00 00A29823 */  subu       $s3, $a1, $v0
/* A6A04 800A5E04 16600003 */  bnez       $s3, .L800A5E14
/* A6A08 800A5E08 00000000 */   nop
/* A6A0C 800A5E0C 2631FFFF */  addiu      $s1, $s1, -1
/* A6A10 800A5E10 01A09821 */  addu       $s3, $t5, $zero
.L800A5E14:
/* A6A14 800A5E14 448D1000 */  mtc1       $t5, $f2
/* A6A18 800A5E18 468010A1 */  cvt.d.w    $f2, $f2
/* A6A1C 800A5E1C 05A30005 */  bgezl      $t5, .L800A5E34
/* A6A20 800A5E20 46201020 */   cvt.s.d   $f0, $f2
/* A6A24 800A5E24 3C01800E */  lui        $at, %hi(D_800E3368)
/* A6A28 800A5E28 D4203368 */  ldc1       $f0, %lo(D_800E3368)($at)
/* A6A2C 800A5E2C 46201080 */  add.d      $f2, $f2, $f0
/* A6A30 800A5E30 46201020 */  cvt.s.d    $f0, $f2
.L800A5E34:
/* A6A34 800A5E34 460C0002 */  mul.s      $f0, $f0, $f12
/* A6A38 800A5E38 3C01800E */  lui        $at, %hi(D_800E3370)
/* A6A3C 800A5E3C C4223370 */  lwc1       $f2, %lo(D_800E3370)($at)
/* A6A40 800A5E40 30C3FFFF */  andi       $v1, $a2, 0xffff
/* A6A44 800A5E44 24020007 */  addiu      $v0, $zero, 7
/* A6A48 800A5E48 46020082 */  mul.s      $f2, $f0, $f2
/* A6A4C 800A5E4C 14620031 */  bne        $v1, $v0, .L800A5F14
/* A6A50 800A5E50 24020008 */   addiu     $v0, $zero, 8
/* A6A54 800A5E54 240E0002 */  addiu      $t6, $zero, 2
/* A6A58 800A5E58 02003021 */  addu       $a2, $s0, $zero
/* A6A5C 800A5E5C 26100008 */  addiu      $s0, $s0, 8
/* A6A60 800A5E60 3C03E300 */  lui        $v1, 0xe300
/* A6A64 800A5E64 34631001 */  ori        $v1, $v1, 0x1001
/* A6A68 800A5E68 02003821 */  addu       $a3, $s0, $zero
/* A6A6C 800A5E6C 26100008 */  addiu      $s0, $s0, 8
/* A6A70 800A5E70 02004021 */  addu       $t0, $s0, $zero
/* A6A74 800A5E74 26100008 */  addiu      $s0, $s0, 8
/* A6A78 800A5E78 02005821 */  addu       $t3, $s0, $zero
/* A6A7C 800A5E7C 26100008 */  addiu      $s0, $s0, 8
/* A6A80 800A5E80 3C04F500 */  lui        $a0, 0xf500
/* A6A84 800A5E84 34840100 */  ori        $a0, $a0, 0x100
/* A6A88 800A5E88 02004821 */  addu       $t1, $s0, $zero
/* A6A8C 800A5E8C 26100008 */  addiu      $s0, $s0, 8
/* A6A90 800A5E90 02006021 */  addu       $t4, $s0, $zero
/* A6A94 800A5E94 26100008 */  addiu      $s0, $s0, 8
/* A6A98 800A5E98 3C050703 */  lui        $a1, 0x703
/* A6A9C 800A5E9C 34A5C000 */  ori        $a1, $a1, 0xc000
/* A6AA0 800A5EA0 02005021 */  addu       $t2, $s0, $zero
/* A6AA4 800A5EA4 26100008 */  addiu      $s0, $s0, 8
/* A6AA8 800A5EA8 34028000 */  ori        $v0, $zero, 0x8000
/* A6AAC 800A5EAC ACC30000 */  sw         $v1, ($a2)
/* A6AB0 800A5EB0 3C03FD10 */  lui        $v1, 0xfd10
/* A6AB4 800A5EB4 ACC20004 */  sw         $v0, 4($a2)
/* A6AB8 800A5EB8 02003021 */  addu       $a2, $s0, $zero
/* A6ABC 800A5EBC 26100008 */  addiu      $s0, $s0, 8
/* A6AC0 800A5EC0 ACE30000 */  sw         $v1, ($a3)
/* A6AC4 800A5EC4 8DE30010 */  lw         $v1, 0x10($t7)
/* A6AC8 800A5EC8 3C02E800 */  lui        $v0, 0xe800
/* A6ACC 800A5ECC ACE30004 */  sw         $v1, 4($a3)
/* A6AD0 800A5ED0 AD020000 */  sw         $v0, ($t0)
/* A6AD4 800A5ED4 3C020700 */  lui        $v0, 0x700
/* A6AD8 800A5ED8 3C03E600 */  lui        $v1, 0xe600
/* A6ADC 800A5EDC AD000004 */  sw         $zero, 4($t0)
/* A6AE0 800A5EE0 AD620004 */  sw         $v0, 4($t3)
/* A6AE4 800A5EE4 3C02F000 */  lui        $v0, 0xf000
/* A6AE8 800A5EE8 AD640000 */  sw         $a0, ($t3)
/* A6AEC 800A5EEC AD230000 */  sw         $v1, ($t1)
/* A6AF0 800A5EF0 AD200004 */  sw         $zero, 4($t1)
/* A6AF4 800A5EF4 AD820000 */  sw         $v0, ($t4)
/* A6AF8 800A5EF8 3C02E700 */  lui        $v0, 0xe700
/* A6AFC 800A5EFC AD850004 */  sw         $a1, 4($t4)
/* A6B00 800A5F00 AD420000 */  sw         $v0, ($t2)
/* A6B04 800A5F04 AD400004 */  sw         $zero, 4($t2)
/* A6B08 800A5F08 ACC30000 */  sw         $v1, ($a2)
/* A6B0C 800A5F0C 080297CE */  j          .L800A5F38
/* A6B10 800A5F10 ACC00004 */   sw        $zero, 4($a2)
.L800A5F14:
/* A6B14 800A5F14 14620002 */  bne        $v1, $v0, .L800A5F20
/* A6B18 800A5F18 240E0004 */   addiu     $t6, $zero, 4
/* A6B1C 800A5F1C 240E0003 */  addiu      $t6, $zero, 3
.L800A5F20:
/* A6B20 800A5F20 02001821 */  addu       $v1, $s0, $zero
/* A6B24 800A5F24 26100008 */  addiu      $s0, $s0, 8
/* A6B28 800A5F28 3C02E300 */  lui        $v0, 0xe300
/* A6B2C 800A5F2C 34421001 */  ori        $v0, $v0, 0x1001
/* A6B30 800A5F30 AC620000 */  sw         $v0, ($v1)
/* A6B34 800A5F34 AC600004 */  sw         $zero, 4($v1)
.L800A5F38:
/* A6B38 800A5F38 00007821 */  addu       $t7, $zero, $zero
/* A6B3C 800A5F3C 27C2FFFF */  addiu      $v0, $fp, -1
/* A6B40 800A5F40 001E1880 */  sll        $v1, $fp, 2
/* A6B44 800A5F44 2644FFFF */  addiu      $a0, $s2, -1
/* A6B48 800A5F48 0334A021 */  addu       $s4, $t9, $s4
/* A6B4C 800A5F4C 0019CC00 */  sll        $t9, $t9, 0x10
/* A6B50 800A5F50 44932000 */  mtc1       $s3, $f4
/* A6B54 800A5F54 46802121 */  cvt.d.w    $f4, $f4
/* A6B58 800A5F58 AFA30088 */  sw         $v1, 0x88($sp)
/* A6B5C 800A5F5C 2663FFFF */  addiu      $v1, $s3, -1
/* A6B60 800A5F60 8FB70014 */  lw         $s7, 0x14($sp)
/* A6B64 800A5F64 31CE0007 */  andi       $t6, $t6, 7
/* A6B68 800A5F68 AFA20080 */  sw         $v0, 0x80($sp)
/* A6B6C 800A5F6C 8FA20018 */  lw         $v0, 0x18($sp)
/* A6B70 800A5F70 0015A843 */  sra        $s5, $s5, 1
/* A6B74 800A5F74 AFA4008C */  sw         $a0, 0x8c($sp)
/* A6B78 800A5F78 001E2040 */  sll        $a0, $fp, 1
/* A6B7C 800A5F7C AFB4007C */  sw         $s4, 0x7c($sp)
/* A6B80 800A5F80 AFB9009C */  sw         $t9, 0x9c($sp)
/* A6B84 800A5F84 AFA30094 */  sw         $v1, 0x94($sp)
/* A6B88 800A5F88 AFAE00A0 */  sw         $t6, 0xa0($sp)
/* A6B8C 800A5F8C AFB50098 */  sw         $s5, 0x98($sp)
/* A6B90 800A5F90 AFA40084 */  sw         $a0, 0x84($sp)
/* A6B94 800A5F94 32F7FFFF */  andi       $s7, $s7, 0xffff
/* A6B98 800A5F98 3042FFFF */  andi       $v0, $v0, 0xffff
/* A6B9C 800A5F9C AFB700A4 */  sw         $s7, 0xa4($sp)
/* A6BA0 800A5FA0 122000DB */  beqz       $s1, .L800A6310
/* A6BA4 800A5FA4 AFA200A8 */   sw        $v0, 0xa8($sp)
/* A6BA8 800A5FA8 000E3540 */  sll        $a2, $t6, 0x15
/* A6BAC 800A5FAC 26A2FFFF */  addiu      $v0, $s5, -1
/* A6BB0 800A5FB0 30420FFF */  andi       $v0, $v0, 0xfff
/* A6BB4 800A5FB4 3C03FD08 */  lui        $v1, 0xfd08
/* A6BB8 800A5FB8 00431025 */  or         $v0, $v0, $v1
/* A6BBC 800A5FBC 00C21025 */  or         $v0, $a2, $v0
/* A6BC0 800A5FC0 AFA20058 */  sw         $v0, 0x58($sp)
/* A6BC4 800A5FC4 3C02F508 */  lui        $v0, 0xf508
/* A6BC8 800A5FC8 30840FFF */  andi       $a0, $a0, 0xfff
/* A6BCC 800A5FCC 00042300 */  sll        $a0, $a0, 0xc
/* A6BD0 800A5FD0 8FB70080 */  lw         $s7, 0x80($sp)
/* A6BD4 800A5FD4 3C16F200 */  lui        $s6, 0xf200
/* A6BD8 800A5FD8 AFA40060 */  sw         $a0, 0x60($sp)
/* A6BDC 800A5FDC 8FA4008C */  lw         $a0, 0x8c($sp)
/* A6BE0 800A5FE0 02F22821 */  addu       $a1, $s7, $s2
/* A6BE4 800A5FE4 00BE1823 */  subu       $v1, $a1, $fp
/* A6BE8 800A5FE8 24630001 */  addiu      $v1, $v1, 1
/* A6BEC 800A5FEC 00031843 */  sra        $v1, $v1, 1
/* A6BF0 800A5FF0 24630007 */  addiu      $v1, $v1, 7
/* A6BF4 800A5FF4 000318C3 */  sra        $v1, $v1, 3
/* A6BF8 800A5FF8 306301FF */  andi       $v1, $v1, 0x1ff
/* A6BFC 800A5FFC 00031A40 */  sll        $v1, $v1, 9
/* A6C00 800A6000 00621025 */  or         $v0, $v1, $v0
/* A6C04 800A6004 00C21025 */  or         $v0, $a2, $v0
/* A6C08 800A6008 AFA2005C */  sw         $v0, 0x5c($sp)
/* A6C0C 800A600C 00051040 */  sll        $v0, $a1, 1
/* A6C10 800A6010 30420FFF */  andi       $v0, $v0, 0xfff
/* A6C14 800A6014 00021300 */  sll        $v0, $v0, 0xc
/* A6C18 800A6018 00052880 */  sll        $a1, $a1, 2
/* A6C1C 800A601C 30A50FFF */  andi       $a1, $a1, 0xfff
/* A6C20 800A6020 AFA20064 */  sw         $v0, 0x64($sp)
/* A6C24 800A6024 3C02F500 */  lui        $v0, 0xf500
/* A6C28 800A6028 00621825 */  or         $v1, $v1, $v0
/* A6C2C 800A602C 00C33025 */  or         $a2, $a2, $v1
/* A6C30 800A6030 8FA30088 */  lw         $v1, 0x88($sp)
/* A6C34 800A6034 8FB700A4 */  lw         $s7, 0xa4($sp)
/* A6C38 800A6038 00052B00 */  sll        $a1, $a1, 0xc
/* A6C3C 800A603C AFA50070 */  sw         $a1, 0x70($sp)
/* A6C40 800A6040 AFA60068 */  sw         $a2, 0x68($sp)
/* A6C44 800A6044 30620FFF */  andi       $v0, $v1, 0xfff
/* A6C48 800A6048 00021300 */  sll        $v0, $v0, 0xc
/* A6C4C 800A604C 00041880 */  sll        $v1, $a0, 2
/* A6C50 800A6050 30630FFF */  andi       $v1, $v1, 0xfff
/* A6C54 800A6054 00031B00 */  sll        $v1, $v1, 0xc
/* A6C58 800A6058 AFA2006C */  sw         $v0, 0x6c($sp)
/* A6C5C 800A605C 000D1080 */  sll        $v0, $t5, 2
/* A6C60 800A6060 30420FFF */  andi       $v0, $v0, 0xfff
/* A6C64 800A6064 00621825 */  or         $v1, $v1, $v0
/* A6C68 800A6068 00142400 */  sll        $a0, $s4, 0x10
/* A6C6C 800A606C 0004AC03 */  sra        $s5, $a0, 0x10
/* A6C70 800A6070 32A20FFF */  andi       $v0, $s5, 0xfff
/* A6C74 800A6074 00021300 */  sll        $v0, $v0, 0xc
/* A6C78 800A6078 AFA30074 */  sw         $v1, 0x74($sp)
/* A6C7C 800A607C 8FA300A8 */  lw         $v1, 0xa8($sp)
/* A6C80 800A6080 0320A021 */  addu       $s4, $t9, $zero
/* A6C84 800A6084 AFA20078 */  sw         $v0, 0x78($sp)
/* A6C88 800A6088 00171400 */  sll        $v0, $s7, 0x10
/* A6C8C 800A608C 00431025 */  or         $v0, $v0, $v1
/* A6C90 800A6090 AFA200B0 */  sw         $v0, 0xb0($sp)
.L800A6094:
/* A6C94 800A6094 02001021 */  addu       $v0, $s0, $zero
/* A6C98 800A6098 26100008 */  addiu      $s0, $s0, 8
/* A6C9C 800A609C 02002021 */  addu       $a0, $s0, $zero
/* A6CA0 800A60A0 26100008 */  addiu      $s0, $s0, 8
/* A6CA4 800A60A4 3C030708 */  lui        $v1, 0x708
/* A6CA8 800A60A8 34630200 */  ori        $v1, $v1, 0x200
/* A6CAC 800A60AC 02003821 */  addu       $a3, $s0, $zero
/* A6CB0 800A60B0 26100008 */  addiu      $s0, $s0, 8
/* A6CB4 800A60B4 02004021 */  addu       $t0, $s0, $zero
/* A6CB8 800A60B8 26100008 */  addiu      $s0, $s0, 8
/* A6CBC 800A60BC 02004821 */  addu       $t1, $s0, $zero
/* A6CC0 800A60C0 26100008 */  addiu      $s0, $s0, 8
/* A6CC4 800A60C4 02005021 */  addu       $t2, $s0, $zero
/* A6CC8 800A60C8 26100008 */  addiu      $s0, $s0, 8
/* A6CCC 800A60CC 3C060008 */  lui        $a2, 8
/* A6CD0 800A60D0 34C60200 */  ori        $a2, $a2, 0x200
/* A6CD4 800A60D4 02005821 */  addu       $t3, $s0, $zero
/* A6CD8 800A60D8 26100008 */  addiu      $s0, $s0, 8
/* A6CDC 800A60DC 02006021 */  addu       $t4, $s0, $zero
/* A6CE0 800A60E0 030D2821 */  addu       $a1, $t8, $t5
/* A6CE4 800A60E4 8FB70058 */  lw         $s7, 0x58($sp)
/* A6CE8 800A60E8 00A0C821 */  addu       $t9, $a1, $zero
/* A6CEC 800A60EC AC570000 */  sw         $s7, ($v0)
/* A6CF0 800A60F0 8FB70010 */  lw         $s7, 0x10($sp)
/* A6CF4 800A60F4 00052880 */  sll        $a1, $a1, 2
/* A6CF8 800A60F8 AC570004 */  sw         $s7, 4($v0)
/* A6CFC 800A60FC 8FA2005C */  lw         $v0, 0x5c($sp)
/* A6D00 800A6100 30A50FFF */  andi       $a1, $a1, 0xfff
/* A6D04 800A6104 AC830004 */  sw         $v1, 4($a0)
/* A6D08 800A6108 AC820000 */  sw         $v0, ($a0)
/* A6D0C 800A610C 3C02E600 */  lui        $v0, 0xe600
/* A6D10 800A6110 00182080 */  sll        $a0, $t8, 2
/* A6D14 800A6114 30840FFF */  andi       $a0, $a0, 0xfff
/* A6D18 800A6118 ACE20000 */  sw         $v0, ($a3)
/* A6D1C 800A611C 3C02F400 */  lui        $v0, 0xf400
/* A6D20 800A6120 ACE00004 */  sw         $zero, 4($a3)
/* A6D24 800A6124 8FA30060 */  lw         $v1, 0x60($sp)
/* A6D28 800A6128 00821025 */  or         $v0, $a0, $v0
/* A6D2C 800A612C 00621025 */  or         $v0, $v1, $v0
/* A6D30 800A6130 AD020000 */  sw         $v0, ($t0)
/* A6D34 800A6134 3C020700 */  lui        $v0, 0x700
/* A6D38 800A6138 00A21025 */  or         $v0, $a1, $v0
/* A6D3C 800A613C 8FB70064 */  lw         $s7, 0x64($sp)
/* A6D40 800A6140 3C03E700 */  lui        $v1, 0xe700
/* A6D44 800A6144 02E21025 */  or         $v0, $s7, $v0
/* A6D48 800A6148 AD020004 */  sw         $v0, 4($t0)
/* A6D4C 800A614C AD230000 */  sw         $v1, ($t1)
/* A6D50 800A6150 AD200004 */  sw         $zero, 4($t1)
/* A6D54 800A6154 8FA20068 */  lw         $v0, 0x68($sp)
/* A6D58 800A6158 26100008 */  addiu      $s0, $s0, 8
/* A6D5C 800A615C AD460004 */  sw         $a2, 4($t2)
/* A6D60 800A6160 AD420000 */  sw         $v0, ($t2)
/* A6D64 800A6164 8FA3006C */  lw         $v1, 0x6c($sp)
/* A6D68 800A6168 00962025 */  or         $a0, $a0, $s6
/* A6D6C 800A616C 00642025 */  or         $a0, $v1, $a0
/* A6D70 800A6170 AD640000 */  sw         $a0, ($t3)
/* A6D74 800A6174 8FA40070 */  lw         $a0, 0x70($sp)
/* A6D78 800A6178 02007021 */  addu       $t6, $s0, $zero
/* A6D7C 800A617C 00852825 */  or         $a1, $a0, $a1
/* A6D80 800A6180 AD650004 */  sw         $a1, 4($t3)
/* A6D84 800A6184 AD960000 */  sw         $s6, ($t4)
/* A6D88 800A6188 8FB70074 */  lw         $s7, 0x74($sp)
/* A6D8C 800A618C 26100008 */  addiu      $s0, $s0, 8
/* A6D90 800A6190 1AA00005 */  blez       $s5, .L800A61A8
/* A6D94 800A6194 AD970004 */   sw        $s7, 4($t4)
/* A6D98 800A6198 8FA30078 */  lw         $v1, 0x78($sp)
/* A6D9C 800A619C 3C02E400 */  lui        $v0, 0xe400
/* A6DA0 800A61A0 0802986B */  j          .L800A61AC
/* A6DA4 800A61A4 00621025 */   or        $v0, $v1, $v0
.L800A61A8:
/* A6DA8 800A61A8 3C02E400 */  lui        $v0, 0xe400
.L800A61AC:
/* A6DAC 800A61AC 46023000 */  add.s      $f0, $f6, $f2
/* A6DB0 800A61B0 00401821 */  addu       $v1, $v0, $zero
/* A6DB4 800A61B4 4600020D */  trunc.w.s  $f8, $f0
/* A6DB8 800A61B8 44024000 */  mfc1       $v0, $f8
/* A6DBC 800A61BC 00021400 */  sll        $v0, $v0, 0x10
/* A6DC0 800A61C0 00021403 */  sra        $v0, $v0, 0x10
/* A6DC4 800A61C4 18400002 */  blez       $v0, .L800A61D0
/* A6DC8 800A61C8 30420FFF */   andi      $v0, $v0, 0xfff
/* A6DCC 800A61CC 00621825 */  or         $v1, $v1, $v0
.L800A61D0:
/* A6DD0 800A61D0 00141403 */  sra        $v0, $s4, 0x10
/* A6DD4 800A61D4 18400004 */  blez       $v0, .L800A61E8
/* A6DD8 800A61D8 ADC30000 */   sw        $v1, ($t6)
/* A6DDC 800A61DC 30420FFF */  andi       $v0, $v0, 0xfff
/* A6DE0 800A61E0 0802987B */  j          .L800A61EC
/* A6DE4 800A61E4 00021300 */   sll       $v0, $v0, 0xc
.L800A61E8:
/* A6DE8 800A61E8 00001021 */  addu       $v0, $zero, $zero
.L800A61EC:
/* A6DEC 800A61EC 00401821 */  addu       $v1, $v0, $zero
/* A6DF0 800A61F0 4600300D */  trunc.w.s  $f0, $f6
/* A6DF4 800A61F4 44020000 */  mfc1       $v0, $f0
/* A6DF8 800A61F8 00021400 */  sll        $v0, $v0, 0x10
/* A6DFC 800A61FC 00021403 */  sra        $v0, $v0, 0x10
/* A6E00 800A6200 18400002 */  blez       $v0, .L800A620C
/* A6E04 800A6204 30420FFF */   andi      $v0, $v0, 0xfff
/* A6E08 800A6208 00621825 */  or         $v1, $v1, $v0
.L800A620C:
/* A6E0C 800A620C 02003021 */  addu       $a2, $s0, $zero
/* A6E10 800A6210 26100008 */  addiu      $s0, $s0, 8
/* A6E14 800A6214 3C02E100 */  lui        $v0, 0xe100
/* A6E18 800A6218 ADC30004 */  sw         $v1, 4($t6)
/* A6E1C 800A621C 00141C03 */  sra        $v1, $s4, 0x10
/* A6E20 800A6220 04610014 */  bgez       $v1, .L800A6274
/* A6E24 800A6224 ACC20000 */   sw        $v0, ($a2)
/* A6E28 800A6228 8FB70014 */  lw         $s7, 0x14($sp)
/* A6E2C 800A622C 00171400 */  sll        $v0, $s7, 0x10
/* A6E30 800A6230 00021403 */  sra        $v0, $v0, 0x10
/* A6E34 800A6234 00620018 */  mult       $v1, $v0
/* A6E38 800A6238 04410007 */  bgez       $v0, .L800A6258
/* A6E3C 800A623C 00000000 */   nop
/* A6E40 800A6240 00001012 */  mflo       $v0
/* A6E44 800A6244 000211C3 */  sra        $v0, $v0, 7
/* A6E48 800A6248 04410008 */  bgez       $v0, .L800A626C
/* A6E4C 800A624C 00021023 */   negu      $v0, $v0
/* A6E50 800A6250 0802989A */  j          .L800A6268
/* A6E54 800A6254 00001021 */   addu      $v0, $zero, $zero
.L800A6258:
/* A6E58 800A6258 00001012 */  mflo       $v0
/* A6E5C 800A625C 000211C3 */  sra        $v0, $v0, 7
/* A6E60 800A6260 5C400001 */  bgtzl      $v0, .L800A6268
/* A6E64 800A6264 00001021 */   addu      $v0, $zero, $zero
.L800A6268:
/* A6E68 800A6268 00021023 */  negu       $v0, $v0
.L800A626C:
/* A6E6C 800A626C 0802989E */  j          .L800A6278
/* A6E70 800A6270 00022C00 */   sll       $a1, $v0, 0x10
.L800A6274:
/* A6E74 800A6274 00002821 */  addu       $a1, $zero, $zero
.L800A6278:
/* A6E78 800A6278 4600300D */  trunc.w.s  $f0, $f6
/* A6E7C 800A627C 44030000 */  mfc1       $v1, $f0
/* A6E80 800A6280 04630017 */  bgezl      $v1, .L800A62E0
/* A6E84 800A6284 00A01821 */   addu      $v1, $a1, $zero
/* A6E88 800A6288 8FA40018 */  lw         $a0, 0x18($sp)
/* A6E8C 800A628C 00041400 */  sll        $v0, $a0, 0x10
/* A6E90 800A6290 00022403 */  sra        $a0, $v0, 0x10
/* A6E94 800A6294 04810009 */  bgez       $a0, .L800A62BC
/* A6E98 800A6298 00031400 */   sll       $v0, $v1, 0x10
/* A6E9C 800A629C 00021403 */  sra        $v0, $v0, 0x10
/* A6EA0 800A62A0 00440018 */  mult       $v0, $a0
/* A6EA4 800A62A4 00001012 */  mflo       $v0
/* A6EA8 800A62A8 000211C3 */  sra        $v0, $v0, 7
/* A6EAC 800A62AC 0441000A */  bgez       $v0, .L800A62D8
/* A6EB0 800A62B0 00021023 */   negu      $v0, $v0
/* A6EB4 800A62B4 080298B5 */  j          .L800A62D4
/* A6EB8 800A62B8 00001021 */   addu      $v0, $zero, $zero
.L800A62BC:
/* A6EBC 800A62BC 00021403 */  sra        $v0, $v0, 0x10
/* A6EC0 800A62C0 00440018 */  mult       $v0, $a0
/* A6EC4 800A62C4 00001012 */  mflo       $v0
/* A6EC8 800A62C8 000211C3 */  sra        $v0, $v0, 7
/* A6ECC 800A62CC 5C400001 */  bgtzl      $v0, .L800A62D4
/* A6ED0 800A62D0 00001021 */   addu      $v0, $zero, $zero
.L800A62D4:
/* A6ED4 800A62D4 00021023 */  negu       $v0, $v0
.L800A62D8:
/* A6ED8 800A62D8 3042FFFF */  andi       $v0, $v0, 0xffff
/* A6EDC 800A62DC 00A21825 */  or         $v1, $a1, $v0
.L800A62E0:
/* A6EE0 800A62E0 02001021 */  addu       $v0, $s0, $zero
/* A6EE4 800A62E4 26100008 */  addiu      $s0, $s0, 8
/* A6EE8 800A62E8 0320C021 */  addu       $t8, $t9, $zero
/* A6EEC 800A62EC 25EF0001 */  addiu      $t7, $t7, 1
/* A6EF0 800A62F0 ACC30004 */  sw         $v1, 4($a2)
/* A6EF4 800A62F4 3C03F100 */  lui        $v1, 0xf100
/* A6EF8 800A62F8 AC430000 */  sw         $v1, ($v0)
/* A6EFC 800A62FC 8FA300B0 */  lw         $v1, 0xb0($sp)
/* A6F00 800A6300 AC430004 */  sw         $v1, 4($v0)
/* A6F04 800A6304 01F1182B */  sltu       $v1, $t7, $s1
/* A6F08 800A6308 1460FF62 */  bnez       $v1, .L800A6094
/* A6F0C 800A630C 46023180 */   add.s     $f6, $f6, $f2
.L800A6310:
/* A6F10 800A6310 06610004 */  bgez       $s3, .L800A6324
/* A6F14 800A6314 46202086 */   mov.d     $f2, $f4
/* A6F18 800A6318 3C01800E */  lui        $at, %hi(D_800E3378)
/* A6F1C 800A631C D4203378 */  ldc1       $f0, %lo(D_800E3378)($at)
/* A6F20 800A6320 46201080 */  add.d      $f2, $f2, $f0
.L800A6324:
/* A6F24 800A6324 02002021 */  addu       $a0, $s0, $zero
/* A6F28 800A6328 26100008 */  addiu      $s0, $s0, 8
/* A6F2C 800A632C 02005021 */  addu       $t2, $s0, $zero
/* A6F30 800A6330 26100008 */  addiu      $s0, $s0, 8
/* A6F34 800A6334 3C050708 */  lui        $a1, 0x708
/* A6F38 800A6338 34A50200 */  ori        $a1, $a1, 0x200
/* A6F3C 800A633C 02003821 */  addu       $a3, $s0, $zero
/* A6F40 800A6340 26100008 */  addiu      $s0, $s0, 8
/* A6F44 800A6344 02005821 */  addu       $t3, $s0, $zero
/* A6F48 800A6348 26100008 */  addiu      $s0, $s0, 8
/* A6F4C 800A634C 02006021 */  addu       $t4, $s0, $zero
/* A6F50 800A6350 26100008 */  addiu      $s0, $s0, 8
/* A6F54 800A6354 02006821 */  addu       $t5, $s0, $zero
/* A6F58 800A6358 26100008 */  addiu      $s0, $s0, 8
/* A6F5C 800A635C 3C090008 */  lui        $t1, 8
/* A6F60 800A6360 35290200 */  ori        $t1, $t1, 0x200
/* A6F64 800A6364 02007021 */  addu       $t6, $s0, $zero
/* A6F68 800A6368 26100008 */  addiu      $s0, $s0, 8
/* A6F6C 800A636C 02007821 */  addu       $t7, $s0, $zero
/* A6F70 800A6370 26100008 */  addiu      $s0, $s0, 8
/* A6F74 800A6374 02008821 */  addu       $s1, $s0, $zero
/* A6F78 800A6378 46201020 */  cvt.s.d    $f0, $f2
/* A6F7C 800A637C 8FB700A0 */  lw         $s7, 0xa0($sp)
/* A6F80 800A6380 8FA30098 */  lw         $v1, 0x98($sp)
/* A6F84 800A6384 3C01800E */  lui        $at, %hi(D_800E3380)
/* A6F88 800A6388 C4223380 */  lwc1       $f2, %lo(D_800E3380)($at)
/* A6F8C 800A638C 00174540 */  sll        $t0, $s7, 0x15
/* A6F90 800A6390 2462FFFF */  addiu      $v0, $v1, -1
/* A6F94 800A6394 30420FFF */  andi       $v0, $v0, 0xfff
/* A6F98 800A6398 3C03FD08 */  lui        $v1, 0xfd08
/* A6F9C 800A639C 00431025 */  or         $v0, $v0, $v1
/* A6FA0 800A63A0 01021025 */  or         $v0, $t0, $v0
/* A6FA4 800A63A4 AC820000 */  sw         $v0, ($a0)
/* A6FA8 800A63A8 8FB70010 */  lw         $s7, 0x10($sp)
/* A6FAC 800A63AC AC970004 */  sw         $s7, 4($a0)
/* A6FB0 800A63B0 8FA20080 */  lw         $v0, 0x80($sp)
/* A6FB4 800A63B4 460C0002 */  mul.s      $f0, $f0, $f12
/* A6FB8 800A63B8 AD450004 */  sw         $a1, 4($t2)
/* A6FBC 800A63BC 00523021 */  addu       $a2, $v0, $s2
/* A6FC0 800A63C0 00DE2023 */  subu       $a0, $a2, $fp
/* A6FC4 800A63C4 24840001 */  addiu      $a0, $a0, 1
/* A6FC8 800A63C8 00042043 */  sra        $a0, $a0, 1
/* A6FCC 800A63CC 24840007 */  addiu      $a0, $a0, 7
/* A6FD0 800A63D0 000420C3 */  sra        $a0, $a0, 3
/* A6FD4 800A63D4 308401FF */  andi       $a0, $a0, 0x1ff
/* A6FD8 800A63D8 00042240 */  sll        $a0, $a0, 9
/* A6FDC 800A63DC 3C02F508 */  lui        $v0, 0xf508
/* A6FE0 800A63E0 00821025 */  or         $v0, $a0, $v0
/* A6FE4 800A63E4 01021025 */  or         $v0, $t0, $v0
/* A6FE8 800A63E8 AD420000 */  sw         $v0, ($t2)
/* A6FEC 800A63EC 3C02E600 */  lui        $v0, 0xe600
/* A6FF0 800A63F0 ACE20000 */  sw         $v0, ($a3)
/* A6FF4 800A63F4 ACE00004 */  sw         $zero, 4($a3)
/* A6FF8 800A63F8 00183880 */  sll        $a3, $t8, 2
/* A6FFC 800A63FC 30E70FFF */  andi       $a3, $a3, 0xfff
/* A7000 800A6400 3C02F400 */  lui        $v0, 0xf400
/* A7004 800A6404 8FA30084 */  lw         $v1, 0x84($sp)
/* A7008 800A6408 00E21025 */  or         $v0, $a3, $v0
/* A700C 800A640C 30650FFF */  andi       $a1, $v1, 0xfff
/* A7010 800A6410 00052B00 */  sll        $a1, $a1, 0xc
/* A7014 800A6414 00A22825 */  or         $a1, $a1, $v0
/* A7018 800A6418 00061840 */  sll        $v1, $a2, 1
/* A701C 800A641C 30630FFF */  andi       $v1, $v1, 0xfff
/* A7020 800A6420 00031B00 */  sll        $v1, $v1, 0xc
/* A7024 800A6424 AD650000 */  sw         $a1, ($t3)
/* A7028 800A6428 2705FFFF */  addiu      $a1, $t8, -1
/* A702C 800A642C 00B32821 */  addu       $a1, $a1, $s3
/* A7030 800A6430 00052880 */  sll        $a1, $a1, 2
/* A7034 800A6434 30A50FFF */  andi       $a1, $a1, 0xfff
/* A7038 800A6438 3C020700 */  lui        $v0, 0x700
/* A703C 800A643C 00A21025 */  or         $v0, $a1, $v0
/* A7040 800A6440 00621825 */  or         $v1, $v1, $v0
/* A7044 800A6444 3C02E700 */  lui        $v0, 0xe700
/* A7048 800A6448 AD630004 */  sw         $v1, 4($t3)
/* A704C 800A644C AD820000 */  sw         $v0, ($t4)
/* A7050 800A6450 3C02F500 */  lui        $v0, 0xf500
/* A7054 800A6454 00822025 */  or         $a0, $a0, $v0
/* A7058 800A6458 01044025 */  or         $t0, $t0, $a0
/* A705C 800A645C 3C03F200 */  lui        $v1, 0xf200
/* A7060 800A6460 00E33825 */  or         $a3, $a3, $v1
/* A7064 800A6464 00063080 */  sll        $a2, $a2, 2
/* A7068 800A6468 30C60FFF */  andi       $a2, $a2, 0xfff
/* A706C 800A646C 00063300 */  sll        $a2, $a2, 0xc
/* A7070 800A6470 AD800004 */  sw         $zero, 4($t4)
/* A7074 800A6474 ADA80000 */  sw         $t0, ($t5)
/* A7078 800A6478 ADA90004 */  sw         $t1, 4($t5)
/* A707C 800A647C 8FA40088 */  lw         $a0, 0x88($sp)
/* A7080 800A6480 00C53025 */  or         $a2, $a2, $a1
/* A7084 800A6484 ADC60004 */  sw         $a2, 4($t6)
/* A7088 800A6488 30820FFF */  andi       $v0, $a0, 0xfff
/* A708C 800A648C 00021300 */  sll        $v0, $v0, 0xc
/* A7090 800A6490 00471025 */  or         $v0, $v0, $a3
/* A7094 800A6494 ADC20000 */  sw         $v0, ($t6)
/* A7098 800A6498 ADE30000 */  sw         $v1, ($t7)
/* A709C 800A649C 8FB7008C */  lw         $s7, 0x8c($sp)
/* A70A0 800A64A0 8FA40094 */  lw         $a0, 0x94($sp)
/* A70A4 800A64A4 00171080 */  sll        $v0, $s7, 2
/* A70A8 800A64A8 30420FFF */  andi       $v0, $v0, 0xfff
/* A70AC 800A64AC 00021300 */  sll        $v0, $v0, 0xc
/* A70B0 800A64B0 00041880 */  sll        $v1, $a0, 2
/* A70B4 800A64B4 30630FFF */  andi       $v1, $v1, 0xfff
/* A70B8 800A64B8 00431025 */  or         $v0, $v0, $v1
/* A70BC 800A64BC ADE20004 */  sw         $v0, 4($t7)
/* A70C0 800A64C0 8FB7007C */  lw         $s7, 0x7c($sp)
/* A70C4 800A64C4 46020082 */  mul.s      $f2, $f0, $f2
/* A70C8 800A64C8 00171400 */  sll        $v0, $s7, 0x10
/* A70CC 800A64CC 00021403 */  sra        $v0, $v0, 0x10
/* A70D0 800A64D0 18400006 */  blez       $v0, .L800A64EC
/* A70D4 800A64D4 26100008 */   addiu     $s0, $s0, 8
/* A70D8 800A64D8 30420FFF */  andi       $v0, $v0, 0xfff
/* A70DC 800A64DC 00021300 */  sll        $v0, $v0, 0xc
/* A70E0 800A64E0 3C03E400 */  lui        $v1, 0xe400
/* A70E4 800A64E4 0802993C */  j          .L800A64F0
/* A70E8 800A64E8 00431025 */   or        $v0, $v0, $v1
.L800A64EC:
/* A70EC 800A64EC 3C02E400 */  lui        $v0, 0xe400
.L800A64F0:
/* A70F0 800A64F0 46023000 */  add.s      $f0, $f6, $f2
/* A70F4 800A64F4 00402021 */  addu       $a0, $v0, $zero
/* A70F8 800A64F8 4600008D */  trunc.w.s  $f2, $f0
/* A70FC 800A64FC 44021000 */  mfc1       $v0, $f2
/* A7100 800A6500 00021400 */  sll        $v0, $v0, 0x10
/* A7104 800A6504 00021403 */  sra        $v0, $v0, 0x10
/* A7108 800A6508 18400002 */  blez       $v0, .L800A6514
/* A710C 800A650C 30420FFF */   andi      $v0, $v0, 0xfff
/* A7110 800A6510 00822025 */  or         $a0, $a0, $v0
.L800A6514:
/* A7114 800A6514 AE240000 */  sw         $a0, ($s1)
/* A7118 800A6518 8FA4009C */  lw         $a0, 0x9c($sp)
/* A711C 800A651C 00041403 */  sra        $v0, $a0, 0x10
/* A7120 800A6520 18400003 */  blez       $v0, .L800A6530
/* A7124 800A6524 30420FFF */   andi      $v0, $v0, 0xfff
/* A7128 800A6528 0802994D */  j          .L800A6534
/* A712C 800A652C 00021300 */   sll       $v0, $v0, 0xc
.L800A6530:
/* A7130 800A6530 00001021 */  addu       $v0, $zero, $zero
.L800A6534:
/* A7134 800A6534 00401821 */  addu       $v1, $v0, $zero
/* A7138 800A6538 4600300D */  trunc.w.s  $f0, $f6
/* A713C 800A653C 44020000 */  mfc1       $v0, $f0
/* A7140 800A6540 00021400 */  sll        $v0, $v0, 0x10
/* A7144 800A6544 00021403 */  sra        $v0, $v0, 0x10
/* A7148 800A6548 18400002 */  blez       $v0, .L800A6554
/* A714C 800A654C 30420FFF */   andi      $v0, $v0, 0xfff
/* A7150 800A6550 00621825 */  or         $v1, $v1, $v0
.L800A6554:
/* A7154 800A6554 02003021 */  addu       $a2, $s0, $zero
/* A7158 800A6558 3C02E100 */  lui        $v0, 0xe100
/* A715C 800A655C AE230004 */  sw         $v1, 4($s1)
/* A7160 800A6560 ACC20000 */  sw         $v0, ($a2)
/* A7164 800A6564 8FB7009C */  lw         $s7, 0x9c($sp)
/* A7168 800A6568 00171C03 */  sra        $v1, $s7, 0x10
/* A716C 800A656C 04610014 */  bgez       $v1, .L800A65C0
/* A7170 800A6570 26100008 */   addiu     $s0, $s0, 8
/* A7174 800A6574 8FA40014 */  lw         $a0, 0x14($sp)
/* A7178 800A6578 00041400 */  sll        $v0, $a0, 0x10
/* A717C 800A657C 00021403 */  sra        $v0, $v0, 0x10
/* A7180 800A6580 00620018 */  mult       $v1, $v0
/* A7184 800A6584 04410007 */  bgez       $v0, .L800A65A4
/* A7188 800A6588 00000000 */   nop
/* A718C 800A658C 00001012 */  mflo       $v0
/* A7190 800A6590 000211C3 */  sra        $v0, $v0, 7
/* A7194 800A6594 04410008 */  bgez       $v0, .L800A65B8
/* A7198 800A6598 00021023 */   negu      $v0, $v0
/* A719C 800A659C 0802996D */  j          .L800A65B4
/* A71A0 800A65A0 00001021 */   addu      $v0, $zero, $zero
.L800A65A4:
/* A71A4 800A65A4 00001012 */  mflo       $v0
/* A71A8 800A65A8 000211C3 */  sra        $v0, $v0, 7
/* A71AC 800A65AC 5C400001 */  bgtzl      $v0, .L800A65B4
/* A71B0 800A65B0 00001021 */   addu      $v0, $zero, $zero
.L800A65B4:
/* A71B4 800A65B4 00021023 */  negu       $v0, $v0
.L800A65B8:
/* A71B8 800A65B8 08029971 */  j          .L800A65C4
/* A71BC 800A65BC 00022C00 */   sll       $a1, $v0, 0x10
.L800A65C0:
/* A71C0 800A65C0 00002821 */  addu       $a1, $zero, $zero
.L800A65C4:
/* A71C4 800A65C4 4600300D */  trunc.w.s  $f0, $f6
/* A71C8 800A65C8 44030000 */  mfc1       $v1, $f0
/* A71CC 800A65CC 04610017 */  bgez       $v1, .L800A662C
/* A71D0 800A65D0 00A01021 */   addu      $v0, $a1, $zero
/* A71D4 800A65D4 8FA40018 */  lw         $a0, 0x18($sp)
/* A71D8 800A65D8 00041400 */  sll        $v0, $a0, 0x10
/* A71DC 800A65DC 00022403 */  sra        $a0, $v0, 0x10
/* A71E0 800A65E0 04810009 */  bgez       $a0, .L800A6608
/* A71E4 800A65E4 00031400 */   sll       $v0, $v1, 0x10
/* A71E8 800A65E8 00021403 */  sra        $v0, $v0, 0x10
/* A71EC 800A65EC 00440018 */  mult       $v0, $a0
/* A71F0 800A65F0 00001012 */  mflo       $v0
/* A71F4 800A65F4 000211C3 */  sra        $v0, $v0, 7
/* A71F8 800A65F8 0443000A */  bgezl      $v0, .L800A6624
/* A71FC 800A65FC 00021023 */   negu      $v0, $v0
/* A7200 800A6600 08029988 */  j          .L800A6620
/* A7204 800A6604 00001021 */   addu      $v0, $zero, $zero
.L800A6608:
/* A7208 800A6608 00021403 */  sra        $v0, $v0, 0x10
/* A720C 800A660C 00440018 */  mult       $v0, $a0
/* A7210 800A6610 00001012 */  mflo       $v0
/* A7214 800A6614 000211C3 */  sra        $v0, $v0, 7
/* A7218 800A6618 5C400001 */  bgtzl      $v0, .L800A6620
/* A721C 800A661C 00001021 */   addu      $v0, $zero, $zero
.L800A6620:
/* A7220 800A6620 00021023 */  negu       $v0, $v0
.L800A6624:
/* A7224 800A6624 3042FFFF */  andi       $v0, $v0, 0xffff
/* A7228 800A6628 00A21025 */  or         $v0, $a1, $v0
.L800A662C:
/* A722C 800A662C 02002021 */  addu       $a0, $s0, $zero
/* A7230 800A6630 26100008 */  addiu      $s0, $s0, 8
/* A7234 800A6634 3C03F100 */  lui        $v1, 0xf100
/* A7238 800A6638 ACC20004 */  sw         $v0, 4($a2)
/* A723C 800A663C AC830000 */  sw         $v1, ($a0)
/* A7240 800A6640 8FA300A4 */  lw         $v1, 0xa4($sp)
/* A7244 800A6644 8FB700A8 */  lw         $s7, 0xa8($sp)
/* A7248 800A6648 00031400 */  sll        $v0, $v1, 0x10
/* A724C 800A664C 00571025 */  or         $v0, $v0, $s7
/* A7250 800A6650 0802999B */  j          .L800A666C
/* A7254 800A6654 AC820004 */   sw        $v0, 4($a0)
.L800A6658:
/* A7258 800A6658 3C04800E */  lui        $a0, %hi(D_800E3290)
/* A725C 800A665C 3C05800E */  lui        $a1, %hi(D_800E32B4)
/* A7260 800A6660 24843290 */  addiu      $a0, $a0, %lo(D_800E3290)
/* A7264 800A6664 0C025F2D */  jal        manualCrash
/* A7268 800A6668 24A532B4 */   addiu     $a1, $a1, %lo(D_800E32B4)
.L800A666C:
/* A726C 800A666C 02001021 */  addu       $v0, $s0, $zero
/* A7270 800A6670 8FBF00DC */  lw         $ra, 0xdc($sp)
/* A7274 800A6674 8FBE00D8 */  lw         $fp, 0xd8($sp)
/* A7278 800A6678 8FB700D4 */  lw         $s7, 0xd4($sp)
/* A727C 800A667C 8FB600D0 */  lw         $s6, 0xd0($sp)
/* A7280 800A6680 8FB500CC */  lw         $s5, 0xcc($sp)
/* A7284 800A6684 8FB400C8 */  lw         $s4, 0xc8($sp)
/* A7288 800A6688 8FB300C4 */  lw         $s3, 0xc4($sp)
/* A728C 800A668C 8FB200C0 */  lw         $s2, 0xc0($sp)
/* A7290 800A6690 8FB100BC */  lw         $s1, 0xbc($sp)
/* A7294 800A6694 8FB000B8 */  lw         $s0, 0xb8($sp)
/* A7298 800A6698 03E00008 */  jr         $ra
/* A729C 800A669C 27BD00E0 */   addiu     $sp, $sp, 0xe0

glabel pass_to_borg_image_draw
/* A72A0 800A66A0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* A72A4 800A66A4 C7A00050 */  lwc1       $f0, 0x50($sp)
/* A72A8 800A66A8 C7A20054 */  lwc1       $f2, 0x54($sp)
/* A72AC 800A66AC 93A8005B */  lbu        $t0, 0x5b($sp)
/* A72B0 800A66B0 93A9005F */  lbu        $t1, 0x5f($sp)
/* A72B4 800A66B4 93AA0063 */  lbu        $t2, 0x63($sp)
/* A72B8 800A66B8 93AB0067 */  lbu        $t3, 0x67($sp)
/* A72BC 800A66BC AFBF0038 */  sw         $ra, 0x38($sp)
/* A72C0 800A66C0 94A2000A */  lhu        $v0, 0xa($a1)
/* A72C4 800A66C4 94A3000C */  lhu        $v1, 0xc($a1)
/* A72C8 800A66C8 AFA00010 */  sw         $zero, 0x10($sp)
/* A72CC 800A66CC AFA00014 */  sw         $zero, 0x14($sp)
/* A72D0 800A66D0 AFA20018 */  sw         $v0, 0x18($sp)
/* A72D4 800A66D4 AFA3001C */  sw         $v1, 0x1c($sp)
/* A72D8 800A66D8 E7A00020 */  swc1       $f0, 0x20($sp)
/* A72DC 800A66DC E7A20024 */  swc1       $f2, 0x24($sp)
/* A72E0 800A66E0 AFA80028 */  sw         $t0, 0x28($sp)
/* A72E4 800A66E4 AFA9002C */  sw         $t1, 0x2c($sp)
/* A72E8 800A66E8 AFAA0030 */  sw         $t2, 0x30($sp)
/* A72EC 800A66EC 0C029188 */  jal        N64BorgImageDraw
/* A72F0 800A66F0 AFAB0034 */   sw        $t3, 0x34($sp)
/* A72F4 800A66F4 8FBF0038 */  lw         $ra, 0x38($sp)
/* A72F8 800A66F8 03E00008 */  jr         $ra
/* A72FC 800A66FC 27BD0040 */   addiu     $sp, $sp, 0x40

glabel borg8_free
/* A7300 800A6700 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* A7304 800A6704 AFB00010 */  sw         $s0, 0x10($sp)
/* A7308 800A6708 00808021 */  addu       $s0, $a0, $zero
/* A730C 800A670C AFBF0018 */  sw         $ra, 0x18($sp)
/* A7310 800A6710 0C02608C */  jal        get_memUsed
/* A7314 800A6714 AFB10014 */   sw        $s1, 0x14($sp)
/* A7318 800A6718 00408821 */  addu       $s1, $v0, $zero
/* A731C 800A671C 8E040000 */  lw         $a0, ($s0)
/* A7320 800A6720 2402FFFF */  addiu      $v0, $zero, -1
/* A7324 800A6724 14820007 */  bne        $a0, $v0, .L800A6744
/* A7328 800A6728 3C05800E */   lui       $a1, %hi(D_800E3270)
/* A732C 800A672C 02002021 */  addu       $a0, $s0, $zero
/* A7330 800A6730 24A53270 */  addiu      $a1, $a1, %lo(D_800E3270)
/* A7334 800A6734 0C02600C */  jal        Free
/* A7338 800A6738 2406024F */   addiu     $a2, $zero, 0x24f
/* A733C 800A673C 080299D3 */  j          .L800A674C
/* A7340 800A6740 00000000 */   nop
.L800A6744:
/* A7344 800A6744 0C028B7F */  jal        dec_borg_count
/* A7348 800A6748 00000000 */   nop
.L800A674C:
/* A734C 800A674C 0C02608C */  jal        get_memUsed
/* A7350 800A6750 00000000 */   nop
/* A7354 800A6754 3C06800F */  lui        $a2, %hi(borg_mem)
/* A7358 800A6758 24C6348C */  addiu      $a2, $a2, %lo(borg_mem)
/* A735C 800A675C 02221023 */  subu       $v0, $s1, $v0
/* A7360 800A6760 3C05800F */  lui        $a1, %hi(borg_count)
/* A7364 800A6764 24A534C8 */  addiu      $a1, $a1, %lo(borg_count)
/* A7368 800A6768 8CC30020 */  lw         $v1, 0x20($a2)
/* A736C 800A676C 8CA40020 */  lw         $a0, 0x20($a1)
/* A7370 800A6770 8FBF0018 */  lw         $ra, 0x18($sp)
/* A7374 800A6774 8FB10014 */  lw         $s1, 0x14($sp)
/* A7378 800A6778 8FB00010 */  lw         $s0, 0x10($sp)
/* A737C 800A677C 00621823 */  subu       $v1, $v1, $v0
/* A7380 800A6780 2484FFFF */  addiu      $a0, $a0, -1
/* A7384 800A6784 ACC30020 */  sw         $v1, 0x20($a2)
/* A7388 800A6788 ACA40020 */  sw         $a0, 0x20($a1)
/* A738C 800A678C 03E00008 */  jr         $ra
/* A7390 800A6790 27BD0020 */   addiu     $sp, $sp, 0x20

glabel gsFadeInOut
/* A7394 800A6794 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* A7398 800A6798 0080C821 */  addu       $t9, $a0, $zero
/* A739C 800A679C 27390008 */  addiu      $t9, $t9, 8
/* A73A0 800A67A0 AFB50014 */  sw         $s5, 0x14($sp)
/* A73A4 800A67A4 0320A821 */  addu       $s5, $t9, $zero
/* A73A8 800A67A8 27390008 */  addiu      $t9, $t9, 8
/* A73AC 800A67AC AFB60018 */  sw         $s6, 0x18($sp)
/* A73B0 800A67B0 0320B021 */  addu       $s6, $t9, $zero
/* A73B4 800A67B4 27390008 */  addiu      $t9, $t9, 8
/* A73B8 800A67B8 3C0DE300 */  lui        $t5, 0xe300
/* A73BC 800A67BC 35AD1001 */  ori        $t5, $t5, 0x1001
/* A73C0 800A67C0 AFB7001C */  sw         $s7, 0x1c($sp)
/* A73C4 800A67C4 0320B821 */  addu       $s7, $t9, $zero
/* A73C8 800A67C8 27390008 */  addiu      $t9, $t9, 8
/* A73CC 800A67CC 3C0CFD68 */  lui        $t4, 0xfd68
/* A73D0 800A67D0 358C0007 */  ori        $t4, $t4, 7
/* A73D4 800A67D4 AFB40010 */  sw         $s4, 0x10($sp)
/* A73D8 800A67D8 0320A021 */  addu       $s4, $t9, $zero
/* A73DC 800A67DC 27390008 */  addiu      $t9, $t9, 8
/* A73E0 800A67E0 3C09F568 */  lui        $t1, 0xf568
/* A73E4 800A67E4 35290800 */  ori        $t1, $t1, 0x800
/* A73E8 800A67E8 3C0A0708 */  lui        $t2, 0x708
/* A73EC 800A67EC 354A0200 */  ori        $t2, $t2, 0x200
/* A73F0 800A67F0 AFB20008 */  sw         $s2, 8($sp)
/* A73F4 800A67F4 03209021 */  addu       $s2, $t9, $zero
/* A73F8 800A67F8 27390008 */  addiu      $t9, $t9, 8
/* A73FC 800A67FC AFB3000C */  sw         $s3, 0xc($sp)
/* A7400 800A6800 03209821 */  addu       $s3, $t9, $zero
/* A7404 800A6804 27390008 */  addiu      $t9, $t9, 8
/* A7408 800A6808 3C0B0707 */  lui        $t3, 0x707
/* A740C 800A680C 356B0070 */  ori        $t3, $t3, 0x70
/* A7410 800A6810 AFB00000 */  sw         $s0, ($sp)
/* A7414 800A6814 03208021 */  addu       $s0, $t9, $zero
/* A7418 800A6818 27390008 */  addiu      $t9, $t9, 8
/* A741C 800A681C AFB10004 */  sw         $s1, 4($sp)
/* A7420 800A6820 03208821 */  addu       $s1, $t9, $zero
/* A7424 800A6824 27390008 */  addiu      $t9, $t9, 8
/* A7428 800A6828 3C080008 */  lui        $t0, 8
/* A742C 800A682C 35080200 */  ori        $t0, $t0, 0x200
/* A7430 800A6830 0320C021 */  addu       $t8, $t9, $zero
/* A7434 800A6834 27390008 */  addiu      $t9, $t9, 8
/* A7438 800A6838 3C0E0007 */  lui        $t6, 7
/* A743C 800A683C 35CE0070 */  ori        $t6, $t6, 0x70
/* A7440 800A6840 AFBE0020 */  sw         $fp, 0x20($sp)
/* A7444 800A6844 0320F021 */  addu       $fp, $t9, $zero
/* A7448 800A6848 27390008 */  addiu      $t9, $t9, 8
/* A744C 800A684C 3C02800F */  lui        $v0, 0x800f
/* A7450 800A6850 3C03800F */  lui        $v1, %hi(V_scale)
/* A7454 800A6854 3C0FE700 */  lui        $t7, 0xe700
/* A7458 800A6858 C4663524 */  lwc1       $f6, %lo(V_scale)($v1)
/* A745C 800A685C 3C03FA00 */  lui        $v1, 0xfa00
/* A7460 800A6860 30A5FFFF */  andi       $a1, $a1, 0xffff
/* A7464 800A6864 44851000 */  mtc1       $a1, $f2
/* A7468 800A6868 468010A0 */  cvt.s.w    $f2, $f2
/* A746C 800A686C 30C6FFFF */  andi       $a2, $a2, 0xffff
/* A7470 800A6870 30E7FFFF */  andi       $a3, $a3, 0xffff
/* A7474 800A6874 C4443520 */  lwc1       $f4, 0x3520($v0)
/* A7478 800A6878 44860000 */  mtc1       $a2, $f0
/* A747C 800A687C 46800020 */  cvt.s.w    $f0, $f0
/* A7480 800A6880 AC8F0000 */  sw         $t7, ($a0)
/* A7484 800A6884 AC800004 */  sw         $zero, 4($a0)
/* A7488 800A6888 AEA30000 */  sw         $v1, ($s5)
/* A748C 800A688C 93A2003F */  lbu        $v0, 0x3f($sp)
/* A7490 800A6890 93A30043 */  lbu        $v1, 0x43($sp)
/* A7494 800A6894 93A40047 */  lbu        $a0, 0x47($sp)
/* A7498 800A6898 00021600 */  sll        $v0, $v0, 0x18
/* A749C 800A689C 00031C00 */  sll        $v1, $v1, 0x10
/* A74A0 800A68A0 46041082 */  mul.s      $f2, $f2, $f4
/* A74A4 800A68A4 00431025 */  or         $v0, $v0, $v1
/* A74A8 800A68A8 00042200 */  sll        $a0, $a0, 8
/* A74AC 800A68AC 00441025 */  or         $v0, $v0, $a0
/* A74B0 800A68B0 93A3004B */  lbu        $v1, 0x4b($sp)
/* A74B4 800A68B4 46060002 */  mul.s      $f0, $f0, $f6
/* A74B8 800A68B8 00431025 */  or         $v0, $v0, $v1
/* A74BC 800A68BC AEA20004 */  sw         $v0, 4($s5)
/* A74C0 800A68C0 3C02800F */  lui        $v0, %hi(fade_texture)
/* A74C4 800A68C4 24423528 */  addiu      $v0, $v0, %lo(fade_texture)
/* A74C8 800A68C8 AECD0000 */  sw         $t5, ($s6)
/* A74CC 800A68CC AEC00004 */  sw         $zero, 4($s6)
/* A74D0 800A68D0 AEE20004 */  sw         $v0, 4($s7)
/* A74D4 800A68D4 3C02E600 */  lui        $v0, 0xe600
/* A74D8 800A68D8 AEEC0000 */  sw         $t4, ($s7)
/* A74DC 800A68DC AE890000 */  sw         $t1, ($s4)
/* A74E0 800A68E0 AE8A0004 */  sw         $t2, 4($s4)
/* A74E4 800A68E4 AE420000 */  sw         $v0, ($s2)
/* A74E8 800A68E8 3C02F400 */  lui        $v0, 0xf400
/* A74EC 800A68EC AE400004 */  sw         $zero, 4($s2)
/* A74F0 800A68F0 AE620000 */  sw         $v0, ($s3)
/* A74F4 800A68F4 3C02F200 */  lui        $v0, 0xf200
/* A74F8 800A68F8 AE6B0004 */  sw         $t3, 4($s3)
/* A74FC 800A68FC AE0F0000 */  sw         $t7, ($s0)
/* A7500 800A6900 AE000004 */  sw         $zero, 4($s0)
/* A7504 800A6904 AE290000 */  sw         $t1, ($s1)
/* A7508 800A6908 AE280004 */  sw         $t0, 4($s1)
/* A750C 800A690C AF020000 */  sw         $v0, ($t8)
/* A7510 800A6910 4600120D */  trunc.w.s  $f8, $f2
/* A7514 800A6914 44024000 */  mfc1       $v0, $f8
/* A7518 800A6918 00021400 */  sll        $v0, $v0, 0x10
/* A751C 800A691C 00024C03 */  sra        $t1, $v0, 0x10
/* A7520 800A6920 44871000 */  mtc1       $a3, $f2
/* A7524 800A6924 468010A0 */  cvt.s.w    $f2, $f2
/* A7528 800A6928 46041082 */  mul.s      $f2, $f2, $f4
/* A752C 800A692C 4600010D */  trunc.w.s  $f4, $f0
/* A7530 800A6930 44022000 */  mfc1       $v0, $f4
/* A7534 800A6934 00021400 */  sll        $v0, $v0, 0x10
/* A7538 800A6938 97A3003A */  lhu        $v1, 0x3a($sp)
/* A753C 800A693C 00022C03 */  sra        $a1, $v0, 0x10
/* A7540 800A6940 AF0E0004 */  sw         $t6, 4($t8)
/* A7544 800A6944 44830000 */  mtc1       $v1, $f0
/* A7548 800A6948 46800020 */  cvt.s.w    $f0, $f0
/* A754C 800A694C 46060002 */  mul.s      $f0, $f0, $f6
/* A7550 800A6950 3C01800E */  lui        $at, %hi(D_800E3384)
/* A7554 800A6954 C4263384 */  lwc1       $f6, %lo(D_800E3384)($at)
/* A7558 800A6958 4600110D */  trunc.w.s  $f4, $f2
/* A755C 800A695C 44042000 */  mfc1       $a0, $f4
/* A7560 800A6960 00042400 */  sll        $a0, $a0, 0x10
/* A7564 800A6964 00042403 */  sra        $a0, $a0, 0x10
/* A7568 800A6968 3C01800E */  lui        $at, %hi(D_800E3388)
/* A756C 800A696C C4243388 */  lwc1       $f4, %lo(D_800E3388)($at)
/* A7570 800A6970 4600008D */  trunc.w.s  $f2, $f0
/* A7574 800A6974 44031000 */  mfc1       $v1, $f2
/* A7578 800A6978 00031C00 */  sll        $v1, $v1, 0x10
/* A757C 800A697C 00891023 */  subu       $v0, $a0, $t1
/* A7580 800A6980 44821000 */  mtc1       $v0, $f2
/* A7584 800A6984 468010A0 */  cvt.s.w    $f2, $f2
/* A7588 800A6988 46022083 */  div.s      $f2, $f4, $f2
/* A758C 800A698C 46061082 */  mul.s      $f2, $f2, $f6
/* A7590 800A6990 00033403 */  sra        $a2, $v1, 0x10
/* A7594 800A6994 00C51023 */  subu       $v0, $a2, $a1
/* A7598 800A6998 44820000 */  mtc1       $v0, $f0
/* A759C 800A699C 46800020 */  cvt.s.w    $f0, $f0
/* A75A0 800A69A0 46002103 */  div.s      $f4, $f4, $f0
/* A75A4 800A69A4 46062102 */  mul.s      $f4, $f4, $f6
/* A75A8 800A69A8 00042480 */  sll        $a0, $a0, 0x12
/* A75AC 800A69AC 4600100D */  trunc.w.s  $f0, $f2
/* A75B0 800A69B0 44020000 */  mfc1       $v0, $f0
/* A75B4 800A69B4 00021400 */  sll        $v0, $v0, 0x10
/* A75B8 800A69B8 00024403 */  sra        $t0, $v0, 0x10
/* A75BC 800A69BC 4600200D */  trunc.w.s  $f0, $f4
/* A75C0 800A69C0 44030000 */  mfc1       $v1, $f0
/* A75C4 800A69C4 00031C00 */  sll        $v1, $v1, 0x10
/* A75C8 800A69C8 00041403 */  sra        $v0, $a0, 0x10
/* A75CC 800A69CC 18400006 */  blez       $v0, .L800A69E8
/* A75D0 800A69D0 00033C03 */   sra       $a3, $v1, 0x10
/* A75D4 800A69D4 30420FFF */  andi       $v0, $v0, 0xfff
/* A75D8 800A69D8 00021300 */  sll        $v0, $v0, 0xc
/* A75DC 800A69DC 3C03E400 */  lui        $v1, 0xe400
/* A75E0 800A69E0 08029A7B */  j          .L800A69EC
/* A75E4 800A69E4 00431025 */   or        $v0, $v0, $v1
.L800A69E8:
/* A75E8 800A69E8 3C02E400 */  lui        $v0, 0xe400
.L800A69EC:
/* A75EC 800A69EC 00402021 */  addu       $a0, $v0, $zero
/* A75F0 800A69F0 00061480 */  sll        $v0, $a2, 0x12
/* A75F4 800A69F4 00021403 */  sra        $v0, $v0, 0x10
/* A75F8 800A69F8 18400002 */  blez       $v0, .L800A6A04
/* A75FC 800A69FC 30420FFF */   andi      $v0, $v0, 0xfff
/* A7600 800A6A00 00822025 */  or         $a0, $a0, $v0
.L800A6A04:
/* A7604 800A6A04 AFC40000 */  sw         $a0, ($fp)
/* A7608 800A6A08 00091480 */  sll        $v0, $t1, 0x12
/* A760C 800A6A0C 00021C03 */  sra        $v1, $v0, 0x10
/* A7610 800A6A10 18600004 */  blez       $v1, .L800A6A24
/* A7614 800A6A14 00403021 */   addu      $a2, $v0, $zero
/* A7618 800A6A18 30620FFF */  andi       $v0, $v1, 0xfff
/* A761C 800A6A1C 08029A8A */  j          .L800A6A28
/* A7620 800A6A20 00021300 */   sll       $v0, $v0, 0xc
.L800A6A24:
/* A7624 800A6A24 00001021 */  addu       $v0, $zero, $zero
.L800A6A28:
/* A7628 800A6A28 00401821 */  addu       $v1, $v0, $zero
/* A762C 800A6A2C 00051480 */  sll        $v0, $a1, 0x12
/* A7630 800A6A30 00022403 */  sra        $a0, $v0, 0x10
/* A7634 800A6A34 00054880 */  sll        $t1, $a1, 2
/* A7638 800A6A38 18800003 */  blez       $a0, .L800A6A48
/* A763C 800A6A3C 00402821 */   addu      $a1, $v0, $zero
/* A7640 800A6A40 30820FFF */  andi       $v0, $a0, 0xfff
/* A7644 800A6A44 00621825 */  or         $v1, $v1, $v0
.L800A6A48:
/* A7648 800A6A48 03202021 */  addu       $a0, $t9, $zero
/* A764C 800A6A4C 3C02E100 */  lui        $v0, 0xe100
/* A7650 800A6A50 AFC30004 */  sw         $v1, 4($fp)
/* A7654 800A6A54 AC820000 */  sw         $v0, ($a0)
/* A7658 800A6A58 00061403 */  sra        $v0, $a2, 0x10
/* A765C 800A6A5C 04410011 */  bgez       $v0, .L800A6AA4
/* A7660 800A6A60 27390008 */   addiu     $t9, $t9, 8
/* A7664 800A6A64 00480018 */  mult       $v0, $t0
/* A7668 800A6A68 05010007 */  bgez       $t0, .L800A6A88
/* A766C 800A6A6C 00000000 */   nop
/* A7670 800A6A70 00001012 */  mflo       $v0
/* A7674 800A6A74 000211C3 */  sra        $v0, $v0, 7
/* A7678 800A6A78 04410008 */  bgez       $v0, .L800A6A9C
/* A767C 800A6A7C 00021023 */   negu      $v0, $v0
/* A7680 800A6A80 08029AA6 */  j          .L800A6A98
/* A7684 800A6A84 00001021 */   addu      $v0, $zero, $zero
.L800A6A88:
/* A7688 800A6A88 00001012 */  mflo       $v0
/* A768C 800A6A8C 000211C3 */  sra        $v0, $v0, 7
/* A7690 800A6A90 5C400001 */  bgtzl      $v0, .L800A6A98
/* A7694 800A6A94 00001021 */   addu      $v0, $zero, $zero
.L800A6A98:
/* A7698 800A6A98 00021023 */  negu       $v0, $v0
.L800A6A9C:
/* A769C 800A6A9C 08029AAA */  j          .L800A6AA8
/* A76A0 800A6AA0 00021C00 */   sll       $v1, $v0, 0x10
.L800A6AA4:
/* A76A4 800A6AA4 00001821 */  addu       $v1, $zero, $zero
.L800A6AA8:
/* A76A8 800A6AA8 05210012 */  bgez       $t1, .L800A6AF4
/* A76AC 800A6AAC 00601021 */   addu      $v0, $v1, $zero
/* A76B0 800A6AB0 04E10008 */  bgez       $a3, .L800A6AD4
/* A76B4 800A6AB4 00051403 */   sra       $v0, $a1, 0x10
/* A76B8 800A6AB8 00470018 */  mult       $v0, $a3
/* A76BC 800A6ABC 00001012 */  mflo       $v0
/* A76C0 800A6AC0 000211C3 */  sra        $v0, $v0, 7
/* A76C4 800A6AC4 04430009 */  bgezl      $v0, .L800A6AEC
/* A76C8 800A6AC8 00021023 */   negu      $v0, $v0
/* A76CC 800A6ACC 08029ABA */  j          .L800A6AE8
/* A76D0 800A6AD0 00001021 */   addu      $v0, $zero, $zero
.L800A6AD4:
/* A76D4 800A6AD4 00470018 */  mult       $v0, $a3
/* A76D8 800A6AD8 00001012 */  mflo       $v0
/* A76DC 800A6ADC 000211C3 */  sra        $v0, $v0, 7
/* A76E0 800A6AE0 5C400001 */  bgtzl      $v0, .L800A6AE8
/* A76E4 800A6AE4 00001021 */   addu      $v0, $zero, $zero
.L800A6AE8:
/* A76E8 800A6AE8 00021023 */  negu       $v0, $v0
.L800A6AEC:
/* A76EC 800A6AEC 3042FFFF */  andi       $v0, $v0, 0xffff
/* A76F0 800A6AF0 00621025 */  or         $v0, $v1, $v0
.L800A6AF4:
/* A76F4 800A6AF4 AC820004 */  sw         $v0, 4($a0)
/* A76F8 800A6AF8 03201021 */  addu       $v0, $t9, $zero
/* A76FC 800A6AFC 3C04F100 */  lui        $a0, 0xf100
/* A7700 800A6B00 00081C00 */  sll        $v1, $t0, 0x10
/* A7704 800A6B04 AC440000 */  sw         $a0, ($v0)
/* A7708 800A6B08 30E4FFFF */  andi       $a0, $a3, 0xffff
/* A770C 800A6B0C 8FBE0020 */  lw         $fp, 0x20($sp)
/* A7710 800A6B10 8FB7001C */  lw         $s7, 0x1c($sp)
/* A7714 800A6B14 8FB60018 */  lw         $s6, 0x18($sp)
/* A7718 800A6B18 8FB50014 */  lw         $s5, 0x14($sp)
/* A771C 800A6B1C 8FB40010 */  lw         $s4, 0x10($sp)
/* A7720 800A6B20 8FB3000C */  lw         $s3, 0xc($sp)
/* A7724 800A6B24 8FB20008 */  lw         $s2, 8($sp)
/* A7728 800A6B28 8FB10004 */  lw         $s1, 4($sp)
/* A772C 800A6B2C 8FB00000 */  lw         $s0, ($sp)
/* A7730 800A6B30 00641825 */  or         $v1, $v1, $a0
/* A7734 800A6B34 AC430004 */  sw         $v1, 4($v0)
/* A7738 800A6B38 24420008 */  addiu      $v0, $v0, 8
/* A773C 800A6B3C 03E00008 */  jr         $ra
/* A7740 800A6B40 27BD0028 */   addiu     $sp, $sp, 0x28
/* A7744 800A6B44 00000000 */  nop
/* A7748 800A6B48 00000000 */  nop
/* A774C 800A6B4C 00000000 */  nop
