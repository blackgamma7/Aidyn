.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel dialoug_func
/* 58740 80057B40 27BDFF80 */  addiu      $sp, $sp, -0x80
/* 58744 80057B44 3C02800E */  lui        $v0, 0x800e
/* 58748 80057B48 AFB30064 */  sw         $s3, 0x64($sp)
/* 5874C 80057B4C 00809821 */  addu       $s3, $a0, $zero
/* 58750 80057B50 AFB5006C */  sw         $s5, 0x6c($sp)
/* 58754 80057B54 30B5FFFF */  andi       $s5, $a1, 0xffff
/* 58758 80057B58 00063400 */  sll        $a2, $a2, 0x10
/* 5875C 80057B5C AFB40068 */  sw         $s4, 0x68($sp)
/* 58760 80057B60 0006A403 */  sra        $s4, $a2, 0x10
/* 58764 80057B64 00073C00 */  sll        $a3, $a3, 0x10
/* 58768 80057B68 AFB60070 */  sw         $s6, 0x70($sp)
/* 5876C 80057B6C 0007B403 */  sra        $s6, $a3, 0x10
/* 58770 80057B70 AFBF0078 */  sw         $ra, 0x78($sp)
/* 58774 80057B74 AFB70074 */  sw         $s7, 0x74($sp)
/* 58778 80057B78 AFB20060 */  sw         $s2, 0x60($sp)
/* 5877C 80057B7C AFB1005C */  sw         $s1, 0x5c($sp)
/* 58780 80057B80 AFB00058 */  sw         $s0, 0x58($sp)
/* 58784 80057B84 244AEB40 */  addiu      $t2, $v0, -0x14c0
/* 58788 80057B88 89430000 */  lwl        $v1, ($t2)
/* 5878C 80057B8C 99430003 */  lwr        $v1, 3($t2)
/* 58790 80057B90 89480004 */  lwl        $t0, 4($t2)
/* 58794 80057B94 99480007 */  lwr        $t0, 7($t2)
/* 58798 80057B98 89490008 */  lwl        $t1, 8($t2)
/* 5879C 80057B9C 9949000B */  lwr        $t1, 0xb($t2)
/* 587A0 80057BA0 ABA30018 */  swl        $v1, 0x18($sp)
/* 587A4 80057BA4 BBA3001B */  swr        $v1, 0x1b($sp)
/* 587A8 80057BA8 ABA8001C */  swl        $t0, 0x1c($sp)
/* 587AC 80057BAC BBA8001F */  swr        $t0, 0x1f($sp)
/* 587B0 80057BB0 ABA90020 */  swl        $t1, 0x20($sp)
/* 587B4 80057BB4 BBA90023 */  swr        $t1, 0x23($sp)
/* 587B8 80057BB8 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 587BC 80057BBC 0040B821 */  addu       $s7, $v0, $zero
/* 587C0 80057BC0 87B20092 */  lh         $s2, 0x92($sp)
/* 587C4 80057BC4 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 587C8 80057BC8 14600066 */  bnez       $v1, .L80057D64
/* 587CC 80057BCC 97B10096 */   lhu       $s1, 0x96($sp)
/* 587D0 80057BD0 0C016374 */  jal        get_some_borg13
/* 587D4 80057BD4 3C10800F */   lui       $s0, 0x800f
/* 587D8 80057BD8 00002821 */  addu       $a1, $zero, $zero
/* 587DC 80057BDC 27A60018 */  addiu      $a2, $sp, 0x18
.L80057BE0:
/* 587E0 80057BE0 00051040 */  sll        $v0, $a1, 1
/* 587E4 80057BE4 00C22021 */  addu       $a0, $a2, $v0
/* 587E8 80057BE8 94830000 */  lhu        $v1, ($a0)
/* 587EC 80057BEC 3402FFFF */  ori        $v0, $zero, 0xffff
/* 587F0 80057BF0 10620009 */  beq        $v1, $v0, .L80057C18
/* 587F4 80057BF4 00601021 */   addu      $v0, $v1, $zero
/* 587F8 80057BF8 5662FFF9 */  bnel       $s3, $v0, .L80057BE0
/* 587FC 80057BFC 24A50002 */   addiu     $a1, $a1, 2
/* 58800 80057C00 24A20001 */  addiu      $v0, $a1, 1
/* 58804 80057C04 00021040 */  sll        $v0, $v0, 1
/* 58808 80057C08 00C21021 */  addu       $v0, $a2, $v0
/* 5880C 80057C0C 94440000 */  lhu        $a0, ($v0)
/* 58810 80057C10 3C03800E */  lui        $v1, %hi(encounter_dat+0x1A)
/* 58814 80057C14 A4647C8E */  sh         $a0, %lo(encounter_dat+0x1A)($v1)
.L80057C18:
/* 58818 80057C18 02602021 */  addu       $a0, $s3, $zero
/* 5881C 80057C1C 02A02821 */  addu       $a1, $s5, $zero
/* 58820 80057C20 02803021 */  addu       $a2, $s4, $zero
/* 58824 80057C24 02C03821 */  addu       $a3, $s6, $zero
/* 58828 80057C28 AFB20010 */  sw         $s2, 0x10($sp)
/* 5882C 80057C2C 0C016380 */  jal        dialougmode_struct_init
/* 58830 80057C30 AFB10014 */   sw        $s1, 0x14($sp)
/* 58834 80057C34 14400005 */  bnez       $v0, .L80057C4C
/* 58838 80057C38 8E02E964 */   lw        $v0, -0x169c($s0)
/* 5883C 80057C3C 0C029CF5 */  jal        passto_borg13_free
/* 58840 80057C40 8E04E964 */   lw        $a0, -0x169c($s0)
/* 58844 80057C44 08015F59 */  j          .L80057D64
/* 58848 80057C48 AE00E964 */   sw        $zero, -0x169c($s0)
.L80057C4C:
/* 5884C 80057C4C 8C430010 */  lw         $v1, 0x10($v0)
/* 58850 80057C50 00008821 */  addu       $s1, $zero, $zero
/* 58854 80057C54 90640012 */  lbu        $a0, 0x12($v1)
/* 58858 80057C58 10800017 */  beqz       $a0, .L80057CB8
/* 5885C 80057C5C 3C14800F */   lui       $s4, 0x800f
/* 58860 80057C60 02009021 */  addu       $s2, $s0, $zero
/* 58864 80057C64 8E42E964 */  lw         $v0, -0x169c($s2)
.L80057C68:
/* 58868 80057C68 323000FF */  andi       $s0, $s1, 0xff
/* 5886C 80057C6C 8C440010 */  lw         $a0, 0x10($v0)
/* 58870 80057C70 0C02D64E */  jal        get_borg_13_text
/* 58874 80057C74 02002821 */   addu      $a1, $s0, $zero
/* 58878 80057C78 0C015E25 */  jal        fill_in_player_name
/* 5887C 80057C7C 00402021 */   addu      $a0, $v0, $zero
/* 58880 80057C80 8E42E964 */  lw         $v0, -0x169c($s2)
/* 58884 80057C84 8C440010 */  lw         $a0, 0x10($v0)
/* 58888 80057C88 0C02D64E */  jal        get_borg_13_text
/* 5888C 80057C8C 02002821 */   addu      $a1, $s0, $zero
/* 58890 80057C90 0C015E54 */  jal        some_string_func
/* 58894 80057C94 00402021 */   addu      $a0, $v0, $zero
/* 58898 80057C98 8E42E964 */  lw         $v0, -0x169c($s2)
/* 5889C 80057C9C 8C430010 */  lw         $v1, 0x10($v0)
/* 588A0 80057CA0 26240001 */  addiu      $a0, $s1, 1
/* 588A4 80057CA4 90620012 */  lbu        $v0, 0x12($v1)
/* 588A8 80057CA8 3091FFFF */  andi       $s1, $a0, 0xffff
/* 588AC 80057CAC 0222102B */  sltu       $v0, $s1, $v0
/* 588B0 80057CB0 1440FFED */  bnez       $v0, .L80057C68
/* 588B4 80057CB4 8E42E964 */   lw        $v0, -0x169c($s2)
.L80057CB8:
/* 588B8 80057CB8 8EE3E960 */  lw         $v1, -0x16a0($s7)
/* 588BC 80057CBC 906200AA */  lbu        $v0, 0xaa($v1)
/* 588C0 80057CC0 00021080 */  sll        $v0, $v0, 2
/* 588C4 80057CC4 00621821 */  addu       $v1, $v1, $v0
/* 588C8 80057CC8 8C640000 */  lw         $a0, ($v1)
/* 588CC 80057CCC 0080F809 */  jalr       $a0
/* 588D0 80057CD0 00008821 */   addu      $s1, $zero, $zero
/* 588D4 80057CD4 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 588D8 80057CD8 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 588DC 80057CDC 8EE3E960 */  lw         $v1, -0x16a0($s7)
/* 588E0 80057CE0 02002021 */  addu       $a0, $s0, $zero
/* 588E4 80057CE4 8C620084 */  lw         $v0, 0x84($v1)
/* 588E8 80057CE8 3C05800E */  lui        $a1, %hi(D_800DEB4C)
/* 588EC 80057CEC 9446000C */  lhu        $a2, 0xc($v0)
/* 588F0 80057CF0 0C0333AC */  jal        sprintf
/* 588F4 80057CF4 24A5EB4C */   addiu     $a1, $a1, %lo(D_800DEB4C)
/* 588F8 80057CF8 0C00B6B8 */  jal        debug_queue
/* 588FC 80057CFC 02002021 */   addu      $a0, $s0, $zero
/* 58900 80057D00 00008021 */  addu       $s0, $zero, $zero
/* 58904 80057D04 3C02800F */  lui        $v0, %hi(D_800EE97C)
/* 58908 80057D08 2444E97C */  addiu      $a0, $v0, %lo(D_800EE97C)
/* 5890C 80057D0C 2405FFFF */  addiu      $a1, $zero, -1
/* 58910 80057D10 8C42E97C */  lw         $v0, -0x1684($v0)
/* 58914 80057D14 02803021 */  addu       $a2, $s4, $zero
/* 58918 80057D18 10450011 */  beq        $v0, $a1, .L80057D60
/* 5891C 80057D1C A680E9AC */   sh        $zero, -0x1654($s4)
/* 58920 80057D20 16620003 */  bne        $s3, $v0, .L80057D30
/* 58924 80057D24 26230002 */   addiu     $v1, $s1, 2
/* 58928 80057D28 08015F58 */  j          .L80057D60
/* 5892C 80057D2C 94900006 */   lhu       $s0, 6($a0)
.L80057D30:
/* 58930 80057D30 3071FFFF */  andi       $s1, $v1, 0xffff
/* 58934 80057D34 00111080 */  sll        $v0, $s1, 2
/* 58938 80057D38 00441021 */  addu       $v0, $v0, $a0
/* 5893C 80057D3C 8C420000 */  lw         $v0, ($v0)
/* 58940 80057D40 50450008 */  beql       $v0, $a1, .L80057D64
/* 58944 80057D44 A4D0E9AC */   sh        $s0, -0x1654($a2)
/* 58948 80057D48 1662FFF9 */  bne        $s3, $v0, .L80057D30
/* 5894C 80057D4C 26230002 */   addiu     $v1, $s1, 2
/* 58950 80057D50 26220001 */  addiu      $v0, $s1, 1
/* 58954 80057D54 00021080 */  sll        $v0, $v0, 2
/* 58958 80057D58 00441021 */  addu       $v0, $v0, $a0
/* 5895C 80057D5C 94500002 */  lhu        $s0, 2($v0)
.L80057D60:
/* 58960 80057D60 A4D0E9AC */  sh         $s0, -0x1654($a2)
.L80057D64:
/* 58964 80057D64 8FBF0078 */  lw         $ra, 0x78($sp)
/* 58968 80057D68 8FB70074 */  lw         $s7, 0x74($sp)
/* 5896C 80057D6C 8FB60070 */  lw         $s6, 0x70($sp)
/* 58970 80057D70 8FB5006C */  lw         $s5, 0x6c($sp)
/* 58974 80057D74 8FB40068 */  lw         $s4, 0x68($sp)
/* 58978 80057D78 8FB30064 */  lw         $s3, 0x64($sp)
/* 5897C 80057D7C 8FB20060 */  lw         $s2, 0x60($sp)
/* 58980 80057D80 8FB1005C */  lw         $s1, 0x5c($sp)
/* 58984 80057D84 8FB00058 */  lw         $s0, 0x58($sp)
/* 58988 80057D88 03E00008 */  jr         $ra
/* 5898C 80057D8C 27BD0080 */   addiu     $sp, $sp, 0x80

glabel run_dialougemode_funcs3
/* 58990 80057D90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58994 80057D94 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 58998 80057D98 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 5899C 80057D9C 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 589A0 80057DA0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 589A4 80057DA4 10800007 */  beqz       $a0, .L80057DC4
/* 589A8 80057DA8 AC60D500 */   sw        $zero, %lo(freeWidgetFunc)($v1)
/* 589AC 80057DAC 908200AA */  lbu        $v0, 0xaa($a0)
/* 589B0 80057DB0 00021080 */  sll        $v0, $v0, 2
/* 589B4 80057DB4 00821021 */  addu       $v0, $a0, $v0
/* 589B8 80057DB8 8C43003C */  lw         $v1, 0x3c($v0)
/* 589BC 80057DBC 0060F809 */  jalr       $v1
/* 589C0 80057DC0 00000000 */   nop
.L80057DC4:
/* 589C4 80057DC4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 589C8 80057DC8 03E00008 */  jr         $ra
/* 589CC 80057DCC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel CreateNewDialouge_
/* 589D0 80057DD0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 589D4 80057DD4 AFB20018 */  sw         $s2, 0x18($sp)
/* 589D8 80057DD8 00809021 */  addu       $s2, $a0, $zero
/* 589DC 80057DDC AFB00010 */  sw         $s0, 0x10($sp)
/* 589E0 80057DE0 3C10800E */  lui        $s0, %hi(queueStructA)
/* 589E4 80057DE4 26107ECC */  addiu      $s0, $s0, %lo(queueStructA)
/* 589E8 80057DE8 02002021 */  addu       $a0, $s0, $zero
/* 589EC 80057DEC AFB10014 */  sw         $s1, 0x14($sp)
/* 589F0 80057DF0 3C11800F */  lui        $s1, %hi(borg_13_pointer)
/* 589F4 80057DF4 2625E964 */  addiu      $a1, $s1, %lo(borg_13_pointer)
/* 589F8 80057DF8 24060005 */  addiu      $a2, $zero, 5
/* 589FC 80057DFC AFBF001C */  sw         $ra, 0x1c($sp)
/* 58A00 80057E00 0C035867 */  jal        AllocFreeQueueItem
/* 58A04 80057E04 00003821 */   addu      $a3, $zero, $zero
/* 58A08 80057E08 0C029CEA */  jal        get_borg13
/* 58A0C 80057E0C 02402021 */   addu      $a0, $s2, $zero
/* 58A10 80057E10 8E04FF9C */  lw         $a0, -0x64($s0)
/* 58A14 80057E14 8C430010 */  lw         $v1, 0x10($v0)
/* 58A18 80057E18 3C12800F */  lui        $s2, %hi(dialougemode_pointer)
/* 58A1C 80057E1C AE22E964 */  sw         $v0, -0x169c($s1)
/* 58A20 80057E20 8E42E960 */  lw         $v0, %lo(dialougemode_pointer)($s2)
/* 58A24 80057E24 00602821 */  addu       $a1, $v1, $zero
/* 58A28 80057E28 0C013E9D */  jal        ofunc_sub_dialouge
/* 58A2C 80057E2C AC430084 */   sw        $v1, 0x84($v0)
/* 58A30 80057E30 26100A54 */  addiu      $s0, $s0, 0xa54
/* 58A34 80057E34 02002021 */  addu       $a0, $s0, $zero
/* 58A38 80057E38 3C05800E */  lui        $a1, %hi(D_800DEB58)
/* 58A3C 80057E3C 0C0333AC */  jal        sprintf
/* 58A40 80057E40 24A5EB58 */   addiu     $a1, $a1, %lo(D_800DEB58)
/* 58A44 80057E44 0C00B6B8 */  jal        debug_queue
/* 58A48 80057E48 02002021 */   addu      $a0, $s0, $zero
/* 58A4C 80057E4C 8E44E960 */  lw         $a0, -0x16a0($s2)
/* 58A50 80057E50 00003021 */  addu       $a2, $zero, $zero
/* 58A54 80057E54 8C850084 */  lw         $a1, 0x84($a0)
/* 58A58 80057E58 0C02DB2E */  jal        func_800B6CB8
/* 58A5C 80057E5C 248400B4 */   addiu     $a0, $a0, 0xb4
/* 58A60 80057E60 8FBF001C */  lw         $ra, 0x1c($sp)
/* 58A64 80057E64 8FB20018 */  lw         $s2, 0x18($sp)
/* 58A68 80057E68 8FB10014 */  lw         $s1, 0x14($sp)
/* 58A6C 80057E6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 58A70 80057E70 03E00008 */  jr         $ra
/* 58A74 80057E74 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80057E78
/* 58A78 80057E78 3C06800F */  lui        $a2, %hi(dialougemode_pointer)
/* 58A7C 80057E7C 8CC2E960 */  lw         $v0, %lo(dialougemode_pointer)($a2)
/* 58A80 80057E80 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 58A84 80057E84 AFB1002C */  sw         $s1, 0x2c($sp)
/* 58A88 80057E88 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 58A8C 80057E8C AFBF0034 */  sw         $ra, 0x34($sp)
/* 58A90 80057E90 AFB20030 */  sw         $s2, 0x30($sp)
/* 58A94 80057E94 AFB00028 */  sw         $s0, 0x28($sp)
/* 58A98 80057E98 AFA40038 */  sw         $a0, 0x38($sp)
/* 58A9C 80057E9C 8C430084 */  lw         $v1, 0x84($v0)
/* 58AA0 80057EA0 24050001 */  addiu      $a1, $zero, 1
/* 58AA4 80057EA4 90630014 */  lbu        $v1, 0x14($v1)
/* 58AA8 80057EA8 10650006 */  beq        $v1, $a1, .L80057EC4
/* 58AAC 80057EAC 00C09021 */   addu      $s2, $a2, $zero
/* 58AB0 80057EB0 24020002 */  addiu      $v0, $zero, 2
/* 58AB4 80057EB4 10620015 */  beq        $v1, $v0, .L80057F0C
/* 58AB8 80057EB8 8E43E960 */   lw        $v1, -0x16a0($s2)
/* 58ABC 80057EBC 08015FE1 */  j          .L80057F84
/* 58AC0 80057EC0 24020003 */   addiu     $v0, $zero, 3
.L80057EC4:
/* 58AC4 80057EC4 00002821 */  addu       $a1, $zero, $zero
/* 58AC8 80057EC8 00003021 */  addu       $a2, $zero, $zero
/* 58ACC 80057ECC 24070140 */  addiu      $a3, $zero, 0x140
/* 58AD0 80057ED0 240200F0 */  addiu      $v0, $zero, 0xf0
/* 58AD4 80057ED4 0C0023E5 */  jal        some_rsp_func
/* 58AD8 80057ED8 AFA20010 */   sw        $v0, 0x10($sp)
/* 58ADC 80057EDC 27A40038 */  addiu      $a0, $sp, 0x38
/* 58AE0 80057EE0 00112C00 */  sll        $a1, $s1, 0x10
/* 58AE4 80057EE4 00052C03 */  sra        $a1, $a1, 0x10
/* 58AE8 80057EE8 00003021 */  addu       $a2, $zero, $zero
/* 58AEC 80057EEC 0C004795 */  jal        handleZoneEngineFrame
/* 58AF0 80057EF0 AFA20038 */   sw        $v0, 0x38($sp)
/* 58AF4 80057EF4 3C02800F */  lui        $v0, %hi(story_short)
/* 58AF8 80057EF8 944388F0 */  lhu        $v1, %lo(story_short)($v0)
/* 58AFC 80057EFC 14600023 */  bnez       $v1, .L80057F8C
/* 58B00 80057F00 8FA20038 */   lw        $v0, 0x38($sp)
/* 58B04 80057F04 08015FE0 */  j          .L80057F80
/* 58B08 80057F08 8E43E960 */   lw        $v1, -0x16a0($s2)
.L80057F0C:
/* 58B0C 80057F0C 0C0089E4 */  jal        func_80022790
/* 58B10 80057F10 241000F0 */   addiu     $s0, $zero, 0xf0
/* 58B14 80057F14 00002821 */  addu       $a1, $zero, $zero
/* 58B18 80057F18 00003021 */  addu       $a2, $zero, $zero
/* 58B1C 80057F1C 24070140 */  addiu      $a3, $zero, 0x140
/* 58B20 80057F20 8FA40038 */  lw         $a0, 0x38($sp)
/* 58B24 80057F24 0C0023E5 */  jal        some_rsp_func
/* 58B28 80057F28 AFB00010 */   sw        $s0, 0x10($sp)
/* 58B2C 80057F2C 00402021 */  addu       $a0, $v0, $zero
/* 58B30 80057F30 00002821 */  addu       $a1, $zero, $zero
/* 58B34 80057F34 00003021 */  addu       $a2, $zero, $zero
/* 58B38 80057F38 24070140 */  addiu      $a3, $zero, 0x140
/* 58B3C 80057F3C AFA20038 */  sw         $v0, 0x38($sp)
/* 58B40 80057F40 AFB00010 */  sw         $s0, 0x10($sp)
/* 58B44 80057F44 AFA00014 */  sw         $zero, 0x14($sp)
/* 58B48 80057F48 AFA00018 */  sw         $zero, 0x18($sp)
/* 58B4C 80057F4C AFA0001C */  sw         $zero, 0x1c($sp)
/* 58B50 80057F50 0C002265 */  jal        some_video_setting_init
/* 58B54 80057F54 AFA00020 */   sw        $zero, 0x20($sp)
/* 58B58 80057F58 00402021 */  addu       $a0, $v0, $zero
/* 58B5C 80057F5C 322500FF */  andi       $a1, $s1, 0xff
/* 58B60 80057F60 24060001 */  addiu      $a2, $zero, 1
/* 58B64 80057F64 0C01646A */  jal        func_800591A8
/* 58B68 80057F68 AFA20038 */   sw        $v0, 0x38($sp)
/* 58B6C 80057F6C 3C03800F */  lui        $v1, %hi(story_short)
/* 58B70 80057F70 946488F0 */  lhu        $a0, %lo(story_short)($v1)
/* 58B74 80057F74 14800004 */  bnez       $a0, .L80057F88
/* 58B78 80057F78 AFA20038 */   sw        $v0, 0x38($sp)
/* 58B7C 80057F7C 8E43E960 */  lw         $v1, -0x16a0($s2)
.L80057F80:
/* 58B80 80057F80 24020003 */  addiu      $v0, $zero, 3
.L80057F84:
/* 58B84 80057F84 A06200AB */  sb         $v0, 0xab($v1)
.L80057F88:
/* 58B88 80057F88 8FA20038 */  lw         $v0, 0x38($sp)
.L80057F8C:
/* 58B8C 80057F8C 8FBF0034 */  lw         $ra, 0x34($sp)
/* 58B90 80057F90 8FB20030 */  lw         $s2, 0x30($sp)
/* 58B94 80057F94 8FB1002C */  lw         $s1, 0x2c($sp)
/* 58B98 80057F98 8FB00028 */  lw         $s0, 0x28($sp)
/* 58B9C 80057F9C 03E00008 */  jr         $ra
/* 58BA0 80057FA0 27BD0038 */   addiu     $sp, $sp, 0x38

