.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel alFxPull
/* D16C0 800D0AC0 27BDFF98 */  addiu      $sp, $sp, -0x68
/* D16C4 800D0AC4 8FAB0078 */  lw         $t3, 0x78($sp)
/* D16C8 800D0AC8 AFB20048 */  sw         $s2, 0x48($sp)
/* D16CC 800D0ACC 00809021 */  addu       $s2, $a0, $zero
/* D16D0 800D0AD0 AFBF0064 */  sw         $ra, 0x64($sp)
/* D16D4 800D0AD4 AFBE0060 */  sw         $fp, 0x60($sp)
/* D16D8 800D0AD8 AFB7005C */  sw         $s7, 0x5c($sp)
/* D16DC 800D0ADC AFB60058 */  sw         $s6, 0x58($sp)
/* D16E0 800D0AE0 AFB50054 */  sw         $s5, 0x54($sp)
/* D16E4 800D0AE4 AFB40050 */  sw         $s4, 0x50($sp)
/* D16E8 800D0AE8 AFB3004C */  sw         $s3, 0x4c($sp)
/* D16EC 800D0AEC AFB10044 */  sw         $s1, 0x44($sp)
/* D16F0 800D0AF0 AFB00040 */  sw         $s0, 0x40($sp)
/* D16F4 800D0AF4 8E440000 */  lw         $a0, ($s2)
/* D16F8 800D0AF8 00C0A021 */  addu       $s4, $a2, $zero
/* D16FC 800D0AFC A7A0001E */  sh         $zero, 0x1e($sp)
/* D1700 800D0B00 AFAB0010 */  sw         $t3, 0x10($sp)
/* D1704 800D0B04 8C820004 */  lw         $v0, 4($a0)
/* D1708 800D0B08 0000B021 */  addu       $s6, $zero, $zero
/* D170C 800D0B0C 0040F809 */  jalr       $v0
/* D1710 800D0B10 24150140 */   addiu     $s5, $zero, 0x140
/* D1714 800D0B14 00405821 */  addu       $t3, $v0, $zero
/* D1718 800D0B18 01603821 */  addu       $a3, $t3, $zero
/* D171C 800D0B1C 256B0008 */  addiu      $t3, $t3, 8
/* D1720 800D0B20 01604021 */  addu       $t0, $t3, $zero
/* D1724 800D0B24 256B0008 */  addiu      $t3, $t3, 8
/* D1728 800D0B28 3C0A0C00 */  lui        $t2, 0xc00
/* D172C 800D0B2C 354ADA83 */  ori        $t2, $t2, 0xda83
/* D1730 800D0B30 3C0906C0 */  lui        $t1, 0x6c0
/* D1734 800D0B34 352906C0 */  ori        $t1, $t1, 0x6c0
/* D1738 800D0B38 01601821 */  addu       $v1, $t3, $zero
/* D173C 800D0B3C 256B0008 */  addiu      $t3, $t3, 8
/* D1740 800D0B40 3C060C00 */  lui        $a2, 0xc00
/* D1744 800D0B44 34C65A82 */  ori        $a2, $a2, 0x5a82
/* D1748 800D0B48 3C050800 */  lui        $a1, 0x800
/* D174C 800D0B4C 34A506C0 */  ori        $a1, $a1, 0x6c0
/* D1750 800D0B50 02402021 */  addu       $a0, $s2, $zero
/* D1754 800D0B54 3C020800 */  lui        $v0, 0x800
/* D1758 800D0B58 00148040 */  sll        $s0, $s4, 1
/* D175C 800D0B5C ACE20000 */  sw         $v0, ($a3)
/* D1760 800D0B60 3202FFFF */  andi       $v0, $s0, 0xffff
/* D1764 800D0B64 ACE20004 */  sw         $v0, 4($a3)
/* D1768 800D0B68 AD0A0000 */  sw         $t2, ($t0)
/* D176C 800D0B6C AD090004 */  sw         $t1, 4($t0)
/* D1770 800D0B70 AC660000 */  sw         $a2, ($v1)
/* D1774 800D0B74 AC650004 */  sw         $a1, 4($v1)
/* D1778 800D0B78 AFAB0010 */  sw         $t3, 0x10($sp)
/* D177C 800D0B7C 8E450018 */  lw         $a1, 0x18($s2)
/* D1780 800D0B80 240606C0 */  addiu      $a2, $zero, 0x6c0
/* D1784 800D0B84 0C0344F0 */  jal        _saveBuffer
/* D1788 800D0B88 02803821 */   addu      $a3, $s4, $zero
/* D178C 800D0B8C 00405821 */  addu       $t3, $v0, $zero
/* D1790 800D0B90 3C030200 */  lui        $v1, 0x200
/* D1794 800D0B94 34630800 */  ori        $v1, $v1, 0x800
/* D1798 800D0B98 AC430000 */  sw         $v1, ($v0)
/* D179C 800D0B9C AC500004 */  sw         $s0, 4($v0)
/* D17A0 800D0BA0 92420024 */  lbu        $v0, 0x24($s2)
/* D17A4 800D0BA4 0000B821 */  addu       $s7, $zero, $zero
/* D17A8 800D0BA8 1840007E */  blez       $v0, .L800D0DA4
/* D17AC 800D0BAC 256B0008 */   addiu     $t3, $t3, 8
.L800D0BB0:
/* D17B0 800D0BB0 97AC001E */  lhu        $t4, 0x1e($sp)
/* D17B4 800D0BB4 8E440020 */  lw         $a0, 0x20($s2)
/* D17B8 800D0BB8 000C1C00 */  sll        $v1, $t4, 0x10
/* D17BC 800D0BBC 00031C03 */  sra        $v1, $v1, 0x10
/* D17C0 800D0BC0 00031080 */  sll        $v0, $v1, 2
/* D17C4 800D0BC4 00431021 */  addu       $v0, $v0, $v1
/* D17C8 800D0BC8 000210C0 */  sll        $v0, $v0, 3
/* D17CC 800D0BCC 00828821 */  addu       $s1, $a0, $v0
/* D17D0 800D0BD0 8E220000 */  lw         $v0, ($s1)
/* D17D4 800D0BD4 8E440018 */  lw         $a0, 0x18($s2)
/* D17D8 800D0BD8 8E230004 */  lw         $v1, 4($s1)
/* D17DC 800D0BDC 00021040 */  sll        $v0, $v0, 1
/* D17E0 800D0BE0 00829823 */  subu       $s3, $a0, $v0
/* D17E4 800D0BE4 00031840 */  sll        $v1, $v1, 1
/* D17E8 800D0BE8 16770005 */  bne        $s3, $s7, .L800D0C00
/* D17EC 800D0BEC 0083F023 */   subu      $fp, $a0, $v1
/* D17F0 800D0BF0 02A01021 */  addu       $v0, $s5, $zero
/* D17F4 800D0BF4 02C0A821 */  addu       $s5, $s6, $zero
/* D17F8 800D0BF8 08034308 */  j          .L800D0C20
/* D17FC 800D0BFC 0040B021 */   addu      $s6, $v0, $zero
.L800D0C00:
/* D1800 800D0C00 AFAB0010 */  sw         $t3, 0x10($sp)
/* D1804 800D0C04 02402021 */  addu       $a0, $s2, $zero
/* D1808 800D0C08 02602821 */  addu       $a1, $s3, $zero
/* D180C 800D0C0C 00163400 */  sll        $a2, $s6, 0x10
/* D1810 800D0C10 00063403 */  sra        $a2, $a2, 0x10
/* D1814 800D0C14 0C034494 */  jal        _loadBuffer
/* D1818 800D0C18 02803821 */   addu      $a3, $s4, $zero
/* D181C 800D0C1C 00405821 */  addu       $t3, $v0, $zero
.L800D0C20:
/* D1820 800D0C20 02402021 */  addu       $a0, $s2, $zero
/* D1824 800D0C24 02202821 */  addu       $a1, $s1, $zero
/* D1828 800D0C28 00151400 */  sll        $v0, $s5, 0x10
/* D182C 800D0C2C 00028403 */  sra        $s0, $v0, 0x10
/* D1830 800D0C30 02003021 */  addu       $a2, $s0, $zero
/* D1834 800D0C34 02803821 */  addu       $a3, $s4, $zero
/* D1838 800D0C38 0C03440E */  jal        _loadOutputBuffer
/* D183C 800D0C3C AFAB0010 */   sw        $t3, 0x10($sp)
/* D1840 800D0C40 86230008 */  lh         $v1, 8($s1)
/* D1844 800D0C44 00405821 */  addu       $t3, $v0, $zero
/* D1848 800D0C48 10600016 */  beqz       $v1, .L800D0CA4
/* D184C 800D0C4C 00601021 */   addu      $v0, $v1, $zero
/* D1850 800D0C50 01602021 */  addu       $a0, $t3, $zero
/* D1854 800D0C54 3042FFFF */  andi       $v0, $v0, 0xffff
/* D1858 800D0C58 3C0C0C00 */  lui        $t4, 0xc00
/* D185C 800D0C5C 004C1025 */  or         $v0, $v0, $t4
/* D1860 800D0C60 AC820000 */  sw         $v0, ($a0)
/* D1864 800D0C64 00161400 */  sll        $v0, $s6, 0x10
/* D1868 800D0C68 3203FFFF */  andi       $v1, $s0, 0xffff
/* D186C 800D0C6C 00431025 */  or         $v0, $v0, $v1
/* D1870 800D0C70 AC820004 */  sw         $v0, 4($a0)
/* D1874 800D0C74 8E220024 */  lw         $v0, 0x24($s1)
/* D1878 800D0C78 1440000A */  bnez       $v0, .L800D0CA4
/* D187C 800D0C7C 256B0008 */   addiu     $t3, $t3, 8
/* D1880 800D0C80 8E220020 */  lw         $v0, 0x20($s1)
/* D1884 800D0C84 14400007 */  bnez       $v0, .L800D0CA4
/* D1888 800D0C88 02402021 */   addu      $a0, $s2, $zero
/* D188C 800D0C8C AFAB0010 */  sw         $t3, 0x10($sp)
/* D1890 800D0C90 03C02821 */  addu       $a1, $fp, $zero
/* D1894 800D0C94 02003021 */  addu       $a2, $s0, $zero
/* D1898 800D0C98 0C0344F0 */  jal        _saveBuffer
/* D189C 800D0C9C 02803821 */   addu      $a3, $s4, $zero
/* D18A0 800D0CA0 00405821 */  addu       $t3, $v0, $zero
.L800D0CA4:
/* D18A4 800D0CA4 8622000A */  lh         $v0, 0xa($s1)
/* D18A8 800D0CA8 10400013 */  beqz       $v0, .L800D0CF8
/* D18AC 800D0CAC 00401821 */   addu      $v1, $v0, $zero
/* D18B0 800D0CB0 01604021 */  addu       $t0, $t3, $zero
/* D18B4 800D0CB4 256B0008 */  addiu      $t3, $t3, 8
/* D18B8 800D0CB8 02402021 */  addu       $a0, $s2, $zero
/* D18BC 800D0CBC 02602821 */  addu       $a1, $s3, $zero
/* D18C0 800D0CC0 00163400 */  sll        $a2, $s6, 0x10
/* D18C4 800D0CC4 00063403 */  sra        $a2, $a2, 0x10
/* D18C8 800D0CC8 02803821 */  addu       $a3, $s4, $zero
/* D18CC 800D0CCC 3062FFFF */  andi       $v0, $v1, 0xffff
/* D18D0 800D0CD0 3C0C0C00 */  lui        $t4, 0xc00
/* D18D4 800D0CD4 004C1025 */  or         $v0, $v0, $t4
/* D18D8 800D0CD8 AD020000 */  sw         $v0, ($t0)
/* D18DC 800D0CDC 00151400 */  sll        $v0, $s5, 0x10
/* D18E0 800D0CE0 30C3FFFF */  andi       $v1, $a2, 0xffff
/* D18E4 800D0CE4 00431025 */  or         $v0, $v0, $v1
/* D18E8 800D0CE8 AD020004 */  sw         $v0, 4($t0)
/* D18EC 800D0CEC 0C0344F0 */  jal        _saveBuffer
/* D18F0 800D0CF0 AFAB0010 */   sw        $t3, 0x10($sp)
/* D18F4 800D0CF4 00405821 */  addu       $t3, $v0, $zero
.L800D0CF8:
/* D18F8 800D0CF8 8E240020 */  lw         $a0, 0x20($s1)
/* D18FC 800D0CFC 10800006 */  beqz       $a0, .L800D0D18
/* D1900 800D0D00 00152C00 */   sll       $a1, $s5, 0x10
/* D1904 800D0D04 00052C03 */  sra        $a1, $a1, 0x10
/* D1908 800D0D08 02803021 */  addu       $a2, $s4, $zero
/* D190C 800D0D0C 0C03454C */  jal        _filterBuffer
/* D1910 800D0D10 01603821 */   addu      $a3, $t3, $zero
/* D1914 800D0D14 00405821 */  addu       $t3, $v0, $zero
.L800D0D18:
/* D1918 800D0D18 8E220024 */  lw         $v0, 0x24($s1)
/* D191C 800D0D1C 14400008 */  bnez       $v0, .L800D0D40
/* D1920 800D0D20 02402021 */   addu      $a0, $s2, $zero
/* D1924 800D0D24 AFAB0010 */  sw         $t3, 0x10($sp)
/* D1928 800D0D28 03C02821 */  addu       $a1, $fp, $zero
/* D192C 800D0D2C 00153400 */  sll        $a2, $s5, 0x10
/* D1930 800D0D30 00063403 */  sra        $a2, $a2, 0x10
/* D1934 800D0D34 0C0344F0 */  jal        _saveBuffer
/* D1938 800D0D38 02803821 */   addu      $a3, $s4, $zero
/* D193C 800D0D3C 00405821 */  addu       $t3, $v0, $zero
.L800D0D40:
/* D1940 800D0D40 8622000C */  lh         $v0, 0xc($s1)
/* D1944 800D0D44 1040000A */  beqz       $v0, .L800D0D70
/* D1948 800D0D48 00401821 */   addu      $v1, $v0, $zero
/* D194C 800D0D4C 01601021 */  addu       $v0, $t3, $zero
/* D1950 800D0D50 256B0008 */  addiu      $t3, $t3, 8
/* D1954 800D0D54 3063FFFF */  andi       $v1, $v1, 0xffff
/* D1958 800D0D58 3C0C0C00 */  lui        $t4, 0xc00
/* D195C 800D0D5C 006C1825 */  or         $v1, $v1, $t4
/* D1960 800D0D60 AC430000 */  sw         $v1, ($v0)
/* D1964 800D0D64 00151C00 */  sll        $v1, $s5, 0x10
/* D1968 800D0D68 34630800 */  ori        $v1, $v1, 0x800
/* D196C 800D0D6C AC430004 */  sw         $v1, 4($v0)
.L800D0D70:
/* D1970 800D0D70 97AC001E */  lhu        $t4, 0x1e($sp)
/* D1974 800D0D74 8E230004 */  lw         $v1, 4($s1)
/* D1978 800D0D78 8E440018 */  lw         $a0, 0x18($s2)
/* D197C 800D0D7C 25820001 */  addiu      $v0, $t4, 1
/* D1980 800D0D80 00031840 */  sll        $v1, $v1, 1
/* D1984 800D0D84 0083B821 */  addu       $s7, $a0, $v1
/* D1988 800D0D88 A7A2001E */  sh         $v0, 0x1e($sp)
/* D198C 800D0D8C 92430024 */  lbu        $v1, 0x24($s2)
/* D1990 800D0D90 00021400 */  sll        $v0, $v0, 0x10
/* D1994 800D0D94 00021403 */  sra        $v0, $v0, 0x10
/* D1998 800D0D98 0043102A */  slt        $v0, $v0, $v1
/* D199C 800D0D9C 1440FF84 */  bnez       $v0, .L800D0BB0
/* D19A0 800D0DA0 00000000 */   nop
.L800D0DA4:
/* D19A4 800D0DA4 8E420018 */  lw         $v0, 0x18($s2)
/* D19A8 800D0DA8 8E44001C */  lw         $a0, 0x1c($s2)
/* D19AC 800D0DAC 8E430014 */  lw         $v1, 0x14($s2)
/* D19B0 800D0DB0 00143040 */  sll        $a2, $s4, 1
/* D19B4 800D0DB4 00461021 */  addu       $v0, $v0, $a2
/* D19B8 800D0DB8 00042040 */  sll        $a0, $a0, 1
/* D19BC 800D0DBC 00641821 */  addu       $v1, $v1, $a0
/* D19C0 800D0DC0 0062182B */  sltu       $v1, $v1, $v0
/* D19C4 800D0DC4 10600003 */  beqz       $v1, .L800D0DD4
/* D19C8 800D0DC8 AE420018 */   sw        $v0, 0x18($s2)
/* D19CC 800D0DCC 00441023 */  subu       $v0, $v0, $a0
/* D19D0 800D0DD0 AE420018 */  sw         $v0, 0x18($s2)
.L800D0DD4:
/* D19D4 800D0DD4 25620008 */  addiu      $v0, $t3, 8
/* D19D8 800D0DD8 01602821 */  addu       $a1, $t3, $zero
/* D19DC 800D0DDC 240C0800 */  addiu      $t4, $zero, 0x800
/* D19E0 800D0DE0 000C1C00 */  sll        $v1, $t4, 0x10
/* D19E4 800D0DE4 00031C02 */  srl        $v1, $v1, 0x10
/* D19E8 800D0DE8 3C040A00 */  lui        $a0, 0xa00
/* D19EC 800D0DEC 00641825 */  or         $v1, $v1, $a0
/* D19F0 800D0DF0 ACA30000 */  sw         $v1, ($a1)
/* D19F4 800D0DF4 30C3FFFF */  andi       $v1, $a2, 0xffff
/* D19F8 800D0DF8 3C0406C0 */  lui        $a0, 0x6c0
/* D19FC 800D0DFC 00641825 */  or         $v1, $v1, $a0
/* D1A00 800D0E00 ACA30004 */  sw         $v1, 4($a1)
/* D1A04 800D0E04 8FBF0064 */  lw         $ra, 0x64($sp)
/* D1A08 800D0E08 8FBE0060 */  lw         $fp, 0x60($sp)
/* D1A0C 800D0E0C 8FB7005C */  lw         $s7, 0x5c($sp)
/* D1A10 800D0E10 8FB60058 */  lw         $s6, 0x58($sp)
/* D1A14 800D0E14 8FB50054 */  lw         $s5, 0x54($sp)
/* D1A18 800D0E18 8FB40050 */  lw         $s4, 0x50($sp)
/* D1A1C 800D0E1C 8FB3004C */  lw         $s3, 0x4c($sp)
/* D1A20 800D0E20 8FB20048 */  lw         $s2, 0x48($sp)
/* D1A24 800D0E24 8FB10044 */  lw         $s1, 0x44($sp)
/* D1A28 800D0E28 8FB00040 */  lw         $s0, 0x40($sp)
/* D1A2C 800D0E2C 03E00008 */  jr         $ra
/* D1A30 800D0E30 27BD0068 */   addiu     $sp, $sp, 0x68

