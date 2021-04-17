.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel selectResMode
/* 4A540 80049940 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4A544 80049944 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A548 80049948 244568A8 */  addiu      $a1, $v0, %lo(gGlobals)
/* 4A54C 8004994C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4A550 80049950 90A315FC */  lbu        $v1, 0x15fc($a1)
/* 4A554 80049954 308400FF */  andi       $a0, $a0, 0xff
/* 4A558 80049958 10830015 */  beq        $a0, $v1, .L800499B0
/* 4A55C 8004995C 8FBF0010 */   lw        $ra, 0x10($sp)
/* 4A560 80049960 10800004 */  beqz       $a0, .L80049974
/* 4A564 80049964 3C02800E */   lui       $v0, %hi(ExpPakFlag)
/* 4A568 80049968 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 4A56C 8004996C 10600010 */  beqz       $v1, .L800499B0
/* 4A570 80049970 00000000 */   nop
.L80049974:
/* 4A574 80049974 3C03800E */  lui        $v1, %hi(res_colormode)
/* 4A578 80049978 A0A415FC */  sb         $a0, 0x15fc($a1)
/* 4A57C 8004997C 308400FF */  andi       $a0, $a0, 0xff
/* 4A580 80049980 246366DC */  addiu      $v1, $v1, %lo(res_colormode)
/* 4A584 80049984 00041040 */  sll        $v0, $a0, 1
/* 4A588 80049988 00441021 */  addu       $v0, $v0, $a0
/* 4A58C 8004998C 00021040 */  sll        $v0, $v0, 1
/* 4A590 80049990 00432821 */  addu       $a1, $v0, $v1
/* 4A594 80049994 00623021 */  addu       $a2, $v1, $v0
/* 4A598 80049998 00C01821 */  addu       $v1, $a2, $zero
/* 4A59C 8004999C 94A40000 */  lhu        $a0, ($a1)
/* 4A5A0 800499A0 94C50002 */  lhu        $a1, 2($a2)
/* 4A5A4 800499A4 0C00214B */  jal        SetGfxMode
/* 4A5A8 800499A8 90660005 */   lbu       $a2, 5($v1)
/* 4A5AC 800499AC 8FBF0010 */  lw         $ra, 0x10($sp)
.L800499B0:
/* 4A5B0 800499B0 03E00008 */  jr         $ra
/* 4A5B4 800499B4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800499B8
/* 4A5B8 800499B8 8C820040 */  lw         $v0, 0x40($a0)
/* 4A5BC 800499BC 03E00008 */  jr         $ra
/* 4A5C0 800499C0 A0400028 */   sb        $zero, 0x28($v0)

glabel func_800499C4
/* 4A5C4 800499C4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4A5C8 800499C8 AFB10014 */  sw         $s1, 0x14($sp)
/* 4A5CC 800499CC 00808821 */  addu       $s1, $a0, $zero
/* 4A5D0 800499D0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4A5D4 800499D4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4A5D8 800499D8 8E300040 */  lw         $s0, 0x40($s1)
/* 4A5DC 800499DC 8E060024 */  lw         $a2, 0x24($s0)
/* 4A5E0 800499E0 24020001 */  addiu      $v0, $zero, 1
/* 4A5E4 800499E4 14C00010 */  bnez       $a2, .L80049A28
/* 4A5E8 800499E8 A2020028 */   sb        $v0, 0x28($s0)
/* 4A5EC 800499EC 0C026259 */  jal        passToMalloc
/* 4A5F0 800499F0 24040080 */   addiu     $a0, $zero, 0x80
/* 4A5F4 800499F4 3C03800E */  lui        $v1, %hi(partyPointer)
/* 4A5F8 800499F8 8C647EA0 */  lw         $a0, %lo(partyPointer)($v1)
/* 4A5FC 800499FC 8C860000 */  lw         $a2, ($a0)
/* 4A600 80049A00 8CC50004 */  lw         $a1, 4($a2)
/* 4A604 80049A04 0C00D0FC */  jal        func_800343F0
/* 4A608 80049A08 00402021 */   addu      $a0, $v0, $zero
/* 4A60C 80049A0C AE020024 */  sw         $v0, 0x24($s0)
/* 4A610 80049A10 86250060 */  lh         $a1, 0x60($s1)
/* 4A614 80049A14 86260062 */  lh         $a2, 0x62($s1)
/* 4A618 80049A18 0C02F26E */  jal        func_800BC9B8
/* 4A61C 80049A1C 00402021 */   addu      $a0, $v0, $zero
/* 4A620 80049A20 08012691 */  j          .L80049A44
/* 4A624 80049A24 8E040024 */   lw        $a0, 0x24($s0)
.L80049A28:
/* 4A628 80049A28 3C02800E */  lui        $v0, %hi(partyPointer)
/* 4A62C 80049A2C 8C437EA0 */  lw         $v1, %lo(partyPointer)($v0)
/* 4A630 80049A30 8C640000 */  lw         $a0, ($v1)
/* 4A634 80049A34 8C850004 */  lw         $a1, 4($a0)
/* 4A638 80049A38 0C00D21E */  jal        inputmenu_AddChar
/* 4A63C 80049A3C 00C02021 */   addu      $a0, $a2, $zero
/* 4A640 80049A40 8E040024 */  lw         $a0, 0x24($s0)
.L80049A44:
/* 4A644 80049A44 0C02F216 */  jal        widget_fade
/* 4A648 80049A48 00002821 */   addu      $a1, $zero, $zero
/* 4A64C 80049A4C 8E050024 */  lw         $a1, 0x24($s0)
/* 4A650 80049A50 8CA30078 */  lw         $v1, 0x78($a1)
/* 4A654 80049A54 84640028 */  lh         $a0, 0x28($v1)
/* 4A658 80049A58 8C62002C */  lw         $v0, 0x2c($v1)
/* 4A65C 80049A5C 0040F809 */  jalr       $v0
/* 4A660 80049A60 00A42021 */   addu      $a0, $a1, $a0
/* 4A664 80049A64 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4A668 80049A68 8FB10014 */  lw         $s1, 0x14($sp)
/* 4A66C 80049A6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4A670 80049A70 03E00008 */  jr         $ra
/* 4A674 80049A74 27BD0020 */   addiu     $sp, $sp, 0x20

glabel options_func_Left
/* 4A678 80049A78 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4A67C 80049A7C AFBF0020 */  sw         $ra, 0x20($sp)
/* 4A680 80049A80 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4A684 80049A84 AFB00018 */  sw         $s0, 0x18($sp)
/* 4A688 80049A88 8CA50040 */  lw         $a1, 0x40($a1)
/* 4A68C 80049A8C 90A20028 */  lbu        $v0, 0x28($a1)
/* 4A690 80049A90 50400009 */  beql       $v0, $zero, .L80049AB8
/* 4A694 80049A94 90A30020 */   lbu       $v1, 0x20($a1)
/* 4A698 80049A98 8CA50024 */  lw         $a1, 0x24($a1)
/* 4A69C 80049A9C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4A6A0 80049AA0 84640068 */  lh         $a0, 0x68($v1)
/* 4A6A4 80049AA4 8C62006C */  lw         $v0, 0x6c($v1)
/* 4A6A8 80049AA8 0040F809 */  jalr       $v0
/* 4A6AC 80049AAC 00A42021 */   addu      $a0, $a1, $a0
/* 4A6B0 80049AB0 080126F0 */  j          .L80049BC0
/* 4A6B4 80049AB4 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049AB8:
/* 4A6B8 80049AB8 24020001 */  addiu      $v0, $zero, 1
/* 4A6BC 80049ABC 10620017 */  beq        $v1, $v0, .L80049B1C
/* 4A6C0 80049AC0 28620002 */   slti      $v0, $v1, 2
/* 4A6C4 80049AC4 10400005 */  beqz       $v0, .L80049ADC
/* 4A6C8 80049AC8 24020002 */   addiu     $v0, $zero, 2
/* 4A6CC 80049ACC 10600007 */  beqz       $v1, .L80049AEC
/* 4A6D0 80049AD0 00001021 */   addu      $v0, $zero, $zero
/* 4A6D4 80049AD4 080126F0 */  j          .L80049BC0
/* 4A6D8 80049AD8 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049ADC:
/* 4A6DC 80049ADC 1062001B */  beq        $v1, $v0, .L80049B4C
/* 4A6E0 80049AE0 00001021 */   addu      $v0, $zero, $zero
/* 4A6E4 80049AE4 080126F0 */  j          .L80049BC0
/* 4A6E8 80049AE8 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049AEC:
/* 4A6EC 80049AEC 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A6F0 80049AF0 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4A6F4 80049AF4 C4402054 */  lwc1       $f0, 0x2054($v0)
/* 4A6F8 80049AF8 3C01800E */  lui        $at, %hi(D_800DD5F0)
/* 4A6FC 80049AFC C422D5F0 */  lwc1       $f2, %lo(D_800DD5F0)($at)
/* 4A700 80049B00 4600103C */  c.lt.s     $f2, $f0
/* 4A704 80049B04 00000000 */  nop
/* 4A708 80049B08 4502002B */  bc1fl      .L80049BB8
/* 4A70C 80049B0C AC402054 */   sw        $zero, 0x2054($v0)
/* 4A710 80049B10 46020001 */  sub.s      $f0, $f0, $f2
/* 4A714 80049B14 080126EE */  j          .L80049BB8
/* 4A718 80049B18 E4402054 */   swc1      $f0, 0x2054($v0)
.L80049B1C:
/* 4A71C 80049B1C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A720 80049B20 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4A724 80049B24 C4402058 */  lwc1       $f0, 0x2058($v0)
/* 4A728 80049B28 3C01800E */  lui        $at, %hi(D_800DD5F4)
/* 4A72C 80049B2C C422D5F4 */  lwc1       $f2, %lo(D_800DD5F4)($at)
/* 4A730 80049B30 4600103C */  c.lt.s     $f2, $f0
/* 4A734 80049B34 00000000 */  nop
/* 4A738 80049B38 4502001F */  bc1fl      .L80049BB8
/* 4A73C 80049B3C AC402058 */   sw        $zero, 0x2058($v0)
/* 4A740 80049B40 46020001 */  sub.s      $f0, $f0, $f2
/* 4A744 80049B44 080126EE */  j          .L80049BB8
/* 4A748 80049B48 E4402058 */   swc1      $f0, 0x2058($v0)
.L80049B4C:
/* 4A74C 80049B4C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A750 80049B50 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 4A754 80049B54 923015FC */  lbu        $s0, 0x15fc($s1)
/* 4A758 80049B58 12000017 */  beqz       $s0, .L80049BB8
/* 4A75C 80049B5C 3C02800E */   lui       $v0, %hi(ExpPakFlag)
/* 4A760 80049B60 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 4A764 80049B64 10600014 */  beqz       $v1, .L80049BB8
/* 4A768 80049B68 2610FFFF */   addiu     $s0, $s0, -1
/* 4A76C 80049B6C 321000FF */  andi       $s0, $s0, 0xff
/* 4A770 80049B70 3C03800E */  lui        $v1, %hi(res_mode_string)
/* 4A774 80049B74 246366D0 */  addiu      $v1, $v1, %lo(res_mode_string)
/* 4A778 80049B78 00101080 */  sll        $v0, $s0, 2
/* 4A77C 80049B7C 00431021 */  addu       $v0, $v0, $v1
/* 4A780 80049B80 8CA40014 */  lw         $a0, 0x14($a1)
/* 4A784 80049B84 8C450000 */  lw         $a1, ($v0)
/* 4A788 80049B88 0C02EEDD */  jal        utilities_func
/* 4A78C 80049B8C 24060001 */   addiu     $a2, $zero, 1
/* 4A790 80049B90 0C012650 */  jal        selectResMode
/* 4A794 80049B94 02002021 */   addu      $a0, $s0, $zero
/* 4A798 80049B98 262412F8 */  addiu      $a0, $s1, 0x12f8
/* 4A79C 80049B9C 2405073D */  addiu      $a1, $zero, 0x73d
/* 4A7A0 80049BA0 00003021 */  addu       $a2, $zero, $zero
/* 4A7A4 80049BA4 3C073F80 */  lui        $a3, 0x3f80
/* 4A7A8 80049BA8 2402001E */  addiu      $v0, $zero, 0x1e
/* 4A7AC 80049BAC AFA20010 */  sw         $v0, 0x10($sp)
/* 4A7B0 80049BB0 0C0156F4 */  jal        play_SFX
/* 4A7B4 80049BB4 AFA00014 */   sw        $zero, 0x14($sp)
.L80049BB8:
/* 4A7B8 80049BB8 00001021 */  addu       $v0, $zero, $zero
/* 4A7BC 80049BBC 8FBF0020 */  lw         $ra, 0x20($sp)
.L80049BC0:
/* 4A7C0 80049BC0 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4A7C4 80049BC4 8FB00018 */  lw         $s0, 0x18($sp)
/* 4A7C8 80049BC8 03E00008 */  jr         $ra
/* 4A7CC 80049BCC 27BD0028 */   addiu     $sp, $sp, 0x28

glabel options_func_Right
/* 4A7D0 80049BD0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4A7D4 80049BD4 AFBF0020 */  sw         $ra, 0x20($sp)
/* 4A7D8 80049BD8 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4A7DC 80049BDC AFB00018 */  sw         $s0, 0x18($sp)
/* 4A7E0 80049BE0 8CA50040 */  lw         $a1, 0x40($a1)
/* 4A7E4 80049BE4 90A20028 */  lbu        $v0, 0x28($a1)
/* 4A7E8 80049BE8 50400009 */  beql       $v0, $zero, .L80049C10
/* 4A7EC 80049BEC 90A30020 */   lbu       $v1, 0x20($a1)
/* 4A7F0 80049BF0 8CA50024 */  lw         $a1, 0x24($a1)
/* 4A7F4 80049BF4 8CA30078 */  lw         $v1, 0x78($a1)
/* 4A7F8 80049BF8 84640070 */  lh         $a0, 0x70($v1)
/* 4A7FC 80049BFC 8C620074 */  lw         $v0, 0x74($v1)
/* 4A800 80049C00 0040F809 */  jalr       $v0
/* 4A804 80049C04 00A42021 */   addu      $a0, $a1, $a0
/* 4A808 80049C08 08012753 */  j          .L80049D4C
/* 4A80C 80049C0C 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049C10:
/* 4A810 80049C10 24020001 */  addiu      $v0, $zero, 1
/* 4A814 80049C14 1062001D */  beq        $v1, $v0, .L80049C8C
/* 4A818 80049C18 28620002 */   slti      $v0, $v1, 2
/* 4A81C 80049C1C 10400005 */  beqz       $v0, .L80049C34
/* 4A820 80049C20 24020002 */   addiu     $v0, $zero, 2
/* 4A824 80049C24 10600007 */  beqz       $v1, .L80049C44
/* 4A828 80049C28 00001021 */   addu      $v0, $zero, $zero
/* 4A82C 80049C2C 08012753 */  j          .L80049D4C
/* 4A830 80049C30 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049C34:
/* 4A834 80049C34 10620027 */  beq        $v1, $v0, .L80049CD4
/* 4A838 80049C38 00001021 */   addu      $v0, $zero, $zero
/* 4A83C 80049C3C 08012753 */  j          .L80049D4C
/* 4A840 80049C40 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049C44:
/* 4A844 80049C44 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A848 80049C48 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4A84C 80049C4C C4422054 */  lwc1       $f2, 0x2054($v0)
/* 4A850 80049C50 3C01800E */  lui        $at, %hi(D_800DD5F8)
/* 4A854 80049C54 C420D5F8 */  lwc1       $f0, %lo(D_800DD5F8)($at)
/* 4A858 80049C58 4600103C */  c.lt.s     $f2, $f0
/* 4A85C 80049C5C 00000000 */  nop
/* 4A860 80049C60 45000006 */  bc1f       .L80049C7C
/* 4A864 80049C64 00000000 */   nop
/* 4A868 80049C68 3C01800E */  lui        $at, %hi(D_800DD5FC)
/* 4A86C 80049C6C C420D5FC */  lwc1       $f0, %lo(D_800DD5FC)($at)
/* 4A870 80049C70 46001000 */  add.s      $f0, $f2, $f0
/* 4A874 80049C74 08012751 */  j          .L80049D44
/* 4A878 80049C78 E4402054 */   swc1      $f0, 0x2054($v0)
.L80049C7C:
/* 4A87C 80049C7C 3C01800E */  lui        $at, %hi(D_800DD600)
/* 4A880 80049C80 C420D600 */  lwc1       $f0, %lo(D_800DD600)($at)
/* 4A884 80049C84 08012751 */  j          .L80049D44
/* 4A888 80049C88 E4402054 */   swc1      $f0, 0x2054($v0)
.L80049C8C:
/* 4A88C 80049C8C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A890 80049C90 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 4A894 80049C94 C4422058 */  lwc1       $f2, 0x2058($v0)
/* 4A898 80049C98 3C01800E */  lui        $at, %hi(D_800DD604)
/* 4A89C 80049C9C C420D604 */  lwc1       $f0, %lo(D_800DD604)($at)
/* 4A8A0 80049CA0 4600103C */  c.lt.s     $f2, $f0
/* 4A8A4 80049CA4 00000000 */  nop
/* 4A8A8 80049CA8 45000006 */  bc1f       .L80049CC4
/* 4A8AC 80049CAC 00000000 */   nop
/* 4A8B0 80049CB0 3C01800E */  lui        $at, %hi(D_800DD608)
/* 4A8B4 80049CB4 C420D608 */  lwc1       $f0, %lo(D_800DD608)($at)
/* 4A8B8 80049CB8 46001000 */  add.s      $f0, $f2, $f0
/* 4A8BC 80049CBC 08012751 */  j          .L80049D44
/* 4A8C0 80049CC0 E4402058 */   swc1      $f0, 0x2058($v0)
.L80049CC4:
/* 4A8C4 80049CC4 3C01800E */  lui        $at, %hi(D_800DD60C)
/* 4A8C8 80049CC8 C420D60C */  lwc1       $f0, %lo(D_800DD60C)($at)
/* 4A8CC 80049CCC 08012751 */  j          .L80049D44
/* 4A8D0 80049CD0 E4402058 */   swc1      $f0, 0x2058($v0)
.L80049CD4:
/* 4A8D4 80049CD4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4A8D8 80049CD8 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 4A8DC 80049CDC 923015FC */  lbu        $s0, 0x15fc($s1)
/* 4A8E0 80049CE0 16000019 */  bnez       $s0, .L80049D48
/* 4A8E4 80049CE4 00001021 */   addu      $v0, $zero, $zero
/* 4A8E8 80049CE8 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 4A8EC 80049CEC 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 4A8F0 80049CF0 10600014 */  beqz       $v1, .L80049D44
/* 4A8F4 80049CF4 26100001 */   addiu     $s0, $s0, 1
/* 4A8F8 80049CF8 321000FF */  andi       $s0, $s0, 0xff
/* 4A8FC 80049CFC 3C03800E */  lui        $v1, %hi(res_mode_string)
/* 4A900 80049D00 246366D0 */  addiu      $v1, $v1, %lo(res_mode_string)
/* 4A904 80049D04 00101080 */  sll        $v0, $s0, 2
/* 4A908 80049D08 00431021 */  addu       $v0, $v0, $v1
/* 4A90C 80049D0C 8CA40014 */  lw         $a0, 0x14($a1)
/* 4A910 80049D10 8C450000 */  lw         $a1, ($v0)
/* 4A914 80049D14 0C02EEDD */  jal        utilities_func
/* 4A918 80049D18 24060001 */   addiu     $a2, $zero, 1
/* 4A91C 80049D1C 0C012650 */  jal        selectResMode
/* 4A920 80049D20 02002021 */   addu      $a0, $s0, $zero
/* 4A924 80049D24 262412F8 */  addiu      $a0, $s1, 0x12f8
/* 4A928 80049D28 2405073D */  addiu      $a1, $zero, 0x73d
/* 4A92C 80049D2C 00003021 */  addu       $a2, $zero, $zero
/* 4A930 80049D30 3C073F80 */  lui        $a3, 0x3f80
/* 4A934 80049D34 2402001E */  addiu      $v0, $zero, 0x1e
/* 4A938 80049D38 AFA20010 */  sw         $v0, 0x10($sp)
/* 4A93C 80049D3C 0C0156F4 */  jal        play_SFX
/* 4A940 80049D40 AFA00014 */   sw        $zero, 0x14($sp)
.L80049D44:
/* 4A944 80049D44 00001021 */  addu       $v0, $zero, $zero
.L80049D48:
/* 4A948 80049D48 8FBF0020 */  lw         $ra, 0x20($sp)
.L80049D4C:
/* 4A94C 80049D4C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4A950 80049D50 8FB00018 */  lw         $s0, 0x18($sp)
/* 4A954 80049D54 03E00008 */  jr         $ra
/* 4A958 80049D58 27BD0028 */   addiu     $sp, $sp, 0x28

glabel options_func_Up
/* 4A95C 80049D5C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4A960 80049D60 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4A964 80049D64 AFB00018 */  sw         $s0, 0x18($sp)
/* 4A968 80049D68 8CB00040 */  lw         $s0, 0x40($a1)
/* 4A96C 80049D6C 92020028 */  lbu        $v0, 0x28($s0)
/* 4A970 80049D70 50400009 */  beql       $v0, $zero, .L80049D98
/* 4A974 80049D74 92020020 */   lbu       $v0, 0x20($s0)
/* 4A978 80049D78 8E050024 */  lw         $a1, 0x24($s0)
/* 4A97C 80049D7C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4A980 80049D80 84640058 */  lh         $a0, 0x58($v1)
/* 4A984 80049D84 8C62005C */  lw         $v0, 0x5c($v1)
/* 4A988 80049D88 0040F809 */  jalr       $v0
/* 4A98C 80049D8C 00A42021 */   addu      $a0, $a1, $a0
/* 4A990 80049D90 08012783 */  j          .L80049E0C
/* 4A994 80049D94 8FBF001C */   lw        $ra, 0x1c($sp)
.L80049D98:
/* 4A998 80049D98 1040001A */  beqz       $v0, .L80049E04
/* 4A99C 80049D9C 00021080 */   sll       $v0, $v0, 2
/* 4A9A0 80049DA0 02021021 */  addu       $v0, $s0, $v0
/* 4A9A4 80049DA4 8C43000C */  lw         $v1, 0xc($v0)
/* 4A9A8 80049DA8 90A2005B */  lbu        $v0, 0x5b($a1)
/* 4A9AC 80049DAC 92050029 */  lbu        $a1, 0x29($s0)
/* 4A9B0 80049DB0 9206002A */  lbu        $a2, 0x2a($s0)
/* 4A9B4 80049DB4 8C680078 */  lw         $t0, 0x78($v1)
/* 4A9B8 80049DB8 9207002B */  lbu        $a3, 0x2b($s0)
/* 4A9BC 80049DBC 85040048 */  lh         $a0, 0x48($t0)
/* 4A9C0 80049DC0 AFA20010 */  sw         $v0, 0x10($sp)
/* 4A9C4 80049DC4 00642021 */  addu       $a0, $v1, $a0
/* 4A9C8 80049DC8 8D03004C */  lw         $v1, 0x4c($t0)
/* 4A9CC 80049DCC 0060F809 */  jalr       $v1
/* 4A9D0 80049DD0 00000000 */   nop
/* 4A9D4 80049DD4 92020020 */  lbu        $v0, 0x20($s0)
/* 4A9D8 80049DD8 2444FFFF */  addiu      $a0, $v0, -1
/* 4A9DC 80049DDC 308300FF */  andi       $v1, $a0, 0xff
/* 4A9E0 80049DE0 24020002 */  addiu      $v0, $zero, 2
/* 4A9E4 80049DE4 14620007 */  bne        $v1, $v0, .L80049E04
/* 4A9E8 80049DE8 A2040020 */   sb        $a0, 0x20($s0)
/* 4A9EC 80049DEC 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 4A9F0 80049DF0 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 4A9F4 80049DF4 14600004 */  bnez       $v1, .L80049E08
/* 4A9F8 80049DF8 00001021 */   addu      $v0, $zero, $zero
/* 4A9FC 80049DFC 2482FFFF */  addiu      $v0, $a0, -1
/* 4AA00 80049E00 A2020020 */  sb         $v0, 0x20($s0)
.L80049E04:
/* 4AA04 80049E04 00001021 */  addu       $v0, $zero, $zero
.L80049E08:
/* 4AA08 80049E08 8FBF001C */  lw         $ra, 0x1c($sp)
.L80049E0C:
/* 4AA0C 80049E0C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4AA10 80049E10 03E00008 */  jr         $ra
/* 4AA14 80049E14 27BD0020 */   addiu     $sp, $sp, 0x20

glabel options_func_Down
/* 4AA18 80049E18 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4AA1C 80049E1C AFBF0020 */  sw         $ra, 0x20($sp)
/* 4AA20 80049E20 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4AA24 80049E24 AFB00018 */  sw         $s0, 0x18($sp)
/* 4AA28 80049E28 8CB00040 */  lw         $s0, 0x40($a1)
/* 4AA2C 80049E2C 92020028 */  lbu        $v0, 0x28($s0)
/* 4AA30 80049E30 50400009 */  beql       $v0, $zero, .L80049E58
/* 4AA34 80049E34 92020020 */   lbu       $v0, 0x20($s0)
/* 4AA38 80049E38 8E050024 */  lw         $a1, 0x24($s0)
/* 4AA3C 80049E3C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4AA40 80049E40 84640060 */  lh         $a0, 0x60($v1)
/* 4AA44 80049E44 8C620064 */  lw         $v0, 0x64($v1)
/* 4AA48 80049E48 0040F809 */  jalr       $v0
/* 4AA4C 80049E4C 00A42021 */   addu      $a0, $a1, $a0
/* 4AA50 80049E50 080127C2 */  j          .L80049F08
/* 4AA54 80049E54 8FBF0020 */   lw        $ra, 0x20($sp)
.L80049E58:
/* 4AA58 80049E58 2C420003 */  sltiu      $v0, $v0, 3
/* 4AA5C 80049E5C 10400028 */  beqz       $v0, .L80049F00
/* 4AA60 80049E60 2611000C */   addiu     $s1, $s0, 0xc
/* 4AA64 80049E64 92020020 */  lbu        $v0, 0x20($s0)
/* 4AA68 80049E68 9206002A */  lbu        $a2, 0x2a($s0)
/* 4AA6C 80049E6C 9207002B */  lbu        $a3, 0x2b($s0)
/* 4AA70 80049E70 00021080 */  sll        $v0, $v0, 2
/* 4AA74 80049E74 02221021 */  addu       $v0, $s1, $v0
/* 4AA78 80049E78 8C430000 */  lw         $v1, ($v0)
/* 4AA7C 80049E7C 90A2005B */  lbu        $v0, 0x5b($a1)
/* 4AA80 80049E80 8C680078 */  lw         $t0, 0x78($v1)
/* 4AA84 80049E84 92050029 */  lbu        $a1, 0x29($s0)
/* 4AA88 80049E88 85040048 */  lh         $a0, 0x48($t0)
/* 4AA8C 80049E8C AFA20010 */  sw         $v0, 0x10($sp)
/* 4AA90 80049E90 8D02004C */  lw         $v0, 0x4c($t0)
/* 4AA94 80049E94 0040F809 */  jalr       $v0
/* 4AA98 80049E98 00642021 */   addu      $a0, $v1, $a0
/* 4AA9C 80049E9C 92030020 */  lbu        $v1, 0x20($s0)
/* 4AAA0 80049EA0 24640001 */  addiu      $a0, $v1, 1
/* 4AAA4 80049EA4 00041080 */  sll        $v0, $a0, 2
/* 4AAA8 80049EA8 02221021 */  addu       $v0, $s1, $v0
/* 4AAAC 80049EAC 8C430000 */  lw         $v1, ($v0)
/* 4AAB0 80049EB0 54600001 */  bnel       $v1, $zero, .L80049EB8
/* 4AAB4 80049EB4 A2040020 */   sb        $a0, 0x20($s0)
.L80049EB8:
/* 4AAB8 80049EB8 92030020 */  lbu        $v1, 0x20($s0)
/* 4AABC 80049EBC 24020002 */  addiu      $v0, $zero, 2
/* 4AAC0 80049EC0 14620010 */  bne        $v1, $v0, .L80049F04
/* 4AAC4 80049EC4 00001021 */   addu      $v0, $zero, $zero
/* 4AAC8 80049EC8 3C02800E */  lui        $v0, %hi(ExpPakFlag)
/* 4AACC 80049ECC 944366C4 */  lhu        $v1, %lo(ExpPakFlag)($v0)
/* 4AAD0 80049ED0 1460000C */  bnez       $v1, .L80049F04
/* 4AAD4 80049ED4 00001021 */   addu      $v0, $zero, $zero
/* 4AAD8 80049ED8 92050020 */  lbu        $a1, 0x20($s0)
/* 4AADC 80049EDC 24A40001 */  addiu      $a0, $a1, 1
/* 4AAE0 80049EE0 00041080 */  sll        $v0, $a0, 2
/* 4AAE4 80049EE4 02221021 */  addu       $v0, $s1, $v0
/* 4AAE8 80049EE8 8C430000 */  lw         $v1, ($v0)
/* 4AAEC 80049EEC 10600003 */  beqz       $v1, .L80049EFC
/* 4AAF0 80049EF0 24A2FFFF */   addiu     $v0, $a1, -1
/* 4AAF4 80049EF4 080127C0 */  j          .L80049F00
/* 4AAF8 80049EF8 A2040020 */   sb        $a0, 0x20($s0)
.L80049EFC:
/* 4AAFC 80049EFC A2020020 */  sb         $v0, 0x20($s0)
.L80049F00:
/* 4AB00 80049F00 00001021 */  addu       $v0, $zero, $zero
.L80049F04:
/* 4AB04 80049F04 8FBF0020 */  lw         $ra, 0x20($sp)
.L80049F08:
/* 4AB08 80049F08 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4AB0C 80049F0C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4AB10 80049F10 03E00008 */  jr         $ra
/* 4AB14 80049F14 27BD0028 */   addiu     $sp, $sp, 0x28

