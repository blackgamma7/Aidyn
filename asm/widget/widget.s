.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text, "ax"

glabel widget_init
/* B7FF0 800B73F0 00801021 */  addu       $v0, $a0, $zero
/* B7FF4 800B73F4 3C03800E */  lui        $v1, %hi(widget_methods_base)
/* B7FF8 800B73F8 24633FD0 */  addiu      $v1, $v1, %lo(widget_methods_base)
/* B7FFC 800B73FC AC430078 */  sw         $v1, 0x78($v0)
/* B8000 800B7400 240300FF */  addiu      $v1, $zero, 0xff
/* B8004 800B7404 A0430058 */  sb         $v1, 0x58($v0)
/* B8008 800B7408 A0430059 */  sb         $v1, 0x59($v0)
/* B800C 800B740C A043005A */  sb         $v1, 0x5a($v0)
/* B8010 800B7410 A043005B */  sb         $v1, 0x5b($v0)
/* B8014 800B7414 24030140 */  addiu      $v1, $zero, 0x140
/* B8018 800B7418 240400F0 */  addiu      $a0, $zero, 0xf0
/* B801C 800B741C A4430066 */  sh         $v1, 0x66($v0)
/* B8020 800B7420 24030001 */  addiu      $v1, $zero, 1
/* B8024 800B7424 AC400040 */  sw         $zero, 0x40($v0)
/* B8028 800B7428 A4400072 */  sh         $zero, 0x72($v0)
/* B802C 800B742C A4400074 */  sh         $zero, 0x74($v0)
/* B8030 800B7430 A4400060 */  sh         $zero, 0x60($v0)
/* B8034 800B7434 A4400062 */  sh         $zero, 0x62($v0)
/* B8038 800B7438 AC40006C */  sw         $zero, 0x6c($v0)
/* B803C 800B743C A040005C */  sb         $zero, 0x5c($v0)
/* B8040 800B7440 A440005E */  sh         $zero, 0x5e($v0)
/* B8044 800B7444 A4400068 */  sh         $zero, 0x68($v0)
/* B8048 800B7448 A4400064 */  sh         $zero, 0x64($v0)
/* B804C 800B744C A444006A */  sh         $a0, 0x6a($v0)
/* B8050 800B7450 AC400044 */  sw         $zero, 0x44($v0)
/* B8054 800B7454 AC400048 */  sw         $zero, 0x48($v0)
/* B8058 800B7458 AC40004C */  sw         $zero, 0x4c($v0)
/* B805C 800B745C AC400050 */  sw         $zero, 0x50($v0)
/* B8060 800B7460 AC400054 */  sw         $zero, 0x54($v0)
/* B8064 800B7464 AC400008 */  sw         $zero, 8($v0)
/* B8068 800B7468 AC40000C */  sw         $zero, 0xc($v0)
/* B806C 800B746C AC400010 */  sw         $zero, 0x10($v0)
/* B8070 800B7470 AC400014 */  sw         $zero, 0x14($v0)
/* B8074 800B7474 AC400018 */  sw         $zero, 0x18($v0)
/* B8078 800B7478 AC40001C */  sw         $zero, 0x1c($v0)
/* B807C 800B747C AC400020 */  sw         $zero, 0x20($v0)
/* B8080 800B7480 AC400024 */  sw         $zero, 0x24($v0)
/* B8084 800B7484 AC400028 */  sw         $zero, 0x28($v0)
/* B8088 800B7488 AC40002C */  sw         $zero, 0x2c($v0)
/* B808C 800B748C AC400030 */  sw         $zero, 0x30($v0)
/* B8090 800B7490 AC400034 */  sw         $zero, 0x34($v0)
/* B8094 800B7494 AC400038 */  sw         $zero, 0x38($v0)
/* B8098 800B7498 AC40003C */  sw         $zero, 0x3c($v0)
/* B809C 800B749C A0430070 */  sb         $v1, 0x70($v0)
/* B80A0 800B74A0 AC400000 */  sw         $zero, ($v0)
/* B80A4 800B74A4 03E00008 */  jr         $ra
/* B80A8 800B74A8 AC400004 */   sw        $zero, 4($v0)

glabel free_widget
/* B80AC 800B74AC 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B80B0 800B74B0 AFB10014 */  sw         $s1, 0x14($sp)
/* B80B4 800B74B4 00808821 */  addu       $s1, $a0, $zero
/* B80B8 800B74B8 3C02800E */  lui        $v0, %hi(widget_methods_base)
/* B80BC 800B74BC 24423FD0 */  addiu      $v0, $v0, %lo(widget_methods_base)
/* B80C0 800B74C0 AFB00010 */  sw         $s0, 0x10($sp)
/* B80C4 800B74C4 00A08021 */  addu       $s0, $a1, $zero
/* B80C8 800B74C8 AFBF0018 */  sw         $ra, 0x18($sp)
/* B80CC 800B74CC 0C02DE39 */  jal        clear_widgetlinks
/* B80D0 800B74D0 AE220078 */   sw        $v0, 0x78($s1)
/* B80D4 800B74D4 32100001 */  andi       $s0, $s0, 1
/* B80D8 800B74D8 12000004 */  beqz       $s0, .L800B74EC
/* B80DC 800B74DC 8FBF0018 */   lw        $ra, 0x18($sp)
/* B80E0 800B74E0 0C026262 */  jal        passToFree
/* B80E4 800B74E4 02202021 */   addu      $a0, $s1, $zero
/* B80E8 800B74E8 8FBF0018 */  lw         $ra, 0x18($sp)
.L800B74EC:
/* B80EC 800B74EC 8FB10014 */  lw         $s1, 0x14($sp)
/* B80F0 800B74F0 8FB00010 */  lw         $s0, 0x10($sp)
/* B80F4 800B74F4 03E00008 */  jr         $ra
/* B80F8 800B74F8 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_widget_coords
/* B80FC 800B74FC A4850060 */  sh         $a1, 0x60($a0)
/* B8100 800B7500 03E00008 */  jr         $ra
/* B8104 800B7504 A4860062 */   sh        $a2, 0x62($a0)

glabel set_widgetHeight
/* B8108 800B7508 03E00008 */  jr         $ra
/* B810C 800B750C A4850074 */   sh        $a1, 0x74($a0)

glabel get_widgetHeight
/* B8110 800B7510 03E00008 */  jr         $ra
/* B8114 800B7514 94820074 */   lhu       $v0, 0x74($a0)

glabel set_widgetWidth
/* B8118 800B7518 03E00008 */  jr         $ra
/* B811C 800B751C A4850072 */   sh        $a1, 0x72($a0)

glabel get_widgetWidth
/* B8120 800B7520 03E00008 */  jr         $ra
/* B8124 800B7524 94820072 */   lhu       $v0, 0x72($a0)

glabel set_widget_color
/* B8128 800B7528 8FA20010 */  lw         $v0, 0x10($sp)
/* B812C 800B752C A0850058 */  sb         $a1, 0x58($a0)
/* B8130 800B7530 A0860059 */  sb         $a2, 0x59($a0)
/* B8134 800B7534 A087005A */  sb         $a3, 0x5a($a0)
/* B8138 800B7538 03E00008 */  jr         $ra
/* B813C 800B753C A082005B */   sb        $v0, 0x5b($a0)

