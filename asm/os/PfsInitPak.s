.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osPfsInitPak
/* C6FF0 800C63F0 27BDFF90 */  addiu      $sp, $sp, -0x70
/* C6FF4 800C63F4 AFB20060 */  sw         $s2, 0x60($sp)
/* C6FF8 800C63F8 00809021 */  addu       $s2, $a0, $zero
/* C6FFC 800C63FC AFB1005C */  sw         $s1, 0x5c($sp)
/* C7000 800C6400 00A08821 */  addu       $s1, $a1, $zero
/* C7004 800C6404 AFB30064 */  sw         $s3, 0x64($sp)
/* C7008 800C6408 00C09821 */  addu       $s3, $a2, $zero
/* C700C 800C640C AFBF0068 */  sw         $ra, 0x68($sp)
/* C7010 800C6410 0C033265 */  jal        __osSiGetAccess
/* C7014 800C6414 AFB00058 */   sw        $s0, 0x58($sp)
/* C7018 800C6418 02402021 */  addu       $a0, $s2, $zero
/* C701C 800C641C 0C031878 */  jal        __osPfsGetStatus
/* C7020 800C6420 02602821 */   addu      $a1, $s3, $zero
/* C7024 800C6424 0C033280 */  jal        _osSiRelAccess
/* C7028 800C6428 00408021 */   addu      $s0, $v0, $zero
/* C702C 800C642C 16000067 */  bnez       $s0, .L800C65CC
/* C7030 800C6430 02001021 */   addu      $v0, $s0, $zero
/* C7034 800C6434 02202021 */  addu       $a0, $s1, $zero
/* C7038 800C6438 AE320004 */  sw         $s2, 4($s1)
/* C703C 800C643C AE330008 */  sw         $s3, 8($s1)
/* C7040 800C6440 0C03197A */  jal        __osPfsCheckRamArea
/* C7044 800C6444 AE200000 */   sw        $zero, ($s1)
/* C7048 800C6448 00408021 */  addu       $s0, $v0, $zero
/* C704C 800C644C 1600005F */  bnez       $s0, .L800C65CC
/* C7050 800C6450 02202021 */   addu      $a0, $s1, $zero
/* C7054 800C6454 0C031DC8 */  jal        __osPfsSelectBank
/* C7058 800C6458 00002821 */   addu      $a1, $zero, $zero
/* C705C 800C645C 00408021 */  addu       $s0, $v0, $zero
/* C7060 800C6460 1600005A */  bnez       $s0, .L800C65CC
/* C7064 800C6464 24060001 */   addiu     $a2, $zero, 1
/* C7068 800C6468 8E240004 */  lw         $a0, 4($s1)
/* C706C 800C646C 8E250008 */  lw         $a1, 8($s1)
/* C7070 800C6470 0C0309EC */  jal        __osContRamRead
/* C7074 800C6474 27A70010 */   addiu     $a3, $sp, 0x10
/* C7078 800C6478 00408021 */  addu       $s0, $v0, $zero
/* C707C 800C647C 16000053 */  bnez       $s0, .L800C65CC
/* C7080 800C6480 27A40010 */   addiu     $a0, $sp, 0x10
/* C7084 800C6484 27A50050 */  addiu      $a1, $sp, 0x50
/* C7088 800C6488 0C031469 */  jal        __osIdCheckSum
/* C708C 800C648C 27A60052 */   addiu     $a2, $sp, 0x52
/* C7090 800C6490 97A3002C */  lhu        $v1, 0x2c($sp)
/* C7094 800C6494 97A20050 */  lhu        $v0, 0x50($sp)
/* C7098 800C6498 14620005 */  bne        $v1, $v0, .L800C64B0
/* C709C 800C649C 27B20010 */   addiu     $s2, $sp, 0x10
/* C70A0 800C64A0 97A3002E */  lhu        $v1, 0x2e($sp)
/* C70A4 800C64A4 97A20052 */  lhu        $v0, 0x52($sp)
/* C70A8 800C64A8 1062000B */  beq        $v1, $v0, .L800C64D8
/* C70AC 800C64AC 00000000 */   nop
.L800C64B0:
/* C70B0 800C64B0 02202021 */  addu       $a0, $s1, $zero
/* C70B4 800C64B4 0C031535 */  jal        __osCheckPackId
/* C70B8 800C64B8 02402821 */   addu      $a1, $s2, $zero
/* C70BC 800C64BC 00408021 */  addu       $s0, $v0, $zero
/* C70C0 800C64C0 12000005 */  beqz       $s0, .L800C64D8
/* C70C4 800C64C4 00000000 */   nop
/* C70C8 800C64C8 8E230000 */  lw         $v1, ($s1)
/* C70CC 800C64CC 34630004 */  ori        $v1, $v1, 4
/* C70D0 800C64D0 08031973 */  j          .L800C65CC
/* C70D4 800C64D4 AE230000 */   sw        $v1, ($s1)
.L800C64D8:
/* C70D8 800C64D8 96420018 */  lhu        $v0, 0x18($s2)
/* C70DC 800C64DC 30420001 */  andi       $v0, $v0, 1
/* C70E0 800C64E0 14400015 */  bnez       $v0, .L800C6538
/* C70E4 800C64E4 02402021 */   addu      $a0, $s2, $zero
/* C70E8 800C64E8 02202021 */  addu       $a0, $s1, $zero
/* C70EC 800C64EC 02402821 */  addu       $a1, $s2, $zero
/* C70F0 800C64F0 27B20030 */  addiu      $s2, $sp, 0x30
/* C70F4 800C64F4 0C03147A */  jal        __osRepairPackId
/* C70F8 800C64F8 02403021 */   addu      $a2, $s2, $zero
/* C70FC 800C64FC 00408021 */  addu       $s0, $v0, $zero
/* C7100 800C6500 12000007 */  beqz       $s0, .L800C6520
/* C7104 800C6504 2402000A */   addiu     $v0, $zero, 0xa
/* C7108 800C6508 16020030 */  bne        $s0, $v0, .L800C65CC
/* C710C 800C650C 02001021 */   addu      $v0, $s0, $zero
/* C7110 800C6510 8E220000 */  lw         $v0, ($s1)
/* C7114 800C6514 34420004 */  ori        $v0, $v0, 4
/* C7118 800C6518 08031972 */  j          .L800C65C8
/* C711C 800C651C AE220000 */   sw        $v0, ($s1)
.L800C6520:
/* C7120 800C6520 97A20048 */  lhu        $v0, 0x48($sp)
/* C7124 800C6524 30420001 */  andi       $v0, $v0, 1
/* C7128 800C6528 14400003 */  bnez       $v0, .L800C6538
/* C712C 800C652C 02402021 */   addu      $a0, $s2, $zero
/* C7130 800C6530 08031973 */  j          .L800C65CC
/* C7134 800C6534 2402000B */   addiu     $v0, $zero, 0xb
.L800C6538:
/* C7138 800C6538 2625000C */  addiu      $a1, $s1, 0xc
/* C713C 800C653C 0C030A68 */  jal        _VirtualToPhysicalCopy
/* C7140 800C6540 24060020 */   addiu     $a2, $zero, 0x20
/* C7144 800C6544 8E240004 */  lw         $a0, 4($s1)
/* C7148 800C6548 8E250008 */  lw         $a1, 8($s1)
/* C714C 800C654C 9242001B */  lbu        $v0, 0x1b($s2)
/* C7150 800C6550 24060007 */  addiu      $a2, $zero, 7
/* C7154 800C6554 AE22004C */  sw         $v0, 0x4c($s1)
/* C7158 800C6558 9243001A */  lbu        $v1, 0x1a($s2)
/* C715C 800C655C 2627002C */  addiu      $a3, $s1, 0x2c
/* C7160 800C6560 24020010 */  addiu      $v0, $zero, 0x10
/* C7164 800C6564 AE220050 */  sw         $v0, 0x50($s1)
/* C7168 800C6568 24020008 */  addiu      $v0, $zero, 8
/* C716C 800C656C AE220054 */  sw         $v0, 0x54($s1)
/* C7170 800C6570 A2230064 */  sb         $v1, 0x64($s1)
/* C7174 800C6574 92220064 */  lbu        $v0, 0x64($s1)
/* C7178 800C6578 00031840 */  sll        $v1, $v1, 1
/* C717C 800C657C 24630003 */  addiu      $v1, $v1, 3
/* C7180 800C6580 AE230060 */  sw         $v1, 0x60($s1)
/* C7184 800C6584 92230064 */  lbu        $v1, 0x64($s1)
/* C7188 800C6588 24420001 */  addiu      $v0, $v0, 1
/* C718C 800C658C 000210C0 */  sll        $v0, $v0, 3
/* C7190 800C6590 000318C0 */  sll        $v1, $v1, 3
/* C7194 800C6594 AE220058 */  sw         $v0, 0x58($s1)
/* C7198 800C6598 00431021 */  addu       $v0, $v0, $v1
/* C719C 800C659C 0C0309EC */  jal        __osContRamRead
/* C71A0 800C65A0 AE22005C */   sw        $v0, 0x5c($s1)
/* C71A4 800C65A4 00408021 */  addu       $s0, $v0, $zero
/* C71A8 800C65A8 16000008 */  bnez       $s0, .L800C65CC
/* C71AC 800C65AC 02001021 */   addu      $v0, $s0, $zero
/* C71B0 800C65B0 0C0319B0 */  jal        osPfsChecker
/* C71B4 800C65B4 02202021 */   addu      $a0, $s1, $zero
/* C71B8 800C65B8 8E230000 */  lw         $v1, ($s1)
/* C71BC 800C65BC 34630001 */  ori        $v1, $v1, 1
/* C71C0 800C65C0 08031973 */  j          .L800C65CC
/* C71C4 800C65C4 AE230000 */   sw        $v1, ($s1)
.L800C65C8:
/* C71C8 800C65C8 02001021 */  addu       $v0, $s0, $zero
.L800C65CC:
/* C71CC 800C65CC 8FBF0068 */  lw         $ra, 0x68($sp)
/* C71D0 800C65D0 8FB30064 */  lw         $s3, 0x64($sp)
/* C71D4 800C65D4 8FB20060 */  lw         $s2, 0x60($sp)
/* C71D8 800C65D8 8FB1005C */  lw         $s1, 0x5c($sp)
/* C71DC 800C65DC 8FB00058 */  lw         $s0, 0x58($sp)
/* C71E0 800C65E0 03E00008 */  jr         $ra
/* C71E4 800C65E4 27BD0070 */   addiu     $sp, $sp, 0x70