glabel alFxParam
/* D1A34 800D0E34 24020001 */  addiu      $v0, $zero, 1
/* D1A38 800D0E38 50A20001 */  beql       $a1, $v0, .L800D0E40
/* D1A3C 800D0E3C AC860000 */   sw        $a2, ($a0)
.L800D0E40:
/* D1A40 800D0E40 03E00008 */  jr         $ra
/* D1A44 800D0E44 00001021 */   addu      $v0, $zero, $zero

glabel alFxParamHdl
/* D1A48 800D0E48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D1A4C 800D0E4C AFBF0010 */  sw         $ra, 0x10($sp)
/* D1A50 800D0E50 24A3FFFE */  addiu      $v1, $a1, -2
/* D1A54 800D0E54 04610002 */  bgez       $v1, .L800D0E60
/* D1A58 800D0E58 00601021 */   addu      $v0, $v1, $zero
/* D1A5C 800D0E5C 24A20005 */  addiu      $v0, $a1, 5
.L800D0E60:
/* D1A60 800D0E60 000238C3 */  sra        $a3, $v0, 3
/* D1A64 800D0E64 00E02821 */  addu       $a1, $a3, $zero
/* D1A68 800D0E68 000510C0 */  sll        $v0, $a1, 3
/* D1A6C 800D0E6C 00623823 */  subu       $a3, $v1, $v0
/* D1A70 800D0E70 8CC60000 */  lw         $a2, ($a2)
/* D1A74 800D0E74 2CE20008 */  sltiu      $v0, $a3, 8
/* D1A78 800D0E78 1040006B */  beqz       $v0, .L800D1028
/* D1A7C 800D0E7C 00000000 */   nop
/* D1A80 800D0E80 00071080 */  sll        $v0, $a3, 2
/* D1A84 800D0E84 3C01800E */  lui        $at, %hi(jtbl_800E5760)
/* D1A88 800D0E88 00220821 */  addu       $at, $at, $v0
/* D1A8C 800D0E8C 8C225760 */  lw         $v0, %lo(jtbl_800E5760)($at)
/* D1A90 800D0E90 00400008 */  jr         $v0
/* D1A94 800D0E94 00000000 */   nop
glabel L800D0E98_D1A98
/* D1A98 800D0E98 8C820020 */  lw         $v0, 0x20($a0)
/* D1A9C 800D0E9C 00051880 */  sll        $v1, $a1, 2
/* D1AA0 800D0EA0 00651821 */  addu       $v1, $v1, $a1
/* D1AA4 800D0EA4 000318C0 */  sll        $v1, $v1, 3
/* D1AA8 800D0EA8 00621821 */  addu       $v1, $v1, $v0
/* D1AAC 800D0EAC 2402FFF8 */  addiu      $v0, $zero, -8
/* D1AB0 800D0EB0 00C21024 */  and        $v0, $a2, $v0
/* D1AB4 800D0EB4 0803440A */  j          .L800D1028
/* D1AB8 800D0EB8 AC620000 */   sw        $v0, ($v1)
glabel L800D0EBC_D1ABC
/* D1ABC 800D0EBC 8C820020 */  lw         $v0, 0x20($a0)
/* D1AC0 800D0EC0 00051880 */  sll        $v1, $a1, 2
/* D1AC4 800D0EC4 00651821 */  addu       $v1, $v1, $a1
/* D1AC8 800D0EC8 000318C0 */  sll        $v1, $v1, 3
/* D1ACC 800D0ECC 00621821 */  addu       $v1, $v1, $v0
/* D1AD0 800D0ED0 2402FFF8 */  addiu      $v0, $zero, -8
/* D1AD4 800D0ED4 00C21024 */  and        $v0, $a2, $v0
/* D1AD8 800D0ED8 0803440A */  j          .L800D1028
/* D1ADC 800D0EDC AC620004 */   sw        $v0, 4($v1)
glabel L800D0EE0_D1AE0
/* D1AE0 800D0EE0 8C830020 */  lw         $v1, 0x20($a0)
/* D1AE4 800D0EE4 00051080 */  sll        $v0, $a1, 2
/* D1AE8 800D0EE8 00451021 */  addu       $v0, $v0, $a1
/* D1AEC 800D0EEC 000210C0 */  sll        $v0, $v0, 3
/* D1AF0 800D0EF0 00431021 */  addu       $v0, $v0, $v1
/* D1AF4 800D0EF4 0803440A */  j          .L800D1028
/* D1AF8 800D0EF8 A4460008 */   sh        $a2, 8($v0)
glabel L800D0EFC_D1AFC
/* D1AFC 800D0EFC 8C830020 */  lw         $v1, 0x20($a0)
/* D1B00 800D0F00 00051080 */  sll        $v0, $a1, 2
/* D1B04 800D0F04 00451021 */  addu       $v0, $v0, $a1
/* D1B08 800D0F08 000210C0 */  sll        $v0, $v0, 3
/* D1B0C 800D0F0C 00431021 */  addu       $v0, $v0, $v1
/* D1B10 800D0F10 0803440A */  j          .L800D1028
/* D1B14 800D0F14 A446000A */   sh        $a2, 0xa($v0)
glabel L800D0F18_D1B18
/* D1B18 800D0F18 8C830020 */  lw         $v1, 0x20($a0)
/* D1B1C 800D0F1C 00051080 */  sll        $v0, $a1, 2
/* D1B20 800D0F20 00451021 */  addu       $v0, $v0, $a1
/* D1B24 800D0F24 000210C0 */  sll        $v0, $v0, 3
/* D1B28 800D0F28 00431021 */  addu       $v0, $v0, $v1
/* D1B2C 800D0F2C 0803440A */  j          .L800D1028
/* D1B30 800D0F30 A446000C */   sh        $a2, 0xc($v0)
glabel L800D0F34_D1B34
/* D1B34 800D0F34 3C01447A */  lui        $at, 0x447a
/* D1B38 800D0F38 44811000 */  mtc1       $at, $f2
/* D1B3C 800D0F3C 44860000 */  mtc1       $a2, $f0
/* D1B40 800D0F40 00000000 */  nop
/* D1B44 800D0F44 46800020 */  cvt.s.w    $f0, $f0
/* D1B48 800D0F48 46020003 */  div.s      $f0, $f0, $f2
/* D1B4C 800D0F4C 3C02800F */  lui        $v0, %hi(alGlobals)
/* D1B50 800D0F50 8C4239F0 */  lw         $v0, %lo(alGlobals)($v0)
/* D1B54 800D0F54 46000021 */  cvt.d.s    $f0, $f0
/* D1B58 800D0F58 46200000 */  add.d      $f0, $f0, $f0
/* D1B5C 800D0F5C C4420044 */  lwc1       $f2, 0x44($v0)
/* D1B60 800D0F60 468010A1 */  cvt.d.w    $f2, $f2
/* D1B64 800D0F64 46220003 */  div.d      $f0, $f0, $f2
/* D1B68 800D0F68 8C830020 */  lw         $v1, 0x20($a0)
/* D1B6C 800D0F6C 00051080 */  sll        $v0, $a1, 2
/* D1B70 800D0F70 00451021 */  addu       $v0, $v0, $a1
/* D1B74 800D0F74 000210C0 */  sll        $v0, $v0, 3
/* D1B78 800D0F78 00431021 */  addu       $v0, $v0, $v1
/* D1B7C 800D0F7C 46200020 */  cvt.s.d    $f0, $f0
/* D1B80 800D0F80 0803440A */  j          .L800D1028
/* D1B84 800D0F84 E4400010 */   swc1      $f0, 0x10($v0)
glabel L800D0F88_D1B88
/* D1B88 800D0F88 8C830020 */  lw         $v1, 0x20($a0)
/* D1B8C 800D0F8C 00051080 */  sll        $v0, $a1, 2
/* D1B90 800D0F90 00451021 */  addu       $v0, $v0, $a1
/* D1B94 800D0F94 000210C0 */  sll        $v0, $v0, 3
/* D1B98 800D0F98 3C01800E */  lui        $at, %hi(reverb_rodata_0020)
/* D1B9C 800D0F9C D4225780 */  ldc1       $f2, %lo(reverb_rodata_0020)($at)
/* D1BA0 800D0FA0 44860000 */  mtc1       $a2, $f0
/* D1BA4 800D0FA4 00000000 */  nop
/* D1BA8 800D0FA8 46800020 */  cvt.s.w    $f0, $f0
/* D1BAC 800D0FAC 00432021 */  addu       $a0, $v0, $v1
/* D1BB0 800D0FB0 8C830004 */  lw         $v1, 4($a0)
/* D1BB4 800D0FB4 8C820000 */  lw         $v0, ($a0)
/* D1BB8 800D0FB8 46000021 */  cvt.d.s    $f0, $f0
/* D1BBC 800D0FBC 00621823 */  subu       $v1, $v1, $v0
/* D1BC0 800D0FC0 44832000 */  mtc1       $v1, $f4
/* D1BC4 800D0FC4 00000000 */  nop
/* D1BC8 800D0FC8 46802121 */  cvt.d.w    $f4, $f4
/* D1BCC 800D0FCC 04610004 */  bgez       $v1, .L800D0FE0
/* D1BD0 800D0FD0 46220083 */   div.d     $f2, $f0, $f2
/* D1BD4 800D0FD4 3C01800E */  lui        $at, %hi(reverb_rodata_0028)
/* D1BD8 800D0FD8 D4205788 */  ldc1       $f0, %lo(reverb_rodata_0028)($at)
/* D1BDC 800D0FDC 46202100 */  add.d      $f4, $f4, $f0
.L800D0FE0:
/* D1BE0 800D0FE0 00000000 */  nop
/* D1BE4 800D0FE4 46241002 */  mul.d      $f0, $f2, $f4
/* D1BE8 800D0FE8 46200020 */  cvt.s.d    $f0, $f0
/* D1BEC 800D0FEC 0803440A */  j          .L800D1028
/* D1BF0 800D0FF0 E480001C */   swc1      $f0, 0x1c($a0)
glabel L800D0FF4_D1BF4
/* D1BF4 800D0FF4 8C830020 */  lw         $v1, 0x20($a0)
/* D1BF8 800D0FF8 00051080 */  sll        $v0, $a1, 2
/* D1BFC 800D0FFC 00451021 */  addu       $v0, $v0, $a1
/* D1C00 800D1000 000228C0 */  sll        $a1, $v0, 3
/* D1C04 800D1004 00A31821 */  addu       $v1, $a1, $v1
/* D1C08 800D1008 8C620020 */  lw         $v0, 0x20($v1)
/* D1C0C 800D100C 10400006 */  beqz       $v0, .L800D1028
/* D1C10 800D1010 00000000 */   nop
/* D1C14 800D1014 A4460000 */  sh         $a2, ($v0)
/* D1C18 800D1018 8C820020 */  lw         $v0, 0x20($a0)
/* D1C1C 800D101C 00A21021 */  addu       $v0, $a1, $v0
/* D1C20 800D1020 0C033C68 */  jal        init_lpfilter
/* D1C24 800D1024 8C440020 */   lw        $a0, 0x20($v0)
.L800D1028:
/* D1C28 800D1028 8FBF0010 */  lw         $ra, 0x10($sp)
/* D1C2C 800D102C 00001021 */  addu       $v0, $zero, $zero
/* D1C30 800D1030 03E00008 */  jr         $ra
/* D1C34 800D1034 27BD0018 */   addiu     $sp, $sp, 0x18