glabel widget_replace_borg8
/* B8140 800B7540 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B8144 800B7544 AFB10014 */  sw         $s1, 0x14($sp)
/* B8148 800B7548 00808821 */  addu       $s1, $a0, $zero
/* B814C 800B754C AFB00010 */  sw         $s0, 0x10($sp)
/* B8150 800B7550 00A08021 */  addu       $s0, $a1, $zero
/* B8154 800B7554 AFBF001C */  sw         $ra, 0x1c($sp)
/* B8158 800B7558 AFB20018 */  sw         $s2, 0x18($sp)
/* B815C 800B755C 8E24006C */  lw         $a0, 0x6c($s1)
/* B8160 800B7560 10800003 */  beqz       $a0, .L800B7570
/* B8164 800B7564 00C09021 */   addu      $s2, $a2, $zero
/* B8168 800B7568 0C0299C0 */  jal        borg8_free
/* B816C 800B756C 00000000 */   nop
.L800B7570:
/* B8170 800B7570 12400007 */  beqz       $s2, .L800B7590
/* B8174 800B7574 AE30006C */   sw        $s0, 0x6c($s1)
/* B8178 800B7578 12000006 */  beqz       $s0, .L800B7594
/* B817C 800B757C 8FBF001C */   lw        $ra, 0x1c($sp)
/* B8180 800B7580 9602000A */  lhu        $v0, 0xa($s0)
/* B8184 800B7584 A6220074 */  sh         $v0, 0x74($s1)
/* B8188 800B7588 9603000C */  lhu        $v1, 0xc($s0)
/* B818C 800B758C A6230072 */  sh         $v1, 0x72($s1)
.L800B7590:
/* B8190 800B7590 8FBF001C */  lw         $ra, 0x1c($sp)
.L800B7594:
/* B8194 800B7594 8FB20018 */  lw         $s2, 0x18($sp)
/* B8198 800B7598 8FB10014 */  lw         $s1, 0x14($sp)
/* B819C 800B759C 8FB00010 */  lw         $s0, 0x10($sp)
/* B81A0 800B75A0 03E00008 */  jr         $ra
/* B81A4 800B75A4 27BD0020 */   addiu     $sp, $sp, 0x20

glabel some_widget_setter
/* B81A8 800B75A8 8FA20010 */  lw         $v0, 0x10($sp)
/* B81AC 800B75AC A4850068 */  sh         $a1, 0x68($a0)
/* B81B0 800B75B0 A4860064 */  sh         $a2, 0x64($a0)
/* B81B4 800B75B4 A4870066 */  sh         $a3, 0x66($a0)
/* B81B8 800B75B8 03E00008 */  jr         $ra
/* B81BC 800B75BC A482006A */   sh        $v0, 0x6a($a0)

glabel Ofunc_widget_getter
/* B81C0 800B75C0 84820068 */  lh         $v0, 0x68($a0)
/* B81C4 800B75C4 ACA20000 */  sw         $v0, ($a1)
/* B81C8 800B75C8 84830064 */  lh         $v1, 0x64($a0)
/* B81CC 800B75CC ACC30000 */  sw         $v1, ($a2)
/* B81D0 800B75D0 84820066 */  lh         $v0, 0x66($a0)
/* B81D4 800B75D4 8FA30010 */  lw         $v1, 0x10($sp)
/* B81D8 800B75D8 ACE20000 */  sw         $v0, ($a3)
/* B81DC 800B75DC 8482006A */  lh         $v0, 0x6a($a0)
/* B81E0 800B75E0 03E00008 */  jr         $ra
/* B81E4 800B75E4 AC620000 */   sw        $v0, ($v1)

