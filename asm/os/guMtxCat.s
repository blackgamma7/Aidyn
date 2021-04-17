.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel guMtxCatF
/* C50A0 800C44A0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* C50A4 800C44A4 00007021 */  addu       $t6, $zero, $zero
/* C50A8 800C44A8 03A07821 */  addu       $t7, $sp, $zero
.L800C44AC:
/* C50AC 800C44AC 00004821 */  addu       $t1, $zero, $zero
/* C50B0 800C44B0 0080C021 */  addu       $t8, $a0, $zero
/* C50B4 800C44B4 01E05821 */  addu       $t3, $t7, $zero
/* C50B8 800C44B8 00006021 */  addu       $t4, $zero, $zero
.L800C44BC:
/* C50BC 800C44BC AD600000 */  sw         $zero, ($t3)
/* C50C0 800C44C0 00004021 */  addu       $t0, $zero, $zero
/* C50C4 800C44C4 01806821 */  addu       $t5, $t4, $zero
/* C50C8 800C44C8 01605021 */  addu       $t2, $t3, $zero
/* C50CC 800C44CC 03003821 */  addu       $a3, $t8, $zero
/* C50D0 800C44D0 00A01821 */  addu       $v1, $a1, $zero
.L800C44D4:
/* C50D4 800C44D4 01A31021 */  addu       $v0, $t5, $v1
/* C50D8 800C44D8 C4E20000 */  lwc1       $f2, ($a3)
/* C50DC 800C44DC C4400000 */  lwc1       $f0, ($v0)
/* C50E0 800C44E0 46001082 */  mul.s      $f2, $f2, $f0
/* C50E4 800C44E4 C5400000 */  lwc1       $f0, ($t2)
/* C50E8 800C44E8 24E70004 */  addiu      $a3, $a3, 4
/* C50EC 800C44EC 46020000 */  add.s      $f0, $f0, $f2
/* C50F0 800C44F0 24630010 */  addiu      $v1, $v1, 0x10
/* C50F4 800C44F4 25080001 */  addiu      $t0, $t0, 1
/* C50F8 800C44F8 29020004 */  slti       $v0, $t0, 4
/* C50FC 800C44FC 1440FFF5 */  bnez       $v0, .L800C44D4
/* C5100 800C4500 E5400000 */   swc1      $f0, ($t2)
/* C5104 800C4504 256B0004 */  addiu      $t3, $t3, 4
/* C5108 800C4508 25290001 */  addiu      $t1, $t1, 1
/* C510C 800C450C 29220004 */  slti       $v0, $t1, 4
/* C5110 800C4510 1440FFEA */  bnez       $v0, .L800C44BC
/* C5114 800C4514 258C0004 */   addiu     $t4, $t4, 4
/* C5118 800C4518 24840010 */  addiu      $a0, $a0, 0x10
/* C511C 800C451C 25CE0001 */  addiu      $t6, $t6, 1
/* C5120 800C4520 29C20004 */  slti       $v0, $t6, 4
/* C5124 800C4524 1440FFE1 */  bnez       $v0, .L800C44AC
/* C5128 800C4528 25EF0010 */   addiu     $t7, $t7, 0x10
/* C512C 800C452C 00007021 */  addu       $t6, $zero, $zero
/* C5130 800C4530 03A02821 */  addu       $a1, $sp, $zero
.L800C4534:
/* C5134 800C4534 00004821 */  addu       $t1, $zero, $zero
/* C5138 800C4538 00C02021 */  addu       $a0, $a2, $zero
/* C513C 800C453C 00A01821 */  addu       $v1, $a1, $zero
.L800C4540:
/* C5140 800C4540 C4600000 */  lwc1       $f0, ($v1)
/* C5144 800C4544 24630004 */  addiu      $v1, $v1, 4
/* C5148 800C4548 25290001 */  addiu      $t1, $t1, 1
/* C514C 800C454C 29220004 */  slti       $v0, $t1, 4
/* C5150 800C4550 E4800000 */  swc1       $f0, ($a0)
/* C5154 800C4554 1440FFFA */  bnez       $v0, .L800C4540
/* C5158 800C4558 24840004 */   addiu     $a0, $a0, 4
/* C515C 800C455C 24A50010 */  addiu      $a1, $a1, 0x10
/* C5160 800C4560 25CE0001 */  addiu      $t6, $t6, 1
/* C5164 800C4564 29C20004 */  slti       $v0, $t6, 4
/* C5168 800C4568 1440FFF2 */  bnez       $v0, .L800C4534
/* C516C 800C456C 24C60010 */   addiu     $a2, $a2, 0x10
/* C5170 800C4570 27BD0040 */  addiu      $sp, $sp, 0x40
/* C5174 800C4574 03E00008 */  jr         $ra
/* C5178 800C4578 00000000 */   nop