glabel _loadOutputBuffer
/* D1C38 800D1038 27BDFFB8 */  addiu      $sp, $sp, -0x48
/* D1C3C 800D103C AFB40028 */  sw         $s4, 0x28($sp)
/* D1C40 800D1040 0080A021 */  addu       $s4, $a0, $zero
/* D1C44 800D1044 AFB20020 */  sw         $s2, 0x20($sp)
/* D1C48 800D1048 00A09021 */  addu       $s2, $a1, $zero
/* D1C4C 800D104C AFB60030 */  sw         $s6, 0x30($sp)
/* D1C50 800D1050 00C0B021 */  addu       $s6, $a2, $zero
/* D1C54 800D1054 AFBF0034 */  sw         $ra, 0x34($sp)
/* D1C58 800D1058 AFB5002C */  sw         $s5, 0x2c($sp)
/* D1C5C 800D105C AFB30024 */  sw         $s3, 0x24($sp)
/* D1C60 800D1060 AFB1001C */  sw         $s1, 0x1c($sp)
/* D1C64 800D1064 AFB00018 */  sw         $s0, 0x18($sp)
/* D1C68 800D1068 F7B60040 */  sdc1       $f22, 0x40($sp)
/* D1C6C 800D106C F7B40038 */  sdc1       $f20, 0x38($sp)
/* D1C70 800D1070 8E420024 */  lw         $v0, 0x24($s2)
/* D1C74 800D1074 8FB30058 */  lw         $s3, 0x58($sp)
/* D1C78 800D1078 1040005E */  beqz       $v0, .L800D11F4
/* D1C7C 800D107C 00E0A821 */   addu      $s5, $a3, $zero
/* D1C80 800D1080 8E500004 */  lw         $s0, 4($s2)
/* D1C84 800D1084 8E420000 */  lw         $v0, ($s2)
/* D1C88 800D1088 02402021 */  addu       $a0, $s2, $zero
/* D1C8C 800D108C 02A02821 */  addu       $a1, $s5, $zero
/* D1C90 800D1090 0C034573 */  jal        _doModFunc
/* D1C94 800D1094 02028023 */   subu      $s0, $s0, $v0
/* D1C98 800D1098 44901000 */  mtc1       $s0, $f2
/* D1C9C 800D109C 00000000 */  nop
/* D1CA0 800D10A0 468010A0 */  cvt.s.w    $f2, $f2
/* D1CA4 800D10A4 46020003 */  div.s      $f0, $f0, $f2
/* D1CA8 800D10A8 3C014700 */  lui        $at, 0x4700
/* D1CAC 800D10AC 4481B000 */  mtc1       $at, $f22
/* D1CB0 800D10B0 00000000 */  nop
/* D1CB4 800D10B4 46160002 */  mul.s      $f0, $f0, $f22
/* D1CB8 800D10B8 4600008D */  trunc.w.s  $f2, $f0
/* D1CBC 800D10BC 44021000 */  mfc1       $v0, $f2
/* D1CC0 800D10C0 00000000 */  nop
/* D1CC4 800D10C4 44820000 */  mtc1       $v0, $f0
/* D1CC8 800D10C8 00000000 */  nop
/* D1CCC 800D10CC 46800020 */  cvt.s.w    $f0, $f0
/* D1CD0 800D10D0 46160003 */  div.s      $f0, $f0, $f22
/* D1CD4 800D10D4 3C01800E */  lui        $at, %hi(reverb_rodata_0030)
/* D1CD8 800D10D8 D4345790 */  ldc1       $f20, %lo(reverb_rodata_0030)($at)
/* D1CDC 800D10DC 46000021 */  cvt.d.s    $f0, $f0
/* D1CE0 800D10E0 4620A501 */  sub.d      $f20, $f20, $f0
/* D1CE4 800D10E4 44951000 */  mtc1       $s5, $f2
/* D1CE8 800D10E8 00000000 */  nop
/* D1CEC 800D10EC 468010A0 */  cvt.s.w    $f2, $f2
/* D1CF0 800D10F0 4620A520 */  cvt.s.d    $f20, $f20
/* D1CF4 800D10F4 4602A082 */  mul.s      $f2, $f20, $f2
/* D1CF8 800D10F8 8E420024 */  lw         $v0, 0x24($s2)
/* D1CFC 800D10FC C4400020 */  lwc1       $f0, 0x20($v0)
/* D1D00 800D1100 46020000 */  add.s      $f0, $f0, $f2
/* D1D04 800D1104 4600008D */  trunc.w.s  $f2, $f0
/* D1D08 800D1108 44111000 */  mfc1       $s1, $f2
/* D1D0C 800D110C 00000000 */  nop
/* D1D10 800D1110 44911000 */  mtc1       $s1, $f2
/* D1D14 800D1114 00000000 */  nop
/* D1D18 800D1118 468010A0 */  cvt.s.w    $f2, $f2
/* D1D1C 800D111C 46020001 */  sub.s      $f0, $f0, $f2
/* D1D20 800D1120 E4400020 */  swc1       $f0, 0x20($v0)
/* D1D24 800D1124 8E420018 */  lw         $v0, 0x18($s2)
/* D1D28 800D1128 8E430004 */  lw         $v1, 4($s2)
/* D1D2C 800D112C 8E850018 */  lw         $a1, 0x18($s4)
/* D1D30 800D1130 02802021 */  addu       $a0, $s4, $zero
/* D1D34 800D1134 24060280 */  addiu      $a2, $zero, 0x280
/* D1D38 800D1138 AFB30010 */  sw         $s3, 0x10($sp)
/* D1D3C 800D113C 00431023 */  subu       $v0, $v0, $v1
/* D1D40 800D1140 00021040 */  sll        $v0, $v0, 1
/* D1D44 800D1144 00A22821 */  addu       $a1, $a1, $v0
/* D1D48 800D1148 30A70007 */  andi       $a3, $a1, 7
/* D1D4C 800D114C 00073843 */  sra        $a3, $a3, 1
/* D1D50 800D1150 00078040 */  sll        $s0, $a3, 1
/* D1D54 800D1154 00B02823 */  subu       $a1, $a1, $s0
/* D1D58 800D1158 0C034494 */  jal        _loadBuffer
/* D1D5C 800D115C 02273821 */   addu      $a3, $s1, $a3
/* D1D60 800D1160 00409821 */  addu       $s3, $v0, $zero
/* D1D64 800D1164 3C020800 */  lui        $v0, 0x800
/* D1D68 800D1168 34420280 */  ori        $v0, $v0, 0x280
/* D1D6C 800D116C 02602021 */  addu       $a0, $s3, $zero
/* D1D70 800D1170 02028025 */  or         $s0, $s0, $v0
/* D1D74 800D1174 00161C00 */  sll        $v1, $s6, 0x10
/* D1D78 800D1178 00151040 */  sll        $v0, $s5, 1
/* D1D7C 800D117C 3042FFFF */  andi       $v0, $v0, 0xffff
/* D1D80 800D1180 00621825 */  or         $v1, $v1, $v0
/* D1D84 800D1184 AC900000 */  sw         $s0, ($a0)
/* D1D88 800D1188 AC830004 */  sw         $v1, 4($a0)
/* D1D8C 800D118C 8E420024 */  lw         $v0, 0x24($s2)
/* D1D90 800D1190 4616A502 */  mul.s      $f20, $f20, $f22
/* D1D94 800D1194 90440027 */  lbu        $a0, 0x27($v0)
/* D1D98 800D1198 26730008 */  addiu      $s3, $s3, 8
/* D1D9C 800D119C 02608021 */  addu       $s0, $s3, $zero
/* D1DA0 800D11A0 00042400 */  sll        $a0, $a0, 0x10
/* D1DA4 800D11A4 4600A00D */  trunc.w.s  $f0, $f20
/* D1DA8 800D11A8 44020000 */  mfc1       $v0, $f0
/* D1DAC 800D11AC 00000000 */  nop
/* D1DB0 800D11B0 3042FFFF */  andi       $v0, $v0, 0xffff
/* D1DB4 800D11B4 3C030500 */  lui        $v1, 0x500
/* D1DB8 800D11B8 00431025 */  or         $v0, $v0, $v1
/* D1DBC 800D11BC 00822025 */  or         $a0, $a0, $v0
/* D1DC0 800D11C0 AE040000 */  sw         $a0, ($s0)
/* D1DC4 800D11C4 8E420024 */  lw         $v0, 0x24($s2)
/* D1DC8 800D11C8 8C440014 */  lw         $a0, 0x14($v0)
/* D1DCC 800D11CC 0C034888 */  jal        osVirtualToPhysical
/* D1DD0 800D11D0 26730008 */   addiu     $s3, $s3, 8
/* D1DD4 800D11D4 AE020004 */  sw         $v0, 4($s0)
/* D1DD8 800D11D8 8E420024 */  lw         $v0, 0x24($s2)
/* D1DDC 800D11DC AC400024 */  sw         $zero, 0x24($v0)
/* D1DE0 800D11E0 8E420018 */  lw         $v0, 0x18($s2)
/* D1DE4 800D11E4 02358823 */  subu       $s1, $s1, $s5
/* D1DE8 800D11E8 00511021 */  addu       $v0, $v0, $s1
/* D1DEC 800D11EC 08034487 */  j          .L800D121C
/* D1DF0 800D11F0 AE420018 */   sw        $v0, 0x18($s2)
.L800D11F4:
/* D1DF4 800D11F4 02802021 */  addu       $a0, $s4, $zero
/* D1DF8 800D11F8 8E450004 */  lw         $a1, 4($s2)
/* D1DFC 800D11FC 8C820018 */  lw         $v0, 0x18($a0)
/* D1E00 800D1200 02C03021 */  addu       $a2, $s6, $zero
/* D1E04 800D1204 02A03821 */  addu       $a3, $s5, $zero
/* D1E08 800D1208 AFB30010 */  sw         $s3, 0x10($sp)
/* D1E0C 800D120C 00052840 */  sll        $a1, $a1, 1
/* D1E10 800D1210 0C034494 */  jal        _loadBuffer
/* D1E14 800D1214 00452823 */   subu      $a1, $v0, $a1
/* D1E18 800D1218 00409821 */  addu       $s3, $v0, $zero
.L800D121C:
/* D1E1C 800D121C 02601021 */  addu       $v0, $s3, $zero
/* D1E20 800D1220 8FBF0034 */  lw         $ra, 0x34($sp)
/* D1E24 800D1224 8FB60030 */  lw         $s6, 0x30($sp)
/* D1E28 800D1228 8FB5002C */  lw         $s5, 0x2c($sp)
/* D1E2C 800D122C 8FB40028 */  lw         $s4, 0x28($sp)
/* D1E30 800D1230 8FB30024 */  lw         $s3, 0x24($sp)
/* D1E34 800D1234 8FB20020 */  lw         $s2, 0x20($sp)
/* D1E38 800D1238 8FB1001C */  lw         $s1, 0x1c($sp)
/* D1E3C 800D123C 8FB00018 */  lw         $s0, 0x18($sp)
/* D1E40 800D1240 D7B60040 */  ldc1       $f22, 0x40($sp)
/* D1E44 800D1244 D7B40038 */  ldc1       $f20, 0x38($sp)
/* D1E48 800D1248 03E00008 */  jr         $ra
/* D1E4C 800D124C 27BD0048 */   addiu     $sp, $sp, 0x48