glabel widget_control
/* B81E8 800B75E8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B81EC 800B75EC 3C09800F */  lui        $t1, 0x800f
/* B81F0 800B75F0 3C08800F */  lui        $t0, %hi(widget_control_dat)
/* B81F4 800B75F4 8D0236FC */  lw         $v0, %lo(widget_control_dat)($t0)
/* B81F8 800B75F8 00803821 */  addu       $a3, $a0, $zero
/* B81FC 800B75FC AFBF0010 */  sw         $ra, 0x10($sp)
/* B8200 800B7600 14400005 */  bnez       $v0, .L800B7618
/* B8204 800B7604 8CA60008 */   lw        $a2, 8($a1)
/* B8208 800B7608 8CA3000C */  lw         $v1, 0xc($a1)
/* B820C 800B760C 24020001 */  addiu      $v0, $zero, 1
/* B8210 800B7610 AD0236FC */  sw         $v0, 0x36fc($t0)
/* B8214 800B7614 AD235700 */  sw         $v1, 0x5700($t1)
.L800B7618:
/* B8218 800B7618 3C02FFF0 */  lui        $v0, 0xfff0
/* B821C 800B761C 8CA5000C */  lw         $a1, 0xc($a1)
/* B8220 800B7620 3442F0F3 */  ori        $v0, $v0, 0xf0f3
/* B8224 800B7624 00A21024 */  and        $v0, $a1, $v0
/* B8228 800B7628 14400010 */  bnez       $v0, .L800B766C
/* B822C 800B762C 3C03800F */   lui       $v1, 0x800f
/* B8230 800B7630 8D225700 */  lw         $v0, 0x5700($t1)
/* B8234 800B7634 1445000B */  bne        $v0, $a1, .L800B7664
/* B8238 800B7638 2402001E */   addiu     $v0, $zero, 0x1e
/* B823C 800B763C 3C03800F */  lui        $v1, %hi(widget_control_timer)
/* B8240 800B7640 90623700 */  lbu        $v0, %lo(widget_control_timer)($v1)
/* B8244 800B7644 2442FFFF */  addiu      $v0, $v0, -1
/* B8248 800B7648 A0623700 */  sb         $v0, 0x3700($v1)
/* B824C 800B764C 304200FF */  andi       $v0, $v0, 0xff
/* B8250 800B7650 1440000A */  bnez       $v0, .L800B767C
/* B8254 800B7654 30C21000 */   andi      $v0, $a2, 0x1000
/* B8258 800B7658 00C53025 */  or         $a2, $a2, $a1
/* B825C 800B765C 0802DD9D */  j          .L800B7674
/* B8260 800B7660 24020005 */   addiu     $v0, $zero, 5
.L800B7664:
/* B8264 800B7664 0802DD9D */  j          .L800B7674
/* B8268 800B7668 AD255700 */   sw        $a1, 0x5700($t1)
.L800B766C:
/* B826C 800B766C 2402001E */  addiu      $v0, $zero, 0x1e
/* B8270 800B7670 AD205700 */  sw         $zero, 0x5700($t1)
.L800B7674:
/* B8274 800B7674 A0623700 */  sb         $v0, 0x3700($v1)
/* B8278 800B7678 30C21000 */  andi       $v0, $a2, 0x1000
.L800B767C:
/* B827C 800B767C 10400005 */  beqz       $v0, .L800B7694
/* B8280 800B7680 30C28000 */   andi      $v0, $a2, 0x8000
/* B8284 800B7684 8CE30078 */  lw         $v1, 0x78($a3)
/* B8288 800B7688 846400A0 */  lh         $a0, 0xa0($v1)
/* B828C 800B768C 0802DE0F */  j          .L800B783C
/* B8290 800B7690 8C6200A4 */   lw        $v0, 0xa4($v1)
.L800B7694:
/* B8294 800B7694 10400005 */  beqz       $v0, .L800B76AC
/* B8298 800B7698 30C24000 */   andi      $v0, $a2, 0x4000
/* B829C 800B769C 8CE30078 */  lw         $v1, 0x78($a3)
/* B82A0 800B76A0 84640078 */  lh         $a0, 0x78($v1)
/* B82A4 800B76A4 0802DE0F */  j          .L800B783C
/* B82A8 800B76A8 8C62007C */   lw        $v0, 0x7c($v1)
.L800B76AC:
/* B82AC 800B76AC 10400005 */  beqz       $v0, .L800B76C4
/* B82B0 800B76B0 30C20800 */   andi      $v0, $a2, 0x800
/* B82B4 800B76B4 8CE30078 */  lw         $v1, 0x78($a3)
/* B82B8 800B76B8 84640080 */  lh         $a0, 0x80($v1)
/* B82BC 800B76BC 0802DE0F */  j          .L800B783C
/* B82C0 800B76C0 8C620084 */   lw        $v0, 0x84($v1)
.L800B76C4:
/* B82C4 800B76C4 10400005 */  beqz       $v0, .L800B76DC
/* B82C8 800B76C8 30C20400 */   andi      $v0, $a2, 0x400
/* B82CC 800B76CC 8CE30078 */  lw         $v1, 0x78($a3)
/* B82D0 800B76D0 84640058 */  lh         $a0, 0x58($v1)
/* B82D4 800B76D4 0802DE0F */  j          .L800B783C
/* B82D8 800B76D8 8C62005C */   lw        $v0, 0x5c($v1)
.L800B76DC:
/* B82DC 800B76DC 10400005 */  beqz       $v0, .L800B76F4
/* B82E0 800B76E0 30C20200 */   andi      $v0, $a2, 0x200
/* B82E4 800B76E4 8CE30078 */  lw         $v1, 0x78($a3)
/* B82E8 800B76E8 84640060 */  lh         $a0, 0x60($v1)
/* B82EC 800B76EC 0802DE0F */  j          .L800B783C
/* B82F0 800B76F0 8C620064 */   lw        $v0, 0x64($v1)
.L800B76F4:
/* B82F4 800B76F4 10400005 */  beqz       $v0, .L800B770C
/* B82F8 800B76F8 30C20100 */   andi      $v0, $a2, 0x100
/* B82FC 800B76FC 8CE30078 */  lw         $v1, 0x78($a3)
/* B8300 800B7700 84640068 */  lh         $a0, 0x68($v1)
/* B8304 800B7704 0802DE0F */  j          .L800B783C
/* B8308 800B7708 8C62006C */   lw        $v0, 0x6c($v1)
.L800B770C:
/* B830C 800B770C 10400005 */  beqz       $v0, .L800B7724
/* B8310 800B7710 3C020008 */   lui       $v0, 8
/* B8314 800B7714 8CE30078 */  lw         $v1, 0x78($a3)
/* B8318 800B7718 84640070 */  lh         $a0, 0x70($v1)
/* B831C 800B771C 0802DE0F */  j          .L800B783C
/* B8320 800B7720 8C620074 */   lw        $v0, 0x74($v1)
.L800B7724:
/* B8324 800B7724 00C21024 */  and        $v0, $a2, $v0
/* B8328 800B7728 10400005 */  beqz       $v0, .L800B7740
/* B832C 800B772C 3C020004 */   lui       $v0, 4
/* B8330 800B7730 8CE30078 */  lw         $v1, 0x78($a3)
/* B8334 800B7734 84640058 */  lh         $a0, 0x58($v1)
/* B8338 800B7738 0802DE0F */  j          .L800B783C
/* B833C 800B773C 8C62005C */   lw        $v0, 0x5c($v1)
.L800B7740:
/* B8340 800B7740 00C21024 */  and        $v0, $a2, $v0
/* B8344 800B7744 10400005 */  beqz       $v0, .L800B775C
/* B8348 800B7748 3C020001 */   lui       $v0, 1
/* B834C 800B774C 8CE30078 */  lw         $v1, 0x78($a3)
/* B8350 800B7750 84640060 */  lh         $a0, 0x60($v1)
/* B8354 800B7754 0802DE0F */  j          .L800B783C
/* B8358 800B7758 8C620064 */   lw        $v0, 0x64($v1)
.L800B775C:
/* B835C 800B775C 00C21024 */  and        $v0, $a2, $v0
/* B8360 800B7760 10400005 */  beqz       $v0, .L800B7778
/* B8364 800B7764 3C020002 */   lui       $v0, 2
/* B8368 800B7768 8CE30078 */  lw         $v1, 0x78($a3)
/* B836C 800B776C 84640068 */  lh         $a0, 0x68($v1)
/* B8370 800B7770 0802DE0F */  j          .L800B783C
/* B8374 800B7774 8C62006C */   lw        $v0, 0x6c($v1)
.L800B7778:
/* B8378 800B7778 00C21024 */  and        $v0, $a2, $v0
/* B837C 800B777C 10400005 */  beqz       $v0, .L800B7794
/* B8380 800B7780 30C22000 */   andi      $v0, $a2, 0x2000
/* B8384 800B7784 8CE30078 */  lw         $v1, 0x78($a3)
/* B8388 800B7788 84640070 */  lh         $a0, 0x70($v1)
/* B838C 800B778C 0802DE0F */  j          .L800B783C
/* B8390 800B7790 8C620074 */   lw        $v0, 0x74($v1)
.L800B7794:
/* B8394 800B7794 10400005 */  beqz       $v0, .L800B77AC
/* B8398 800B7798 30C20020 */   andi      $v0, $a2, 0x20
/* B839C 800B779C 8CE30078 */  lw         $v1, 0x78($a3)
/* B83A0 800B77A0 84640088 */  lh         $a0, 0x88($v1)
/* B83A4 800B77A4 0802DE0F */  j          .L800B783C
/* B83A8 800B77A8 8C62008C */   lw        $v0, 0x8c($v1)
.L800B77AC:
/* B83AC 800B77AC 10400005 */  beqz       $v0, .L800B77C4
/* B83B0 800B77B0 30C20010 */   andi      $v0, $a2, 0x10
/* B83B4 800B77B4 8CE30078 */  lw         $v1, 0x78($a3)
/* B83B8 800B77B8 84640090 */  lh         $a0, 0x90($v1)
/* B83BC 800B77BC 0802DE0F */  j          .L800B783C
/* B83C0 800B77C0 8C620094 */   lw        $v0, 0x94($v1)
.L800B77C4:
/* B83C4 800B77C4 10400005 */  beqz       $v0, .L800B77DC
/* B83C8 800B77C8 30C20008 */   andi      $v0, $a2, 8
/* B83CC 800B77CC 8CE30078 */  lw         $v1, 0x78($a3)
/* B83D0 800B77D0 84640098 */  lh         $a0, 0x98($v1)
/* B83D4 800B77D4 0802DE0F */  j          .L800B783C
/* B83D8 800B77D8 8C62009C */   lw        $v0, 0x9c($v1)
.L800B77DC:
/* B83DC 800B77DC 10400005 */  beqz       $v0, .L800B77F4
/* B83E0 800B77E0 30C20004 */   andi      $v0, $a2, 4
/* B83E4 800B77E4 8CE30078 */  lw         $v1, 0x78($a3)
/* B83E8 800B77E8 846400A8 */  lh         $a0, 0xa8($v1)
/* B83EC 800B77EC 0802DE0F */  j          .L800B783C
/* B83F0 800B77F0 8C6200AC */   lw        $v0, 0xac($v1)
.L800B77F4:
/* B83F4 800B77F4 10400005 */  beqz       $v0, .L800B780C
/* B83F8 800B77F8 30C20002 */   andi      $v0, $a2, 2
/* B83FC 800B77FC 8CE30078 */  lw         $v1, 0x78($a3)
/* B8400 800B7800 846400B0 */  lh         $a0, 0xb0($v1)
/* B8404 800B7804 0802DE0F */  j          .L800B783C
/* B8408 800B7808 8C6200B4 */   lw        $v0, 0xb4($v1)
.L800B780C:
/* B840C 800B780C 10400005 */  beqz       $v0, .L800B7824
/* B8410 800B7810 30C20001 */   andi      $v0, $a2, 1
/* B8414 800B7814 8CE30078 */  lw         $v1, 0x78($a3)
/* B8418 800B7818 846400B8 */  lh         $a0, 0xb8($v1)
/* B841C 800B781C 0802DE0F */  j          .L800B783C
/* B8420 800B7820 8C6200BC */   lw        $v0, 0xbc($v1)
.L800B7824:
/* B8424 800B7824 54400003 */  bnel       $v0, $zero, .L800B7834
/* B8428 800B7828 8CE30078 */   lw        $v1, 0x78($a3)
/* B842C 800B782C 0802DE11 */  j          .L800B7844
/* B8430 800B7830 00001021 */   addu      $v0, $zero, $zero
.L800B7834:
/* B8434 800B7834 846400C0 */  lh         $a0, 0xc0($v1)
/* B8438 800B7838 8C6200C4 */  lw         $v0, 0xc4($v1)
.L800B783C:
/* B843C 800B783C 0040F809 */  jalr       $v0
/* B8440 800B7840 00E42021 */   addu      $a0, $a3, $a0
.L800B7844:
/* B8444 800B7844 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8448 800B7848 03E00008 */  jr         $ra
/* B844C 800B784C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_func_8
/* B8450 800B7850 27BDFFD0 */  addiu      $sp, $sp, -0x30
/* B8454 800B7854 00A01021 */  addu       $v0, $a1, $zero
/* B8458 800B7858 00063400 */  sll        $a2, $a2, 0x10
/* B845C 800B785C AFB40028 */  sw         $s4, 0x28($sp)
/* B8460 800B7860 0006A403 */  sra        $s4, $a2, 0x10
/* B8464 800B7864 00073C00 */  sll        $a3, $a3, 0x10
/* B8468 800B7868 AFB30024 */  sw         $s3, 0x24($sp)
/* B846C 800B786C 00079C03 */  sra        $s3, $a3, 0x10
/* B8470 800B7870 AFBF002C */  sw         $ra, 0x2c($sp)
/* B8474 800B7874 AFB20020 */  sw         $s2, 0x20($sp)
/* B8478 800B7878 AFB1001C */  sw         $s1, 0x1c($sp)
/* B847C 800B787C AFB00018 */  sw         $s0, 0x18($sp)
/* B8480 800B7880 8C900050 */  lw         $s0, 0x50($a0)
/* B8484 800B7884 87B20042 */  lh         $s2, 0x42($sp)
/* B8488 800B7888 1200000E */  beqz       $s0, .L800B78C4
/* B848C 800B788C 87B10046 */   lh        $s1, 0x46($sp)
/* B8490 800B7890 00402821 */  addu       $a1, $v0, $zero
.L800B7894:
/* B8494 800B7894 8E030078 */  lw         $v1, 0x78($s0)
/* B8498 800B7898 02803021 */  addu       $a2, $s4, $zero
/* B849C 800B789C 84640040 */  lh         $a0, 0x40($v1)
/* B84A0 800B78A0 02603821 */  addu       $a3, $s3, $zero
/* B84A4 800B78A4 AFB20010 */  sw         $s2, 0x10($sp)
/* B84A8 800B78A8 AFB10014 */  sw         $s1, 0x14($sp)
/* B84AC 800B78AC 8C620044 */  lw         $v0, 0x44($v1)
/* B84B0 800B78B0 0040F809 */  jalr       $v0
/* B84B4 800B78B4 02042021 */   addu      $a0, $s0, $a0
/* B84B8 800B78B8 8E10004C */  lw         $s0, 0x4c($s0)
/* B84BC 800B78BC 1600FFF5 */  bnez       $s0, .L800B7894
/* B84C0 800B78C0 00402821 */   addu      $a1, $v0, $zero
.L800B78C4:
/* B84C4 800B78C4 8FBF002C */  lw         $ra, 0x2c($sp)
/* B84C8 800B78C8 8FB40028 */  lw         $s4, 0x28($sp)
/* B84CC 800B78CC 8FB30024 */  lw         $s3, 0x24($sp)
/* B84D0 800B78D0 8FB20020 */  lw         $s2, 0x20($sp)
/* B84D4 800B78D4 8FB1001C */  lw         $s1, 0x1c($sp)
/* B84D8 800B78D8 8FB00018 */  lw         $s0, 0x18($sp)
/* B84DC 800B78DC 03E00008 */  jr         $ra
/* B84E0 800B78E0 27BD0030 */   addiu     $sp, $sp, 0x30

