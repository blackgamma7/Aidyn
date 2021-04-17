.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel crashthread_init
/* 98780 80097B80 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* 98784 80097B84 AFB5002C */  sw         $s5, 0x2c($sp)
/* 98788 80097B88 0080A821 */  addu       $s5, $a0, $zero
/* 9878C 80097B8C AFB00018 */  sw         $s0, 0x18($sp)
/* 98790 80097B90 3C10800F */  lui        $s0, %hi(CrashStruct)
/* 98794 80097B94 26101DF0 */  addiu      $s0, $s0, %lo(CrashStruct)
/* 98798 80097B98 02002021 */  addu       $a0, $s0, $zero
/* 9879C 80097B9C AFB30024 */  sw         $s3, 0x24($sp)
/* 987A0 80097BA0 00A09821 */  addu       $s3, $a1, $zero
/* 987A4 80097BA4 00002821 */  addu       $a1, $zero, $zero
/* 987A8 80097BA8 AFB40028 */  sw         $s4, 0x28($sp)
/* 987AC 80097BAC 30D400FF */  andi       $s4, $a2, 0xff
/* 987B0 80097BB0 24060B20 */  addiu      $a2, $zero, 0xb20
/* 987B4 80097BB4 AFB20020 */  sw         $s2, 0x20($sp)
/* 987B8 80097BB8 30F2FFFF */  andi       $s2, $a3, 0xffff
/* 987BC 80097BBC AFBF0030 */  sw         $ra, 0x30($sp)
/* 987C0 80097BC0 0C026380 */  jal        Calloc
/* 987C4 80097BC4 AFB1001C */   sw        $s1, 0x1c($sp)
/* 987C8 80097BC8 26110848 */  addiu      $s1, $s0, 0x848
/* 987CC 80097BCC 02202021 */  addu       $a0, $s1, $zero
/* 987D0 80097BD0 02402821 */  addu       $a1, $s2, $zero
/* 987D4 80097BD4 3C068009 */  lui        $a2, %hi(crashProc)
/* 987D8 80097BD8 24C67C20 */  addiu      $a2, $a2, %lo(crashProc)
/* 987DC 80097BDC 00003821 */  addu       $a3, $zero, $zero
/* 987E0 80097BE0 AE150B1C */  sw         $s5, 0xb1c($s0)
/* 987E4 80097BE4 AE130A14 */  sw         $s3, 0xa14($s0)
/* 987E8 80097BE8 AFB10010 */  sw         $s1, 0x10($sp)
/* 987EC 80097BEC 0C02FBB0 */  jal        osCreateThread
/* 987F0 80097BF0 AFB40014 */   sw        $s4, 0x14($sp)
/* 987F4 80097BF4 0C0334B8 */  jal        osStartThread
/* 987F8 80097BF8 02202021 */   addu      $a0, $s1, $zero
/* 987FC 80097BFC 8FBF0030 */  lw         $ra, 0x30($sp)
/* 98800 80097C00 8FB5002C */  lw         $s5, 0x2c($sp)
/* 98804 80097C04 8FB40028 */  lw         $s4, 0x28($sp)
/* 98808 80097C08 8FB30024 */  lw         $s3, 0x24($sp)
/* 9880C 80097C0C 8FB20020 */  lw         $s2, 0x20($sp)
/* 98810 80097C10 8FB1001C */  lw         $s1, 0x1c($sp)
/* 98814 80097C14 8FB00018 */  lw         $s0, 0x18($sp)
/* 98818 80097C18 03E00008 */  jr         $ra
/* 9881C 80097C1C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel crashProc
/* 98820 80097C20 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 98824 80097C24 AFBF0024 */  sw         $ra, 0x24($sp)
/* 98828 80097C28 AFB20020 */  sw         $s2, 0x20($sp)
/* 9882C 80097C2C AFB1001C */  sw         $s1, 0x1c($sp)
/* 98830 80097C30 0C025F1B */  jal        crashMesgQueue
/* 98834 80097C34 AFB00018 */   sw        $s0, 0x18($sp)
/* 98838 80097C38 27B20010 */  addiu      $s2, $sp, 0x10
/* 9883C 80097C3C 3C02800F */  lui        $v0, %hi(crashMesgQ)
/* 98840 80097C40 245127EC */  addiu      $s1, $v0, %lo(crashMesgQ)
/* 98844 80097C44 2630F604 */  addiu      $s0, $s1, -0x9fc
/* 98848 80097C48 02202021 */  addu       $a0, $s1, $zero
.L80097C4C:
/* 9884C 80097C4C 02402821 */  addu       $a1, $s2, $zero
/* 98850 80097C50 0C0321E4 */  jal        osRecvMesg
/* 98854 80097C54 24060001 */   addiu     $a2, $zero, 1
/* 98858 80097C58 8E030B1C */  lw         $v1, 0xb1c($s0)
/* 9885C 80097C5C 0060F809 */  jalr       $v1
/* 98860 80097C60 26040A14 */   addiu     $a0, $s0, 0xa14
/* 98864 80097C64 08025F13 */  j          .L80097C4C
/* 98868 80097C68 02202021 */   addu      $a0, $s1, $zero