glabel options_func_BButton
/* 4AB18 80049F18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4AB1C 80049F1C AFB00010 */  sw         $s0, 0x10($sp)
/* 4AB20 80049F20 00A08021 */  addu       $s0, $a1, $zero
/* 4AB24 80049F24 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4AB28 80049F28 8E030040 */  lw         $v1, 0x40($s0)
/* 4AB2C 80049F2C 90620028 */  lbu        $v0, 0x28($v1)
/* 4AB30 80049F30 5040000D */  beql       $v0, $zero, .L80049F68
/* 4AB34 80049F34 A600005E */   sh        $zero, 0x5e($s0)
/* 4AB38 80049F38 8C650024 */  lw         $a1, 0x24($v1)
/* 4AB3C 80049F3C 8CA30078 */  lw         $v1, 0x78($a1)
/* 4AB40 80049F40 84640080 */  lh         $a0, 0x80($v1)
/* 4AB44 80049F44 8C620084 */  lw         $v0, 0x84($v1)
/* 4AB48 80049F48 0040F809 */  jalr       $v0
/* 4AB4C 80049F4C 00A42021 */   addu      $a0, $a1, $a0
/* 4AB50 80049F50 10400006 */  beqz       $v0, .L80049F6C
/* 4AB54 80049F54 00001021 */   addu      $v0, $zero, $zero
/* 4AB58 80049F58 0C01266E */  jal        func_800499B8
/* 4AB5C 80049F5C 02002021 */   addu      $a0, $s0, $zero
/* 4AB60 80049F60 080127DB */  j          .L80049F6C
/* 4AB64 80049F64 00001021 */   addu      $v0, $zero, $zero
.L80049F68:
/* 4AB68 80049F68 02001021 */  addu       $v0, $s0, $zero
.L80049F6C:
/* 4AB6C 80049F6C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4AB70 80049F70 8FB00010 */  lw         $s0, 0x10($sp)
/* 4AB74 80049F74 03E00008 */  jr         $ra
/* 4AB78 80049F78 27BD0018 */   addiu     $sp, $sp, 0x18

glabel options_func_AButton
/* 4AB7C 80049F7C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4AB80 80049F80 AFB00010 */  sw         $s0, 0x10($sp)
/* 4AB84 80049F84 00A08021 */  addu       $s0, $a1, $zero
/* 4AB88 80049F88 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4AB8C 80049F8C 8E030040 */  lw         $v1, 0x40($s0)
/* 4AB90 80049F90 90620028 */  lbu        $v0, 0x28($v1)
/* 4AB94 80049F94 5040000D */  beql       $v0, $zero, .L80049FCC
/* 4AB98 80049F98 90630020 */   lbu       $v1, 0x20($v1)
/* 4AB9C 80049F9C 8C650024 */  lw         $a1, 0x24($v1)
/* 4ABA0 80049FA0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4ABA4 80049FA4 84640078 */  lh         $a0, 0x78($v1)
/* 4ABA8 80049FA8 8C62007C */  lw         $v0, 0x7c($v1)
/* 4ABAC 80049FAC 0040F809 */  jalr       $v0
/* 4ABB0 80049FB0 00A42021 */   addu      $a0, $a1, $a0
/* 4ABB4 80049FB4 1040000B */  beqz       $v0, .L80049FE4
/* 4ABB8 80049FB8 00001021 */   addu      $v0, $zero, $zero
/* 4ABBC 80049FBC 0C01266E */  jal        func_800499B8
/* 4ABC0 80049FC0 02002021 */   addu      $a0, $s0, $zero
/* 4ABC4 80049FC4 080127F9 */  j          .L80049FE4
/* 4ABC8 80049FC8 00001021 */   addu      $v0, $zero, $zero
.L80049FCC:
/* 4ABCC 80049FCC 24020003 */  addiu      $v0, $zero, 3
/* 4ABD0 80049FD0 14620004 */  bne        $v1, $v0, .L80049FE4
/* 4ABD4 80049FD4 00001021 */   addu      $v0, $zero, $zero
/* 4ABD8 80049FD8 0C012671 */  jal        func_800499C4
/* 4ABDC 80049FDC 02002021 */   addu      $a0, $s0, $zero
/* 4ABE0 80049FE0 00001021 */  addu       $v0, $zero, $zero
.L80049FE4:
/* 4ABE4 80049FE4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4ABE8 80049FE8 8FB00010 */  lw         $s0, 0x10($sp)
/* 4ABEC 80049FEC 03E00008 */  jr         $ra
/* 4ABF0 80049FF0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel options_func_StartButton
/* 4ABF4 80049FF4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4ABF8 80049FF8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4ABFC 80049FFC 00A08021 */  addu       $s0, $a1, $zero
/* 4AC00 8004A000 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4AC04 8004A004 8E030040 */  lw         $v1, 0x40($s0)
/* 4AC08 8004A008 90620028 */  lbu        $v0, 0x28($v1)
/* 4AC0C 8004A00C 1040000C */  beqz       $v0, .L8004A040
/* 4AC10 8004A010 02001021 */   addu      $v0, $s0, $zero
/* 4AC14 8004A014 8C650024 */  lw         $a1, 0x24($v1)
/* 4AC18 8004A018 8CA30078 */  lw         $v1, 0x78($a1)
/* 4AC1C 8004A01C 846400A0 */  lh         $a0, 0xa0($v1)
/* 4AC20 8004A020 8C6200A4 */  lw         $v0, 0xa4($v1)
/* 4AC24 8004A024 0040F809 */  jalr       $v0
/* 4AC28 8004A028 00A42021 */   addu      $a0, $a1, $a0
/* 4AC2C 8004A02C 10400004 */  beqz       $v0, .L8004A040
/* 4AC30 8004A030 00001021 */   addu      $v0, $zero, $zero
/* 4AC34 8004A034 0C01266E */  jal        func_800499B8
/* 4AC38 8004A038 02002021 */   addu      $a0, $s0, $zero
/* 4AC3C 8004A03C 00001021 */  addu       $v0, $zero, $zero
.L8004A040:
/* 4AC40 8004A040 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4AC44 8004A044 8FB00010 */  lw         $s0, 0x10($sp)
/* 4AC48 8004A048 03E00008 */  jr         $ra
/* 4AC4C 8004A04C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel title_sceen_widget
/* 4AC50 8004A050 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4AC54 8004A054 AFB00010 */  sw         $s0, 0x10($sp)
/* 4AC58 8004A058 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4AC5C 8004A05C 0C02E658 */  jal        widget_menu_build
/* 4AC60 8004A060 00808021 */   addu      $s0, $a0, $zero
/* 4AC64 8004A064 3C03800E */  lui        $v1, %hi(D_800DD680)
/* 4AC68 8004A068 2463D680 */  addiu      $v1, $v1, %lo(D_800DD680)
/* 4AC6C 8004A06C 02002021 */  addu       $a0, $s0, $zero
/* 4AC70 8004A070 0C012896 */  jal        title_screen_init
/* 4AC74 8004A074 AE030078 */   sw        $v1, 0x78($s0)
/* 4AC78 8004A078 02001021 */  addu       $v0, $s0, $zero
/* 4AC7C 8004A07C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4AC80 8004A080 8FB00010 */  lw         $s0, 0x10($sp)
/* 4AC84 8004A084 03E00008 */  jr         $ra
/* 4AC88 8004A088 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004A08C
/* 4AC8C 8004A08C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4AC90 8004A090 AFB10014 */  sw         $s1, 0x14($sp)
/* 4AC94 8004A094 00808821 */  addu       $s1, $a0, $zero
/* 4AC98 8004A098 3C02800E */  lui        $v0, %hi(D_800DD680)
/* 4AC9C 8004A09C AFBF001C */  sw         $ra, 0x1c($sp)
/* 4ACA0 8004A0A0 AFB20018 */  sw         $s2, 0x18($sp)
/* 4ACA4 8004A0A4 AFB00010 */  sw         $s0, 0x10($sp)
/* 4ACA8 8004A0A8 8E300040 */  lw         $s0, 0x40($s1)
/* 4ACAC 8004A0AC 2442D680 */  addiu      $v0, $v0, %lo(D_800DD680)
/* 4ACB0 8004A0B0 AE220078 */  sw         $v0, 0x78($s1)
/* 4ACB4 8004A0B4 8E020000 */  lw         $v0, ($s0)
/* 4ACB8 8004A0B8 1040000C */  beqz       $v0, .L8004A0EC
/* 4ACBC 8004A0BC 00A09021 */   addu      $s2, $a1, $zero
/* 4ACC0 8004A0C0 0C02DEEF */  jal        unlink_widgets
/* 4ACC4 8004A0C4 00402821 */   addu      $a1, $v0, $zero
/* 4ACC8 8004A0C8 8E060000 */  lw         $a2, ($s0)
/* 4ACCC 8004A0CC 10C00006 */  beqz       $a2, .L8004A0E8
/* 4ACD0 8004A0D0 24050003 */   addiu     $a1, $zero, 3
/* 4ACD4 8004A0D4 8CC20078 */  lw         $v0, 0x78($a2)
/* 4ACD8 8004A0D8 84440008 */  lh         $a0, 8($v0)
/* 4ACDC 8004A0DC 8C43000C */  lw         $v1, 0xc($v0)
/* 4ACE0 8004A0E0 0060F809 */  jalr       $v1
/* 4ACE4 8004A0E4 00C42021 */   addu      $a0, $a2, $a0
.L8004A0E8:
/* 4ACE8 8004A0E8 AE000000 */  sw         $zero, ($s0)
.L8004A0EC:
/* 4ACEC 8004A0EC 8E050008 */  lw         $a1, 8($s0)
/* 4ACF0 8004A0F0 50A0000D */  beql       $a1, $zero, .L8004A128
/* 4ACF4 8004A0F4 8E05000C */   lw        $a1, 0xc($s0)
/* 4ACF8 8004A0F8 0C02DEEF */  jal        unlink_widgets
/* 4ACFC 8004A0FC 02202021 */   addu      $a0, $s1, $zero
/* 4AD00 8004A100 8E060008 */  lw         $a2, 8($s0)
/* 4AD04 8004A104 10C00006 */  beqz       $a2, .L8004A120
/* 4AD08 8004A108 24050003 */   addiu     $a1, $zero, 3
/* 4AD0C 8004A10C 8CC20078 */  lw         $v0, 0x78($a2)
/* 4AD10 8004A110 84440008 */  lh         $a0, 8($v0)
/* 4AD14 8004A114 8C43000C */  lw         $v1, 0xc($v0)
/* 4AD18 8004A118 0060F809 */  jalr       $v1
/* 4AD1C 8004A11C 00C42021 */   addu      $a0, $a2, $a0
.L8004A120:
/* 4AD20 8004A120 AE000008 */  sw         $zero, 8($s0)
/* 4AD24 8004A124 8E05000C */  lw         $a1, 0xc($s0)
.L8004A128:
/* 4AD28 8004A128 50A0000D */  beql       $a1, $zero, .L8004A160
/* 4AD2C 8004A12C 8E050010 */   lw        $a1, 0x10($s0)
/* 4AD30 8004A130 0C02DEEF */  jal        unlink_widgets
/* 4AD34 8004A134 02202021 */   addu      $a0, $s1, $zero
/* 4AD38 8004A138 8E06000C */  lw         $a2, 0xc($s0)
/* 4AD3C 8004A13C 10C00006 */  beqz       $a2, .L8004A158
/* 4AD40 8004A140 24050003 */   addiu     $a1, $zero, 3
/* 4AD44 8004A144 8CC20078 */  lw         $v0, 0x78($a2)
/* 4AD48 8004A148 84440008 */  lh         $a0, 8($v0)
/* 4AD4C 8004A14C 8C43000C */  lw         $v1, 0xc($v0)
/* 4AD50 8004A150 0060F809 */  jalr       $v1
/* 4AD54 8004A154 00C42021 */   addu      $a0, $a2, $a0
.L8004A158:
/* 4AD58 8004A158 AE00000C */  sw         $zero, 0xc($s0)
/* 4AD5C 8004A15C 8E050010 */  lw         $a1, 0x10($s0)
.L8004A160:
/* 4AD60 8004A160 50A0000D */  beql       $a1, $zero, .L8004A198
/* 4AD64 8004A164 8E050014 */   lw        $a1, 0x14($s0)
/* 4AD68 8004A168 0C02DEEF */  jal        unlink_widgets
/* 4AD6C 8004A16C 02202021 */   addu      $a0, $s1, $zero
/* 4AD70 8004A170 8E060010 */  lw         $a2, 0x10($s0)
/* 4AD74 8004A174 10C00006 */  beqz       $a2, .L8004A190
/* 4AD78 8004A178 24050003 */   addiu     $a1, $zero, 3
/* 4AD7C 8004A17C 8CC20078 */  lw         $v0, 0x78($a2)
/* 4AD80 8004A180 84440008 */  lh         $a0, 8($v0)
/* 4AD84 8004A184 8C43000C */  lw         $v1, 0xc($v0)
/* 4AD88 8004A188 0060F809 */  jalr       $v1
/* 4AD8C 8004A18C 00C42021 */   addu      $a0, $a2, $a0
.L8004A190:
/* 4AD90 8004A190 AE000010 */  sw         $zero, 0x10($s0)
/* 4AD94 8004A194 8E050014 */  lw         $a1, 0x14($s0)
.L8004A198:
/* 4AD98 8004A198 10A0000D */  beqz       $a1, .L8004A1D0
/* 4AD9C 8004A19C 02002021 */   addu      $a0, $s0, $zero
/* 4ADA0 8004A1A0 0C02DEEF */  jal        unlink_widgets
/* 4ADA4 8004A1A4 02202021 */   addu      $a0, $s1, $zero
/* 4ADA8 8004A1A8 8E060014 */  lw         $a2, 0x14($s0)
/* 4ADAC 8004A1AC 10C00006 */  beqz       $a2, .L8004A1C8
/* 4ADB0 8004A1B0 24050003 */   addiu     $a1, $zero, 3
/* 4ADB4 8004A1B4 8CC20078 */  lw         $v0, 0x78($a2)
/* 4ADB8 8004A1B8 84440008 */  lh         $a0, 8($v0)
/* 4ADBC 8004A1BC 8C43000C */  lw         $v1, 0xc($v0)
/* 4ADC0 8004A1C0 0060F809 */  jalr       $v1
/* 4ADC4 8004A1C4 00C42021 */   addu      $a0, $a2, $a0
.L8004A1C8:
/* 4ADC8 8004A1C8 AE000014 */  sw         $zero, 0x14($s0)
/* 4ADCC 8004A1CC 02002021 */  addu       $a0, $s0, $zero
.L8004A1D0:
/* 4ADD0 8004A1D0 AE000018 */  sw         $zero, 0x18($s0)
/* 4ADD4 8004A1D4 0C026262 */  jal        passToFree
/* 4ADD8 8004A1D8 AE00001C */   sw        $zero, 0x1c($s0)
/* 4ADDC 8004A1DC 8E250080 */  lw         $a1, 0x80($s1)
/* 4ADE0 8004A1E0 10A00009 */  beqz       $a1, .L8004A208
/* 4ADE4 8004A1E4 AE200040 */   sw        $zero, 0x40($s1)
/* 4ADE8 8004A1E8 0C02DEEF */  jal        unlink_widgets
/* 4ADEC 8004A1EC 02202021 */   addu      $a0, $s1, $zero
/* 4ADF0 8004A1F0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 4ADF4 8004A1F4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 4ADF8 8004A1F8 26250080 */  addiu      $a1, $s1, 0x80
/* 4ADFC 8004A1FC 24060006 */  addiu      $a2, $zero, 6
/* 4AE00 8004A200 0C035867 */  jal        AllocFreeQueueItem
/* 4AE04 8004A204 00003821 */   addu      $a3, $zero, $zero
.L8004A208:
/* 4AE08 8004A208 8E250084 */  lw         $a1, 0x84($s1)
/* 4AE0C 8004A20C 10A0000A */  beqz       $a1, .L8004A238
/* 4AE10 8004A210 02202021 */   addu      $a0, $s1, $zero
/* 4AE14 8004A214 0C02DEEF */  jal        unlink_widgets
/* 4AE18 8004A218 02202021 */   addu      $a0, $s1, $zero
/* 4AE1C 8004A21C 3C04800E */  lui        $a0, %hi(queueStructA)
/* 4AE20 8004A220 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 4AE24 8004A224 26250084 */  addiu      $a1, $s1, 0x84
/* 4AE28 8004A228 24060006 */  addiu      $a2, $zero, 6
/* 4AE2C 8004A22C 0C035867 */  jal        AllocFreeQueueItem
/* 4AE30 8004A230 00003821 */   addu      $a3, $zero, $zero
/* 4AE34 8004A234 02202021 */  addu       $a0, $s1, $zero
.L8004A238:
/* 4AE38 8004A238 0C02E66C */  jal        widget_menu_free
/* 4AE3C 8004A23C 02402821 */   addu      $a1, $s2, $zero
/* 4AE40 8004A240 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4AE44 8004A244 8FB20018 */  lw         $s2, 0x18($sp)
/* 4AE48 8004A248 8FB10014 */  lw         $s1, 0x14($sp)
/* 4AE4C 8004A24C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4AE50 8004A250 03E00008 */  jr         $ra
/* 4AE54 8004A254 27BD0020 */   addiu     $sp, $sp, 0x20