glabel clear_widgetlinks
/* B84E4 800B78E4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B84E8 800B78E8 AFB00010 */  sw         $s0, 0x10($sp)
/* B84EC 800B78EC 00808021 */  addu       $s0, $a0, $zero
/* B84F0 800B78F0 AFBF0014 */  sw         $ra, 0x14($sp)
.L800B78F4:
/* B84F4 800B78F4 8E050050 */  lw         $a1, 0x50($s0)
.L800B78F8:
/* B84F8 800B78F8 10A0000D */  beqz       $a1, .L800B7930
/* B84FC 800B78FC 8FBF0014 */   lw        $ra, 0x14($sp)
/* B8500 800B7900 8E020050 */  lw         $v0, 0x50($s0)
/* B8504 800B7904 8C43004C */  lw         $v1, 0x4c($v0)
/* B8508 800B7908 10A0FFFA */  beqz       $a1, .L800B78F4
/* B850C 800B790C AE030050 */   sw        $v1, 0x50($s0)
/* B8510 800B7910 8CA20078 */  lw         $v0, 0x78($a1)
/* B8514 800B7914 84440008 */  lh         $a0, 8($v0)
/* B8518 800B7918 8C43000C */  lw         $v1, 0xc($v0)
/* B851C 800B791C 00A42021 */  addu       $a0, $a1, $a0
/* B8520 800B7920 0060F809 */  jalr       $v1
/* B8524 800B7924 24050003 */   addiu     $a1, $zero, 3
/* B8528 800B7928 0802DE3E */  j          .L800B78F8
/* B852C 800B792C 8E050050 */   lw        $a1, 0x50($s0)
.L800B7930:
/* B8530 800B7930 AE000054 */  sw         $zero, 0x54($s0)
/* B8534 800B7934 AE000050 */  sw         $zero, 0x50($s0)
/* B8538 800B7938 8FB00010 */  lw         $s0, 0x10($sp)
/* B853C 800B793C 03E00008 */  jr         $ra
/* B8540 800B7940 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B7944
/* B8544 800B7944 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8548 800B7948 AFBF0014 */  sw         $ra, 0x14($sp)
/* B854C 800B794C AFB00010 */  sw         $s0, 0x10($sp)
/* B8550 800B7950 8C840050 */  lw         $a0, 0x50($a0)
/* B8554 800B7954 10800009 */  beqz       $a0, .L800B797C
/* B8558 800B7958 00808021 */   addu      $s0, $a0, $zero
/* B855C 800B795C 8E030078 */  lw         $v1, 0x78($s0)
.L800B7960:
/* B8560 800B7960 84640028 */  lh         $a0, 0x28($v1)
/* B8564 800B7964 8C62002C */  lw         $v0, 0x2c($v1)
/* B8568 800B7968 0040F809 */  jalr       $v0
/* B856C 800B796C 02042021 */   addu      $a0, $s0, $a0
/* B8570 800B7970 8E10004C */  lw         $s0, 0x4c($s0)
/* B8574 800B7974 5600FFFA */  bnel       $s0, $zero, .L800B7960
/* B8578 800B7978 8E030078 */   lw        $v1, 0x78($s0)
.L800B797C:
/* B857C 800B797C 00001021 */  addu       $v0, $zero, $zero
/* B8580 800B7980 8FBF0014 */  lw         $ra, 0x14($sp)
/* B8584 800B7984 8FB00010 */  lw         $s0, 0x10($sp)
/* B8588 800B7988 03E00008 */  jr         $ra
/* B858C 800B798C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B7990
/* B8590 800B7990 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8594 800B7994 AFB00010 */  sw         $s0, 0x10($sp)
/* B8598 800B7998 00808021 */  addu       $s0, $a0, $zero
/* B859C 800B799C AFBF0014 */  sw         $ra, 0x14($sp)
/* B85A0 800B79A0 92040070 */  lbu        $a0, 0x70($s0)
/* B85A4 800B79A4 2482FFFF */  addiu      $v0, $a0, -1
/* B85A8 800B79A8 2C420002 */  sltiu      $v0, $v0, 2
/* B85AC 800B79AC 1040000C */  beqz       $v0, .L800B79E0
/* B85B0 800B79B0 00000000 */   nop
/* B85B4 800B79B4 8E030000 */  lw         $v1, ($s0)
/* B85B8 800B79B8 10600007 */  beqz       $v1, .L800B79D8
/* B85BC 800B79BC 24020001 */   addiu     $v0, $zero, 1
/* B85C0 800B79C0 14820006 */  bne        $a0, $v0, .L800B79DC
/* B85C4 800B79C4 24020002 */   addiu     $v0, $zero, 2
/* B85C8 800B79C8 0060F809 */  jalr       $v1
/* B85CC 800B79CC 02002021 */   addu      $a0, $s0, $zero
/* B85D0 800B79D0 0802DE78 */  j          .L800B79E0
/* B85D4 800B79D4 00000000 */   nop
.L800B79D8:
/* B85D8 800B79D8 24020002 */  addiu      $v0, $zero, 2
.L800B79DC:
/* B85DC 800B79DC A2020070 */  sb         $v0, 0x70($s0)
.L800B79E0:
/* B85E0 800B79E0 0C02DE7E */  jal        func_800B79F8
/* B85E4 800B79E4 02002021 */   addu      $a0, $s0, $zero
/* B85E8 800B79E8 8FBF0014 */  lw         $ra, 0x14($sp)
/* B85EC 800B79EC 8FB00010 */  lw         $s0, 0x10($sp)
/* B85F0 800B79F0 03E00008 */  jr         $ra
/* B85F4 800B79F4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B79F8
/* B85F8 800B79F8 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B85FC 800B79FC AFBF001C */  sw         $ra, 0x1c($sp)
/* B8600 800B7A00 AFB20018 */  sw         $s2, 0x18($sp)
/* B8604 800B7A04 AFB10014 */  sw         $s1, 0x14($sp)
/* B8608 800B7A08 AFB00010 */  sw         $s0, 0x10($sp)
/* B860C 800B7A0C 8C830050 */  lw         $v1, 0x50($a0)
/* B8610 800B7A10 1060000A */  beqz       $v1, .L800B7A3C
/* B8614 800B7A14 90910070 */   lbu       $s1, 0x70($a0)
/* B8618 800B7A18 00608021 */  addu       $s0, $v1, $zero
/* B861C 800B7A1C 24120001 */  addiu      $s2, $zero, 1
.L800B7A20:
/* B8620 800B7A20 0C02DE64 */  jal        func_800B7990
/* B8624 800B7A24 02002021 */   addu      $a0, $s0, $zero
/* B8628 800B7A28 50520001 */  beql       $v0, $s2, .L800B7A30
/* B862C 800B7A2C 24110001 */   addiu     $s1, $zero, 1
.L800B7A30:
/* B8630 800B7A30 8E10004C */  lw         $s0, 0x4c($s0)
/* B8634 800B7A34 1600FFFA */  bnez       $s0, .L800B7A20
/* B8638 800B7A38 00000000 */   nop
.L800B7A3C:
/* B863C 800B7A3C 02201021 */  addu       $v0, $s1, $zero
/* B8640 800B7A40 8FBF001C */  lw         $ra, 0x1c($sp)
/* B8644 800B7A44 8FB20018 */  lw         $s2, 0x18($sp)
/* B8648 800B7A48 8FB10014 */  lw         $s1, 0x14($sp)
/* B864C 800B7A4C 8FB00010 */  lw         $s0, 0x10($sp)
/* B8650 800B7A50 03E00008 */  jr         $ra
/* B8654 800B7A54 27BD0020 */   addiu     $sp, $sp, 0x20

