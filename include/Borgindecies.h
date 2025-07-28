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

//item Icons

#define BORG8_IconItemAmoranth 0x35bc
#define BORG8_IconItemAmulet1 0x35bd
#define BORG8_IconItemAmulet2 0x35be
#define BORG8_IconItemAmulet3 0x35bf
#define BORG8_IconItemAmulet4 0x35c0
#define BORG8_IconItemChestArmor1 0x35c1
#define BORG8_IconItemChestArmor2 0x35c2
#define BORG8_IconItemChestArmor3 0x35c3
#define BORG8_IconItemChestArmor4 0x35c4
#define BORG8_IconItemAxe 0x35c5
#define BORG8_IconItemSythe 0x35c6
#define BORG8_IconItemCirclet 0x35c7
#define BORG8_IconItemRemains 0x35c8
#define BORG8_IconItemBoot 0x35c9
#define BORG8_IconItemBowArrow 0x35ca
#define BORG8_IconItemCloakA 0x35cb
#define BORG8_IconItemCloakB 0x35cc
#define BORG8_IconItemCloakC 0x35cd
#define BORG8_IconItemClub 0x35ce
#define BORG8_IconItemSword 0x35cf
#define BORG8_IconItemStaff 0x35d0
#define BORG8_IconItem2Pads 0x35d1
#define BORG8_IconItemGem 0x35d2
#define BORG8_IconItemGem2 0x35d3
#define BORG8_IconItemGem3 0x35d4
#define BORG8_IconItemLeatherGlove 0x35d5
#define BORG8_IconItemHarp 0x35d6
#define BORG8_IconItemBlueHat 0x35d7
#define BORG8_IconItemKendallHat 0x35d8
#define BORG8_IconItemLeatherHood 0x35d9
#define BORG8_IconItemHerb 0x35da
#define BORG8_IconItemHide 0x35db
#define BORG8_IconItemUnk 0x35dc
#define BORG8_IconItemKey1 0x35dd
#define BORG8_IconItemKey2 0x35de
#define BORG8_IconItemKey3 0x35df //icon for the unused Blood/bone/skull/black keys
#define BORG8_IconItemHorn 0x35e0
#define BORG8_IconItemMace 0x35e1
#define BORG8_IconItemParchment 0x35e2
#define BORG8_IconItemPike 0x35e3
#define BORG8_IconItemHalberd 0x35e4
#define BORG8_IconItemPotion 0x35e5
#define BORG8_IconItemRing1 0x35e6
#define BORG8_IconItemRing2 0x35e7
#define BORG8_IconItemRope 0x35e8
#define BORG8_IconItemScroll 0x35e9
#define BORG8_IconItemSicle 0x35ea
#define BORG8_IconItemShield1 0x35eb
#define BORG8_IconItemSpice 0x35ec
#define BORG8_IconItemStaff2 0x35ed
#define BORG8_IconItemSword2 0x35ee
#define BORG8_IconItemSword3 0x35ef
#define BORG8_IconItemThrowIron 0x35f0
#define BORG8_IconItemWand 0x35f1
#define BORG8_IconItemStormbreaker 0x35f2
#define BORG8_IconItemAsp 0x37e1
#define BORG8_IconSlotHurlstar 0x3856
#define BORG8_IconItemHockeyStick 0x38d4
#define BORG8_IconItemLightreaver 0x38d5

#define BORG8_IconSlotAmulet 0x35f3
#define BORG8_IconSlotChest 0x35f4
#define BORG8_IconSlotCirclet 0x35f5
#define BORG8_IconSlotBoot 0x35f6
#define BORG8_IconSlotCloak 0x35f7
#define BORG8_IconSlotGlove 0x35f8
#define BORG8_IconSlotHelmet 0x35f9
#define BORG8_IconSlotRing1 0x35fa
#define BORG8_IconSlotRing2 0x35fb
#define BORG8_IconSlotScroll1 0x35fc
#define BORG8_IconSlotScroll2 0x35fd
#define BORG8_IconSlotScroll3 0x35fe
#define BORG8_IconSlotShield 0x35ff
#define BORG8_IconSlotStaff 0x3600
#define BORG8_IconSlotSword 0x3601

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
    BORG8_DebugBG=0x01c5,

    
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
    BORG8_PortraitHorse=14423,
    //up arrow=14544
} Borg8Enum;



//borg11: Sound samples