glabel title_screen_init
/* 4AE58 8004A258 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4AE5C 8004A25C AFB10014 */  sw         $s1, 0x14($sp)
/* 4AE60 8004A260 00808821 */  addu       $s1, $a0, $zero
/* 4AE64 8004A264 24040028 */  addiu      $a0, $zero, 0x28
/* 4AE68 8004A268 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4AE6C 8004A26C 0C026259 */  jal        passToMalloc
/* 4AE70 8004A270 AFB00010 */   sw        $s0, 0x10($sp)
/* 4AE74 8004A274 00002021 */  addu       $a0, $zero, $zero
/* 4AE78 8004A278 00408021 */  addu       $s0, $v0, $zero
/* 4AE7C 8004A27C 0C0271BF */  jal        cont_delay
/* 4AE80 8004A280 AE300040 */   sw        $s0, 0x40($s1)
/* 4AE84 8004A284 02202021 */  addu       $a0, $s1, $zero
/* 4AE88 8004A288 24020014 */  addiu      $v0, $zero, 0x14
/* 4AE8C 8004A28C AE00000C */  sw         $zero, 0xc($s0)
/* 4AE90 8004A290 AE000008 */  sw         $zero, 8($s0)
/* 4AE94 8004A294 AE000000 */  sw         $zero, ($s0)
/* 4AE98 8004A298 AE000010 */  sw         $zero, 0x10($s0)
/* 4AE9C 8004A29C AE000014 */  sw         $zero, 0x14($s0)
/* 4AEA0 8004A2A0 AE000018 */  sw         $zero, 0x18($s0)
/* 4AEA4 8004A2A4 AE00001C */  sw         $zero, 0x1c($s0)
/* 4AEA8 8004A2A8 AE000020 */  sw         $zero, 0x20($s0)
/* 4AEAC 8004A2AC A220007F */  sb         $zero, 0x7f($s1)
/* 4AEB0 8004A2B0 A220007E */  sb         $zero, 0x7e($s1)
/* 4AEB4 8004A2B4 A220007D */  sb         $zero, 0x7d($s1)
/* 4AEB8 8004A2B8 A2200088 */  sb         $zero, 0x88($s1)
/* 4AEBC 8004A2BC A222007C */  sb         $v0, 0x7c($s1)
/* 4AEC0 8004A2C0 AE200084 */  sw         $zero, 0x84($s1)
/* 4AEC4 8004A2C4 0C012AD5 */  jal        build_title_screen
/* 4AEC8 8004A2C8 AE200080 */   sw        $zero, 0x80($s1)
/* 4AECC 8004A2CC 3C028005 */  lui        $v0, %hi(func_8004B920)
/* 4AED0 8004A2D0 2442B920 */  addiu      $v0, $v0, %lo(func_8004B920)
/* 4AED4 8004A2D4 3C038005 */  lui        $v1, %hi(func_8004B950)
/* 4AED8 8004A2D8 2463B950 */  addiu      $v1, $v1, %lo(func_8004B950)
/* 4AEDC 8004A2DC AE220010 */  sw         $v0, 0x10($s1)
/* 4AEE0 8004A2E0 3C028005 */  lui        $v0, %hi(func_8004B980)
/* 4AEE4 8004A2E4 2442B980 */  addiu      $v0, $v0, %lo(func_8004B980)
/* 4AEE8 8004A2E8 AE230014 */  sw         $v1, 0x14($s1)
/* 4AEEC 8004A2EC 3C038005 */  lui        $v1, %hi(func_8004B9DC)
/* 4AEF0 8004A2F0 2463B9DC */  addiu      $v1, $v1, %lo(func_8004B9DC)
/* 4AEF4 8004A2F4 AE220008 */  sw         $v0, 8($s1)
/* 4AEF8 8004A2F8 3C028005 */  lui        $v0, %hi(titleScreen_caseSwitch)
/* 4AEFC 8004A2FC 2442BC14 */  addiu      $v0, $v0, %lo(titleScreen_caseSwitch)
/* 4AF00 8004A300 AE23000C */  sw         $v1, 0xc($s1)
/* 4AF04 8004A304 3C038005 */  lui        $v1, %hi(func_8004BA38)
/* 4AF08 8004A308 2463BA38 */  addiu      $v1, $v1, %lo(func_8004BA38)
/* 4AF0C 8004A30C AE220018 */  sw         $v0, 0x18($s1)
/* 4AF10 8004A310 3C028005 */  lui        $v0, %hi(func_8004BB28)
/* 4AF14 8004A314 AE23001C */  sw         $v1, 0x1c($s1)
/* 4AF18 8004A318 8E230078 */  lw         $v1, 0x78($s1)
/* 4AF1C 8004A31C 2442BB28 */  addiu      $v0, $v0, %lo(func_8004BB28)
/* 4AF20 8004A320 AE220020 */  sw         $v0, 0x20($s1)
/* 4AF24 8004A324 84640028 */  lh         $a0, 0x28($v1)
/* 4AF28 8004A328 8C62002C */  lw         $v0, 0x2c($v1)
/* 4AF2C 8004A32C 0040F809 */  jalr       $v0
/* 4AF30 8004A330 02242021 */   addu      $a0, $s1, $a0
/* 4AF34 8004A334 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4AF38 8004A338 8FB10014 */  lw         $s1, 0x14($sp)
/* 4AF3C 8004A33C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4AF40 8004A340 03E00008 */  jr         $ra
/* 4AF44 8004A344 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004A348
/* 4AF48 8004A348 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 4AF4C 8004A34C AFB1001C */  sw         $s1, 0x1c($sp)
/* 4AF50 8004A350 00A08821 */  addu       $s1, $a1, $zero
/* 4AF54 8004A354 AFB20020 */  sw         $s2, 0x20($sp)
/* 4AF58 8004A358 00809021 */  addu       $s2, $a0, $zero
/* 4AF5C 8004A35C 00063400 */  sll        $a2, $a2, 0x10
/* 4AF60 8004A360 AFB70034 */  sw         $s7, 0x34($sp)
/* 4AF64 8004A364 0006BC03 */  sra        $s7, $a2, 0x10
/* 4AF68 8004A368 00073C00 */  sll        $a3, $a3, 0x10
/* 4AF6C 8004A36C AFB60030 */  sw         $s6, 0x30($sp)
/* 4AF70 8004A370 0007B403 */  sra        $s6, $a3, 0x10
/* 4AF74 8004A374 24030004 */  addiu      $v1, $zero, 4
/* 4AF78 8004A378 AFBF0038 */  sw         $ra, 0x38($sp)
/* 4AF7C 8004A37C AFB5002C */  sw         $s5, 0x2c($sp)
/* 4AF80 8004A380 AFB40028 */  sw         $s4, 0x28($sp)
/* 4AF84 8004A384 AFB30024 */  sw         $s3, 0x24($sp)
/* 4AF88 8004A388 AFB00018 */  sw         $s0, 0x18($sp)
/* 4AF8C 8004A38C 8E530040 */  lw         $s3, 0x40($s2)
/* 4AF90 8004A390 87B50052 */  lh         $s5, 0x52($sp)
/* 4AF94 8004A394 92620024 */  lbu        $v0, 0x24($s3)
/* 4AF98 8004A398 14430036 */  bne        $v0, $v1, .L8004A474
/* 4AF9C 8004A39C 87B40056 */   lh        $s4, 0x56($sp)
/* 4AFA0 8004A3A0 8E63000C */  lw         $v1, 0xc($s3)
/* 4AFA4 8004A3A4 8C700040 */  lw         $s0, 0x40($v1)
/* 4AFA8 8004A3A8 92020028 */  lbu        $v0, 0x28($s0)
/* 4AFAC 8004A3AC 5040000B */  beql       $v0, $zero, .L8004A3DC
/* 4AFB0 8004A3B0 8E020024 */   lw        $v0, 0x24($s0)
/* 4AFB4 8004A3B4 8E440080 */  lw         $a0, 0x80($s2)
/* 4AFB8 8004A3B8 50800004 */  beql       $a0, $zero, .L8004A3CC
/* 4AFBC 8004A3BC 8E440084 */   lw        $a0, 0x84($s2)
/* 4AFC0 8004A3C0 0C02F216 */  jal        widget_fade
/* 4AFC4 8004A3C4 9065005B */   lbu       $a1, 0x5b($v1)
/* 4AFC8 8004A3C8 8E440084 */  lw         $a0, 0x84($s2)
.L8004A3CC:
/* 4AFCC 8004A3CC 5080001C */  beql       $a0, $zero, .L8004A440
/* 4AFD0 8004A3D0 8E480080 */   lw        $t0, 0x80($s2)
/* 4AFD4 8004A3D4 08012901 */  j          .L8004A404
/* 4AFD8 8004A3D8 8E020024 */   lw        $v0, 0x24($s0)
.L8004A3DC:
/* 4AFDC 8004A3DC 1040000D */  beqz       $v0, .L8004A414
/* 4AFE0 8004A3E0 8E440080 */   lw        $a0, 0x80($s2)
/* 4AFE4 8004A3E4 50800004 */  beql       $a0, $zero, .L8004A3F8
/* 4AFE8 8004A3E8 8E440084 */   lw        $a0, 0x84($s2)
/* 4AFEC 8004A3EC 0C02F216 */  jal        widget_fade
/* 4AFF0 8004A3F0 9045005B */   lbu       $a1, 0x5b($v0)
/* 4AFF4 8004A3F4 8E440084 */  lw         $a0, 0x84($s2)
.L8004A3F8:
/* 4AFF8 8004A3F8 50800011 */  beql       $a0, $zero, .L8004A440
/* 4AFFC 8004A3FC 8E480080 */   lw        $t0, 0x80($s2)
/* 4B000 8004A400 8E62000C */  lw         $v0, 0xc($s3)
.L8004A404:
/* 4B004 8004A404 0C02F216 */  jal        widget_fade
/* 4B008 8004A408 9045005B */   lbu       $a1, 0x5b($v0)
/* 4B00C 8004A40C 08012910 */  j          .L8004A440
/* 4B010 8004A410 8E480080 */   lw        $t0, 0x80($s2)
.L8004A414:
/* 4B014 8004A414 50800004 */  beql       $a0, $zero, .L8004A428
/* 4B018 8004A418 8E440084 */   lw        $a0, 0x84($s2)
/* 4B01C 8004A41C 0C02F216 */  jal        widget_fade
/* 4B020 8004A420 9245007F */   lbu       $a1, 0x7f($s2)
/* 4B024 8004A424 8E440084 */  lw         $a0, 0x84($s2)
.L8004A428:
/* 4B028 8004A428 50800005 */  beql       $a0, $zero, .L8004A440
/* 4B02C 8004A42C 8E480080 */   lw        $t0, 0x80($s2)
/* 4B030 8004A430 8E62000C */  lw         $v0, 0xc($s3)
/* 4B034 8004A434 0C02F216 */  jal        widget_fade
/* 4B038 8004A438 9045005B */   lbu       $a1, 0x5b($v0)
/* 4B03C 8004A43C 8E480080 */  lw         $t0, 0x80($s2)
.L8004A440:
/* 4B040 8004A440 11000021 */  beqz       $t0, .L8004A4C8
/* 4B044 8004A444 02202821 */   addu      $a1, $s1, $zero
/* 4B048 8004A448 8D030078 */  lw         $v1, 0x78($t0)
/* 4B04C 8004A44C 02E03021 */  addu       $a2, $s7, $zero
/* 4B050 8004A450 84640040 */  lh         $a0, 0x40($v1)
/* 4B054 8004A454 02C03821 */  addu       $a3, $s6, $zero
/* 4B058 8004A458 AFB50010 */  sw         $s5, 0x10($sp)
/* 4B05C 8004A45C AFB40014 */  sw         $s4, 0x14($sp)
/* 4B060 8004A460 8C620044 */  lw         $v0, 0x44($v1)
/* 4B064 8004A464 0040F809 */  jalr       $v0
/* 4B068 8004A468 01042021 */   addu      $a0, $t0, $a0
/* 4B06C 8004A46C 08012922 */  j          .L8004A488
/* 4B070 8004A470 00408821 */   addu      $s1, $v0, $zero
.L8004A474:
/* 4B074 8004A474 8E440080 */  lw         $a0, 0x80($s2)
/* 4B078 8004A478 50800014 */  beql       $a0, $zero, .L8004A4CC
/* 4B07C 8004A47C 8E650020 */   lw        $a1, 0x20($s3)
/* 4B080 8004A480 0C02F216 */  jal        widget_fade
/* 4B084 8004A484 9245007F */   lbu       $a1, 0x7f($s2)
.L8004A488:
/* 4B088 8004A488 8E480080 */  lw         $t0, 0x80($s2)
/* 4B08C 8004A48C 5100000F */  beql       $t0, $zero, .L8004A4CC
/* 4B090 8004A490 8E650020 */   lw        $a1, 0x20($s3)
/* 4B094 8004A494 9102005B */  lbu        $v0, 0x5b($t0)
/* 4B098 8004A498 1040000B */  beqz       $v0, .L8004A4C8
/* 4B09C 8004A49C 02202821 */   addu      $a1, $s1, $zero
/* 4B0A0 8004A4A0 8D030078 */  lw         $v1, 0x78($t0)
/* 4B0A4 8004A4A4 02E03021 */  addu       $a2, $s7, $zero
/* 4B0A8 8004A4A8 84640040 */  lh         $a0, 0x40($v1)
/* 4B0AC 8004A4AC 02C03821 */  addu       $a3, $s6, $zero
/* 4B0B0 8004A4B0 AFB50010 */  sw         $s5, 0x10($sp)
/* 4B0B4 8004A4B4 AFB40014 */  sw         $s4, 0x14($sp)
/* 4B0B8 8004A4B8 8C620044 */  lw         $v0, 0x44($v1)
/* 4B0BC 8004A4BC 0040F809 */  jalr       $v0
/* 4B0C0 8004A4C0 01042021 */   addu      $a0, $t0, $a0
/* 4B0C4 8004A4C4 00408821 */  addu       $s1, $v0, $zero
.L8004A4C8:
/* 4B0C8 8004A4C8 8E650020 */  lw         $a1, 0x20($s3)
.L8004A4CC:
/* 4B0CC 8004A4CC 50A00016 */  beql       $a1, $zero, .L8004A528
/* 4B0D0 8004A4D0 8E480084 */   lw        $t0, 0x84($s2)
/* 4B0D4 8004A4D4 9242007F */  lbu        $v0, 0x7f($s2)
/* 4B0D8 8004A4D8 50400013 */  beql       $v0, $zero, .L8004A528
/* 4B0DC 8004A4DC 8E480084 */   lw        $t0, 0x84($s2)
/* 4B0E0 8004A4E0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4B0E4 8004A4E4 84640028 */  lh         $a0, 0x28($v1)
/* 4B0E8 8004A4E8 8C62002C */  lw         $v0, 0x2c($v1)
/* 4B0EC 8004A4EC 0040F809 */  jalr       $v0
/* 4B0F0 8004A4F0 00A42021 */   addu      $a0, $a1, $a0
/* 4B0F4 8004A4F4 8E680020 */  lw         $t0, 0x20($s3)
/* 4B0F8 8004A4F8 02202821 */  addu       $a1, $s1, $zero
/* 4B0FC 8004A4FC 8D030078 */  lw         $v1, 0x78($t0)
/* 4B100 8004A500 02E03021 */  addu       $a2, $s7, $zero
/* 4B104 8004A504 84640040 */  lh         $a0, 0x40($v1)
/* 4B108 8004A508 02C03821 */  addu       $a3, $s6, $zero
/* 4B10C 8004A50C AFB50010 */  sw         $s5, 0x10($sp)
/* 4B110 8004A510 AFB40014 */  sw         $s4, 0x14($sp)
/* 4B114 8004A514 8C620044 */  lw         $v0, 0x44($v1)
/* 4B118 8004A518 0040F809 */  jalr       $v0
/* 4B11C 8004A51C 01042021 */   addu      $a0, $t0, $a0
/* 4B120 8004A520 00408821 */  addu       $s1, $v0, $zero
/* 4B124 8004A524 8E480084 */  lw         $t0, 0x84($s2)
.L8004A528:
/* 4B128 8004A528 5100000F */  beql       $t0, $zero, .L8004A568
/* 4B12C 8004A52C 02402021 */   addu      $a0, $s2, $zero
/* 4B130 8004A530 9102005B */  lbu        $v0, 0x5b($t0)
/* 4B134 8004A534 1040000B */  beqz       $v0, .L8004A564
/* 4B138 8004A538 02202821 */   addu      $a1, $s1, $zero
/* 4B13C 8004A53C 8D030078 */  lw         $v1, 0x78($t0)
/* 4B140 8004A540 02E03021 */  addu       $a2, $s7, $zero
/* 4B144 8004A544 84640040 */  lh         $a0, 0x40($v1)
/* 4B148 8004A548 02C03821 */  addu       $a3, $s6, $zero
/* 4B14C 8004A54C AFB50010 */  sw         $s5, 0x10($sp)
/* 4B150 8004A550 AFB40014 */  sw         $s4, 0x14($sp)
/* 4B154 8004A554 8C620044 */  lw         $v0, 0x44($v1)
/* 4B158 8004A558 0040F809 */  jalr       $v0
/* 4B15C 8004A55C 01042021 */   addu      $a0, $t0, $a0
/* 4B160 8004A560 00408821 */  addu       $s1, $v0, $zero
.L8004A564:
/* 4B164 8004A564 02402021 */  addu       $a0, $s2, $zero
.L8004A568:
/* 4B168 8004A568 02202821 */  addu       $a1, $s1, $zero
/* 4B16C 8004A56C 02E03021 */  addu       $a2, $s7, $zero
/* 4B170 8004A570 02C03821 */  addu       $a3, $s6, $zero
/* 4B174 8004A574 AFB50010 */  sw         $s5, 0x10($sp)
/* 4B178 8004A578 0C02DE14 */  jal        widget_func_8
/* 4B17C 8004A57C AFB40014 */   sw        $s4, 0x14($sp)
/* 4B180 8004A580 8FBF0038 */  lw         $ra, 0x38($sp)
/* 4B184 8004A584 8FB70034 */  lw         $s7, 0x34($sp)
/* 4B188 8004A588 8FB60030 */  lw         $s6, 0x30($sp)
/* 4B18C 8004A58C 8FB5002C */  lw         $s5, 0x2c($sp)
/* 4B190 8004A590 8FB40028 */  lw         $s4, 0x28($sp)
/* 4B194 8004A594 8FB30024 */  lw         $s3, 0x24($sp)
/* 4B198 8004A598 8FB20020 */  lw         $s2, 0x20($sp)
/* 4B19C 8004A59C 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4B1A0 8004A5A0 8FB00018 */  lw         $s0, 0x18($sp)
/* 4B1A4 8004A5A4 03E00008 */  jr         $ra
/* 4B1A8 8004A5A8 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_8004A5AC
/* 4B1AC 8004A5AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4B1B0 8004A5B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4B1B4 8004A5B4 00808021 */  addu       $s0, $a0, $zero
/* 4B1B8 8004A5B8 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4B1BC 8004A5BC AFB10014 */  sw         $s1, 0x14($sp)
/* 4B1C0 8004A5C0 8E110040 */  lw         $s1, 0x40($s0)
/* 4B1C4 8004A5C4 8E22001C */  lw         $v0, 0x1c($s1)
/* 4B1C8 8004A5C8 50400013 */  beql       $v0, $zero, .L8004A618
/* 4B1CC 8004A5CC 8E220020 */   lw        $v0, 0x20($s1)
/* 4B1D0 8004A5D0 9202007E */  lbu        $v0, 0x7e($s0)
/* 4B1D4 8004A5D4 2C4200FF */  sltiu      $v0, $v0, 0xff
/* 4B1D8 8004A5D8 5040000F */  beql       $v0, $zero, .L8004A618
/* 4B1DC 8004A5DC 8E220020 */   lw        $v0, 0x20($s1)
/* 4B1E0 8004A5E0 240500FF */  addiu      $a1, $zero, 0xff
/* 4B1E4 8004A5E4 9204007C */  lbu        $a0, 0x7c($s0)
/* 4B1E8 8004A5E8 9203007E */  lbu        $v1, 0x7e($s0)
/* 4B1EC 8004A5EC 00A41023 */  subu       $v0, $a1, $a0
/* 4B1F0 8004A5F0 0062102A */  slt        $v0, $v1, $v0
/* 4B1F4 8004A5F4 10400003 */  beqz       $v0, .L8004A604
/* 4B1F8 8004A5F8 00641021 */   addu      $v0, $v1, $a0
/* 4B1FC 8004A5FC 08012982 */  j          .L8004A608
/* 4B200 8004A600 A202007E */   sb        $v0, 0x7e($s0)
.L8004A604:
/* 4B204 8004A604 A205007E */  sb         $a1, 0x7e($s0)
.L8004A608:
/* 4B208 8004A608 8E24001C */  lw         $a0, 0x1c($s1)
/* 4B20C 8004A60C 0C02F216 */  jal        widget_fade
/* 4B210 8004A610 9205007E */   lbu       $a1, 0x7e($s0)
/* 4B214 8004A614 8E220020 */  lw         $v0, 0x20($s1)
.L8004A618:
/* 4B218 8004A618 50400010 */  beql       $v0, $zero, .L8004A65C
/* 4B21C 8004A61C 9202007F */   lbu       $v0, 0x7f($s0)
/* 4B220 8004A620 9204007F */  lbu        $a0, 0x7f($s0)
/* 4B224 8004A624 308200FF */  andi       $v0, $a0, 0xff
/* 4B228 8004A628 5040000F */  beql       $v0, $zero, .L8004A668
/* 4B22C 8004A62C 8E260010 */   lw        $a2, 0x10($s1)
/* 4B230 8004A630 9203007C */  lbu        $v1, 0x7c($s0)
/* 4B234 8004A634 0062102B */  sltu       $v0, $v1, $v0
/* 4B238 8004A638 10400003 */  beqz       $v0, .L8004A648
/* 4B23C 8004A63C 00831023 */   subu      $v0, $a0, $v1
/* 4B240 8004A640 08012993 */  j          .L8004A64C
/* 4B244 8004A644 A202007F */   sb        $v0, 0x7f($s0)
.L8004A648:
/* 4B248 8004A648 A200007F */  sb         $zero, 0x7f($s0)
.L8004A64C:
/* 4B24C 8004A64C 8E240020 */  lw         $a0, 0x20($s1)
/* 4B250 8004A650 0C02F216 */  jal        widget_fade
/* 4B254 8004A654 9205007F */   lbu       $a1, 0x7f($s0)
/* 4B258 8004A658 9202007F */  lbu        $v0, 0x7f($s0)
.L8004A65C:
/* 4B25C 8004A65C 5440001C */  bnel       $v0, $zero, .L8004A6D0
/* 4B260 8004A660 92220024 */   lbu       $v0, 0x24($s1)
/* 4B264 8004A664 8E260010 */  lw         $a2, 0x10($s1)
.L8004A668:
/* 4B268 8004A668 50C0000D */  beql       $a2, $zero, .L8004A6A0
/* 4B26C 8004A66C 8E030078 */   lw        $v1, 0x78($s0)
/* 4B270 8004A670 8E220020 */  lw         $v0, 0x20($s1)
/* 4B274 8004A674 54C2000A */  bnel       $a2, $v0, .L8004A6A0
/* 4B278 8004A678 8E030078 */   lw        $v1, 0x78($s0)
/* 4B27C 8004A67C 8CC20078 */  lw         $v0, 0x78($a2)
/* 4B280 8004A680 24050003 */  addiu      $a1, $zero, 3
/* 4B284 8004A684 AE200020 */  sw         $zero, 0x20($s1)
/* 4B288 8004A688 84440008 */  lh         $a0, 8($v0)
/* 4B28C 8004A68C 8C43000C */  lw         $v1, 0xc($v0)
/* 4B290 8004A690 0060F809 */  jalr       $v1
/* 4B294 8004A694 00C42021 */   addu      $a0, $a2, $a0
/* 4B298 8004A698 AE200010 */  sw         $zero, 0x10($s1)
/* 4B29C 8004A69C 8E030078 */  lw         $v1, 0x78($s0)
.L8004A6A0:
/* 4B2A0 8004A6A0 8E050080 */  lw         $a1, 0x80($s0)
/* 4B2A4 8004A6A4 84640038 */  lh         $a0, 0x38($v1)
/* 4B2A8 8004A6A8 8C62003C */  lw         $v0, 0x3c($v1)
/* 4B2AC 8004A6AC 0040F809 */  jalr       $v0
/* 4B2B0 8004A6B0 02042021 */   addu      $a0, $s0, $a0
/* 4B2B4 8004A6B4 3C04800E */  lui        $a0, %hi(queueStructA)
/* 4B2B8 8004A6B8 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 4B2BC 8004A6BC 26050080 */  addiu      $a1, $s0, 0x80
/* 4B2C0 8004A6C0 24060006 */  addiu      $a2, $zero, 6
/* 4B2C4 8004A6C4 0C035867 */  jal        AllocFreeQueueItem
/* 4B2C8 8004A6C8 00003821 */   addu      $a3, $zero, $zero
/* 4B2CC 8004A6CC 92220024 */  lbu        $v0, 0x24($s1)
.L8004A6D0:
/* 4B2D0 8004A6D0 14400003 */  bnez       $v0, .L8004A6E0
/* 4B2D4 8004A6D4 00000000 */   nop
/* 4B2D8 8004A6D8 0C0129BF */  jal        func_8004A6FC
/* 4B2DC 8004A6DC 02002021 */   addu      $a0, $s0, $zero
.L8004A6E0:
/* 4B2E0 8004A6E0 0C02DE51 */  jal        func_800B7944
/* 4B2E4 8004A6E4 02002021 */   addu      $a0, $s0, $zero
/* 4B2E8 8004A6E8 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4B2EC 8004A6EC 8FB10014 */  lw         $s1, 0x14($sp)
/* 4B2F0 8004A6F0 8FB00010 */  lw         $s0, 0x10($sp)
/* 4B2F4 8004A6F4 03E00008 */  jr         $ra
/* 4B2F8 8004A6F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004A6FC
/* 4B2FC 8004A6FC 9082007D */  lbu        $v0, 0x7d($a0)
/* 4B300 8004A700 8C850040 */  lw         $a1, 0x40($a0)
/* 4B304 8004A704 24420001 */  addiu      $v0, $v0, 1
/* 4B308 8004A708 A082007D */  sb         $v0, 0x7d($a0)
/* 4B30C 8004A70C 304200FF */  andi       $v0, $v0, 0xff
/* 4B310 8004A710 2C420065 */  sltiu      $v0, $v0, 0x65
/* 4B314 8004A714 54400007 */  bnel       $v0, $zero, .L8004A734
/* 4B318 8004A718 8CA20014 */   lw        $v0, 0x14($a1)
/* 4B31C 8004A71C 90820088 */  lbu        $v0, 0x88($a0)
/* 4B320 8004A720 24030046 */  addiu      $v1, $zero, 0x46
/* 4B324 8004A724 A083007D */  sb         $v1, 0x7d($a0)
/* 4B328 8004A728 38420001 */  xori       $v0, $v0, 1
/* 4B32C 8004A72C A0820088 */  sb         $v0, 0x88($a0)
/* 4B330 8004A730 8CA20014 */  lw         $v0, 0x14($a1)
.L8004A734:
/* 4B334 8004A734 90840088 */  lbu        $a0, 0x88($a0)
/* 4B338 8004A738 9043005B */  lbu        $v1, 0x5b($v0)
/* 4B33C 8004A73C 00640018 */  mult       $v1, $a0
/* 4B340 8004A740 8CA20018 */  lw         $v0, 0x18($a1)
/* 4B344 8004A744 00001812 */  mflo       $v1
/* 4B348 8004A748 03E00008 */  jr         $ra
/* 4B34C 8004A74C A043005B */   sb        $v1, 0x5b($v0)

glabel func_8004A750
/* 4B350 8004A750 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 4B354 8004A754 AFB40028 */  sw         $s4, 0x28($sp)
/* 4B358 8004A758 0004A400 */  sll        $s4, $a0, 0x10
/* 4B35C 8004A75C 2404007C */  addiu      $a0, $zero, 0x7c
/* 4B360 8004A760 0014A403 */  sra        $s4, $s4, 0x10
/* 4B364 8004A764 AFB30024 */  sw         $s3, 0x24($sp)
/* 4B368 8004A768 00059C00 */  sll        $s3, $a1, 0x10
/* 4B36C 8004A76C 00139C03 */  sra        $s3, $s3, 0x10
/* 4B370 8004A770 AFB70034 */  sw         $s7, 0x34($sp)
/* 4B374 8004A774 0006BC00 */  sll        $s7, $a2, 0x10
/* 4B378 8004A778 0017BC03 */  sra        $s7, $s7, 0x10
/* 4B37C 8004A77C AFB60030 */  sw         $s6, 0x30($sp)
/* 4B380 8004A780 0007B400 */  sll        $s6, $a3, 0x10
/* 4B384 8004A784 0016B403 */  sra        $s6, $s6, 0x10
/* 4B388 8004A788 AFBF003C */  sw         $ra, 0x3c($sp)
/* 4B38C 8004A78C AFBE0038 */  sw         $fp, 0x38($sp)
/* 4B390 8004A790 AFB5002C */  sw         $s5, 0x2c($sp)
/* 4B394 8004A794 AFB20020 */  sw         $s2, 0x20($sp)
/* 4B398 8004A798 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4B39C 8004A79C 0C026259 */  jal        passToMalloc
/* 4B3A0 8004A7A0 AFB00018 */   sw        $s0, 0x18($sp)
/* 4B3A4 8004A7A4 240401C4 */  addiu      $a0, $zero, 0x1c4
/* 4B3A8 8004A7A8 0C0290E2 */  jal        get_borg_8
/* 4B3AC 8004A7AC 00408021 */   addu      $s0, $v0, $zero
/* 4B3B0 8004A7B0 02002021 */  addu       $a0, $s0, $zero
/* 4B3B4 8004A7B4 0C02E518 */  jal        borg8_widget
/* 4B3B8 8004A7B8 00402821 */   addu      $a1, $v0, $zero
/* 4B3BC 8004A7BC 00408821 */  addu       $s1, $v0, $zero
/* 4B3C0 8004A7C0 02202021 */  addu       $a0, $s1, $zero
/* 4B3C4 8004A7C4 02802821 */  addu       $a1, $s4, $zero
/* 4B3C8 8004A7C8 0C02DD3F */  jal        set_widget_coords
/* 4B3CC 8004A7CC 02603021 */   addu      $a2, $s3, $zero
/* 4B3D0 8004A7D0 02202021 */  addu       $a0, $s1, $zero
/* 4B3D4 8004A7D4 02F49023 */  subu       $s2, $s7, $s4
/* 4B3D8 8004A7D8 3252FFFF */  andi       $s2, $s2, 0xffff
/* 4B3DC 8004A7DC 0C02DD42 */  jal        set_widgetHeight
/* 4B3E0 8004A7E0 02402821 */   addu      $a1, $s2, $zero
/* 4B3E4 8004A7E4 02202021 */  addu       $a0, $s1, $zero
/* 4B3E8 8004A7E8 02D3A823 */  subu       $s5, $s6, $s3
/* 4B3EC 8004A7EC 32B5FFFF */  andi       $s5, $s5, 0xffff
/* 4B3F0 8004A7F0 0C02DD46 */  jal        set_widgetWidth
/* 4B3F4 8004A7F4 02A02821 */   addu      $a1, $s5, $zero
/* 4B3F8 8004A7F8 0C026259 */  jal        passToMalloc
/* 4B3FC 8004A7FC 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B400 8004A800 240401C3 */  addiu      $a0, $zero, 0x1c3
/* 4B404 8004A804 0C0290E2 */  jal        get_borg_8
/* 4B408 8004A808 00408021 */   addu      $s0, $v0, $zero
/* 4B40C 8004A80C 02002021 */  addu       $a0, $s0, $zero
/* 4B410 8004A810 0C02E518 */  jal        borg8_widget
/* 4B414 8004A814 00402821 */   addu      $a1, $v0, $zero
/* 4B418 8004A818 0040F021 */  addu       $fp, $v0, $zero
/* 4B41C 8004A81C 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B420 8004A820 84640020 */  lh         $a0, 0x20($v1)
/* 4B424 8004A824 8C620024 */  lw         $v0, 0x24($v1)
/* 4B428 8004A828 0040F809 */  jalr       $v0
/* 4B42C 8004A82C 03C42021 */   addu      $a0, $fp, $a0
/* 4B430 8004A830 03C02021 */  addu       $a0, $fp, $zero
/* 4B434 8004A834 02802821 */  addu       $a1, $s4, $zero
/* 4B438 8004A838 0C02DD3F */  jal        set_widget_coords
/* 4B43C 8004A83C 02623023 */   subu      $a2, $s3, $v0
/* 4B440 8004A840 03C02021 */  addu       $a0, $fp, $zero
/* 4B444 8004A844 0C02DD42 */  jal        set_widgetHeight
/* 4B448 8004A848 02402821 */   addu      $a1, $s2, $zero
/* 4B44C 8004A84C 8E230078 */  lw         $v1, 0x78($s1)
/* 4B450 8004A850 03C02821 */  addu       $a1, $fp, $zero
/* 4B454 8004A854 84640030 */  lh         $a0, 0x30($v1)
/* 4B458 8004A858 8C620034 */  lw         $v0, 0x34($v1)
/* 4B45C 8004A85C 0040F809 */  jalr       $v0
/* 4B460 8004A860 02242021 */   addu      $a0, $s1, $a0
/* 4B464 8004A864 0C026259 */  jal        passToMalloc
/* 4B468 8004A868 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B46C 8004A86C 240401C2 */  addiu      $a0, $zero, 0x1c2
/* 4B470 8004A870 0C0290E2 */  jal        get_borg_8
/* 4B474 8004A874 00408021 */   addu      $s0, $v0, $zero
/* 4B478 8004A878 02002021 */  addu       $a0, $s0, $zero
/* 4B47C 8004A87C 0C02E518 */  jal        borg8_widget
/* 4B480 8004A880 00402821 */   addu      $a1, $v0, $zero
/* 4B484 8004A884 0040F021 */  addu       $fp, $v0, $zero
/* 4B488 8004A888 03C02021 */  addu       $a0, $fp, $zero
/* 4B48C 8004A88C 02802821 */  addu       $a1, $s4, $zero
/* 4B490 8004A890 0C02DD3F */  jal        set_widget_coords
/* 4B494 8004A894 02C03021 */   addu      $a2, $s6, $zero
/* 4B498 8004A898 03C02021 */  addu       $a0, $fp, $zero
/* 4B49C 8004A89C 0C02DD42 */  jal        set_widgetHeight
/* 4B4A0 8004A8A0 02402821 */   addu      $a1, $s2, $zero
/* 4B4A4 8004A8A4 8E230078 */  lw         $v1, 0x78($s1)
/* 4B4A8 8004A8A8 03C02821 */  addu       $a1, $fp, $zero
/* 4B4AC 8004A8AC 84640030 */  lh         $a0, 0x30($v1)
/* 4B4B0 8004A8B0 8C620034 */  lw         $v0, 0x34($v1)
/* 4B4B4 8004A8B4 0040F809 */  jalr       $v0
/* 4B4B8 8004A8B8 02242021 */   addu      $a0, $s1, $a0
/* 4B4BC 8004A8BC 0C026259 */  jal        passToMalloc
/* 4B4C0 8004A8C0 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B4C4 8004A8C4 240401C0 */  addiu      $a0, $zero, 0x1c0
/* 4B4C8 8004A8C8 0C0290E2 */  jal        get_borg_8
/* 4B4CC 8004A8CC 00408021 */   addu      $s0, $v0, $zero
/* 4B4D0 8004A8D0 02002021 */  addu       $a0, $s0, $zero
/* 4B4D4 8004A8D4 0C02E518 */  jal        borg8_widget
/* 4B4D8 8004A8D8 00402821 */   addu      $a1, $v0, $zero
/* 4B4DC 8004A8DC 0040F021 */  addu       $fp, $v0, $zero
/* 4B4E0 8004A8E0 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B4E4 8004A8E4 84640018 */  lh         $a0, 0x18($v1)
/* 4B4E8 8004A8E8 8C62001C */  lw         $v0, 0x1c($v1)
/* 4B4EC 8004A8EC 0040F809 */  jalr       $v0
/* 4B4F0 8004A8F0 03C42021 */   addu      $a0, $fp, $a0
/* 4B4F4 8004A8F4 03C02021 */  addu       $a0, $fp, $zero
/* 4B4F8 8004A8F8 02822823 */  subu       $a1, $s4, $v0
/* 4B4FC 8004A8FC 0C02DD3F */  jal        set_widget_coords
/* 4B500 8004A900 02603021 */   addu      $a2, $s3, $zero
/* 4B504 8004A904 03C02021 */  addu       $a0, $fp, $zero
/* 4B508 8004A908 0C02DD46 */  jal        set_widgetWidth
/* 4B50C 8004A90C 02A02821 */   addu      $a1, $s5, $zero
/* 4B510 8004A910 8E230078 */  lw         $v1, 0x78($s1)
/* 4B514 8004A914 03C02821 */  addu       $a1, $fp, $zero
/* 4B518 8004A918 84640030 */  lh         $a0, 0x30($v1)
/* 4B51C 8004A91C 8C620034 */  lw         $v0, 0x34($v1)
/* 4B520 8004A920 0040F809 */  jalr       $v0
/* 4B524 8004A924 02242021 */   addu      $a0, $s1, $a0
/* 4B528 8004A928 0C026259 */  jal        passToMalloc
/* 4B52C 8004A92C 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B530 8004A930 240401C1 */  addiu      $a0, $zero, 0x1c1
/* 4B534 8004A934 0C0290E2 */  jal        get_borg_8
/* 4B538 8004A938 00408021 */   addu      $s0, $v0, $zero
/* 4B53C 8004A93C 02002021 */  addu       $a0, $s0, $zero
/* 4B540 8004A940 0C02E518 */  jal        borg8_widget
/* 4B544 8004A944 00402821 */   addu      $a1, $v0, $zero
/* 4B548 8004A948 0040F021 */  addu       $fp, $v0, $zero
/* 4B54C 8004A94C 03C02021 */  addu       $a0, $fp, $zero
/* 4B550 8004A950 02E02821 */  addu       $a1, $s7, $zero
/* 4B554 8004A954 0C02DD3F */  jal        set_widget_coords
/* 4B558 8004A958 02603021 */   addu      $a2, $s3, $zero
/* 4B55C 8004A95C 03C02021 */  addu       $a0, $fp, $zero
/* 4B560 8004A960 0C02DD46 */  jal        set_widgetWidth
/* 4B564 8004A964 02A02821 */   addu      $a1, $s5, $zero
/* 4B568 8004A968 8E230078 */  lw         $v1, 0x78($s1)
/* 4B56C 8004A96C 03C02821 */  addu       $a1, $fp, $zero
/* 4B570 8004A970 84640030 */  lh         $a0, 0x30($v1)
/* 4B574 8004A974 8C620034 */  lw         $v0, 0x34($v1)
/* 4B578 8004A978 0040F809 */  jalr       $v0
/* 4B57C 8004A97C 02242021 */   addu      $a0, $s1, $a0
/* 4B580 8004A980 0C026259 */  jal        passToMalloc
/* 4B584 8004A984 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B588 8004A988 240401BC */  addiu      $a0, $zero, 0x1bc
/* 4B58C 8004A98C 0C0290E2 */  jal        get_borg_8
/* 4B590 8004A990 00408021 */   addu      $s0, $v0, $zero
/* 4B594 8004A994 02002021 */  addu       $a0, $s0, $zero
/* 4B598 8004A998 0C02E518 */  jal        borg8_widget
/* 4B59C 8004A99C 00402821 */   addu      $a1, $v0, $zero
/* 4B5A0 8004A9A0 0040F021 */  addu       $fp, $v0, $zero
/* 4B5A4 8004A9A4 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B5A8 8004A9A8 84640018 */  lh         $a0, 0x18($v1)
/* 4B5AC 8004A9AC 8C62001C */  lw         $v0, 0x1c($v1)
/* 4B5B0 8004A9B0 0040F809 */  jalr       $v0
/* 4B5B4 8004A9B4 03C42021 */   addu      $a0, $fp, $a0
/* 4B5B8 8004A9B8 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B5BC 8004A9BC 02828023 */  subu       $s0, $s4, $v0
/* 4B5C0 8004A9C0 84640020 */  lh         $a0, 0x20($v1)
/* 4B5C4 8004A9C4 8C650024 */  lw         $a1, 0x24($v1)
/* 4B5C8 8004A9C8 00A0F809 */  jalr       $a1
/* 4B5CC 8004A9CC 03C42021 */   addu      $a0, $fp, $a0
/* 4B5D0 8004A9D0 03C02021 */  addu       $a0, $fp, $zero
/* 4B5D4 8004A9D4 02002821 */  addu       $a1, $s0, $zero
/* 4B5D8 8004A9D8 0C02DD3F */  jal        set_widget_coords
/* 4B5DC 8004A9DC 02623023 */   subu      $a2, $s3, $v0
/* 4B5E0 8004A9E0 8E230078 */  lw         $v1, 0x78($s1)
/* 4B5E4 8004A9E4 03C02821 */  addu       $a1, $fp, $zero
/* 4B5E8 8004A9E8 84640030 */  lh         $a0, 0x30($v1)
/* 4B5EC 8004A9EC 8C620034 */  lw         $v0, 0x34($v1)
/* 4B5F0 8004A9F0 0040F809 */  jalr       $v0
/* 4B5F4 8004A9F4 02242021 */   addu      $a0, $s1, $a0
/* 4B5F8 8004A9F8 0C026259 */  jal        passToMalloc
/* 4B5FC 8004A9FC 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B600 8004AA00 240401BD */  addiu      $a0, $zero, 0x1bd
/* 4B604 8004AA04 0C0290E2 */  jal        get_borg_8
/* 4B608 8004AA08 00408021 */   addu      $s0, $v0, $zero
/* 4B60C 8004AA0C 02002021 */  addu       $a0, $s0, $zero
/* 4B610 8004AA10 0C02E518 */  jal        borg8_widget
/* 4B614 8004AA14 00402821 */   addu      $a1, $v0, $zero
/* 4B618 8004AA18 0040F021 */  addu       $fp, $v0, $zero
/* 4B61C 8004AA1C 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B620 8004AA20 84640020 */  lh         $a0, 0x20($v1)
/* 4B624 8004AA24 8C620024 */  lw         $v0, 0x24($v1)
/* 4B628 8004AA28 0040F809 */  jalr       $v0
/* 4B62C 8004AA2C 03C42021 */   addu      $a0, $fp, $a0
/* 4B630 8004AA30 03C02021 */  addu       $a0, $fp, $zero
/* 4B634 8004AA34 02E02821 */  addu       $a1, $s7, $zero
/* 4B638 8004AA38 0C02DD3F */  jal        set_widget_coords
/* 4B63C 8004AA3C 02623023 */   subu      $a2, $s3, $v0
/* 4B640 8004AA40 8E230078 */  lw         $v1, 0x78($s1)
/* 4B644 8004AA44 03C02821 */  addu       $a1, $fp, $zero
/* 4B648 8004AA48 84640030 */  lh         $a0, 0x30($v1)
/* 4B64C 8004AA4C 8C620034 */  lw         $v0, 0x34($v1)
/* 4B650 8004AA50 0040F809 */  jalr       $v0
/* 4B654 8004AA54 02242021 */   addu      $a0, $s1, $a0
/* 4B658 8004AA58 0C026259 */  jal        passToMalloc
/* 4B65C 8004AA5C 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B660 8004AA60 240401BF */  addiu      $a0, $zero, 0x1bf
/* 4B664 8004AA64 0C0290E2 */  jal        get_borg_8
/* 4B668 8004AA68 00408021 */   addu      $s0, $v0, $zero
/* 4B66C 8004AA6C 02002021 */  addu       $a0, $s0, $zero
/* 4B670 8004AA70 0C02E518 */  jal        borg8_widget
/* 4B674 8004AA74 00402821 */   addu      $a1, $v0, $zero
/* 4B678 8004AA78 0040F021 */  addu       $fp, $v0, $zero
/* 4B67C 8004AA7C 8FC30078 */  lw         $v1, 0x78($fp)
/* 4B680 8004AA80 84640018 */  lh         $a0, 0x18($v1)
/* 4B684 8004AA84 8C62001C */  lw         $v0, 0x1c($v1)
/* 4B688 8004AA88 0040F809 */  jalr       $v0
/* 4B68C 8004AA8C 03C42021 */   addu      $a0, $fp, $a0
/* 4B690 8004AA90 03C02021 */  addu       $a0, $fp, $zero
/* 4B694 8004AA94 02822823 */  subu       $a1, $s4, $v0
/* 4B698 8004AA98 0C02DD3F */  jal        set_widget_coords
/* 4B69C 8004AA9C 02C03021 */   addu      $a2, $s6, $zero
/* 4B6A0 8004AAA0 8E230078 */  lw         $v1, 0x78($s1)
/* 4B6A4 8004AAA4 03C02821 */  addu       $a1, $fp, $zero
/* 4B6A8 8004AAA8 84640030 */  lh         $a0, 0x30($v1)
/* 4B6AC 8004AAAC 8C620034 */  lw         $v0, 0x34($v1)
/* 4B6B0 8004AAB0 0040F809 */  jalr       $v0
/* 4B6B4 8004AAB4 02242021 */   addu      $a0, $s1, $a0
/* 4B6B8 8004AAB8 0C026259 */  jal        passToMalloc
/* 4B6BC 8004AABC 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B6C0 8004AAC0 240401BE */  addiu      $a0, $zero, 0x1be
/* 4B6C4 8004AAC4 0C0290E2 */  jal        get_borg_8
/* 4B6C8 8004AAC8 00408021 */   addu      $s0, $v0, $zero
/* 4B6CC 8004AACC 02002021 */  addu       $a0, $s0, $zero
/* 4B6D0 8004AAD0 0C02E518 */  jal        borg8_widget
/* 4B6D4 8004AAD4 00402821 */   addu      $a1, $v0, $zero
/* 4B6D8 8004AAD8 0040F021 */  addu       $fp, $v0, $zero
/* 4B6DC 8004AADC 03C02021 */  addu       $a0, $fp, $zero
/* 4B6E0 8004AAE0 02E02821 */  addu       $a1, $s7, $zero
/* 4B6E4 8004AAE4 0C02DD3F */  jal        set_widget_coords
/* 4B6E8 8004AAE8 02C03021 */   addu      $a2, $s6, $zero
/* 4B6EC 8004AAEC 8E230078 */  lw         $v1, 0x78($s1)
/* 4B6F0 8004AAF0 03C02821 */  addu       $a1, $fp, $zero
/* 4B6F4 8004AAF4 84640030 */  lh         $a0, 0x30($v1)
/* 4B6F8 8004AAF8 8C620034 */  lw         $v0, 0x34($v1)
/* 4B6FC 8004AAFC 0040F809 */  jalr       $v0
/* 4B700 8004AB00 02242021 */   addu      $a0, $s1, $a0
/* 4B704 8004AB04 02202021 */  addu       $a0, $s1, $zero
/* 4B708 8004AB08 00002821 */  addu       $a1, $zero, $zero
/* 4B70C 8004AB0C 00003021 */  addu       $a2, $zero, $zero
/* 4B710 8004AB10 240200FF */  addiu      $v0, $zero, 0xff
/* 4B714 8004AB14 00003821 */  addu       $a3, $zero, $zero
/* 4B718 8004AB18 0C02F1B7 */  jal        Widget_set_color
/* 4B71C 8004AB1C AFA20010 */   sw        $v0, 0x10($sp)
/* 4B720 8004AB20 02201021 */  addu       $v0, $s1, $zero
/* 4B724 8004AB24 8FBF003C */  lw         $ra, 0x3c($sp)
/* 4B728 8004AB28 8FBE0038 */  lw         $fp, 0x38($sp)
/* 4B72C 8004AB2C 8FB70034 */  lw         $s7, 0x34($sp)
/* 4B730 8004AB30 8FB60030 */  lw         $s6, 0x30($sp)
/* 4B734 8004AB34 8FB5002C */  lw         $s5, 0x2c($sp)
/* 4B738 8004AB38 8FB40028 */  lw         $s4, 0x28($sp)
/* 4B73C 8004AB3C 8FB30024 */  lw         $s3, 0x24($sp)
/* 4B740 8004AB40 8FB20020 */  lw         $s2, 0x20($sp)
/* 4B744 8004AB44 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4B748 8004AB48 8FB00018 */  lw         $s0, 0x18($sp)
/* 4B74C 8004AB4C 03E00008 */  jr         $ra
/* 4B750 8004AB50 27BD0040 */   addiu     $sp, $sp, 0x40