glabel ScreenFadeMode_12
/* 58BA4 80057FA4 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 58BA8 80057FA8 AFB3002C */  sw         $s3, 0x2c($sp)
/* 58BAC 80057FAC 00809821 */  addu       $s3, $a0, $zero
/* 58BB0 80057FB0 3C02800F */  lui        $v0, 0x800f
/* 58BB4 80057FB4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 58BB8 80057FB8 AFB20028 */  sw         $s2, 0x28($sp)
/* 58BBC 80057FBC AFB10024 */  sw         $s1, 0x24($sp)
/* 58BC0 80057FC0 AFB00020 */  sw         $s0, 0x20($sp)
/* 58BC4 80057FC4 8E630000 */  lw         $v1, ($s3)
/* 58BC8 80057FC8 8C44E960 */  lw         $a0, -0x16a0($v0)
/* 58BCC 80057FCC AFA30018 */  sw         $v1, 0x18($sp)
/* 58BD0 80057FD0 908300AB */  lbu        $v1, 0xab($a0)
/* 58BD4 80057FD4 24120001 */  addiu      $s2, $zero, 1
/* 58BD8 80057FD8 10720014 */  beq        $v1, $s2, .L8005802C
/* 58BDC 80057FDC 00008821 */   addu      $s1, $zero, $zero
/* 58BE0 80057FE0 28620002 */  slti       $v0, $v1, 2
/* 58BE4 80057FE4 10400005 */  beqz       $v0, .L80057FFC
/* 58BE8 80057FE8 24020002 */   addiu     $v0, $zero, 2
/* 58BEC 80057FEC 10600009 */  beqz       $v1, .L80058014
/* 58BF0 80057FF0 2402000C */   addiu     $v0, $zero, 0xc
/* 58BF4 80057FF4 0801604E */  j          .L80058138
/* 58BF8 80057FF8 8FBF0030 */   lw        $ra, 0x30($sp)
.L80057FFC:
/* 58BFC 80057FFC 10620024 */  beq        $v1, $v0, .L80058090
/* 58C00 80058000 24020003 */   addiu     $v0, $zero, 3
/* 58C04 80058004 1062003B */  beq        $v1, $v0, .L800580F4
/* 58C08 80058008 2402000C */   addiu     $v0, $zero, 0xc
/* 58C0C 8005800C 0801604E */  j          .L80058138
/* 58C10 80058010 8FBF0030 */   lw        $ra, 0x30($sp)
.L80058014:
/* 58C14 80058014 3C02800F */  lui        $v0, %hi(D_800EE974)
/* 58C18 80058018 AC52E974 */  sw         $s2, %lo(D_800EE974)($v0)
/* 58C1C 8005801C 0C016494 */  jal        run_dialougemode_funcs4
/* 58C20 80058020 A09200AB */   sb        $s2, 0xab($a0)
/* 58C24 80058024 0801604D */  j          .L80058134
/* 58C28 80058028 2402000C */   addiu     $v0, $zero, 0xc
.L8005802C:
/* 58C2C 8005802C 0C016054 */  jal        run_dialougemode_funcs1
/* 58C30 80058030 00000000 */   nop
/* 58C34 80058034 00002821 */  addu       $a1, $zero, $zero
/* 58C38 80058038 00003021 */  addu       $a2, $zero, $zero
/* 58C3C 8005803C 240200F0 */  addiu      $v0, $zero, 0xf0
/* 58C40 80058040 8FA40018 */  lw         $a0, 0x18($sp)
/* 58C44 80058044 24070140 */  addiu      $a3, $zero, 0x140
/* 58C48 80058048 0C0023E5 */  jal        some_rsp_func
/* 58C4C 8005804C AFA20010 */   sw        $v0, 0x10($sp)
/* 58C50 80058050 0C0163FE */  jal        cutScene_control_func
/* 58C54 80058054 AFA20018 */   sw        $v0, 0x18($sp)
/* 58C58 80058058 00408821 */  addu       $s1, $v0, $zero
/* 58C5C 8005805C 27A40018 */  addiu      $a0, $sp, 0x18
/* 58C60 80058060 02202821 */  addu       $a1, $s1, $zero
/* 58C64 80058064 3C02800E */  lui        $v0, %hi(delay_float)
/* 58C68 80058068 44910000 */  mtc1       $s1, $f0
/* 58C6C 8005806C 46800020 */  cvt.s.w    $f0, $f0
/* 58C70 80058070 0C0162E2 */  jal        func_80058B88
/* 58C74 80058074 E44068B4 */   swc1      $f0, %lo(delay_float)($v0)
/* 58C78 80058078 02202821 */  addu       $a1, $s1, $zero
/* 58C7C 8005807C 8FA40018 */  lw         $a0, 0x18($sp)
/* 58C80 80058080 0C01646A */  jal        func_800591A8
/* 58C84 80058084 00003021 */   addu      $a2, $zero, $zero
/* 58C88 80058088 0801603B */  j          .L800580EC
/* 58C8C 8005808C AFA20018 */   sw        $v0, 0x18($sp)
.L80058090:
/* 58C90 80058090 AFA0001C */  sw         $zero, 0x1c($sp)
/* 58C94 80058094 3C12800E */  lui        $s2, 0x800e
/* 58C98 80058098 08016029 */  j          .L800580A4
/* 58C9C 8005809C 27B0001C */   addiu     $s0, $sp, 0x1c
.L800580A0:
/* 58CA0 800580A0 305100FF */  andi       $s1, $v0, 0xff
.L800580A4:
/* 58CA4 800580A4 02002021 */  addu       $a0, $s0, $zero
/* 58CA8 800580A8 0C02713D */  jal        get_cont_aidyn
/* 58CAC 800580AC 00002821 */   addu      $a1, $zero, $zero
/* 58CB0 800580B0 1440FFFB */  bnez       $v0, .L800580A0
/* 58CB4 800580B4 26220001 */   addiu     $v0, $s1, 1
/* 58CB8 800580B8 52200001 */  beql       $s1, $zero, .L800580C0
/* 58CBC 800580BC 24110001 */   addiu     $s1, $zero, 1
.L800580C0:
/* 58CC0 800580C0 2E220007 */  sltiu      $v0, $s1, 7
/* 58CC4 800580C4 50400001 */  beql       $v0, $zero, .L800580CC
/* 58CC8 800580C8 24110006 */   addiu     $s1, $zero, 6
.L800580CC:
/* 58CCC 800580CC 02202821 */  addu       $a1, $s1, $zero
/* 58CD0 800580D0 264268A8 */  addiu      $v0, $s2, 0x68a8
/* 58CD4 800580D4 8FA40018 */  lw         $a0, 0x18($sp)
/* 58CD8 800580D8 44910000 */  mtc1       $s1, $f0
/* 58CDC 800580DC 46800020 */  cvt.s.w    $f0, $f0
/* 58CE0 800580E0 0C015F9E */  jal        func_80057E78
/* 58CE4 800580E4 E440000C */   swc1      $f0, 0xc($v0)
/* 58CE8 800580E8 AFA20018 */  sw         $v0, 0x18($sp)
.L800580EC:
/* 58CEC 800580EC 0801604C */  j          .L80058130
/* 58CF0 800580F0 AE620000 */   sw        $v0, ($s3)
.L800580F4:
/* 58CF4 800580F4 8C820090 */  lw         $v0, 0x90($a0)
/* 58CF8 800580F8 3C10800F */  lui        $s0, %hi(D_800EE970)
/* 58CFC 800580FC 0C0164A2 */  jal        run_dialougemode_funcs5
/* 58D00 80058100 AE02E970 */   sw        $v0, %lo(D_800EE970)($s0)
/* 58D04 80058104 8E03E970 */  lw         $v1, -0x1690($s0)
/* 58D08 80058108 3C02800F */  lui        $v0, %hi(D_800EE974)
/* 58D0C 8005810C AC40E974 */  sw         $zero, %lo(D_800EE974)($v0)
/* 58D10 80058110 24020007 */  addiu      $v0, $zero, 7
/* 58D14 80058114 54620007 */  bnel       $v1, $v0, .L80058134
/* 58D18 80058118 8E02E970 */   lw        $v0, -0x1690($s0)
/* 58D1C 8005811C 3C02800F */  lui        $v0, %hi(D_800EE978)
/* 58D20 80058120 AC52E978 */  sw         $s2, %lo(D_800EE978)($v0)
/* 58D24 80058124 AE12E970 */  sw         $s2, -0x1690($s0)
/* 58D28 80058128 0801604D */  j          .L80058134
/* 58D2C 8005812C 8E02E970 */   lw        $v0, -0x1690($s0)
.L80058130:
/* 58D30 80058130 2402000C */  addiu      $v0, $zero, 0xc
.L80058134:
/* 58D34 80058134 8FBF0030 */  lw         $ra, 0x30($sp)
.L80058138:
/* 58D38 80058138 8FB3002C */  lw         $s3, 0x2c($sp)
/* 58D3C 8005813C 8FB20028 */  lw         $s2, 0x28($sp)
/* 58D40 80058140 8FB10024 */  lw         $s1, 0x24($sp)
/* 58D44 80058144 8FB00020 */  lw         $s0, 0x20($sp)
/* 58D48 80058148 03E00008 */  jr         $ra
/* 58D4C 8005814C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel run_dialougemode_funcs1
/* 58D50 80058150 3C02800F */  lui        $v0, %hi(borg_13_pointer)
/* 58D54 80058154 8C43E964 */  lw         $v1, %lo(borg_13_pointer)($v0)
/* 58D58 80058158 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58D5C 8005815C AFBF0014 */  sw         $ra, 0x14($sp)
/* 58D60 80058160 1060000D */  beqz       $v1, .L80058198
/* 58D64 80058164 AFB00010 */   sw        $s0, 0x10($sp)
/* 58D68 80058168 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 58D6C 8005816C 8E03E960 */  lw         $v1, %lo(dialougemode_pointer)($s0)
/* 58D70 80058170 1060000A */  beqz       $v1, .L8005819C
/* 58D74 80058174 8FBF0014 */   lw        $ra, 0x14($sp)
/* 58D78 80058178 906200AA */  lbu        $v0, 0xaa($v1)
/* 58D7C 8005817C 00021080 */  sll        $v0, $v0, 2
/* 58D80 80058180 00621021 */  addu       $v0, $v1, $v0
/* 58D84 80058184 8C430014 */  lw         $v1, 0x14($v0)
/* 58D88 80058188 0060F809 */  jalr       $v1
/* 58D8C 8005818C 00000000 */   nop
/* 58D90 80058190 8E02E960 */  lw         $v0, -0x16a0($s0)
/* 58D94 80058194 A04000AC */  sb         $zero, 0xac($v0)
.L80058198:
/* 58D98 80058198 8FBF0014 */  lw         $ra, 0x14($sp)
.L8005819C:
/* 58D9C 8005819C 8FB00010 */  lw         $s0, 0x10($sp)
/* 58DA0 800581A0 03E00008 */  jr         $ra
/* 58DA4 800581A4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel run_dialougemode_funcs2
/* 58DA8 800581A8 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 58DAC 800581AC 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 58DB0 800581B0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58DB4 800581B4 10600007 */  beqz       $v1, .L800581D4
/* 58DB8 800581B8 AFBF0010 */   sw        $ra, 0x10($sp)
/* 58DBC 800581BC 906200AA */  lbu        $v0, 0xaa($v1)
/* 58DC0 800581C0 00021080 */  sll        $v0, $v0, 2
/* 58DC4 800581C4 00621021 */  addu       $v0, $v1, $v0
/* 58DC8 800581C8 8C430028 */  lw         $v1, 0x28($v0)
/* 58DCC 800581CC 0060F809 */  jalr       $v1
/* 58DD0 800581D0 00000000 */   nop
.L800581D4:
/* 58DD4 800581D4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 58DD8 800581D8 03E00008 */  jr         $ra
/* 58DDC 800581DC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_skill_check
/* 58DE0 800581E0 3C05800F */  lui        $a1, %hi(dialougemode_pointer)
/* 58DE4 800581E4 8CA2E960 */  lw         $v0, %lo(dialougemode_pointer)($a1)
/* 58DE8 800581E8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 58DEC 800581EC AFB00020 */  sw         $s0, 0x20($sp)
/* 58DF0 800581F0 309000FF */  andi       $s0, $a0, 0xff
/* 58DF4 800581F4 AFBF0030 */  sw         $ra, 0x30($sp)
/* 58DF8 800581F8 AFB3002C */  sw         $s3, 0x2c($sp)
/* 58DFC 800581FC AFB20028 */  sw         $s2, 0x28($sp)
/* 58E00 80058200 AFB10024 */  sw         $s1, 0x24($sp)
/* 58E04 80058204 8C430080 */  lw         $v1, 0x80($v0)
/* 58E08 80058208 240400FF */  addiu      $a0, $zero, 0xff
/* 58E0C 8005820C 00701821 */  addu       $v1, $v1, $s0
/* 58E10 80058210 90620000 */  lbu        $v0, ($v1)
/* 58E14 80058214 14440036 */  bne        $v0, $a0, .L800582F0
/* 58E18 80058218 00A08821 */   addu      $s1, $a1, $zero
/* 58E1C 8005821C 3C02800E */  lui        $v0, %hi(partyPointer)
/* 58E20 80058220 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 58E24 80058224 0C0208BA */  jal        check_party_skill
/* 58E28 80058228 02002821 */   addu      $a1, $s0, $zero
/* 58E2C 8005822C 8E24E960 */  lw         $a0, -0x16a0($s1)
/* 58E30 80058230 8C830080 */  lw         $v1, 0x80($a0)
/* 58E34 80058234 00701821 */  addu       $v1, $v1, $s0
/* 58E38 80058238 A0620000 */  sb         $v0, ($v1)
/* 58E3C 8005823C 24020009 */  addiu      $v0, $zero, 9
/* 58E40 80058240 16020005 */  bne        $s0, $v0, .L80058258
/* 58E44 80058244 8E27E960 */   lw        $a3, -0x16a0($s1)
/* 58E48 80058248 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 58E4C 8005824C 8C430080 */  lw         $v1, 0x80($v0)
/* 58E50 80058250 080160C0 */  j          .L80058300
/* 58E54 80058254 90620009 */   lbu       $v0, 9($v1)
.L80058258:
/* 58E58 80058258 94E3007C */  lhu        $v1, 0x7c($a3)
/* 58E5C 8005825C 24027FFF */  addiu      $v0, $zero, 0x7fff
/* 58E60 80058260 10620023 */  beq        $v1, $v0, .L800582F0
/* 58E64 80058264 00602021 */   addu      $a0, $v1, $zero
/* 58E68 80058268 24130011 */  addiu      $s3, $zero, 0x11
/* 58E6C 8005826C 26020049 */  addiu      $v0, $s0, 0x49
/* 58E70 80058270 90E50097 */  lbu        $a1, 0x97($a3)
/* 58E74 80058274 90E60099 */  lbu        $a2, 0x99($a3)
/* 58E78 80058278 90E7009B */  lbu        $a3, 0x9b($a3)
/* 58E7C 8005827C 305200FF */  andi       $s2, $v0, 0xff
/* 58E80 80058280 AFB30010 */  sw         $s3, 0x10($sp)
/* 58E84 80058284 0C017F2E */  jal        some_ref_obj_lookup_func
/* 58E88 80058288 AFB20014 */   sw        $s2, 0x14($sp)
/* 58E8C 8005828C 00402821 */  addu       $a1, $v0, $zero
/* 58E90 80058290 10A00008 */  beqz       $a1, .L800582B4
/* 58E94 80058294 8E23E960 */   lw        $v1, -0x16a0($s1)
/* 58E98 80058298 90A4000B */  lbu        $a0, 0xb($a1)
/* 58E9C 8005829C 8C620080 */  lw         $v0, 0x80($v1)
/* 58EA0 800582A0 2403000A */  addiu      $v1, $zero, 0xa
/* 58EA4 800582A4 00501021 */  addu       $v0, $v0, $s0
/* 58EA8 800582A8 A0440000 */  sb         $a0, ($v0)
/* 58EAC 800582AC 080160BC */  j          .L800582F0
/* 58EB0 800582B0 A0A30003 */   sb        $v1, 3($a1)
.L800582B4:
/* 58EB4 800582B4 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 58EB8 800582B8 9444007C */  lhu        $a0, 0x7c($v0)
/* 58EBC 800582BC 90450097 */  lbu        $a1, 0x97($v0)
/* 58EC0 800582C0 90460099 */  lbu        $a2, 0x99($v0)
/* 58EC4 800582C4 9047009B */  lbu        $a3, 0x9b($v0)
/* 58EC8 800582C8 2402000A */  addiu      $v0, $zero, 0xa
/* 58ECC 800582CC AFB30010 */  sw         $s3, 0x10($sp)
/* 58ED0 800582D0 AFB20014 */  sw         $s2, 0x14($sp)
/* 58ED4 800582D4 0C017EB4 */  jal        passto_WriteTo_VoxelChart
/* 58ED8 800582D8 AFA20018 */   sw        $v0, 0x18($sp)
/* 58EDC 800582DC 8E24E960 */  lw         $a0, -0x16a0($s1)
/* 58EE0 800582E0 8C830080 */  lw         $v1, 0x80($a0)
/* 58EE4 800582E4 00701821 */  addu       $v1, $v1, $s0
/* 58EE8 800582E8 90640000 */  lbu        $a0, ($v1)
/* 58EEC 800582EC AC440008 */  sw         $a0, 8($v0)
.L800582F0:
/* 58EF0 800582F0 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 58EF4 800582F4 8C430080 */  lw         $v1, 0x80($v0)
/* 58EF8 800582F8 00701821 */  addu       $v1, $v1, $s0
/* 58EFC 800582FC 90620000 */  lbu        $v0, ($v1)
.L80058300:
/* 58F00 80058300 8FBF0030 */  lw         $ra, 0x30($sp)
/* 58F04 80058304 8FB3002C */  lw         $s3, 0x2c($sp)
/* 58F08 80058308 8FB20028 */  lw         $s2, 0x28($sp)
/* 58F0C 8005830C 8FB10024 */  lw         $s1, 0x24($sp)
/* 58F10 80058310 8FB00020 */  lw         $s0, 0x20($sp)
/* 58F14 80058314 03E00008 */  jr         $ra
/* 58F18 80058318 27BD0038 */   addiu     $sp, $sp, 0x38

glabel func_8005831C
/* 58F1C 8005831C 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 58F20 80058320 8C45E960 */  lw         $a1, %lo(dialougemode_pointer)($v0)
/* 58F24 80058324 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58F28 80058328 10A0000E */  beqz       $a1, .L80058364
/* 58F2C 8005832C AFBF0010 */   sw        $ra, 0x10($sp)
/* 58F30 80058330 8CA200A0 */  lw         $v0, 0xa0($a1)
/* 58F34 80058334 1040000C */  beqz       $v0, .L80058368
/* 58F38 80058338 8FBF0010 */   lw        $ra, 0x10($sp)
/* 58F3C 8005833C 8CA200A4 */  lw         $v0, 0xa4($a1)
/* 58F40 80058340 14400009 */  bnez       $v0, .L80058368
/* 58F44 80058344 3C02800E */   lui       $v0, %hi(gGlobals)
/* 58F48 80058348 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 58F4C 8005834C 94431622 */  lhu        $v1, 0x1622($v0)
/* 58F50 80058350 14600005 */  bnez       $v1, .L80058368
/* 58F54 80058354 00000000 */   nop
/* 58F58 80058358 8C4415C0 */  lw         $a0, 0x15c0($v0)
/* 58F5C 8005835C 0C013C99 */  jal        func_8004F264
/* 58F60 80058360 ACA000A0 */   sw        $zero, 0xa0($a1)
.L80058364:
/* 58F64 80058364 8FBF0010 */  lw         $ra, 0x10($sp)
.L80058368:
/* 58F68 80058368 03E00008 */  jr         $ra
/* 58F6C 8005836C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80058370
/* 58F70 80058370 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 58F74 80058374 8C46E960 */  lw         $a2, %lo(dialougemode_pointer)($v0)
/* 58F78 80058378 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58F7C 8005837C AFBF0014 */  sw         $ra, 0x14($sp)
/* 58F80 80058380 AFB00010 */  sw         $s0, 0x10($sp)
/* 58F84 80058384 8CC300A0 */  lw         $v1, 0xa0($a2)
/* 58F88 80058388 1460000E */  bnez       $v1, .L800583C4
/* 58F8C 8005838C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 58F90 80058390 3C10800E */  lui        $s0, %hi(gGlobals)
/* 58F94 80058394 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 58F98 80058398 8E0315C0 */  lw         $v1, 0x15c0($s0)
/* 58F9C 8005839C 8E041604 */  lw         $a0, 0x1604($s0)
/* 58FA0 800583A0 8C650004 */  lw         $a1, 4($v1)
/* 58FA4 800583A4 24020001 */  addiu      $v0, $zero, 1
/* 58FA8 800583A8 0C02DCB3 */  jal        func_800B72CC
/* 58FAC 800583AC ACC200A0 */   sw        $v0, 0xa0($a2)
/* 58FB0 800583B0 8E0315C0 */  lw         $v1, 0x15c0($s0)
/* 58FB4 800583B4 00602021 */  addu       $a0, $v1, $zero
/* 58FB8 800583B8 0C013C96 */  jal        func_8004F258
/* 58FBC 800583BC AC60000C */   sw        $zero, 0xc($v1)
/* 58FC0 800583C0 8FBF0014 */  lw         $ra, 0x14($sp)
.L800583C4:
/* 58FC4 800583C4 8FB00010 */  lw         $s0, 0x10($sp)
/* 58FC8 800583C8 03E00008 */  jr         $ra
/* 58FCC 800583CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800583D0
/* 58FD0 800583D0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 58FD4 800583D4 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 58FD8 800583D8 8C45E960 */  lw         $a1, %lo(dialougemode_pointer)($v0)
/* 58FDC 800583DC 24030001 */  addiu      $v1, $zero, 1
/* 58FE0 800583E0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 58FE4 800583E4 ACA300A4 */  sw         $v1, 0xa4($a1)
/* 58FE8 800583E8 0C0160DC */  jal        func_80058370
/* 58FEC 800583EC A4A4009C */   sh        $a0, 0x9c($a1)
/* 58FF0 800583F0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 58FF4 800583F4 03E00008 */  jr         $ra
/* 58FF8 800583F8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_dialougemode_0x90
/* 58FFC 800583FC 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59000 80058400 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 59004 80058404 03E00008 */  jr         $ra
/* 59008 80058408 AC640090 */   sw        $a0, 0x90($v1)

