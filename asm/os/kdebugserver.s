.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel send
/* C4400 800C3800 3C02800F */  lui        $v0, %hi(__osRdb_IP6_Empty)
/* C4404 800C3804 8C423780 */  lw         $v0, %lo(__osRdb_IP6_Empty)($v0)
/* C4408 800C3808 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* C440C 800C380C AFB60030 */  sw         $s6, 0x30($sp)
/* C4410 800C3810 0080B021 */  addu       $s6, $a0, $zero
/* C4414 800C3814 AFB00018 */  sw         $s0, 0x18($sp)
/* C4418 800C3818 00A08021 */  addu       $s0, $a1, $zero
/* C441C 800C381C AFB1001C */  sw         $s1, 0x1c($sp)
/* C4420 800C3820 00008821 */  addu       $s1, $zero, $zero
/* C4424 800C3824 AFBF0038 */  sw         $ra, 0x38($sp)
/* C4428 800C3828 AFB70034 */  sw         $s7, 0x34($sp)
/* C442C 800C382C AFB5002C */  sw         $s5, 0x2c($sp)
/* C4430 800C3830 AFB40028 */  sw         $s4, 0x28($sp)
/* C4434 800C3834 AFB30024 */  sw         $s3, 0x24($sp)
/* C4438 800C3838 1440000F */  bnez       $v0, .L800C3878
/* C443C 800C383C AFB20020 */   sw        $s2, 0x20($sp)
.L800C3840:
/* C4440 800C3840 0C030D68 */  jal        __osGetCause
/* C4444 800C3844 00000000 */   nop
/* C4448 800C3848 30422000 */  andi       $v0, $v0, 0x2000
/* C444C 800C384C 1040FFFC */  beqz       $v0, .L800C3840
/* C4450 800C3850 3C02C000 */   lui       $v0, 0xc000
/* C4454 800C3854 3442000C */  ori        $v0, $v0, 0xc
/* C4458 800C3858 AC400000 */  sw         $zero, ($v0)
.L800C385C:
/* C445C 800C385C 0C030D68 */  jal        __osGetCause
/* C4460 800C3860 00000000 */   nop
/* C4464 800C3864 30422000 */  andi       $v0, $v0, 0x2000
/* C4468 800C3868 1440FFFC */  bnez       $v0, .L800C385C
/* C446C 800C386C 0000A821 */   addu      $s5, $zero, $zero
/* C4470 800C3870 08030E1F */  j          .L800C387C
/* C4474 800C3874 00000000 */   nop
.L800C3878:
/* C4478 800C3878 24150001 */  addiu      $s5, $zero, 1
.L800C387C:
/* C447C 800C387C 12000031 */  beqz       $s0, .L800C3944
/* C4480 800C3880 2E020004 */   sltiu     $v0, $s0, 4
/* C4484 800C3884 3C1403FF */  lui        $s4, 0x3ff
/* C4488 800C3888 3694FFFF */  ori        $s4, $s4, 0xffff
/* C448C 800C388C 3C173000 */  lui        $s7, 0x3000
/* C4490 800C3890 3C13FCFF */  lui        $s3, 0xfcff
/* C4494 800C3894 3673FFFF */  ori        $s3, $s3, 0xffff
/* C4498 800C3898 27B20011 */  addiu      $s2, $sp, 0x11
.L800C389C:
/* C449C 800C389C 14400002 */  bnez       $v0, .L800C38A8
/* C44A0 800C38A0 02002821 */   addu      $a1, $s0, $zero
/* C44A4 800C38A4 24050003 */  addiu      $a1, $zero, 3
.L800C38A8:
/* C44A8 800C38A8 8FA30010 */  lw         $v1, 0x10($sp)
/* C44AC 800C38AC 30A20003 */  andi       $v0, $a1, 3
/* C44B0 800C38B0 00021600 */  sll        $v0, $v0, 0x18
/* C44B4 800C38B4 00741824 */  and        $v1, $v1, $s4
/* C44B8 800C38B8 00771825 */  or         $v1, $v1, $s7
/* C44BC 800C38BC 00731824 */  and        $v1, $v1, $s3
/* C44C0 800C38C0 00621825 */  or         $v1, $v1, $v0
/* C44C4 800C38C4 02D11021 */  addu       $v0, $s6, $s1
/* C44C8 800C38C8 10A0000A */  beqz       $a1, .L800C38F4
/* C44CC 800C38CC AFA30010 */   sw        $v1, 0x10($sp)
/* C44D0 800C38D0 02401821 */  addu       $v1, $s2, $zero
/* C44D4 800C38D4 00402021 */  addu       $a0, $v0, $zero
/* C44D8 800C38D8 00A33021 */  addu       $a2, $a1, $v1
.L800C38DC:
/* C44DC 800C38DC 90820000 */  lbu        $v0, ($a0)
/* C44E0 800C38E0 A0620000 */  sb         $v0, ($v1)
/* C44E4 800C38E4 24630001 */  addiu      $v1, $v1, 1
/* C44E8 800C38E8 0066102B */  sltu       $v0, $v1, $a2
/* C44EC 800C38EC 1440FFFB */  bnez       $v0, .L800C38DC
/* C44F0 800C38F0 24840001 */   addiu     $a0, $a0, 1
.L800C38F4:
/* C44F4 800C38F4 02058023 */  subu       $s0, $s0, $a1
/* C44F8 800C38F8 8FA30010 */  lw         $v1, 0x10($sp)
/* C44FC 800C38FC 02258821 */  addu       $s1, $s1, $a1
/* C4500 800C3900 3C02C000 */  lui        $v0, 0xc000
/* C4504 800C3904 1200000F */  beqz       $s0, .L800C3944
/* C4508 800C3908 AC430000 */   sw        $v1, ($v0)
.L800C390C:
/* C450C 800C390C 0C030D68 */  jal        __osGetCause
/* C4510 800C3910 00000000 */   nop
/* C4514 800C3914 30422000 */  andi       $v0, $v0, 0x2000
/* C4518 800C3918 1040FFFC */  beqz       $v0, .L800C390C
/* C451C 800C391C 3C02C000 */   lui       $v0, 0xc000
/* C4520 800C3920 3442000C */  ori        $v0, $v0, 0xc
/* C4524 800C3924 AC400000 */  sw         $zero, ($v0)
.L800C3928:
/* C4528 800C3928 0C030D68 */  jal        __osGetCause
/* C452C 800C392C 00000000 */   nop
/* C4530 800C3930 30422000 */  andi       $v0, $v0, 0x2000
/* C4534 800C3934 1440FFFC */  bnez       $v0, .L800C3928
/* C4538 800C3938 00000000 */   nop
/* C453C 800C393C 1600FFD7 */  bnez       $s0, .L800C389C
/* C4540 800C3940 2E020004 */   sltiu     $v0, $s0, 4
.L800C3944:
/* C4544 800C3944 12A0000D */  beqz       $s5, .L800C397C
/* C4548 800C3948 00000000 */   nop
.L800C394C:
/* C454C 800C394C 0C030D68 */  jal        __osGetCause
/* C4550 800C3950 00000000 */   nop
/* C4554 800C3954 30422000 */  andi       $v0, $v0, 0x2000
/* C4558 800C3958 1040FFFC */  beqz       $v0, .L800C394C
/* C455C 800C395C 3C02C000 */   lui       $v0, 0xc000
/* C4560 800C3960 3442000C */  ori        $v0, $v0, 0xc
/* C4564 800C3964 AC400000 */  sw         $zero, ($v0)
.L800C3968:
/* C4568 800C3968 0C030D68 */  jal        __osGetCause
/* C456C 800C396C 00000000 */   nop
/* C4570 800C3970 30422000 */  andi       $v0, $v0, 0x2000
/* C4574 800C3974 1440FFFC */  bnez       $v0, .L800C3968
/* C4578 800C3978 00000000 */   nop
.L800C397C:
/* C457C 800C397C 8FBF0038 */  lw         $ra, 0x38($sp)
/* C4580 800C3980 8FB70034 */  lw         $s7, 0x34($sp)
/* C4584 800C3984 8FB60030 */  lw         $s6, 0x30($sp)
/* C4588 800C3988 8FB5002C */  lw         $s5, 0x2c($sp)
/* C458C 800C398C 8FB40028 */  lw         $s4, 0x28($sp)
/* C4590 800C3990 8FB30024 */  lw         $s3, 0x24($sp)
/* C4594 800C3994 8FB20020 */  lw         $s2, 0x20($sp)
/* C4598 800C3998 8FB1001C */  lw         $s1, 0x1c($sp)
/* C459C 800C399C 8FB00018 */  lw         $s0, 0x18($sp)
/* C45A0 800C39A0 03E00008 */  jr         $ra
/* C45A4 800C39A4 27BD0040 */   addiu     $sp, $sp, 0x40

