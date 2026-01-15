#include "entity.h"
#include "dialougEnt.h"
#include "Borgindecies.h"

//size and appearance data for entities. Sorted by internal name A-Z with +1 to their index.
EntityExtra gEntityExtras[]={
 //index+1                      model               portrait,                ani(?) height radius scale
 {(EntInd_Abrecan+1),           BORG7_Abrecan,      BORG8_PortraitAbrecan,   0.4f,  1.96f, 0.75f, 0.969f},  //0
 {(EntInd_AirElemental+1),      BORG7_AirElem,      BORG8_PortraitAirElem,   0.61f, 2.38f, 1.0f,  1.05f},   //1
 {(EntInd_Alaron+1),            BORG7_Alaron,       BORG8_PortraitAlaron,    0.42f, 1.82f, 0.7f,  1.00f},   //2
 {(EntInd_Ardra+1),             BORG7_Ardua,        0x010a,                  0.4f,  1.7f,  0.6f,  1.00f},   //3
 {(EntInd_Arturo+1),            BORG7_Arturo,       0x010b,                  0.5f,  2.01f, 0.8f,  0.952f},  //4
 {(EntInd_Assim+1),             BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f , 0.62f, 1.296f},  //5
 {(EntInd_Baird+1),             BORG7_Baird,        0x010c,                  0.53f, 2.09f, 0.85f, 1.00f},   //6
 {(EntInd_BanditBoss+1),        BORG7_Bandit2,      0x010f,                  0.38f, 1.90f, 0.72f, 0.974f},  //7
 {(EntInd_BanditBoss2+1),       BORG7_Bandit2,      0x010f,                  0.38f, 1.90f, 0.72f, 1.0227f}, //8
 {(EntInd_BanditBoss3+1),       BORG7_Bandit2,      0x010f,                  0.38f, 1.90f, 0.72f, 1.1201f}, //9
 {(EntInd_Bear+1),              BORG7_Bear,         BORG8_PortraitBear,      0.59f, 1.22f, 1.0f,  1.107f},  //10
 {(EntInd_Becan+1),             BORG7_Becan,        BORG8_PortraitBecan,     0.48f, 2.04f, 0.7f,  0.907f},  //11
 {(EntInd_Behrooz+1),           BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 0.9936f}, //12
 {(EntInd_Boar+1),              BORG7_Boar,         BORG8_PortraitBoar,      0.36f, 0.82f, 0.6f,  1.0f},    //13
 {(EntInd_Bowden+1),            BORG7_Bowden,       BORG8_PortraitBowden,    0.4f,  1.86f, 0.7f,  1.0f},    //14
 {(EntInd_Brenna+1),            BORG7_Brenna,       BORG8_PortraitBrenna,    0.49f, 1.68f, 0.65f, 1.0f},    //15
 {(EntInd_Cadme+1),             BORG7_MirariMale,   0x118,                   0.5f,  1.3f,  0.45f, 1.0f},    //16
 {(EntInd_CaveBear+1),          BORG7_Bear,         BORG8_PortraitBear,      0.59f, 1.22f, 1.0f,  1.5498f}, //17
 {(EntInd_ChaosLt+1),           BORG7_ChaosLt,      0x11a,                   0.21f, 1.9f,  0.9f,  1.132f},  //18
 {(EntInd_ChaosMjr+1),          BORG7_ChaosMjr,     0x11b,                   0.52f, 4.35f, 1.5f,  0.621f},  //19
 {(EntInd_ChaosMauler+1),       BORG7_ChaosSlayer,  0x11d,                   0.49f, 2.43f, 1.0f,  1.25f},   //20
 {(EntInd_ChaosScout+1),        BORG7_ChaosScout,   0x11c,                   0.52f, 1.7f,  1.0f,  0.647f},  //21
 {(EntInd_ChaosShocktrooper+1), BORG7_ChaosTrooper, BORG8_PortraitChaosTroop,0.38f, 1.8f,  1.2f,  1.25f},   //22
 {(EntInd_ChaosSlayer+1),       BORG7_ChaosSlayer,  0x11d,                   0.49f, 2.43f, 1.0f,  1.0f},    //23
 {(EntInd_ChaosSorceror+1),     BORG7_ChaosMage,    BORG8_PortraitChaosMage, 0.51f, 1.75f, 0.6f,  1.029f},  //24
 {(EntInd_ChaosSpellweaver+1),  BORG7_ChaosMage,    BORG8_PortraitChaosMage, 0.49f, 2.43f, 1.0f,  1.25f},   //25
 {(EntInd_ChaosStormtrooper+1), BORG7_ChaosTrooper, BORG8_PortraitChaosTroop,0.38f, 1.8f,  1.2f,  1.375f},  //26
 {(EntInd_ChaosWarrior+1),      BORG7_ChaosWarrior, 0x120,                   0.6f,  1.69f, 0.9f,  1.0f},    //27
 {(EntInd_Charisa+1),           BORG7_NPCFemale3,   0x121,                   0.4f,  1.7f,  0.5f,  1.0f},    //28
 {(EntInd_Cradagwgh+1),         BORG7_Cradagwgh,    0x128,                   0.4f,  3.21f, 0.5f,  0.55f},   //29
 {(EntInd_Cyclops+1),           BORG7_Cyclops,      0x129,                   0.42f, 3.5f,  1.0f,  0.909f},  //30
 {(EntInd_Darkenbat+1),         BORG7_Bat,          BORG8_PortraitBat,       0.33f, 2.34f, 1.0f,  1.2f},    //31
 {(EntInd_DireWolf+1),          BORG7_Wolf,         BORG8_PortraitWolf,      0.41f, 0.9f,  0.65f, 1.8f},    //32
 {(EntInd_Donovan+1),           BORG7_Donovan,      BORG8_PortraitDonovan,   0.4f,  2.0f,  0.6f,  0.9f},    //33
 {(EntInd_Dougal+1),            BORG7_Dougal,       BORG8_PortraitDougal,    0.2f,  2.0f,  0.6f,  0.875f},  //34
 {(EntInd_Dracovern+1),         BORG7_Wyvern,       BORG8_PortraitWyvern,    0.4f,  2.4f,  1.8f,  1.2f},    //35
 {(EntInd_DryadFemale+1),       BORG7_DryadF,       BORG8_PortraitDryadF,    0.4f,  1.5f,  0.8f,  1.0f},    //36
 {(EntInd_DryadMale+1),         BORG7_DryadM,       BORG8_PortraitDryadM,    0.4f,  1.7f,  0.9f,  1.029f},  //37
 {(EntInd_DustDevil+1),         BORG7_AirElem,      BORG8_PortraitAirElem,   0.61f, 2.38f, 1.0f,  0.525f},  //38
 {(EntInd_EarthElemental+1),    BORG7_EarthElem,    BORG8_PortraitEarthElem, 0.53f, 2.50f, 1.3f,  1.0f},    //39
 {(EntInd_Edur+1),              BORG7_MirariMale,   0x0133,                  0.4f,  1.3f,  0.4f,  1.0f},    //40
 {(EntInd_Ehud+1),              BORG7_Ehud,         0x0134,                  0.37f, 1.44f, 0.65f, 1.111f},  //41
 {(EntInd_Farris+1),            BORG7_Farris,       0x0135,                  0.53f, 1.6f,  0.4f,  1.094f},  //42
 {(EntInd_Female1+1),           BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //43
 {(EntInd_Female2+1),           BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //44
 {(EntInd_Female3+1),           BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //45
 {(EntInd_FireElemental+1),     BORG7_FireElem,     0x0136,                  0.62f, 1.9f,  0.75f, 1.316f},  //46
 {(EntInd_Firelord+1),          BORG7_FireElem,     0x0136,                  0.62f, 1.9f,  0.75f, 1.316f},  //47
 {(EntInd_Gabrion+1),           BORG7_Gabrion,      0x0138,                  0.4f,  1.7f,  0.5f,  1.059f},  //48
 {(EntInd_Gechina+1),           BORG7_Gechina,      0x013c,                  0.4f,  1.32f, 0.4f,  1.0f},    //49
 {(EntInd_GiantBat+1),          BORG7_Bat,          BORG8_PortraitBat,       0.33f, 2.34f, 1.0f,  0.7f},    //50
 {(EntInd_GiantBoar+1),         BORG7_Boar,         BORG8_PortraitBoar,      0.36f, 0.82f, 0.9f,  1.6f},    //51
 {(EntInd_GiantGolem+1),        BORG7_Golem,        0x0139,                  0.6f,  2.41f, 0.85f, 1.25f},   //52
 {(EntInd_GiantRat+1),          BORG7_Rat,          BORG8_PortraitRat,       0.23f, 0.74f, 1.0f,  1.0f},    //53
 {(EntInd_GiantScorpion+1),     BORG7_Scorpion,     0x0168,                  0.49f, 0.33f, 0.3f,  4.545f},  //54
 {(EntInd_GiantSkeleton+1),     BORG7_Skeleton,     0x016c,                  0.55f, 1.58f, 0.6f,  1.8f},    //55
 {(EntInd_GiantSquid+1),        BORG7_Tentacle,     0x016e,                  0.4f,  4.6f,  1.3f,  1.0f},    //56
 {(EntInd_Goblin+1),            BORG7_Goblin,       BORG8_PortraitGoblin1,   0.5f,  0.74f, 1.0f,  1.0f},    //57
 {(EntInd_GoblinPoisoner+1),    BORG7_Goblin2,      BORG8_PortraitGoblin2,   0.42f, 1.72f, 0.5f,  0.9f},    //58
 {(EntInd_GoblinPoisoner2+1),   BORG7_Goblin2,      BORG8_PortraitGoblin2,   0.42f, 1.72f, 0.5f,  1.0f},    //59
 {(EntInd_GoblinScout+1),       BORG7_Goblin,       BORG8_PortraitGoblin1,   0.5f,  1.7f,  0.5f,  0.9f},    //60
 {(EntInd_GoblinScout2+1),      BORG7_Goblin,       BORG8_PortraitGoblin1,   0.5f,  1.7f,  0.5f,  1.0f},    //61
 {(EntInd_GoblinSgt2+1),        BORG7_Goblin2,      BORG8_PortraitGoblin2,   0.42f, 1.72f, 0.5f,  1.2f},    //62
 {(EntInd_GoblinSgt+1),         BORG7_Goblin2,      BORG8_PortraitGoblin2,   0.42f, 1.72f, 0.5f,  1.0f},    //63
 {(EntInd_GoblinWarrior2+1),    BORG7_Goblin,       BORG8_PortraitGoblin2,   0.5f,  1.7f,  0.5f,  1.2f},    //64
 {(EntInd_Godric+1),            BORG7_Godric,       0x0140,                  0.22f, 1.69f, 0.5f,  1.0f},    //65
 {(EntInd_Golnar+1),            BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 1.21f},   //66
 {(EntInd_Gorgon+1),            BORG7_Gorgon,       0x0141,                  0.37f, 2.21f, 0.7f,  1.0f},    //67
 {(EntInd_Gotzone+1),           BORG7_Gotzone,      0x0142,                  0.4f,  1.38f, 0.4f,  1.0f},    //68
 {(EntInd_Gryphon+1),           BORG7_Gryphon,      0x0143,                  0.38f, 1.4f,  1.3f,  1.0f},    //69
 {(EntInd_Guard1+1),            BORG7_Guard1,       0x0144,                  0.4f,  1.85f, 0.6f,  0.973f},  //70
 {(EntInd_Guard2+1),            BORG7_Guard2,       0x0145,                  0.4f,  1.85f, 0.6f,  0.973f},  //71
 {(EntInd_Guard3+1),            BORG7_Guard3,       0x0146,                  0.4f,  1.85f, 0.5f,  0.973f},  //72
 {(EntInd_Harpy+1),             BORG7_Harpy,        0x0147,                  0.25f, 2.5f,  1.1f,  1.0f},    //73
 {(EntInd_HellHound+1),         BORG7_HellHound,    0x0148,                  0.35f, 1.1f,  0.9f,  1.0f},    //74
 {(EntInd_Hobgoblin+1),         BORG7_Hobgoblin,    0x014a,                  0.67f, 2.26f, 1.2f,  1.0f},    //75
 {(EntInd_Hobgoblin2+1),        BORG7_Hobgoblin,    0x014a,                  0.67f, 2.26f, 1.2f,  1.2f},    //76
 {(EntInd_HumanBandit+1),       BORG7_Bandit1,      0x014b,                  0.38f, 1.93f, 0.7f,  0.993f},  //77
 {(EntInd_HumanBandit2+1),      BORG7_Bandit1,      0x014b,                  0.38f, 1.93f, 0.7f,  1.0263f}, //78
 {(EntInd_HumanBandit3+1),      BORG7_Bandit1,      0x014b,                  0.38f, 1.93f, 0.7f,  1.1196f}, //79
 {(EntInd_HumanWoodsman+1),     BORG7_Bandit2,      0x010f,                  0.38f, 1.93f, 0.75f, 0.84f},   //80
 {(EntInd_JundarFemale+1),      BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //81
 {(EntInd_JundarMale+1),        BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //82
 {(EntInd_Jundarguard+1),       BORG7_JundarGuard,  0x014d,                  0.4f,  2.1f,  0.45f, 1.048f},  //83
 {(EntInd_Keelin+1),            BORG7_Keelin,       0x014f,                  0.64f, 1.9f,  0.65f, 0.895f},  //84
 {(EntInd_Kitarak+1),           BORG7_Hobgoblin,    0x014a,                  0.67f, 2.26f, 1.2f,  1.0f},    //85
 {(EntInd_Ksathra+1),           BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 1.2096f}, //86
 {(EntInd_LargeScorpion+1),     BORG7_Scorpion,     0x0168,                  0.49f, 0.33f, 0.3f,  2.424f},  //87
 {(EntInd_LavaHound+1),         BORG7_HellHound,    0x0148,                  0.35f, 1.1f,  0.9f,  1.4f},    //88
 {(EntInd_LizardMan+1),         BORG7_LizardMan,    0x0151,                  0.47f, 2.2f,  0.9f,  1.0f},    //89
 {(EntInd_LizardManBoss+1),     BORG7_LizardManBoss,0x0152,                  0.4f,  2.74f, 1.0f,  1.0f},    //90
 {(EntInd_LizardManSgt+1),      BORG7_LizardManSgt, 0x0153,                  0.26f, 2.34f, 0.9f,  1.0f},    //91
 {(EntInd_Lloyd+1),             BORG7_Phelan,       0x0131,                  0.4f,  1.9f,  0.6f,  0.947f},  //92
 {(EntInd_Lugash+1),            BORG7_Lugash,       0x0117,                  0.57f, 2.59f, 0.75f, 1.0f},    //93
 {(EntInd_Male1+1),             BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //94
 {(EntInd_Male2+1),             BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //95
 {(EntInd_Male3+1),             BORG7_NPCMale3,     BORG8_PortraitNPCMale3,  0.4f,  1.85f, 0.5f,  0.946f},  //96
 {(EntInd_Manticore+1),         BORG7_Manticore,    0x0156,                  0.35f, 1.8f,  1.7f,  1.0f},    //97
 {(EntInd_Marquis+1),           BORG7_Marquis,      0x0157,                  0.6f,  2.19f, 0.65f, 0.89f},   //98
 {(EntInd_Mehrdad+1),           BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 1.2528f}, //99
 {(EntInd_Minotuar+1),          BORG7_Minotuar,     0x3846,                  0.25f, 1.9f,  0.75f, 1.079f},  //100
 {(EntInd_MinotuarLord+1),      BORG7_Minotuar,     0x0159,                  0.25f, 1.9f,  0.75f, 1.4027f}, //101
 {(EntInd_MirariFemale+1),      BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //102
 {(EntInd_MirariMale+1),        BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //103
 {(EntInd_Nasim+1),             BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 0.9504f}, //104
 {(EntInd_Niesen+1),            BORG7_Niesen,       0x015d,                  0.53f, 1.82f, 0.6f,  0.934f},  //105
 {(EntInd_NightBoss1+1),        BORG7_Bandit2,      0x010f,                  0.38f, 1.9f,  0.75f, 0.974f},  //106
 {(EntInd_NightBoss2+1),        BORG7_Bandit2,      0x010f,                  0.38f, 1.9f,  0.75f, 1.0714f}, //107
 {(EntInd_NightBoss3+1),        BORG7_Bandit2,      0x010f,                  0.38f, 1.9f,  0.75f, 1.1688f}, //108
 {(EntInd_Ogre+1),              BORG7_Ogre,         0x015e,                  0.5f,  2.62f, 1.4f,  1.0f},    //109
 {(EntInd_OrgeBoss+1),          BORG7_OrgeBoss,     0x015f,                  0.55f, 2.96f, 1.5f,  1.0f},    //110
 {(EntInd_OgreGuard+1),         BORG7_Ogre,         0x015e,                  0.5f,  2.62f, 1.4f,  1.2f},    //111
 {(EntInd_Oriana+1),            BORG7_Oriana,       0x0160,                  0.4f,  1.68f, 0.5f,  1.0f},    //112
 {(EntInd_Pandara+1),           BORG7_Pandara,      0x0161,                  0.4f,  1.9f,  1.0f,  1.0f},    //113
 {(EntInd_PlagueZombie+1),      BORG7_Zombie,       0x017d,                  0.33f, 1.76f, 0.75f, 1.5f},    //114
 {(EntInd_Pochanargat+1),       BORG7_Pochanargat,  0x0162,                  0.37f, 4.24f, 1.2f,  1.179f},  //115
 {(EntInd_Rheda+1),             BORG7_Rheda,        0x0164,                  0.34f, 1.8f,  0.6f,  0.956f},  //116
 {(EntInd_Rooughah+1),          BORG7_Rooughah,     0x0165,                  0.36f, 1.85f, 1.0f,  1.0f},    //117
 {(EntInd_Salamander+1),        BORG7_Salamander,   0x0166,                  0.43f, 1.4f,  3.0f,  0.643f},  //118
 {(EntInd_SandWorm+1),          BORG7_SandWorm,     0x0167,                  0.28f, 0.4f,  1.0f,  1.625f},  //119
 {(EntInd_Shadow+1),            BORG7_Shadow,       0x0169,                  0.44f, 1.82f, 0.6f,  1.0f},    //120
 {(EntInd_Shatrevar+1),         BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 1.1232f}, //121
 {(EntInd_Sheridan+1),          BORG7_Sheridan,     BORG8_PortraitSheridan,  0.3f,  1.82f, 0.55f, 1.0f},    //122
 {(EntInd_Sholeh+1),            BORG7_Sholeh,       0x016b,                  0.35f, 1.88f, 0.65f, 1.064f},  //123
 {(EntInd_Skeleton+1),          BORG7_Skeleton,     0x016c,                  0.55f, 1.58f, 0.6f,  1.0f},    //124
 {(EntInd_GiantArcher+1),       BORG7_Skeleton,     0x016c,                  0.55f, 1.58f, 0.6f,  0.8f},    //125
 {(EntInd_SkeletonUnarmed+1),   BORG7_Skeleton,     0x016c,                  0.55f, 1.58f, 0.6f,  0.8f},    //126
 {(EntInd_SpiritWolf+1),        BORG7_Wolf,         0x0176,                  0.41f, 0.9f,  0.65f, 1.4f},    //127
 {(EntInd_STAI01+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //128
 {(EntInd_STAI02+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //129
 {(EntInd_STAI03+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //130
 {(EntInd_STER0903+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //131
 {(EntInd_STER0904+1),          BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //132
 {(EntInd_STER1002+1),          BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //133
 {(EntInd_STER1101+1),          BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //134
 {(EntInd_STER1202+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //135
 {(EntInd_STER1203+1),          BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //136
 {(EntInd_STER1301+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //137
 {(EntInd_STER1402+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //138
 {(EntInd_STER1403+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //139
 {(EntInd_STER1404+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //140
 {(EntInd_STER1405+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //141
 {(EntInd_STER1504+1),          BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //142
 {(EntInd_STER1505+1),          BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //143
 {(EntInd_STEU01+1),            BORG7_MirariMale,   BORG8_PortraitMirariM,   0.4f,  1.3f,  0.4f,  1.0f},    //144
 {(EntInd_STEU02+1),            BORG7_MirariFemale, BORG8_PortraitMirariF,   0.4f,  1.18f, 0.4f,  1.0f},    //145
 {(EntInd_STMI01+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //146
 {(EntInd_STMI02+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //147
 {(EntInd_STMI03+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //148
 {(EntInd_STMI04+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //149
 {(EntInd_STMI05+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //150
 {(EntInd_StoneGolem+1),        BORG7_Golem,        0x0139,                  0.6f,  2.41f, 0.85f, 1.0f},    //151
 {(EntInd_STPS01+1),            BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //152
 {(EntInd_STPS02+1),            BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //153
 {(EntInd_STPS03+1),            BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //154
 {(EntInd_STPS04+1),            BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //155
 {(EntInd_STPS05+1),            BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //156
 {(EntInd_STPS06+1),            BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //157
 {(EntInd_STPS07+1),            BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //158
 {(EntInd_STPS08+1),            BORG7_Bandit2,      0x10f,                   0.4f,  1.85f, 0.72f, 0.956f},  //159
 {(EntInd_STPS09+1),            BORG7_NPCFemale2,   BORG8_PortraitNPCFemale2,0.4f,  1.7f,  0.5f,  1.0f},    //160
 {(EntInd_STPS10+1),            BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //161
 {(EntInd_STTA01+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //162
 {(EntInd_STTA02+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //163
 {(EntInd_STTA03+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //164
 {(EntInd_STTA04+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //165
 {(EntInd_STTA05+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //166
 {(EntInd_STTA06+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //167
 {(EntInd_STTA07+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //168
 {(EntInd_STTA08+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //169
 {(EntInd_STTA09+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //170
 {(EntInd_STTA10+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //171
 {(EntInd_STTA11+1),            BORG7_NPCFemale1,   BORG8_PortraitNPCFemale1,0.4f,  1.7f,  0.5f,  1.0f},    //172
 {(EntInd_STTA12+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //173
 {(EntInd_STTA13+1),            BORG7_NPCMale1,     BORG8_PortraitNPCMale1,  0.4f,  1.85f, 0.5f,  0.946f},  //174
 {(EntInd_STTE01+1),            BORG7_NPCMale3,     BORG8_PortraitNPCMale3,  0.4f,  1.85f, 0.5f,  0.946f},  //175
 {(EntInd_STTE02+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //176
 {(EntInd_STTE03+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //177
 {(EntInd_STTE04+1),            BORG7_NPCMale3,     BORG8_PortraitNPCMale3,  0.4f,  1.85f, 0.5f,  0.946f},  //178
 {(EntInd_STTE05+1),            BORG7_NPCMale3,     BORG8_PortraitNPCMale3,  0.4f,  1.85f, 0.5f,  0.946f},  //179
 {(EntInd_STTE06+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //180
 {(EntInd_STTE07+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //181
 {(EntInd_STTE08+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //182
 {(EntInd_STTE09+1),            BORG7_NPCMale3,     BORG8_PortraitNPCMale3,  0.4f,  1.85f, 0.5f,  0.946f},  //183
 {(EntInd_STTE10+1),            BORG7_NPCFemale3,   BORG8_PortraitNPCFemale3,0.4f,  1.7f,  0.5f,  1.0f},    //184
 {(EntInd_STUG01+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //185
 {(EntInd_STUG02+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //186
 {(EntInd_STUG03+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //187
 {(EntInd_STUG04+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //188
 {(EntInd_STUG05+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //189
 {(EntInd_STUG06+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //190
 {(EntInd_STUG07+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //191
 {(EntInd_STUG08+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //192
 {(EntInd_STUG09+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //193
 {(EntInd_STUG10+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //194
 {(EntInd_STUG11+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //195
 {(EntInd_STUG12+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //196
 {(EntInd_STUG13+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //197
 {(EntInd_STUG14+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //198
 {(EntInd_STUG15+1),            BORG7_JundarMale,   BORG8_PortraitJundarM,   0.4f,  2.0f,  0.4f,  1.05f},   //199
 {(EntInd_STUG16+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //200
 {(EntInd_STUG17+1),            BORG7_JundarFemale, BORG8_PortraitJundarF,   0.4f,  1.9f,  0.35f, 1.053f},  //201
 {(EntInd_DougalSuper+1),       BORG7_Dougal,       BORG8_PortraitDougal,    0.2f,  2.0f,  0.6f,  0.875f},  //202
 {(EntInd_Tamberlain+1),        BORG7_NPCMale2,     BORG8_PortraitNPCMale2,  0.4f,  1.85f, 0.5f,  0.946f},  //203
 {(EntInd_TombRat+1),           BORG7_Rat,          BORG8_PortraitRat,       0.23f, 0.74f, 1.0f,  1.6f},    //204
 {(EntInd_Trahern+1),           BORG7_Trahern,      0x0171,                  0.3f,  1.78f, 0.5f,  1.0f},    //205
 {(EntInd_Troll+1),             BORG7_Troll,        0x0172,                  0.59f, 2.6f,  1.7f,  1.0f},    //206
 {(EntInd_Txomin+1),            BORG7_Txomin,       0x0173,                  0.4f,  1.38f, 0.4f,  1.0f},    //207
 {(EntInd_WaterElemental+1),    BORG7_WaterElem,    0x0174,                  0.61f, 2.69f, 1.1f,  1.0f},    //208
 {(EntInd_Wight+1),             BORG7_Lich,         BORG8_PortraitLich,      0.2f,  2.2f,  0.62f, 0.864f},  //209
 {(EntInd_Wolf+1),              BORG7_Wolf,         BORG8_PortraitWolf,      0.41f, 0.9f,  0.65f, 1.0f},    //210
 {(EntInd_Woodsman2+1),         BORG7_Bandit2,      0x010f,                  0.38f, 1.93f, 0.72f, 0.933f},  //211
 {(EntInd_Woodsman3+1),         BORG7_Bandit2,      0x010f,                  0.38f, 1.93f, 0.72f, 1.0263f}, //212
 {(EntInd_Wraith+1),            BORG7_Wraith,       0x0177,                  0.45f, 1.86f, 0.65f, 1.21f},   //213
 {(EntInd_Wyvern+1),            BORG7_Wyvern,       BORG8_PortraitWyvern,    0.4f,  2.4f,  1.8f,  0.8f},    //214
 {(EntInd_Xibid+1),             BORG7_MirariMale,   0x0179,                  0.45f, 1.86f, 0.65f, 1.21f},   //215
 {(EntInd_Yeraza+1),            BORG7_Yeraza,       0x017a,                  0.4f,  1.22f, 0.4f,  1.21f},   //216
 {(EntInd_Yuli+1),              BORG7_MirariMale,   0x017b,                  0.4f,  1.3f,  0.4f,  1.0f},    //217
 {(EntInd_Zaratas+1),           BORG7_Zeratas,      0x017c,                  0.4f,  2.36f, 0.5f,  1.0f},    //218
 {(EntInd_Zombie+1),            BORG7_Zombie,       0x017d,                  0.33f, 1.76f, 0.75f, 1.0f},    //219
 {(EntInd_Zurene+1),            BORG7_Zurene,       0x017e,                  0.4f,  1.16f, 0.4f,  1.0f},    //220
 {0,                            0,                  0,                       0,     0,     0,     0}        //221
};

//size and appearance data for Dialouge entities. Sorted by internal name A-Z with +1 to their index. several ommisions.
dialougeEntity_Info dailougEnt_info_array[]={
//index+1                      model                portrait,                height  scale
  {(DiaEntInd_Amann+1),        BORG7_NPCMale2,      0x0109,                  1.85f, 0.946f}, //0
  {(DiaEntInd_Baldric+1),      BORG7_NPCMale1,      0x010d,                  1.85f, 0.946f}, //1
  {(DiaEntInd_Balfin+1),       BORG7_NPCMale3,      0x010e,                  1.85f, 0.946f}, //2
  {(DiaEntInd_Batrin+1),       BORG7_NPCMale2,      0x0111,                  1.85f, 0.946f}, //3
  //no Bodecia?
  {(DiaEntInd_Cadme+1),        BORG7_MirariMale,    0x0118,                  1.3f,  1.0f},   //4
  {(DiaEntInd_Cedric+1),       BORG7_NPCMale1,      0x0119,                  1.85f, 0.946f}, //5
  {(DiaEntInd_Chicken+1),      BORG7_Chicken,       BORG8_PortraitNPCMale1,  1.0f,  1.0f},   //6
  {(DiaEntInd_Cow+1),          BORG7_Horse,         BORG8_PortraitHorse,     1.0f,  1.0f},   //7
  {(DiaEntInd_Damek+1),        BORG7_Damek,         0x012a,                  1.7f,  0.853f}, //8
  {(DiaEntInd_Darmath+1),      BORG7_Darmath,       0x012b,                  2.8f,  1.0f},   //9
  {(DiaEntInd_Devlin+1),       BORG7_Delvin,        0x012c,                  1.94f, 1.0f},   //10
  {(DiaEntInd_Exponto+1),      BORG7_Exponto,       BORG8_PortraitNPCMale1,  1.0f,  1.0f},   //11
  {(DiaEntInd_Fish+1),         BORG7_Horse,         BORG8_PortraitHorse,     1.0f,  1.0f},   //12
  {(DiaEntInd_Flock+1),        BORG7_Horse,         BORG8_PortraitHorse,     1.0f,  1.0f},   //13
  {(DiaEntInd_Fyrsil+1),       BORG7_Fyrsil,        0x0137,                  1.65f, 1.0f},   //14
  {(DiaEntInd_Gavinn+1),       BORG7_NPCMale1,      0x013b,                  1.85f, 0.946f}, //15
  {(DiaEntInd_Gillek+1),       BORG7_MirariMale,    0x013d,                  1.3f,  1.0f},   //16
  {(DiaEntInd_Herne+1),        BORG7_NPCMale1,      0x0149,                  1.85f, 0.946f}, //17
  {(DiaEntInd_Honza+1),        BORG7_NPCMale1,      0x014e,                  1.85f, 0.946f}, //18
  {(DiaEntInd_Horse+1),        BORG7_Horse,         BORG8_PortraitHorse,     1.0f,  1.0f},   //19
  {(DiaEntInd_JundarSign+1),   BORG7_NPCMale1,      BORG8_PortraitBanner,    1.0f,  1.0f},   //20
  {(DiaEntInd_Jundargate+1),   BORG7_JundarGate,    0x013a,                  1.0f,  1.0f},   //21
  {(DiaEntInd_KingdomSign+1),  BORG7_NPCMale1,      0x017f,                  1.0f,  1.0f},   //22
  {(DiaEntInd_Kolokos+1),      BORG7_JundarMale,    0x0150,                  2.0f,  1.05f},  //23
  {(DiaEntInd_Lycea+1),        BORG7_MirariFemale,  0x0154,                  1.18f, 1.0f},   //24
  {(DiaEntInd_Mago+1),         BORG7_Mago,          0x0155,                  1.65f, 0.788f}, //25
  {(DiaEntInd_Meriona+1),      BORG7_NPCFemale1,    0x0158,                  1.7f,  1.0f},   //26
  {(DiaEntInd_MirariSign+1),   BORG7_NPCMale1,      BORG8_PortraitSignpost,  1.0f,  1.0f},   //27
  {(DiaEntInd_Niala+1),        BORG7_NPCFemale2,    0x015c,                  1.7f,  1.0f},   //28
  //No pillar?
  //no pocho?
  {(DiaEntInd_Swagma+1),       BORG7_NPCFemale3,    0x016f,                  1.7f,  1.0f},   //29
  //no Tamberlain?
  {(DiaEntInd_TerminorSign+1), BORG7_NPCMale1,      0x017f,                  1.0f,  1.0f},   //30
  {(DiaEntInd_Xibid+1),        BORG7_MirariMale,    0x0179,                  1.3f,  1.0f},   //31
  {0,                          0,                   0,                       0,     0},      //32
};
//unknown array at end of data section. unused
u16 D_800f137c[]={
    0xb6,0x7f,0xb5,0x7f,0xb3,0x7f,0xb0,0x7f,0xb2,0x7f,0xb4,0x7f,0xb1,0x7f,0xc1,0x7f,0,0
};