glabel build_title_screen
/* 4B754 8004AB54 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4B758 8004AB58 AFB40020 */  sw         $s4, 0x20($sp)
/* 4B75C 8004AB5C 0080A021 */  addu       $s4, $a0, $zero
/* 4B760 8004AB60 AFBF0024 */  sw         $ra, 0x24($sp)
/* 4B764 8004AB64 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4B768 8004AB68 AFB20018 */  sw         $s2, 0x18($sp)
/* 4B76C 8004AB6C AFB10014 */  sw         $s1, 0x14($sp)
/* 4B770 8004AB70 AFB00010 */  sw         $s0, 0x10($sp)
/* 4B774 8004AB74 8E930040 */  lw         $s3, 0x40($s4)
/* 4B778 8004AB78 8E65001C */  lw         $a1, 0x1c($s3)
/* 4B77C 8004AB7C 10A00007 */  beqz       $a1, .L8004AB9C
/* 4B780 8004AB80 AE650020 */   sw        $a1, 0x20($s3)
/* 4B784 8004AB84 8E830078 */  lw         $v1, 0x78($s4)
/* 4B788 8004AB88 84640038 */  lh         $a0, 0x38($v1)
/* 4B78C 8004AB8C 8C62003C */  lw         $v0, 0x3c($v1)
/* 4B790 8004AB90 0040F809 */  jalr       $v0
/* 4B794 8004AB94 02842021 */   addu      $a0, $s4, $a0
/* 4B798 8004AB98 AE60001C */  sw         $zero, 0x1c($s3)
.L8004AB9C:
/* 4B79C 8004AB9C 8E620014 */  lw         $v0, 0x14($s3)
/* 4B7A0 8004ABA0 5440004A */  bnel       $v0, $zero, .L8004ACCC
/* 4B7A4 8004ABA4 8E620018 */   lw        $v0, 0x18($s3)
/* 4B7A8 8004ABA8 0C026259 */  jal        passToMalloc
/* 4B7AC 8004ABAC 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B7B0 8004ABB0 24040104 */  addiu      $a0, $zero, 0x104
/* 4B7B4 8004ABB4 0C0290E2 */  jal        get_borg_8
/* 4B7B8 8004ABB8 00408021 */   addu      $s0, $v0, $zero
/* 4B7BC 8004ABBC 02002021 */  addu       $a0, $s0, $zero
/* 4B7C0 8004ABC0 0C02E518 */  jal        borg8_widget
/* 4B7C4 8004ABC4 00402821 */   addu      $a1, $v0, $zero
/* 4B7C8 8004ABC8 8C430078 */  lw         $v1, 0x78($v0)
/* 4B7CC 8004ABCC AE620014 */  sw         $v0, 0x14($s3)
/* 4B7D0 8004ABD0 84640018 */  lh         $a0, 0x18($v1)
/* 4B7D4 8004ABD4 8C65001C */  lw         $a1, 0x1c($v1)
/* 4B7D8 8004ABD8 00A0F809 */  jalr       $a1
/* 4B7DC 8004ABDC 00442021 */   addu      $a0, $v0, $a0
/* 4B7E0 8004ABE0 8E630014 */  lw         $v1, 0x14($s3)
/* 4B7E4 8004ABE4 00021042 */  srl        $v0, $v0, 1
/* 4B7E8 8004ABE8 8C650078 */  lw         $a1, 0x78($v1)
/* 4B7EC 8004ABEC 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4B7F0 8004ABF0 84A40020 */  lh         $a0, 0x20($a1)
/* 4B7F4 8004ABF4 24100092 */  addiu      $s0, $zero, 0x92
/* 4B7F8 8004ABF8 00642021 */  addu       $a0, $v1, $a0
/* 4B7FC 8004ABFC 8CA30024 */  lw         $v1, 0x24($a1)
/* 4B800 8004AC00 0060F809 */  jalr       $v1
/* 4B804 8004AC04 02028023 */   subu      $s0, $s0, $v0
/* 4B808 8004AC08 02002821 */  addu       $a1, $s0, $zero
/* 4B80C 8004AC0C 00021042 */  srl        $v0, $v0, 1
/* 4B810 8004AC10 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4B814 8004AC14 2412006E */  addiu      $s2, $zero, 0x6e
/* 4B818 8004AC18 8E640014 */  lw         $a0, 0x14($s3)
/* 4B81C 8004AC1C 0C02DD3F */  jal        set_widget_coords
/* 4B820 8004AC20 02423023 */   subu      $a2, $s2, $v0
/* 4B824 8004AC24 8E620014 */  lw         $v0, 0x14($s3)
/* 4B828 8004AC28 2404007C */  addiu      $a0, $zero, 0x7c
/* 4B82C 8004AC2C 0C026259 */  jal        passToMalloc
/* 4B830 8004AC30 A040005B */   sb        $zero, 0x5b($v0)
/* 4B834 8004AC34 24040103 */  addiu      $a0, $zero, 0x103
/* 4B838 8004AC38 0C0290E2 */  jal        get_borg_8
/* 4B83C 8004AC3C 00408021 */   addu      $s0, $v0, $zero
/* 4B840 8004AC40 02002021 */  addu       $a0, $s0, $zero
/* 4B844 8004AC44 0C02E518 */  jal        borg8_widget
/* 4B848 8004AC48 00402821 */   addu      $a1, $v0, $zero
/* 4B84C 8004AC4C 8E630014 */  lw         $v1, 0x14($s3)
/* 4B850 8004AC50 8C650078 */  lw         $a1, 0x78($v1)
/* 4B854 8004AC54 00408821 */  addu       $s1, $v0, $zero
/* 4B858 8004AC58 84A40018 */  lh         $a0, 0x18($a1)
/* 4B85C 8004AC5C 8CA6001C */  lw         $a2, 0x1c($a1)
/* 4B860 8004AC60 00C0F809 */  jalr       $a2
/* 4B864 8004AC64 00642021 */   addu      $a0, $v1, $a0
/* 4B868 8004AC68 8E630014 */  lw         $v1, 0x14($s3)
/* 4B86C 8004AC6C 00021042 */  srl        $v0, $v0, 1
/* 4B870 8004AC70 8C650078 */  lw         $a1, 0x78($v1)
/* 4B874 8004AC74 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4B878 8004AC78 84A40020 */  lh         $a0, 0x20($a1)
/* 4B87C 8004AC7C 241000A0 */  addiu      $s0, $zero, 0xa0
/* 4B880 8004AC80 00642021 */  addu       $a0, $v1, $a0
/* 4B884 8004AC84 8CA30024 */  lw         $v1, 0x24($a1)
/* 4B888 8004AC88 0060F809 */  jalr       $v1
/* 4B88C 8004AC8C 02028023 */   subu      $s0, $s0, $v0
/* 4B890 8004AC90 02202021 */  addu       $a0, $s1, $zero
/* 4B894 8004AC94 02002821 */  addu       $a1, $s0, $zero
/* 4B898 8004AC98 00021042 */  srl        $v0, $v0, 1
/* 4B89C 8004AC9C 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4B8A0 8004ACA0 0C02DD3F */  jal        set_widget_coords
/* 4B8A4 8004ACA4 02423023 */   subu      $a2, $s2, $v0
/* 4B8A8 8004ACA8 A220005B */  sb         $zero, 0x5b($s1)
/* 4B8AC 8004ACAC 8E660014 */  lw         $a2, 0x14($s3)
/* 4B8B0 8004ACB0 8CC30078 */  lw         $v1, 0x78($a2)
/* 4B8B4 8004ACB4 02202821 */  addu       $a1, $s1, $zero
/* 4B8B8 8004ACB8 84640030 */  lh         $a0, 0x30($v1)
/* 4B8BC 8004ACBC 8C620034 */  lw         $v0, 0x34($v1)
/* 4B8C0 8004ACC0 0040F809 */  jalr       $v0
/* 4B8C4 8004ACC4 00C42021 */   addu      $a0, $a2, $a0
/* 4B8C8 8004ACC8 8E620018 */  lw         $v0, 0x18($s3)
.L8004ACCC:
/* 4B8CC 8004ACCC 5440002A */  bnel       $v0, $zero, .L8004AD78
/* 4B8D0 8004ACD0 8E620014 */   lw        $v0, 0x14($s3)
/* 4B8D4 8004ACD4 0C026259 */  jal        passToMalloc
/* 4B8D8 8004ACD8 2404007C */   addiu     $a0, $zero, 0x7c
/* 4B8DC 8004ACDC 24040102 */  addiu      $a0, $zero, 0x102
/* 4B8E0 8004ACE0 0C0290E2 */  jal        get_borg_8
/* 4B8E4 8004ACE4 00408021 */   addu      $s0, $v0, $zero
/* 4B8E8 8004ACE8 02002021 */  addu       $a0, $s0, $zero
/* 4B8EC 8004ACEC 0C02E518 */  jal        borg8_widget
/* 4B8F0 8004ACF0 00402821 */   addu      $a1, $v0, $zero
/* 4B8F4 8004ACF4 8C430078 */  lw         $v1, 0x78($v0)
/* 4B8F8 8004ACF8 AE620018 */  sw         $v0, 0x18($s3)
/* 4B8FC 8004ACFC 84640018 */  lh         $a0, 0x18($v1)
/* 4B900 8004AD00 8C65001C */  lw         $a1, 0x1c($v1)
/* 4B904 8004AD04 00A0F809 */  jalr       $a1
/* 4B908 8004AD08 00442021 */   addu      $a0, $v0, $a0
/* 4B90C 8004AD0C 8E630014 */  lw         $v1, 0x14($s3)
/* 4B910 8004AD10 00021042 */  srl        $v0, $v0, 1
/* 4B914 8004AD14 8C650078 */  lw         $a1, 0x78($v1)
/* 4B918 8004AD18 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4B91C 8004AD1C 84A40020 */  lh         $a0, 0x20($a1)
/* 4B920 8004AD20 241000A0 */  addiu      $s0, $zero, 0xa0
/* 4B924 8004AD24 00642021 */  addu       $a0, $v1, $a0
/* 4B928 8004AD28 8CA30024 */  lw         $v1, 0x24($a1)
/* 4B92C 8004AD2C 0060F809 */  jalr       $v1
/* 4B930 8004AD30 02028023 */   subu      $s0, $s0, $v0
/* 4B934 8004AD34 8E640014 */  lw         $a0, 0x14($s3)
/* 4B938 8004AD38 02002821 */  addu       $a1, $s0, $zero
/* 4B93C 8004AD3C 84860062 */  lh         $a2, 0x62($a0)
/* 4B940 8004AD40 8E640018 */  lw         $a0, 0x18($s3)
/* 4B944 8004AD44 00C23021 */  addu       $a2, $a2, $v0
/* 4B948 8004AD48 0C02DD3F */  jal        set_widget_coords
/* 4B94C 8004AD4C 24C60005 */   addiu     $a2, $a2, 5
/* 4B950 8004AD50 8E620018 */  lw         $v0, 0x18($s3)
/* 4B954 8004AD54 A040005B */  sb         $zero, 0x5b($v0)
/* 4B958 8004AD58 8E660014 */  lw         $a2, 0x14($s3)
/* 4B95C 8004AD5C 8CC30078 */  lw         $v1, 0x78($a2)
/* 4B960 8004AD60 8E650018 */  lw         $a1, 0x18($s3)
/* 4B964 8004AD64 84640030 */  lh         $a0, 0x30($v1)
/* 4B968 8004AD68 8C620034 */  lw         $v0, 0x34($v1)
/* 4B96C 8004AD6C 0040F809 */  jalr       $v0
/* 4B970 8004AD70 00C42021 */   addu      $a0, $a2, $a0
/* 4B974 8004AD74 8E620014 */  lw         $v0, 0x14($s3)
.L8004AD78:
/* 4B978 8004AD78 A2600024 */  sb         $zero, 0x24($s3)
/* 4B97C 8004AD7C 8E830078 */  lw         $v1, 0x78($s4)
/* 4B980 8004AD80 00402821 */  addu       $a1, $v0, $zero
/* 4B984 8004AD84 AE62001C */  sw         $v0, 0x1c($s3)
/* 4B988 8004AD88 84640030 */  lh         $a0, 0x30($v1)
/* 4B98C 8004AD8C 8C620034 */  lw         $v0, 0x34($v1)
/* 4B990 8004AD90 0040F809 */  jalr       $v0
/* 4B994 8004AD94 02842021 */   addu      $a0, $s4, $a0
/* 4B998 8004AD98 A280007E */  sb         $zero, 0x7e($s4)
/* 4B99C 8004AD9C 8E64001C */  lw         $a0, 0x1c($s3)
/* 4B9A0 8004ADA0 0C02F216 */  jal        widget_fade
/* 4B9A4 8004ADA4 00002821 */   addu      $a1, $zero, $zero
/* 4B9A8 8004ADA8 A280007F */  sb         $zero, 0x7f($s4)
/* 4B9AC 8004ADAC 8E640020 */  lw         $a0, 0x20($s3)
/* 4B9B0 8004ADB0 50800004 */  beql       $a0, $zero, .L8004ADC4
/* 4B9B4 8004ADB4 8E850080 */   lw        $a1, 0x80($s4)
/* 4B9B8 8004ADB8 0C02F216 */  jal        widget_fade
/* 4B9BC 8004ADBC 00002821 */   addu      $a1, $zero, $zero
/* 4B9C0 8004ADC0 8E850080 */  lw         $a1, 0x80($s4)
.L8004ADC4:
/* 4B9C4 8004ADC4 50A0000D */  beql       $a1, $zero, .L8004ADFC
/* 4B9C8 8004ADC8 8E820084 */   lw        $v0, 0x84($s4)
/* 4B9CC 8004ADCC 8E830078 */  lw         $v1, 0x78($s4)
/* 4B9D0 8004ADD0 84640038 */  lh         $a0, 0x38($v1)
/* 4B9D4 8004ADD4 8C62003C */  lw         $v0, 0x3c($v1)
/* 4B9D8 8004ADD8 0040F809 */  jalr       $v0
/* 4B9DC 8004ADDC 02842021 */   addu      $a0, $s4, $a0
/* 4B9E0 8004ADE0 3C04800E */  lui        $a0, %hi(queueStructA)
/* 4B9E4 8004ADE4 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 4B9E8 8004ADE8 26850080 */  addiu      $a1, $s4, 0x80
/* 4B9EC 8004ADEC 24060006 */  addiu      $a2, $zero, 6
/* 4B9F0 8004ADF0 0C035867 */  jal        AllocFreeQueueItem
/* 4B9F4 8004ADF4 00003821 */   addu      $a3, $zero, $zero
/* 4B9F8 8004ADF8 8E820084 */  lw         $v0, 0x84($s4)
.L8004ADFC:
/* 4B9FC 8004ADFC 8E830078 */  lw         $v1, 0x78($s4)
/* 4BA00 8004AE00 00402821 */  addu       $a1, $v0, $zero
/* 4BA04 8004AE04 AE820080 */  sw         $v0, 0x80($s4)
/* 4BA08 8004AE08 84640038 */  lh         $a0, 0x38($v1)
/* 4BA0C 8004AE0C 8C62003C */  lw         $v0, 0x3c($v1)
/* 4BA10 8004AE10 0040F809 */  jalr       $v0
/* 4BA14 8004AE14 02842021 */   addu      $a0, $s4, $a0
/* 4BA18 8004AE18 8FBF0024 */  lw         $ra, 0x24($sp)
/* 4BA1C 8004AE1C 8FB40020 */  lw         $s4, 0x20($sp)
/* 4BA20 8004AE20 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4BA24 8004AE24 8FB20018 */  lw         $s2, 0x18($sp)
/* 4BA28 8004AE28 8FB10014 */  lw         $s1, 0x14($sp)
/* 4BA2C 8004AE2C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4BA30 8004AE30 03E00008 */  jr         $ra
/* 4BA34 8004AE34 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004AE38
/* 4BA38 8004AE38 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4BA3C 8004AE3C AFB1001C */  sw         $s1, 0x1c($sp)
/* 4BA40 8004AE40 00808821 */  addu       $s1, $a0, $zero
/* 4BA44 8004AE44 AFBF0020 */  sw         $ra, 0x20($sp)
/* 4BA48 8004AE48 AFB00018 */  sw         $s0, 0x18($sp)
/* 4BA4C 8004AE4C 8E300040 */  lw         $s0, 0x40($s1)
/* 4BA50 8004AE50 8E05001C */  lw         $a1, 0x1c($s0)
/* 4BA54 8004AE54 10A00007 */  beqz       $a1, .L8004AE74
/* 4BA58 8004AE58 AE050020 */   sw        $a1, 0x20($s0)
/* 4BA5C 8004AE5C 8E230078 */  lw         $v1, 0x78($s1)
/* 4BA60 8004AE60 84640038 */  lh         $a0, 0x38($v1)
/* 4BA64 8004AE64 8C62003C */  lw         $v0, 0x3c($v1)
/* 4BA68 8004AE68 0040F809 */  jalr       $v0
/* 4BA6C 8004AE6C 02242021 */   addu      $a0, $s1, $a0
/* 4BA70 8004AE70 AE00001C */  sw         $zero, 0x1c($s0)
.L8004AE74:
/* 4BA74 8004AE74 8E020000 */  lw         $v0, ($s0)
/* 4BA78 8004AE78 5440000F */  bnel       $v0, $zero, .L8004AEB8
/* 4BA7C 8004AE7C 8E030000 */   lw        $v1, ($s0)
/* 4BA80 8004AE80 0C012CE2 */  jal        make_start_menu
/* 4BA84 8004AE84 02202021 */   addu      $a0, $s1, $zero
/* 4BA88 8004AE88 240500E1 */  addiu      $a1, $zero, 0xe1
/* 4BA8C 8004AE8C 240600E1 */  addiu      $a2, $zero, 0xe1
/* 4BA90 8004AE90 8C490078 */  lw         $t1, 0x78($v0)
/* 4BA94 8004AE94 240700E1 */  addiu      $a3, $zero, 0xe1
/* 4BA98 8004AE98 AE020000 */  sw         $v0, ($s0)
/* 4BA9C 8004AE9C 85240048 */  lh         $a0, 0x48($t1)
/* 4BAA0 8004AEA0 240300FF */  addiu      $v1, $zero, 0xff
/* 4BAA4 8004AEA4 AFA30010 */  sw         $v1, 0x10($sp)
/* 4BAA8 8004AEA8 8D28004C */  lw         $t0, 0x4c($t1)
/* 4BAAC 8004AEAC 0100F809 */  jalr       $t0
/* 4BAB0 8004AEB0 00442021 */   addu      $a0, $v0, $a0
/* 4BAB4 8004AEB4 8E030000 */  lw         $v1, ($s0)
.L8004AEB8:
/* 4BAB8 8004AEB8 8E220084 */  lw         $v0, 0x84($s1)
/* 4BABC 8004AEBC 94660060 */  lhu        $a2, 0x60($v1)
/* 4BAC0 8004AEC0 94670062 */  lhu        $a3, 0x62($v1)
/* 4BAC4 8004AEC4 AE220080 */  sw         $v0, 0x80($s1)
/* 4BAC8 8004AEC8 24C4FFBE */  addiu      $a0, $a2, -0x42
/* 4BACC 8004AECC 00042400 */  sll        $a0, $a0, 0x10
/* 4BAD0 8004AED0 00042403 */  sra        $a0, $a0, 0x10
/* 4BAD4 8004AED4 24E5FFD0 */  addiu      $a1, $a3, -0x30
/* 4BAD8 8004AED8 00052C00 */  sll        $a1, $a1, 0x10
/* 4BADC 8004AEDC 00052C03 */  sra        $a1, $a1, 0x10
/* 4BAE0 8004AEE0 24C60042 */  addiu      $a2, $a2, 0x42
/* 4BAE4 8004AEE4 00063400 */  sll        $a2, $a2, 0x10
/* 4BAE8 8004AEE8 00063403 */  sra        $a2, $a2, 0x10
/* 4BAEC 8004AEEC 24E70076 */  addiu      $a3, $a3, 0x76
/* 4BAF0 8004AEF0 00073C00 */  sll        $a3, $a3, 0x10
/* 4BAF4 8004AEF4 0C0129D4 */  jal        func_8004A750
/* 4BAF8 8004AEF8 00073C03 */   sra       $a3, $a3, 0x10
/* 4BAFC 8004AEFC 8E030000 */  lw         $v1, ($s0)
/* 4BB00 8004AF00 AE220084 */  sw         $v0, 0x84($s1)
/* 4BB04 8004AF04 24020001 */  addiu      $v0, $zero, 1
/* 4BB08 8004AF08 A2020024 */  sb         $v0, 0x24($s0)
/* 4BB0C 8004AF0C 8E260078 */  lw         $a2, 0x78($s1)
/* 4BB10 8004AF10 00602821 */  addu       $a1, $v1, $zero
/* 4BB14 8004AF14 AE03001C */  sw         $v1, 0x1c($s0)
/* 4BB18 8004AF18 84C40030 */  lh         $a0, 0x30($a2)
/* 4BB1C 8004AF1C 8CC20034 */  lw         $v0, 0x34($a2)
/* 4BB20 8004AF20 0040F809 */  jalr       $v0
/* 4BB24 8004AF24 02242021 */   addu      $a0, $s1, $a0
/* 4BB28 8004AF28 A220007E */  sb         $zero, 0x7e($s1)
/* 4BB2C 8004AF2C 8E04001C */  lw         $a0, 0x1c($s0)
/* 4BB30 8004AF30 0C02F216 */  jal        widget_fade
/* 4BB34 8004AF34 00002821 */   addu      $a1, $zero, $zero
/* 4BB38 8004AF38 240200FF */  addiu      $v0, $zero, 0xff
/* 4BB3C 8004AF3C A222007F */  sb         $v0, 0x7f($s1)
/* 4BB40 8004AF40 8E040020 */  lw         $a0, 0x20($s0)
/* 4BB44 8004AF44 10800004 */  beqz       $a0, .L8004AF58
/* 4BB48 8004AF48 8FBF0020 */   lw        $ra, 0x20($sp)
/* 4BB4C 8004AF4C 0C02F216 */  jal        widget_fade
/* 4BB50 8004AF50 240500FF */   addiu     $a1, $zero, 0xff
/* 4BB54 8004AF54 8FBF0020 */  lw         $ra, 0x20($sp)
.L8004AF58:
/* 4BB58 8004AF58 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4BB5C 8004AF5C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4BB60 8004AF60 03E00008 */  jr         $ra
/* 4BB64 8004AF64 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004AF68
/* 4BB68 8004AF68 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4BB6C 8004AF6C AFB10014 */  sw         $s1, 0x14($sp)
/* 4BB70 8004AF70 00808821 */  addu       $s1, $a0, $zero
/* 4BB74 8004AF74 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4BB78 8004AF78 AFB00010 */  sw         $s0, 0x10($sp)
/* 4BB7C 8004AF7C 8E300040 */  lw         $s0, 0x40($s1)
/* 4BB80 8004AF80 8E05001C */  lw         $a1, 0x1c($s0)
/* 4BB84 8004AF84 10A00007 */  beqz       $a1, .L8004AFA4
/* 4BB88 8004AF88 AE050020 */   sw        $a1, 0x20($s0)
/* 4BB8C 8004AF8C 8E230078 */  lw         $v1, 0x78($s1)
/* 4BB90 8004AF90 84640038 */  lh         $a0, 0x38($v1)
/* 4BB94 8004AF94 8C62003C */  lw         $v0, 0x3c($v1)
/* 4BB98 8004AF98 0040F809 */  jalr       $v0
/* 4BB9C 8004AF9C 02242021 */   addu      $a0, $s1, $a0
/* 4BBA0 8004AFA0 AE00001C */  sw         $zero, 0x1c($s0)
.L8004AFA4:
/* 4BBA4 8004AFA4 8E02000C */  lw         $v0, 0xc($s0)
/* 4BBA8 8004AFA8 5440000C */  bnel       $v0, $zero, .L8004AFDC
/* 4BBAC 8004AFAC 8C470040 */   lw        $a3, 0x40($v0)
/* 4BBB0 8004AFB0 0C026259 */  jal        passToMalloc
/* 4BBB4 8004AFB4 24040084 */   addiu     $a0, $zero, 0x84
/* 4BBB8 8004AFB8 00402021 */  addu       $a0, $v0, $zero
/* 4BBBC 8004AFBC 0C01227C */  jal        options_menu_widget
/* 4BBC0 8004AFC0 00002821 */   addu      $a1, $zero, $zero
/* 4BBC4 8004AFC4 8C430040 */  lw         $v1, 0x40($v0)
/* 4BBC8 8004AFC8 AE02000C */  sw         $v0, 0xc($s0)
/* 4BBCC 8004AFCC 2402000F */  addiu      $v0, $zero, 0xf
/* 4BBD0 8004AFD0 A0620033 */  sb         $v0, 0x33($v1)
/* 4BBD4 8004AFD4 8E02000C */  lw         $v0, 0xc($s0)
/* 4BBD8 8004AFD8 8C470040 */  lw         $a3, 0x40($v0)
.L8004AFDC:
/* 4BBDC 8004AFDC 8E220084 */  lw         $v0, 0x84($s1)
/* 4BBE0 8004AFE0 8CE30000 */  lw         $v1, ($a3)
/* 4BBE4 8004AFE4 AE220080 */  sw         $v0, 0x80($s1)
/* 4BBE8 8004AFE8 8CE20014 */  lw         $v0, 0x14($a3)
/* 4BBEC 8004AFEC 94660060 */  lhu        $a2, 0x60($v1)
/* 4BBF0 8004AFF0 94650062 */  lhu        $a1, 0x62($v1)
/* 4BBF4 8004AFF4 94470062 */  lhu        $a3, 0x62($v0)
/* 4BBF8 8004AFF8 24C4FFF0 */  addiu      $a0, $a2, -0x10
/* 4BBFC 8004AFFC 00042400 */  sll        $a0, $a0, 0x10
/* 4BC00 8004B000 00042403 */  sra        $a0, $a0, 0x10
/* 4BC04 8004B004 24A5FFD8 */  addiu      $a1, $a1, -0x28
/* 4BC08 8004B008 00052C00 */  sll        $a1, $a1, 0x10
/* 4BC0C 8004B00C 00052C03 */  sra        $a1, $a1, 0x10
/* 4BC10 8004B010 24C600C0 */  addiu      $a2, $a2, 0xc0
/* 4BC14 8004B014 00063400 */  sll        $a2, $a2, 0x10
/* 4BC18 8004B018 24E70014 */  addiu      $a3, $a3, 0x14
/* 4BC1C 8004B01C 00073C00 */  sll        $a3, $a3, 0x10
/* 4BC20 8004B020 00063403 */  sra        $a2, $a2, 0x10
/* 4BC24 8004B024 0C0129D4 */  jal        func_8004A750
/* 4BC28 8004B028 00073C03 */   sra       $a3, $a3, 0x10
/* 4BC2C 8004B02C 8E03000C */  lw         $v1, 0xc($s0)
/* 4BC30 8004B030 AE220084 */  sw         $v0, 0x84($s1)
/* 4BC34 8004B034 24020004 */  addiu      $v0, $zero, 4
/* 4BC38 8004B038 A2020024 */  sb         $v0, 0x24($s0)
/* 4BC3C 8004B03C 8E260078 */  lw         $a2, 0x78($s1)
/* 4BC40 8004B040 00602821 */  addu       $a1, $v1, $zero
/* 4BC44 8004B044 AE03001C */  sw         $v1, 0x1c($s0)
/* 4BC48 8004B048 84C40030 */  lh         $a0, 0x30($a2)
/* 4BC4C 8004B04C 8CC20034 */  lw         $v0, 0x34($a2)
/* 4BC50 8004B050 0040F809 */  jalr       $v0
/* 4BC54 8004B054 02242021 */   addu      $a0, $s1, $a0
/* 4BC58 8004B058 A220007E */  sb         $zero, 0x7e($s1)
/* 4BC5C 8004B05C 8E04001C */  lw         $a0, 0x1c($s0)
/* 4BC60 8004B060 0C02F216 */  jal        widget_fade
/* 4BC64 8004B064 00002821 */   addu      $a1, $zero, $zero
/* 4BC68 8004B068 240200FF */  addiu      $v0, $zero, 0xff
/* 4BC6C 8004B06C A222007F */  sb         $v0, 0x7f($s1)
/* 4BC70 8004B070 8E040020 */  lw         $a0, 0x20($s0)
/* 4BC74 8004B074 10800004 */  beqz       $a0, .L8004B088
/* 4BC78 8004B078 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4BC7C 8004B07C 0C02F216 */  jal        widget_fade
/* 4BC80 8004B080 240500FF */   addiu     $a1, $zero, 0xff
/* 4BC84 8004B084 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004B088:
/* 4BC88 8004B088 8FB10014 */  lw         $s1, 0x14($sp)
/* 4BC8C 8004B08C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4BC90 8004B090 03E00008 */  jr         $ra
/* 4BC94 8004B094 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004B098
/* 4BC98 8004B098 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4BC9C 8004B09C AFB10014 */  sw         $s1, 0x14($sp)
/* 4BCA0 8004B0A0 00808821 */  addu       $s1, $a0, $zero
/* 4BCA4 8004B0A4 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4BCA8 8004B0A8 AFB00010 */  sw         $s0, 0x10($sp)
/* 4BCAC 8004B0AC 8E300040 */  lw         $s0, 0x40($s1)
/* 4BCB0 8004B0B0 8E05001C */  lw         $a1, 0x1c($s0)
/* 4BCB4 8004B0B4 10A00007 */  beqz       $a1, .L8004B0D4
/* 4BCB8 8004B0B8 AE050020 */   sw        $a1, 0x20($s0)
/* 4BCBC 8004B0BC 8E230078 */  lw         $v1, 0x78($s1)
/* 4BCC0 8004B0C0 84640038 */  lh         $a0, 0x38($v1)
/* 4BCC4 8004B0C4 8C62003C */  lw         $v0, 0x3c($v1)
/* 4BCC8 8004B0C8 0040F809 */  jalr       $v0
/* 4BCCC 8004B0CC 02242021 */   addu      $a0, $s1, $a0
/* 4BCD0 8004B0D0 AE00001C */  sw         $zero, 0x1c($s0)
.L8004B0D4:
/* 4BCD4 8004B0D4 8E060008 */  lw         $a2, 8($s0)
/* 4BCD8 8004B0D8 14C0000B */  bnez       $a2, .L8004B108
/* 4BCDC 8004B0DC 3C02800E */   lui       $v0, 0x800e
/* 4BCE0 8004B0E0 0C026259 */  jal        passToMalloc
/* 4BCE4 8004B0E4 24040080 */   addiu     $a0, $zero, 0x80
/* 4BCE8 8004B0E8 3C03800E */  lui        $v1, %hi(partyPointer)
/* 4BCEC 8004B0EC 8C647EA0 */  lw         $a0, %lo(partyPointer)($v1)
/* 4BCF0 8004B0F0 8C860000 */  lw         $a2, ($a0)
/* 4BCF4 8004B0F4 8CC50004 */  lw         $a1, 4($a2)
/* 4BCF8 8004B0F8 0C00D0FC */  jal        func_800343F0
/* 4BCFC 8004B0FC 00402021 */   addu      $a0, $v0, $zero
/* 4BD00 8004B100 08012C47 */  j          .L8004B11C
/* 4BD04 8004B104 AE020008 */   sw        $v0, 8($s0)
.L8004B108:
/* 4BD08 8004B108 8C437EA0 */  lw         $v1, 0x7ea0($v0)
/* 4BD0C 8004B10C 8C640000 */  lw         $a0, ($v1)
/* 4BD10 8004B110 8C850004 */  lw         $a1, 4($a0)
/* 4BD14 8004B114 0C00D21E */  jal        inputmenu_AddChar
/* 4BD18 8004B118 00C02021 */   addu      $a0, $a2, $zero
.L8004B11C:
/* 4BD1C 8004B11C 8E020008 */  lw         $v0, 8($s0)
/* 4BD20 8004B120 8C430040 */  lw         $v1, 0x40($v0)
/* 4BD24 8004B124 8E250084 */  lw         $a1, 0x84($s1)
/* 4BD28 8004B128 8C640000 */  lw         $a0, ($v1)
/* 4BD2C 8004B12C 240700B3 */  addiu      $a3, $zero, 0xb3
/* 4BD30 8004B130 AE250080 */  sw         $a1, 0x80($s1)
/* 4BD34 8004B134 84830066 */  lh         $v1, 0x66($a0)
/* 4BD38 8004B138 84820064 */  lh         $v0, 0x64($a0)
/* 4BD3C 8004B13C 2405002B */  addiu      $a1, $zero, 0x2b
/* 4BD40 8004B140 00621823 */  subu       $v1, $v1, $v0
/* 4BD44 8004B144 24630008 */  addiu      $v1, $v1, 8
/* 4BD48 8004B148 94820060 */  lhu        $v0, 0x60($a0)
/* 4BD4C 8004B14C 44831000 */  mtc1       $v1, $f2
/* 4BD50 8004B150 468010A0 */  cvt.s.w    $f2, $f2
/* 4BD54 8004B154 2444FFF8 */  addiu      $a0, $v0, -8
/* 4BD58 8004B158 00021400 */  sll        $v0, $v0, 0x10
/* 4BD5C 8004B15C 00021403 */  sra        $v0, $v0, 0x10
/* 4BD60 8004B160 2442FFF8 */  addiu      $v0, $v0, -8
/* 4BD64 8004B164 44820000 */  mtc1       $v0, $f0
/* 4BD68 8004B168 46800020 */  cvt.s.w    $f0, $f0
/* 4BD6C 8004B16C 46020000 */  add.s      $f0, $f0, $f2
/* 4BD70 8004B170 00042400 */  sll        $a0, $a0, 0x10
/* 4BD74 8004B174 00042403 */  sra        $a0, $a0, 0x10
/* 4BD78 8004B178 4600008D */  trunc.w.s  $f2, $f0
/* 4BD7C 8004B17C 44061000 */  mfc1       $a2, $f2
/* 4BD80 8004B180 00063400 */  sll        $a2, $a2, 0x10
/* 4BD84 8004B184 0C0129D4 */  jal        func_8004A750
/* 4BD88 8004B188 00063403 */   sra       $a2, $a2, 0x10
/* 4BD8C 8004B18C 8E030008 */  lw         $v1, 8($s0)
/* 4BD90 8004B190 AE220084 */  sw         $v0, 0x84($s1)
/* 4BD94 8004B194 24020002 */  addiu      $v0, $zero, 2
/* 4BD98 8004B198 A2020024 */  sb         $v0, 0x24($s0)
/* 4BD9C 8004B19C 8E260078 */  lw         $a2, 0x78($s1)
/* 4BDA0 8004B1A0 00602821 */  addu       $a1, $v1, $zero
/* 4BDA4 8004B1A4 AE03001C */  sw         $v1, 0x1c($s0)
/* 4BDA8 8004B1A8 84C40030 */  lh         $a0, 0x30($a2)
/* 4BDAC 8004B1AC 8CC20034 */  lw         $v0, 0x34($a2)
/* 4BDB0 8004B1B0 0040F809 */  jalr       $v0
/* 4BDB4 8004B1B4 02242021 */   addu      $a0, $s1, $a0
/* 4BDB8 8004B1B8 A220007E */  sb         $zero, 0x7e($s1)
/* 4BDBC 8004B1BC 8E04001C */  lw         $a0, 0x1c($s0)
/* 4BDC0 8004B1C0 0C02F216 */  jal        widget_fade
/* 4BDC4 8004B1C4 00002821 */   addu      $a1, $zero, $zero
/* 4BDC8 8004B1C8 240200FF */  addiu      $v0, $zero, 0xff
/* 4BDCC 8004B1CC A222007F */  sb         $v0, 0x7f($s1)
/* 4BDD0 8004B1D0 8E040020 */  lw         $a0, 0x20($s0)
/* 4BDD4 8004B1D4 10800004 */  beqz       $a0, .L8004B1E8
/* 4BDD8 8004B1D8 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4BDDC 8004B1DC 0C02F216 */  jal        widget_fade
/* 4BDE0 8004B1E0 240500FF */   addiu     $a1, $zero, 0xff
/* 4BDE4 8004B1E4 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004B1E8:
/* 4BDE8 8004B1E8 8FB10014 */  lw         $s1, 0x14($sp)
/* 4BDEC 8004B1EC 8FB00010 */  lw         $s0, 0x10($sp)
/* 4BDF0 8004B1F0 03E00008 */  jr         $ra
/* 4BDF4 8004B1F4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004B1F8
/* 4BDF8 8004B1F8 3C02800E */  lui        $v0, %hi(some_gamestart_byte)
/* 4BDFC 8004B1FC 24030002 */  addiu      $v1, $zero, 2
/* 4BE00 8004B200 A0437DA8 */  sb         $v1, %lo(some_gamestart_byte)($v0)
/* 4BE04 8004B204 24427DA8 */  addiu      $v0, $v0, 0x7da8
/* 4BE08 8004B208 2442EB00 */  addiu      $v0, $v0, -0x1500
/* 4BE0C 8004B20C 3C01800E */  lui        $at, %hi(D_800DD610)
/* 4BE10 8004B210 C420D610 */  lwc1       $f0, %lo(D_800DD610)($at)
/* 4BE14 8004B214 24030001 */  addiu      $v1, $zero, 1
/* 4BE18 8004B218 A4432048 */  sh         $v1, 0x2048($v0)
/* 4BE1C 8004B21C 03E00008 */  jr         $ra
/* 4BE20 8004B220 E4402044 */   swc1      $f0, 0x2044($v0)