glabel encounterDat_func
/* 5900C 8005840C 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 59010 80058410 3C02800E */  lui        $v0, %hi(combat_bytes)
/* 59014 80058414 AFB3001C */  sw         $s3, 0x1c($sp)
/* 59018 80058418 24537C70 */  addiu      $s3, $v0, %lo(combat_bytes)
/* 5901C 8005841C AFB20018 */  sw         $s2, 0x18($sp)
/* 59020 80058420 26720004 */  addiu      $s2, $s3, 4
/* 59024 80058424 AFB00010 */  sw         $s0, 0x10($sp)
/* 59028 80058428 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5902C 8005842C 02402021 */  addu       $a0, $s2, $zero
/* 59030 80058430 00002821 */  addu       $a1, $zero, $zero
/* 59034 80058434 AFB10014 */  sw         $s1, 0x14($sp)
/* 59038 80058438 8E11E960 */  lw         $s1, %lo(dialougemode_pointer)($s0)
/* 5903C 8005843C AFBF0020 */  sw         $ra, 0x20($sp)
/* 59040 80058440 0C026380 */  jal        Calloc
/* 59044 80058444 24060018 */   addiu     $a2, $zero, 0x18
/* 59048 80058448 00003021 */  addu       $a2, $zero, $zero
/* 5904C 8005844C 02003821 */  addu       $a3, $s0, $zero
/* 59050 80058450 263000B4 */  addiu      $s0, $s1, 0xb4
/* 59054 80058454 263101A4 */  addiu      $s1, $s1, 0x1a4
.L80058458:
/* 59058 80058458 00062040 */  sll        $a0, $a2, 1
/* 5905C 8005845C 24C20001 */  addiu      $v0, $a2, 1
/* 59060 80058460 304600FF */  andi       $a2, $v0, 0xff
/* 59064 80058464 02241821 */  addu       $v1, $s1, $a0
/* 59068 80058468 02442021 */  addu       $a0, $s2, $a0
/* 5906C 8005846C 94650000 */  lhu        $a1, ($v1)
/* 59070 80058470 2CC2000C */  sltiu      $v0, $a2, 0xc
/* 59074 80058474 1440FFF8 */  bnez       $v0, .L80058458
/* 59078 80058478 A4850000 */   sh        $a1, ($a0)
/* 5907C 8005847C 92020114 */  lbu        $v0, 0x114($s0)
/* 59080 80058480 A2420027 */  sb         $v0, 0x27($s2)
/* 59084 80058484 92030112 */  lbu        $v1, 0x112($s0)
/* 59088 80058488 A2430026 */  sb         $v1, 0x26($s2)
/* 5908C 8005848C 92040113 */  lbu        $a0, 0x113($s0)
/* 59090 80058490 2C42001C */  sltiu      $v0, $v0, 0x1c
/* 59094 80058494 14400002 */  bnez       $v0, .L800584A0
/* 59098 80058498 A2440028 */   sb        $a0, 0x28($s2)
/* 5909C 8005849C A2400027 */  sb         $zero, 0x27($s2)
.L800584A0:
/* 590A0 800584A0 8CE2E960 */  lw         $v0, -0x16a0($a3)
/* 590A4 800584A4 8FBF0020 */  lw         $ra, 0x20($sp)
/* 590A8 800584A8 8FB10014 */  lw         $s1, 0x14($sp)
/* 590AC 800584AC 8FB00010 */  lw         $s0, 0x10($sp)
/* 590B0 800584B0 904300AA */  lbu        $v1, 0xaa($v0)
/* 590B4 800584B4 24040001 */  addiu      $a0, $zero, 1
/* 590B8 800584B8 A2640002 */  sb         $a0, 2($s3)
/* 590BC 800584BC 8FB3001C */  lw         $s3, 0x1c($sp)
/* 590C0 800584C0 38630001 */  xori       $v1, $v1, 1
/* 590C4 800584C4 0003182B */  sltu       $v1, $zero, $v1
/* 590C8 800584C8 A2430029 */  sb         $v1, 0x29($s2)
/* 590CC 800584CC 8FB20018 */  lw         $s2, 0x18($sp)
/* 590D0 800584D0 03E00008 */  jr         $ra
/* 590D4 800584D4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel monsterparty_wanderstruct
/* 590D8 800584D8 27BDFFA0 */  addiu      $sp, $sp, -0x60
/* 590DC 800584DC AFB00050 */  sw         $s0, 0x50($sp)
/* 590E0 800584E0 00808021 */  addu       $s0, $a0, $zero
/* 590E4 800584E4 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 590E8 800584E8 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 590EC 800584EC AFBF0058 */  sw         $ra, 0x58($sp)
/* 590F0 800584F0 AFB10054 */  sw         $s1, 0x54($sp)
/* 590F4 800584F4 0C004B89 */  jal        func_80012E24
/* 590F8 800584F8 AC700078 */   sw        $s0, 0x78($v1)
/* 590FC 800584FC 8E110000 */  lw         $s1, ($s0)
/* 59100 80058500 24050840 */  addiu      $a1, $zero, 0x840
/* 59104 80058504 0C0061C7 */  jal        playerdata_set_flags
/* 59108 80058508 02202021 */   addu      $a0, $s1, $zero
/* 5910C 8005850C 27A40010 */  addiu      $a0, $sp, 0x10
/* 59110 80058510 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 59114 80058514 8C506950 */  lw         $s0, %lo(PlayerCharStruct)($v0)
/* 59118 80058518 26250068 */  addiu      $a1, $s1, 0x68
/* 5911C 8005851C A6200014 */  sh         $zero, 0x14($s1)
/* 59120 80058520 26060068 */  addiu      $a2, $s0, 0x68
/* 59124 80058524 0C02AB26 */  jal        Vec3A_BsubC
/* 59128 80058528 A6000014 */   sh        $zero, 0x14($s0)
/* 5912C 8005852C 0C02ABBB */  jal        vec3_normalize
/* 59130 80058530 27A40010 */   addiu     $a0, $sp, 0x10
/* 59134 80058534 8FA50010 */  lw         $a1, 0x10($sp)
/* 59138 80058538 8FA60018 */  lw         $a2, 0x18($sp)
/* 5913C 8005853C 0C0065FC */  jal        playerdata_set_facing
/* 59140 80058540 02202021 */   addu      $a0, $s1, $zero
/* 59144 80058544 C7A00010 */  lwc1       $f0, 0x10($sp)
/* 59148 80058548 C7A20018 */  lwc1       $f2, 0x18($sp)
/* 5914C 8005854C 46000007 */  neg.s      $f0, $f0
/* 59150 80058550 46001087 */  neg.s      $f2, $f2
/* 59154 80058554 44050000 */  mfc1       $a1, $f0
/* 59158 80058558 44061000 */  mfc1       $a2, $f2
/* 5915C 8005855C 0C0065FC */  jal        playerdata_set_facing
/* 59160 80058560 02002021 */   addu      $a0, $s0, $zero
/* 59164 80058564 8FBF0058 */  lw         $ra, 0x58($sp)
/* 59168 80058568 8FB10054 */  lw         $s1, 0x54($sp)
/* 5916C 8005856C 8FB00050 */  lw         $s0, 0x50($sp)
/* 59170 80058570 03E00008 */  jr         $ra
/* 59174 80058574 27BD0060 */   addiu     $sp, $sp, 0x60

glabel add_char_to_party
/* 59178 80058578 3085FFFF */  andi       $a1, $a0, 0xffff
/* 5917C 8005857C 3C02800E */  lui        $v0, %hi(partyPointer)
/* 59180 80058580 8C447EA0 */  lw         $a0, %lo(partyPointer)($v0)
/* 59184 80058584 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59188 80058588 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5918C 8005858C 0C01F7BD */  jal        add_to_party
/* 59190 80058590 00000000 */   nop
/* 59194 80058594 14400003 */  bnez       $v0, .L800585A4
/* 59198 80058598 3C02800F */   lui       $v0, %hi(dialougemode_pointer)
/* 5919C 8005859C 08016171 */  j          .L800585C4
/* 591A0 800585A0 00001021 */   addu      $v0, $zero, $zero
.L800585A4:
/* 591A4 800585A4 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 591A8 800585A8 8C830084 */  lw         $v1, 0x84($a0)
/* 591AC 800585AC 90620014 */  lbu        $v0, 0x14($v1)
/* 591B0 800585B0 14400004 */  bnez       $v0, .L800585C4
/* 591B4 800585B4 24020001 */   addiu     $v0, $zero, 1
/* 591B8 800585B8 24020001 */  addiu      $v0, $zero, 1
/* 591BC 800585BC A08200A8 */  sb         $v0, 0xa8($a0)
/* 591C0 800585C0 24020001 */  addiu      $v0, $zero, 1
.L800585C4:
/* 591C4 800585C4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 591C8 800585C8 03E00008 */  jr         $ra
/* 591CC 800585CC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800585D0
/* 591D0 800585D0 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 591D4 800585D4 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 591D8 800585D8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 591DC 800585DC AFBF0014 */  sw         $ra, 0x14($sp)
/* 591E0 800585E0 AFB00010 */  sw         $s0, 0x10($sp)
/* 591E4 800585E4 8C650084 */  lw         $a1, 0x84($v1)
/* 591E8 800585E8 90A20014 */  lbu        $v0, 0x14($a1)
/* 591EC 800585EC 14400008 */  bnez       $v0, .L80058610
/* 591F0 800585F0 3090FFFF */   andi      $s0, $a0, 0xffff
/* 591F4 800585F4 0C016479 */  jal        func_800591E4
/* 591F8 800585F8 00000000 */   nop
/* 591FC 800585FC 00402021 */  addu       $a0, $v0, $zero
/* 59200 80058600 0C01630B */  jal        ApplyStimulus
/* 59204 80058604 02002821 */   addu      $a1, $s0, $zero
/* 59208 80058608 0801618A */  j          .L80058628
/* 5920C 8005860C 8FBF0014 */   lw        $ra, 0x14($sp)
.L80058610:
/* 59210 80058610 0C0166BA */  jal        func_80059AE8
/* 59214 80058614 00000000 */   nop
/* 59218 80058618 00402021 */  addu       $a0, $v0, $zero
/* 5921C 8005861C 0C01630B */  jal        ApplyStimulus
/* 59220 80058620 02002821 */   addu      $a1, $s0, $zero
/* 59224 80058624 8FBF0014 */  lw         $ra, 0x14($sp)
.L80058628:
/* 59228 80058628 8FB00010 */  lw         $s0, 0x10($sp)
/* 5922C 8005862C 03E00008 */  jr         $ra
/* 59230 80058630 27BD0018 */   addiu     $sp, $sp, 0x18

glabel some_debug_func_3
/* 59234 80058634 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59238 80058638 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 5923C 8005863C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59240 80058640 AFBF0010 */  sw         $ra, 0x10($sp)
/* 59244 80058644 8C640084 */  lw         $a0, 0x84($v1)
/* 59248 80058648 90850014 */  lbu        $a1, 0x14($a0)
/* 5924C 8005864C 24020001 */  addiu      $v0, $zero, 1
/* 59250 80058650 14A20004 */  bne        $a1, $v0, .L80058664
/* 59254 80058654 8FBF0010 */   lw        $ra, 0x10($sp)
/* 59258 80058658 0C0066F2 */  jal        debug_sub_3
/* 5925C 8005865C 00000000 */   nop
/* 59260 80058660 8FBF0010 */  lw         $ra, 0x10($sp)
.L80058664:
/* 59264 80058664 03E00008 */  jr         $ra
/* 59268 80058668 27BD0018 */   addiu     $sp, $sp, 0x18

glabel set_shopkeep
/* 5926C 8005866C 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59270 80058670 8C42E960 */  lw         $v0, %lo(dialougemode_pointer)($v0)
/* 59274 80058674 904300AA */  lbu        $v1, 0xaa($v0)
/* 59278 80058678 14600007 */  bnez       $v1, .L80058698
/* 5927C 8005867C 944401BE */   lhu       $a0, 0x1be($v0)
/* 59280 80058680 8C420078 */  lw         $v0, 0x78($v0)
/* 59284 80058684 50400005 */  beql       $v0, $zero, .L8005869C
/* 59288 80058688 3C02800E */   lui       $v0, 0x800e
/* 5928C 8005868C 8C420000 */  lw         $v0, ($v0)
/* 59290 80058690 54400001 */  bnel       $v0, $zero, .L80058698
/* 59294 80058694 94440756 */   lhu       $a0, 0x756($v0)
.L80058698:
/* 59298 80058698 3C02800E */  lui        $v0, %hi(current_shopkeep)
.L8005869C:
/* 5929C 8005869C A4446986 */  sh         $a0, %lo(current_shopkeep)($v0)
/* 592A0 800586A0 03E00008 */  jr         $ra
/* 592A4 800586A4 00801021 */   addu      $v0, $a0, $zero

glabel init_skill_trainer
/* 592A8 800586A8 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 592AC 800586AC AFBF0034 */  sw         $ra, 0x34($sp)
/* 592B0 800586B0 AFBE0030 */  sw         $fp, 0x30($sp)
/* 592B4 800586B4 AFB7002C */  sw         $s7, 0x2c($sp)
/* 592B8 800586B8 AFB60028 */  sw         $s6, 0x28($sp)
/* 592BC 800586BC AFB50024 */  sw         $s5, 0x24($sp)
/* 592C0 800586C0 AFB40020 */  sw         $s4, 0x20($sp)
/* 592C4 800586C4 AFB3001C */  sw         $s3, 0x1c($sp)
/* 592C8 800586C8 AFB20018 */  sw         $s2, 0x18($sp)
/* 592CC 800586CC AFB10014 */  sw         $s1, 0x14($sp)
/* 592D0 800586D0 0C01619B */  jal        set_shopkeep
/* 592D4 800586D4 AFB00010 */   sw        $s0, 0x10($sp)
/* 592D8 800586D8 00408021 */  addu       $s0, $v0, $zero
/* 592DC 800586DC 1200004D */  beqz       $s0, .L80058814
/* 592E0 800586E0 02002021 */   addu      $a0, $s0, $zero
/* 592E4 800586E4 00002821 */  addu       $a1, $zero, $zero
/* 592E8 800586E8 0C01D77A */  jal        GetIDIndex
/* 592EC 800586EC 00003021 */   addu      $a2, $zero, $zero
/* 592F0 800586F0 00009821 */  addu       $s3, $zero, $zero
/* 592F4 800586F4 24040030 */  addiu      $a0, $zero, 0x30
/* 592F8 800586F8 3C08800E */  lui        $t0, %hi(D_800DEB6C)
/* 592FC 800586FC 2505EB6C */  addiu      $a1, $t0, %lo(D_800DEB6C)
/* 59300 80058700 24060297 */  addiu      $a2, $zero, 0x297
/* 59304 80058704 02609021 */  addu       $s2, $s3, $zero
/* 59308 80058708 02608821 */  addu       $s1, $s3, $zero
/* 5930C 8005870C 3C03800F */  lui        $v1, %hi(EntityPointer)
/* 59310 80058710 8C6713A0 */  lw         $a3, %lo(EntityPointer)($v1)
/* 59314 80058714 0100A821 */  addu       $s5, $t0, $zero
/* 59318 80058718 8CE30010 */  lw         $v1, 0x10($a3)
/* 5931C 8005871C 000211C0 */  sll        $v0, $v0, 7
/* 59320 80058720 0C025F9C */  jal        Malloc
/* 59324 80058724 0062A021 */   addu      $s4, $v1, $v0
/* 59328 80058728 0040F021 */  addu       $fp, $v0, $zero
/* 5932C 8005872C 03C02021 */  addu       $a0, $fp, $zero
/* 59330 80058730 0C020CD3 */  jal        init_char_skills
/* 59334 80058734 02002821 */   addu      $a1, $s0, $zero
/* 59338 80058738 2405FFFF */  addiu      $a1, $zero, -1
/* 5933C 8005873C 26840046 */  addiu      $a0, $s4, 0x46
/* 59340 80058740 0080B021 */  addu       $s6, $a0, $zero
/* 59344 80058744 00111040 */  sll        $v0, $s1, 1
.L80058748:
/* 59348 80058748 00821021 */  addu       $v0, $a0, $v0
/* 5934C 8005874C 84430000 */  lh         $v1, ($v0)
/* 59350 80058750 10650002 */  beq        $v1, $a1, .L8005875C
/* 59354 80058754 26420001 */   addiu     $v0, $s2, 1
/* 59358 80058758 3052FFFF */  andi       $s2, $v0, 0xffff
.L8005875C:
/* 5935C 8005875C 26220001 */  addiu      $v0, $s1, 1
/* 59360 80058760 3051FFFF */  andi       $s1, $v0, 0xffff
/* 59364 80058764 2E230005 */  sltiu      $v1, $s1, 5
/* 59368 80058768 1460FFF7 */  bnez       $v1, .L80058748
/* 5936C 8005876C 00111040 */   sll       $v0, $s1, 1
/* 59370 80058770 12400025 */  beqz       $s2, .L80058808
/* 59374 80058774 24040008 */   addiu     $a0, $zero, 8
/* 59378 80058778 26A5EB6C */  addiu      $a1, $s5, -0x1494
/* 5937C 8005877C 0C025F9C */  jal        Malloc
/* 59380 80058780 240602A2 */   addiu     $a2, $zero, 0x2a2
/* 59384 80058784 00409821 */  addu       $s3, $v0, $zero
/* 59388 80058788 02602021 */  addu       $a0, $s3, $zero
/* 5938C 8005878C 0C021093 */  jal        malloc_spell
/* 59390 80058790 324500FF */   andi      $a1, $s2, 0xff
/* 59394 80058794 A2720004 */  sb         $s2, 4($s3)
/* 59398 80058798 00009021 */  addu       $s2, $zero, $zero
/* 5939C 8005879C 00008821 */  addu       $s1, $zero, $zero
/* 593A0 800587A0 2417FFFF */  addiu      $s7, $zero, -1
/* 593A4 800587A4 26940050 */  addiu      $s4, $s4, 0x50
/* 593A8 800587A8 00111040 */  sll        $v0, $s1, 1
.L800587AC:
/* 593AC 800587AC 02C28021 */  addu       $s0, $s6, $v0
/* 593B0 800587B0 86030000 */  lh         $v1, ($s0)
/* 593B4 800587B4 1077000F */  beq        $v1, $s7, .L800587F4
/* 593B8 800587B8 26A5EB6C */   addiu     $a1, $s5, -0x1494
/* 593BC 800587BC 24040024 */  addiu      $a0, $zero, 0x24
/* 593C0 800587C0 0C025F9C */  jal        Malloc
/* 593C4 800587C4 240602AA */   addiu     $a2, $zero, 0x2aa
/* 593C8 800587C8 00121880 */  sll        $v1, $s2, 2
/* 593CC 800587CC 8E640000 */  lw         $a0, ($s3)
/* 593D0 800587D0 96050000 */  lhu        $a1, ($s0)
/* 593D4 800587D4 00641821 */  addu       $v1, $v1, $a0
/* 593D8 800587D8 02912021 */  addu       $a0, $s4, $s1
/* 593DC 800587DC AC620000 */  sw         $v0, ($v1)
/* 593E0 800587E0 90860000 */  lbu        $a2, ($a0)
/* 593E4 800587E4 0C020F94 */  jal        create_temp_spell
/* 593E8 800587E8 00402021 */   addu      $a0, $v0, $zero
/* 593EC 800587EC 26420001 */  addiu      $v0, $s2, 1
/* 593F0 800587F0 3052FFFF */  andi       $s2, $v0, 0xffff
.L800587F4:
/* 593F4 800587F4 26220001 */  addiu      $v0, $s1, 1
/* 593F8 800587F8 3051FFFF */  andi       $s1, $v0, 0xffff
/* 593FC 800587FC 2E230005 */  sltiu      $v1, $s1, 5
/* 59400 80058800 1460FFEA */  bnez       $v1, .L800587AC
/* 59404 80058804 00111040 */   sll       $v0, $s1, 1
.L80058808:
/* 59408 80058808 03C02021 */  addu       $a0, $fp, $zero
/* 5940C 8005880C 0C014282 */  jal        set_shopkeep_skills
/* 59410 80058810 02602821 */   addu      $a1, $s3, $zero
.L80058814:
/* 59414 80058814 8FBF0034 */  lw         $ra, 0x34($sp)
/* 59418 80058818 8FBE0030 */  lw         $fp, 0x30($sp)
/* 5941C 8005881C 8FB7002C */  lw         $s7, 0x2c($sp)
/* 59420 80058820 8FB60028 */  lw         $s6, 0x28($sp)
/* 59424 80058824 8FB50024 */  lw         $s5, 0x24($sp)
/* 59428 80058828 8FB40020 */  lw         $s4, 0x20($sp)
/* 5942C 8005882C 8FB3001C */  lw         $s3, 0x1c($sp)
/* 59430 80058830 8FB20018 */  lw         $s2, 0x18($sp)
/* 59434 80058834 8FB10014 */  lw         $s1, 0x14($sp)
/* 59438 80058838 8FB00010 */  lw         $s0, 0x10($sp)
/* 5943C 8005883C 03E00008 */  jr         $ra
/* 59440 80058840 27BD0038 */   addiu     $sp, $sp, 0x38