glabel _loadBuffer
/* D1E50 800D1250 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D1E54 800D1254 AFB50024 */  sw         $s5, 0x24($sp)
/* D1E58 800D1258 8FB50048 */  lw         $s5, 0x48($sp)
/* D1E5C 800D125C AFB7002C */  sw         $s7, 0x2c($sp)
/* D1E60 800D1260 0080B821 */  addu       $s7, $a0, $zero
/* D1E64 800D1264 00A02021 */  addu       $a0, $a1, $zero
/* D1E68 800D1268 AFB60028 */  sw         $s6, 0x28($sp)
/* D1E6C 800D126C 00C0B021 */  addu       $s6, $a2, $zero
/* D1E70 800D1270 AFBE0030 */  sw         $fp, 0x30($sp)
/* D1E74 800D1274 00E0F021 */  addu       $fp, $a3, $zero
/* D1E78 800D1278 AFBF0034 */  sw         $ra, 0x34($sp)
/* D1E7C 800D127C AFB40020 */  sw         $s4, 0x20($sp)
/* D1E80 800D1280 AFB3001C */  sw         $s3, 0x1c($sp)
/* D1E84 800D1284 AFB20018 */  sw         $s2, 0x18($sp)
/* D1E88 800D1288 AFB10014 */  sw         $s1, 0x14($sp)
/* D1E8C 800D128C AFB00010 */  sw         $s0, 0x10($sp)
/* D1E90 800D1290 8EE3001C */  lw         $v1, 0x1c($s7)
/* D1E94 800D1294 8EE20014 */  lw         $v0, 0x14($s7)
/* D1E98 800D1298 00031840 */  sll        $v1, $v1, 1
/* D1E9C 800D129C 00432821 */  addu       $a1, $v0, $v1
/* D1EA0 800D12A0 0082102B */  sltu       $v0, $a0, $v0
/* D1EA4 800D12A4 10400002 */  beqz       $v0, .L800D12B0
/* D1EA8 800D12A8 02A03021 */   addu      $a2, $s5, $zero
/* D1EAC 800D12AC 00832021 */  addu       $a0, $a0, $v1
.L800D12B0:
/* D1EB0 800D12B0 001E3840 */  sll        $a3, $fp, 1
/* D1EB4 800D12B4 00878821 */  addu       $s1, $a0, $a3
/* D1EB8 800D12B8 00B1102B */  sltu       $v0, $a1, $s1
/* D1EBC 800D12BC 10400020 */  beqz       $v0, .L800D1340
/* D1EC0 800D12C0 32C2FFFF */   andi      $v0, $s6, 0xffff
/* D1EC4 800D12C4 26B50008 */  addiu      $s5, $s5, 8
/* D1EC8 800D12C8 02A0A021 */  addu       $s4, $s5, $zero
/* D1ECC 800D12CC 26B50008 */  addiu      $s5, $s5, 8
/* D1ED0 800D12D0 3C130800 */  lui        $s3, 0x800
/* D1ED4 800D12D4 00531025 */  or         $v0, $v0, $s3
/* D1ED8 800D12D8 00A48023 */  subu       $s0, $a1, $a0
/* D1EDC 800D12DC 00108043 */  sra        $s0, $s0, 1
/* D1EE0 800D12E0 00108040 */  sll        $s0, $s0, 1
/* D1EE4 800D12E4 ACC20000 */  sw         $v0, ($a2)
/* D1EE8 800D12E8 3202FFFF */  andi       $v0, $s0, 0xffff
/* D1EEC 800D12EC 3C120400 */  lui        $s2, 0x400
/* D1EF0 800D12F0 02258823 */  subu       $s1, $s1, $a1
/* D1EF4 800D12F4 00118843 */  sra        $s1, $s1, 1
/* D1EF8 800D12F8 ACC20004 */  sw         $v0, 4($a2)
/* D1EFC 800D12FC 0C034888 */  jal        osVirtualToPhysical
/* D1F00 800D1300 AE920000 */   sw        $s2, ($s4)
/* D1F04 800D1304 02A01821 */  addu       $v1, $s5, $zero
/* D1F08 800D1308 26B50008 */  addiu      $s5, $s5, 8
/* D1F0C 800D130C 02D08021 */  addu       $s0, $s6, $s0
/* D1F10 800D1310 3210FFFF */  andi       $s0, $s0, 0xffff
/* D1F14 800D1314 02138025 */  or         $s0, $s0, $s3
/* D1F18 800D1318 00118840 */  sll        $s1, $s1, 1
/* D1F1C 800D131C 3231FFFF */  andi       $s1, $s1, 0xffff
/* D1F20 800D1320 AE820004 */  sw         $v0, 4($s4)
/* D1F24 800D1324 AC700000 */  sw         $s0, ($v1)
/* D1F28 800D1328 02A08021 */  addu       $s0, $s5, $zero
/* D1F2C 800D132C AC710004 */  sw         $s1, 4($v1)
/* D1F30 800D1330 AE120000 */  sw         $s2, ($s0)
/* D1F34 800D1334 8EE40014 */  lw         $a0, 0x14($s7)
/* D1F38 800D1338 080344DA */  j          .L800D1368
/* D1F3C 800D133C 26B50008 */   addiu     $s5, $s5, 8
.L800D1340:
/* D1F40 800D1340 26B50008 */  addiu      $s5, $s5, 8
/* D1F44 800D1344 02A08021 */  addu       $s0, $s5, $zero
/* D1F48 800D1348 26B50008 */  addiu      $s5, $s5, 8
/* D1F4C 800D134C 3C030800 */  lui        $v1, 0x800
/* D1F50 800D1350 00431025 */  or         $v0, $v0, $v1
/* D1F54 800D1354 ACC20000 */  sw         $v0, ($a2)
/* D1F58 800D1358 30E2FFFF */  andi       $v0, $a3, 0xffff
/* D1F5C 800D135C ACC20004 */  sw         $v0, 4($a2)
/* D1F60 800D1360 3C020400 */  lui        $v0, 0x400
/* D1F64 800D1364 AE020000 */  sw         $v0, ($s0)
.L800D1368:
/* D1F68 800D1368 0C034888 */  jal        osVirtualToPhysical
/* D1F6C 800D136C 00000000 */   nop
/* D1F70 800D1370 AE020004 */  sw         $v0, 4($s0)
/* D1F74 800D1374 26A20008 */  addiu      $v0, $s5, 8
/* D1F78 800D1378 02A02021 */  addu       $a0, $s5, $zero
/* D1F7C 800D137C 3C030800 */  lui        $v1, 0x800
/* D1F80 800D1380 AC830000 */  sw         $v1, ($a0)
/* D1F84 800D1384 001E1840 */  sll        $v1, $fp, 1
/* D1F88 800D1388 3063FFFF */  andi       $v1, $v1, 0xffff
/* D1F8C 800D138C AC830004 */  sw         $v1, 4($a0)
/* D1F90 800D1390 8FBF0034 */  lw         $ra, 0x34($sp)
/* D1F94 800D1394 8FBE0030 */  lw         $fp, 0x30($sp)
/* D1F98 800D1398 8FB7002C */  lw         $s7, 0x2c($sp)
/* D1F9C 800D139C 8FB60028 */  lw         $s6, 0x28($sp)
/* D1FA0 800D13A0 8FB50024 */  lw         $s5, 0x24($sp)
/* D1FA4 800D13A4 8FB40020 */  lw         $s4, 0x20($sp)
/* D1FA8 800D13A8 8FB3001C */  lw         $s3, 0x1c($sp)
/* D1FAC 800D13AC 8FB20018 */  lw         $s2, 0x18($sp)
/* D1FB0 800D13B0 8FB10014 */  lw         $s1, 0x14($sp)
/* D1FB4 800D13B4 8FB00010 */  lw         $s0, 0x10($sp)
/* D1FB8 800D13B8 03E00008 */  jr         $ra
/* D1FBC 800D13BC 27BD0038 */   addiu     $sp, $sp, 0x38