glabel func_with_title_screen
/* 4BE24 8004B224 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4BE28 8004B228 8C447DAC */  lw         $a0, %lo(title_screen_pointer)($v0)
/* 4BE2C 8004B22C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4BE30 8004B230 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4BE34 8004B234 0C012B8E */  jal        func_8004AE38
/* 4BE38 8004B238 00000000 */   nop
/* 4BE3C 8004B23C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4BE40 8004B240 03E00008 */  jr         $ra
/* 4BE44 8004B244 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004B248
/* 4BE48 8004B248 27BDFF10 */  addiu      $sp, $sp, -0xf0
/* 4BE4C 8004B24C AFB100E4 */  sw         $s1, 0xe4($sp)
/* 4BE50 8004B250 00808821 */  addu       $s1, $a0, $zero
/* 4BE54 8004B254 AFBF00E8 */  sw         $ra, 0xe8($sp)
/* 4BE58 8004B258 AFB000E0 */  sw         $s0, 0xe0($sp)
/* 4BE5C 8004B25C 8E300040 */  lw         $s0, 0x40($s1)
/* 4BE60 8004B260 8E05001C */  lw         $a1, 0x1c($s0)
/* 4BE64 8004B264 10A00007 */  beqz       $a1, .L8004B284
/* 4BE68 8004B268 AE050020 */   sw        $a1, 0x20($s0)
/* 4BE6C 8004B26C 8E230078 */  lw         $v1, 0x78($s1)
/* 4BE70 8004B270 84640038 */  lh         $a0, 0x38($v1)
/* 4BE74 8004B274 8C62003C */  lw         $v0, 0x3c($v1)
/* 4BE78 8004B278 0040F809 */  jalr       $v0
/* 4BE7C 8004B27C 02242021 */   addu      $a0, $s1, $a0
/* 4BE80 8004B280 AE00001C */  sw         $zero, 0x1c($s0)
.L8004B284:
/* 4BE84 8004B284 8E030010 */  lw         $v1, 0x10($s0)
/* 4BE88 8004B288 24020003 */  addiu      $v0, $zero, 3
/* 4BE8C 8004B28C 1460001E */  bnez       $v1, .L8004B308
/* 4BE90 8004B290 A2020024 */   sb        $v0, 0x24($s0)
/* 4BE94 8004B294 24040033 */  addiu      $a0, $zero, 0x33
/* 4BE98 8004B298 24050018 */  addiu      $a1, $zero, 0x18
/* 4BE9C 8004B29C 3C068005 */  lui        $a2, %hi(func_8004B1F8)
/* 4BEA0 8004B2A0 24C6B1F8 */  addiu      $a2, $a2, %lo(func_8004B1F8)
/* 4BEA4 8004B2A4 3C078005 */  lui        $a3, %hi(func_with_title_screen)
/* 4BEA8 8004B2A8 24E7B224 */  addiu      $a3, $a3, %lo(func_with_title_screen)
/* 4BEAC 8004B2AC 240200E1 */  addiu      $v0, $zero, 0xe1
/* 4BEB0 8004B2B0 27A80020 */  addiu      $t0, $sp, 0x20
/* 4BEB4 8004B2B4 240300FF */  addiu      $v1, $zero, 0xff
/* 4BEB8 8004B2B8 A3A20020 */  sb         $v0, 0x20($sp)
/* 4BEBC 8004B2BC A1020001 */  sb         $v0, 1($t0)
/* 4BEC0 8004B2C0 A1020002 */  sb         $v0, 2($t0)
/* 4BEC4 8004B2C4 24020064 */  addiu      $v0, $zero, 0x64
/* 4BEC8 8004B2C8 A1030003 */  sb         $v1, 3($t0)
/* 4BECC 8004B2CC A3A20060 */  sb         $v0, 0x60($sp)
/* 4BED0 8004B2D0 A3A20061 */  sb         $v0, 0x61($sp)
/* 4BED4 8004B2D4 A3A20062 */  sb         $v0, 0x62($sp)
/* 4BED8 8004B2D8 A3A20063 */  sb         $v0, 0x63($sp)
/* 4BEDC 8004B2DC 27A20060 */  addiu      $v0, $sp, 0x60
/* 4BEE0 8004B2E0 A3A300A0 */  sb         $v1, 0xa0($sp)
/* 4BEE4 8004B2E4 A3A300A1 */  sb         $v1, 0xa1($sp)
/* 4BEE8 8004B2E8 A3A300A2 */  sb         $v1, 0xa2($sp)
/* 4BEEC 8004B2EC A3A300A3 */  sb         $v1, 0xa3($sp)
/* 4BEF0 8004B2F0 27A300A0 */  addiu      $v1, $sp, 0xa0
/* 4BEF4 8004B2F4 AFA80010 */  sw         $t0, 0x10($sp)
/* 4BEF8 8004B2F8 AFA20014 */  sw         $v0, 0x14($sp)
/* 4BEFC 8004B2FC 0C02172F */  jal        ContpakData_malloc
/* 4BF00 8004B300 AFA30018 */   sw        $v1, 0x18($sp)
/* 4BF04 8004B304 AE020010 */  sw         $v0, 0x10($s0)
.L8004B308:
/* 4BF08 8004B308 8E020010 */  lw         $v0, 0x10($s0)
/* 4BF0C 8004B30C 8E230078 */  lw         $v1, 0x78($s1)
/* 4BF10 8004B310 00402821 */  addu       $a1, $v0, $zero
/* 4BF14 8004B314 AE02001C */  sw         $v0, 0x1c($s0)
/* 4BF18 8004B318 84640030 */  lh         $a0, 0x30($v1)
/* 4BF1C 8004B31C 8C620034 */  lw         $v0, 0x34($v1)
/* 4BF20 8004B320 0040F809 */  jalr       $v0
/* 4BF24 8004B324 02242021 */   addu      $a0, $s1, $a0
/* 4BF28 8004B328 24040033 */  addiu      $a0, $zero, 0x33
/* 4BF2C 8004B32C 24050018 */  addiu      $a1, $zero, 0x18
/* 4BF30 8004B330 2406010E */  addiu      $a2, $zero, 0x10e
/* 4BF34 8004B334 8E220084 */  lw         $v0, 0x84($s1)
/* 4BF38 8004B338 240700D8 */  addiu      $a3, $zero, 0xd8
/* 4BF3C 8004B33C 0C0129D4 */  jal        func_8004A750
/* 4BF40 8004B340 AE220080 */   sw        $v0, 0x80($s1)
/* 4BF44 8004B344 A220007E */  sb         $zero, 0x7e($s1)
/* 4BF48 8004B348 8E04001C */  lw         $a0, 0x1c($s0)
/* 4BF4C 8004B34C 00002821 */  addu       $a1, $zero, $zero
/* 4BF50 8004B350 0C02F216 */  jal        widget_fade
/* 4BF54 8004B354 AE220084 */   sw        $v0, 0x84($s1)
/* 4BF58 8004B358 240200FF */  addiu      $v0, $zero, 0xff
/* 4BF5C 8004B35C A222007F */  sb         $v0, 0x7f($s1)
/* 4BF60 8004B360 8E040020 */  lw         $a0, 0x20($s0)
/* 4BF64 8004B364 10800004 */  beqz       $a0, .L8004B378
/* 4BF68 8004B368 8FBF00E8 */   lw        $ra, 0xe8($sp)
/* 4BF6C 8004B36C 0C02F216 */  jal        widget_fade
/* 4BF70 8004B370 240500FF */   addiu     $a1, $zero, 0xff
/* 4BF74 8004B374 8FBF00E8 */  lw         $ra, 0xe8($sp)
.L8004B378:
/* 4BF78 8004B378 8FB100E4 */  lw         $s1, 0xe4($sp)
/* 4BF7C 8004B37C 8FB000E0 */  lw         $s0, 0xe0($sp)
/* 4BF80 8004B380 03E00008 */  jr         $ra
/* 4BF84 8004B384 27BD00F0 */   addiu     $sp, $sp, 0xf0