glabel shop_func
/* 59444 80058844 27BDFF88 */  addiu      $sp, $sp, -0x78
/* 59448 80058848 AFBF0074 */  sw         $ra, 0x74($sp)
/* 5944C 8005884C AFBE0070 */  sw         $fp, 0x70($sp)
/* 59450 80058850 AFB7006C */  sw         $s7, 0x6c($sp)
/* 59454 80058854 AFB60068 */  sw         $s6, 0x68($sp)
/* 59458 80058858 AFB50064 */  sw         $s5, 0x64($sp)
/* 5945C 8005885C AFB40060 */  sw         $s4, 0x60($sp)
/* 59460 80058860 AFB3005C */  sw         $s3, 0x5c($sp)
/* 59464 80058864 AFB20058 */  sw         $s2, 0x58($sp)
/* 59468 80058868 AFB10054 */  sw         $s1, 0x54($sp)
/* 5946C 8005886C 0C01619B */  jal        set_shopkeep
/* 59470 80058870 AFB00050 */   sw        $s0, 0x50($sp)
/* 59474 80058874 0040A821 */  addu       $s5, $v0, $zero
/* 59478 80058878 12A00080 */  beqz       $s5, .L80058A7C
/* 5947C 8005887C 8FBF0074 */   lw        $ra, 0x74($sp)
/* 59480 80058880 0C026259 */  jal        passToMalloc
/* 59484 80058884 24040608 */   addiu     $a0, $zero, 0x608
/* 59488 80058888 0C01F09C */  jal        build_inventory_struct
/* 5948C 8005888C 00402021 */   addu      $a0, $v0, $zero
/* 59490 80058890 0000B021 */  addu       $s6, $zero, $zero
/* 59494 80058894 3C03800F */  lui        $v1, %hi(shop_pointer)
/* 59498 80058898 8C641690 */  lw         $a0, %lo(shop_pointer)($v1)
/* 5949C 8005889C 00008821 */  addu       $s1, $zero, $zero
/* 594A0 800588A0 90830000 */  lbu        $v1, ($a0)
/* 594A4 800588A4 10600013 */  beqz       $v1, .L800588F4
/* 594A8 800588A8 00409021 */   addu      $s2, $v0, $zero
/* 594AC 800588AC 8C850004 */  lw         $a1, 4($a0)
/* 594B0 800588B0 00602021 */  addu       $a0, $v1, $zero
/* 594B4 800588B4 001110C0 */  sll        $v0, $s1, 3
.L800588B8:
/* 594B8 800588B8 00511023 */  subu       $v0, $v0, $s1
/* 594BC 800588BC 00021080 */  sll        $v0, $v0, 2
/* 594C0 800588C0 00511023 */  subu       $v0, $v0, $s1
/* 594C4 800588C4 00021080 */  sll        $v0, $v0, 2
/* 594C8 800588C8 00451021 */  addu       $v0, $v0, $a1
/* 594CC 800588CC 94430000 */  lhu        $v1, ($v0)
/* 594D0 800588D0 54750003 */  bnel       $v1, $s5, .L800588E0
/* 594D4 800588D4 26220001 */   addiu     $v0, $s1, 1
/* 594D8 800588D8 0801623C */  j          .L800588F0
/* 594DC 800588DC 0040B021 */   addu      $s6, $v0, $zero
.L800588E0:
/* 594E0 800588E0 305100FF */  andi       $s1, $v0, 0xff
/* 594E4 800588E4 0224182B */  sltu       $v1, $s1, $a0
/* 594E8 800588E8 1460FFF3 */  bnez       $v1, .L800588B8
/* 594EC 800588EC 001110C0 */   sll       $v0, $s1, 3
.L800588F0:
/* 594F0 800588F0 00008821 */  addu       $s1, $zero, $zero
.L800588F4:
/* 594F4 800588F4 26D40002 */  addiu      $s4, $s6, 2
/* 594F8 800588F8 26DE0058 */  addiu      $fp, $s6, 0x58
/* 594FC 800588FC 3C02800E */  lui        $v0, %hi(price_multi)
/* 59500 80058900 2453EB84 */  addiu      $s3, $v0, %lo(price_multi)
/* 59504 80058904 8C57EB84 */  lw         $s7, -0x147c($v0)
/* 59508 80058908 00111040 */  sll        $v0, $s1, 1
.L8005890C:
/* 5950C 8005890C 02821021 */  addu       $v0, $s4, $v0
/* 59510 80058910 03D11821 */  addu       $v1, $fp, $s1
/* 59514 80058914 94500000 */  lhu        $s0, ($v0)
/* 59518 80058918 1200003C */  beqz       $s0, .L80058A0C
/* 5951C 8005891C 90660000 */   lbu       $a2, ($v1)
/* 59520 80058920 10C0003A */  beqz       $a2, .L80058A0C
/* 59524 80058924 02002821 */   addu      $a1, $s0, $zero
/* 59528 80058928 8E430000 */  lw         $v1, ($s2)
/* 5952C 8005892C 84640030 */  lh         $a0, 0x30($v1)
/* 59530 80058930 8C620034 */  lw         $v0, 0x34($v1)
/* 59534 80058934 0040F809 */  jalr       $v0
/* 59538 80058938 02442021 */   addu      $a0, $s2, $a0
/* 5953C 8005893C 8E430000 */  lw         $v1, ($s2)
/* 59540 80058940 02002821 */  addu       $a1, $s0, $zero
/* 59544 80058944 84640050 */  lh         $a0, 0x50($v1)
/* 59548 80058948 8C620054 */  lw         $v0, 0x54($v1)
/* 5954C 8005894C 0040F809 */  jalr       $v0
/* 59550 80058950 02442021 */   addu      $a0, $s2, $a0
/* 59554 80058954 8E430000 */  lw         $v1, ($s2)
/* 59558 80058958 00402821 */  addu       $a1, $v0, $zero
/* 5955C 8005895C 84640058 */  lh         $a0, 0x58($v1)
/* 59560 80058960 8C62005C */  lw         $v0, 0x5c($v1)
/* 59564 80058964 0040F809 */  jalr       $v0
/* 59568 80058968 02442021 */   addu      $a0, $s2, $a0
/* 5956C 8005896C 8E630004 */  lw         $v1, 4($s3)
/* 59570 80058970 8E640008 */  lw         $a0, 8($s3)
/* 59574 80058974 8E65000C */  lw         $a1, 0xc($s3)
/* 59578 80058978 8E660010 */  lw         $a2, 0x10($s3)
/* 5957C 8005897C 8E670014 */  lw         $a3, 0x14($s3)
/* 59580 80058980 8E680018 */  lw         $t0, 0x18($s3)
/* 59584 80058984 8E69001C */  lw         $t1, 0x1c($s3)
/* 59588 80058988 AFB70010 */  sw         $s7, 0x10($sp)
/* 5958C 8005898C AFA30014 */  sw         $v1, 0x14($sp)
/* 59590 80058990 02D11821 */  addu       $v1, $s6, $s1
/* 59594 80058994 AFA5001C */  sw         $a1, 0x1c($sp)
/* 59598 80058998 00402821 */  addu       $a1, $v0, $zero
/* 5959C 8005899C AFA40018 */  sw         $a0, 0x18($sp)
/* 595A0 800589A0 AFA60020 */  sw         $a2, 0x20($sp)
/* 595A4 800589A4 AFA70024 */  sw         $a3, 0x24($sp)
/* 595A8 800589A8 AFA80028 */  sw         $t0, 0x28($sp)
/* 595AC 800589AC AFA9002C */  sw         $t1, 0x2c($sp)
/* 595B0 800589B0 90640044 */  lbu        $a0, 0x44($v1)
/* 595B4 800589B4 94A3000A */  lhu        $v1, 0xa($a1)
/* 595B8 800589B8 00042080 */  sll        $a0, $a0, 2
/* 595BC 800589BC 03A41021 */  addu       $v0, $sp, $a0
/* 595C0 800589C0 C4420010 */  lwc1       $f2, 0x10($v0)
/* 595C4 800589C4 44830000 */  mtc1       $v1, $f0
/* 595C8 800589C8 46800020 */  cvt.s.w    $f0, $f0
/* 595CC 800589CC 46020002 */  mul.s      $f0, $f0, $f2
/* 595D0 800589D0 3C01800E */  lui        $at, %hi(D_800DEBA4)
/* 595D4 800589D4 C422EBA4 */  lwc1       $f2, %lo(D_800DEBA4)($at)
/* 595D8 800589D8 4600103E */  c.le.s     $f2, $f0
/* 595DC 800589DC 00000000 */  nop
/* 595E0 800589E0 45030005 */  bc1tl      .L800589F8
/* 595E4 800589E4 46020001 */   sub.s     $f0, $f0, $f2
/* 595E8 800589E8 4600008D */  trunc.w.s  $f2, $f0
/* 595EC 800589EC 44021000 */  mfc1       $v0, $f2
/* 595F0 800589F0 08016283 */  j          .L80058A0C
/* 595F4 800589F4 A4A2000A */   sh        $v0, 0xa($a1)
.L800589F8:
/* 595F8 800589F8 4600008D */  trunc.w.s  $f2, $f0
/* 595FC 800589FC 44021000 */  mfc1       $v0, $f2
/* 59600 80058A00 3C038000 */  lui        $v1, 0x8000
/* 59604 80058A04 00431025 */  or         $v0, $v0, $v1
/* 59608 80058A08 A4A2000A */  sh         $v0, 0xa($a1)
.L80058A0C:
/* 5960C 80058A0C 26220001 */  addiu      $v0, $s1, 1
/* 59610 80058A10 305100FF */  andi       $s1, $v0, 0xff
/* 59614 80058A14 2E230014 */  sltiu      $v1, $s1, 0x14
/* 59618 80058A18 1460FFBC */  bnez       $v1, .L8005890C
/* 5961C 80058A1C 00111040 */   sll       $v0, $s1, 1
/* 59620 80058A20 2E220017 */  sltiu      $v0, $s1, 0x17
/* 59624 80058A24 10400011 */  beqz       $v0, .L80058A6C
/* 59628 80058A28 02402021 */   addu      $a0, $s2, $zero
/* 5962C 80058A2C 00111040 */  sll        $v0, $s1, 1
.L80058A30:
/* 59630 80058A30 02821021 */  addu       $v0, $s4, $v0
/* 59634 80058A34 94450000 */  lhu        $a1, ($v0)
/* 59638 80058A38 10A00006 */  beqz       $a1, .L80058A54
/* 5963C 80058A3C 24060001 */   addiu     $a2, $zero, 1
/* 59640 80058A40 8E430000 */  lw         $v1, ($s2)
/* 59644 80058A44 84640030 */  lh         $a0, 0x30($v1)
/* 59648 80058A48 8C620034 */  lw         $v0, 0x34($v1)
/* 5964C 80058A4C 0040F809 */  jalr       $v0
/* 59650 80058A50 02442021 */   addu      $a0, $s2, $a0
.L80058A54:
/* 59654 80058A54 26220001 */  addiu      $v0, $s1, 1
/* 59658 80058A58 305100FF */  andi       $s1, $v0, 0xff
/* 5965C 80058A5C 2E230017 */  sltiu      $v1, $s1, 0x17
/* 59660 80058A60 1460FFF3 */  bnez       $v1, .L80058A30
/* 59664 80058A64 00111040 */   sll       $v0, $s1, 1
/* 59668 80058A68 02402021 */  addu       $a0, $s2, $zero
.L80058A6C:
/* 5966C 80058A6C 00002821 */  addu       $a1, $zero, $zero
/* 59670 80058A70 0C014292 */  jal        build_loot_menu
/* 59674 80058A74 02A03021 */   addu      $a2, $s5, $zero
/* 59678 80058A78 8FBF0074 */  lw         $ra, 0x74($sp)
.L80058A7C:
/* 5967C 80058A7C 8FBE0070 */  lw         $fp, 0x70($sp)
/* 59680 80058A80 8FB7006C */  lw         $s7, 0x6c($sp)
/* 59684 80058A84 8FB60068 */  lw         $s6, 0x68($sp)
/* 59688 80058A88 8FB50064 */  lw         $s5, 0x64($sp)
/* 5968C 80058A8C 8FB40060 */  lw         $s4, 0x60($sp)
/* 59690 80058A90 8FB3005C */  lw         $s3, 0x5c($sp)
/* 59694 80058A94 8FB20058 */  lw         $s2, 0x58($sp)
/* 59698 80058A98 8FB10054 */  lw         $s1, 0x54($sp)
/* 5969C 80058A9C 8FB00050 */  lw         $s0, 0x50($sp)
/* 596A0 80058AA0 03E00008 */  jr         $ra
/* 596A4 80058AA4 27BD0078 */   addiu     $sp, $sp, 0x78

glabel set_some_borg13_flag
/* 596A8 80058AA8 3C03800F */  lui        $v1, %hi(borg13_flag)
/* 596AC 80058AAC 8C62E968 */  lw         $v0, %lo(borg13_flag)($v1)
/* 596B0 80058AB0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 596B4 80058AB4 14400004 */  bnez       $v0, .L80058AC8
/* 596B8 80058AB8 AFBF0010 */   sw        $ra, 0x10($sp)
/* 596BC 80058ABC 24020001 */  addiu      $v0, $zero, 1
/* 596C0 80058AC0 0C0160DC */  jal        func_80058370
/* 596C4 80058AC4 AC62E968 */   sw        $v0, -0x1698($v1)
.L80058AC8:
/* 596C8 80058AC8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 596CC 80058ACC 03E00008 */  jr         $ra
/* 596D0 80058AD0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80058AD4
/* 596D4 80058AD4 3C04800F */  lui        $a0, %hi(dialougemode_pointer)
/* 596D8 80058AD8 8C83E960 */  lw         $v1, %lo(dialougemode_pointer)($a0)
/* 596DC 80058ADC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 596E0 80058AE0 AFBF0010 */  sw         $ra, 0x10($sp)
/* 596E4 80058AE4 906200AD */  lbu        $v0, 0xad($v1)
/* 596E8 80058AE8 1040000F */  beqz       $v0, .L80058B28
/* 596EC 80058AEC 8FBF0010 */   lw        $ra, 0x10($sp)
/* 596F0 80058AF0 A06000AD */  sb         $zero, 0xad($v1)
/* 596F4 80058AF4 8C82E960 */  lw         $v0, -0x16a0($a0)
/* 596F8 80058AF8 8C420088 */  lw         $v0, 0x88($v0)
/* 596FC 80058AFC 1040000A */  beqz       $v0, .L80058B28
/* 59700 80058B00 00000000 */   nop
/* 59704 80058B04 8C420004 */  lw         $v0, 4($v0)
/* 59708 80058B08 10400007 */  beqz       $v0, .L80058B28
/* 5970C 80058B0C 00000000 */   nop
/* 59710 80058B10 8C42001C */  lw         $v0, 0x1c($v0)
/* 59714 80058B14 8C430004 */  lw         $v1, 4($v0)
/* 59718 80058B18 8C650020 */  lw         $a1, 0x20($v1)
/* 5971C 80058B1C 0C0160F4 */  jal        func_800583D0
/* 59720 80058B20 8CA4000C */   lw        $a0, 0xc($a1)
/* 59724 80058B24 8FBF0010 */  lw         $ra, 0x10($sp)
.L80058B28:
/* 59728 80058B28 03E00008 */  jr         $ra
/* 5972C 80058B2C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80058B30
/* 59730 80058B30 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59734 80058B34 8C45E960 */  lw         $a1, %lo(dialougemode_pointer)($v0)
/* 59738 80058B38 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5973C 80058B3C AFBF0010 */  sw         $ra, 0x10($sp)
/* 59740 80058B40 8CA300A4 */  lw         $v1, 0xa4($a1)
/* 59744 80058B44 1060000D */  beqz       $v1, .L80058B7C
/* 59748 80058B48 3084FFFF */   andi      $a0, $a0, 0xffff
/* 5974C 80058B4C 94A3009C */  lhu        $v1, 0x9c($a1)
/* 59750 80058B50 0083102B */  sltu       $v0, $a0, $v1
/* 59754 80058B54 10400003 */  beqz       $v0, .L80058B64
/* 59758 80058B58 00641023 */   subu      $v0, $v1, $a0
/* 5975C 80058B5C 080162DF */  j          .L80058B7C
/* 59760 80058B60 A4A2009C */   sh        $v0, 0x9c($a1)
.L80058B64:
/* 59764 80058B64 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 59768 80058B68 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5976C 80058B6C A4A0009C */  sh         $zero, 0x9c($a1)
/* 59770 80058B70 ACA000A4 */  sw         $zero, 0xa4($a1)
/* 59774 80058B74 0C013C99 */  jal        func_8004F264
/* 59778 80058B78 ACA000A0 */   sw        $zero, 0xa0($a1)
.L80058B7C:
/* 5977C 80058B7C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 59780 80058B80 03E00008 */  jr         $ra
/* 59784 80058B84 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80058B88
/* 59788 80058B88 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5978C 80058B8C 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59790 80058B90 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 59794 80058B94 00803021 */  addu       $a2, $a0, $zero
/* 59798 80058B98 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5979C 80058B9C AFB10014 */  sw         $s1, 0x14($sp)
/* 597A0 80058BA0 AFB00010 */  sw         $s0, 0x10($sp)
/* 597A4 80058BA4 8C640084 */  lw         $a0, 0x84($v1)
/* 597A8 80058BA8 90830014 */  lbu        $v1, 0x14($a0)
/* 597AC 80058BAC 24020001 */  addiu      $v0, $zero, 1
/* 597B0 80058BB0 1062000A */  beq        $v1, $v0, .L80058BDC
/* 597B4 80058BB4 30B1FFFF */   andi      $s1, $a1, 0xffff
/* 597B8 80058BB8 28620002 */  slti       $v0, $v1, 2
/* 597BC 80058BBC 14400012 */  bnez       $v0, .L80058C08
/* 597C0 80058BC0 28620005 */   slti      $v0, $v1, 5
/* 597C4 80058BC4 10400010 */  beqz       $v0, .L80058C08
/* 597C8 80058BC8 3C02800E */   lui       $v0, %hi(gGlobals)
/* 597CC 80058BCC 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 597D0 80058BD0 A4401622 */  sh         $zero, 0x1622($v0)
/* 597D4 80058BD4 08016306 */  j          .L80058C18
/* 597D8 80058BD8 A4401620 */   sh        $zero, 0x1620($v0)
.L80058BDC:
/* 597DC 80058BDC 00C02021 */  addu       $a0, $a2, $zero
/* 597E0 80058BE0 00118400 */  sll        $s0, $s1, 0x10
/* 597E4 80058BE4 00108403 */  sra        $s0, $s0, 0x10
/* 597E8 80058BE8 02002821 */  addu       $a1, $s0, $zero
/* 597EC 80058BEC 0C004795 */  jal        handleZoneEngineFrame
/* 597F0 80058BF0 00003021 */   addu      $a2, $zero, $zero
/* 597F4 80058BF4 3C04800E */  lui        $a0, %hi(SFXStruct)
/* 597F8 80058BF8 24847BA0 */  addiu      $a0, $a0, %lo(SFXStruct)
/* 597FC 80058BFC 2485EF1C */  addiu      $a1, $a0, -0x10e4
/* 59800 80058C00 0C0159CB */  jal        ProcessAudioBubbles
/* 59804 80058C04 02003021 */   addu      $a2, $s0, $zero
.L80058C08:
/* 59808 80058C08 0C0162B5 */  jal        func_80058AD4
/* 5980C 80058C0C 00000000 */   nop
/* 59810 80058C10 0C0162CC */  jal        func_80058B30
/* 59814 80058C14 02202021 */   addu      $a0, $s1, $zero
.L80058C18:
/* 59818 80058C18 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5981C 80058C1C 8FB10014 */  lw         $s1, 0x14($sp)
/* 59820 80058C20 8FB00010 */  lw         $s0, 0x10($sp)
/* 59824 80058C24 03E00008 */  jr         $ra
/* 59828 80058C28 27BD0020 */   addiu     $sp, $sp, 0x20

