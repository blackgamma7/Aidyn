//a list of id'd indicies used internally for the "n64Borg" art assets
//Borg8: UI images

#define BORG8_CompassWest 0X17
#define BORG8_CompassNorth 0X18
#define BORG8_CompassSouth 0X19
#define BORG8_CompassEast 0X1A
#define BORG8_CompassRing 0X1B
#define BORG8_MainFont 0x1C //main font, contains Controler button characters
#define BORG8_SlimFont 0x1D //text is a few pixels smaller, no Controler button characters
//0x1e - 0xa1 are minimap sections.
#define BORG8_longDownArrow 0xd5
#define BORG8_Spacer 0xd7
#define BORG8_PauseMenuA 0xd8
#define BORG8_PauseMenuB 0xd9
#define BORG8_PauseMenuC 0xda
//0x106-0x181 are most the character portaits.
#define BORG8_EXPPakYes 0x3758
#define BORG8_EXPPakNo 0x3759
#define BORG8_ErrorRegion 0x37c3
//TODO: process list as #deine's with hex values
typedef enum Borg8Enum {
    BORG8_MapIconStart=30,
    //long down arrow=213,
    //BORG8_Spacer=215,
    BORG8_PauseBGOptions=216,
    BORG8_PauseBGStats=217,
    BORG8_PauseBGMap=218,
    BORG8_CurrDayMarker=220,
    BORG8_CampTitle=221,
    BORG8_LogoH2O=222,
    BORG8_PortraitHighlight=223,
    //Parchment background=226,
   // Parchment Background_2=227,
    //Parchment shadow=228,
    //Parchment Window 2=229,
    BORG8_TitleJournal=230,
    BORG8_TitleInventory=233,
    BORG8_TitleSkills=236,
    BORG8_TitleSpells=237,
    BORG8_TitleTrain=239,
    BORG8_TitleMenui=242,
    //square highlight=243,
    //66 px highligh 2=244,
    //66 px highlight=245,
    //map marker=246,
    BORG8_CONTROLLER_PAK=247,
    //blank space?=248,
    BORG8_TitleEnterName=249,
    BORG8_TitleLicence=250,
    BORG8_WarningNoController=251,
    BORG8_WarningNoControllerPak=252,
    BORG8_TitleOptions=253,
    BORG8_TitlePause=254,
    BORG8_TitleSaveGame=255,
    BORG8_TitleTheater=256,
    BORG8_LogoTHQ=257,
    BORG8_TitlePressStart=258,
    Borg8_TitleCard=259,
    Borg8_TitleCardShadow=260,
    //42 px box=261,
    BORG8_PortraitAbrecan=262,
    BORG8_PortraitAlaron=264,
    BORG8_PortraitBat=272,
    BORG8_PortraitBear=274,
    BORG8_PortraitChaosScout=284,
    BORG8_PortraitNPCMale1=293,
    BORG8_PortraitGoblin=318,
    BORG8_PortraitGodrik=320,
    BORG8_PortraitKeelin=335,
    BORG8_PortraitShadow=361,
    BORG8_PortraitSheridan=362,
    BORG8_PortraitCrossbone=365,
    BORG8_PortraitTentacle=366,
    BORG8_PortraitBanner=384,
    BORG8_PortraitSignpost=385,
    BORG8_JournalBG=386,
    BORG8_IconSkAlchemist=387,
    BORG8_IconSkDiplomat=388,
    BORG8_IconSkHealer=389,
    BORG8_IconSkLoremaster=390,
    BORG8_IconSkMechanic=391,
    BORG8_IconSkMerchant=392,
    BORG8_IconSkRanger=393,
    BORG8_IconSkStealth=394,
    BORG8_IconSkTheif=395,
    BORG8_IconSkTroubador=396,
    BORG8_IconSkWarrior=397,
    BORG8_IconSkWizard=398,
    BORG8_CloudA=399,
    BORG8_CloudB=400,
    BORG8_CloudC=401,
    Borg8_LensflareFilled=402,
    Borg8_LensflareRing=403,
    BORG8_MoonNew=404,
    BORG8_MoonCresent=405,
    BORG8_MoonQuarter=406,
    BORG8_MoonGibb=407,
    BORG8_MoonFull=408,
    pillar=409,
    //Sun texture?=418,
    BORG8_IconAsLunar=419,
    BORG8_IconAsSolar=420,
    BORG8_IconSpell0=421,
    BORG8_IconSpell1=422,
    BORG8_IconSpell2=423,
    BORG8_IconSpell3=424,
    BORG8_IconSpell4=425,
    BORG8_IconSpell5=426,
    BORG8_IconSpell6=427,
    BORG8_IconSpell7=428,
    BORG8_IconSpell8=429,
    BORG8_IconSpell9=430,
    BORG8_IconSpell10=431,
    BORG8_IconSpell11=434,
    BORG8_SundailMoonA=436,
    BORG8_SundailMoonB=440,
    BORG8_SundaiCross=442,
    BORG8_GradientA=447,
    BORG8_GradientB=450,
    BORG8_GradientC=451,
    BORG8_Pixel=452,
    BORG8_2x2Pixel=453,
    //28 px soft edge square=454,
    //14px square=455,
    //Gwen map overlay=457,
    //galaxy swirl?=464,
    //Fire effect?=3424,
    //Some Face?=3514,
    //musical notes=6842,
    BORG8_IconItemAmoranth=13756,
    BORG8_IconItemAmulet1=13757,
    BORG8_IconItemAmulet2=13758,
    BORG8_IconItemAmulet3=13759,
    BORG8_IconItemAmulet4=13760,
    BORG8_IconItemChestArmor1=13761,
    BORG8_IconItemCheatArmor2=13762,
    BORG8_IconItemCheastArmor3=13763,
    BORG8_IconItemCheastArmor4=13764,
    BORG8_IconItemAxe=13765,
    BORG8_IconItemSythe=13766,
    BORG8_IconItemCirclet=13767,
    BORG8_IconItemCuccoon=13768,
    BORG8_IconItemBoot=13769,
    BORG8_IconItemBowArrow=13770,
    BORG8_IconItemCloakA=13771,
    BORG8_IconItemCloakB=13772,
    BORG8_IconItemCloakC=13773,
    BORG8_IconItemClub=13774,
    BORG8_IconItemSword=13775,
    BORG8_IconItemStaff=13776,
    BORG8_IconItem2Pads=0x35d1,
    BORG8_IconItemGem=13778,
    BORG8_IconItemGem2=13779,
    BORG8_IconItemGem3=13780,
    BORG8_IconItemLeatherGlove=13781,
    BORG8_IconItemHarp=13782,
    BORG8_IconItemBlueHat=13783,
    BORG8_IconItemKendallHat=13784,
    BORG8_IconItemLeatherCloak=13785,
    BORG8_IconItemHerb=13786,
    BORG8_IconItemHide=13787,
    BORG8_IconItemUnk=13788,
    BORG8_IconItemKey1=13789,
    BORG8_IconItemKey2=13790,
    BORG8_IconItemKey3=13791, //icon for the unused Blood/bone/skull/black keys
    BORG8_IconItemHorn=13792,
    BORG8_IconItemMace=13793,
    BORG8_IconItemParchment=13794,
    BORG8_IconItemPike=13795,
    BORG8_IconItemPotion=13797,
    BORG8_IconItemScroll=13801,
    BORG8_IconItemSicle=13802,
    BORG8_IconItemShield1=13803,
    BORG8_IconItemStaff2=13805,
    BORG8_IconItemSword2=13806,
    BORG8_IconItemSword3=13807,
    BORG8_IconItemThrowIron=13808,
    BORG8_IconSlotCloak=13815,
    BORG8_IconSlotGlove=13816,
    BORG8_IconSlotHelmet=13817,
    BORG8_IconSlotShield=13823,
    BORG8_IconSlotStaff=13824,
    BORG8_IconSlotSword=13825,
    //Spotlight?=13826,
    BORG8_BGBook2=13827,
    BORG8_BGPlaque=13828,
    BORG8_BGParchment=13829,
    BORG8_BGBookLeaf=13830,
    BORG8_BGBluPlaque=13831,
    BORG8_BGParchment2=13832,
    //2 horizontal arrows=14166,
    BORG8_RitualTitle=0x375B, //leftover of "Rituals" mechanic
    //crecent moon=14239,
    //half moon=14240,
    BORG8_CityMarkerPortSaid=14270,
    //Terminor Marker=14272,
    //Ugarit Marker=14273,
    BORG8_PortraitMinotuar=14406,
    cyclops_Hurlstar=14422,
    BORG8_PortraitHorse=14423,
    //up arrow=14544
} Borg8Enum;