#define BORG11_PrecussionHitA 0x05A0
#define BORG11_PrecussionRhythmA 0x05A1
#define BORG11_PrecussionHitB 0x05A2
#define BORG11_DramaticStingA 0x05A3
#define BORG11_StringA 0x05A4
#define BORG11_TambouineA 0x05A6
#define BORG11_StringB 0x05A7
#define BORG11_HornA 0x05A8
#define BORG11_TriumphantChordA 0x05A9
#define BORG11_HornB 0x05AA
#define BORG11_PrecussionHitC 0x05AC
#define BORG11_PrecussionHitD 0x05AD
#define BORG11_PrecussionHitE 0x05AE
#define BORG11_PrecussionHitF 0x05AF
#define BORG11_PrecussionHitF 0x05B0
#define BORG11_DramaticStingB 0x05B1

#define BORG11_CymbalCrash 0x05B6

#define BORG11_DramaticStingC 0x05BB
#define BORG11_PrecussionRhythmB 0x061F
#define BORG11_ChoirA 0x0625
#define BORG11_TriumphantChordB 0x0631
#define BORG11_CoinsJingle 0x06F4
#define BORG11_EchoSound 0x0726
#define BORG11_PageTurn 0x074C

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
#define BORG12_GwerniaCastle 0x5fd
#define BORG12_Ugairt 0x61b
#define BORG12_629 0x789
#define BORG12_789 0x789
#define BORG12_ErromonCaves 0x790
#define BORG12_Intro_NoExp 0x5d9 //aka Credits
#define BORG12_Intro_Exp 0x632


//SFX here

#define BORG12_ChimeScale 0x5e7
#define BORG12_LevelUp 0x5e8
#define BORG12_CheatCorrect 0x718
#define BORG12_CheatUnused 0x720
#define BORG12_CheatFail 0x721
#define BORG12_CoinJingle 0x72d
#define BORG12_CoinJingle2 0x72e
#define BORG12_CursorChirp 0x73d

//Borg5: Model data

#define BORG5_CombatMarker      0x0794
#define BORG5_SpellMarker       0x0797
#define BORG5_SuitArmorProp     0x079E
#define BORG5_GwernBookshelfA   0x07F9
#define BORG5_GwernBookshelfB   0x07FC
#define BORG5_SceneBoulder      0x080e
#define BORG5_BunkBedA          0x082A
#define BORG5_WallTorchA        0x086C
#define BORG5_HangingCorpseA    0x08C6
#define BORG5_LootChestExploded 0x0905
#define BORG5_LootChestClosed   0x0907
#define BORG5_LootChestOpened   0x0909
#define BORG5_LootCloverPatch   0x09F2
#define BORG5_LootKendallsHat   0x0A26
#define BORG5_GwernHeroPlaque   0x0AE1
#define BORG5_LootBagExploded   0x0BA8
#define BORG5_LootBagClosed     0x0BAA
#define BORG5_LootBagOpened     0x0BAC
#define BORG5_LootPepperPlant   0x0BD9
#define BORG5_GwernCastleStairs 0x0BE6
#define BORG5_GwernLibDeskA     0x0BF2
#define BORG5_GwernLibDeskB     0x0BF4
#define BORG5_NightstandA       0x0C14
#define BORG5_TriangleTable     0x0C16
#define BORG5_Ship              0x0DBE
#define BORG5_Teleporter        0x0C54
#define BORG5_YorwoodHouseA     0x0CC7
#define BORG5_ErromonMapChunk   0x0ef9
#define BORG5_CandleabraA       0x185A
#define BORG5_CoronationScene1  0x1fe2
#define BORG5_CoronationScene2  0x2080
#define BORG5_CoronationScene3  0x21bf
#define BORG5_N64Logo           0x25a8
#define BORG5_OrianaLight       0x374a


//Borg7: Animated model data

#define BORG7_PauseMenu         0x0e6b
#define BORG7_ship              0x0dc3
#define BORG7_Alaron            0x25f9
#define BORG7_Keelin            0x2b29
#define BORG7_Chicken           0x2ef2
#define BORG7_pocho             0x32b0
#define BORG7_Zombie            0x3489
#define BORG7_Phelan            0x2808

//borg6: Animation data

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
#define BORG13_OpeningDialog    0x0362
#define BORG13_GoblinAmbush     0x0365
#define BORG13_LugashIntro      0x04D1
#define BORG13_AlaronDies1      0x0512
#define BORG13_AlaronDies2      0x0513
#define BORG13_AlaronDies3      0x0514

#define BORG13_HelpMenu         0x054b

#define BORG13_CampSafe         0x185b