glabel func_800B7A58
/* B8658 800B7A58 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B865C 800B7A5C AFB00010 */  sw         $s0, 0x10($sp)
/* B8660 800B7A60 00808021 */  addu       $s0, $a0, $zero
/* B8664 800B7A64 AFBF0014 */  sw         $ra, 0x14($sp)
/* B8668 800B7A68 92040070 */  lbu        $a0, 0x70($s0)
/* B866C 800B7A6C 2482FFFB */  addiu      $v0, $a0, -5
/* B8670 800B7A70 2C420002 */  sltiu      $v0, $v0, 2
/* B8674 800B7A74 1040000C */  beqz       $v0, .L800B7AA8
/* B8678 800B7A78 00000000 */   nop
/* B867C 800B7A7C 8E030004 */  lw         $v1, 4($s0)
/* B8680 800B7A80 10600007 */  beqz       $v1, .L800B7AA0
/* B8684 800B7A84 24020005 */   addiu     $v0, $zero, 5
/* B8688 800B7A88 14820006 */  bne        $a0, $v0, .L800B7AA4
/* B868C 800B7A8C 24020006 */   addiu     $v0, $zero, 6
/* B8690 800B7A90 0060F809 */  jalr       $v1
/* B8694 800B7A94 02002021 */   addu      $a0, $s0, $zero
/* B8698 800B7A98 0802DEAA */  j          .L800B7AA8
/* B869C 800B7A9C 00000000 */   nop
.L800B7AA0:
/* B86A0 800B7AA0 24020006 */  addiu      $v0, $zero, 6
.L800B7AA4:
/* B86A4 800B7AA4 A2020070 */  sb         $v0, 0x70($s0)
.L800B7AA8:
/* B86A8 800B7AA8 0C02DEB0 */  jal        func_800B7AC0
/* B86AC 800B7AAC 02002021 */   addu      $a0, $s0, $zero
/* B86B0 800B7AB0 8FBF0014 */  lw         $ra, 0x14($sp)
/* B86B4 800B7AB4 8FB00010 */  lw         $s0, 0x10($sp)
/* B86B8 800B7AB8 03E00008 */  jr         $ra
/* B86BC 800B7ABC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel func_800B7AC0
/* B86C0 800B7AC0 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B86C4 800B7AC4 AFBF001C */  sw         $ra, 0x1c($sp)
/* B86C8 800B7AC8 AFB20018 */  sw         $s2, 0x18($sp)
/* B86CC 800B7ACC AFB10014 */  sw         $s1, 0x14($sp)
/* B86D0 800B7AD0 AFB00010 */  sw         $s0, 0x10($sp)
/* B86D4 800B7AD4 8C830050 */  lw         $v1, 0x50($a0)
/* B86D8 800B7AD8 1060000A */  beqz       $v1, .L800B7B04
/* B86DC 800B7ADC 90910070 */   lbu       $s1, 0x70($a0)
/* B86E0 800B7AE0 00608021 */  addu       $s0, $v1, $zero
/* B86E4 800B7AE4 24120005 */  addiu      $s2, $zero, 5
.L800B7AE8:
/* B86E8 800B7AE8 0C02DE96 */  jal        func_800B7A58
/* B86EC 800B7AEC 02002021 */   addu      $a0, $s0, $zero
/* B86F0 800B7AF0 50520001 */  beql       $v0, $s2, .L800B7AF8
/* B86F4 800B7AF4 24110005 */   addiu     $s1, $zero, 5
.L800B7AF8:
/* B86F8 800B7AF8 8E10004C */  lw         $s0, 0x4c($s0)
/* B86FC 800B7AFC 1600FFFA */  bnez       $s0, .L800B7AE8
/* B8700 800B7B00 00000000 */   nop
.L800B7B04:
/* B8704 800B7B04 02201021 */  addu       $v0, $s1, $zero
/* B8708 800B7B08 8FBF001C */  lw         $ra, 0x1c($sp)
/* B870C 800B7B0C 8FB20018 */  lw         $s2, 0x18($sp)
/* B8710 800B7B10 8FB10014 */  lw         $s1, 0x14($sp)
/* B8714 800B7B14 8FB00010 */  lw         $s0, 0x10($sp)
/* B8718 800B7B18 03E00008 */  jr         $ra
/* B871C 800B7B1C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel set_widgets_byte0x70
/* B8720 800B7B20 27BDFFE0 */  addiu      $sp, $sp, -0x20
/* B8724 800B7B24 AFBF0018 */  sw         $ra, 0x18($sp)
/* B8728 800B7B28 AFB10014 */  sw         $s1, 0x14($sp)
/* B872C 800B7B2C AFB00010 */  sw         $s0, 0x10($sp)
/* B8730 800B7B30 8C820050 */  lw         $v0, 0x50($a0)
/* B8734 800B7B34 30B100FF */  andi       $s1, $a1, 0xff
/* B8738 800B7B38 10400008 */  beqz       $v0, .L800B7B5C
/* B873C 800B7B3C A0910070 */   sb        $s1, 0x70($a0)
/* B8740 800B7B40 00408021 */  addu       $s0, $v0, $zero
/* B8744 800B7B44 02002021 */  addu       $a0, $s0, $zero
.L800B7B48:
/* B8748 800B7B48 0C02DEC8 */  jal        set_widgets_byte0x70
/* B874C 800B7B4C 02202821 */   addu      $a1, $s1, $zero
/* B8750 800B7B50 8E10004C */  lw         $s0, 0x4c($s0)
/* B8754 800B7B54 1600FFFC */  bnez       $s0, .L800B7B48
/* B8758 800B7B58 02002021 */   addu      $a0, $s0, $zero
.L800B7B5C:
/* B875C 800B7B5C 8FBF0018 */  lw         $ra, 0x18($sp)
/* B8760 800B7B60 8FB10014 */  lw         $s1, 0x14($sp)
/* B8764 800B7B64 8FB00010 */  lw         $s0, 0x10($sp)
/* B8768 800B7B68 03E00008 */  jr         $ra
/* B876C 800B7B6C 27BD0020 */   addiu     $sp, $sp, 0x20