glabel make_start_menu
/* 4BF88 8004B388 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4BF8C 8004B38C 2404007C */  addiu      $a0, $zero, 0x7c
/* 4BF90 8004B390 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4BF94 8004B394 AFB10014 */  sw         $s1, 0x14($sp)
/* 4BF98 8004B398 0C026259 */  jal        passToMalloc
/* 4BF9C 8004B39C AFB00010 */   sw        $s0, 0x10($sp)
/* 4BFA0 8004B3A0 00402021 */  addu       $a0, $v0, $zero
/* 4BFA4 8004B3A4 0C02E68C */  jal        widgetscrollmenu_init
/* 4BFA8 8004B3A8 24050007 */   addiu     $a1, $zero, 7
/* 4BFAC 8004B3AC 2404007C */  addiu      $a0, $zero, 0x7c
/* 4BFB0 8004B3B0 0C026259 */  jal        passToMalloc
/* 4BFB4 8004B3B4 00408821 */   addu      $s1, $v0, $zero
/* 4BFB8 8004B3B8 240400F2 */  addiu      $a0, $zero, 0xf2
/* 4BFBC 8004B3BC 0C0290E2 */  jal        get_borg_8
/* 4BFC0 8004B3C0 00408021 */   addu      $s0, $v0, $zero
/* 4BFC4 8004B3C4 02002021 */  addu       $a0, $s0, $zero
/* 4BFC8 8004B3C8 0C02E518 */  jal        borg8_widget
/* 4BFCC 8004B3CC 00402821 */   addu      $a1, $v0, $zero
/* 4BFD0 8004B3D0 00408021 */  addu       $s0, $v0, $zero
/* 4BFD4 8004B3D4 8E030078 */  lw         $v1, 0x78($s0)
/* 4BFD8 8004B3D8 84640018 */  lh         $a0, 0x18($v1)
/* 4BFDC 8004B3DC 8C62001C */  lw         $v0, 0x1c($v1)
/* 4BFE0 8004B3E0 0040F809 */  jalr       $v0
/* 4BFE4 8004B3E4 02042021 */   addu      $a0, $s0, $a0
/* 4BFE8 8004B3E8 02002021 */  addu       $a0, $s0, $zero
/* 4BFEC 8004B3EC 00021042 */  srl        $v0, $v0, 1
/* 4BFF0 8004B3F0 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4BFF4 8004B3F4 240500A0 */  addiu      $a1, $zero, 0xa0
/* 4BFF8 8004B3F8 00A22823 */  subu       $a1, $a1, $v0
/* 4BFFC 8004B3FC 0C02DD3F */  jal        set_widget_coords
/* 4C000 8004B400 24060032 */   addiu     $a2, $zero, 0x32
/* 4C004 8004B404 02202021 */  addu       $a0, $s1, $zero
/* 4C008 8004B408 240500A0 */  addiu      $a1, $zero, 0xa0
/* 4C00C 8004B40C 0C02DD3F */  jal        set_widget_coords
/* 4C010 8004B410 2406005A */   addiu     $a2, $zero, 0x5a
/* 4C014 8004B414 8E230078 */  lw         $v1, 0x78($s1)
/* 4C018 8004B418 02002821 */  addu       $a1, $s0, $zero
/* 4C01C 8004B41C 84640030 */  lh         $a0, 0x30($v1)
/* 4C020 8004B420 8C620034 */  lw         $v0, 0x34($v1)
/* 4C024 8004B424 0040F809 */  jalr       $v0
/* 4C028 8004B428 02242021 */   addu      $a0, $s1, $a0
/* 4C02C 8004B42C 8E230018 */  lw         $v1, 0x18($s1)
/* 4C030 8004B430 2404007C */  addiu      $a0, $zero, 0x7c
/* 4C034 8004B434 0C026259 */  jal        passToMalloc
/* 4C038 8004B438 AE230020 */   sw        $v1, 0x20($s1)
/* 4C03C 8004B43C 3C10800E */  lui        $s0, %hi(gGlobals)
/* 4C040 8004B440 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 4C044 8004B444 8E03204C */  lw         $v1, 0x204c($s0)
/* 4C048 8004B448 00402021 */  addu       $a0, $v0, $zero
/* 4C04C 8004B44C 8C65027C */  lw         $a1, 0x27c($v1)
/* 4C050 8004B450 0C02E3A0 */  jal        widgettext_func_2
/* 4C054 8004B454 24060190 */   addiu     $a2, $zero, 0x190
/* 4C058 8004B458 02202021 */  addu       $a0, $s1, $zero
/* 4C05C 8004B45C 0C02E885 */  jal        link_widget_text
/* 4C060 8004B460 00402821 */   addu      $a1, $v0, $zero
/* 4C064 8004B464 0C026259 */  jal        passToMalloc
/* 4C068 8004B468 2404007C */   addiu     $a0, $zero, 0x7c
/* 4C06C 8004B46C 8E03204C */  lw         $v1, 0x204c($s0)
/* 4C070 8004B470 00402021 */  addu       $a0, $v0, $zero
/* 4C074 8004B474 8C650280 */  lw         $a1, 0x280($v1)
/* 4C078 8004B478 0C02E3A0 */  jal        widgettext_func_2
/* 4C07C 8004B47C 24060190 */   addiu     $a2, $zero, 0x190
/* 4C080 8004B480 02202021 */  addu       $a0, $s1, $zero
/* 4C084 8004B484 0C02E885 */  jal        link_widget_text
/* 4C088 8004B488 00402821 */   addu      $a1, $v0, $zero
/* 4C08C 8004B48C 0C026259 */  jal        passToMalloc
/* 4C090 8004B490 2404007C */   addiu     $a0, $zero, 0x7c
/* 4C094 8004B494 8E03204C */  lw         $v1, 0x204c($s0)
/* 4C098 8004B498 00402021 */  addu       $a0, $v0, $zero
/* 4C09C 8004B49C 8C650284 */  lw         $a1, 0x284($v1)
/* 4C0A0 8004B4A0 0C02E3A0 */  jal        widgettext_func_2
/* 4C0A4 8004B4A4 24060190 */   addiu     $a2, $zero, 0x190
/* 4C0A8 8004B4A8 02202021 */  addu       $a0, $s1, $zero
/* 4C0AC 8004B4AC 0C02E885 */  jal        link_widget_text
/* 4C0B0 8004B4B0 00402821 */   addu      $a1, $v0, $zero
/* 4C0B4 8004B4B4 3C03800E */  lui        $v1, %hi(debug_flag)
/* 4C0B8 8004B4B8 946268A0 */  lhu        $v0, %lo(debug_flag)($v1)
/* 4C0BC 8004B4BC 50400016 */  beql       $v0, $zero, .L8004B518
/* 4C0C0 8004B4C0 02202021 */   addu      $a0, $s1, $zero
/* 4C0C4 8004B4C4 0C026259 */  jal        passToMalloc
/* 4C0C8 8004B4C8 2404007C */   addiu     $a0, $zero, 0x7c
/* 4C0CC 8004B4CC 00402021 */  addu       $a0, $v0, $zero
/* 4C0D0 8004B4D0 3C05800E */  lui        $a1, %hi(D_800DD614)
/* 4C0D4 8004B4D4 24A5D614 */  addiu      $a1, $a1, %lo(D_800DD614)
/* 4C0D8 8004B4D8 0C02E3A0 */  jal        widgettext_func_2
/* 4C0DC 8004B4DC 24060190 */   addiu     $a2, $zero, 0x190
/* 4C0E0 8004B4E0 02202021 */  addu       $a0, $s1, $zero
/* 4C0E4 8004B4E4 0C02E885 */  jal        link_widget_text
/* 4C0E8 8004B4E8 00402821 */   addu      $a1, $v0, $zero
/* 4C0EC 8004B4EC 0C026259 */  jal        passToMalloc
/* 4C0F0 8004B4F0 2404007C */   addiu     $a0, $zero, 0x7c
/* 4C0F4 8004B4F4 00402021 */  addu       $a0, $v0, $zero
/* 4C0F8 8004B4F8 3C05800E */  lui        $a1, %hi(D_800DD620)
/* 4C0FC 8004B4FC 24A5D620 */  addiu      $a1, $a1, %lo(D_800DD620)
/* 4C100 8004B500 0C02E3A0 */  jal        widgettext_func_2
/* 4C104 8004B504 24060190 */   addiu     $a2, $zero, 0x190
/* 4C108 8004B508 02202021 */  addu       $a0, $s1, $zero
/* 4C10C 8004B50C 0C02E885 */  jal        link_widget_text
/* 4C110 8004B510 00402821 */   addu      $a1, $v0, $zero
/* 4C114 8004B514 02202021 */  addu       $a0, $s1, $zero
.L8004B518:
/* 4C118 8004B518 24050004 */  addiu      $a1, $zero, 4
/* 4C11C 8004B51C 8E230040 */  lw         $v1, 0x40($s1)
/* 4C120 8004B520 24020008 */  addiu      $v0, $zero, 8
/* 4C124 8004B524 0C02E8D4 */  jal        func_800BA350
/* 4C128 8004B528 A0620022 */   sb        $v0, 0x22($v1)
/* 4C12C 8004B52C 02201021 */  addu       $v0, $s1, $zero
/* 4C130 8004B530 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4C134 8004B534 8FB10014 */  lw         $s1, 0x14($sp)
/* 4C138 8004B538 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C13C 8004B53C 03E00008 */  jr         $ra
/* 4C140 8004B540 27BD0020 */   addiu     $sp, $sp, 0x20

glabel processIntroMenu
/* 4C144 8004B544 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4C148 8004B548 AFB3001C */  sw         $s3, 0x1c($sp)
/* 4C14C 8004B54C 00809821 */  addu       $s3, $a0, $zero
/* 4C150 8004B550 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4C154 8004B554 AFB20018 */  sw         $s2, 0x18($sp)
/* 4C158 8004B558 245268A8 */  addiu      $s2, $v0, %lo(gGlobals)
/* 4C15C 8004B55C AFBF0020 */  sw         $ra, 0x20($sp)
/* 4C160 8004B560 AFB10014 */  sw         $s1, 0x14($sp)
/* 4C164 8004B564 AFB00010 */  sw         $s0, 0x10($sp)
/* 4C168 8004B568 8CB00040 */  lw         $s0, 0x40($a1)
/* 4C16C 8004B56C 8E42204C */  lw         $v0, 0x204c($s2)
/* 4C170 8004B570 8E040000 */  lw         $a0, ($s0)
/* 4C174 8004B574 8C45027C */  lw         $a1, 0x27c($v0)
/* 4C178 8004B578 0C0262BE */  jal        func_80098AF8
/* 4C17C 8004B57C 8E710040 */   lw        $s1, 0x40($s3)
/* 4C180 8004B580 54400005 */  bnel       $v0, $zero, .L8004B598
/* 4C184 8004B584 8E040000 */   lw        $a0, ($s0)
/* 4C188 8004B588 0C012C26 */  jal        func_8004B098
/* 4C18C 8004B58C 02602021 */   addu      $a0, $s3, $zero
/* 4C190 8004B590 08012D94 */  j          .L8004B650
/* 4C194 8004B594 8FBF0020 */   lw        $ra, 0x20($sp)
.L8004B598:
/* 4C198 8004B598 3C05800E */  lui        $a1, %hi(D_800DD614)
/* 4C19C 8004B59C 0C0262BE */  jal        func_80098AF8
/* 4C1A0 8004B5A0 24A5D614 */   addiu     $a1, $a1, %lo(D_800DD614)
/* 4C1A4 8004B5A4 54400004 */  bnel       $v0, $zero, .L8004B5B8
/* 4C1A8 8004B5A8 8E040000 */   lw        $a0, ($s0)
/* 4C1AC 8004B5AC 24020009 */  addiu      $v0, $zero, 9
/* 4C1B0 8004B5B0 08012D93 */  j          .L8004B64C
/* 4C1B4 8004B5B4 A2220024 */   sb        $v0, 0x24($s1)
.L8004B5B8:
/* 4C1B8 8004B5B8 3C05800E */  lui        $a1, %hi(D_800DD620)
/* 4C1BC 8004B5BC 0C0262BE */  jal        func_80098AF8
/* 4C1C0 8004B5C0 24A5D620 */   addiu     $a1, $a1, %lo(D_800DD620)
/* 4C1C4 8004B5C4 54400004 */  bnel       $v0, $zero, .L8004B5D8
/* 4C1C8 8004B5C8 8E040000 */   lw        $a0, ($s0)
/* 4C1CC 8004B5CC 24020007 */  addiu      $v0, $zero, 7
/* 4C1D0 8004B5D0 08012D93 */  j          .L8004B64C
/* 4C1D4 8004B5D4 A2220024 */   sb        $v0, 0x24($s1)
.L8004B5D8:
/* 4C1D8 8004B5D8 3C05800E */  lui        $a1, %hi(D_800DD634)
/* 4C1DC 8004B5DC 0C0262BE */  jal        func_80098AF8
/* 4C1E0 8004B5E0 24A5D634 */   addiu     $a1, $a1, %lo(D_800DD634)
/* 4C1E4 8004B5E4 54400004 */  bnel       $v0, $zero, .L8004B5F8
/* 4C1E8 8004B5E8 8E42204C */   lw        $v0, 0x204c($s2)
/* 4C1EC 8004B5EC 24020008 */  addiu      $v0, $zero, 8
/* 4C1F0 8004B5F0 08012D93 */  j          .L8004B64C
/* 4C1F4 8004B5F4 A2220024 */   sb        $v0, 0x24($s1)
.L8004B5F8:
/* 4C1F8 8004B5F8 8E040000 */  lw         $a0, ($s0)
/* 4C1FC 8004B5FC 0C0262BE */  jal        func_80098AF8
/* 4C200 8004B600 8C450284 */   lw        $a1, 0x284($v0)
/* 4C204 8004B604 54400005 */  bnel       $v0, $zero, .L8004B61C
/* 4C208 8004B608 8E42204C */   lw        $v0, 0x204c($s2)
/* 4C20C 8004B60C 0C012BDA */  jal        func_8004AF68
/* 4C210 8004B610 02602021 */   addu      $a0, $s3, $zero
/* 4C214 8004B614 08012D94 */  j          .L8004B650
/* 4C218 8004B618 8FBF0020 */   lw        $ra, 0x20($sp)
.L8004B61C:
/* 4C21C 8004B61C 8E040000 */  lw         $a0, ($s0)
/* 4C220 8004B620 0C0262BE */  jal        func_80098AF8
/* 4C224 8004B624 8C450280 */   lw        $a1, 0x280($v0)
/* 4C228 8004B628 14400004 */  bnez       $v0, .L8004B63C
/* 4C22C 8004B62C 3C04800E */   lui       $a0, %hi(D_800DD644)
/* 4C230 8004B630 2402000B */  addiu      $v0, $zero, 0xb
/* 4C234 8004B634 08012D93 */  j          .L8004B64C
/* 4C238 8004B638 A2220024 */   sb        $v0, 0x24($s1)
.L8004B63C:
/* 4C23C 8004B63C 2484D644 */  addiu      $a0, $a0, %lo(D_800DD644)
/* 4C240 8004B640 3C05800E */  lui        $a1, %hi(D_800DD664)
/* 4C244 8004B644 0C025F2D */  jal        manualCrash
/* 4C248 8004B648 24A5D664 */   addiu     $a1, $a1, %lo(D_800DD664)
.L8004B64C:
/* 4C24C 8004B64C 8FBF0020 */  lw         $ra, 0x20($sp)
.L8004B650:
/* 4C250 8004B650 8FB3001C */  lw         $s3, 0x1c($sp)
/* 4C254 8004B654 8FB20018 */  lw         $s2, 0x18($sp)
/* 4C258 8004B658 8FB10014 */  lw         $s1, 0x14($sp)
/* 4C25C 8004B65C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C260 8004B660 03E00008 */  jr         $ra
/* 4C264 8004B664 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004B668
/* 4C268 8004B668 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4C26C 8004B66C AFBF0010 */  sw         $ra, 0x10($sp)
/* 4C270 8004B670 10A00009 */  beqz       $a1, .L8004B698
/* 4C274 8004B674 8C830040 */   lw        $v1, 0x40($a0)
/* 4C278 8004B678 90A2005C */  lbu        $v0, 0x5c($a1)
/* 4C27C 8004B67C 14400005 */  bnez       $v0, .L8004B694
/* 4C280 8004B680 24020006 */   addiu     $v0, $zero, 6
/* 4C284 8004B684 0C012B8E */  jal        func_8004AE38
/* 4C288 8004B688 00000000 */   nop
/* 4C28C 8004B68C 08012DA7 */  j          .L8004B69C
/* 4C290 8004B690 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004B694:
/* 4C294 8004B694 A0620024 */  sb         $v0, 0x24($v1)
.L8004B698:
/* 4C298 8004B698 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004B69C:
/* 4C29C 8004B69C 03E00008 */  jr         $ra
/* 4C2A0 8004B6A0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel Ofunc_NOOP_8004b6a4
/* 4C2A4 8004B6A4 03E00008 */  jr         $ra
/* 4C2A8 8004B6A8 00000000 */   nop

glabel func_8004B6AC
/* 4C2AC 8004B6AC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4C2B0 8004B6B0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4C2B4 8004B6B4 00808021 */  addu       $s0, $a0, $zero
/* 4C2B8 8004B6B8 14A00037 */  bnez       $a1, .L8004B798
/* 4C2BC 8004B6BC AFBF0014 */   sw        $ra, 0x14($sp)
/* 4C2C0 8004B6C0 8E020040 */  lw         $v0, 0x40($s0)
/* 4C2C4 8004B6C4 8C43000C */  lw         $v1, 0xc($v0)
/* 4C2C8 8004B6C8 8E040084 */  lw         $a0, 0x84($s0)
/* 4C2CC 8004B6CC 8C630040 */  lw         $v1, 0x40($v1)
/* 4C2D0 8004B6D0 AE040080 */  sw         $a0, 0x80($s0)
/* 4C2D4 8004B6D4 90620028 */  lbu        $v0, 0x28($v1)
/* 4C2D8 8004B6D8 1040001A */  beqz       $v0, .L8004B744
/* 4C2DC 8004B6DC 2405002B */   addiu     $a1, $zero, 0x2b
/* 4C2E0 8004B6E0 8C620024 */  lw         $v0, 0x24($v1)
/* 4C2E4 8004B6E4 8C430040 */  lw         $v1, 0x40($v0)
/* 4C2E8 8004B6E8 8C640000 */  lw         $a0, ($v1)
/* 4C2EC 8004B6EC 84830066 */  lh         $v1, 0x66($a0)
/* 4C2F0 8004B6F0 84820064 */  lh         $v0, 0x64($a0)
/* 4C2F4 8004B6F4 240700B3 */  addiu      $a3, $zero, 0xb3
/* 4C2F8 8004B6F8 00621823 */  subu       $v1, $v1, $v0
/* 4C2FC 8004B6FC 24630008 */  addiu      $v1, $v1, 8
/* 4C300 8004B700 94820060 */  lhu        $v0, 0x60($a0)
/* 4C304 8004B704 44831000 */  mtc1       $v1, $f2
/* 4C308 8004B708 468010A0 */  cvt.s.w    $f2, $f2
/* 4C30C 8004B70C 2444FFF8 */  addiu      $a0, $v0, -8
/* 4C310 8004B710 00021400 */  sll        $v0, $v0, 0x10
/* 4C314 8004B714 00021403 */  sra        $v0, $v0, 0x10
/* 4C318 8004B718 2442FFF8 */  addiu      $v0, $v0, -8
/* 4C31C 8004B71C 44820000 */  mtc1       $v0, $f0
/* 4C320 8004B720 46800020 */  cvt.s.w    $f0, $f0
/* 4C324 8004B724 46020000 */  add.s      $f0, $f0, $f2
/* 4C328 8004B728 00042400 */  sll        $a0, $a0, 0x10
/* 4C32C 8004B72C 00042403 */  sra        $a0, $a0, 0x10
/* 4C330 8004B730 4600008D */  trunc.w.s  $f2, $f0
/* 4C334 8004B734 44061000 */  mfc1       $a2, $f2
/* 4C338 8004B738 00063400 */  sll        $a2, $a2, 0x10
/* 4C33C 8004B73C 08012DE2 */  j          .L8004B788
/* 4C340 8004B740 00063403 */   sra       $a2, $a2, 0x10
.L8004B744:
/* 4C344 8004B744 8C620000 */  lw         $v0, ($v1)
/* 4C348 8004B748 94460060 */  lhu        $a2, 0x60($v0)
/* 4C34C 8004B74C 94450062 */  lhu        $a1, 0x62($v0)
/* 4C350 8004B750 8C620014 */  lw         $v0, 0x14($v1)
/* 4C354 8004B754 24C4FFF0 */  addiu      $a0, $a2, -0x10
/* 4C358 8004B758 00042400 */  sll        $a0, $a0, 0x10
/* 4C35C 8004B75C 00042403 */  sra        $a0, $a0, 0x10
/* 4C360 8004B760 24A5FFD8 */  addiu      $a1, $a1, -0x28
/* 4C364 8004B764 00052C00 */  sll        $a1, $a1, 0x10
/* 4C368 8004B768 00052C03 */  sra        $a1, $a1, 0x10
/* 4C36C 8004B76C 24C600C0 */  addiu      $a2, $a2, 0xc0
/* 4C370 8004B770 00063400 */  sll        $a2, $a2, 0x10
/* 4C374 8004B774 94470062 */  lhu        $a3, 0x62($v0)
/* 4C378 8004B778 00063403 */  sra        $a2, $a2, 0x10
/* 4C37C 8004B77C 24E70014 */  addiu      $a3, $a3, 0x14
/* 4C380 8004B780 00073C00 */  sll        $a3, $a3, 0x10
/* 4C384 8004B784 00073C03 */  sra        $a3, $a3, 0x10
.L8004B788:
/* 4C388 8004B788 0C0129D4 */  jal        func_8004A750
/* 4C38C 8004B78C 00000000 */   nop
/* 4C390 8004B790 08012DE8 */  j          .L8004B7A0
/* 4C394 8004B794 AE020084 */   sw        $v0, 0x84($s0)
.L8004B798:
/* 4C398 8004B798 0C012B8E */  jal        func_8004AE38
/* 4C39C 8004B79C 02002021 */   addu      $a0, $s0, $zero
.L8004B7A0:
/* 4C3A0 8004B7A0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4C3A4 8004B7A4 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C3A8 8004B7A8 03E00008 */  jr         $ra
/* 4C3AC 8004B7AC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_control_left_right
/* 4C3B0 8004B7B0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4C3B4 8004B7B4 AFB10014 */  sw         $s1, 0x14($sp)
/* 4C3B8 8004B7B8 00A08821 */  addu       $s1, $a1, $zero
/* 4C3BC 8004B7BC AFBF0018 */  sw         $ra, 0x18($sp)
/* 4C3C0 8004B7C0 AFB00010 */  sw         $s0, 0x10($sp)
/* 4C3C4 8004B7C4 9082007E */  lbu        $v0, 0x7e($a0)
/* 4C3C8 8004B7C8 2C4200FF */  sltiu      $v0, $v0, 0xff
/* 4C3CC 8004B7CC 1440004C */  bnez       $v0, .L8004B900
/* 4C3D0 8004B7D0 8C900040 */   lw        $s0, 0x40($a0)
/* 4C3D4 8004B7D4 9082007F */  lbu        $v0, 0x7f($a0)
/* 4C3D8 8004B7D8 1440004A */  bnez       $v0, .L8004B904
/* 4C3DC 8004B7DC 00001021 */   addu      $v0, $zero, $zero
/* 4C3E0 8004B7E0 8E02000C */  lw         $v0, 0xc($s0)
/* 4C3E4 8004B7E4 50400007 */  beql       $v0, $zero, .L8004B804
/* 4C3E8 8004B7E8 8E060010 */   lw        $a2, 0x10($s0)
/* 4C3EC 8004B7EC 9043005B */  lbu        $v1, 0x5b($v0)
/* 4C3F0 8004B7F0 10600003 */  beqz       $v1, .L8004B800
/* 4C3F4 8004B7F4 240200FF */   addiu     $v0, $zero, 0xff
/* 4C3F8 8004B7F8 14620042 */  bne        $v1, $v0, .L8004B904
/* 4C3FC 8004B7FC 00001021 */   addu      $v0, $zero, $zero
.L8004B800:
/* 4C400 8004B800 8E060010 */  lw         $a2, 0x10($s0)
.L8004B804:
/* 4C404 8004B804 10C00008 */  beqz       $a2, .L8004B828
/* 4C408 8004B808 02202821 */   addu      $a1, $s1, $zero
/* 4C40C 8004B80C 8CC30078 */  lw         $v1, 0x78($a2)
/* 4C410 8004B810 84640050 */  lh         $a0, 0x50($v1)
/* 4C414 8004B814 8C620054 */  lw         $v0, 0x54($v1)
/* 4C418 8004B818 0040F809 */  jalr       $v0
/* 4C41C 8004B81C 00C42021 */   addu      $a0, $a2, $a0
/* 4C420 8004B820 08012E42 */  j          .L8004B908
/* 4C424 8004B824 8FBF0018 */   lw        $ra, 0x18($sp)
.L8004B828:
/* 4C428 8004B828 0C02DD7A */  jal        widget_control
/* 4C42C 8004B82C 02202821 */   addu      $a1, $s1, $zero
/* 4C430 8004B830 14400035 */  bnez       $v0, .L8004B908
/* 4C434 8004B834 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4C438 8004B838 92030024 */  lbu        $v1, 0x24($s0)
/* 4C43C 8004B83C 24020004 */  addiu      $v0, $zero, 4
/* 4C440 8004B840 14620031 */  bne        $v1, $v0, .L8004B908
/* 4C444 8004B844 00001021 */   addu      $v0, $zero, $zero
/* 4C448 8004B848 3C020001 */  lui        $v0, 1
/* 4C44C 8004B84C 8E25000C */  lw         $a1, 0xc($s1)
/* 4C450 8004B850 34420200 */  ori        $v0, $v0, 0x200
/* 4C454 8004B854 00A21024 */  and        $v0, $a1, $v0
/* 4C458 8004B858 10400013 */  beqz       $v0, .L8004B8A8
/* 4C45C 8004B85C 3C020002 */   lui       $v0, 2
/* 4C460 8004B860 8E06000C */  lw         $a2, 0xc($s0)
/* 4C464 8004B864 10C00011 */  beqz       $a2, .L8004B8AC
/* 4C468 8004B868 34420100 */   ori       $v0, $v0, 0x100
/* 4C46C 8004B86C 8CC30040 */  lw         $v1, 0x40($a2)
/* 4C470 8004B870 90620028 */  lbu        $v0, 0x28($v1)
/* 4C474 8004B874 1440000C */  bnez       $v0, .L8004B8A8
/* 4C478 8004B878 3C020002 */   lui       $v0, 2
/* 4C47C 8004B87C 90620020 */  lbu        $v0, 0x20($v1)
/* 4C480 8004B880 2C420002 */  sltiu      $v0, $v0, 2
/* 4C484 8004B884 10400008 */  beqz       $v0, .L8004B8A8
/* 4C488 8004B888 3C020002 */   lui       $v0, 2
/* 4C48C 8004B88C 8CC30078 */  lw         $v1, 0x78($a2)
/* 4C490 8004B890 84640068 */  lh         $a0, 0x68($v1)
/* 4C494 8004B894 8C62006C */  lw         $v0, 0x6c($v1)
/* 4C498 8004B898 0040F809 */  jalr       $v0
/* 4C49C 8004B89C 00C42021 */   addu      $a0, $a2, $a0
/* 4C4A0 8004B8A0 08012E42 */  j          .L8004B908
/* 4C4A4 8004B8A4 8FBF0018 */   lw        $ra, 0x18($sp)
.L8004B8A8:
/* 4C4A8 8004B8A8 34420100 */  ori        $v0, $v0, 0x100
.L8004B8AC:
/* 4C4AC 8004B8AC 00A21024 */  and        $v0, $a1, $v0
/* 4C4B0 8004B8B0 10400014 */  beqz       $v0, .L8004B904
/* 4C4B4 8004B8B4 00001021 */   addu      $v0, $zero, $zero
/* 4C4B8 8004B8B8 8E05000C */  lw         $a1, 0xc($s0)
/* 4C4BC 8004B8BC 10A00012 */  beqz       $a1, .L8004B908
/* 4C4C0 8004B8C0 8FBF0018 */   lw        $ra, 0x18($sp)
/* 4C4C4 8004B8C4 8CA30040 */  lw         $v1, 0x40($a1)
/* 4C4C8 8004B8C8 90620028 */  lbu        $v0, 0x28($v1)
/* 4C4CC 8004B8CC 1440000E */  bnez       $v0, .L8004B908
/* 4C4D0 8004B8D0 00001021 */   addu      $v0, $zero, $zero
/* 4C4D4 8004B8D4 90620020 */  lbu        $v0, 0x20($v1)
/* 4C4D8 8004B8D8 2C420002 */  sltiu      $v0, $v0, 2
/* 4C4DC 8004B8DC 1040000A */  beqz       $v0, .L8004B908
/* 4C4E0 8004B8E0 00001021 */   addu      $v0, $zero, $zero
/* 4C4E4 8004B8E4 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C4E8 8004B8E8 84640070 */  lh         $a0, 0x70($v1)
/* 4C4EC 8004B8EC 8C620074 */  lw         $v0, 0x74($v1)
/* 4C4F0 8004B8F0 0040F809 */  jalr       $v0
/* 4C4F4 8004B8F4 00A42021 */   addu      $a0, $a1, $a0
/* 4C4F8 8004B8F8 08012E42 */  j          .L8004B908
/* 4C4FC 8004B8FC 8FBF0018 */   lw        $ra, 0x18($sp)
.L8004B900:
/* 4C500 8004B900 00001021 */  addu       $v0, $zero, $zero
.L8004B904:
/* 4C504 8004B904 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004B908:
/* 4C508 8004B908 8FB10014 */  lw         $s1, 0x14($sp)
/* 4C50C 8004B90C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C510 8004B910 03E00008 */  jr         $ra
/* 4C514 8004B914 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ret12_8004b918
/* 4C518 8004B918 03E00008 */  jr         $ra
/* 4C51C 8004B91C 2402000C */   addiu     $v0, $zero, 0xc