glabel crashMesgQueue
/* 9886C 80097C6C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 98870 80097C70 AFB00010 */  sw         $s0, 0x10($sp)
/* 98874 80097C74 3C10800F */  lui        $s0, %hi(crashMesgQ)
/* 98878 80097C78 261027EC */  addiu      $s0, $s0, %lo(crashMesgQ)
/* 9887C 80097C7C 02002021 */  addu       $a0, $s0, $zero
/* 98880 80097C80 2605FFFC */  addiu      $a1, $s0, -4
/* 98884 80097C84 AFBF0014 */  sw         $ra, 0x14($sp)
/* 98888 80097C88 0C02FBA4 */  jal        osCreateMesgQueue
/* 9888C 80097C8C 24060001 */   addiu     $a2, $zero, 1
/* 98890 80097C90 2404000C */  addiu      $a0, $zero, 0xc
/* 98894 80097C94 02002821 */  addu       $a1, $s0, $zero
/* 98898 80097C98 0C033188 */  jal        osSetEventMesg
/* 9889C 80097C9C 24060001 */   addiu     $a2, $zero, 1
/* 988A0 80097CA0 8FBF0014 */  lw         $ra, 0x14($sp)
/* 988A4 80097CA4 A200011C */  sb         $zero, 0x11c($s0)
/* 988A8 80097CA8 8FB00010 */  lw         $s0, 0x10($sp)
/* 988AC 80097CAC 03E00008 */  jr         $ra
/* 988B0 80097CB0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel manualCrash
/* 988B4 80097CB4 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 988B8 80097CB8 00801021 */  addu       $v0, $a0, $zero
/* 988BC 80097CBC AFB00010 */  sw         $s0, 0x10($sp)
/* 988C0 80097CC0 3C10800F */  lui        $s0, %hi(CrashStruct)
/* 988C4 80097CC4 26101DF0 */  addiu      $s0, $s0, %lo(CrashStruct)
/* 988C8 80097CC8 26040A18 */  addiu      $a0, $s0, 0xa18
/* 988CC 80097CCC AFB10014 */  sw         $s1, 0x14($sp)
/* 988D0 80097CD0 00A08821 */  addu       $s1, $a1, $zero
/* 988D4 80097CD4 00402821 */  addu       $a1, $v0, $zero
/* 988D8 80097CD8 24060080 */  addiu      $a2, $zero, 0x80
/* 988DC 80097CDC 24020001 */  addiu      $v0, $zero, 1
/* 988E0 80097CE0 AFBF0018 */  sw         $ra, 0x18($sp)
/* 988E4 80097CE4 0C026276 */  jal        ManualCrashPrint
/* 988E8 80097CE8 A2020B18 */   sb        $v0, 0xb18($s0)
/* 988EC 80097CEC 26040A98 */  addiu      $a0, $s0, 0xa98
/* 988F0 80097CF0 02202821 */  addu       $a1, $s1, $zero
/* 988F4 80097CF4 24060080 */  addiu      $a2, $zero, 0x80
/* 988F8 80097CF8 0C026276 */  jal        ManualCrashPrint
/* 988FC 80097CFC A2000A97 */   sb        $zero, 0xa97($s0)
/* 98900 80097D00 260409FC */  addiu      $a0, $s0, 0x9fc
/* 98904 80097D04 24050001 */  addiu      $a1, $zero, 1
/* 98908 80097D08 00003021 */  addu       $a2, $zero, $zero
/* 9890C 80097D0C 0C03313C */  jal        osSendMesg
/* 98910 80097D10 A2000B17 */   sb        $zero, 0xb17($s0)
/* 98914 80097D14 8FBF0018 */  lw         $ra, 0x18($sp)
/* 98918 80097D18 8FB10014 */  lw         $s1, 0x14($sp)
/* 9891C 80097D1C 8FB00010 */  lw         $s0, 0x10($sp)
/* 98920 80097D20 03E00008 */  jr         $ra
/* 98924 80097D24 27BD0020 */   addiu     $sp, $sp, 0x20
/* 98928 80097D28 00000000 */  nop
/* 9892C 80097D2C 00000000 */  nop