glabel link_widgets
/* B8770 800B7B70 8C820050 */  lw         $v0, 0x50($a0)
/* B8774 800B7B74 54400009 */  bnel       $v0, $zero, .L800B7B9C
/* B8778 800B7B78 8C820054 */   lw        $v0, 0x54($a0)
/* B877C 800B7B7C AC850050 */  sw         $a1, 0x50($a0)
/* B8780 800B7B80 AC850054 */  sw         $a1, 0x54($a0)
/* B8784 800B7B84 ACA40044 */  sw         $a0, 0x44($a1)
/* B8788 800B7B88 8C820050 */  lw         $v0, 0x50($a0)
/* B878C 800B7B8C AC400048 */  sw         $zero, 0x48($v0)
/* B8790 800B7B90 8C830050 */  lw         $v1, 0x50($a0)
/* B8794 800B7B94 0802DEED */  j          .L800B7BB4
/* B8798 800B7B98 AC60004C */   sw        $zero, 0x4c($v1)
.L800B7B9C:
/* B879C 800B7B9C AC45004C */  sw         $a1, 0x4c($v0)
/* B87A0 800B7BA0 8C830054 */  lw         $v1, 0x54($a0)
/* B87A4 800B7BA4 ACA0004C */  sw         $zero, 0x4c($a1)
/* B87A8 800B7BA8 ACA30048 */  sw         $v1, 0x48($a1)
/* B87AC 800B7BAC AC850054 */  sw         $a1, 0x54($a0)
/* B87B0 800B7BB0 ACA40044 */  sw         $a0, 0x44($a1)
.L800B7BB4:
/* B87B4 800B7BB4 03E00008 */  jr         $ra
/* B87B8 800B7BB8 24020001 */   addiu     $v0, $zero, 1