glabel func_8004B920
/* 4C520 8004B920 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4C524 8004B924 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4C528 8004B928 8CA20040 */  lw         $v0, 0x40($a1)
/* 4C52C 8004B92C 8C45001C */  lw         $a1, 0x1c($v0)
/* 4C530 8004B930 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C534 8004B934 84640068 */  lh         $a0, 0x68($v1)
/* 4C538 8004B938 8C62006C */  lw         $v0, 0x6c($v1)
/* 4C53C 8004B93C 0040F809 */  jalr       $v0
/* 4C540 8004B940 00A42021 */   addu      $a0, $a1, $a0
/* 4C544 8004B944 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4C548 8004B948 03E00008 */  jr         $ra
/* 4C54C 8004B94C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004B950
/* 4C550 8004B950 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4C554 8004B954 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4C558 8004B958 8CA20040 */  lw         $v0, 0x40($a1)
/* 4C55C 8004B95C 8C45001C */  lw         $a1, 0x1c($v0)
/* 4C560 8004B960 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C564 8004B964 84640070 */  lh         $a0, 0x70($v1)
/* 4C568 8004B968 8C620074 */  lw         $v0, 0x74($v1)
/* 4C56C 8004B96C 0040F809 */  jalr       $v0
/* 4C570 8004B970 00A42021 */   addu      $a0, $a1, $a0
/* 4C574 8004B974 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4C578 8004B978 03E00008 */  jr         $ra
/* 4C57C 8004B97C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004B980
/* 4C580 8004B980 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4C584 8004B984 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 4C588 8004B988 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 4C58C 8004B98C 2402001E */  addiu      $v0, $zero, 0x1e
/* 4C590 8004B990 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4C594 8004B994 AFB00018 */  sw         $s0, 0x18($sp)
/* 4C598 8004B998 8CB00040 */  lw         $s0, 0x40($a1)
/* 4C59C 8004B99C 2405073B */  addiu      $a1, $zero, 0x73b
/* 4C5A0 8004B9A0 3C073F80 */  lui        $a3, 0x3f80
/* 4C5A4 8004B9A4 00003021 */  addu       $a2, $zero, $zero
/* 4C5A8 8004B9A8 AFA20010 */  sw         $v0, 0x10($sp)
/* 4C5AC 8004B9AC 0C0156F4 */  jal        play_SFX
/* 4C5B0 8004B9B0 AFA00014 */   sw        $zero, 0x14($sp)
/* 4C5B4 8004B9B4 8E05001C */  lw         $a1, 0x1c($s0)
/* 4C5B8 8004B9B8 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C5BC 8004B9BC 84640058 */  lh         $a0, 0x58($v1)
/* 4C5C0 8004B9C0 8C62005C */  lw         $v0, 0x5c($v1)
/* 4C5C4 8004B9C4 0040F809 */  jalr       $v0
/* 4C5C8 8004B9C8 00A42021 */   addu      $a0, $a1, $a0
/* 4C5CC 8004B9CC 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4C5D0 8004B9D0 8FB00018 */  lw         $s0, 0x18($sp)
/* 4C5D4 8004B9D4 03E00008 */  jr         $ra
/* 4C5D8 8004B9D8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004B9DC
/* 4C5DC 8004B9DC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4C5E0 8004B9E0 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 4C5E4 8004B9E4 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 4C5E8 8004B9E8 2402001E */  addiu      $v0, $zero, 0x1e
/* 4C5EC 8004B9EC AFBF001C */  sw         $ra, 0x1c($sp)
/* 4C5F0 8004B9F0 AFB00018 */  sw         $s0, 0x18($sp)
/* 4C5F4 8004B9F4 8CB00040 */  lw         $s0, 0x40($a1)
/* 4C5F8 8004B9F8 2405073B */  addiu      $a1, $zero, 0x73b
/* 4C5FC 8004B9FC 3C073F80 */  lui        $a3, 0x3f80
/* 4C600 8004BA00 00003021 */  addu       $a2, $zero, $zero
/* 4C604 8004BA04 AFA20010 */  sw         $v0, 0x10($sp)
/* 4C608 8004BA08 0C0156F4 */  jal        play_SFX
/* 4C60C 8004BA0C AFA00014 */   sw        $zero, 0x14($sp)
/* 4C610 8004BA10 8E05001C */  lw         $a1, 0x1c($s0)
/* 4C614 8004BA14 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C618 8004BA18 84640060 */  lh         $a0, 0x60($v1)
/* 4C61C 8004BA1C 8C620064 */  lw         $v0, 0x64($v1)
/* 4C620 8004BA20 0040F809 */  jalr       $v0
/* 4C624 8004BA24 00A42021 */   addu      $a0, $a1, $a0
/* 4C628 8004BA28 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4C62C 8004BA2C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4C630 8004BA30 03E00008 */  jr         $ra
/* 4C634 8004BA34 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004BA38
/* 4C638 8004BA38 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4C63C 8004BA3C AFB20020 */  sw         $s2, 0x20($sp)
/* 4C640 8004BA40 00A09021 */  addu       $s2, $a1, $zero
/* 4C644 8004BA44 AFBF0024 */  sw         $ra, 0x24($sp)
/* 4C648 8004BA48 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4C64C 8004BA4C AFB00018 */  sw         $s0, 0x18($sp)
/* 4C650 8004BA50 8E500040 */  lw         $s0, 0x40($s2)
/* 4C654 8004BA54 8E05001C */  lw         $a1, 0x1c($s0)
/* 4C658 8004BA58 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C65C 8004BA5C 84640080 */  lh         $a0, 0x80($v1)
/* 4C660 8004BA60 8C620084 */  lw         $v0, 0x84($v1)
/* 4C664 8004BA64 0040F809 */  jalr       $v0
/* 4C668 8004BA68 00A42021 */   addu      $a0, $a1, $a0
/* 4C66C 8004BA6C 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 4C670 8004BA70 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 4C674 8004BA74 24050741 */  addiu      $a1, $zero, 0x741
/* 4C678 8004BA78 2403003C */  addiu      $v1, $zero, 0x3c
/* 4C67C 8004BA7C 00408821 */  addu       $s1, $v0, $zero
/* 4C680 8004BA80 3C073F80 */  lui        $a3, 0x3f80
/* 4C684 8004BA84 00003021 */  addu       $a2, $zero, $zero
/* 4C688 8004BA88 AFA30010 */  sw         $v1, 0x10($sp)
/* 4C68C 8004BA8C 0C0156F4 */  jal        play_SFX
/* 4C690 8004BA90 AFA00014 */   sw        $zero, 0x14($sp)
/* 4C694 8004BA94 92030024 */  lbu        $v1, 0x24($s0)
/* 4C698 8004BA98 2C620005 */  sltiu      $v0, $v1, 5
/* 4C69C 8004BA9C 10400019 */  beqz       $v0, .L8004BB04
/* 4C6A0 8004BAA0 3C02800E */   lui       $v0, %hi(D_800DD750)
/* 4C6A4 8004BAA4 2442D750 */  addiu      $v0, $v0, %lo(D_800DD750)
/* 4C6A8 8004BAA8 00031880 */  sll        $v1, $v1, 2
/* 4C6AC 8004BAAC 00621821 */  addu       $v1, $v1, $v0
/* 4C6B0 8004BAB0 8C640000 */  lw         $a0, ($v1)
/* 4C6B4 8004BAB4 00800008 */  jr         $a0
/* 4C6B8 8004BAB8 00000000 */   nop
/* 4C6BC 8004BABC 12200014 */  beqz       $s1, .L8004BB10
/* 4C6C0 8004BAC0 02401021 */   addu      $v0, $s2, $zero
/* 4C6C4 8004BAC4 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C6C8 8004BAC8 0C012B8E */  jal        func_8004AE38
/* 4C6CC 8004BACC 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C6D0 8004BAD0 08012EC4 */  j          .L8004BB10
/* 4C6D4 8004BAD4 02401021 */   addu      $v0, $s2, $zero
/* 4C6D8 8004BAD8 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C6DC 8004BADC 0C012B8E */  jal        func_8004AE38
/* 4C6E0 8004BAE0 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C6E4 8004BAE4 08012EC4 */  j          .L8004BB10
/* 4C6E8 8004BAE8 02201021 */   addu      $v0, $s1, $zero
/* 4C6EC 8004BAEC 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C6F0 8004BAF0 8C447DAC */  lw         $a0, %lo(title_screen_pointer)($v0)
/* 4C6F4 8004BAF4 0C012DAB */  jal        func_8004B6AC
/* 4C6F8 8004BAF8 02202821 */   addu      $a1, $s1, $zero
/* 4C6FC 8004BAFC 08012EC4 */  j          .L8004BB10
/* 4C700 8004BB00 02401021 */   addu      $v0, $s2, $zero
.L8004BB04:
/* 4C704 8004BB04 08012EC4 */  j          .L8004BB10
/* 4C708 8004BB08 00001021 */   addu      $v0, $zero, $zero
/* 4C70C 8004BB0C 02401021 */  addu       $v0, $s2, $zero
.L8004BB10:
/* 4C710 8004BB10 8FBF0024 */  lw         $ra, 0x24($sp)
/* 4C714 8004BB14 8FB20020 */  lw         $s2, 0x20($sp)
/* 4C718 8004BB18 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4C71C 8004BB1C 8FB00018 */  lw         $s0, 0x18($sp)
/* 4C720 8004BB20 03E00008 */  jr         $ra
/* 4C724 8004BB24 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004BB28
/* 4C728 8004BB28 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4C72C 8004BB2C AFB1001C */  sw         $s1, 0x1c($sp)
/* 4C730 8004BB30 00A08821 */  addu       $s1, $a1, $zero
/* 4C734 8004BB34 AFBF0020 */  sw         $ra, 0x20($sp)
/* 4C738 8004BB38 AFB00018 */  sw         $s0, 0x18($sp)
/* 4C73C 8004BB3C 8E300040 */  lw         $s0, 0x40($s1)
/* 4C740 8004BB40 8E05001C */  lw         $a1, 0x1c($s0)
/* 4C744 8004BB44 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C748 8004BB48 846400A0 */  lh         $a0, 0xa0($v1)
/* 4C74C 8004BB4C 8C6200A4 */  lw         $v0, 0xa4($v1)
/* 4C750 8004BB50 0040F809 */  jalr       $v0
/* 4C754 8004BB54 00A42021 */   addu      $a0, $a1, $a0
/* 4C758 8004BB58 92030024 */  lbu        $v1, 0x24($s0)
/* 4C75C 8004BB5C 00402821 */  addu       $a1, $v0, $zero
/* 4C760 8004BB60 2C620005 */  sltiu      $v0, $v1, 5
/* 4C764 8004BB64 1040001B */  beqz       $v0, .L8004BBD4
/* 4C768 8004BB68 3C02800E */   lui       $v0, %hi(D_800DD768)
/* 4C76C 8004BB6C 2442D768 */  addiu      $v0, $v0, %lo(D_800DD768)
/* 4C770 8004BB70 00031880 */  sll        $v1, $v1, 2
/* 4C774 8004BB74 00621821 */  addu       $v1, $v1, $v0
/* 4C778 8004BB78 8C640000 */  lw         $a0, ($v1)
/* 4C77C 8004BB7C 00800008 */  jr         $a0
/* 4C780 8004BB80 00000000 */   nop
/* 4C784 8004BB84 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C788 8004BB88 0C012B8E */  jal        func_8004AE38
/* 4C78C 8004BB8C 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C790 8004BB90 08012EF7 */  j          .L8004BBDC
/* 4C794 8004BB94 3C04800E */   lui       $a0, 0x800e
/* 4C798 8004BB98 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C79C 8004BB9C 0C012D51 */  jal        processIntroMenu
/* 4C7A0 8004BBA0 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C7A4 8004BBA4 08012EF7 */  j          .L8004BBDC
/* 4C7A8 8004BBA8 3C04800E */   lui       $a0, 0x800e
/* 4C7AC 8004BBAC 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C7B0 8004BBB0 0C012D9A */  jal        func_8004B668
/* 4C7B4 8004BBB4 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C7B8 8004BBB8 08012EF7 */  j          .L8004BBDC
/* 4C7BC 8004BBBC 3C04800E */   lui       $a0, 0x800e
/* 4C7C0 8004BBC0 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C7C4 8004BBC4 0C012DAB */  jal        func_8004B6AC
/* 4C7C8 8004BBC8 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C7CC 8004BBCC 08012EF7 */  j          .L8004BBDC
/* 4C7D0 8004BBD0 3C04800E */   lui       $a0, %hi(SFXStruct)
.L8004BBD4:
/* 4C7D4 8004BBD4 08012F00 */  j          .L8004BC00
/* 4C7D8 8004BBD8 00001021 */   addu      $v0, $zero, $zero
.L8004BBDC:
/* 4C7DC 8004BBDC 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 4C7E0 8004BBE0 24050740 */  addiu      $a1, $zero, 0x740
/* 4C7E4 8004BBE4 2402003C */  addiu      $v0, $zero, 0x3c
/* 4C7E8 8004BBE8 3C073F80 */  lui        $a3, 0x3f80
/* 4C7EC 8004BBEC 00003021 */  addu       $a2, $zero, $zero
/* 4C7F0 8004BBF0 AFA20010 */  sw         $v0, 0x10($sp)
/* 4C7F4 8004BBF4 0C0156F4 */  jal        play_SFX
/* 4C7F8 8004BBF8 AFA00014 */   sw        $zero, 0x14($sp)
/* 4C7FC 8004BBFC 02201021 */  addu       $v0, $s1, $zero
.L8004BC00:
/* 4C800 8004BC00 8FBF0020 */  lw         $ra, 0x20($sp)
/* 4C804 8004BC04 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4C808 8004BC08 8FB00018 */  lw         $s0, 0x18($sp)
/* 4C80C 8004BC0C 03E00008 */  jr         $ra
/* 4C810 8004BC10 27BD0028 */   addiu     $sp, $sp, 0x28

glabel titleScreen_caseSwitch
/* 4C814 8004BC14 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 4C818 8004BC18 AFB1001C */  sw         $s1, 0x1c($sp)
/* 4C81C 8004BC1C 00A08821 */  addu       $s1, $a1, $zero
/* 4C820 8004BC20 AFBF0020 */  sw         $ra, 0x20($sp)
/* 4C824 8004BC24 AFB00018 */  sw         $s0, 0x18($sp)
/* 4C828 8004BC28 8E300040 */  lw         $s0, 0x40($s1)
/* 4C82C 8004BC2C 8E05001C */  lw         $a1, 0x1c($s0)
/* 4C830 8004BC30 8CA30078 */  lw         $v1, 0x78($a1)
/* 4C834 8004BC34 84640078 */  lh         $a0, 0x78($v1)
/* 4C838 8004BC38 8C62007C */  lw         $v0, 0x7c($v1)
/* 4C83C 8004BC3C 0040F809 */  jalr       $v0
/* 4C840 8004BC40 00A42021 */   addu      $a0, $a1, $a0
/* 4C844 8004BC44 92030024 */  lbu        $v1, 0x24($s0)
/* 4C848 8004BC48 00402821 */  addu       $a1, $v0, $zero
/* 4C84C 8004BC4C 2C620005 */  sltiu      $v0, $v1, 5
/* 4C850 8004BC50 1040001F */  beqz       $v0, .L8004BCD0
/* 4C854 8004BC54 3C02800E */   lui       $v0, %hi(D_800DD780)
/* 4C858 8004BC58 2442D780 */  addiu      $v0, $v0, %lo(D_800DD780)
/* 4C85C 8004BC5C 00031880 */  sll        $v1, $v1, 2
/* 4C860 8004BC60 00621821 */  addu       $v1, $v1, $v0
/* 4C864 8004BC64 8C640000 */  lw         $a0, ($v1)
/* 4C868 8004BC68 00800008 */  jr         $a0
/* 4C86C 8004BC6C 00000000 */   nop
/* 4C870 8004BC70 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C874 8004BC74 0C012B8E */  jal        func_8004AE38
/* 4C878 8004BC78 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C87C 8004BC7C 08012F36 */  j          .L8004BCD8
/* 4C880 8004BC80 3C04800E */   lui       $a0, 0x800e
/* 4C884 8004BC84 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C888 8004BC88 0C012D51 */  jal        processIntroMenu
/* 4C88C 8004BC8C 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C890 8004BC90 08012F36 */  j          .L8004BCD8
/* 4C894 8004BC94 3C04800E */   lui       $a0, 0x800e
/* 4C898 8004BC98 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C89C 8004BC9C 0C012D9A */  jal        func_8004B668
/* 4C8A0 8004BCA0 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C8A4 8004BCA4 08012F36 */  j          .L8004BCD8
/* 4C8A8 8004BCA8 3C04800E */   lui       $a0, 0x800e
/* 4C8AC 8004BCAC 2402000A */  addiu      $v0, $zero, 0xa
/* 4C8B0 8004BCB0 A2020024 */  sb         $v0, 0x24($s0)
/* 4C8B4 8004BCB4 08012F3F */  j          .L8004BCFC
/* 4C8B8 8004BCB8 00A01021 */   addu      $v0, $a1, $zero
/* 4C8BC 8004BCBC 3C02800E */  lui        $v0, %hi(title_screen_pointer)
/* 4C8C0 8004BCC0 0C012DAB */  jal        func_8004B6AC
/* 4C8C4 8004BCC4 8C447DAC */   lw        $a0, %lo(title_screen_pointer)($v0)
/* 4C8C8 8004BCC8 08012F36 */  j          .L8004BCD8
/* 4C8CC 8004BCCC 3C04800E */   lui       $a0, %hi(SFXStruct)
.L8004BCD0:
/* 4C8D0 8004BCD0 08012F3F */  j          .L8004BCFC
/* 4C8D4 8004BCD4 00001021 */   addu      $v0, $zero, $zero
.L8004BCD8:
/* 4C8D8 8004BCD8 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 4C8DC 8004BCDC 24050740 */  addiu      $a1, $zero, 0x740
/* 4C8E0 8004BCE0 2402003C */  addiu      $v0, $zero, 0x3c
/* 4C8E4 8004BCE4 3C073F80 */  lui        $a3, 0x3f80
/* 4C8E8 8004BCE8 00003021 */  addu       $a2, $zero, $zero
/* 4C8EC 8004BCEC AFA20010 */  sw         $v0, 0x10($sp)
/* 4C8F0 8004BCF0 0C0156F4 */  jal        play_SFX
/* 4C8F4 8004BCF4 AFA00014 */   sw        $zero, 0x14($sp)
/* 4C8F8 8004BCF8 02201021 */  addu       $v0, $s1, $zero
.L8004BCFC:
/* 4C8FC 8004BCFC 8FBF0020 */  lw         $ra, 0x20($sp)
/* 4C900 8004BD00 8FB1001C */  lw         $s1, 0x1c($sp)
/* 4C904 8004BD04 8FB00018 */  lw         $s0, 0x18($sp)
/* 4C908 8004BD08 03E00008 */  jr         $ra
/* 4C90C 8004BD0C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_8004BD10
/* 4C910 8004BD10 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4C914 8004BD14 AFB00010 */  sw         $s0, 0x10($sp)
/* 4C918 8004BD18 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4C91C 8004BD1C 0C02E658 */  jal        widget_menu_build
/* 4C920 8004BD20 00808021 */   addu      $s0, $a0, $zero
/* 4C924 8004BD24 3C03800E */  lui        $v1, %hi(D_800DD7D0)
/* 4C928 8004BD28 2463D7D0 */  addiu      $v1, $v1, %lo(D_800DD7D0)
/* 4C92C 8004BD2C 02002021 */  addu       $a0, $s0, $zero
/* 4C930 8004BD30 0C012F69 */  jal        func_8004BDA4
/* 4C934 8004BD34 AE030078 */   sw        $v1, 0x78($s0)
/* 4C938 8004BD38 02001021 */  addu       $v0, $s0, $zero
/* 4C93C 8004BD3C 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4C940 8004BD40 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C944 8004BD44 03E00008 */  jr         $ra
/* 4C948 8004BD48 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004BD4C
/* 4C94C 8004BD4C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4C950 8004BD50 AFB00010 */  sw         $s0, 0x10($sp)
/* 4C954 8004BD54 00808021 */  addu       $s0, $a0, $zero
/* 4C958 8004BD58 3C02800E */  lui        $v0, %hi(D_800DD7D0)
/* 4C95C 8004BD5C 2442D7D0 */  addiu      $v0, $v0, %lo(D_800DD7D0)
/* 4C960 8004BD60 AFBF0018 */  sw         $ra, 0x18($sp)
/* 4C964 8004BD64 AFB10014 */  sw         $s1, 0x14($sp)
/* 4C968 8004BD68 8E030040 */  lw         $v1, 0x40($s0)
/* 4C96C 8004BD6C 00A08821 */  addu       $s1, $a1, $zero
/* 4C970 8004BD70 AE020078 */  sw         $v0, 0x78($s0)
/* 4C974 8004BD74 00602021 */  addu       $a0, $v1, $zero
/* 4C978 8004BD78 0C026262 */  jal        passToFree
/* 4C97C 8004BD7C AC600000 */   sw        $zero, ($v1)
/* 4C980 8004BD80 02002021 */  addu       $a0, $s0, $zero
/* 4C984 8004BD84 02202821 */  addu       $a1, $s1, $zero
/* 4C988 8004BD88 0C02E66C */  jal        widget_menu_free
/* 4C98C 8004BD8C AE000040 */   sw        $zero, 0x40($s0)
/* 4C990 8004BD90 8FBF0018 */  lw         $ra, 0x18($sp)
/* 4C994 8004BD94 8FB10014 */  lw         $s1, 0x14($sp)
/* 4C998 8004BD98 8FB00010 */  lw         $s0, 0x10($sp)
/* 4C99C 8004BD9C 03E00008 */  jr         $ra
/* 4C9A0 8004BDA0 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004BDA4
/* 4C9A4 8004BDA4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 4C9A8 8004BDA8 AFB20030 */  sw         $s2, 0x30($sp)
/* 4C9AC 8004BDAC 00809021 */  addu       $s2, $a0, $zero
/* 4C9B0 8004BDB0 24040004 */  addiu      $a0, $zero, 4
/* 4C9B4 8004BDB4 AFBF0034 */  sw         $ra, 0x34($sp)
/* 4C9B8 8004BDB8 AFB1002C */  sw         $s1, 0x2c($sp)
/* 4C9BC 8004BDBC 0C026259 */  jal        passToMalloc
/* 4C9C0 8004BDC0 AFB00028 */   sw        $s0, 0x28($sp)
/* 4C9C4 8004BDC4 00002021 */  addu       $a0, $zero, $zero
/* 4C9C8 8004BDC8 00408821 */  addu       $s1, $v0, $zero
/* 4C9CC 8004BDCC 0C0271BF */  jal        cont_delay
/* 4C9D0 8004BDD0 AE510040 */   sw        $s1, 0x40($s2)
/* 4C9D4 8004BDD4 0C026259 */  jal        passToMalloc
/* 4C9D8 8004BDD8 2404007C */   addiu     $a0, $zero, 0x7c
/* 4C9DC 8004BDDC 00402021 */  addu       $a0, $v0, $zero
/* 4C9E0 8004BDE0 0C02E68C */  jal        widgetscrollmenu_init
/* 4C9E4 8004BDE4 2405000A */   addiu     $a1, $zero, 0xa
/* 4C9E8 8004BDE8 00402021 */  addu       $a0, $v0, $zero
/* 4C9EC 8004BDEC 24050067 */  addiu      $a1, $zero, 0x67
/* 4C9F0 8004BDF0 24060040 */  addiu      $a2, $zero, 0x40
/* 4C9F4 8004BDF4 24070040 */  addiu      $a3, $zero, 0x40
/* 4C9F8 8004BDF8 241000FF */  addiu      $s0, $zero, 0xff
/* 4C9FC 8004BDFC AE220000 */  sw         $v0, ($s1)
/* 4CA00 8004BE00 240200C5 */  addiu      $v0, $zero, 0xc5
/* 4CA04 8004BE04 240300AE */  addiu      $v1, $zero, 0xae
/* 4CA08 8004BE08 AFA20014 */  sw         $v0, 0x14($sp)
/* 4CA0C 8004BE0C 240200B0 */  addiu      $v0, $zero, 0xb0
/* 4CA10 8004BE10 AFA2001C */  sw         $v0, 0x1c($sp)
/* 4CA14 8004BE14 2402000F */  addiu      $v0, $zero, 0xf
/* 4CA18 8004BE18 AFB00010 */  sw         $s0, 0x10($sp)
/* 4CA1C 8004BE1C AFA30018 */  sw         $v1, 0x18($sp)
/* 4CA20 8004BE20 AFB00020 */  sw         $s0, 0x20($sp)
/* 4CA24 8004BE24 0C02F085 */  jal        set_widgetSubstruct8
/* 4CA28 8004BE28 AFA20024 */   sw        $v0, 0x24($sp)
/* 4CA2C 8004BE2C 8E280000 */  lw         $t0, ($s1)
/* 4CA30 8004BE30 24050067 */  addiu      $a1, $zero, 0x67
/* 4CA34 8004BE34 8D030078 */  lw         $v1, 0x78($t0)
/* 4CA38 8004BE38 24060046 */  addiu      $a2, $zero, 0x46
/* 4CA3C 8004BE3C 84640048 */  lh         $a0, 0x48($v1)
/* 4CA40 8004BE40 2407003C */  addiu      $a3, $zero, 0x3c
/* 4CA44 8004BE44 AFB00010 */  sw         $s0, 0x10($sp)
/* 4CA48 8004BE48 8C62004C */  lw         $v0, 0x4c($v1)
/* 4CA4C 8004BE4C 0040F809 */  jalr       $v0
/* 4CA50 8004BE50 01042021 */   addu      $a0, $t0, $a0
/* 4CA54 8004BE54 0C026259 */  jal        passToMalloc
/* 4CA58 8004BE58 2404007C */   addiu     $a0, $zero, 0x7c
/* 4CA5C 8004BE5C 24040100 */  addiu      $a0, $zero, 0x100
/* 4CA60 8004BE60 0C0290E2 */  jal        get_borg_8
/* 4CA64 8004BE64 00408021 */   addu      $s0, $v0, $zero
/* 4CA68 8004BE68 02002021 */  addu       $a0, $s0, $zero
/* 4CA6C 8004BE6C 0C02E518 */  jal        borg8_widget
/* 4CA70 8004BE70 00402821 */   addu      $a1, $v0, $zero
/* 4CA74 8004BE74 00408021 */  addu       $s0, $v0, $zero
/* 4CA78 8004BE78 8E030078 */  lw         $v1, 0x78($s0)
/* 4CA7C 8004BE7C 84640018 */  lh         $a0, 0x18($v1)
/* 4CA80 8004BE80 8C62001C */  lw         $v0, 0x1c($v1)
/* 4CA84 8004BE84 0040F809 */  jalr       $v0
/* 4CA88 8004BE88 02042021 */   addu      $a0, $s0, $a0
/* 4CA8C 8004BE8C 02002021 */  addu       $a0, $s0, $zero
/* 4CA90 8004BE90 00021042 */  srl        $v0, $v0, 1
/* 4CA94 8004BE94 3042FFFF */  andi       $v0, $v0, 0xffff
/* 4CA98 8004BE98 240500A0 */  addiu      $a1, $zero, 0xa0
/* 4CA9C 8004BE9C 00A22823 */  subu       $a1, $a1, $v0
/* 4CAA0 8004BEA0 0C02DD3F */  jal        set_widget_coords
/* 4CAA4 8004BEA4 24060032 */   addiu     $a2, $zero, 0x32
/* 4CAA8 8004BEA8 8E430078 */  lw         $v1, 0x78($s2)
/* 4CAAC 8004BEAC 02002821 */  addu       $a1, $s0, $zero
/* 4CAB0 8004BEB0 84640030 */  lh         $a0, 0x30($v1)
/* 4CAB4 8004BEB4 8C620034 */  lw         $v0, 0x34($v1)
/* 4CAB8 8004BEB8 0040F809 */  jalr       $v0
/* 4CABC 8004BEBC 02442021 */   addu      $a0, $s2, $a0
/* 4CAC0 8004BEC0 240500A0 */  addiu      $a1, $zero, 0xa0
/* 4CAC4 8004BEC4 8E240000 */  lw         $a0, ($s1)
/* 4CAC8 8004BEC8 0C02DD3F */  jal        set_widget_coords
/* 4CACC 8004BECC 2406005A */   addiu     $a2, $zero, 0x5a
/* 4CAD0 8004BED0 0C013052 */  jal        theatre_menu
/* 4CAD4 8004BED4 02402021 */   addu      $a0, $s2, $zero
/* 4CAD8 8004BED8 8E220000 */  lw         $v0, ($s1)
/* 4CADC 8004BEDC 8C430040 */  lw         $v1, 0x40($v0)
/* 4CAE0 8004BEE0 94640020 */  lhu        $a0, 0x20($v1)
/* 4CAE4 8004BEE4 5480000D */  bnel       $a0, $zero, .L8004BF1C
/* 4CAE8 8004BEE8 8E240000 */   lw        $a0, ($s1)
/* 4CAEC 8004BEEC 0C026259 */  jal        passToMalloc
/* 4CAF0 8004BEF0 2404007C */   addiu     $a0, $zero, 0x7c
/* 4CAF4 8004BEF4 3C03800F */  lui        $v1, %hi(commonstringsmirror)
/* 4CAF8 8004BEF8 8C6688F4 */  lw         $a2, %lo(commonstringsmirror)($v1)
/* 4CAFC 8004BEFC 00402021 */  addu       $a0, $v0, $zero
/* 4CB00 8004BF00 8CC502B0 */  lw         $a1, 0x2b0($a2)
/* 4CB04 8004BF04 0C02DFC8 */  jal        widgetcliptext_init
/* 4CB08 8004BF08 24060190 */   addiu     $a2, $zero, 0x190
/* 4CB0C 8004BF0C 8E240000 */  lw         $a0, ($s1)
/* 4CB10 8004BF10 0C02E885 */  jal        link_widget_text
/* 4CB14 8004BF14 00402821 */   addu      $a1, $v0, $zero
/* 4CB18 8004BF18 8E240000 */  lw         $a0, ($s1)
.L8004BF1C:
/* 4CB1C 8004BF1C 0C02EFF2 */  jal        func_800BBFC8
/* 4CB20 8004BF20 24050005 */   addiu     $a1, $zero, 5
/* 4CB24 8004BF24 8E240000 */  lw         $a0, ($s1)
/* 4CB28 8004BF28 0C02E8D4 */  jal        func_800BA350
/* 4CB2C 8004BF2C 24050004 */   addiu     $a1, $zero, 4
/* 4CB30 8004BF30 8E250000 */  lw         $a1, ($s1)
/* 4CB34 8004BF34 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CB38 8004BF38 84640028 */  lh         $a0, 0x28($v1)
/* 4CB3C 8004BF3C 8C62002C */  lw         $v0, 0x2c($v1)
/* 4CB40 8004BF40 0040F809 */  jalr       $v0
/* 4CB44 8004BF44 00A42021 */   addu      $a0, $a1, $a0
/* 4CB48 8004BF48 8E430078 */  lw         $v1, 0x78($s2)
/* 4CB4C 8004BF4C 8E250000 */  lw         $a1, ($s1)
/* 4CB50 8004BF50 84640030 */  lh         $a0, 0x30($v1)
/* 4CB54 8004BF54 8C620034 */  lw         $v0, 0x34($v1)
/* 4CB58 8004BF58 0040F809 */  jalr       $v0
/* 4CB5C 8004BF5C 02442021 */   addu      $a0, $s2, $a0
/* 4CB60 8004BF60 3C038005 */  lui        $v1, %hi(func_8004C2C0)
/* 4CB64 8004BF64 2463C2C0 */  addiu      $v1, $v1, %lo(func_8004C2C0)
/* 4CB68 8004BF68 3C028005 */  lui        $v0, %hi(func_8004C2F0)
/* 4CB6C 8004BF6C 2442C2F0 */  addiu      $v0, $v0, %lo(func_8004C2F0)
/* 4CB70 8004BF70 AE430010 */  sw         $v1, 0x10($s2)
/* 4CB74 8004BF74 3C038005 */  lui        $v1, %hi(func_8004C320)
/* 4CB78 8004BF78 2463C320 */  addiu      $v1, $v1, %lo(func_8004C320)
/* 4CB7C 8004BF7C AE420014 */  sw         $v0, 0x14($s2)
/* 4CB80 8004BF80 3C028005 */  lui        $v0, %hi(func_8004C350)
/* 4CB84 8004BF84 2442C350 */  addiu      $v0, $v0, %lo(func_8004C350)
/* 4CB88 8004BF88 AE430008 */  sw         $v1, 8($s2)
/* 4CB8C 8004BF8C 3C038005 */  lui        $v1, %hi(func_8004C4A0)
/* 4CB90 8004BF90 2463C4A0 */  addiu      $v1, $v1, %lo(func_8004C4A0)
/* 4CB94 8004BF94 AE42000C */  sw         $v0, 0xc($s2)
/* 4CB98 8004BF98 3C028005 */  lui        $v0, %hi(func_8004C38C)
/* 4CB9C 8004BF9C 2442C38C */  addiu      $v0, $v0, %lo(func_8004C38C)
/* 4CBA0 8004BFA0 AE430020 */  sw         $v1, 0x20($s2)
/* 4CBA4 8004BFA4 3C038005 */  lui        $v1, %hi(func_8004C380)
/* 4CBA8 8004BFA8 8E450078 */  lw         $a1, 0x78($s2)
/* 4CBAC 8004BFAC 2463C380 */  addiu      $v1, $v1, %lo(func_8004C380)
/* 4CBB0 8004BFB0 AE420018 */  sw         $v0, 0x18($s2)
/* 4CBB4 8004BFB4 AE43001C */  sw         $v1, 0x1c($s2)
/* 4CBB8 8004BFB8 84A40028 */  lh         $a0, 0x28($a1)
/* 4CBBC 8004BFBC 8CA2002C */  lw         $v0, 0x2c($a1)
/* 4CBC0 8004BFC0 0040F809 */  jalr       $v0
/* 4CBC4 8004BFC4 02442021 */   addu      $a0, $s2, $a0
/* 4CBC8 8004BFC8 8FBF0034 */  lw         $ra, 0x34($sp)
/* 4CBCC 8004BFCC 8FB20030 */  lw         $s2, 0x30($sp)
/* 4CBD0 8004BFD0 8FB1002C */  lw         $s1, 0x2c($sp)
/* 4CBD4 8004BFD4 8FB00028 */  lw         $s0, 0x28($sp)
/* 4CBD8 8004BFD8 03E00008 */  jr         $ra
/* 4CBDC 8004BFDC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8004BFE0
/* 4CBE0 8004BFE0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4CBE4 8004BFE4 00063400 */  sll        $a2, $a2, 0x10
/* 4CBE8 8004BFE8 00063403 */  sra        $a2, $a2, 0x10
/* 4CBEC 8004BFEC 00073C00 */  sll        $a3, $a3, 0x10
/* 4CBF0 8004BFF0 3C02800F */  lui        $v0, %hi(D_800ED620)
/* 4CBF4 8004BFF4 87A80032 */  lh         $t0, 0x32($sp)
/* 4CBF8 8004BFF8 8C43D620 */  lw         $v1, %lo(D_800ED620)($v0)
/* 4CBFC 8004BFFC 87A20036 */  lh         $v0, 0x36($sp)
/* 4CC00 8004C000 00073C03 */  sra        $a3, $a3, 0x10
/* 4CC04 8004C004 14600006 */  bnez       $v1, .L8004C020
/* 4CC08 8004C008 AFBF0018 */   sw        $ra, 0x18($sp)
/* 4CC0C 8004C00C AFA80010 */  sw         $t0, 0x10($sp)
/* 4CC10 8004C010 0C02DE14 */  jal        widget_func_8
/* 4CC14 8004C014 AFA20014 */   sw        $v0, 0x14($sp)
/* 4CC18 8004C018 0801300A */  j          .L8004C028
/* 4CC1C 8004C01C 8FBF0018 */   lw        $ra, 0x18($sp)
.L8004C020:
/* 4CC20 8004C020 00A01021 */  addu       $v0, $a1, $zero
/* 4CC24 8004C024 8FBF0018 */  lw         $ra, 0x18($sp)
.L8004C028:
/* 4CC28 8004C028 03E00008 */  jr         $ra
/* 4CC2C 8004C02C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004C030
/* 4CC30 8004C030 3C02800F */  lui        $v0, %hi(D_800ED620)
/* 4CC34 8004C034 8C43D620 */  lw         $v1, %lo(D_800ED620)($v0)
/* 4CC38 8004C038 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CC3C 8004C03C 14600005 */  bnez       $v1, .L8004C054
/* 4CC40 8004C040 AFBF0010 */   sw        $ra, 0x10($sp)
/* 4CC44 8004C044 0C02DE51 */  jal        func_800B7944
/* 4CC48 8004C048 00000000 */   nop
/* 4CC4C 8004C04C 08013017 */  j          .L8004C05C
/* 4CC50 8004C050 8FBF0010 */   lw        $ra, 0x10($sp)
.L8004C054:
/* 4CC54 8004C054 24020003 */  addiu      $v0, $zero, 3
/* 4CC58 8004C058 8FBF0010 */  lw         $ra, 0x10($sp)
.L8004C05C:
/* 4CC5C 8004C05C 03E00008 */  jr         $ra
/* 4CC60 8004C060 27BD0018 */   addiu     $sp, $sp, 0x18

