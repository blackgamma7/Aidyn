.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel __osContAddressCrc
/* C3AD0 800C2ED0 00001821 */  addu       $v1, $zero, $zero
/* C3AD4 800C2ED4 24050400 */  addiu      $a1, $zero, 0x400
/* C3AD8 800C2ED8 3084FFFF */  andi       $a0, $a0, 0xffff
/* C3ADC 800C2EDC 00851024 */  and        $v0, $a0, $a1
.L800C2EE0:
/* C3AE0 800C2EE0 10400006 */  beqz       $v0, .L800C2EFC
/* C3AE4 800C2EE4 00031840 */   sll       $v1, $v1, 1
/* C3AE8 800C2EE8 30620020 */  andi       $v0, $v1, 0x20
/* C3AEC 800C2EEC 50400006 */  beql       $v0, $zero, .L800C2F08
/* C3AF0 800C2EF0 24630001 */   addiu     $v1, $v1, 1
/* C3AF4 800C2EF4 08030BC2 */  j          .L800C2F08
/* C3AF8 800C2EF8 38630014 */   xori      $v1, $v1, 0x14
.L800C2EFC:
/* C3AFC 800C2EFC 30620020 */  andi       $v0, $v1, 0x20
/* C3B00 800C2F00 54400001 */  bnel       $v0, $zero, .L800C2F08
/* C3B04 800C2F04 38630015 */   xori      $v1, $v1, 0x15
.L800C2F08:
/* C3B08 800C2F08 00052842 */  srl        $a1, $a1, 1
/* C3B0C 800C2F0C 14A0FFF4 */  bnez       $a1, .L800C2EE0
/* C3B10 800C2F10 00851024 */   and       $v0, $a0, $a1
/* C3B14 800C2F14 24050005 */  addiu      $a1, $zero, 5
/* C3B18 800C2F18 00031840 */  sll        $v1, $v1, 1
.L800C2F1C:
/* C3B1C 800C2F1C 30620020 */  andi       $v0, $v1, 0x20
/* C3B20 800C2F20 54400001 */  bnel       $v0, $zero, .L800C2F28
/* C3B24 800C2F24 38630015 */   xori      $v1, $v1, 0x15
.L800C2F28:
/* C3B28 800C2F28 24A5FFFF */  addiu      $a1, $a1, -1
/* C3B2C 800C2F2C 54A0FFFB */  bnel       $a1, $zero, .L800C2F1C
/* C3B30 800C2F30 00031840 */   sll       $v1, $v1, 1
/* C3B34 800C2F34 03E00008 */  jr         $ra
/* C3B38 800C2F38 3062001F */   andi      $v0, $v1, 0x1f

glabel __osContDataCrc
/* C3B3C 800C2F3C 00001821 */  addu       $v1, $zero, $zero
/* C3B40 800C2F40 24060020 */  addiu      $a2, $zero, 0x20
.L800C2F44:
/* C3B44 800C2F44 24050080 */  addiu      $a1, $zero, 0x80
/* C3B48 800C2F48 90870000 */  lbu        $a3, ($a0)
/* C3B4C 800C2F4C 00E51024 */  and        $v0, $a3, $a1
.L800C2F50:
/* C3B50 800C2F50 10400006 */  beqz       $v0, .L800C2F6C
/* C3B54 800C2F54 00031840 */   sll       $v1, $v1, 1
/* C3B58 800C2F58 30620100 */  andi       $v0, $v1, 0x100
/* C3B5C 800C2F5C 50400006 */  beql       $v0, $zero, .L800C2F78
/* C3B60 800C2F60 24630001 */   addiu     $v1, $v1, 1
/* C3B64 800C2F64 08030BDE */  j          .L800C2F78
/* C3B68 800C2F68 38630084 */   xori      $v1, $v1, 0x84
.L800C2F6C:
/* C3B6C 800C2F6C 30620100 */  andi       $v0, $v1, 0x100
/* C3B70 800C2F70 54400001 */  bnel       $v0, $zero, .L800C2F78
/* C3B74 800C2F74 38630085 */   xori      $v1, $v1, 0x85
.L800C2F78:
/* C3B78 800C2F78 00052842 */  srl        $a1, $a1, 1
/* C3B7C 800C2F7C 14A0FFF4 */  bnez       $a1, .L800C2F50
/* C3B80 800C2F80 00E51024 */   and       $v0, $a3, $a1
/* C3B84 800C2F84 24C6FFFF */  addiu      $a2, $a2, -1
/* C3B88 800C2F88 14C0FFEE */  bnez       $a2, .L800C2F44
/* C3B8C 800C2F8C 24840001 */   addiu     $a0, $a0, 1
/* C3B90 800C2F90 00031840 */  sll        $v1, $v1, 1
.L800C2F94:
/* C3B94 800C2F94 30620100 */  andi       $v0, $v1, 0x100
/* C3B98 800C2F98 54400001 */  bnel       $v0, $zero, .L800C2FA0
/* C3B9C 800C2F9C 38630085 */   xori      $v1, $v1, 0x85
.L800C2FA0:
/* C3BA0 800C2FA0 24C60001 */  addiu      $a2, $a2, 1
/* C3BA4 800C2FA4 2CC20008 */  sltiu      $v0, $a2, 8
/* C3BA8 800C2FA8 5440FFFA */  bnel       $v0, $zero, .L800C2F94
/* C3BAC 800C2FAC 00031840 */   sll       $v1, $v1, 1
/* C3BB0 800C2FB0 03E00008 */  jr         $ra
/* C3BB4 800C2FB4 306200FF */   andi      $v0, $v1, 0xff
/* C3BB8 800C2FB8 00000000 */  nop
/* C3BBC 800C2FBC 00000000 */  nop