glabel ApplyStimulus
/* 5982C 80058C2C 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 59830 80058C30 AFB20018 */  sw         $s2, 0x18($sp)
/* 59834 80058C34 00809021 */  addu       $s2, $a0, $zero
/* 59838 80058C38 AFB10014 */  sw         $s1, 0x14($sp)
/* 5983C 80058C3C 30B1FFFF */  andi       $s1, $a1, 0xffff
/* 59840 80058C40 AFBF001C */  sw         $ra, 0x1c($sp)
/* 59844 80058C44 12400013 */  beqz       $s2, .L80058C94
/* 59848 80058C48 AFB00010 */   sw        $s0, 0x10($sp)
/* 5984C 80058C4C 3C10800F */  lui        $s0, %hi(gGlobalsText)
/* 59850 80058C50 26108920 */  addiu      $s0, $s0, %lo(gGlobalsText)
/* 59854 80058C54 02002021 */  addu       $a0, $s0, $zero
/* 59858 80058C58 3C05800E */  lui        $a1, %hi(D_800DEBA8)
/* 5985C 80058C5C 24A5EBA8 */  addiu      $a1, $a1, %lo(D_800DEBA8)
/* 59860 80058C60 0C0333AC */  jal        sprintf
/* 59864 80058C64 02203021 */   addu      $a2, $s1, $zero
/* 59868 80058C68 0C00B6B8 */  jal        debug_queue
/* 5986C 80058C6C 02002021 */   addu      $a0, $s0, $zero
/* 59870 80058C70 3C04800F */  lui        $a0, %hi(dialougemode_pointer)
/* 59874 80058C74 8C83E960 */  lw         $v1, %lo(dialougemode_pointer)($a0)
/* 59878 80058C78 24050001 */  addiu      $a1, $zero, 1
/* 5987C 80058C7C A6510014 */  sh         $s1, 0x14($s2)
/* 59880 80058C80 A06500AC */  sb         $a1, 0xac($v1)
/* 59884 80058C84 8C82E960 */  lw         $v0, -0x16a0($a0)
/* 59888 80058C88 A04500AD */  sb         $a1, 0xad($v0)
/* 5988C 80058C8C 8C83E960 */  lw         $v1, -0x16a0($a0)
/* 59890 80058C90 AC720088 */  sw         $s2, 0x88($v1)
.L80058C94:
/* 59894 80058C94 8FBF001C */  lw         $ra, 0x1c($sp)
/* 59898 80058C98 8FB20018 */  lw         $s2, 0x18($sp)
/* 5989C 80058C9C 8FB10014 */  lw         $s1, 0x14($sp)
/* 598A0 80058CA0 8FB00010 */  lw         $s0, 0x10($sp)
/* 598A4 80058CA4 03E00008 */  jr         $ra
/* 598A8 80058CA8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel get_dialougemode_funcs
/* 598AC 80058CAC 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 598B0 80058CB0 3C038006 */  lui        $v1, %hi(func_80059888)
/* 598B4 80058CB4 24639888 */  addiu      $v1, $v1, %lo(func_80059888)
/* 598B8 80058CB8 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 598BC 80058CBC 3C028006 */  lui        $v0, %hi(func_80059B28)
/* 598C0 80058CC0 24429B28 */  addiu      $v0, $v0, %lo(func_80059B28)
/* 598C4 80058CC4 3C058006 */  lui        $a1, %hi(NOOP_80059D08)
/* 598C8 80058CC8 24A59D08 */  addiu      $a1, $a1, %lo(NOOP_80059D08)
/* 598CC 80058CCC AC830000 */  sw         $v1, ($a0)
/* 598D0 80058CD0 3C038006 */  lui        $v1, %hi(camping_var_11)
/* 598D4 80058CD4 24639CF8 */  addiu      $v1, $v1, %lo(camping_var_11)
/* 598D8 80058CD8 AC820004 */  sw         $v0, 4($a0)
/* 598DC 80058CDC 3C028006 */  lui        $v0, %hi(func_80059D38)
/* 598E0 80058CE0 24429D38 */  addiu      $v0, $v0, %lo(func_80059D38)
/* 598E4 80058CE4 AC82000C */  sw         $v0, 0xc($a0)
/* 598E8 80058CE8 3C028006 */  lui        $v0, %hi(func_800598FC)
/* 598EC 80058CEC 244298FC */  addiu      $v0, $v0, %lo(func_800598FC)
/* 598F0 80058CF0 AC830008 */  sw         $v1, 8($a0)
/* 598F4 80058CF4 AC830010 */  sw         $v1, 0x10($a0)
/* 598F8 80058CF8 3C038006 */  lui        $v1, %hi(func_80059B50)
/* 598FC 80058CFC 24639B50 */  addiu      $v1, $v1, %lo(func_80059B50)
/* 59900 80058D00 AC820014 */  sw         $v0, 0x14($a0)
/* 59904 80058D04 3C028006 */  lui        $v0, %hi(NOOP_80059d7c)
/* 59908 80058D08 24429D7C */  addiu      $v0, $v0, %lo(NOOP_80059d7c)
/* 5990C 80058D0C AC820020 */  sw         $v0, 0x20($a0)
/* 59910 80058D10 3C028006 */  lui        $v0, %hi(func_80059970)
/* 59914 80058D14 24429970 */  addiu      $v0, $v0, %lo(func_80059970)
/* 59918 80058D18 AC830018 */  sw         $v1, 0x18($a0)
/* 5991C 80058D1C 3C038006 */  lui        $v1, %hi(func_80059BF8)
/* 59920 80058D20 24639BF8 */  addiu      $v1, $v1, %lo(func_80059BF8)
/* 59924 80058D24 AC85001C */  sw         $a1, 0x1c($a0)
/* 59928 80058D28 AC850024 */  sw         $a1, 0x24($a0)
/* 5992C 80058D2C 3C058006 */  lui        $a1, %hi(func_80059D10)
/* 59930 80058D30 24A59D10 */  addiu      $a1, $a1, %lo(func_80059D10)
/* 59934 80058D34 AC820028 */  sw         $v0, 0x28($a0)
/* 59938 80058D38 3C028006 */  lui        $v0, %hi(func_80059D84)
/* 5993C 80058D3C 24429D84 */  addiu      $v0, $v0, %lo(func_80059D84)
/* 59940 80058D40 AC820034 */  sw         $v0, 0x34($a0)
/* 59944 80058D44 3C028006 */  lui        $v0, %hi(func_800599F0)
/* 59948 80058D48 244299F0 */  addiu      $v0, $v0, %lo(func_800599F0)
/* 5994C 80058D4C AC83002C */  sw         $v1, 0x2c($a0)
/* 59950 80058D50 3C038006 */  lui        $v1, %hi(func_80059C70)
/* 59954 80058D54 24639C70 */  addiu      $v1, $v1, %lo(func_80059C70)
/* 59958 80058D58 AC82003C */  sw         $v0, 0x3c($a0)
/* 5995C 80058D5C 3C028006 */  lui        $v0, %hi(func_80059DAC)
/* 59960 80058D60 24429DAC */  addiu      $v0, $v0, %lo(func_80059DAC)
/* 59964 80058D64 AC850030 */  sw         $a1, 0x30($a0)
/* 59968 80058D68 AC850038 */  sw         $a1, 0x38($a0)
/* 5996C 80058D6C 3C058006 */  lui        $a1, %hi(DialogueModeInitPrescripted)
/* 59970 80058D70 24A592C0 */  addiu      $a1, $a1, %lo(DialogueModeInitPrescripted)
/* 59974 80058D74 AC820048 */  sw         $v0, 0x48($a0)
/* 59978 80058D78 3C028006 */  lui        $v0, %hi(func_80059628)
/* 5997C 80058D7C 24429628 */  addiu      $v0, $v0, %lo(func_80059628)
/* 59980 80058D80 AC830040 */  sw         $v1, 0x40($a0)
/* 59984 80058D84 AC830044 */  sw         $v1, 0x44($a0)
/* 59988 80058D88 AC83004C */  sw         $v1, 0x4c($a0)
/* 5998C 80058D8C 3C038006 */  lui        $v1, %hi(load_one_of_two_cinematics)
/* 59990 80058D90 246393C0 */  addiu      $v1, $v1, %lo(load_one_of_two_cinematics)
/* 59994 80058D94 AC820058 */  sw         $v0, 0x58($a0)
/* 59998 80058D98 AC820060 */  sw         $v0, 0x60($a0)
/* 5999C 80058D9C 3C028006 */  lui        $v0, %hi(func_80059674)
/* 599A0 80058DA0 24429674 */  addiu      $v0, $v0, %lo(func_80059674)
/* 599A4 80058DA4 AC850050 */  sw         $a1, 0x50($a0)
/* 599A8 80058DA8 AC850054 */  sw         $a1, 0x54($a0)
/* 599AC 80058DAC AC85005C */  sw         $a1, 0x5c($a0)
/* 599B0 80058DB0 AC830064 */  sw         $v1, 0x64($a0)
/* 599B4 80058DB4 AC830068 */  sw         $v1, 0x68($a0)
/* 599B8 80058DB8 AC82006C */  sw         $v0, 0x6c($a0)
/* 599BC 80058DBC AC830070 */  sw         $v1, 0x70($a0)
/* 599C0 80058DC0 03E00008 */  jr         $ra
/* 599C4 80058DC4 AC820074 */   sw        $v0, 0x74($a0)

glabel NOOP_80058dc8
/* 599C8 80058DC8 03E00008 */  jr         $ra
/* 599CC 80058DCC 00000000 */   nop

glabel get_some_borg13
/* 599D0 80058DD0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 599D4 80058DD4 AFBF0010 */  sw         $ra, 0x10($sp)
/* 599D8 80058DD8 0C029CEA */  jal        get_borg13
/* 599DC 80058DDC 00000000 */   nop
/* 599E0 80058DE0 3C03800F */  lui        $v1, %hi(borg_13_pointer)
/* 599E4 80058DE4 14400003 */  bnez       $v0, .L80058DF4
/* 599E8 80058DE8 AC62E964 */   sw        $v0, %lo(borg_13_pointer)($v1)
/* 599EC 80058DEC 3C02800E */  lui        $v0, %hi(encounter_dat+0x1A)
/* 599F0 80058DF0 A4407C8E */  sh         $zero, %lo(encounter_dat+0x1A)($v0)
.L80058DF4:
/* 599F4 80058DF4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 599F8 80058DF8 03E00008 */  jr         $ra
/* 599FC 80058DFC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dialougmode_struct_init
/* 59A00 80058E00 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 59A04 80058E04 AFB60028 */  sw         $s6, 0x28($sp)
/* 59A08 80058E08 0080B021 */  addu       $s6, $a0, $zero
/* 59A0C 80058E0C 240401CC */  addiu      $a0, $zero, 0x1cc
/* 59A10 80058E10 AFB7002C */  sw         $s7, 0x2c($sp)
/* 59A14 80058E14 30B7FFFF */  andi       $s7, $a1, 0xffff
/* 59A18 80058E18 AFB00010 */  sw         $s0, 0x10($sp)
/* 59A1C 80058E1C 3C10800E */  lui        $s0, %hi(D_800DEB6C)
/* 59A20 80058E20 2610EB6C */  addiu      $s0, $s0, %lo(D_800DEB6C)
/* 59A24 80058E24 02002821 */  addu       $a1, $s0, $zero
/* 59A28 80058E28 AFB3001C */  sw         $s3, 0x1c($sp)
/* 59A2C 80058E2C 00069C00 */  sll        $s3, $a2, 0x10
/* 59A30 80058E30 240603A3 */  addiu      $a2, $zero, 0x3a3
/* 59A34 80058E34 AFB40020 */  sw         $s4, 0x20($sp)
/* 59A38 80058E38 87B4004A */  lh         $s4, 0x4a($sp)
/* 59A3C 80058E3C 00139C03 */  sra        $s3, $s3, 0x10
/* 59A40 80058E40 AFB20018 */  sw         $s2, 0x18($sp)
/* 59A44 80058E44 00079400 */  sll        $s2, $a3, 0x10
/* 59A48 80058E48 AFB50024 */  sw         $s5, 0x24($sp)
/* 59A4C 80058E4C 97B5004E */  lhu        $s5, 0x4e($sp)
/* 59A50 80058E50 00129403 */  sra        $s2, $s2, 0x10
/* 59A54 80058E54 AFBF0030 */  sw         $ra, 0x30($sp)
/* 59A58 80058E58 0C025F9C */  jal        Malloc
/* 59A5C 80058E5C AFB10014 */   sw        $s1, 0x14($sp)
/* 59A60 80058E60 00402021 */  addu       $a0, $v0, $zero
/* 59A64 80058E64 00002821 */  addu       $a1, $zero, $zero
/* 59A68 80058E68 240601CC */  addiu      $a2, $zero, 0x1cc
/* 59A6C 80058E6C 3C11800F */  lui        $s1, %hi(dialougemode_pointer)
/* 59A70 80058E70 0C026380 */  jal        Calloc
/* 59A74 80058E74 AE22E960 */   sw        $v0, %lo(dialougemode_pointer)($s1)
/* 59A78 80058E78 2404000C */  addiu      $a0, $zero, 0xc
/* 59A7C 80058E7C 02002821 */  addu       $a1, $s0, $zero
/* 59A80 80058E80 3C03800F */  lui        $v1, %hi(borg_13_pointer)
/* 59A84 80058E84 8C66E964 */  lw         $a2, %lo(borg_13_pointer)($v1)
/* 59A88 80058E88 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 59A8C 80058E8C 8CC80010 */  lw         $t0, 0x10($a2)
/* 59A90 80058E90 24030001 */  addiu      $v1, $zero, 1
/* 59A94 80058E94 A04000AB */  sb         $zero, 0xab($v0)
/* 59A98 80058E98 8E27E960 */  lw         $a3, -0x16a0($s1)
/* 59A9C 80058E9C 240603B2 */  addiu      $a2, $zero, 0x3b2
/* 59AA0 80058EA0 AC56008C */  sw         $s6, 0x8c($v0)
/* 59AA4 80058EA4 A4530096 */  sh         $s3, 0x96($v0)
/* 59AA8 80058EA8 A4520098 */  sh         $s2, 0x98($v0)
/* 59AAC 80058EAC A454009A */  sh         $s4, 0x9a($v0)
/* 59AB0 80058EB0 A4570094 */  sh         $s7, 0x94($v0)
/* 59AB4 80058EB4 AC430090 */  sw         $v1, 0x90($v0)
/* 59AB8 80058EB8 AC480084 */  sw         $t0, 0x84($v0)
/* 59ABC 80058EBC 0C025F9C */  jal        Malloc
/* 59AC0 80058EC0 A4F5007C */   sh        $s5, 0x7c($a3)
/* 59AC4 80058EC4 00402021 */  addu       $a0, $v0, $zero
/* 59AC8 80058EC8 3405FFFF */  ori        $a1, $zero, 0xffff
/* 59ACC 80058ECC 8E23E960 */  lw         $v1, -0x16a0($s1)
/* 59AD0 80058ED0 2406000C */  addiu      $a2, $zero, 0xc
/* 59AD4 80058ED4 0C026380 */  jal        Calloc
/* 59AD8 80058ED8 AC620080 */   sw        $v0, 0x80($v1)
/* 59ADC 80058EDC 8E24E960 */  lw         $a0, -0x16a0($s1)
/* 59AE0 80058EE0 8C850084 */  lw         $a1, 0x84($a0)
/* 59AE4 80058EE4 94860094 */  lhu        $a2, 0x94($a0)
/* 59AE8 80058EE8 0C02DB0E */  jal        func_800B6C38
/* 59AEC 80058EEC 248400B4 */   addiu     $a0, $a0, 0xb4
/* 59AF0 80058EF0 8E24E960 */  lw         $a0, -0x16a0($s1)
/* 59AF4 80058EF4 8C820084 */  lw         $v0, 0x84($a0)
/* 59AF8 80058EF8 90430014 */  lbu        $v1, 0x14($v0)
/* 59AFC 80058EFC 0C01632B */  jal        get_dialougemode_funcs
/* 59B00 80058F00 A08300AA */   sb        $v1, 0xaa($a0)
/* 59B04 80058F04 8FBF0030 */  lw         $ra, 0x30($sp)
/* 59B08 80058F08 8FB7002C */  lw         $s7, 0x2c($sp)
/* 59B0C 80058F0C 8FB60028 */  lw         $s6, 0x28($sp)
/* 59B10 80058F10 8FB50024 */  lw         $s5, 0x24($sp)
/* 59B14 80058F14 8FB40020 */  lw         $s4, 0x20($sp)
/* 59B18 80058F18 8FB3001C */  lw         $s3, 0x1c($sp)
/* 59B1C 80058F1C 8FB20018 */  lw         $s2, 0x18($sp)
/* 59B20 80058F20 8FB10014 */  lw         $s1, 0x14($sp)
/* 59B24 80058F24 8FB00010 */  lw         $s0, 0x10($sp)
/* 59B28 80058F28 24020001 */  addiu      $v0, $zero, 1
/* 59B2C 80058F2C 03E00008 */  jr         $ra
/* 59B30 80058F30 27BD0038 */   addiu     $sp, $sp, 0x38

glabel clear_borg13_pointer
/* 59B34 80058F34 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59B38 80058F38 AFB00010 */  sw         $s0, 0x10($sp)
/* 59B3C 80058F3C 3C10800F */  lui        $s0, %hi(borg_13_pointer)
/* 59B40 80058F40 8E02E964 */  lw         $v0, %lo(borg_13_pointer)($s0)
/* 59B44 80058F44 2605E964 */  addiu      $a1, $s0, -0x169c
/* 59B48 80058F48 10400007 */  beqz       $v0, .L80058F68
/* 59B4C 80058F4C AFBF0014 */   sw        $ra, 0x14($sp)
/* 59B50 80058F50 3C04800E */  lui        $a0, %hi(queueStructA)
/* 59B54 80058F54 24847ECC */  addiu      $a0, $a0, %lo(queueStructA)
/* 59B58 80058F58 24060005 */  addiu      $a2, $zero, 5
/* 59B5C 80058F5C 0C035867 */  jal        AllocFreeQueueItem
/* 59B60 80058F60 00003821 */   addu      $a3, $zero, $zero
/* 59B64 80058F64 AE00E964 */  sw         $zero, -0x169c($s0)
.L80058F68:
/* 59B68 80058F68 8FBF0014 */  lw         $ra, 0x14($sp)
/* 59B6C 80058F6C 8FB00010 */  lw         $s0, 0x10($sp)
/* 59B70 80058F70 03E00008 */  jr         $ra
/* 59B74 80058F74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel dialougmode_free
/* 59B78 80058F78 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 59B7C 80058F7C AFB10014 */  sw         $s1, 0x14($sp)
/* 59B80 80058F80 3C11800F */  lui        $s1, %hi(dialougemode_pointer)
/* 59B84 80058F84 8E22E960 */  lw         $v0, %lo(dialougemode_pointer)($s1)
/* 59B88 80058F88 AFBF0018 */  sw         $ra, 0x18($sp)
/* 59B8C 80058F8C 10400015 */  beqz       $v0, .L80058FE4
/* 59B90 80058F90 AFB00010 */   sw        $s0, 0x10($sp)
/* 59B94 80058F94 8C4200B0 */  lw         $v0, 0xb0($v0)
/* 59B98 80058F98 10400003 */  beqz       $v0, .L80058FA8
/* 59B9C 80058F9C 3C02800F */   lui       $v0, %hi(TerrainPointer)
/* 59BA0 80058FA0 0C0215B2 */  jal        lapse_8_hours
/* 59BA4 80058FA4 8C441BBC */   lw        $a0, %lo(TerrainPointer)($v0)
.L80058FA8:
/* 59BA8 80058FA8 3C10800E */  lui        $s0, %hi(D_800DEB6C)
/* 59BAC 80058FAC 2610EB6C */  addiu      $s0, $s0, %lo(D_800DEB6C)
/* 59BB0 80058FB0 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 59BB4 80058FB4 02002821 */  addu       $a1, $s0, $zero
/* 59BB8 80058FB8 8C440080 */  lw         $a0, 0x80($v0)
/* 59BBC 80058FBC 0C02600C */  jal        Free
/* 59BC0 80058FC0 240603CD */   addiu     $a2, $zero, 0x3cd
/* 59BC4 80058FC4 02002821 */  addu       $a1, $s0, $zero
/* 59BC8 80058FC8 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 59BCC 80058FCC 240603D0 */  addiu      $a2, $zero, 0x3d0
/* 59BD0 80058FD0 00402021 */  addu       $a0, $v0, $zero
/* 59BD4 80058FD4 0C02600C */  jal        Free
/* 59BD8 80058FD8 AC400080 */   sw        $zero, 0x80($v0)
/* 59BDC 80058FDC 0C016372 */  jal        NOOP_80058dc8
/* 59BE0 80058FE0 AE20E960 */   sw        $zero, -0x16a0($s1)
.L80058FE4:
/* 59BE4 80058FE4 8FBF0018 */  lw         $ra, 0x18($sp)
/* 59BE8 80058FE8 8FB10014 */  lw         $s1, 0x14($sp)
/* 59BEC 80058FEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 59BF0 80058FF0 03E00008 */  jr         $ra
/* 59BF4 80058FF4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel cutScene_control_func
/* 59BF8 80058FF8 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* 59BFC 80058FFC AFB1001C */  sw         $s1, 0x1c($sp)
/* 59C00 80059000 00008821 */  addu       $s1, $zero, $zero
/* 59C04 80059004 AFBF0028 */  sw         $ra, 0x28($sp)
/* 59C08 80059008 AFB30024 */  sw         $s3, 0x24($sp)
/* 59C0C 8005900C AFB20020 */  sw         $s2, 0x20($sp)
/* 59C10 80059010 AFB00018 */  sw         $s0, 0x18($sp)
/* 59C14 80059014 AFA00010 */  sw         $zero, 0x10($sp)
/* 59C18 80059018 08016458 */  j          .L80059160
/* 59C1C 8005901C 27B30010 */   addiu     $s3, $sp, 0x10
.L80059020:
/* 59C20 80059020 305100FF */  andi       $s1, $v0, 0xff
/* 59C24 80059024 3C03800E */  lui        $v1, %hi(gGlobals)
/* 59C28 80059028 246268A8 */  addiu      $v0, $v1, %lo(gGlobals)
/* 59C2C 8005902C 94442048 */  lhu        $a0, 0x2048($v0)
/* 59C30 80059030 1480004B */  bnez       $a0, .L80059160
/* 59C34 80059034 00608021 */   addu      $s0, $v1, $zero
/* 59C38 80059038 8FA20010 */  lw         $v0, 0x10($sp)
/* 59C3C 8005903C 8C440008 */  lw         $a0, 8($v0)
/* 59C40 80059040 30834000 */  andi       $v1, $a0, 0x4000
/* 59C44 80059044 10600004 */  beqz       $v1, .L80059058
/* 59C48 80059048 3C03800F */   lui       $v1, %hi(unusedDialougToggle)
/* 59C4C 8005904C 8C62E9B0 */  lw         $v0, %lo(unusedDialougToggle)($v1)
/* 59C50 80059050 38420001 */  xori       $v0, $v0, 1
/* 59C54 80059054 AC62E9B0 */  sw         $v0, -0x1650($v1)
.L80059058:
/* 59C58 80059058 3C02800E */  lui        $v0, %hi(debug_flag)
/* 59C5C 8005905C 944368A0 */  lhu        $v1, %lo(debug_flag)($v0)
/* 59C60 80059060 1060000A */  beqz       $v1, .L8005908C
/* 59C64 80059064 3C12800F */   lui       $s2, %hi(dialougemode_pointer)
/* 59C68 80059068 8E43E960 */  lw         $v1, %lo(dialougemode_pointer)($s2)
/* 59C6C 8005906C 8C6200A0 */  lw         $v0, 0xa0($v1)
/* 59C70 80059070 14400007 */  bnez       $v0, .L80059090
/* 59C74 80059074 8FA20010 */   lw        $v0, 0x10($sp)
/* 59C78 80059078 30821000 */  andi       $v0, $a0, 0x1000
/* 59C7C 8005907C 10400004 */  beqz       $v0, .L80059090
/* 59C80 80059080 8FA20010 */   lw        $v0, 0x10($sp)
/* 59C84 80059084 0C016784 */  jal        build_camera_debug
/* 59C88 80059088 94640094 */   lhu       $a0, 0x94($v1)
.L8005908C:
/* 59C8C 8005908C 8FA20010 */  lw         $v0, 0x10($sp)
.L80059090:
/* 59C90 80059090 8C44000C */  lw         $a0, 0xc($v0)
/* 59C94 80059094 30830010 */  andi       $v1, $a0, 0x10
/* 59C98 80059098 10600011 */  beqz       $v1, .L800590E0
/* 59C9C 8005909C 8C450008 */   lw        $a1, 8($v0)
/* 59CA0 800590A0 1080000F */  beqz       $a0, .L800590E0
/* 59CA4 800590A4 3083A000 */   andi      $v1, $a0, 0xa000
/* 59CA8 800590A8 3402A000 */  ori        $v0, $zero, 0xa000
/* 59CAC 800590AC 1462000D */  bne        $v1, $v0, .L800590E4
/* 59CB0 800590B0 3C02800F */   lui       $v0, 0x800f
/* 59CB4 800590B4 30A24000 */  andi       $v0, $a1, 0x4000
/* 59CB8 800590B8 10400009 */  beqz       $v0, .L800590E0
/* 59CBC 800590BC 260268A8 */   addiu     $v0, $s0, 0x68a8
/* 59CC0 800590C0 3C03800F */  lui        $v1, %hi(borg_13_pointer)
/* 59CC4 800590C4 00003821 */  addu       $a3, $zero, $zero
/* 59CC8 800590C8 8C4515C0 */  lw         $a1, 0x15c0($v0)
/* 59CCC 800590CC 8C66E964 */  lw         $a2, %lo(borg_13_pointer)($v1)
/* 59CD0 800590D0 8CA40008 */  lw         $a0, 8($a1)
/* 59CD4 800590D4 8CC50010 */  lw         $a1, 0x10($a2)
/* 59CD8 800590D8 0C015CB4 */  jal        dialouge_func_C
/* 59CDC 800590DC 24060022 */   addiu     $a2, $zero, 0x22
.L800590E0:
/* 59CE0 800590E0 3C02800F */  lui        $v0, %hi(debug_queue_800e8908)
.L800590E4:
/* 59CE4 800590E4 24508908 */  addiu      $s0, $v0, %lo(debug_queue_800e8908)
/* 59CE8 800590E8 8FA50010 */  lw         $a1, 0x10($sp)
/* 59CEC 800590EC 0C00B63C */  jal        toggle_show_debug_queue
/* 59CF0 800590F0 02002021 */   addu      $a0, $s0, $zero
/* 59CF4 800590F4 8E43E960 */  lw         $v1, -0x16a0($s2)
/* 59CF8 800590F8 8C6200A0 */  lw         $v0, 0xa0($v1)
/* 59CFC 800590FC 14400019 */  bnez       $v0, .L80059164
/* 59D00 80059100 02602021 */   addu      $a0, $s3, $zero
/* 59D04 80059104 8C6200A4 */  lw         $v0, 0xa4($v1)
/* 59D08 80059108 14400016 */  bnez       $v0, .L80059164
/* 59D0C 8005910C 00000000 */   nop
/* 59D10 80059110 2604DFA0 */  addiu      $a0, $s0, -0x2060
/* 59D14 80059114 94821622 */  lhu        $v0, 0x1622($a0)
/* 59D18 80059118 54400012 */  bnel       $v0, $zero, .L80059164
/* 59D1C 8005911C 02602021 */   addu      $a0, $s3, $zero
/* 59D20 80059120 8C841604 */  lw         $a0, 0x1604($a0)
/* 59D24 80059124 0C02DC69 */  jal        run_widget_control_func
/* 59D28 80059128 8FA50010 */   lw        $a1, 0x10($sp)
/* 59D2C 8005912C 00402021 */  addu       $a0, $v0, $zero
/* 59D30 80059130 1080000B */  beqz       $a0, .L80059160
/* 59D34 80059134 3C02800F */   lui       $v0, %hi(freeWidgetFunc)
/* 59D38 80059138 8C42D500 */  lw         $v0, %lo(freeWidgetFunc)($v0)
/* 59D3C 8005913C 50400009 */  beql       $v0, $zero, .L80059164
/* 59D40 80059140 02602021 */   addu      $a0, $s3, $zero
/* 59D44 80059144 0040F809 */  jalr       $v0
/* 59D48 80059148 00000000 */   nop
/* 59D4C 8005914C 8E42E960 */  lw         $v0, -0x16a0($s2)
/* 59D50 80059150 904400AB */  lbu        $a0, 0xab($v0)
/* 59D54 80059154 24030002 */  addiu      $v1, $zero, 2
/* 59D58 80059158 10830006 */  beq        $a0, $v1, .L80059174
/* 59D5C 8005915C 00000000 */   nop
.L80059160:
/* 59D60 80059160 02602021 */  addu       $a0, $s3, $zero
.L80059164:
/* 59D64 80059164 0C02713D */  jal        get_cont_aidyn
/* 59D68 80059168 00002821 */   addu      $a1, $zero, $zero
/* 59D6C 8005916C 1440FFAC */  bnez       $v0, .L80059020
/* 59D70 80059170 26220001 */   addiu     $v0, $s1, 1
.L80059174:
/* 59D74 80059174 52200001 */  beql       $s1, $zero, .L8005917C
/* 59D78 80059178 24110001 */   addiu     $s1, $zero, 1
.L8005917C:
/* 59D7C 8005917C 2E220007 */  sltiu      $v0, $s1, 7
/* 59D80 80059180 50400001 */  beql       $v0, $zero, .L80059188
/* 59D84 80059184 24110006 */   addiu     $s1, $zero, 6
.L80059188:
/* 59D88 80059188 02201021 */  addu       $v0, $s1, $zero
/* 59D8C 8005918C 8FBF0028 */  lw         $ra, 0x28($sp)
/* 59D90 80059190 8FB30024 */  lw         $s3, 0x24($sp)
/* 59D94 80059194 8FB20020 */  lw         $s2, 0x20($sp)
/* 59D98 80059198 8FB1001C */  lw         $s1, 0x1c($sp)
/* 59D9C 8005919C 8FB00018 */  lw         $s0, 0x18($sp)
/* 59DA0 800591A0 03E00008 */  jr         $ra
/* 59DA4 800591A4 27BD0030 */   addiu     $sp, $sp, 0x30