glabel kdebugserver
/* C45A8 800C39A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* C45AC 800C39AC AFA40018 */  sw         $a0, 0x18($sp)
/* C45B0 800C39B0 27A40019 */  addiu      $a0, $sp, 0x19
/* C45B4 800C39B4 27A5001C */  addiu      $a1, $sp, 0x1c
/* C45B8 800C39B8 AFBF0010 */  sw         $ra, 0x10($sp)
.L800C39BC:
/* C45BC 800C39BC 3C03800F */  lui        $v1, %hi(kdebugserver_numchars)
/* C45C0 800C39C0 8C633850 */  lw         $v1, %lo(kdebugserver_numchars)($v1)
/* C45C4 800C39C4 24620001 */  addiu      $v0, $v1, 1
/* C45C8 800C39C8 3C01800F */  lui        $at, %hi(kdebugserver_numchars)
/* C45CC 800C39CC AC223850 */  sw         $v0, %lo(kdebugserver_numchars)($at)
/* C45D0 800C39D0 90820000 */  lbu        $v0, ($a0)
/* C45D4 800C39D4 24840001 */  addiu      $a0, $a0, 1
/* C45D8 800C39D8 3C01800F */  lui        $at, %hi(kdebugserver_buffer)
/* C45DC 800C39DC 00230821 */  addu       $at, $at, $v1
/* C45E0 800C39E0 A0227870 */  sb         $v0, %lo(kdebugserver_buffer)($at)
/* C45E4 800C39E4 0085102B */  sltu       $v0, $a0, $a1
/* C45E8 800C39E8 1440FFF4 */  bnez       $v0, .L800C39BC
/* C45EC 800C39EC 24020002 */   addiu     $v0, $zero, 2
/* C45F0 800C39F0 3C03800F */  lui        $v1, %hi(kdebugserver_buffer)
/* C45F4 800C39F4 90637870 */  lbu        $v1, %lo(kdebugserver_buffer)($v1)
/* C45F8 800C39F8 14620005 */  bne        $v1, $v0, .L800C3A10
/* C45FC 800C39FC 24050190 */   addiu     $a1, $zero, 0x190
/* C4600 800C3A00 3C04800F */  lui        $a0, %hi(__osRunningThread)
/* C4604 800C3A04 8C843CC0 */  lw         $a0, %lo(__osRunningThread)($a0)
/* C4608 800C3A08 08030EA7 */  j          .L800C3A9C
/* C460C 800C3A0C 24840020 */   addiu     $a0, $a0, 0x20
.L800C3A10:
/* C4610 800C3A10 3C02800F */  lui        $v0, %hi(kdebugserver_numchars)
/* C4614 800C3A14 8C423850 */  lw         $v0, %lo(kdebugserver_numchars)($v0)
/* C4618 800C3A18 2C420009 */  sltiu      $v0, $v0, 9
/* C461C 800C3A1C 14400023 */  bnez       $v0, .L800C3AAC
/* C4620 800C3A20 24020001 */   addiu     $v0, $zero, 1
/* C4624 800C3A24 14620021 */  bne        $v1, $v0, .L800C3AAC
/* C4628 800C3A28 00000000 */   nop
/* C462C 800C3A2C 3C04800F */  lui        $a0, %hi(kdebugserver_buffer+0x1)
/* C4630 800C3A30 90847871 */  lbu        $a0, %lo(kdebugserver_buffer+0x1)($a0)
/* C4634 800C3A34 3C02800F */  lui        $v0, %hi(kdebugserver_buffer+0x2)
/* C4638 800C3A38 90427872 */  lbu        $v0, %lo(kdebugserver_buffer+0x2)($v0)
/* C463C 800C3A3C 3C03800F */  lui        $v1, %hi(kdebugserver_buffer+0x3)
/* C4640 800C3A40 90637873 */  lbu        $v1, %lo(kdebugserver_buffer+0x3)($v1)
/* C4644 800C3A44 3C05800F */  lui        $a1, %hi(kdebugserver_buffer+0x5)
/* C4648 800C3A48 90A57875 */  lbu        $a1, %lo(kdebugserver_buffer+0x5)($a1)
/* C464C 800C3A4C 3C06800F */  lui        $a2, %hi(kdebugserver_buffer+0x4)
/* C4650 800C3A50 90C67874 */  lbu        $a2, %lo(kdebugserver_buffer+0x4)($a2)
/* C4654 800C3A54 00042600 */  sll        $a0, $a0, 0x18
/* C4658 800C3A58 00021400 */  sll        $v0, $v0, 0x10
/* C465C 800C3A5C 00822025 */  or         $a0, $a0, $v0
/* C4660 800C3A60 00031A00 */  sll        $v1, $v1, 8
/* C4664 800C3A64 3C02800F */  lui        $v0, %hi(kdebugserver_buffer+0x6)
/* C4668 800C3A68 90427876 */  lbu        $v0, %lo(kdebugserver_buffer+0x6)($v0)
/* C466C 800C3A6C 00832025 */  or         $a0, $a0, $v1
/* C4670 800C3A70 00052E00 */  sll        $a1, $a1, 0x18
/* C4674 800C3A74 3C03800F */  lui        $v1, %hi(kdebugserver_buffer+0x7)
/* C4678 800C3A78 90637877 */  lbu        $v1, %lo(kdebugserver_buffer+0x7)($v1)
/* C467C 800C3A7C 00862025 */  or         $a0, $a0, $a2
/* C4680 800C3A80 00021400 */  sll        $v0, $v0, 0x10
/* C4684 800C3A84 00A22825 */  or         $a1, $a1, $v0
/* C4688 800C3A88 3C02800F */  lui        $v0, %hi(kdebugserver_buffer+0x8)
/* C468C 800C3A8C 90427878 */  lbu        $v0, %lo(kdebugserver_buffer+0x8)($v0)
/* C4690 800C3A90 00031A00 */  sll        $v1, $v1, 8
/* C4694 800C3A94 00A32825 */  or         $a1, $a1, $v1
/* C4698 800C3A98 00A22825 */  or         $a1, $a1, $v0
.L800C3A9C:
/* C469C 800C3A9C 0C030E00 */  jal        send
/* C46A0 800C3AA0 00000000 */   nop
/* C46A4 800C3AA4 3C01800F */  lui        $at, %hi(kdebugserver_numchars)
/* C46A8 800C3AA8 AC203850 */  sw         $zero, %lo(kdebugserver_numchars)($at)
.L800C3AAC:
/* C46AC 800C3AAC 8FBF0010 */  lw         $ra, 0x10($sp)
/* C46B0 800C3AB0 03E00008 */  jr         $ra
/* C46B4 800C3AB4 27BD0018 */   addiu     $sp, $sp, 0x18
/* C46B8 800C3AB8 00000000 */  nop
/* C46BC 800C3ABC 00000000 */  nop