glabel _saveBuffer
/* D1FC0 800D13C0 27BDFFC8 */  addiu      $sp, $sp, -0x38
/* D1FC4 800D13C4 AFB50024 */  sw         $s5, 0x24($sp)
/* D1FC8 800D13C8 8FB50048 */  lw         $s5, 0x48($sp)
/* D1FCC 800D13CC AFB7002C */  sw         $s7, 0x2c($sp)
/* D1FD0 800D13D0 0080B821 */  addu       $s7, $a0, $zero
/* D1FD4 800D13D4 00A02021 */  addu       $a0, $a1, $zero
/* D1FD8 800D13D8 AFB60028 */  sw         $s6, 0x28($sp)
/* D1FDC 800D13DC 00C0B021 */  addu       $s6, $a2, $zero
/* D1FE0 800D13E0 AFBF0034 */  sw         $ra, 0x34($sp)
/* D1FE4 800D13E4 AFBE0030 */  sw         $fp, 0x30($sp)
/* D1FE8 800D13E8 AFB40020 */  sw         $s4, 0x20($sp)
/* D1FEC 800D13EC AFB3001C */  sw         $s3, 0x1c($sp)
/* D1FF0 800D13F0 AFB20018 */  sw         $s2, 0x18($sp)
/* D1FF4 800D13F4 AFB10014 */  sw         $s1, 0x14($sp)
/* D1FF8 800D13F8 AFB00010 */  sw         $s0, 0x10($sp)
/* D1FFC 800D13FC 8EE3001C */  lw         $v1, 0x1c($s7)
/* D2000 800D1400 8EE20014 */  lw         $v0, 0x14($s7)
/* D2004 800D1404 00031840 */  sll        $v1, $v1, 1
/* D2008 800D1408 00432821 */  addu       $a1, $v0, $v1
/* D200C 800D140C 0082102B */  sltu       $v0, $a0, $v0
/* D2010 800D1410 10400002 */  beqz       $v0, .L800D141C
/* D2014 800D1414 02A03021 */   addu      $a2, $s5, $zero
/* D2018 800D1418 00832021 */  addu       $a0, $a0, $v1
.L800D141C:
/* D201C 800D141C 0007F040 */  sll        $fp, $a3, 1
/* D2020 800D1420 009E8021 */  addu       $s0, $a0, $fp
/* D2024 800D1424 00B0102B */  sltu       $v0, $a1, $s0
/* D2028 800D1428 10400027 */  beqz       $v0, .L800D14C8
/* D202C 800D142C 3C120800 */   lui       $s2, 0x800
/* D2030 800D1430 26B50008 */  addiu      $s5, $s5, 8
/* D2034 800D1434 02A0A021 */  addu       $s4, $s5, $zero
/* D2038 800D1438 26B50008 */  addiu      $s5, $s5, 8
/* D203C 800D143C 00A48823 */  subu       $s1, $a1, $a0
/* D2040 800D1440 00118843 */  sra        $s1, $s1, 1
/* D2044 800D1444 00161400 */  sll        $v0, $s6, 0x10
/* D2048 800D1448 00118840 */  sll        $s1, $s1, 1
/* D204C 800D144C 3223FFFF */  andi       $v1, $s1, 0xffff
/* D2050 800D1450 00431025 */  or         $v0, $v0, $v1
/* D2054 800D1454 3C130600 */  lui        $s3, 0x600
/* D2058 800D1458 02058023 */  subu       $s0, $s0, $a1
/* D205C 800D145C 00108043 */  sra        $s0, $s0, 1
/* D2060 800D1460 ACD20000 */  sw         $s2, ($a2)
/* D2064 800D1464 ACC20004 */  sw         $v0, 4($a2)
/* D2068 800D1468 0C034888 */  jal        osVirtualToPhysical
/* D206C 800D146C AE930000 */   sw        $s3, ($s4)
/* D2070 800D1470 02A01821 */  addu       $v1, $s5, $zero
/* D2074 800D1474 26B50008 */  addiu      $s5, $s5, 8
/* D2078 800D1478 02D18821 */  addu       $s1, $s6, $s1
/* D207C 800D147C 00118C00 */  sll        $s1, $s1, 0x10
/* D2080 800D1480 00108040 */  sll        $s0, $s0, 1
/* D2084 800D1484 3210FFFF */  andi       $s0, $s0, 0xffff
/* D2088 800D1488 02308825 */  or         $s1, $s1, $s0
/* D208C 800D148C 02A08021 */  addu       $s0, $s5, $zero
/* D2090 800D1490 AE820004 */  sw         $v0, 4($s4)
/* D2094 800D1494 AC720000 */  sw         $s2, ($v1)
/* D2098 800D1498 AC710004 */  sw         $s1, 4($v1)
/* D209C 800D149C AE130000 */  sw         $s3, ($s0)
/* D20A0 800D14A0 8EE40014 */  lw         $a0, 0x14($s7)
/* D20A4 800D14A4 0C034888 */  jal        osVirtualToPhysical
/* D20A8 800D14A8 26B50008 */   addiu     $s5, $s5, 8
/* D20AC 800D14AC 02A01821 */  addu       $v1, $s5, $zero
/* D20B0 800D14B0 26B50008 */  addiu      $s5, $s5, 8
/* D20B4 800D14B4 AE020004 */  sw         $v0, 4($s0)
/* D20B8 800D14B8 33C2FFFF */  andi       $v0, $fp, 0xffff
/* D20BC 800D14BC AC720000 */  sw         $s2, ($v1)
/* D20C0 800D14C0 0803453F */  j          .L800D14FC
/* D20C4 800D14C4 AC620004 */   sw        $v0, 4($v1)
.L800D14C8:
/* D20C8 800D14C8 26B50008 */  addiu      $s5, $s5, 8
/* D20CC 800D14CC 02A08021 */  addu       $s0, $s5, $zero
/* D20D0 800D14D0 26B50008 */  addiu      $s5, $s5, 8
/* D20D4 800D14D4 3C020800 */  lui        $v0, 0x800
/* D20D8 800D14D8 ACC20000 */  sw         $v0, ($a2)
/* D20DC 800D14DC 00161400 */  sll        $v0, $s6, 0x10
/* D20E0 800D14E0 33C3FFFF */  andi       $v1, $fp, 0xffff
/* D20E4 800D14E4 00431025 */  or         $v0, $v0, $v1
/* D20E8 800D14E8 ACC20004 */  sw         $v0, 4($a2)
/* D20EC 800D14EC 3C020600 */  lui        $v0, 0x600
/* D20F0 800D14F0 0C034888 */  jal        osVirtualToPhysical
/* D20F4 800D14F4 AE020000 */   sw        $v0, ($s0)
/* D20F8 800D14F8 AE020004 */  sw         $v0, 4($s0)
.L800D14FC:
/* D20FC 800D14FC 02A01021 */  addu       $v0, $s5, $zero
/* D2100 800D1500 8FBF0034 */  lw         $ra, 0x34($sp)
/* D2104 800D1504 8FBE0030 */  lw         $fp, 0x30($sp)
/* D2108 800D1508 8FB7002C */  lw         $s7, 0x2c($sp)
/* D210C 800D150C 8FB60028 */  lw         $s6, 0x28($sp)
/* D2110 800D1510 8FB50024 */  lw         $s5, 0x24($sp)
/* D2114 800D1514 8FB40020 */  lw         $s4, 0x20($sp)
/* D2118 800D1518 8FB3001C */  lw         $s3, 0x1c($sp)
/* D211C 800D151C 8FB20018 */  lw         $s2, 0x18($sp)
/* D2120 800D1520 8FB10014 */  lw         $s1, 0x14($sp)
/* D2124 800D1524 8FB00010 */  lw         $s0, 0x10($sp)
/* D2128 800D1528 03E00008 */  jr         $ra
/* D212C 800D152C 27BD0038 */   addiu     $sp, $sp, 0x38