glabel func_800591A8
/* 59DA8 800591A8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59DAC 800591AC 3C02800F */  lui        $v0, %hi(story_short)
/* 59DB0 800591B0 944388F0 */  lhu        $v1, %lo(story_short)($v0)
/* 59DB4 800591B4 30A500FF */  andi       $a1, $a1, 0xff
/* 59DB8 800591B8 10600003 */  beqz       $v1, .L800591C8
/* 59DBC 800591BC AFBF0010 */   sw        $ra, 0x10($sp)
/* 59DC0 800591C0 10C00005 */  beqz       $a2, .L800591D8
/* 59DC4 800591C4 00801021 */   addu      $v0, $a0, $zero
.L800591C8:
/* 59DC8 800591C8 0C00B703 */  jal        func_with_debug_queue
/* 59DCC 800591CC 00000000 */   nop
/* 59DD0 800591D0 0C015E9C */  jal        func_80057A70
/* 59DD4 800591D4 00402021 */   addu      $a0, $v0, $zero
.L800591D8:
/* 59DD8 800591D8 8FBF0010 */  lw         $ra, 0x10($sp)
/* 59DDC 800591DC 03E00008 */  jr         $ra
/* 59DE0 800591E0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800591E4
/* 59DE4 800591E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59DE8 800591E8 AFB00010 */  sw         $s0, 0x10($sp)
/* 59DEC 800591EC 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 59DF0 800591F0 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 59DF4 800591F4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 59DF8 800591F8 944400B8 */  lhu        $a0, 0xb8($v0)
/* 59DFC 800591FC 24020002 */  addiu      $v0, $zero, 2
/* 59E00 80059200 00041A02 */  srl        $v1, $a0, 8
/* 59E04 80059204 1462000E */  bne        $v1, $v0, .L80059240
/* 59E08 80059208 00001021 */   addu      $v0, $zero, $zero
/* 59E0C 8005920C 00002821 */  addu       $a1, $zero, $zero
/* 59E10 80059210 0C01D77A */  jal        GetIDIndex
/* 59E14 80059214 00003021 */   addu      $a2, $zero, $zero
/* 59E18 80059218 24030099 */  addiu      $v1, $zero, 0x99
/* 59E1C 8005921C 14430004 */  bne        $v0, $v1, .L80059230
/* 59E20 80059220 8E02E960 */   lw        $v0, -0x16a0($s0)
/* 59E24 80059224 3C03800E */  lui        $v1, %hi(PlayerCharStruct)
/* 59E28 80059228 08016490 */  j          .L80059240
/* 59E2C 8005922C 8C626950 */   lw        $v0, %lo(PlayerCharStruct)($v1)
.L80059230:
/* 59E30 80059230 8C420078 */  lw         $v0, 0x78($v0)
/* 59E34 80059234 54400002 */  bnel       $v0, $zero, .L80059240
/* 59E38 80059238 8C420000 */   lw        $v0, ($v0)
/* 59E3C 8005923C 00001021 */  addu       $v0, $zero, $zero
.L80059240:
/* 59E40 80059240 8FBF0014 */  lw         $ra, 0x14($sp)
/* 59E44 80059244 8FB00010 */  lw         $s0, 0x10($sp)
/* 59E48 80059248 03E00008 */  jr         $ra
/* 59E4C 8005924C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel run_dialougemode_funcs4
/* 59E50 80059250 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59E54 80059254 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 59E58 80059258 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59E5C 8005925C 10600007 */  beqz       $v1, .L8005927C
/* 59E60 80059260 AFBF0010 */   sw        $ra, 0x10($sp)
/* 59E64 80059264 906200AA */  lbu        $v0, 0xaa($v1)
/* 59E68 80059268 00021080 */  sll        $v0, $v0, 2
/* 59E6C 8005926C 00621021 */  addu       $v0, $v1, $v0
/* 59E70 80059270 8C430050 */  lw         $v1, 0x50($v0)
/* 59E74 80059274 0060F809 */  jalr       $v1
/* 59E78 80059278 00000000 */   nop
.L8005927C:
/* 59E7C 8005927C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 59E80 80059280 03E00008 */  jr         $ra
/* 59E84 80059284 27BD0018 */   addiu     $sp, $sp, 0x18

glabel run_dialougemode_funcs5
/* 59E88 80059288 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 59E8C 8005928C 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 59E90 80059290 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 59E94 80059294 10600007 */  beqz       $v1, .L800592B4
/* 59E98 80059298 AFBF0010 */   sw        $ra, 0x10($sp)
/* 59E9C 8005929C 906200AA */  lbu        $v0, 0xaa($v1)
/* 59EA0 800592A0 00021080 */  sll        $v0, $v0, 2
/* 59EA4 800592A4 00621021 */  addu       $v0, $v1, $v0
/* 59EA8 800592A8 8C430064 */  lw         $v1, 0x64($v0)
/* 59EAC 800592AC 0060F809 */  jalr       $v1
/* 59EB0 800592B0 00000000 */   nop
.L800592B4:
/* 59EB4 800592B4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 59EB8 800592B8 03E00008 */  jr         $ra
/* 59EBC 800592BC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel DialogueModeInitPrescripted
/* 59EC0 800592C0 27BDFF98 */  addiu      $sp, $sp, -0x68
/* 59EC4 800592C4 3C04800E */  lui        $a0, %hi(D_800DEBBC)
/* 59EC8 800592C8 2484EBBC */  addiu      $a0, $a0, %lo(D_800DEBBC)
/* 59ECC 800592CC AFBF0064 */  sw         $ra, 0x64($sp)
/* 59ED0 800592D0 AFB20060 */  sw         $s2, 0x60($sp)
/* 59ED4 800592D4 AFB1005C */  sw         $s1, 0x5c($sp)
/* 59ED8 800592D8 0C00B6B8 */  jal        debug_queue
/* 59EDC 800592DC AFB00058 */   sw        $s0, 0x58($sp)
/* 59EE0 800592E0 3C10800E */  lui        $s0, %hi(wanderstruct)
/* 59EE4 800592E4 261068F8 */  addiu      $s0, $s0, %lo(wanderstruct)
/* 59EE8 800592E8 02002021 */  addu       $a0, $s0, $zero
/* 59EEC 800592EC 24050008 */  addiu      $a1, $zero, 8
/* 59EF0 800592F0 3C03800F */  lui        $v1, %hi(freeWidgetFunc)
/* 59EF4 800592F4 3C028006 */  lui        $v0, %hi(run_dialougemode_funcs2)
/* 59EF8 800592F8 244281A8 */  addiu      $v0, $v0, %lo(run_dialougemode_funcs2)
/* 59EFC 800592FC 0C004947 */  jal        WanderHead
/* 59F00 80059300 AC62D500 */   sw        $v0, %lo(freeWidgetFunc)($v1)
/* 59F04 80059304 00002021 */  addu       $a0, $zero, $zero
/* 59F08 80059308 0C0044AF */  jal        InitZoneEngine
/* 59F0C 8005930C 00002821 */   addu      $a1, $zero, $zero
/* 59F10 80059310 3C12800F */  lui        $s2, %hi(dialougemode_pointer)
/* 59F14 80059314 8E42E960 */  lw         $v0, %lo(dialougemode_pointer)($s2)
/* 59F18 80059318 84440096 */  lh         $a0, 0x96($v0)
/* 59F1C 8005931C 84450098 */  lh         $a1, 0x98($v0)
/* 59F20 80059320 0C0165AA */  jal        DialogueModeInitPrescripted_set_map
/* 59F24 80059324 8446009A */   lh        $a2, 0x9a($v0)
/* 59F28 80059328 27B10018 */  addiu      $s1, $sp, 0x18
/* 59F2C 8005932C 02202021 */  addu       $a0, $s1, $zero
/* 59F30 80059330 00002821 */  addu       $a1, $zero, $zero
/* 59F34 80059334 0C026380 */  jal        Calloc
/* 59F38 80059338 2406000C */   addiu     $a2, $zero, 0xc
/* 59F3C 8005933C 2610FFB0 */  addiu      $s0, $s0, -0x50
/* 59F40 80059340 8E0403BC */  lw         $a0, 0x3bc($s0)
/* 59F44 80059344 0C02C058 */  jal        camera_set_position
/* 59F48 80059348 02202821 */   addu      $a1, $s1, $zero
/* 59F4C 8005934C C7A20018 */  lwc1       $f2, 0x18($sp)
/* 59F50 80059350 3C01800E */  lui        $at, %hi(D_800DEBDC)
/* 59F54 80059354 C420EBDC */  lwc1       $f0, %lo(D_800DEBDC)($at)
/* 59F58 80059358 46001080 */  add.s      $f2, $f2, $f0
/* 59F5C 8005935C 8E0403BC */  lw         $a0, 0x3bc($s0)
/* 59F60 80059360 02202821 */  addu       $a1, $s1, $zero
/* 59F64 80059364 0C02C069 */  jal        camera_set_aim
/* 59F68 80059368 E7A20018 */   swc1      $f2, 0x18($sp)
/* 59F6C 8005936C 8E42E960 */  lw         $v0, -0x16a0($s2)
/* 59F70 80059370 8E0415C0 */  lw         $a0, 0x15c0($s0)
/* 59F74 80059374 8C430084 */  lw         $v1, 0x84($v0)
/* 59F78 80059378 904700AA */  lbu        $a3, 0xaa($v0)
/* 59F7C 8005937C 90650015 */  lbu        $a1, 0x15($v1)
/* 59F80 80059380 AFA50010 */  sw         $a1, 0x10($sp)
/* 59F84 80059384 8C450084 */  lw         $a1, 0x84($v0)
/* 59F88 80059388 0C013A6B */  jal        StartDialoug
/* 59F8C 8005938C 244600B4 */   addiu     $a2, $v0, 0xb4
/* 59F90 80059390 3C01800E */  lui        $at, %hi(D_800DEBE0)
/* 59F94 80059394 C420EBE0 */  lwc1       $f0, %lo(D_800DEBE0)($at)
/* 59F98 80059398 8FBF0064 */  lw         $ra, 0x64($sp)
/* 59F9C 8005939C 8FB20060 */  lw         $s2, 0x60($sp)
/* 59FA0 800593A0 8FB1005C */  lw         $s1, 0x5c($sp)
/* 59FA4 800593A4 24020002 */  addiu      $v0, $zero, 2
/* 59FA8 800593A8 A6022048 */  sh         $v0, 0x2048($s0)
/* 59FAC 800593AC AE00203C */  sw         $zero, 0x203c($s0)
/* 59FB0 800593B0 E6002044 */  swc1       $f0, 0x2044($s0)
/* 59FB4 800593B4 8FB00058 */  lw         $s0, 0x58($sp)
/* 59FB8 800593B8 03E00008 */  jr         $ra
/* 59FBC 800593BC 27BD0068 */   addiu     $sp, $sp, 0x68

glabel load_one_of_two_cinematics
/* 59FC0 800593C0 27BDFFC0 */  addiu      $sp, $sp, -0x40
/* 59FC4 800593C4 AFB1001C */  sw         $s1, 0x1c($sp)
/* 59FC8 800593C8 3C11800F */  lui        $s1, %hi(dialougemode_pointer)
/* 59FCC 800593CC 8E24E960 */  lw         $a0, %lo(dialougemode_pointer)($s1)
/* 59FD0 800593D0 AFBF003C */  sw         $ra, 0x3c($sp)
/* 59FD4 800593D4 AFBE0038 */  sw         $fp, 0x38($sp)
/* 59FD8 800593D8 AFB70034 */  sw         $s7, 0x34($sp)
/* 59FDC 800593DC AFB60030 */  sw         $s6, 0x30($sp)
/* 59FE0 800593E0 AFB5002C */  sw         $s5, 0x2c($sp)
/* 59FE4 800593E4 AFB40028 */  sw         $s4, 0x28($sp)
/* 59FE8 800593E8 AFB30024 */  sw         $s3, 0x24($sp)
/* 59FEC 800593EC AFB20020 */  sw         $s2, 0x20($sp)
/* 59FF0 800593F0 AFB00018 */  sw         $s0, 0x18($sp)
/* 59FF4 800593F4 8C850084 */  lw         $a1, 0x84($a0)
/* 59FF8 800593F8 0C015AFB */  jal        func_80056BEC
/* 59FFC 800593FC 248400B4 */   addiu     $a0, $a0, 0xb4
/* 5A000 80059400 3C10800F */  lui        $s0, %hi(queueStructB)
/* 5A004 80059404 261086D0 */  addiu      $s0, $s0, %lo(queueStructB)
/* 5A008 80059408 02002021 */  addu       $a0, $s0, $zero
/* 5A00C 8005940C 0C0357E6 */  jal        Process_queue_B
/* 5A010 80059410 24050001 */   addiu     $a1, $zero, 1
/* 5A014 80059414 0C004687 */  jal        FreeZoneEngine
/* 5A018 80059418 24040001 */   addiu     $a0, $zero, 1
/* 5A01C 8005941C 2604F4D0 */  addiu      $a0, $s0, -0xb30
/* 5A020 80059420 0C015871 */  jal        func_800561C4
/* 5A024 80059424 24050001 */   addiu     $a1, $zero, 1
/* 5A028 80059428 0C00497B */  jal        wander_free
/* 5A02C 8005942C 2604E228 */   addiu     $a0, $s0, -0x1dd8
/* 5A030 80059430 0C013C77 */  jal        func_8004F1DC
/* 5A034 80059434 8E04F798 */   lw        $a0, -0x868($s0)
/* 5A038 80059438 8E22E960 */  lw         $v0, -0x16a0($s1)
/* 5A03C 8005943C 0C001940 */  jal        borg13_check
/* 5A040 80059440 8C44008C */   lw        $a0, 0x8c($v0)
/* 5A044 80059444 10400003 */  beqz       $v0, .L80059454
/* 5A048 80059448 3C02800F */   lui       $v0, %hi(TerrainPointer)
/* 5A04C 8005944C 0C0215B2 */  jal        lapse_8_hours
/* 5A050 80059450 8C441BBC */   lw        $a0, %lo(TerrainPointer)($v0)
.L80059454:
/* 5A054 80059454 0C0163DE */  jal        dialougmode_free
/* 5A058 80059458 00000000 */   nop
/* 5A05C 8005945C 0C0163CD */  jal        clear_borg13_pointer
/* 5A060 80059460 00000000 */   nop
/* 5A064 80059464 3C02800F */  lui        $v0, %hi(whoDied_short)
/* 5A068 80059468 9444E9AC */  lhu        $a0, %lo(whoDied_short)($v0)
/* 5A06C 8005946C 24030002 */  addiu      $v1, $zero, 2
/* 5A070 80059470 10830010 */  beq        $a0, $v1, .L800594B4
/* 5A074 80059474 28820003 */   slti      $v0, $a0, 3
/* 5A078 80059478 10400005 */  beqz       $v0, .L80059490
/* 5A07C 8005947C 24020001 */   addiu     $v0, $zero, 1
/* 5A080 80059480 10820008 */  beq        $a0, $v0, .L800594A4
/* 5A084 80059484 3C02800F */   lui       $v0, %hi(D_800EE970)
/* 5A088 80059488 0801654F */  j          .L8005953C
/* 5A08C 8005948C 8C44E970 */   lw        $a0, %lo(D_800EE970)($v0)
.L80059490:
/* 5A090 80059490 24020003 */  addiu      $v0, $zero, 3
/* 5A094 80059494 1082000A */  beq        $a0, $v0, .L800594C0
/* 5A098 80059498 3C02800F */   lui       $v0, %hi(D_800EE970)
/* 5A09C 8005949C 0801654F */  j          .L8005953C
/* 5A0A0 800594A0 8C44E970 */   lw        $a0, %lo(D_800EE970)($v0)
.L800594A4:
/* 5A0A4 800594A4 24040003 */  addiu      $a0, $zero, 3
/* 5A0A8 800594A8 24050002 */  addiu      $a1, $zero, 2
/* 5A0AC 800594AC 08016536 */  j          .L800594D8
/* 5A0B0 800594B0 00003021 */   addu      $a2, $zero, $zero
.L800594B4:
/* 5A0B4 800594B4 3C02800F */  lui        $v0, %hi(D_800EE970)
/* 5A0B8 800594B8 0801657E */  j          .L800595F8
/* 5A0BC 800594BC AC40E970 */   sw        $zero, %lo(D_800EE970)($v0)
.L800594C0:
/* 5A0C0 800594C0 0C009168 */  jal        get_event_flag
/* 5A0C4 800594C4 24040D72 */   addiu     $a0, $zero, 0xd72
/* 5A0C8 800594C8 1040001A */  beqz       $v0, .L80059534
/* 5A0CC 800594CC 24040002 */   addiu     $a0, $zero, 2
/* 5A0D0 800594D0 24050003 */  addiu      $a1, $zero, 3
/* 5A0D4 800594D4 24060001 */  addiu      $a2, $zero, 1
.L800594D8:
/* 5A0D8 800594D8 0C0171AC */  jal        load_cinematic
/* 5A0DC 800594DC 00000000 */   nop
/* 5A0E0 800594E0 3C03800F */  lui        $v1, %hi(D_800EE970)
/* 5A0E4 800594E4 2402000E */  addiu      $v0, $zero, 0xe
/* 5A0E8 800594E8 0801657E */  j          .L800595F8
/* 5A0EC 800594EC AC62E970 */   sw        $v0, %lo(D_800EE970)($v1)
.L800594F0:
/* 5A0F0 800594F0 26230028 */  addiu      $v1, $s1, 0x28
/* 5A0F4 800594F4 96240028 */  lhu        $a0, 0x28($s1)
/* 5A0F8 800594F8 94650008 */  lhu        $a1, 8($v1)
/* 5A0FC 800594FC 84660002 */  lh         $a2, 2($v1)
/* 5A100 80059500 84670004 */  lh         $a3, 4($v1)
/* 5A104 80059504 84680006 */  lh         $t0, 6($v1)
/* 5A108 80059508 24020001 */  addiu      $v0, $zero, 1
/* 5A10C 8005950C AE02E96C */  sw         $v0, -0x1694($s0)
/* 5A110 80059510 3242FFFF */  andi       $v0, $s2, 0xffff
/* 5A114 80059514 AFA20014 */  sw         $v0, 0x14($sp)
/* 5A118 80059518 0C015ED0 */  jal        dialoug_func
/* 5A11C 8005951C AFA80010 */   sw        $t0, 0x10($sp)
/* 5A120 80059520 2402000C */  addiu      $v0, $zero, 0xc
/* 5A124 80059524 3C03800F */  lui        $v1, %hi(D_800EE970)
/* 5A128 80059528 AE00E96C */  sw         $zero, -0x1694($s0)
/* 5A12C 8005952C 0801657C */  j          .L800595F0
/* 5A130 80059530 AC62E970 */   sw        $v0, %lo(D_800EE970)($v1)
.L80059534:
/* 5A134 80059534 3C02800F */  lui        $v0, %hi(D_800EE970)
/* 5A138 80059538 8C44E970 */  lw         $a0, %lo(D_800EE970)($v0)
.L8005953C:
/* 5A13C 8005953C 24030001 */  addiu      $v1, $zero, 1
/* 5A140 80059540 1483002E */  bne        $a0, $v1, .L800595FC
/* 5A144 80059544 8FBF003C */   lw        $ra, 0x3c($sp)
/* 5A148 80059548 3C02800E */  lui        $v0, %hi(mapFloatDatEntry)
/* 5A14C 8005954C 2455788C */  addiu      $s5, $v0, %lo(mapFloatDatEntry)
/* 5A150 80059550 86A30026 */  lh         $v1, 0x26($s5)
/* 5A154 80059554 2402FFFF */  addiu      $v0, $zero, -1
/* 5A158 80059558 10620029 */  beq        $v1, $v0, .L80059600
/* 5A15C 8005955C 8FBE0038 */   lw        $fp, 0x38($sp)
/* 5A160 80059560 86A40024 */  lh         $a0, 0x24($s5)
/* 5A164 80059564 86A50020 */  lh         $a1, 0x20($s5)
/* 5A168 80059568 0C00B20B */  jal        borgmaps_func_2
/* 5A16C 8005956C 86A60022 */   lh        $a2, 0x22($s5)
/* 5A170 80059570 0C029B65 */  jal        get_borg_9
/* 5A174 80059574 00402021 */   addu      $a0, $v0, $zero
/* 5A178 80059578 0040F021 */  addu       $fp, $v0, $zero
/* 5A17C 8005957C 27D00008 */  addiu      $s0, $fp, 8
/* 5A180 80059580 96020028 */  lhu        $v0, 0x28($s0)
/* 5A184 80059584 1040001A */  beqz       $v0, .L800595F0
/* 5A188 80059588 00009021 */   addu      $s2, $zero, $zero
/* 5A18C 8005958C 24170009 */  addiu      $s7, $zero, 9
/* 5A190 80059590 3C140001 */  lui        $s4, 1
/* 5A194 80059594 00009821 */  addu       $s3, $zero, $zero
/* 5A198 80059598 3C160001 */  lui        $s6, 1
.L8005959C:
/* 5A19C 8005959C 8E020044 */  lw         $v0, 0x44($s0)
/* 5A1A0 800595A0 00538821 */  addu       $s1, $v0, $s3
/* 5A1A4 800595A4 96230016 */  lhu        $v1, 0x16($s1)
/* 5A1A8 800595A8 1477000B */  bne        $v1, $s7, .L800595D8
/* 5A1AC 800595AC 02801821 */   addu      $v1, $s4, $zero
/* 5A1B0 800595B0 96220014 */  lhu        $v0, 0x14($s1)
/* 5A1B4 800595B4 30422000 */  andi       $v0, $v0, 0x2000
/* 5A1B8 800595B8 10400007 */  beqz       $v0, .L800595D8
/* 5A1BC 800595BC 02202021 */   addu      $a0, $s1, $zero
/* 5A1C0 800595C0 02A02821 */  addu       $a1, $s5, $zero
/* 5A1C4 800595C4 0C00534D */  jal        dialouge_trigger_check
/* 5A1C8 800595C8 24060001 */   addiu     $a2, $zero, 1
/* 5A1CC 800595CC 5440FFC8 */  bnel       $v0, $zero, .L800594F0
/* 5A1D0 800595D0 3C10800F */   lui       $s0, %hi(entity_info_array+0x788)
/* 5A1D4 800595D4 02801821 */  addu       $v1, $s4, $zero
.L800595D8:
/* 5A1D8 800595D8 0296A021 */  addu       $s4, $s4, $s6
/* 5A1DC 800595DC 96020028 */  lhu        $v0, %lo(entity_info_array+0x788)($s0)
/* 5A1E0 800595E0 00039403 */  sra        $s2, $v1, 0x10
/* 5A1E4 800595E4 0242102A */  slt        $v0, $s2, $v0
/* 5A1E8 800595E8 1440FFEC */  bnez       $v0, .L8005959C
/* 5A1EC 800595EC 2673006C */   addiu     $s3, $s3, 0x6c
.L800595F0:
/* 5A1F0 800595F0 0C029B70 */  jal        remove_borg_9
/* 5A1F4 800595F4 03C02021 */   addu      $a0, $fp, $zero
.L800595F8:
/* 5A1F8 800595F8 8FBF003C */  lw         $ra, 0x3c($sp)
.L800595FC:
/* 5A1FC 800595FC 8FBE0038 */  lw         $fp, 0x38($sp)
.L80059600:
/* 5A200 80059600 8FB70034 */  lw         $s7, 0x34($sp)
/* 5A204 80059604 8FB60030 */  lw         $s6, 0x30($sp)
/* 5A208 80059608 8FB5002C */  lw         $s5, 0x2c($sp)
/* 5A20C 8005960C 8FB40028 */  lw         $s4, 0x28($sp)
/* 5A210 80059610 8FB30024 */  lw         $s3, 0x24($sp)
/* 5A214 80059614 8FB20020 */  lw         $s2, 0x20($sp)
/* 5A218 80059618 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5A21C 8005961C 8FB00018 */  lw         $s0, 0x18($sp)
/* 5A220 80059620 03E00008 */  jr         $ra
/* 5A224 80059624 27BD0040 */   addiu     $sp, $sp, 0x40