//borg11: Sound samples

#define BORG11_PrecussionHitA 0x5A0
#define BORG11_PrecussionRhythmA 0x5A1
#define BORG11_PrecussionHitB 0x5A2
#define BORG11_DramaticStingA 0x5A3
#define BORG11_StringA 0x5A4
#define BORG11_TambouineA 0x5A6
#define BORG11_StringB 0x5A7
#define BORG11_HornA 0x5A8
#define BORG11_TriumphantChordA 0x5A9
#define BORG11_HornB 0x5AA
#define BORG11_PrecussionHitC 0x5AC
#define BORG11_PrecussionHitD 0x5AD
#define BORG11_PrecussionHitE 0x5AE
#define BORG11_PrecussionHitF 0x5AF
#define BORG11_PrecussionHitF 0x5B0
#define BORG11_DramaticStingB 0x5B1

#define BORG11_CymbalCrash 0x5B6

#define BORG11_DramaticStingC 0x5BB
#define BORG11_PrecussionRhythmB 0x61F
#define BORG11_ChoirA 0x625
#define BORG11_TriumphantChordB 0x631
#define BORG11_CoinsJingle 0x6F4
#define BORG11_EchoSound 0x726
#define BORG11_PageTurn 0x74C

#define BORG11_MaleGasp 0x384C


