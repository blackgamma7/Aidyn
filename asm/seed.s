.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel runOnInit
/* 1F140 8001E540 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* 1F144 8001E544 AFBF001C */  sw         $ra, 0x1c($sp)
/* 1F148 8001E548 0C030C68 */  jal        osInitialize
/* 1F14C 8001E54C AFB00018 */   sw        $s0, 0x18($sp)
/* 1F150 8001E550 0C034724 */  jal        osUnmapTLBAll
/* 1F154 8001E554 3C10800F */   lui       $s0, %hi(init_thread)
/* 1F158 8001E558 26109280 */  addiu      $s0, $s0, %lo(init_thread)
/* 1F15C 8001E55C 02002021 */  addu       $a0, $s0, $zero
/* 1F160 8001E560 24020001 */  addiu      $v0, $zero, 1
/* 1F164 8001E564 3C068002 */  lui        $a2, %hi(InitProc)
/* 1F168 8001E568 24050001 */  addiu      $a1, $zero, 1
/* 1F16C 8001E56C 24C6E598 */  addiu      $a2, $a2, %lo(InitProc)
/* 1F170 8001E570 00003821 */  addu       $a3, $zero, $zero
/* 1F174 8001E574 AFB00010 */  sw         $s0, 0x10($sp)
/* 1F178 8001E578 0C02FBB0 */  jal        osCreateThread
/* 1F17C 8001E57C AFA20014 */   sw        $v0, 0x14($sp)
/* 1F180 8001E580 0C0334B8 */  jal        osStartThread
/* 1F184 8001E584 02002021 */   addu      $a0, $s0, $zero
/* 1F188 8001E588 8FBF001C */  lw         $ra, 0x1c($sp)
/* 1F18C 8001E58C 8FB00018 */  lw         $s0, 0x18($sp)
/* 1F190 8001E590 03E00008 */  jr         $ra
/* 1F194 8001E594 27BD0020 */   addiu     $sp, $sp, 0x20