glabel unlink_widgets
/* B87BC 800B7BBC 8C830050 */  lw         $v1, 0x50($a0)
/* B87C0 800B7BC0 1060001E */  beqz       $v1, .L800B7C3C
/* B87C4 800B7BC4 00000000 */   nop
.L800B7BC8:
/* B87C8 800B7BC8 5465001A */  bnel       $v1, $a1, .L800B7C34
/* B87CC 800B7BCC 8C63004C */   lw        $v1, 0x4c($v1)
/* B87D0 800B7BD0 8C820050 */  lw         $v0, 0x50($a0)
/* B87D4 800B7BD4 54430004 */  bnel       $v0, $v1, .L800B7BE8
/* B87D8 800B7BD8 8C820054 */   lw        $v0, 0x54($a0)
/* B87DC 800B7BDC 8C62004C */  lw         $v0, 0x4c($v1)
/* B87E0 800B7BE0 AC820050 */  sw         $v0, 0x50($a0)
/* B87E4 800B7BE4 8C820054 */  lw         $v0, 0x54($a0)
.L800B7BE8:
/* B87E8 800B7BE8 54430004 */  bnel       $v0, $v1, .L800B7BFC
/* B87EC 800B7BEC 8C640048 */   lw        $a0, 0x48($v1)
/* B87F0 800B7BF0 8C620048 */  lw         $v0, 0x48($v1)
/* B87F4 800B7BF4 AC820054 */  sw         $v0, 0x54($a0)
/* B87F8 800B7BF8 8C640048 */  lw         $a0, 0x48($v1)
.L800B7BFC:
/* B87FC 800B7BFC 50800004 */  beql       $a0, $zero, .L800B7C10
/* B8800 800B7C00 8C64004C */   lw        $a0, 0x4c($v1)
/* B8804 800B7C04 8C62004C */  lw         $v0, 0x4c($v1)
/* B8808 800B7C08 AC82004C */  sw         $v0, 0x4c($a0)
/* B880C 800B7C0C 8C64004C */  lw         $a0, 0x4c($v1)
.L800B7C10:
/* B8810 800B7C10 10800004 */  beqz       $a0, .L800B7C24
/* B8814 800B7C14 24020001 */   addiu     $v0, $zero, 1
/* B8818 800B7C18 8C620048 */  lw         $v0, 0x48($v1)
/* B881C 800B7C1C AC820048 */  sw         $v0, 0x48($a0)
/* B8820 800B7C20 24020001 */  addiu      $v0, $zero, 1
.L800B7C24:
/* B8824 800B7C24 AC600044 */  sw         $zero, 0x44($v1)
/* B8828 800B7C28 AC600048 */  sw         $zero, 0x48($v1)
/* B882C 800B7C2C 03E00008 */  jr         $ra
/* B8830 800B7C30 AC60004C */   sw        $zero, 0x4c($v1)
.L800B7C34:
/* B8834 800B7C34 1460FFE4 */  bnez       $v1, .L800B7BC8
/* B8838 800B7C38 00000000 */   nop
.L800B7C3C:
/* B883C 800B7C3C 03E00008 */  jr         $ra
/* B8840 800B7C40 00001021 */   addu      $v0, $zero, $zero