//borg12: Music/SFX
//battle tracks if using ExpPak

#define BORG12_Battle_Exp1 0x5a5
#define BORG12_Battle_Exp2 0x5aB
#define BORG12_Battle_Exp3 0x5b4
#define BORG12_Battle_Exp4 0x5b9
#define BORG12_Battle_Exp5 0x5C3
//Otherwise

#define BORG12_Battle_NoExp1 0x38de
#define BORG12_Battle_NoExp2 0x38df
#define BORG12_Battle_NoExp3 0x3b8
#define BORG12_Battle_NoExp4 0x3bd

//Cinematic music

#define BORG12_Cinematic0_1 0x601
#define BORG12_Cinematic0_2 0x608
#define BORG12_Cinematic0_3 0x60b
#define BORG12_Cinematic0_4 0x60c
#define BORG12_Cinematic0_5 0x60e
#define BORG12_Cinematic0_6 0x610
#define BORG12_Cinematic0_7 0x612
#define BORG12_Cinematic0_8 0x613
#define BORG12_Cinematic0_9 0x615
#define BORG12_Cinematic0_10 0x616
#define BORG12_Cinematic0_11 0x617
#define BORG12_Cinematic0_12 0x619
#define BORG12_Cinematic0_13 0x61a

#define BORG12_Cinematic1_1 0x61d
#define BORG12_Cinematic1_2 0x61e
#define BORG12_Cinematic1_3 0x621
#define BORG12_Cinematic1_4 0x622

#define BORG12_Cinematic2_1 0x5da
#define BORG12_Cinematic2_2 0x5db
#define BORG12_Cinematic2_3 0x5dc