glabel show_available_cinematics
/* 4CC64 8004C064 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4CC68 8004C068 AFBF001C */  sw         $ra, 0x1c($sp)
/* 4CC6C 8004C06C AFB20018 */  sw         $s2, 0x18($sp)
/* 4CC70 8004C070 AFB10014 */  sw         $s1, 0x14($sp)
/* 4CC74 8004C074 AFB00010 */  sw         $s0, 0x10($sp)
/* 4CC78 8004C078 8C910040 */  lw         $s1, 0x40($a0)
/* 4CC7C 8004C07C 8E220000 */  lw         $v0, ($s1)
/* 4CC80 8004C080 1040002B */  beqz       $v0, .L8004C130
/* 4CC84 8004C084 00A08021 */   addu      $s0, $a1, $zero
/* 4CC88 8004C088 92030000 */  lbu        $v1, ($s0)
/* 4CC8C 8004C08C 24020020 */  addiu      $v0, $zero, 0x20
/* 4CC90 8004C090 10620006 */  beq        $v1, $v0, .L8004C0AC
/* 4CC94 8004C094 02002021 */   addu      $a0, $s0, $zero
/* 4CC98 8004C098 24030020 */  addiu      $v1, $zero, 0x20
/* 4CC9C 8004C09C 26100001 */  addiu      $s0, $s0, 1
.L8004C0A0:
/* 4CCA0 8004C0A0 92020000 */  lbu        $v0, ($s0)
/* 4CCA4 8004C0A4 5443FFFE */  bnel       $v0, $v1, .L8004C0A0
/* 4CCA8 8004C0A8 26100001 */   addiu     $s0, $s0, 1
.L8004C0AC:
/* 4CCAC 8004C0AC A2000000 */  sb         $zero, ($s0)
/* 4CCB0 8004C0B0 0C016BB4 */  jal        get_flag_from_text
/* 4CCB4 8004C0B4 26100001 */   addiu     $s0, $s0, 1
/* 4CCB8 8004C0B8 00409021 */  addu       $s2, $v0, $zero
/* 4CCBC 8004C0BC 0C009168 */  jal        get_event_flag
/* 4CCC0 8004C0C0 3244FFFF */   andi      $a0, $s2, 0xffff
/* 4CCC4 8004C0C4 10400010 */  beqz       $v0, .L8004C108
/* 4CCC8 8004C0C8 00000000 */   nop
/* 4CCCC 8004C0CC 0C026259 */  jal        passToMalloc
/* 4CCD0 8004C0D0 2404007C */   addiu     $a0, $zero, 0x7c
/* 4CCD4 8004C0D4 00402021 */  addu       $a0, $v0, $zero
/* 4CCD8 8004C0D8 02002821 */  addu       $a1, $s0, $zero
/* 4CCDC 8004C0DC 0C02DFC8 */  jal        widgetcliptext_init
/* 4CCE0 8004C0E0 24060190 */   addiu     $a2, $zero, 0x190
/* 4CCE4 8004C0E4 00408021 */  addu       $s0, $v0, $zero
/* 4CCE8 8004C0E8 8E240000 */  lw         $a0, ($s1)
/* 4CCEC 8004C0EC 0C02E885 */  jal        link_widget_text
/* 4CCF0 8004C0F0 02002821 */   addu      $a1, $s0, $zero
/* 4CCF4 8004C0F4 3C028005 */  lui        $v0, %hi(choose_cinematic)
/* 4CCF8 8004C0F8 2442C3F4 */  addiu      $v0, $v0, %lo(choose_cinematic)
/* 4CCFC 8004C0FC A612005E */  sh         $s2, 0x5e($s0)
/* 4CD00 8004C100 0801304C */  j          .L8004C130
/* 4CD04 8004C104 AE020018 */   sw        $v0, 0x18($s0)
.L8004C108:
/* 4CD08 8004C108 0C026259 */  jal        passToMalloc
/* 4CD0C 8004C10C 2404007C */   addiu     $a0, $zero, 0x7c
/* 4CD10 8004C110 00402021 */  addu       $a0, $v0, $zero
/* 4CD14 8004C114 3C05800E */  lui        $a1, %hi(D_800DD7A0)
/* 4CD18 8004C118 24A5D7A0 */  addiu      $a1, $a1, %lo(D_800DD7A0)
/* 4CD1C 8004C11C 0C02DFC8 */  jal        widgetcliptext_init
/* 4CD20 8004C120 24060190 */   addiu     $a2, $zero, 0x190
/* 4CD24 8004C124 8E240000 */  lw         $a0, ($s1)
/* 4CD28 8004C128 0C02E885 */  jal        link_widget_text
/* 4CD2C 8004C12C 00402821 */   addu      $a1, $v0, $zero
.L8004C130:
/* 4CD30 8004C130 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4CD34 8004C134 8FB20018 */  lw         $s2, 0x18($sp)
/* 4CD38 8004C138 8FB10014 */  lw         $s1, 0x14($sp)
/* 4CD3C 8004C13C 8FB00010 */  lw         $s0, 0x10($sp)
/* 4CD40 8004C140 03E00008 */  jr         $ra
/* 4CD44 8004C144 27BD0020 */   addiu     $sp, $sp, 0x20

glabel theatre_menu
/* 4CD48 8004C148 27BDFEC8 */  addiu      $sp, $sp, -0x138
/* 4CD4C 8004C14C AFB5012C */  sw         $s5, 0x12c($sp)
/* 4CD50 8004C150 0080A821 */  addu       $s5, $a0, $zero
/* 4CD54 8004C154 AFB00118 */  sw         $s0, 0x118($sp)
/* 4CD58 8004C158 3C10B200 */  lui        $s0, %hi(cinematic_text+0x60)
/* 4CD5C 8004C15C 2610B1A0 */  addiu      $s0, $s0, %lo(cinematic_text+0x60)
/* 4CD60 8004C160 AFB1011C */  sw         $s1, 0x11c($sp)
/* 4CD64 8004C164 3C11B200 */  lui        $s1, %hi(cinematic_text)
/* 4CD68 8004C168 2631B140 */  addiu      $s1, $s1, %lo(cinematic_text)
/* 4CD6C 8004C16C 02118023 */  subu       $s0, $s0, $s1
/* 4CD70 8004C170 02002021 */  addu       $a0, $s0, $zero
/* 4CD74 8004C174 AFB20120 */  sw         $s2, 0x120($sp)
/* 4CD78 8004C178 3C12800E */  lui        $s2, %hi(D_800DD7B4)
/* 4CD7C 8004C17C AFB30124 */  sw         $s3, 0x124($sp)
/* 4CD80 8004C180 2653D7B4 */  addiu      $s3, $s2, %lo(D_800DD7B4)
/* 4CD84 8004C184 02602821 */  addu       $a1, $s3, $zero
/* 4CD88 8004C188 240600B7 */  addiu      $a2, $zero, 0xb7
/* 4CD8C 8004C18C AFBF0130 */  sw         $ra, 0x130($sp)
/* 4CD90 8004C190 0C025F9C */  jal        Malloc
/* 4CD94 8004C194 AFB40128 */   sw        $s4, 0x128($sp)
/* 4CD98 8004C198 0040A021 */  addu       $s4, $v0, $zero
/* 4CD9C 8004C19C 02802021 */  addu       $a0, $s4, $zero
/* 4CDA0 8004C1A0 02202821 */  addu       $a1, $s1, $zero
/* 4CDA4 8004C1A4 02003021 */  addu       $a2, $s0, $zero
/* 4CDA8 8004C1A8 24070001 */  addiu      $a3, $zero, 1
/* 4CDAC 8004C1AC 240200C0 */  addiu      $v0, $zero, 0xc0
/* 4CDB0 8004C1B0 AFB30010 */  sw         $s3, 0x10($sp)
/* 4CDB4 8004C1B4 0C027269 */  jal        RomCopy
/* 4CDB8 8004C1B8 AFA20014 */   sw        $v0, 0x14($sp)
/* 4CDBC 8004C1BC 00009821 */  addu       $s3, $zero, $zero
.L8004C1C0:
/* 4CDC0 8004C1C0 02931821 */  addu       $v1, $s4, $s3
/* 4CDC4 8004C1C4 90640000 */  lbu        $a0, ($v1)
/* 4CDC8 8004C1C8 2402002A */  addiu      $v0, $zero, 0x2a
/* 4CDCC 8004C1CC 5482FFFC */  bnel       $a0, $v0, .L8004C1C0
/* 4CDD0 8004C1D0 26730001 */   addiu     $s3, $s3, 1
/* 4CDD4 8004C1D4 90620001 */  lbu        $v0, 1($v1)
/* 4CDD8 8004C1D8 5444FFF9 */  bnel       $v0, $a0, .L8004C1C0
/* 4CDDC 8004C1DC 26730001 */   addiu     $s3, $s3, 1
/* 4CDE0 8004C1E0 90640002 */  lbu        $a0, 2($v1)
/* 4CDE4 8004C1E4 5482FFF6 */  bnel       $a0, $v0, .L8004C1C0
/* 4CDE8 8004C1E8 26730001 */   addiu     $s3, $s3, 1
/* 4CDEC 8004C1EC 90650003 */  lbu        $a1, 3($v1)
/* 4CDF0 8004C1F0 54A4FFF3 */  bnel       $a1, $a0, .L8004C1C0
/* 4CDF4 8004C1F4 26730001 */   addiu     $s3, $s3, 1
/* 4CDF8 8004C1F8 90620004 */  lbu        $v0, 4($v1)
/* 4CDFC 8004C1FC 5445FFF0 */  bnel       $v0, $a1, .L8004C1C0
/* 4CE00 8004C200 26730001 */   addiu     $s3, $s3, 1
/* 4CE04 8004C204 1260001F */  beqz       $s3, .L8004C284
/* 4CE08 8004C208 00008021 */   addu      $s0, $zero, $zero
/* 4CE0C 8004C20C 02901021 */  addu       $v0, $s4, $s0
.L8004C210:
/* 4CE10 8004C210 26100001 */  addiu      $s0, $s0, 1
/* 4CE14 8004C214 27A40018 */  addiu      $a0, $sp, 0x18
/* 4CE18 8004C218 00002821 */  addu       $a1, $zero, $zero
/* 4CE1C 8004C21C 24060100 */  addiu      $a2, $zero, 0x100
/* 4CE20 8004C220 0C026380 */  jal        Calloc
/* 4CE24 8004C224 90510000 */   lbu       $s1, ($v0)
/* 4CE28 8004C228 1220000B */  beqz       $s1, .L8004C258
/* 4CE2C 8004C22C 00003021 */   addu      $a2, $zero, $zero
/* 4CE30 8004C230 27A70018 */  addiu      $a3, $sp, 0x18
.L8004C234:
/* 4CE34 8004C234 00E62821 */  addu       $a1, $a3, $a2
/* 4CE38 8004C238 24C20001 */  addiu      $v0, $a2, 1
/* 4CE3C 8004C23C 304600FF */  andi       $a2, $v0, 0xff
/* 4CE40 8004C240 02901821 */  addu       $v1, $s4, $s0
/* 4CE44 8004C244 26100001 */  addiu      $s0, $s0, 1
/* 4CE48 8004C248 90640000 */  lbu        $a0, ($v1)
/* 4CE4C 8004C24C 00D1102B */  sltu       $v0, $a2, $s1
/* 4CE50 8004C250 1440FFF8 */  bnez       $v0, .L8004C234
/* 4CE54 8004C254 A0A40000 */   sb        $a0, ($a1)
.L8004C258:
/* 4CE58 8004C258 27A40018 */  addiu      $a0, $sp, 0x18
/* 4CE5C 8004C25C 00002821 */  addu       $a1, $zero, $zero
/* 4CE60 8004C260 00003021 */  addu       $a2, $zero, $zero
/* 4CE64 8004C264 0C035669 */  jal        decrypt_string
/* 4CE68 8004C268 02203821 */   addu      $a3, $s1, $zero
/* 4CE6C 8004C26C 02A02021 */  addu       $a0, $s5, $zero
/* 4CE70 8004C270 0C013019 */  jal        show_available_cinematics
/* 4CE74 8004C274 27A50018 */   addiu     $a1, $sp, 0x18
/* 4CE78 8004C278 0213102B */  sltu       $v0, $s0, $s3
/* 4CE7C 8004C27C 1440FFE4 */  bnez       $v0, .L8004C210
/* 4CE80 8004C280 02901021 */   addu      $v0, $s4, $s0
.L8004C284:
/* 4CE84 8004C284 02802021 */  addu       $a0, $s4, $zero
/* 4CE88 8004C288 2645D7B4 */  addiu      $a1, $s2, -0x284c
/* 4CE8C 8004C28C 0C02600C */  jal        Free
/* 4CE90 8004C290 240600E1 */   addiu     $a2, $zero, 0xe1
/* 4CE94 8004C294 8FBF0130 */  lw         $ra, 0x130($sp)
/* 4CE98 8004C298 8FB5012C */  lw         $s5, 0x12c($sp)
/* 4CE9C 8004C29C 8FB40128 */  lw         $s4, 0x128($sp)
/* 4CEA0 8004C2A0 8FB30124 */  lw         $s3, 0x124($sp)
/* 4CEA4 8004C2A4 8FB20120 */  lw         $s2, 0x120($sp)
/* 4CEA8 8004C2A8 8FB1011C */  lw         $s1, 0x11c($sp)
/* 4CEAC 8004C2AC 8FB00118 */  lw         $s0, 0x118($sp)
/* 4CEB0 8004C2B0 03E00008 */  jr         $ra
/* 4CEB4 8004C2B4 27BD0138 */   addiu     $sp, $sp, 0x138

glabel ret12_8004C2B8
/* 4CEB8 8004C2B8 03E00008 */  jr         $ra
/* 4CEBC 8004C2BC 2402000C */   addiu     $v0, $zero, 0xc

glabel func_8004C2C0
/* 4CEC0 8004C2C0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CEC4 8004C2C4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4CEC8 8004C2C8 8CA20040 */  lw         $v0, 0x40($a1)
/* 4CECC 8004C2CC 8C450000 */  lw         $a1, ($v0)
/* 4CED0 8004C2D0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CED4 8004C2D4 84640068 */  lh         $a0, 0x68($v1)
/* 4CED8 8004C2D8 8C62006C */  lw         $v0, 0x6c($v1)
/* 4CEDC 8004C2DC 0040F809 */  jalr       $v0
/* 4CEE0 8004C2E0 00A42021 */   addu      $a0, $a1, $a0
/* 4CEE4 8004C2E4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4CEE8 8004C2E8 03E00008 */  jr         $ra
/* 4CEEC 8004C2EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004C2F0
/* 4CEF0 8004C2F0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CEF4 8004C2F4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4CEF8 8004C2F8 8CA20040 */  lw         $v0, 0x40($a1)
/* 4CEFC 8004C2FC 8C450000 */  lw         $a1, ($v0)
/* 4CF00 8004C300 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CF04 8004C304 84640070 */  lh         $a0, 0x70($v1)
/* 4CF08 8004C308 8C620074 */  lw         $v0, 0x74($v1)
/* 4CF0C 8004C30C 0040F809 */  jalr       $v0
/* 4CF10 8004C310 00A42021 */   addu      $a0, $a1, $a0
/* 4CF14 8004C314 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4CF18 8004C318 03E00008 */  jr         $ra
/* 4CF1C 8004C31C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004C320
/* 4CF20 8004C320 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CF24 8004C324 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4CF28 8004C328 8CA20040 */  lw         $v0, 0x40($a1)
/* 4CF2C 8004C32C 8C450000 */  lw         $a1, ($v0)
/* 4CF30 8004C330 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CF34 8004C334 84640058 */  lh         $a0, 0x58($v1)
/* 4CF38 8004C338 8C62005C */  lw         $v0, 0x5c($v1)
/* 4CF3C 8004C33C 0040F809 */  jalr       $v0
/* 4CF40 8004C340 00A42021 */   addu      $a0, $a1, $a0
/* 4CF44 8004C344 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4CF48 8004C348 03E00008 */  jr         $ra
/* 4CF4C 8004C34C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004C350
/* 4CF50 8004C350 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CF54 8004C354 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4CF58 8004C358 8CA20040 */  lw         $v0, 0x40($a1)
/* 4CF5C 8004C35C 8C450000 */  lw         $a1, ($v0)
/* 4CF60 8004C360 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CF64 8004C364 84640060 */  lh         $a0, 0x60($v1)
/* 4CF68 8004C368 8C620064 */  lw         $v0, 0x64($v1)
/* 4CF6C 8004C36C 0040F809 */  jalr       $v0
/* 4CF70 8004C370 00A42021 */   addu      $a0, $a1, $a0
/* 4CF74 8004C374 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4CF78 8004C378 03E00008 */  jr         $ra
/* 4CF7C 8004C37C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_8004C380
/* 4CF80 8004C380 00A01021 */  addu       $v0, $a1, $zero
/* 4CF84 8004C384 03E00008 */  jr         $ra
/* 4CF88 8004C388 A440005E */   sh        $zero, 0x5e($v0)

glabel func_8004C38C
/* 4CF8C 8004C38C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4CF90 8004C390 AFBF0014 */  sw         $ra, 0x14($sp)
/* 4CF94 8004C394 AFB00010 */  sw         $s0, 0x10($sp)
/* 4CF98 8004C398 8CA20040 */  lw         $v0, 0x40($a1)
/* 4CF9C 8004C39C 8C450000 */  lw         $a1, ($v0)
/* 4CFA0 8004C3A0 8CA30078 */  lw         $v1, 0x78($a1)
/* 4CFA4 8004C3A4 84640078 */  lh         $a0, 0x78($v1)
/* 4CFA8 8004C3A8 8C62007C */  lw         $v0, 0x7c($v1)
/* 4CFAC 8004C3AC 0040F809 */  jalr       $v0
/* 4CFB0 8004C3B0 00A42021 */   addu      $a0, $a1, $a0
/* 4CFB4 8004C3B4 00408021 */  addu       $s0, $v0, $zero
/* 4CFB8 8004C3B8 8E030078 */  lw         $v1, 0x78($s0)
/* 4CFBC 8004C3BC 84640078 */  lh         $a0, 0x78($v1)
/* 4CFC0 8004C3C0 8C62007C */  lw         $v0, 0x7c($v1)
/* 4CFC4 8004C3C4 0040F809 */  jalr       $v0
/* 4CFC8 8004C3C8 02042021 */   addu      $a0, $s0, $a0
/* 4CFCC 8004C3CC 14400003 */  bnez       $v0, .L8004C3DC
/* 4CFD0 8004C3D0 24020002 */   addiu     $v0, $zero, 2
/* 4CFD4 8004C3D4 080130F9 */  j          .L8004C3E4
/* 4CFD8 8004C3D8 00001021 */   addu      $v0, $zero, $zero
.L8004C3DC:
/* 4CFDC 8004C3DC A602005E */  sh         $v0, 0x5e($s0)
/* 4CFE0 8004C3E0 02001021 */  addu       $v0, $s0, $zero
.L8004C3E4:
/* 4CFE4 8004C3E4 8FBF0014 */  lw         $ra, 0x14($sp)
/* 4CFE8 8004C3E8 8FB00010 */  lw         $s0, 0x10($sp)
/* 4CFEC 8004C3EC 03E00008 */  jr         $ra
/* 4CFF0 8004C3F0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel choose_cinematic
/* 4CFF4 8004C3F4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 4CFF8 8004C3F8 3C03800F */  lui        $v1, %hi(flag_cinematic)
/* 4CFFC 8004C3FC 9462D630 */  lhu        $v0, %lo(flag_cinematic)($v1)
/* 4D000 8004C400 00002021 */  addu       $a0, $zero, $zero
/* 4D004 8004C404 AFB00010 */  sw         $s0, 0x10($sp)
/* 4D008 8004C408 00A08021 */  addu       $s0, $a1, $zero
/* 4D00C 8004C40C AFBF001C */  sw         $ra, 0x1c($sp)
/* 4D010 8004C410 AFB20018 */  sw         $s2, 0x18($sp)
/* 4D014 8004C414 AFB10014 */  sw         $s1, 0x14($sp)
/* 4D018 8004C418 1040001A */  beqz       $v0, .L8004C484
/* 4D01C 8004C41C 9606005E */   lhu       $a2, 0x5e($s0)
/* 4D020 8004C420 2465D630 */  addiu      $a1, $v1, -0x29d0
/* 4D024 8004C424 3C02800E */  lui        $v0, %hi(gGlobals)
/* 4D028 8004C428 244868A8 */  addiu      $t0, $v0, %lo(gGlobals)
/* 4D02C 8004C42C 24070001 */  addiu      $a3, $zero, 1
/* 4D030 8004C430 3C12800F */  lui        $s2, 0x800f
/* 4D034 8004C434 24110001 */  addiu      $s1, $zero, 1
/* 4D038 8004C438 00041080 */  sll        $v0, $a0, 2
.L8004C43C:
/* 4D03C 8004C43C 00451021 */  addu       $v0, $v0, $a1
/* 4D040 8004C440 94430000 */  lhu        $v1, ($v0)
/* 4D044 8004C444 54660009 */  bnel       $v1, $a2, .L8004C46C
/* 4D048 8004C448 24820001 */   addiu     $v0, $a0, 1
/* 4D04C 8004C44C 00002821 */  addu       $a1, $zero, $zero
/* 4D050 8004C450 A10714D0 */  sb         $a3, 0x14d0($t0)
/* 4D054 8004C454 90440002 */  lbu        $a0, 2($v0)
/* 4D058 8004C458 0C0171AC */  jal        load_cinematic
/* 4D05C 8004C45C 24060009 */   addiu     $a2, $zero, 9
/* 4D060 8004C460 02001021 */  addu       $v0, $s0, $zero
/* 4D064 8004C464 08013122 */  j          .L8004C488
/* 4D068 8004C468 A6518DBC */   sh        $s1, -0x7244($s2)
.L8004C46C:
/* 4D06C 8004C46C 3044FFFF */  andi       $a0, $v0, 0xffff
/* 4D070 8004C470 00041880 */  sll        $v1, $a0, 2
/* 4D074 8004C474 00651821 */  addu       $v1, $v1, $a1
/* 4D078 8004C478 94620000 */  lhu        $v0, ($v1)
/* 4D07C 8004C47C 1440FFEF */  bnez       $v0, .L8004C43C
/* 4D080 8004C480 00041080 */   sll       $v0, $a0, 2
.L8004C484:
/* 4D084 8004C484 02001021 */  addu       $v0, $s0, $zero
.L8004C488:
/* 4D088 8004C488 8FBF001C */  lw         $ra, 0x1c($sp)
/* 4D08C 8004C48C 8FB20018 */  lw         $s2, 0x18($sp)
/* 4D090 8004C490 8FB10014 */  lw         $s1, 0x14($sp)
/* 4D094 8004C494 8FB00010 */  lw         $s0, 0x10($sp)
/* 4D098 8004C498 03E00008 */  jr         $ra
/* 4D09C 8004C49C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_8004C4A0
/* 4D0A0 8004C4A0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 4D0A4 8004C4A4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 4D0A8 8004C4A8 8CA30078 */  lw         $v1, 0x78($a1)
/* 4D0AC 8004C4AC 84640080 */  lh         $a0, 0x80($v1)
/* 4D0B0 8004C4B0 8C620084 */  lw         $v0, 0x84($v1)
/* 4D0B4 8004C4B4 0040F809 */  jalr       $v0
/* 4D0B8 8004C4B8 00A42021 */   addu      $a0, $a1, $a0
/* 4D0BC 8004C4BC 8FBF0010 */  lw         $ra, 0x10($sp)
/* 4D0C0 8004C4C0 03E00008 */  jr         $ra
/* 4D0C4 8004C4C4 27BD0018 */   addiu     $sp, $sp, 0x18
/* 4D0C8 8004C4C8 00000000 */  nop
/* 4D0CC 8004C4CC 00000000 */  nop