glabel __osPfsCheckRamArea
/* C71E8 800C65E8 27BDFF78 */  addiu      $sp, $sp, -0x88
/* C71EC 800C65EC AFB00078 */  sw         $s0, 0x78($sp)
/* C71F0 800C65F0 00808021 */  addu       $s0, $a0, $zero
/* C71F4 800C65F4 00002821 */  addu       $a1, $zero, $zero
/* C71F8 800C65F8 AFBF0080 */  sw         $ra, 0x80($sp)
/* C71FC 800C65FC 0C031DC8 */  jal        __osPfsSelectBank
/* C7200 800C6600 AFB1007C */   sw        $s1, 0x7c($sp)
/* C7204 800C6604 14400026 */  bnez       $v0, .L800C66A0
/* C7208 800C6608 00003021 */   addu      $a2, $zero, $zero
/* C720C 800C660C 8E040004 */  lw         $a0, 4($s0)
/* C7210 800C6610 8E050008 */  lw         $a1, 8($s0)
/* C7214 800C6614 0C0309EC */  jal        __osContRamRead
/* C7218 800C6618 27A70058 */   addiu     $a3, $sp, 0x58
/* C721C 800C661C 14400020 */  bnez       $v0, .L800C66A0
/* C7220 800C6620 27A30037 */   addiu     $v1, $sp, 0x37
/* C7224 800C6624 2402001F */  addiu      $v0, $zero, 0x1f
.L800C6628:
/* C7228 800C6628 A0620000 */  sb         $v0, ($v1)
/* C722C 800C662C 2442FFFF */  addiu      $v0, $v0, -1
/* C7230 800C6630 0441FFFD */  bgez       $v0, .L800C6628
/* C7234 800C6634 2463FFFF */   addiu     $v1, $v1, -1
/* C7238 800C6638 AFA00010 */  sw         $zero, 0x10($sp)
/* C723C 800C663C 8E040004 */  lw         $a0, 4($s0)
/* C7240 800C6640 8E050008 */  lw         $a1, 8($s0)
/* C7244 800C6644 00003021 */  addu       $a2, $zero, $zero
/* C7248 800C6648 0C030B30 */  jal        __osContRamWrite
/* C724C 800C664C 27A70018 */   addiu     $a3, $sp, 0x18
/* C7250 800C6650 14400013 */  bnez       $v0, .L800C66A0
/* C7254 800C6654 00003021 */   addu      $a2, $zero, $zero
/* C7258 800C6658 8E040004 */  lw         $a0, 4($s0)
/* C725C 800C665C 8E050008 */  lw         $a1, 8($s0)
/* C7260 800C6660 27B10038 */  addiu      $s1, $sp, 0x38
/* C7264 800C6664 0C0309EC */  jal        __osContRamRead
/* C7268 800C6668 02203821 */   addu      $a3, $s1, $zero
/* C726C 800C666C 1440000C */  bnez       $v0, .L800C66A0
/* C7270 800C6670 27A40018 */   addiu     $a0, $sp, 0x18
/* C7274 800C6674 02202821 */  addu       $a1, $s1, $zero
/* C7278 800C6678 0C031700 */  jal        _bcmp
/* C727C 800C667C 24060020 */   addiu     $a2, $zero, 0x20
/* C7280 800C6680 14400007 */  bnez       $v0, .L800C66A0
/* C7284 800C6684 2402000B */   addiu     $v0, $zero, 0xb
/* C7288 800C6688 AFA00010 */  sw         $zero, 0x10($sp)
/* C728C 800C668C 8E040004 */  lw         $a0, 4($s0)
/* C7290 800C6690 8E050008 */  lw         $a1, 8($s0)
/* C7294 800C6694 00003021 */  addu       $a2, $zero, $zero
/* C7298 800C6698 0C030B30 */  jal        __osContRamWrite
/* C729C 800C669C 27A70058 */   addiu     $a3, $sp, 0x58
.L800C66A0:
/* C72A0 800C66A0 8FBF0080 */  lw         $ra, 0x80($sp)
/* C72A4 800C66A4 8FB1007C */  lw         $s1, 0x7c($sp)
/* C72A8 800C66A8 8FB00078 */  lw         $s0, 0x78($sp)
/* C72AC 800C66AC 03E00008 */  jr         $ra
/* C72B0 800C66B0 27BD0088 */   addiu     $sp, $sp, 0x88
/* C72B4 800C66B4 00000000 */  nop
/* C72B8 800C66B8 00000000 */  nop
/* C72BC 800C66BC 00000000 */  nop