glabel widget_UpButton
/* B8844 800B7C44 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8848 800B7C48 00802821 */  addu       $a1, $a0, $zero
/* B884C 800B7C4C AFBF0010 */  sw         $ra, 0x10($sp)
/* B8850 800B7C50 8CA20008 */  lw         $v0, 8($a1)
/* B8854 800B7C54 14400003 */  bnez       $v0, .L800B7C64
/* B8858 800B7C58 00000000 */   nop
/* B885C 800B7C5C 0802DF1B */  j          .L800B7C6C
/* B8860 800B7C60 00001021 */   addu      $v0, $zero, $zero
.L800B7C64:
/* B8864 800B7C64 0040F809 */  jalr       $v0
/* B8868 800B7C68 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7C6C:
/* B886C 800B7C6C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8870 800B7C70 03E00008 */  jr         $ra
/* B8874 800B7C74 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_DownButton
/* B8878 800B7C78 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B887C 800B7C7C 00802821 */  addu       $a1, $a0, $zero
/* B8880 800B7C80 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8884 800B7C84 8CA2000C */  lw         $v0, 0xc($a1)
/* B8888 800B7C88 14400003 */  bnez       $v0, .L800B7C98
/* B888C 800B7C8C 00000000 */   nop
/* B8890 800B7C90 0802DF28 */  j          .L800B7CA0
/* B8894 800B7C94 00001021 */   addu      $v0, $zero, $zero
.L800B7C98:
/* B8898 800B7C98 0040F809 */  jalr       $v0
/* B889C 800B7C9C 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7CA0:
/* B88A0 800B7CA0 8FBF0010 */  lw         $ra, 0x10($sp)
/* B88A4 800B7CA4 03E00008 */  jr         $ra
/* B88A8 800B7CA8 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_LeftButton
/* B88AC 800B7CAC 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B88B0 800B7CB0 00802821 */  addu       $a1, $a0, $zero
/* B88B4 800B7CB4 AFBF0010 */  sw         $ra, 0x10($sp)
/* B88B8 800B7CB8 8CA20010 */  lw         $v0, 0x10($a1)
/* B88BC 800B7CBC 14400003 */  bnez       $v0, .L800B7CCC
/* B88C0 800B7CC0 00000000 */   nop
/* B88C4 800B7CC4 0802DF35 */  j          .L800B7CD4
/* B88C8 800B7CC8 00001021 */   addu      $v0, $zero, $zero
.L800B7CCC:
/* B88CC 800B7CCC 0040F809 */  jalr       $v0
/* B88D0 800B7CD0 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7CD4:
/* B88D4 800B7CD4 8FBF0010 */  lw         $ra, 0x10($sp)
/* B88D8 800B7CD8 03E00008 */  jr         $ra
/* B88DC 800B7CDC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_RightButton
/* B88E0 800B7CE0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B88E4 800B7CE4 00802821 */  addu       $a1, $a0, $zero
/* B88E8 800B7CE8 AFBF0010 */  sw         $ra, 0x10($sp)
/* B88EC 800B7CEC 8CA20014 */  lw         $v0, 0x14($a1)
/* B88F0 800B7CF0 14400003 */  bnez       $v0, .L800B7D00
/* B88F4 800B7CF4 00000000 */   nop
/* B88F8 800B7CF8 0802DF42 */  j          .L800B7D08
/* B88FC 800B7CFC 00001021 */   addu      $v0, $zero, $zero
.L800B7D00:
/* B8900 800B7D00 0040F809 */  jalr       $v0
/* B8904 800B7D04 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7D08:
/* B8908 800B7D08 8FBF0010 */  lw         $ra, 0x10($sp)
/* B890C 800B7D0C 03E00008 */  jr         $ra
/* B8910 800B7D10 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_AButton
/* B8914 800B7D14 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8918 800B7D18 00802821 */  addu       $a1, $a0, $zero
/* B891C 800B7D1C AFBF0010 */  sw         $ra, 0x10($sp)
/* B8920 800B7D20 8CA20018 */  lw         $v0, 0x18($a1)
/* B8924 800B7D24 14400003 */  bnez       $v0, .L800B7D34
/* B8928 800B7D28 00000000 */   nop
/* B892C 800B7D2C 0802DF4F */  j          .L800B7D3C
/* B8930 800B7D30 00001021 */   addu      $v0, $zero, $zero
.L800B7D34:
/* B8934 800B7D34 0040F809 */  jalr       $v0
/* B8938 800B7D38 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7D3C:
/* B893C 800B7D3C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8940 800B7D40 03E00008 */  jr         $ra
/* B8944 800B7D44 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_BButton
/* B8948 800B7D48 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B894C 800B7D4C 00802821 */  addu       $a1, $a0, $zero
/* B8950 800B7D50 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8954 800B7D54 8CA2001C */  lw         $v0, 0x1c($a1)
/* B8958 800B7D58 14400003 */  bnez       $v0, .L800B7D68
/* B895C 800B7D5C 00000000 */   nop
/* B8960 800B7D60 0802DF5C */  j          .L800B7D70
/* B8964 800B7D64 00001021 */   addu      $v0, $zero, $zero
.L800B7D68:
/* B8968 800B7D68 0040F809 */  jalr       $v0
/* B896C 800B7D6C 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7D70:
/* B8970 800B7D70 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8974 800B7D74 03E00008 */  jr         $ra
/* B8978 800B7D78 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_StartButton
/* B897C 800B7D7C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8980 800B7D80 00802821 */  addu       $a1, $a0, $zero
/* B8984 800B7D84 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8988 800B7D88 8CA20020 */  lw         $v0, 0x20($a1)
/* B898C 800B7D8C 14400003 */  bnez       $v0, .L800B7D9C
/* B8990 800B7D90 00000000 */   nop
/* B8994 800B7D94 0802DF69 */  j          .L800B7DA4
/* B8998 800B7D98 00001021 */   addu      $v0, $zero, $zero
.L800B7D9C:
/* B899C 800B7D9C 0040F809 */  jalr       $v0
/* B89A0 800B7DA0 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7DA4:
/* B89A4 800B7DA4 8FBF0010 */  lw         $ra, 0x10($sp)
/* B89A8 800B7DA8 03E00008 */  jr         $ra
/* B89AC 800B7DAC 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_ZButton
/* B89B0 800B7DB0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B89B4 800B7DB4 00802821 */  addu       $a1, $a0, $zero
/* B89B8 800B7DB8 AFBF0010 */  sw         $ra, 0x10($sp)
/* B89BC 800B7DBC 8CA2002C */  lw         $v0, 0x2c($a1)
/* B89C0 800B7DC0 14400003 */  bnez       $v0, .L800B7DD0
/* B89C4 800B7DC4 00000000 */   nop
/* B89C8 800B7DC8 0802DF76 */  j          .L800B7DD8
/* B89CC 800B7DCC 00001021 */   addu      $v0, $zero, $zero
.L800B7DD0:
/* B89D0 800B7DD0 0040F809 */  jalr       $v0
/* B89D4 800B7DD4 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7DD8:
/* B89D8 800B7DD8 8FBF0010 */  lw         $ra, 0x10($sp)
/* B89DC 800B7DDC 03E00008 */  jr         $ra
/* B89E0 800B7DE0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_LButton
/* B89E4 800B7DE4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B89E8 800B7DE8 00802821 */  addu       $a1, $a0, $zero
/* B89EC 800B7DEC AFBF0010 */  sw         $ra, 0x10($sp)
/* B89F0 800B7DF0 8CA20024 */  lw         $v0, 0x24($a1)
/* B89F4 800B7DF4 14400003 */  bnez       $v0, .L800B7E04
/* B89F8 800B7DF8 00000000 */   nop
/* B89FC 800B7DFC 0802DF83 */  j          .L800B7E0C
/* B8A00 800B7E00 00001021 */   addu      $v0, $zero, $zero
.L800B7E04:
/* B8A04 800B7E04 0040F809 */  jalr       $v0
/* B8A08 800B7E08 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7E0C:
/* B8A0C 800B7E0C 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8A10 800B7E10 03E00008 */  jr         $ra
/* B8A14 800B7E14 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_Rbutton
/* B8A18 800B7E18 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8A1C 800B7E1C 00802821 */  addu       $a1, $a0, $zero
/* B8A20 800B7E20 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8A24 800B7E24 8CA20028 */  lw         $v0, 0x28($a1)
/* B8A28 800B7E28 14400003 */  bnez       $v0, .L800B7E38
/* B8A2C 800B7E2C 00000000 */   nop
/* B8A30 800B7E30 0802DF90 */  j          .L800B7E40
/* B8A34 800B7E34 00001021 */   addu      $v0, $zero, $zero
.L800B7E38:
/* B8A38 800B7E38 0040F809 */  jalr       $v0
/* B8A3C 800B7E3C 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7E40:
/* B8A40 800B7E40 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8A44 800B7E44 03E00008 */  jr         $ra
/* B8A48 800B7E48 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_CUp
/* B8A4C 800B7E4C 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8A50 800B7E50 00802821 */  addu       $a1, $a0, $zero
/* B8A54 800B7E54 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8A58 800B7E58 8CA20030 */  lw         $v0, 0x30($a1)
/* B8A5C 800B7E5C 14400003 */  bnez       $v0, .L800B7E6C
/* B8A60 800B7E60 00000000 */   nop
/* B8A64 800B7E64 0802DF9D */  j          .L800B7E74
/* B8A68 800B7E68 00001021 */   addu      $v0, $zero, $zero
.L800B7E6C:
/* B8A6C 800B7E6C 0040F809 */  jalr       $v0
/* B8A70 800B7E70 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7E74:
/* B8A74 800B7E74 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8A78 800B7E78 03E00008 */  jr         $ra
/* B8A7C 800B7E7C 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_CDown
/* B8A80 800B7E80 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8A84 800B7E84 00802821 */  addu       $a1, $a0, $zero
/* B8A88 800B7E88 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8A8C 800B7E8C 8CA20034 */  lw         $v0, 0x34($a1)
/* B8A90 800B7E90 14400003 */  bnez       $v0, .L800B7EA0
/* B8A94 800B7E94 00000000 */   nop
/* B8A98 800B7E98 0802DFAA */  j          .L800B7EA8
/* B8A9C 800B7E9C 00001021 */   addu      $v0, $zero, $zero
.L800B7EA0:
/* B8AA0 800B7EA0 0040F809 */  jalr       $v0
/* B8AA4 800B7EA4 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7EA8:
/* B8AA8 800B7EA8 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8AAC 800B7EAC 03E00008 */  jr         $ra
/* B8AB0 800B7EB0 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_CLeft
/* B8AB4 800B7EB4 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8AB8 800B7EB8 00802821 */  addu       $a1, $a0, $zero
/* B8ABC 800B7EBC AFBF0010 */  sw         $ra, 0x10($sp)
/* B8AC0 800B7EC0 8CA20038 */  lw         $v0, 0x38($a1)
/* B8AC4 800B7EC4 14400003 */  bnez       $v0, .L800B7ED4
/* B8AC8 800B7EC8 00000000 */   nop
/* B8ACC 800B7ECC 0802DFB7 */  j          .L800B7EDC
/* B8AD0 800B7ED0 00001021 */   addu      $v0, $zero, $zero
.L800B7ED4:
/* B8AD4 800B7ED4 0040F809 */  jalr       $v0
/* B8AD8 800B7ED8 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7EDC:
/* B8ADC 800B7EDC 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8AE0 800B7EE0 03E00008 */  jr         $ra
/* B8AE4 800B7EE4 27BD0018 */   addiu     $sp, $sp, 0x18

glabel widget_CRight
/* B8AE8 800B7EE8 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* B8AEC 800B7EEC 00802821 */  addu       $a1, $a0, $zero
/* B8AF0 800B7EF0 AFBF0010 */  sw         $ra, 0x10($sp)
/* B8AF4 800B7EF4 8CA2003C */  lw         $v0, 0x3c($a1)
/* B8AF8 800B7EF8 14400003 */  bnez       $v0, .L800B7F08
/* B8AFC 800B7EFC 00000000 */   nop
/* B8B00 800B7F00 0802DFC4 */  j          .L800B7F10
/* B8B04 800B7F04 00001021 */   addu      $v0, $zero, $zero
.L800B7F08:
/* B8B08 800B7F08 0040F809 */  jalr       $v0
/* B8B0C 800B7F0C 8CA40044 */   lw        $a0, 0x44($a1)
.L800B7F10:
/* B8B10 800B7F10 8FBF0010 */  lw         $ra, 0x10($sp)
/* B8B14 800B7F14 03E00008 */  jr         $ra
/* B8B18 800B7F18 27BD0018 */   addiu     $sp, $sp, 0x18
/* B8B1C 800B7F1C 00000000 */  nop
