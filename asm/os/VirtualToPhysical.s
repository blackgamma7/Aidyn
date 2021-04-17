.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel osVirtualToPhysical
/* D2E20 800D2220 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* D2E24 800D2224 3C031FFF */  lui        $v1, 0x1fff
/* D2E28 800D2228 3463FFFF */  ori        $v1, $v1, 0xffff
/* D2E2C 800D222C 3C028000 */  lui        $v0, 0x8000
/* D2E30 800D2230 00821023 */  subu       $v0, $a0, $v0
/* D2E34 800D2234 0062102B */  sltu       $v0, $v1, $v0
/* D2E38 800D2238 1040000A */  beqz       $v0, .L800D2264
/* D2E3C 800D223C AFBF0010 */   sw        $ra, 0x10($sp)
/* D2E40 800D2240 3C026000 */  lui        $v0, 0x6000
/* D2E44 800D2244 00821021 */  addu       $v0, $a0, $v0
/* D2E48 800D2248 0062102B */  sltu       $v0, $v1, $v0
/* D2E4C 800D224C 10400006 */  beqz       $v0, .L800D2268
/* D2E50 800D2250 00831024 */   and       $v0, $a0, $v1
/* D2E54 800D2254 0C0348A0 */  jal        __osProbeTLB
/* D2E58 800D2258 00000000 */   nop
/* D2E5C 800D225C 0803489A */  j          .L800D2268
/* D2E60 800D2260 00000000 */   nop
.L800D2264:
/* D2E64 800D2264 00831024 */  and        $v0, $a0, $v1
.L800D2268:
/* D2E68 800D2268 8FBF0010 */  lw         $ra, 0x10($sp)
/* D2E6C 800D226C 03E00008 */  jr         $ra
/* D2E70 800D2270 27BD0018 */   addiu     $sp, $sp, 0x18
/* D2E74 800D2274 00000000 */  nop
/* D2E78 800D2278 00000000 */  nop
/* D2E7C 800D227C 00000000 */  nop