glabel InitProc
/* 1F198 8001E598 27BDFFD8 */  addiu      $sp, $sp, -0x28
/* 1F19C 8001E59C AFB1001C */  sw         $s1, 0x1c($sp)
/* 1F1A0 8001E5A0 3C11800E */  lui        $s1, %hi(gGlobals)
/* 1F1A4 8001E5A4 262468A8 */  addiu      $a0, $s1, %lo(gGlobals)
/* 1F1A8 8001E5A8 00002821 */  addu       $a1, $zero, $zero
/* 1F1AC 8001E5AC 24062278 */  addiu      $a2, $zero, 0x2278
/* 1F1B0 8001E5B0 AFBF0024 */  sw         $ra, 0x24($sp)
/* 1F1B4 8001E5B4 AFB20020 */  sw         $s2, 0x20($sp)
/* 1F1B8 8001E5B8 0C026380 */  jal        Calloc
/* 1F1BC 8001E5BC AFB00018 */   sw        $s0, 0x18($sp)
/* 1F1C0 8001E5C0 3C048000 */  lui        $a0, %hi(crash_handler)
/* 1F1C4 8001E5C4 2484796C */  addiu      $a0, $a0, %lo(crash_handler)
/* 1F1C8 8001E5C8 00002821 */  addu       $a1, $zero, $zero
/* 1F1CC 8001E5CC 24060032 */  addiu      $a2, $zero, 0x32
/* 1F1D0 8001E5D0 0C025EE0 */  jal        crashthread_init
/* 1F1D4 8001E5D4 24070006 */   addiu     $a3, $zero, 6
/* 1F1D8 8001E5D8 3C048000 */  lui        $a0, %hi(romMain)
/* 1F1DC 8001E5DC 24840400 */  addiu      $a0, $a0, %lo(romMain)
/* 1F1E0 8001E5E0 3C058010 */  lui        $a1, %hi(clear_end)
/* 1F1E4 8001E5E4 24A5FA50 */  addiu      $a1, $a1, %lo(clear_end)
/* 1F1E8 8001E5E8 0C002048 */  jal        lookforExpansionPak
/* 1F1EC 8001E5EC 00A42823 */   subu      $a1, $a1, $a0
/* 1F1F0 8001E5F0 3C02800E */  lui        $v0, %hi(D_800E6698)
/* 1F1F4 8001E5F4 24426698 */  addiu      $v0, $v0, %lo(D_800E6698)
/* 1F1F8 8001E5F8 8C440008 */  lw         $a0, 8($v0)
/* 1F1FC 8001E5FC 0C025F4C */  jal        Heap_init
/* 1F200 8001E600 8C450020 */   lw        $a1, 0x20($v0)
/* 1F204 8001E604 24040020 */  addiu      $a0, $zero, 0x20
/* 1F208 8001E608 3C10800E */  lui        $s0, %hi(D_800D97C0)
/* 1F20C 8001E60C 261097C0 */  addiu      $s0, $s0, %lo(D_800D97C0)
/* 1F210 8001E610 02002821 */  addu       $a1, $s0, $zero
/* 1F214 8001E614 0C025F9C */  jal        Malloc
/* 1F218 8001E618 240600AD */   addiu     $a2, $zero, 0xad
/* 1F21C 8001E61C 24040096 */  addiu      $a0, $zero, 0x96
/* 1F220 8001E620 3C03800F */  lui        $v1, %hi(D_800E8F30)
/* 1F224 8001E624 24728F30 */  addiu      $s2, $v1, %lo(D_800E8F30)
/* 1F228 8001E628 26450788 */  addiu      $a1, $s2, 0x788
/* 1F22C 8001E62C 00403021 */  addu       $a2, $v0, $zero
/* 1F230 8001E630 24070008 */  addiu      $a3, $zero, 8
/* 1F234 8001E634 0C031E68 */  jal        osCreatePiManager
/* 1F238 8001E638 AC628F30 */   sw        $v0, -0x70d0($v1)
/* 1F23C 8001E63C 24042000 */  addiu      $a0, $zero, 0x2000
/* 1F240 8001E640 02002821 */  addu       $a1, $s0, $zero
/* 1F244 8001E644 0C025F9C */  jal        Malloc
/* 1F248 8001E648 240600B1 */   addiu     $a2, $zero, 0xb1
/* 1F24C 8001E64C 00402821 */  addu       $a1, $v0, $zero
/* 1F250 8001E650 3C028000 */  lui        $v0, %hi(osTvType)
/* 1F254 8001E654 8C430300 */  lw         $v1, %lo(osTvType)($v0)
/* 1F258 8001E658 24040001 */  addiu      $a0, $zero, 1
/* 1F25C 8001E65C 1064000C */  beq        $v1, $a0, .L8001E690
/* 1F260 8001E660 AE450004 */   sw        $a1, 4($s2)
/* 1F264 8001E664 28620002 */  slti       $v0, $v1, 2
/* 1F268 8001E668 10400005 */  beqz       $v0, .L8001E680
/* 1F26C 8001E66C 24020002 */   addiu     $v0, $zero, 2
/* 1F270 8001E670 10600017 */  beqz       $v1, .L8001E6D0
/* 1F274 8001E674 3C10800F */   lui       $s0, %hi(Sched)
/* 1F278 8001E678 080079BC */  j          .L8001E6F0
/* 1F27C 8001E67C 26109430 */   addiu     $s0, $s0, %lo(Sched)
.L8001E680:
/* 1F280 8001E680 1062000B */  beq        $v1, $v0, .L8001E6B0
/* 1F284 8001E684 3C10800F */   lui       $s0, %hi(Sched)
/* 1F288 8001E688 080079BC */  j          .L8001E6F0
/* 1F28C 8001E68C 26109430 */   addiu     $s0, $s0, %lo(Sched)
.L8001E690:
/* 1F290 8001E690 AFA40010 */  sw         $a0, 0x10($sp)
/* 1F294 8001E694 26440500 */  addiu      $a0, $s2, 0x500
/* 1F298 8001E698 24A52000 */  addiu      $a1, $a1, 0x2000
/* 1F29C 8001E69C 2406000C */  addiu      $a2, $zero, 0xc
/* 1F2A0 8001E6A0 0C032E64 */  jal        osCreateScheduler
/* 1F2A4 8001E6A4 24070002 */   addiu     $a3, $zero, 2
/* 1F2A8 8001E6A8 080079BB */  j          .L8001E6EC
/* 1F2AC 8001E6AC 3C10800F */   lui       $s0, 0x800f
.L8001E6B0:
/* 1F2B0 8001E6B0 AFA40010 */  sw         $a0, 0x10($sp)
/* 1F2B4 8001E6B4 26440500 */  addiu      $a0, $s2, 0x500
/* 1F2B8 8001E6B8 24A52000 */  addiu      $a1, $a1, 0x2000
/* 1F2BC 8001E6BC 2406000C */  addiu      $a2, $zero, 0xc
/* 1F2C0 8001E6C0 0C032E64 */  jal        osCreateScheduler
/* 1F2C4 8001E6C4 2407001E */   addiu     $a3, $zero, 0x1e
/* 1F2C8 8001E6C8 080079BB */  j          .L8001E6EC
/* 1F2CC 8001E6CC 3C10800F */   lui       $s0, 0x800f
.L8001E6D0:
/* 1F2D0 8001E6D0 AFA40010 */  sw         $a0, 0x10($sp)
/* 1F2D4 8001E6D4 26440500 */  addiu      $a0, $s2, 0x500
/* 1F2D8 8001E6D8 24A52000 */  addiu      $a1, $a1, 0x2000
/* 1F2DC 8001E6DC 2406000C */  addiu      $a2, $zero, 0xc
/* 1F2E0 8001E6E0 0C032E64 */  jal        osCreateScheduler
/* 1F2E4 8001E6E4 24070010 */   addiu     $a3, $zero, 0x10
/* 1F2E8 8001E6E8 3C10800F */  lui        $s0, %hi(Sched)
.L8001E6EC:
/* 1F2EC 8001E6EC 26109430 */  addiu      $s0, $s0, %lo(Sched)
.L8001E6F0:
/* 1F2F0 8001E6F0 0C002080 */  jal        initGfx
/* 1F2F4 8001E6F4 02002021 */   addu      $a0, $s0, $zero
/* 1F2F8 8001E6F8 02002021 */  addu       $a0, $s0, $zero
/* 1F2FC 8001E6FC 3405AC44 */  ori        $a1, $zero, 0xac44
/* 1F300 8001E700 2406000B */  addiu      $a2, $zero, 0xb
/* 1F304 8001E704 0C026440 */  jal        audio_thread_init
/* 1F308 8001E708 24070005 */   addiu     $a3, $zero, 5
/* 1F30C 8001E70C 0C026854 */  jal        dcm_init
/* 1F310 8001E710 00000000 */   nop
/* 1F314 8001E714 02002021 */  addu       $a0, $s0, $zero
/* 1F318 8001E718 24050001 */  addiu      $a1, $zero, 1
/* 1F31C 8001E71C 2406000A */  addiu      $a2, $zero, 0xa
/* 1F320 8001E720 0C026B58 */  jal        init_controller_thread
/* 1F324 8001E724 24070004 */   addiu     $a3, $zero, 4
/* 1F328 8001E728 24040009 */  addiu      $a0, $zero, 9
/* 1F32C 8001E72C 0C0271D8 */  jal        init_romcopy_thread
/* 1F330 8001E730 24050003 */   addiu     $a1, $zero, 3
/* 1F334 8001E734 3C04B1FA */  lui        $a0, %hi(borg_listings)
/* 1F338 8001E738 24848790 */  addiu      $a0, $a0, %lo(borg_listings)
/* 1F33C 8001E73C 3C05B00F */  lui        $a1, %hi(borg_files)
/* 1F340 8001E740 0C028922 */  jal        set_borg_mem_things
/* 1F344 8001E744 24A55DA0 */   addiu     $a1, $a1, %lo(borg_files)
/* 1F348 8001E748 0C030C1C */  jal        osGetTime
/* 1F34C 8001E74C 00000000 */   nop
/* 1F350 8001E750 00022180 */  sll        $a0, $v0, 6
/* 1F354 8001E754 00033682 */  srl        $a2, $v1, 0x1a
/* 1F358 8001E758 00862025 */  or         $a0, $a0, $a2
/* 1F35C 8001E75C 24060000 */  addiu      $a2, $zero, 0
/* 1F360 8001E760 24070BB8 */  addiu      $a3, $zero, 0xbb8
/* 1F364 8001E764 0C02F6D8 */  jal        udivdi3
/* 1F368 8001E768 00032980 */   sll       $a1, $v1, 6
/* 1F36C 8001E76C 262468A8 */  addiu      $a0, $s1, 0x68a8
/* 1F370 8001E770 0C027328 */  jal        setRNGSeed
/* 1F374 8001E774 00602821 */   addu      $a1, $v1, $zero
/* 1F378 8001E778 02002021 */  addu       $a0, $s0, $zero
/* 1F37C 8001E77C 24050008 */  addiu      $a1, $zero, 8
/* 1F380 8001E780 0C007B07 */  jal        app_cpp_func
/* 1F384 8001E784 24060002 */   addiu     $a2, $zero, 2
/* 1F388 8001E788 2604FE50 */  addiu      $a0, $s0, -0x1b0
/* 1F38C 8001E78C 0C0331F4 */  jal        osSetThreadPri
/* 1F390 8001E790 00002821 */   addu      $a1, $zero, $zero
.L8001E794:
/* 1F394 8001E794 080079E5 */  j          .L8001E794
/* 1F398 8001E798 00000000 */   nop
/* 1F39C 8001E79C 00000000 */  nop