glabel guMtxXFMF
/* C517C 800C457C C4820000 */  lwc1       $f2, ($a0)
/* C5180 800C4580 44853000 */  mtc1       $a1, $f6
/* C5184 800C4584 00000000 */  nop
/* C5188 800C4588 46061082 */  mul.s      $f2, $f2, $f6
/* C518C 800C458C C4840010 */  lwc1       $f4, 0x10($a0)
/* C5190 800C4590 44864000 */  mtc1       $a2, $f8
/* C5194 800C4594 00000000 */  nop
/* C5198 800C4598 46082102 */  mul.s      $f4, $f4, $f8
/* C519C 800C459C C4800020 */  lwc1       $f0, 0x20($a0)
/* C51A0 800C45A0 44875000 */  mtc1       $a3, $f10
/* C51A4 800C45A4 00000000 */  nop
/* C51A8 800C45A8 460A0002 */  mul.s      $f0, $f0, $f10
/* C51AC 800C45AC 46041080 */  add.s      $f2, $f2, $f4
/* C51B0 800C45B0 46001080 */  add.s      $f2, $f2, $f0
/* C51B4 800C45B4 C4800030 */  lwc1       $f0, 0x30($a0)
/* C51B8 800C45B8 8FA20010 */  lw         $v0, 0x10($sp)
/* C51BC 800C45BC 8FA30014 */  lw         $v1, 0x14($sp)
/* C51C0 800C45C0 46001080 */  add.s      $f2, $f2, $f0
/* C51C4 800C45C4 8FA50018 */  lw         $a1, 0x18($sp)
/* C51C8 800C45C8 E4420000 */  swc1       $f2, ($v0)
/* C51CC 800C45CC C4800004 */  lwc1       $f0, 4($a0)
/* C51D0 800C45D0 46060002 */  mul.s      $f0, $f0, $f6
/* C51D4 800C45D4 C4840014 */  lwc1       $f4, 0x14($a0)
/* C51D8 800C45D8 46082102 */  mul.s      $f4, $f4, $f8
/* C51DC 800C45DC C4820024 */  lwc1       $f2, 0x24($a0)
/* C51E0 800C45E0 460A1082 */  mul.s      $f2, $f2, $f10
/* C51E4 800C45E4 46040000 */  add.s      $f0, $f0, $f4
/* C51E8 800C45E8 46020000 */  add.s      $f0, $f0, $f2
/* C51EC 800C45EC C4820034 */  lwc1       $f2, 0x34($a0)
/* C51F0 800C45F0 46020000 */  add.s      $f0, $f0, $f2
/* C51F4 800C45F4 E4600000 */  swc1       $f0, ($v1)
/* C51F8 800C45F8 C4800008 */  lwc1       $f0, 8($a0)
/* C51FC 800C45FC 46060002 */  mul.s      $f0, $f0, $f6
/* C5200 800C4600 C4840018 */  lwc1       $f4, 0x18($a0)
/* C5204 800C4604 46082102 */  mul.s      $f4, $f4, $f8
/* C5208 800C4608 C4820028 */  lwc1       $f2, 0x28($a0)
/* C520C 800C460C 460A1082 */  mul.s      $f2, $f2, $f10
/* C5210 800C4610 46040000 */  add.s      $f0, $f0, $f4
/* C5214 800C4614 46020000 */  add.s      $f0, $f0, $f2
/* C5218 800C4618 C4820038 */  lwc1       $f2, 0x38($a0)
/* C521C 800C461C 46020000 */  add.s      $f0, $f0, $f2
/* C5220 800C4620 03E00008 */  jr         $ra
/* C5224 800C4624 E4A00000 */   swc1      $f0, ($a1)
/* C5228 800C4628 00000000 */  nop
/* C522C 800C462C 00000000 */  nop