glabel func_80059628
/* 5A228 80059628 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5A22C 8005962C 3C04800F */  lui        $a0, %hi(freeWidgetFunc)
/* 5A230 80059630 3C03800F */  lui        $v1, %hi(dialougemode_pointer)
/* 5A234 80059634 3C028006 */  lui        $v0, %hi(run_dialougemode_funcs2)
/* 5A238 80059638 8C66E960 */  lw         $a2, %lo(dialougemode_pointer)($v1)
/* 5A23C 8005963C 244281A8 */  addiu      $v0, $v0, %lo(run_dialougemode_funcs2)
/* 5A240 80059640 AC82D500 */  sw         $v0, %lo(freeWidgetFunc)($a0)
/* 5A244 80059644 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 5A248 80059648 AFBF0018 */  sw         $ra, 0x18($sp)
/* 5A24C 8005964C 8CC50084 */  lw         $a1, 0x84($a2)
/* 5A250 80059650 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5A254 80059654 90A30015 */  lbu        $v1, 0x15($a1)
/* 5A258 80059658 90A70014 */  lbu        $a3, 0x14($a1)
/* 5A25C 8005965C 24C600B4 */  addiu      $a2, $a2, 0xb4
/* 5A260 80059660 0C013A6B */  jal        StartDialoug
/* 5A264 80059664 AFA30010 */   sw        $v1, 0x10($sp)
/* 5A268 80059668 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5A26C 8005966C 03E00008 */  jr         $ra
/* 5A270 80059670 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80059674
/* 5A274 80059674 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 5A278 80059678 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5A27C 8005967C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A280 80059680 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A284 80059684 0C013C77 */  jal        func_8004F1DC
/* 5A288 80059688 00000000 */   nop
/* 5A28C 8005968C 0C0163DE */  jal        dialougmode_free
/* 5A290 80059690 00000000 */   nop
/* 5A294 80059694 0C0163CD */  jal        clear_borg13_pointer
/* 5A298 80059698 00000000 */   nop
/* 5A29C 8005969C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A2A0 800596A0 03E00008 */  jr         $ra
/* 5A2A4 800596A4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel DialogueModeInitPrescripted_set_map
/* 5A2A8 800596A8 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5A2AC 800596AC AFB3001C */  sw         $s3, 0x1c($sp)
/* 5A2B0 800596B0 00049C00 */  sll        $s3, $a0, 0x10
/* 5A2B4 800596B4 AFB20018 */  sw         $s2, 0x18($sp)
/* 5A2B8 800596B8 00059400 */  sll        $s2, $a1, 0x10
/* 5A2BC 800596BC 00129403 */  sra        $s2, $s2, 0x10
/* 5A2C0 800596C0 02402021 */  addu       $a0, $s2, $zero
/* 5A2C4 800596C4 AFB10014 */  sw         $s1, 0x14($sp)
/* 5A2C8 800596C8 00068C00 */  sll        $s1, $a2, 0x10
/* 5A2CC 800596CC 00118C03 */  sra        $s1, $s1, 0x10
/* 5A2D0 800596D0 02202821 */  addu       $a1, $s1, $zero
/* 5A2D4 800596D4 00139C03 */  sra        $s3, $s3, 0x10
/* 5A2D8 800596D8 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A2DC 800596DC 3C10800E */  lui        $s0, %hi(zoneDatMatrix)
/* 5A2E0 800596E0 AFBF0020 */  sw         $ra, 0x20($sp)
/* 5A2E4 800596E4 0C003AF0 */  jal        set_playerdata_zoneDatByte
/* 5A2E8 800596E8 26106988 */   addiu     $s0, $s0, %lo(zoneDatMatrix)
/* 5A2EC 800596EC 26041218 */  addiu      $a0, $s0, 0x1218
/* 5A2F0 800596F0 02402821 */  addu       $a1, $s2, $zero
/* 5A2F4 800596F4 0C01560A */  jal        set_SFX_ZoneDatByte
/* 5A2F8 800596F8 02203021 */   addu      $a2, $s1, $zero
/* 5A2FC 800596FC 02602021 */  addu       $a0, $s3, $zero
/* 5A300 80059700 2405FFFF */  addiu      $a1, $zero, -1
/* 5A304 80059704 2406FFFF */  addiu      $a2, $zero, -1
/* 5A308 80059708 2402FFFF */  addiu      $v0, $zero, -1
/* 5A30C 8005970C 00003821 */  addu       $a3, $zero, $zero
/* 5A310 80059710 A61302AC */  sh         $s3, 0x2ac($s0)
/* 5A314 80059714 A6120292 */  sh         $s2, 0x292($s0)
/* 5A318 80059718 A6110294 */  sh         $s1, 0x294($s0)
/* 5A31C 8005971C A60202AE */  sh         $v0, 0x2ae($s0)
/* 5A320 80059720 0C00B297 */  jal        borgmaps_func
/* 5A324 80059724 A60202B0 */   sh        $v0, 0x2b0($s0)
/* 5A328 80059728 02402021 */  addu       $a0, $s2, $zero
/* 5A32C 8005972C 02202821 */  addu       $a1, $s1, $zero
/* 5A330 80059730 3C03800F */  lui        $v1, %hi(no_TP_vec3)
/* 5A334 80059734 24020001 */  addiu      $v0, $zero, 1
/* 5A338 80059738 0C0038A1 */  jal        loadGameBorgScenes
/* 5A33C 8005973C A4628DC2 */   sh        $v0, %lo(no_TP_vec3)($v1)
/* 5A340 80059740 02402021 */  addu       $a0, $s2, $zero
/* 5A344 80059744 0C00B11C */  jal        GetMapTerrain
/* 5A348 80059748 02202821 */   addu      $a1, $s1, $zero
/* 5A34C 8005974C 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5A350 80059750 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5A354 80059754 8FB20018 */  lw         $s2, 0x18($sp)
/* 5A358 80059758 8FB10014 */  lw         $s1, 0x14($sp)
/* 5A35C 8005975C 24020005 */  addiu      $v0, $zero, 5
/* 5A360 80059760 A60201B4 */  sh         $v0, 0x1b4($s0)
/* 5A364 80059764 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A368 80059768 03E00008 */  jr         $ra
/* 5A36C 8005976C 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80059770
/* 5A370 80059770 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 5A374 80059774 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 5A378 80059778 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A37C 8005977C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A380 80059780 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A384 80059784 8C700078 */  lw         $s0, 0x78($v1)
/* 5A388 80059788 12000018 */  beqz       $s0, .L800597EC
/* 5A38C 8005978C 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5A390 80059790 8E020000 */  lw         $v0, ($s0)
/* 5A394 80059794 50400016 */  beql       $v0, $zero, .L800597F0
/* 5A398 80059798 8FB00010 */   lw        $s0, 0x10($sp)
/* 5A39C 8005979C 0C0034CE */  jal        GetCollisionZone
/* 5A3A0 800597A0 9044070D */   lbu       $a0, 0x70d($v0)
/* 5A3A4 800597A4 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5A3A8 800597A8 246368A8 */  addiu      $v1, $v1, %lo(gGlobals)
/* 5A3AC 800597AC 96050050 */  lhu        $a1, 0x50($s0)
/* 5A3B0 800597B0 8C440044 */  lw         $a0, 0x44($v0)
/* 5A3B4 800597B4 24020002 */  addiu      $v0, $zero, 2
/* 5A3B8 800597B8 A06200DC */  sb         $v0, 0xdc($v1)
/* 5A3BC 800597BC A06013F2 */  sb         $zero, 0x13f2($v1)
/* 5A3C0 800597C0 A06013F4 */  sb         $zero, 0x13f4($v1)
/* 5A3C4 800597C4 96060050 */  lhu        $a2, 0x50($s0)
/* 5A3C8 800597C8 000510C0 */  sll        $v0, $a1, 3
/* 5A3CC 800597CC 00451023 */  subu       $v0, $v0, $a1
/* 5A3D0 800597D0 00021080 */  sll        $v0, $v0, 2
/* 5A3D4 800597D4 00451023 */  subu       $v0, $v0, $a1
/* 5A3D8 800597D8 00021080 */  sll        $v0, $v0, 2
/* 5A3DC 800597DC 00822021 */  addu       $a0, $a0, $v0
/* 5A3E0 800597E0 0C0030B8 */  jal        battle_setup_func
/* 5A3E4 800597E4 94850020 */   lhu       $a1, 0x20($a0)
/* 5A3E8 800597E8 8FBF0014 */  lw         $ra, 0x14($sp)
.L800597EC:
/* 5A3EC 800597EC 8FB00010 */  lw         $s0, 0x10($sp)
.L800597F0:
/* 5A3F0 800597F0 03E00008 */  jr         $ra
/* 5A3F4 800597F4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800597F8
/* 5A3F8 800597F8 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 5A3FC 800597FC 8C43E960 */  lw         $v1, %lo(dialougemode_pointer)($v0)
/* 5A400 80059800 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A404 80059804 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A408 80059808 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A40C 8005980C 8C630090 */  lw         $v1, 0x90($v1)
/* 5A410 80059810 24020005 */  addiu      $v0, $zero, 5
/* 5A414 80059814 10620011 */  beq        $v1, $v0, .L8005985C
/* 5A418 80059818 3410FFFF */   ori       $s0, $zero, 0xffff
/* 5A41C 8005981C 2C620006 */  sltiu      $v0, $v1, 6
/* 5A420 80059820 10400005 */  beqz       $v0, .L80059838
/* 5A424 80059824 24020002 */   addiu     $v0, $zero, 2
/* 5A428 80059828 10620008 */  beq        $v1, $v0, .L8005984C
/* 5A42C 8005982C 3402FFFF */   ori       $v0, $zero, 0xffff
/* 5A430 80059830 0801661B */  j          .L8005986C
/* 5A434 80059834 00000000 */   nop
.L80059838:
/* 5A438 80059838 24020007 */  addiu      $v0, $zero, 7
/* 5A43C 8005983C 10620009 */  beq        $v1, $v0, .L80059864
/* 5A440 80059840 3402FFFF */   ori       $v0, $zero, 0xffff
/* 5A444 80059844 0801661B */  j          .L8005986C
/* 5A448 80059848 00000000 */   nop
.L8005984C:
/* 5A44C 8005984C 0C0165DC */  jal        func_80059770
/* 5A450 80059850 00000000 */   nop
/* 5A454 80059854 0801661B */  j          .L8005986C
/* 5A458 80059858 3402FFFF */   ori       $v0, $zero, 0xffff
.L8005985C:
/* 5A45C 8005985C 0801661A */  j          .L80059868
/* 5A460 80059860 24100005 */   addiu     $s0, $zero, 5
.L80059864:
/* 5A464 80059864 24100007 */  addiu      $s0, $zero, 7
.L80059868:
/* 5A468 80059868 3402FFFF */  ori        $v0, $zero, 0xffff
.L8005986C:
/* 5A46C 8005986C 12020002 */  beq        $s0, $v0, .L80059878
/* 5A470 80059870 3C02800E */   lui       $v0, %hi(camping_var)
/* 5A474 80059874 A0506984 */  sb         $s0, %lo(camping_var)($v0)
.L80059878:
/* 5A478 80059878 8FBF0014 */  lw         $ra, 0x14($sp)
/* 5A47C 8005987C 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A480 80059880 03E00008 */  jr         $ra
/* 5A484 80059884 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059888
/* 5A488 80059888 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5A48C 8005988C AFB00018 */  sw         $s0, 0x18($sp)
/* 5A490 80059890 3C10800E */  lui        $s0, %hi(gGlobals)
/* 5A494 80059894 261068A8 */  addiu      $s0, $s0, %lo(gGlobals)
/* 5A498 80059898 AFBF0020 */  sw         $ra, 0x20($sp)
/* 5A49C 8005989C AFB1001C */  sw         $s1, 0x1c($sp)
/* 5A4A0 800598A0 8E1100A8 */  lw         $s1, 0xa8($s0)
/* 5A4A4 800598A4 24050800 */  addiu      $a1, $zero, 0x800
/* 5A4A8 800598A8 02202021 */  addu       $a0, $s1, $zero
/* 5A4AC 800598AC 0C0061C7 */  jal        playerdata_set_flags
/* 5A4B0 800598B0 A6200014 */   sh        $zero, 0x14($s1)
/* 5A4B4 800598B4 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 5A4B8 800598B8 8E0415C0 */  lw         $a0, 0x15c0($s0)
/* 5A4BC 800598BC 8C46E960 */  lw         $a2, %lo(dialougemode_pointer)($v0)
/* 5A4C0 800598C0 00003821 */  addu       $a3, $zero, $zero
/* 5A4C4 800598C4 AFA00010 */  sw         $zero, 0x10($sp)
/* 5A4C8 800598C8 8CC50084 */  lw         $a1, 0x84($a2)
/* 5A4CC 800598CC 0C013A6B */  jal        StartDialoug
/* 5A4D0 800598D0 24C600B4 */   addiu     $a2, $a2, 0xb4
/* 5A4D4 800598D4 0C00672F */  jal        clear_some_playerHandler_field
/* 5A4D8 800598D8 00000000 */   nop
/* 5A4DC 800598DC 8E0403BC */  lw         $a0, 0x3bc($s0)
/* 5A4E0 800598E0 0C02C131 */  jal        func_800B04C4
/* 5A4E4 800598E4 26250068 */   addiu     $a1, $s1, 0x68
/* 5A4E8 800598E8 8FBF0020 */  lw         $ra, 0x20($sp)
/* 5A4EC 800598EC 8FB1001C */  lw         $s1, 0x1c($sp)
/* 5A4F0 800598F0 8FB00018 */  lw         $s0, 0x18($sp)
/* 5A4F4 800598F4 03E00008 */  jr         $ra
/* 5A4F8 800598F8 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_800598FC
/* 5A4FC 800598FC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5A500 80059900 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A504 80059904 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5A508 80059908 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 5A50C 8005990C AFBF0018 */  sw         $ra, 0x18($sp)
/* 5A510 80059910 AFB10014 */  sw         $s1, 0x14($sp)
/* 5A514 80059914 8C440078 */  lw         $a0, 0x78($v0)
/* 5A518 80059918 10800011 */  beqz       $a0, .L80059960
/* 5A51C 8005991C 8FBF0018 */   lw        $ra, 0x18($sp)
/* 5A520 80059920 0C004B89 */  jal        func_80012E24
/* 5A524 80059924 00000000 */   nop
/* 5A528 80059928 8E02E960 */  lw         $v0, -0x16a0($s0)
/* 5A52C 8005992C 24050840 */  addiu      $a1, $zero, 0x840
/* 5A530 80059930 8C430078 */  lw         $v1, 0x78($v0)
/* 5A534 80059934 3C02800E */  lui        $v0, %hi(PlayerCharStruct)
/* 5A538 80059938 8C710000 */  lw         $s1, ($v1)
/* 5A53C 8005993C 8C506950 */  lw         $s0, %lo(PlayerCharStruct)($v0)
/* 5A540 80059940 0C0061C7 */  jal        playerdata_set_flags
/* 5A544 80059944 02202021 */   addu      $a0, $s1, $zero
/* 5A548 80059948 02002021 */  addu       $a0, $s0, $zero
/* 5A54C 8005994C 0C0061C7 */  jal        playerdata_set_flags
/* 5A550 80059950 24050800 */   addiu     $a1, $zero, 0x800
/* 5A554 80059954 A6000014 */  sh         $zero, 0x14($s0)
/* 5A558 80059958 A6200014 */  sh         $zero, 0x14($s1)
/* 5A55C 8005995C 8FBF0018 */  lw         $ra, 0x18($sp)
.L80059960:
/* 5A560 80059960 8FB10014 */  lw         $s1, 0x14($sp)
/* 5A564 80059964 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A568 80059968 03E00008 */  jr         $ra
/* 5A56C 8005996C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_80059970
/* 5A570 80059970 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A574 80059974 3C02800E */  lui        $v0, %hi(D_800E7E64)
/* 5A578 80059978 24467E64 */  addiu      $a2, $v0, %lo(D_800E7E64)
/* 5A57C 8005997C AFB00010 */  sw         $s0, 0x10($sp)
/* 5A580 80059980 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5A584 80059984 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 5A588 80059988 00802821 */  addu       $a1, $a0, $zero
/* 5A58C 8005998C AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A590 80059990 8C420078 */  lw         $v0, 0x78($v0)
/* 5A594 80059994 10400003 */  beqz       $v0, .L800599A4
/* 5A598 80059998 8CC3EAEC */   lw        $v1, -0x1514($a2)
/* 5A59C 8005999C 8C420000 */  lw         $v0, ($v0)
/* 5A5A0 800599A0 A4400014 */  sh         $zero, 0x14($v0)
.L800599A4:
/* 5A5A4 800599A4 8CC40004 */  lw         $a0, 4($a2)
/* 5A5A8 800599A8 0C013AA5 */  jal        func_8004EA94
/* 5A5AC 800599AC A4600014 */   sh        $zero, 0x14($v1)
/* 5A5B0 800599B0 8E02E960 */  lw         $v0, -0x16a0($s0)
/* 5A5B4 800599B4 1040000B */  beqz       $v0, .L800599E4
/* 5A5B8 800599B8 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5A5BC 800599BC 904200AC */  lbu        $v0, 0xac($v0)
/* 5A5C0 800599C0 14400009 */  bnez       $v0, .L800599E8
/* 5A5C4 800599C4 8FB00010 */   lw        $s0, 0x10($sp)
/* 5A5C8 800599C8 0C016479 */  jal        func_800591E4
/* 5A5CC 800599CC 00000000 */   nop
/* 5A5D0 800599D0 00401821 */  addu       $v1, $v0, $zero
/* 5A5D4 800599D4 10600002 */  beqz       $v1, .L800599E0
/* 5A5D8 800599D8 24020004 */   addiu     $v0, $zero, 4
/* 5A5DC 800599DC A4620014 */  sh         $v0, 0x14($v1)
.L800599E0:
/* 5A5E0 800599E0 8FBF0014 */  lw         $ra, 0x14($sp)
.L800599E4:
/* 5A5E4 800599E4 8FB00010 */  lw         $s0, 0x10($sp)
.L800599E8:
/* 5A5E8 800599E8 03E00008 */  jr         $ra
/* 5A5EC 800599EC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800599F0
/* 5A5F0 800599F0 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 5A5F4 800599F4 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5A5F8 800599F8 AFB10014 */  sw         $s1, 0x14($sp)
/* 5A5FC 800599FC 245168A8 */  addiu      $s1, $v0, %lo(gGlobals)
/* 5A600 80059A00 AFBF0024 */  sw         $ra, 0x24($sp)
/* 5A604 80059A04 AFB40020 */  sw         $s4, 0x20($sp)
/* 5A608 80059A08 AFB3001C */  sw         $s3, 0x1c($sp)
/* 5A60C 80059A0C AFB20018 */  sw         $s2, 0x18($sp)
/* 5A610 80059A10 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A614 80059A14 0C013C77 */  jal        func_8004F1DC
/* 5A618 80059A18 8E2415C0 */   lw        $a0, 0x15c0($s1)
/* 5A61C 80059A1C 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5A620 80059A20 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 5A624 80059A24 0C0165FE */  jal        func_800597F8
/* 5A628 80059A28 8C530078 */   lw        $s3, 0x78($v0)
/* 5A62C 80059A2C 8E3200A8 */  lw         $s2, 0xa8($s1)
/* 5A630 80059A30 12400008 */  beqz       $s2, .L80059A54
/* 5A634 80059A34 0200A021 */   addu      $s4, $s0, $zero
/* 5A638 80059A38 8E3003BC */  lw         $s0, 0x3bc($s1)
/* 5A63C 80059A3C 12000005 */  beqz       $s0, .L80059A54
/* 5A640 80059A40 02002021 */   addu      $a0, $s0, $zero
/* 5A644 80059A44 0C02C131 */  jal        func_800B04C4
/* 5A648 80059A48 26450068 */   addiu     $a1, $s2, 0x68
/* 5A64C 80059A4C 24020005 */  addiu      $v0, $zero, 5
/* 5A650 80059A50 A6020080 */  sh         $v0, 0x80($s0)
.L80059A54:
/* 5A654 80059A54 12600010 */  beqz       $s3, .L80059A98
/* 5A658 80059A58 8E83E960 */   lw        $v1, -0x16a0($s4)
/* 5A65C 80059A5C 906200A8 */  lbu        $v0, 0xa8($v1)
/* 5A660 80059A60 50400007 */  beql       $v0, $zero, .L80059A80
/* 5A664 80059A64 8C620078 */   lw        $v0, 0x78($v1)
/* 5A668 80059A68 8C650078 */  lw         $a1, 0x78($v1)
/* 5A66C 80059A6C 3C04800E */  lui        $a0, %hi(wanderstruct)
/* 5A670 80059A70 0C004A70 */  jal        free_wanderstruct_player
/* 5A674 80059A74 248468F8 */   addiu     $a0, $a0, %lo(wanderstruct)
/* 5A678 80059A78 080166A6 */  j          .L80059A98
/* 5A67C 80059A7C 00000000 */   nop
.L80059A80:
/* 5A680 80059A80 8C440000 */  lw         $a0, ($v0)
/* 5A684 80059A84 0C0061CB */  jal        playerdata_NAND_flags
/* 5A688 80059A88 24050840 */   addiu     $a1, $zero, 0x840
/* 5A68C 80059A8C 8E82E960 */  lw         $v0, -0x16a0($s4)
/* 5A690 80059A90 0C004B51 */  jal        func_80012D44
/* 5A694 80059A94 8C440078 */   lw        $a0, 0x78($v0)
.L80059A98:
/* 5A698 80059A98 12400007 */  beqz       $s2, .L80059AB8
/* 5A69C 80059A9C 02402021 */   addu      $a0, $s2, $zero
/* 5A6A0 80059AA0 0C0061CB */  jal        playerdata_NAND_flags
/* 5A6A4 80059AA4 24050800 */   addiu     $a1, $zero, 0x800
/* 5A6A8 80059AA8 0C00672F */  jal        clear_some_playerHandler_field
/* 5A6AC 80059AAC 00000000 */   nop
/* 5A6B0 80059AB0 0C006744 */  jal        GiveCameraToPlayer
/* 5A6B4 80059AB4 02402021 */   addu      $a0, $s2, $zero
.L80059AB8:
/* 5A6B8 80059AB8 0C0163DE */  jal        dialougmode_free
/* 5A6BC 80059ABC 00000000 */   nop
/* 5A6C0 80059AC0 0C0163CD */  jal        clear_borg13_pointer
/* 5A6C4 80059AC4 00000000 */   nop
/* 5A6C8 80059AC8 8FBF0024 */  lw         $ra, 0x24($sp)
/* 5A6CC 80059ACC 8FB40020 */  lw         $s4, 0x20($sp)
/* 5A6D0 80059AD0 8FB3001C */  lw         $s3, 0x1c($sp)
/* 5A6D4 80059AD4 8FB20018 */  lw         $s2, 0x18($sp)
/* 5A6D8 80059AD8 8FB10014 */  lw         $s1, 0x14($sp)
/* 5A6DC 80059ADC 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A6E0 80059AE0 03E00008 */  jr         $ra
/* 5A6E4 80059AE4 27BD0028 */   addiu     $sp, $sp, 0x28