#define BORG12_Cinematic3_1 0x5ed
#define BORG12_Cinematic3_2 0x5ee
#define BORG12_Cinematic3_3 0x5ef
#define BORG12_Cinematic3_4 0x5f0
#define BORG12_Cinematic3_5 0x5f1
#define BORG12_Cinematic3_6 0x5f2

#define BORG12_05ea_Exp 0x5ea
#define BORG12_05eb_NoExp 0x5eb
#define BORG12_Ehud 0x5df
#define BORG12_GwenCastle 0x5fd
#define BORG12_Ugairt 0x61b
#define BORG12_629 0x789
#define BORG12_789 0x789
#define BORG12_ErromonCaves 0x790
#define BORG12_Intro_NoExp 0x5d9 //aka Credits
#define BORG12_Intro_Exp 0x632


//SFX here

#define BORG12_ChimeScale 0x5e7
#define BORG12_CheatCorrect 0x718
#define BORG12_CheatUnused 0x720
#define BORG12_CheatFail 0x721
#define BORG12_CoinJingle 0x72d


//Borg5: Model data?

#define BORG5_SceneBoulder      0x080e
#define BORG5_Ship              0x0DBE
#define BORG5_ErromonMapChunk   0xef9
#define BORG5_CoronationScene1  0x1fe2
#define BORG5_CoronationScene2  0x2080
#define BORG5_CoronationScene3  0x21bf
#define BORG5_N64Logo           0x25a8
#define BORG5_OrianaLight       0x374a


//Borg7: actor data
#define BORG7_ship              0xdc3
#define BORG7_Alaron            0x25f9
#define BORG7_Keelin            0x2b29
#define BORG7_Chicken           0x2ef2
#define BORG7_pocho             0x32b0
#define BORG7_Zombie            0x3489
#define BORG7_Phelan            0x2808

//borg6: Animation data?

//used for the titlescreen flycam

#define BORG6_Flycam1           0x21dc
#define BORG6_Flycam2           0x21de
#define BORG6_Flycam3           0x21e2
#define BORG6_Flycam4           0x21e4
#define BORG6_Flycam5           0x21e6
#define BORG6_Flycam6           0x21e8

//cinematics

#define BORG6_Cinematic0_1      0x2219
#define BORG6_Cinematic0_2      0x226c
#define BORG6_Cinematic0_3      0x2292
#define BORG6_Cinematic0_4      0x2299
#define BORG6_Cinematic0_5      0x22a0
#define BORG6_Cinematic0_6      0x22d6
#define BORG6_Cinematic0_7      0x22ed
#define BORG6_Cinematic0_8      0x22fb
#define BORG6_Cinematic0_9      0x231c
#define BORG6_Cinematic0_10     0x2353
#define BORG6_Cinematic0_11     0x235c
#define BORG6_Cinematic0_12     0x2391
#define BORG6_Cinematic0_13     0x23bb

#define BORG6_Cinematic1_1      0x23f7
#define BORG6_Cinematic1_2      0x2413
#define BORG6_Cinematic1_3      0x238b
#define BORG6_Cinematic1_4      0x24ca

#define BORG6_Cinematic2_1      0x24ee
#define BORG6_Cinematic2_2      0x2569
#define BORG6_Cinematic2_3      0x25a2

#define BORG6_Cinematic3_1      0x1f36
#define BORG6_Cinematic3_2      0x1fe3
#define BORG6_Cinematic3_3      0x2081
#define BORG6_Cinematic3_4      0x2098
#define BORG6_Cinematic3_5      0x21c0
#define BORG6_Cinematic3_6      0x21d8

//Borg9: Map/collision data

#define BORG9_Campsite          0x185c

//Borg13: Dialouge
#define BORG13_OpeningDialog    0x362
#define BORG13_GoblinAmbush     0x365
#define BORG13_LugashIntro      0x4D1
#define BORG13_AlaronDies1      0x512
#define BORG13_AlaronDies2      0x513
#define BORG13_AlaronDies3      0x514

#define BORG13_HelpMenu         0x54b

#define BORG13_CampSafe 0x185b