glabel _filterBuffer
/* D2130 800D1530 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* D2134 800D1534 AFB10014 */  sw         $s1, 0x14($sp)
/* D2138 800D1538 00808821 */  addu       $s1, $a0, $zero
/* D213C 800D153C 3C030B00 */  lui        $v1, 0xb00
/* D2140 800D1540 34630020 */  ori        $v1, $v1, 0x20
/* D2144 800D1544 26240008 */  addiu      $a0, $s1, 8
/* D2148 800D1548 AFB00010 */  sw         $s0, 0x10($sp)
/* D214C 800D154C 00E08021 */  addu       $s0, $a3, $zero
/* D2150 800D1550 30A5FFFF */  andi       $a1, $a1, 0xffff
/* D2154 800D1554 3C020800 */  lui        $v0, 0x800
/* D2158 800D1558 00A21025 */  or         $v0, $a1, $v0
/* D215C 800D155C 00052C00 */  sll        $a1, $a1, 0x10
/* D2160 800D1560 00063040 */  sll        $a2, $a2, 1
/* D2164 800D1564 30C6FFFF */  andi       $a2, $a2, 0xffff
/* D2168 800D1568 00A62825 */  or         $a1, $a1, $a2
/* D216C 800D156C AFBF0018 */  sw         $ra, 0x18($sp)
/* D2170 800D1570 AE020000 */  sw         $v0, ($s0)
/* D2174 800D1574 AE050004 */  sw         $a1, 4($s0)
/* D2178 800D1578 0C034888 */  jal        osVirtualToPhysical
/* D217C 800D157C AE030008 */   sw        $v1, 8($s0)
/* D2180 800D1580 AE02000C */  sw         $v0, 0xc($s0)
/* D2184 800D1584 9222002F */  lbu        $v0, 0x2f($s1)
/* D2188 800D1588 96230002 */  lhu        $v1, 2($s1)
/* D218C 800D158C 3C040E00 */  lui        $a0, 0xe00
/* D2190 800D1590 00021400 */  sll        $v0, $v0, 0x10
/* D2194 800D1594 00641825 */  or         $v1, $v1, $a0
/* D2198 800D1598 00431025 */  or         $v0, $v0, $v1
/* D219C 800D159C AE020010 */  sw         $v0, 0x10($s0)
/* D21A0 800D15A0 0C034888 */  jal        osVirtualToPhysical
/* D21A4 800D15A4 8E240028 */   lw        $a0, 0x28($s1)
/* D21A8 800D15A8 AE020014 */  sw         $v0, 0x14($s0)
/* D21AC 800D15AC 26100018 */  addiu      $s0, $s0, 0x18
/* D21B0 800D15B0 02001021 */  addu       $v0, $s0, $zero
/* D21B4 800D15B4 AE20002C */  sw         $zero, 0x2c($s1)
/* D21B8 800D15B8 8FBF0018 */  lw         $ra, 0x18($sp)
/* D21BC 800D15BC 8FB10014 */  lw         $s1, 0x14($sp)
/* D21C0 800D15C0 8FB00010 */  lw         $s0, 0x10($sp)
/* D21C4 800D15C4 03E00008 */  jr         $ra
/* D21C8 800D15C8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel _doModFunc
/* D21CC 800D15CC C4800010 */  lwc1       $f0, 0x10($a0)
/* D21D0 800D15D0 44851000 */  mtc1       $a1, $f2
/* D21D4 800D15D4 00000000 */  nop
/* D21D8 800D15D8 468010A0 */  cvt.s.w    $f2, $f2
/* D21DC 800D15DC 46020002 */  mul.s      $f0, $f0, $f2
/* D21E0 800D15E0 C4820014 */  lwc1       $f2, 0x14($a0)
/* D21E4 800D15E4 46001080 */  add.s      $f2, $f2, $f0
/* D21E8 800D15E8 3C01800E */  lui        $at, %hi(reverb_rodata_0038)
/* D21EC 800D15EC D4205798 */  ldc1       $f0, %lo(reverb_rodata_0038)($at)
/* D21F0 800D15F0 46001121 */  cvt.d.s    $f4, $f2
/* D21F4 800D15F4 4624003C */  c.lt.d     $f0, $f4
/* D21F8 800D15F8 00000000 */  nop
/* D21FC 800D15FC 00000000 */  nop
/* D2200 800D1600 45000005 */  bc1f       .L800D1618
/* D2204 800D1604 E4820014 */   swc1      $f2, 0x14($a0)
/* D2208 800D1608 3C01800E */  lui        $at, %hi(reverb_rodata_0040)
/* D220C 800D160C D42057A0 */  ldc1       $f0, %lo(reverb_rodata_0040)($at)
/* D2210 800D1610 46202001 */  sub.d      $f0, $f4, $f0
/* D2214 800D1614 462000A0 */  cvt.s.d    $f2, $f0
.L800D1618:
/* D2218 800D1618 44800000 */  mtc1       $zero, $f0
/* D221C 800D161C 00000000 */  nop
/* D2220 800D1620 4600103C */  c.lt.s     $f2, $f0
/* D2224 800D1624 46001106 */  mov.s      $f4, $f2
/* D2228 800D1628 00000000 */  nop
/* D222C 800D162C 45000002 */  bc1f       .L800D1638
/* D2230 800D1630 E4820014 */   swc1      $f2, 0x14($a0)
/* D2234 800D1634 46001107 */  neg.s      $f4, $f2
.L800D1638:
/* D2238 800D1638 3C01800E */  lui        $at, %hi(reverb_rodata_0048)
/* D223C 800D163C D42057A8 */  ldc1       $f0, %lo(reverb_rodata_0048)($at)
/* D2240 800D1640 460020A1 */  cvt.d.s    $f2, $f4
/* D2244 800D1644 46201081 */  sub.d      $f2, $f2, $f0
/* D2248 800D1648 C480001C */  lwc1       $f0, 0x1c($a0)
/* D224C 800D164C 462010A0 */  cvt.s.d    $f2, $f2
/* D2250 800D1650 03E00008 */  jr         $ra
/* D2254 800D1654 46020002 */   mul.s     $f0, $f0, $f2
/* D2258 800D1658 00000000 */  nop
/* D225C 800D165C 00000000 */  nop