glabel func_80059AE8
/* 5A6E8 80059AE8 3C05800F */  lui        $a1, %hi(dialougemode_pointer)
/* 5A6EC 80059AEC 3C02800F */  lui        $v0, %hi(borg_13_pointer)
/* 5A6F0 80059AF0 8C43E964 */  lw         $v1, %lo(borg_13_pointer)($v0)
/* 5A6F4 80059AF4 8CA4E960 */  lw         $a0, %lo(dialougemode_pointer)($a1)
/* 5A6F8 80059AF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A6FC 80059AFC AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A700 80059B00 8C650010 */  lw         $a1, 0x10($v1)
/* 5A704 80059B04 948601BE */  lhu        $a2, 0x1be($a0)
/* 5A708 80059B08 0C015AD4 */  jal        func_80056B50
/* 5A70C 80059B0C 248400B4 */   addiu     $a0, $a0, 0xb4
/* 5A710 80059B10 50400002 */  beql       $v0, $zero, .L80059B1C
/* 5A714 80059B14 00001021 */   addu      $v0, $zero, $zero
/* 5A718 80059B18 8C420000 */  lw         $v0, ($v0)
.L80059B1C:
/* 5A71C 80059B1C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A720 80059B20 03E00008 */  jr         $ra
/* 5A724 80059B24 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059B28
/* 5A728 80059B28 3C02800F */  lui        $v0, %hi(D_800EE96C)
/* 5A72C 80059B2C 8C43E96C */  lw         $v1, %lo(D_800EE96C)($v0)
/* 5A730 80059B30 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A734 80059B34 14600003 */  bnez       $v1, .L80059B44
/* 5A738 80059B38 AFBF0010 */   sw        $ra, 0x10($sp)
/* 5A73C 80059B3C 0C009315 */  jal        func_80024C54
/* 5A740 80059B40 2404000B */   addiu     $a0, $zero, 0xb
.L80059B44:
/* 5A744 80059B44 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A748 80059B48 03E00008 */  jr         $ra
/* 5A74C 80059B4C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059B50
/* 5A750 80059B50 3C02800F */  lui        $v0, %hi(dialougemode_pointer)
/* 5A754 80059B54 8C44E960 */  lw         $a0, %lo(dialougemode_pointer)($v0)
/* 5A758 80059B58 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A75C 80059B5C AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A760 80059B60 8C860084 */  lw         $a2, 0x84($a0)
/* 5A764 80059B64 90C20013 */  lbu        $v0, 0x13($a2)
/* 5A768 80059B68 10400015 */  beqz       $v0, .L80059BC0
/* 5A76C 80059B6C 00001821 */   addu      $v1, $zero, $zero
/* 5A770 80059B70 00802821 */  addu       $a1, $a0, $zero
/* 5A774 80059B74 24A70124 */  addiu      $a3, $a1, 0x124
/* 5A778 80059B78 000310C0 */  sll        $v0, $v1, 3
.L80059B7C:
/* 5A77C 80059B7C 00E21021 */  addu       $v0, $a3, $v0
/* 5A780 80059B80 8C440000 */  lw         $a0, ($v0)
/* 5A784 80059B84 50800009 */  beql       $a0, $zero, .L80059BAC
/* 5A788 80059B88 24630001 */   addiu     $v1, $v1, 1
/* 5A78C 80059B8C 90A200AC */  lbu        $v0, 0xac($a1)
/* 5A790 80059B90 50400005 */  beql       $v0, $zero, .L80059BA8
/* 5A794 80059B94 A4800014 */   sh        $zero, 0x14($a0)
/* 5A798 80059B98 8CA20088 */  lw         $v0, 0x88($a1)
/* 5A79C 80059B9C 50820003 */  beql       $a0, $v0, .L80059BAC
/* 5A7A0 80059BA0 24630001 */   addiu     $v1, $v1, 1
/* 5A7A4 80059BA4 A4800014 */  sh         $zero, 0x14($a0)
.L80059BA8:
/* 5A7A8 80059BA8 24630001 */  addiu      $v1, $v1, 1
.L80059BAC:
/* 5A7AC 80059BAC 90C20013 */  lbu        $v0, 0x13($a2)
/* 5A7B0 80059BB0 306300FF */  andi       $v1, $v1, 0xff
/* 5A7B4 80059BB4 0062102B */  sltu       $v0, $v1, $v0
/* 5A7B8 80059BB8 1440FFF0 */  bnez       $v0, .L80059B7C
/* 5A7BC 80059BBC 000310C0 */   sll       $v0, $v1, 3
.L80059BC0:
/* 5A7C0 80059BC0 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5A7C4 80059BC4 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 5A7C8 80059BC8 94431622 */  lhu        $v1, 0x1622($v0)
/* 5A7CC 80059BCC 14600008 */  bnez       $v1, .L80059BF0
/* 5A7D0 80059BD0 8FBF0010 */   lw        $ra, 0x10($sp)
/* 5A7D4 80059BD4 3C03800F */  lui        $v1, %hi(borg13_flag)
/* 5A7D8 80059BD8 8C62E968 */  lw         $v0, %lo(borg13_flag)($v1)
/* 5A7DC 80059BDC 10400004 */  beqz       $v0, .L80059BF0
/* 5A7E0 80059BE0 00000000 */   nop
/* 5A7E4 80059BE4 0C0160C7 */  jal        func_8005831C
/* 5A7E8 80059BE8 AC60E968 */   sw        $zero, -0x1698($v1)
/* 5A7EC 80059BEC 8FBF0010 */  lw         $ra, 0x10($sp)
.L80059BF0:
/* 5A7F0 80059BF0 03E00008 */  jr         $ra
/* 5A7F4 80059BF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059BF8
/* 5A7F8 80059BF8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A7FC 80059BFC 3C02800E */  lui        $v0, %hi(D_800E7E64)
/* 5A800 80059C00 24427E64 */  addiu      $v0, $v0, %lo(D_800E7E64)
/* 5A804 80059C04 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A808 80059C08 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A80C 80059C0C 94430066 */  lhu        $v1, 0x66($v0)
/* 5A810 80059C10 14600013 */  bnez       $v1, .L80059C60
/* 5A814 80059C14 00802821 */   addu      $a1, $a0, $zero
/* 5A818 80059C18 0C013AA5 */  jal        func_8004EA94
/* 5A81C 80059C1C 8C440004 */   lw        $a0, 4($v0)
/* 5A820 80059C20 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5A824 80059C24 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 5A828 80059C28 904400AB */  lbu        $a0, 0xab($v0)
/* 5A82C 80059C2C 24030001 */  addiu      $v1, $zero, 1
/* 5A830 80059C30 1483000C */  bne        $a0, $v1, .L80059C64
/* 5A834 80059C34 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5A838 80059C38 0C0166BA */  jal        func_80059AE8
/* 5A83C 80059C3C 00000000 */   nop
/* 5A840 80059C40 00402021 */  addu       $a0, $v0, $zero
/* 5A844 80059C44 10800006 */  beqz       $a0, .L80059C60
/* 5A848 80059C48 8E02E960 */   lw        $v0, -0x16a0($s0)
/* 5A84C 80059C4C 904300AC */  lbu        $v1, 0xac($v0)
/* 5A850 80059C50 14600004 */  bnez       $v1, .L80059C64
/* 5A854 80059C54 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5A858 80059C58 24020004 */  addiu      $v0, $zero, 4
/* 5A85C 80059C5C A4820014 */  sh         $v0, 0x14($a0)
.L80059C60:
/* 5A860 80059C60 8FBF0014 */  lw         $ra, 0x14($sp)
.L80059C64:
/* 5A864 80059C64 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A868 80059C68 03E00008 */  jr         $ra
/* 5A86C 80059C6C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059C70
/* 5A870 80059C70 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A874 80059C74 AFB00010 */  sw         $s0, 0x10($sp)
/* 5A878 80059C78 3C10800F */  lui        $s0, %hi(dialougemode_pointer)
/* 5A87C 80059C7C 8E02E960 */  lw         $v0, %lo(dialougemode_pointer)($s0)
/* 5A880 80059C80 AFBF0014 */  sw         $ra, 0x14($sp)
/* 5A884 80059C84 8C430084 */  lw         $v1, 0x84($v0)
/* 5A888 80059C88 9464000E */  lhu        $a0, 0xe($v1)
/* 5A88C 80059C8C 0C00918D */  jal        setEventFlag
/* 5A890 80059C90 24050001 */   addiu     $a1, $zero, 1
/* 5A894 80059C94 8E03E960 */  lw         $v1, -0x16a0($s0)
/* 5A898 80059C98 3C01800E */  lui        $at, %hi(D_800DEBE4)
/* 5A89C 80059C9C C420EBE4 */  lwc1       $f0, %lo(D_800DEBE4)($at)
/* 5A8A0 80059CA0 24020002 */  addiu      $v0, $zero, 2
/* 5A8A4 80059CA4 A06200AB */  sb         $v0, 0xab($v1)
/* 5A8A8 80059CA8 24020001 */  addiu      $v0, $zero, 1
/* 5A8AC 80059CAC 8E04E960 */  lw         $a0, -0x16a0($s0)
/* 5A8B0 80059CB0 3C03800E */  lui        $v1, %hi(gGlobals)
/* 5A8B4 80059CB4 A08200A8 */  sb         $v0, 0xa8($a0)
/* 5A8B8 80059CB8 8E04E960 */  lw         $a0, -0x16a0($s0)
/* 5A8BC 80059CBC 246668A8 */  addiu      $a2, $v1, %lo(gGlobals)
/* 5A8C0 80059CC0 8C850084 */  lw         $a1, 0x84($a0)
/* 5A8C4 80059CC4 24020001 */  addiu      $v0, $zero, 1
/* 5A8C8 80059CC8 A4C22048 */  sh         $v0, 0x2048($a2)
/* 5A8CC 80059CCC E4C02044 */  swc1       $f0, 0x2044($a2)
/* 5A8D0 80059CD0 90A30014 */  lbu        $v1, 0x14($a1)
/* 5A8D4 80059CD4 24020002 */  addiu      $v0, $zero, 2
/* 5A8D8 80059CD8 14620004 */  bne        $v1, $v0, .L80059CEC
/* 5A8DC 80059CDC 8FBF0014 */   lw        $ra, 0x14($sp)
/* 5A8E0 80059CE0 3C01800E */  lui        $at, %hi(D_800DEBE8)
/* 5A8E4 80059CE4 C420EBE8 */  lwc1       $f0, %lo(D_800DEBE8)($at)
/* 5A8E8 80059CE8 E4C02044 */  swc1       $f0, 0x2044($a2)
.L80059CEC:
/* 5A8EC 80059CEC 8FB00010 */  lw         $s0, 0x10($sp)
/* 5A8F0 80059CF0 03E00008 */  jr         $ra
/* 5A8F4 80059CF4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel camping_var_11
/* 5A8F8 80059CF8 3C03800E */  lui        $v1, %hi(camping_var)
/* 5A8FC 80059CFC 2402000B */  addiu      $v0, $zero, 0xb
/* 5A900 80059D00 03E00008 */  jr         $ra
/* 5A904 80059D04 A0626984 */   sb        $v0, %lo(camping_var)($v1)

glabel NOOP_80059D08
/* 5A908 80059D08 03E00008 */  jr         $ra
/* 5A90C 80059D0C 00000000 */   nop

glabel func_80059D10
/* 5A910 80059D10 00802821 */  addu       $a1, $a0, $zero
/* 5A914 80059D14 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 5A918 80059D18 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5A91C 80059D1C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A920 80059D20 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A924 80059D24 0C013AA5 */  jal        func_8004EA94
/* 5A928 80059D28 00000000 */   nop
/* 5A92C 80059D2C 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A930 80059D30 03E00008 */  jr         $ra
/* 5A934 80059D34 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059D38
/* 5A938 80059D38 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 5A93C 80059D3C 3C02800E */  lui        $v0, %hi(gGlobals)
/* 5A940 80059D40 3C03800F */  lui        $v1, %hi(dialougemode_pointer)
/* 5A944 80059D44 8C67E960 */  lw         $a3, %lo(dialougemode_pointer)($v1)
/* 5A948 80059D48 244268A8 */  addiu      $v0, $v0, %lo(gGlobals)
/* 5A94C 80059D4C AFBF0018 */  sw         $ra, 0x18($sp)
/* 5A950 80059D50 8C4400A8 */  lw         $a0, 0xa8($v0)
/* 5A954 80059D54 24E600B4 */  addiu      $a2, $a3, 0xb4
/* 5A958 80059D58 A4800014 */  sh         $zero, 0x14($a0)
/* 5A95C 80059D5C AFA00010 */  sw         $zero, 0x10($sp)
/* 5A960 80059D60 8C4415C0 */  lw         $a0, 0x15c0($v0)
/* 5A964 80059D64 8CE50084 */  lw         $a1, 0x84($a3)
/* 5A968 80059D68 0C013A6B */  jal        StartDialoug
/* 5A96C 80059D6C 24070003 */   addiu     $a3, $zero, 3
/* 5A970 80059D70 8FBF0018 */  lw         $ra, 0x18($sp)
/* 5A974 80059D74 03E00008 */  jr         $ra
/* 5A978 80059D78 27BD0020 */   addiu     $sp, $sp, 0x20

glabel NOOP_80059d7c
/* 5A97C 80059D7C 03E00008 */  jr         $ra
/* 5A980 80059D80 00000000 */   nop

glabel func_80059D84
/* 5A984 80059D84 00802821 */  addu       $a1, $a0, $zero
/* 5A988 80059D88 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 5A98C 80059D8C 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5A990 80059D90 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A994 80059D94 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A998 80059D98 0C013AA5 */  jal        func_8004EA94
/* 5A99C 80059D9C 00000000 */   nop
/* 5A9A0 80059DA0 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A9A4 80059DA4 03E00008 */  jr         $ra
/* 5A9A8 80059DA8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_80059DAC
/* 5A9AC 80059DAC 3C02800E */  lui        $v0, %hi(some_struct_pointer)
/* 5A9B0 80059DB0 8C447E68 */  lw         $a0, %lo(some_struct_pointer)($v0)
/* 5A9B4 80059DB4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 5A9B8 80059DB8 AFBF0010 */  sw         $ra, 0x10($sp)
/* 5A9BC 80059DBC 0C013C77 */  jal        func_8004F1DC
/* 5A9C0 80059DC0 00000000 */   nop
/* 5A9C4 80059DC4 0C0163DE */  jal        dialougmode_free
/* 5A9C8 80059DC8 00000000 */   nop
/* 5A9CC 80059DCC 0C0163CD */  jal        clear_borg13_pointer
/* 5A9D0 80059DD0 00000000 */   nop
/* 5A9D4 80059DD4 8FBF0010 */  lw         $ra, 0x10($sp)
/* 5A9D8 80059DD8 03E00008 */  jr         $ra
/* 5A9DC 80059DDC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel isDialougeMode
/* 5A9E0 80059DE0 3C02800E */  lui        $v0, %hi(screenFadeMode_switch)
/* 5A9E4 80059DE4 904468E8 */  lbu        $a0, %lo(screenFadeMode_switch)($v0)
/* 5A9E8 80059DE8 2403000C */  addiu      $v1, $zero, 0xc
/* 5A9EC 80059DEC 14830003 */  bne        $a0, $v1, .L80059DFC
/* 5A9F0 80059DF0 3C03800F */   lui       $v1, %hi(dialougemode_pointer)
/* 5A9F4 80059DF4 03E00008 */  jr         $ra
/* 5A9F8 80059DF8 24020001 */   addiu     $v0, $zero, 1
.L80059DFC:
/* 5A9FC 80059DFC 8C62E960 */  lw         $v0, %lo(dialougemode_pointer)($v1)
/* 5AA00 80059E00 03E00008 */  jr         $ra
/* 5AA04 80059E04 0002102B */   sltu      $v0, $zero, $v0
/* 5AA08 80059E08 00000000 */  nop
/* 5AA0C 80059E0C 00000000 */  nop
