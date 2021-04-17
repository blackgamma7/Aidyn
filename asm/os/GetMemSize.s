.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osGetMemSize
/* C3BD0 800C2FD0 3C040040 */  lui        $a0, 0x40
/* C3BD4 800C2FD4 3C080010 */  lui        $t0, 0x10
/* C3BD8 800C2FD8 3C09007F */  lui        $t1, 0x7f
/* C3BDC 800C2FDC 3529FFFF */  ori        $t1, $t1, 0xffff
/* C3BE0 800C2FE0 3C05A040 */  lui        $a1, 0xa040
.L800C2FE4:
/* C3BE4 800C2FE4 8CA60000 */  lw         $a2, ($a1)
/* C3BE8 800C2FE8 3C07A010 */  lui        $a3, %hi(D_A00FFFFC)
/* C3BEC 800C2FEC 00E43821 */  addu       $a3, $a3, $a0
/* C3BF0 800C2FF0 8CE7FFFC */  lw         $a3, %lo(D_A00FFFFC)($a3)
/* C3BF4 800C2FF4 8CA20000 */  lw         $v0, ($a1)
/* C3BF8 800C2FF8 00021027 */  nor        $v0, $zero, $v0
/* C3BFC 800C2FFC ACA20000 */  sw         $v0, ($a1)
/* C3C00 800C3000 3C02A010 */  lui        $v0, %hi(D_A00FFFFC)
/* C3C04 800C3004 00441021 */  addu       $v0, $v0, $a0
/* C3C08 800C3008 8C42FFFC */  lw         $v0, %lo(D_A00FFFFC)($v0)
/* C3C0C 800C300C 00021027 */  nor        $v0, $zero, $v0
/* C3C10 800C3010 3C01A010 */  lui        $at, %hi(D_A00FFFFC)
/* C3C14 800C3014 00240821 */  addu       $at, $at, $a0
/* C3C18 800C3018 AC22FFFC */  sw         $v0, %lo(D_A00FFFFC)($at)
/* C3C1C 800C301C 8CA30000 */  lw         $v1, ($a1)
/* C3C20 800C3020 00061027 */  nor        $v0, $zero, $a2
/* C3C24 800C3024 14620010 */  bne        $v1, $v0, .L800C3068
/* C3C28 800C3028 00000000 */   nop
/* C3C2C 800C302C 3C03A010 */  lui        $v1, %hi(D_A00FFFFC)
/* C3C30 800C3030 00641821 */  addu       $v1, $v1, $a0
/* C3C34 800C3034 8C63FFFC */  lw         $v1, %lo(D_A00FFFFC)($v1)
/* C3C38 800C3038 00071027 */  nor        $v0, $zero, $a3
/* C3C3C 800C303C 1462000A */  bne        $v1, $v0, .L800C3068
/* C3C40 800C3040 00000000 */   nop
/* C3C44 800C3044 ACA60000 */  sw         $a2, ($a1)
/* C3C48 800C3048 00A82821 */  addu       $a1, $a1, $t0
/* C3C4C 800C304C 3C01A010 */  lui        $at, %hi(D_A00FFFFC)
/* C3C50 800C3050 00240821 */  addu       $at, $at, $a0
/* C3C54 800C3054 AC27FFFC */  sw         $a3, %lo(D_A00FFFFC)($at)
/* C3C58 800C3058 00882021 */  addu       $a0, $a0, $t0
/* C3C5C 800C305C 0124102B */  sltu       $v0, $t1, $a0
/* C3C60 800C3060 1040FFE0 */  beqz       $v0, .L800C2FE4
/* C3C64 800C3064 00000000 */   nop
.L800C3068:
/* C3C68 800C3068 03E00008 */  jr         $ra
/* C3C6C 800C306C 00801021 */   addu      $v0, $a0, $zero
