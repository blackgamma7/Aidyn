//list of indedcies  for strings referenced by gGlobals.commonStrings
enum CommonString{
COMMONSTRING_LootType0,    // Chest
COMMONSTRING_LootType1,    // Bag
COMMONSTRING_LootType2,    // Box
COMMONSTRING_LootType3,    // Barrel
COMMONSTRING_LootType4,    // Herbs
COMMONSTRING_LootType5,    // Spices
COMMONSTRING_LootType6,    // Gem Stones
COMMONSTRING_LootType7,    // Treasure Pile
COMMONSTRING_SkillFailLock,    // You failed to pick the lock! Better luck next time!
COMMONSTRING_SkillFailTrap,    // You failed to disarm the trap! Better luck next time!
COMMONSTRING_SkillFailRepair,    // You failed to fix it! Better luck next time!
COMMONSTRING_SkillFailScout,    // You failed to estimate the size of the monster party
COMMONSTRING_SkillFailCharm,    // You failed to change the monster's reaction to your party. Better luck next time!
COMMONSTRING_SkillFailWeak,    // The party member chosen to complete that task is too weak at the moment!
COMMONSTRING_SkillFailGeneral,    // No luck this time. The task was not completed!
COMMONSTRING_SkillSuccess,    // Task completed successfully!
COMMONSTRING_SkillFailComponents,    // You don't have the proper components to complete that task
COMMONSTRING_HealFailMaxHP,    // The party member you have selected to heal is already at max health!
COMMONSTRING_HealFailMaxStats,    // Stats are already at maximum!
COMMONSTRING_HealFailLowSkill,    // You need more practice in that skill!
COMMONSTRING_Ok00,    // Ok
COMMONSTRING_EquipFailGeneral,    // You cannot equip that item!
COMMONSTRING_EquipFailAspect,    // Your Aspect prevents you from equipping that item!
COMMONSTRING_EquipFailCombat,    // You cannot equip that item in combat!
COMMONSTRING_EquipFailRings,    // You cannot wear any more rings!
COMMONSTRING_EquipFailPS,    // You do not have the minimum PS required to equip that item!
COMMONSTRING_EquipFailIN,    // You do not have the minimum IN required to equip that item!
COMMONSTRING_ItemSelect,    // Press A to select an item
COMMONSTRING_ItemPickup,    // Press A to pick up an item
COMMONSTRING_BoolFalse,    // false
COMMONSTRING_BoolTrue,    // true
COMMONSTRING_Yes00,    // Yes
COMMONSTRING_No00,    // No
COMMONSTRING_NoController00,    // Warning
COMMONSTRING_NoController01,    // No Controller
COMMONSTRING_NoController02,    // Please turn off the control
COMMONSTRING_NoController03,    // deck and connect a controller
COMMONSTRING_NoController04,    // to socket one
COMMONSTRING_CheatOption0,    // appear
COMMONSTRING_CheatOption1,    // check
COMMONSTRING_CheatOption2,    // set
COMMONSTRING_CheatOption3,    // lock set
COMMONSTRING_CheatOption4,    // lock check
COMMONSTRING_CheatOption5,    // trap set
COMMONSTRING_CheatOption6,    // trap check
COMMONSTRING_CheatOption7,    // chest open
COMMONSTRING_CheatOption8,    // chest trap
COMMONSTRING_VoxelType0,    // SCENE
COMMONSTRING_VoxelType1,    // CONTAINER
COMMONSTRING_VoxelType2,    // LIGHT
COMMONSTRING_VoxelType3,    // AUDIO
COMMONSTRING_VoxelType4,    // WANDERNODE
COMMONSTRING_VoxelType5,    // PARTY
COMMONSTRING_VoxelType6,    // REFPOINT
COMMONSTRING_VoxelType7,    // TELEPORTER
COMMONSTRING_VoxelType8,    // CAMERA
COMMONSTRING_VoxelType9,    // DIALOGUE
COMMONSTRING_VoxelTypeA,    // TRIGGER
COMMONSTRING_VoxelTypeB,    // SAVEPOINT
COMMONSTRING_VoxelTypeC,    // CODE
COMMONSTRING_VoxelTypeCount,    // NUMOBJECTS
COMMONSTRING_CheatOptions,    // Object Type
COMMONSTRING_CheatOption10,    // Appear
COMMONSTRING_CheatOption11,    // Check
COMMONSTRING_CheatOption12,    // Set
COMMONSTRING_CheatOption13,    // Monster Party
COMMONSTRING_CheatOption14,    // Teleporter
COMMONSTRING_ChestEmpty,    // The container is empty!
COMMONSTRING_ChestGold,    // GOLD:
COMMONSTRING_ChestDesc,    // DESCRIPTION:
COMMONSTRING_ChestInv,    // INVENTORY:
COMMONSTRING_Door,    // Door
COMMONSTRING_DoorOpen,    // Open %s
COMMONSTRING_DoorTrap,    // There was a trap!
COMMONSTRING_DoorTrapNone,    // No traps!
COMMONSTRING_DoorTrapDisable,    // A trap was successfully disarmed!
COMMONSTRING_DoorTrapFail,    // You failed to disarm the trap!
COMMONSTRING_DoorTrapTheif,    // Thief
COMMONSTRING_DoorTrapRank,    // Rank:
COMMONSTRING_ContPakInsert,    // Please insert a Controller Pak and press A.
COMMONSTRING_ContPakRemoved,    // The Controller Memory Pak has been removed. Please replace it and Press A
COMMONSTRING_ContPakDamaged,    // The Controller Pak is damaged. Would you like to repair it?
COMMONSTRING_ContPakNew,    // A new Controller Pak has been detected. Continue?
COMMONSTRING_ContPakEmpty,    // There are no games on the currently installed Controller Pak!
COMMONSTRING_ContPakOverwrite,    // Are you sure you'd like to save over that game?
COMMONSTRING_ContPakLoading,    // Loading data from the Controller Pak.
COMMONSTRING_LockpickWho,    // Select a party member to perform the task
COMMONSTRING_LockpickSuccess,    // You've just successfully picked a lock!
COMMONSTRING_LockpickTired,    // The party member chosen to complete that task is too weak at the moment!
COMMONSTRING_SkillFailGeneral1,    // No luck this time. The task was not completed!
COMMONSTRING_SkillSuccess1,    // Task completed successfully!
COMMONSTRING_SkillFailComponents1,    // You don't have the proper components to complete that task
COMMONSTRING_HealFailMaxHP1,    // The party member you have selected to heal is already at max health!
COMMONSTRING_HealFailMaxStats1,    // Stats are already at maximum!
COMMONSTRING_HealFailLowSkill1,    // You need more practice in that skill!
COMMONSTRING_Ok01,    // Ok
COMMONSTRING_EquipFailGeneral1,    // You cannot equip that item!
COMMONSTRING_EquipFailAspect1,    // Your Aspect prevents you from equipping that item!
COMMONSTRING_EquipFailCombat1,    // You cannot equip that item in combat!
COMMONSTRING_EquipFailRings1,    // You cannot wear any more rings!
COMMONSTRING_EquipFailPS1,    // You do not have the minimum PS required to equip that item!
COMMONSTRING_EquipFailIN1,    // You do not have the minimum IN required to equip that item!
COMMONSTRING_NoController10,    // Warning
COMMONSTRING_NoController11,    // No Controller
COMMONSTRING_NoController12,    // Please turn off the control
COMMONSTRING_NoController13,    // deck and connect a controller
COMMONSTRING_NoController14,    // to socket one
COMMONSTRING_DebugStates0,    // All Game States
COMMONSTRING_DebugStates1,    // Appear States
COMMONSTRING_DebugStates2,    // Check States
COMMONSTRING_DebugStates3,    // Teleporter Lock States
COMMONSTRING_DebugStates4,    // Teleporter Trap States
COMMONSTRING_DebugStates5,    // Teleporter Secret States
COMMONSTRING_DebugStates6,    // Container Open States
COMMONSTRING_DebugStates7,    // Container Explode States
COMMONSTRING_DebugStates8,    // Monster Check States
COMMONSTRING_DebugStates9,    // Dialogue Triggers
COMMONSTRING_DebugStatesA,    // Triggers
COMMONSTRING_DebugStatesB,    // Reference Objects
COMMONSTRING_Off,    // Off
COMMONSTRING_On,    // On
COMMONSTRING_MemPakNoMem0,    // There is not enough memory on the installed Controller Pak to save a game. Would you like to delete an existing note to make enough room to save?
COMMONSTRING_MemPakNoMem1,    // First Mage requires a Controller Pak with either an existing First Mage game or one free note in order to save. Continue without the ability to save?
COMMONSTRING_MemPakNoPak0,    // First Mage requires a Controller Pak to save. Continue without one?
COMMONSTRING_MemPakAddNewPakReset,    // Please insert a new Controller Pak and reset the game.
COMMONSTRING_MemPakAddPakReset,    // Please insert a Controller Pak and reset the game.
COMMONSTRING_MemPakReading,    // Reading from Controller Pak. Please wait.
COMMONSTRING_MemPakAddPakPressA,    // Please insert a Controller Pak and press A.
COMMONSTRING_ContPakDamaged1,    // The Controller Pak is damaged. Would you like to repair it?
COMMONSTRING_ContPakRemoved1,    // The Controller Pak has been removed. Please reinsert the Controller Pak and press A to continue.
COMMONSTRING_ContPakNew1,    // A new Controller Pak is attached. Continue?
COMMONSTRING_ContPakDamaged2,    // The Controller Pak currently attached is damaged. Insert another Controller Pak and press A to continue.
COMMONSTRING_DebugCameraWalk,    // Walk
COMMONSTRING_DebugCameraRun,    // Run
COMMONSTRING_DebugCameraCut,    // Cut to Camera
COMMONSTRING_DebugCameraSine,    // Sine to
COMMONSTRING_DebugCameraAngle,    // Angle to
COMMONSTRING_DebugCameraPan,    // Pan to
COMMONSTRING_DebugCameraOn,    // On
COMMONSTRING_DebugCameraCutPOV,    // Cut to POV
COMMONSTRING_DebugCameraSinePOV,    // Sine to POV
COMMONSTRING_DebugCameraAnglePOV,    // Angle to POV
COMMONSTRING_DebugCameraPanPOV,    // Pan to POV
COMMONSTRING_DebugCameraOnPOV,    // On POV
COMMONSTRING_DebugCameraFace,    // Face
COMMONSTRING_DebugCameraTrackOn,    // Track On
COMMONSTRING_DebugCameraFade,    // Fade
COMMONSTRING_Month00,    // THE BLOOMING SEASON
COMMONSTRING_Month01,    // LATE BLOOMING SEASON
COMMONSTRING_Month02,    // THE EARTH SEASON
COMMONSTRING_Month03,    // LATE EARTH SEASON
COMMONSTRING_Month04,    // THE SUMMER SEASON
COMMONSTRING_Month05,    // LATE SUMMER SEASON
COMMONSTRING_Month06,    // THE GOLDEN SEASON
COMMONSTRING_Month07,    // LATE GOLDEN SEASON
COMMONSTRING_Month08,    // THE FALL SEASON
COMMONSTRING_Month09,    // LATE FALL SEASON
COMMONSTRING_Month10,    // THE WINTER SEASON
COMMONSTRING_Month11,    // LATE WINTER SEASON
COMMONSTRING_OptionsNewGame,    // New Game
COMMONSTRING_OptionsLoadGame,    // Load Game
COMMONSTRING_OptionsOptions,    // Options
COMMONSTRING_OptionsTheatre,    // Theater
COMMONSTRING_OptionsAudio,    // AUDIO
COMMONSTRING_OptionsSound,    // SOUND:
COMMONSTRING_OptionsMusic,    // MUSIC:
COMMONSTRING_OptionsGraphics,    // GRAPHICS
COMMONSTRING_OptionsGraphics0,    // Normal Resolution
COMMONSTRING_OptionsGraphics1,    // High Resolution
COMMONSTRING_OptionsGraphics2,    // 32 Bit Color
COMMONSTRING_OptionsGame,    // GAME
COMMONSTRING_OptionsRename,    // RENAME CHARACTER
COMMONSTRING_NoCutscens,    // No cinematics yet.
COMMONSTRING_OptionsHelp,    // Help
    // New Controller Pak detected
    // Retry (insert  the old Controller Pak)
    // Continue
    // Controller Pak is corrupt
    // Repair (Data may be lost)
    // Continue without loading
    // Insert new Controller Pak (Retry)
    // The Controller in slot 0 does not appear to be connected. Please reconnect the Controller to socket 0
    // Retry
    // Controller Pak is Full. Game cannot be saved. Aidyn Chronicles: The First Mage requires 28 pages and 1 note to save.
    // Insert a new Controller Pak or:
    // Retry
    // Manage Controller Pak
    // Continue without saving
    // Insert new Controller Pak
    // Create new game
    // The game saved in Note %d of the Controller Pak is corrupt.\nInsert a new Controller Pak or:
    // Delete the corrupt game
    // Retry
    // Continue (ignore it)
    // The data saved in note %d is corrupt
    // Retry
    // Delete the corrupt data
    // Exit without saving
    // The file you are trying to save already exists
    // Retry
    // Exit
    // There is a fatal error with the Controller Pak.
    // Exit
    // No Controller Pak detected.\nInsert Controller Pak or:
    // Retry (insert a Controller Pak)
    // Continue without saving
    // Delete this game note?
    // Yes
COMMONSTRING_DebugBigMenu00=207,    // All game states
COMMONSTRING_DebugBigMenu01,    // Reference Object game states
COMMONSTRING_DebugBigMenu02,    // Game state cheats
COMMONSTRING_DebugBigMenu03,    // Add party members
COMMONSTRING_DebugBigMenu04,    // Select super party options
COMMONSTRING_DebugBigMenu05,    // Prescripted Dialogue Test
COMMONSTRING_DebugBigMenu06,    // Toggle the custom game state list
COMMONSTRING_DebugBigMenu07,    // Save Game
COMMONSTRING_DebugBigMenu08,    // Load Game
COMMONSTRING_DebugBigMenu09,    // Controller Pak Menu
COMMONSTRING_DebugBigMenu10,    // Add all of the weapons to the inventory
COMMONSTRING_DebugBigMenu11,    // Add all of the items to the inventory
COMMONSTRING_DebugBigMenu12,    // Add all of the armor to the inventory
COMMONSTRING_DebugBigMenu13,    // Add all of the potions to the inventory
COMMONSTRING_DebugBigMenu14,    // Clear everything out of the inventory
COMMONSTRING_DebugBigMenu15,    // Load only the inventory from a saved game
COMMONSTRING_DebugBigMenu16,    // Toggle some settings
COMMONSTRING_DebugBigMenu17,    // Toggle Monster Attack
COMMONSTRING_DebugBigMenu18,    // Turn off everything but teleporters
COMMONSTRING_DebugBigMenu19,    // Access Database
COMMONSTRING_DebugBigMenu20,    // Hunt for bad reference objects
COMMONSTRING_DebugDBArmor,    // ARMOR
COMMONSTRING_DebugDBShield,    // SHIELD
COMMONSTRING_DebugDBItem,    // ITEM
COMMONSTRING_DebugDBWeapon,    // WEAPON
    // Resting
    // Press Start
    // Random
    // Sneak
    // Ambush
    // Stop
    // Sneak
    // Walk
    // Run
COMMONSTRING_ElementNone=241,    // None
COMMONSTRING_ElementEarth,    // Earth
COMMONSTRING_ElementSolar,    // Solar
COMMONSTRING_ElementPhys,    // Physical
COMMONSTRING_ElementNecro,    // Necromancy
COMMONSTRING_ElementFire,    // Fire
COMMONSTRING_ElementLunar,    // Lunar
COMMONSTRING_ElementNaming,    // Naming
COMMONSTRING_ElementWater,    // Water
COMMONSTRING_ElementMagic,    // Magic
COMMONSTRING_ElementAir,    // Air
COMMONSTRING_ElementStar,    // Star
COMMONSTRING_ElementElem,    // Elemental
COMMONSTRING_ElementChaos,    // Chaos
COMMONSTRING_ElementCut,    // Cutting
COMMONSTRING_ElementSmash,    // Smashing
COMMONSTRING_ElementHoly,    // Holy
COMMONSTRING_Ok05,    // OK
COMMONSTRING_SpellFailCant,    // You cannot cast that spell!
COMMONSTRING_SpellFailCantNow,    // You cannot cast that spell now!
COMMONSTRING_SpellFailDay,    // Spell can only be cast in the day!
COMMONSTRING_SpellFailNight,    // Spell can only be cast at night!
COMMONSTRING_SpellFailCharges,    // There are no Spell charges left!
COMMONSTRING_SpellFailComponent,    // Missing spell component!
COMMONSTRING_SpellFailName,    // Target must have a True Name!
COMMONSTRING_SpellFailLarge,    // The target is too large!
COMMONSTRING_SpellFailSolar,    // Target must have Solar aspect!
COMMONSTRING_SpellFailLunar,    // Target must have Lunar aspect!
COMMONSTRING_SpellFailST,    // Not enough ST to cast spell!
COMMONSTRING_SpellFail,    // The Spell failed!
COMMONSTRING_SkillAlchemist,    // Alchemist
COMMONSTRING_SkillDiplomat,    // Diplomat
COMMONSTRING_SkillHealer,    // Healer
COMMONSTRING_SkillLoremaster,    // Loremaster
COMMONSTRING_SkillMechanic,    // Mechanic
COMMONSTRING_SkillMerchant,    // Merchant
COMMONSTRING_SkillRanger,    // Ranger
COMMONSTRING_SkillStealth,    // Stealth
COMMONSTRING_SkillThief,    // Thief
COMMONSTRING_SkillTroubadour,    // Troubadour
COMMONSTRING_SkillWarrior,    // Warrior
COMMONSTRING_SkillWizard,    // Wizard
COMMONSTRING_WeaponBite,    // Bite
COMMONSTRING_WeaponBreath,    // Breath
COMMONSTRING_WeaponClaw,    // Claw
COMMONSTRING_WeaponHafted,    // Hafted
COMMONSTRING_WeaponMissle,    // Missile
COMMONSTRING_WeaponPole,    // Pole
COMMONSTRING_WeaponSpit,    // Spit
COMMONSTRING_WeaponSting,    // Sting
COMMONSTRING_WeaponSword,    // Sword
COMMONSTRING_WeaponThrown,    // Thrown
COMMONSTRING_WeaponTusk,    // Tusk
COMMONSTRING_AspectNone,    // Neutral
COMMONSTRING_AspectLunar,    // Lunar
COMMONSTRING_AspectSolar,    // Solar
COMMONSTRING_SchoolChaos,    // Chaos
COMMONSTRING_SchoolElemental,    // Elemental
COMMONSTRING_SchoolNaming,    // Naming
COMMONSTRING_SchoolNecro,    // Necromancy
COMMONSTRING_SchoolNone,    // Neutral
COMMONSTRING_SchoolStar,    // Star
COMMONSTRING_StatINT,    // Intelligence
COMMONSTRING_StatWIL,    // Willpower
COMMONSTRING_StatDEX,    // Dexterity
COMMONSTRING_StatEND,    // Endurance
COMMONSTRING_StatSTR,    // Strength
COMMONSTRING_StatSTAM,    // Stamina
COMMONSTRING_StatLV,    // Level
COMMONSTRING_HumidNone,    // Clear
COMMONSTRING_HumidFog,    // Fog
COMMONSTRING_HumidRain,    // Rain
COMMONSTRING_TimeOfDayDawn,    // Dawn
COMMONSTRING_TimeOfDayMorning,    // Morning
COMMONSTRING_TimeOfDayAfternoon,    // Afternoon
COMMONSTRING_TimeOfDayDusk,    // Dusk
COMMONSTRING_TimeOfDayNight,    // Night
COMMONSTRING_MoonPhaseDark,    // Dark
COMMONSTRING_MoonPhaseCresent,    // Crescent
COMMONSTRING_MoonPhaseHalf,    // Half
COMMONSTRING_MoonPhaseFull,    // Full
COMMONSTRING_StormDark,    // Dark
COMMONSTRING_StormStorm,    // Storm
COMMONSTRING_StormEarth,    // Earth
COMMONSTRING_StormFire,    // Fire
COMMONSTRING_StormLight,    // Light
COMMONSTRING_StormLight,    // Water
COMMONSTRING_DayMon,    // Moonday
COMMONSTRING_DayTues,    // Tunesday
COMMONSTRING_DayWeds,    // Weirdday
COMMONSTRING_DayThurs,    // Thorsday
COMMONSTRING_DayFri,    // Fryday
COMMONSTRING_DaySat,    // Saturnday
COMMONSTRING_DaySun,    // Sunday
    // Clear
    // Rough
    // Forest
    // Desert
    // Marsh
    // Mountains
    // Barrow
    // Sea
    // None
    // Rain
    // Snow
COMMONSTRING_Collide00=346,    // Default
COMMONSTRING_Collide01,    // Collision Player And Camera
COMMONSTRING_Collide02,    // Collision Player
COMMONSTRING_Collide03,    // Snow
COMMONSTRING_Collide04,    // Grass
COMMONSTRING_Collide05,    // Sand
COMMONSTRING_Collide06,    // Mucky
COMMONSTRING_Collide07,    // Sizzle
COMMONSTRING_Collide08,    // Cave
COMMONSTRING_Collide09,    // Wood
COMMONSTRING_Collide10,    // WoodEcho
COMMONSTRING_Collide11,    // Stone
COMMONSTRING_Collide12,    // StoneEcho
COMMONSTRING_Collide13,    // StoneHugeEcho
COMMONSTRING_Collide14,    // Water
COMMONSTRING_Collide15,    // Trans Snow
COMMONSTRING_Collide16,    // Trans Grass
COMMONSTRING_Collide17,    // Trans Sand
COMMONSTRING_Collide18,    // Trans Mucky
COMMONSTRING_Collide19,    // Trans Sizzle
COMMONSTRING_Collide20,    // Trans Cave
COMMONSTRING_Collide21,    // Trans Wood
COMMONSTRING_Collide22,    // Trans WoodEcho
COMMONSTRING_Collide23,    // Trans Stone
COMMONSTRING_Collide24,    // Trans StoneEcho
COMMONSTRING_Collide25,    // Trans StoneHugeEcho
    // Are you sure you would like to delete that game?
    // Delete
    // Cancel
    // Invalid! This shouldn't happen
    // Bad data
    // Save Game
    // Flee
COMMONSTRING_DoorSecret=379,    // You've just discovered a secret door!
COMMONSTRING_ContPakNote,    // Note
COMMONSTRING_ContPakExt,    // Ext
COMMONSTRING_ContPakPages,    // Pages
COMMONSTRING_ContPakPagesFree,    // Unused Pages:
COMMONSTRING_PriceAppraise0,    // This is highway robbery!
COMMONSTRING_PriceAppraise1,    // Ouch! That's pretty expensive
COMMONSTRING_PriceAppraise2,    // That's a bit more than the usual price
COMMONSTRING_PriceAppraise3,    // The price is about what you'd expect
COMMONSTRING_PriceAppraise4,    // This is less than you'd expect to pay, but not much
COMMONSTRING_PriceAppraise5,    // This is a really good price
COMMONSTRING_PriceAppraise6,    // What an amazing bargain!
COMMONSTRING_ContPakName,    // Name
COMMONSTRING_ContPakFull01,    // Not enough pages on the Controller Pak to save. Aidyn Chronicles: The First Mage requires 28 pages and 1 note to save.\nInsert a new Controller Pak or:
COMMONSTRING_ContPakFull02,    // There are still not enough pages to save.
COMMONSTRING_ContPakFull03,    // Controller Pak is still full.
    // New Controller Pak detected.
    // Continue
    // Controller Pak is corrupt.\nInsert a new Controller Pak or:
    // Controller Pak is physically damaged.\nInsert a new Controller Pak or:
    // Repair (Data may be lost)
    // Insert new Controller Pak (Retry)
    // Error while reading from the Controller Pak. Please ensure that the Controller and the Controller Pak are inserted correctly.
    // Continue without saving
    // Retry
    // Insert new Controller Pak
    // No Controller Pak detected.\nInsert a Controller Pak or:
    // Retry (insert a Controller Pak)
    // Repair Successful
    // Repair Failed
    // Insert a new Controller Pak or:
    // Empty
    // Are you sure you would like to save over that game?
    // Overwrite
    // Controller Pak is corrupt.\nInsert a new Controller Pak or:
    // Controller Pak is physically damaged.\nInsert a new Controller Pak or:
    // Repair (data may be lost)
    // Continue without saving
    // Insert new Controller Pak (Retry)
    // Error while reading from the Controller Pak. Please ensure that the Controller and the Controller Pak are inserted correctly or:
    // Repair Failed\nInsert new Controller Pak or:
    // Repair Successful
    // Retry
    // Insert new Controller Pak
    // Game successfully saved.
    // Load
    // Save
    // Delete
    // Exit
COMMONSTRING_TrapMenuExit=427,    // Exit
COMMONSTRING_TrapMenuDisarm,    // Disarm
COMMONSTRING_TrapMenuSuccess,    // Trap sucessfully disarmed
COMMONSTRING_TrapMenuLevel0,    // slightly
COMMONSTRING_TrapMenuLevel1,    // moderately
COMMONSTRING_TrapMenuLevel2,    // very
COMMONSTRING_TrapMenuLevel,    // There's a %s dangerous trap!
COMMONSTRING_TrapMenuDamage,    // %s took %d damage!
COMMONSTRING_TrapMenuBoom,    // The trap exploded!
COMMONSTRING_InvalidMember,    // One of more of the party's members are invalid.
COMMONSTRING_HealMenuShadow,    // The Shadow's presence prevents all healing.
COMMONSTRING_HealMenuFail,    // %s failed to complete the task.
COMMONSTRING_HealMenuMaxHP,    // %s already at max health.
COMMONSTRING_HealMenuHealBy,    // %s heals %s by %d.
COMMONSTRING_LearnMagicOnlyWizard,    // Only wizards can learn spells.
COMMONSTRING_LearnMagicKnows,    // %s already knows that spell.
COMMONSTRING_LearnMagicMoreWizard,    // You need a higher wizard rank to learn this spell.
COMMONSTRING_LearnMagicWrongSchool,    // You cannot learn this spell as you are of the wrong school.
COMMONSTRING_LearnMagicLearned,    // %s has learned %s.
COMMONSTRING_RestoredXsYByZ,    // %s's %s restored by %d
COMMONSTRING_LockpickFailParty,    // The party could not pick the lock!
COMMONSTRING_LockpickFailLV0,    // far
COMMONSTRING_LockpickFailLV1,    // a little
COMMONSTRING_LockpickFailLV2,    // definitely
COMMONSTRING_LockpickFailLV,    // The lock is %s beyond the ability of %s to pick.
COMMONSTRING_LockpickFailStam,    // %s is too weak to pick the lock.
COMMONSTRING_LockpickSuccess,    // %s successfully picks the lock.
COMMONSTRING_AlchemyMain,    // Perform Alchemy
COMMONSTRING_AlchemyPotionFail,    // You failed to create the Potion.
COMMONSTRING_AlchemyPotionSuccess,    // Potion successfully created.
COMMONSTRING_AlchemyPotionComponents,    // You do not have the right components to create that potion.
COMMONSTRING_AlchemyFlaskFail,    // You failed to create the Flask.
COMMONSTRING_AlchemyFlaskSuccess,    // Flask successfully created.
COMMONSTRING_AlchemyFlaskComponents,    // You do not have the right components to create that flask.
COMMONSTRING_ArmorcraftComponents,    // You do not have the components to create any armor.
COMMONSTRING_ArmorcraftMain,    // Create Armor
COMMONSTRING_ArmorcraftFail,    // You failed to create the armor.
COMMONSTRING_ArmorcraftSuccess,    // Armor successfully created.
COMMONSTRING_HealTaskMain,    // Healer Tasks
COMMONSTRING_HealTaskHands,    // Lay On Hands
COMMONSTRING_HealTaskHerbs,    // Heal With Herbs
COMMONSTRING_HealTaskRestore,    // Restore
COMMONSTRING_HealTaskHP,    // Health (%d / %d)
COMMONSTRING_HealTaskMaxed,    // %s's %s at max.
COMMONSTRING_SellYForX,    // I'll give you %ld gold for that %s.
COMMONSTRING_DropXConfirm,    // Are you sure you wish to drop %s?
COMMONSTRING_SellNo,    // No, thanks.
COMMONSTRING_DropNo,    // Oops!  No way.
COMMONSTRING_SellYes,    // Sure, here it is.
COMMONSTRING_DropYes,    // Drop it.
COMMONSTRING_SellXMany,    // I will sell %d of them.
COMMONSTRING_DropXMany,    // Drop %d of them.
COMMONSTRING_SellAll,    // I will sell all of them.
COMMONSTRING_DropAll,    // Drop all of them.
COMMONSTRING_HoursXYZ,    // Hours: %u:%u:%u
COMMONSTRING_GotXGold,    // You just picked up %d gold!
COMMONSTRING_NotContPak01,    // Unsupported Device Detected.\nInsert a Controller Pak or:
COMMONSTRING_NotContPak02,    // Insert a Controller Pak
COMMONSTRING_LeaveItemsConfirm,    // There are still items that you have not picked up!  Are you sure you wish to exit?
COMMONSTRING_LeaveItemsNo,    // No, I changed my mind.
COMMONSTRING_LeaveItemsYes,    // Yes, leave them.
COMMONSTRING_CombatPotionPrompt,    // To use that potion, exit the inventory menu, press and hold the ƒ### button and select it from the popup menu.
COMMONSTRING_CombatEquipPrompt,    // That item cannot be equipped until that person's turn
COMMONSTRING_CombatUnequipPrompt,    // That item cannot be removed until that person's turn
COMMONSTRING_EarnedExp,    // Each member earned %ld XP.
COMMONSTRING_LevelUp,    // %s gained a level!
COMMONSTRING_ExpCostMax,    // XP Cost: MAX
COMMONSTRING_ExpCost,    // XP Cost: %lu
COMMONSTRING_ExpRemain,    // XP Remaining: %lu
COMMONSTRING_JournalEmpty,    // No entries have been made in the journal.
COMMONSTRING_NewSpellPrompt,    // You've learned a new spell! To select a spell in combat, press and hold the „### button. For more info, see the help menu.
COMMONSTRING_SpellWizardOnly,    // Only wizards can learn spells.
COMMONSTRING_SpellTeacherMax,    // I cannot teach you further in that spell.
COMMONSTRING_SpellWizardLow,    // Your wizard rank is not high enough to learn this spell.
COMMONSTRING_SpellWrongSchool,    // You cannot learn this spell as you are of the wrong school.
COMMONSTRING_SpellExpGCost,    // You need %ld XP and %ld gold to train this spell.
COMMONSTRING_SpellExpCost,    // You need %ld XP to train this spell.
COMMONSTRING_SpellExpGCostConfirm,    // Are you sure you wish to train this for %ld XP and %ld gold?
COMMONSTRING_SpellExpCostConfirm,    // Are you sure you wish to train this for %ld XP?
COMMONSTRING_ExpToSpend,    // XP Remaining:
COMMONSTRING_ExpTotal,    // Total XP:
COMMONSTRING_ExpTNL,    // Next Level:
COMMONSTRING_ExpMax,    // MAX
COMMONSTRING_StatTrainMax,    // You cannot train this status any further.
COMMONSTRING_StatTrainCost,    // You need %ld XP to train this status.
COMMONSTRING_StatTrainConfirm,    // Are you sure you wish to train this for %ld XP?
COMMONSTRING_SkillTrainCant,    // You cannot learn this skill.
COMMONSTRING_SkillTrainCantTeach,    // I cannot teach you further in that skill.
COMMONSTRING_SkillTrainMax,    // You cannot train this skill any further.
COMMONSTRING_SkillTrainExpGCost,    // You need %ld XP and %ld gold to train this skill.
COMMONSTRING_SkillTrainExpCost,    // You need %ld XP to train this skill.
COMMONSTRING_SkillTrainExpGCostConfirm,    // Are you sure you wish to train this for %ld XP and %ld gold?
COMMONSTRING_SkillTrainExpCostConfirm,    // Are you sure you wish to train this for %ld XP?
COMMONSTRING_GoldCost,    // Gold Cost: %lu
COMMONSTRING_PotionFirstPrompt,    // You've acquired a potion! To select a potion in combat, press and hold the ƒ### button. For more info, see the help menu.
COMMONSTRING_LootNone,    // Nothing there.
COMMONSTRING_CantAfford,    // You cannot afford this item.
COMMONSTRING_ItemFull,    // You cannot hold any more of that item.
COMMONSTRING_InventoryFull,    // The party's inventory is full.
COMMONSTRING_MerchantRefuse,    // I do not want that item.
COMMONSTRING_ItemCantDrop,    // You cannot drop that item.
COMMONSTRING_UnequipToSell,    // You must unequip that to sell it.
COMMONSTRING_UnequipToDrop,    // You must unequip that to drop it.
COMMONSTRING_FoundXGold,    // Found: %lu gold.
COMMONSTRING_ItemGoldValue,    // Value: %lu
COMMONSTRING_GetKeyItem,    // You have a feeling that there's something you really need in here.
COMMONSTRING_WinWizard,    // Min. Wizard Rank: %d
COMMONSTRING_Requires,    // Requires: 
COMMONSTRING_Skill,    // Skill
COMMONSTRING_Aspect,    // Aspect
COMMONSTRING_MinSTR,    // Min. Strength
COMMONSTRING_BaseHit,    // Base Hit
COMMONSTRING_Damage,    // Damage
COMMONSTRING_SpellCharges,    // Spell Battery
COMMONSTRING_MagicColon,    // Magic:
COMMONSTRING_SpellColon,    // Spell:
COMMONSTRING_ResistsColon,    // Resists:
COMMONSTRING_Protection,    // Protection
COMMONSTRING_Defense,    // Defense
COMMONSTRING_Dexterity,    // Dexterity
COMMONSTRING_Stealth,    // Stealth
COMMONSTRING_TotalDefense,    // Total Defense
COMMONSTRING_TotalProtection,    // Total Protection
COMMONSTRING_MinInt,    // Min. Intelligence
COMMONSTRING_ChargesColon,    // Charges:
COMMONSTRING_SpellTrainMax,    // You cannot train this spell any further.
COMMONSTRING_NewSave,    // Create New Save
COMMONSTRING_XPowerfulMagic,    // The %s contains powerful magic that only %s can control
};

enum CombatStrings{
    COMBATSTRING_XsTurn,// %s begins action
    COMBATSTRING_PartyFlees,// The Party flees
    COMBATSTRING_PartyWins,// The Party is victorious
    COMBATSTRING_Blank, // single space char
    COMBATSTRING_XHealsY,// %s heals %s
    COMBATSTRING_XHealsYHP,// %s gains %d hit points
    COMBATSTRING_XHeals1HP,// %s gains 1 hit point
    COMBATSTRING_XHealFail,// %s fails to perform healing
    COMBATSTRING_XAvoids,// %s avoids the attack
    COMBATSTRING_XAttacksY,// %s attacks %s
    COMBATSTRING_XHitsY,// %s hits %s
    COMBATSTRING_XCritsY,// %s scores a critical hit on %s
    COMBATSTRING_XLosesYHP,// %s loses %d hit points
    COMBATSTRING_XLoses1HP,// %s loses 1 hit point
    COMBATSTRING_XMissesY,// %s misses %s
    COMBATSTRING_XPotionedAlready,// Potion already applied to %s
    COMBATSTRING_XPotioned,// Potion successfully applied to %s
    COMBATSTRING_XPotionFail,// %s fails to apply potion
    COMBATSTRING_XPotionStamina,// Potion grants %s full stamina
    COMBATSTRING_XMiss,// %s misses
    COMBATSTRING_XKilled,// %s killed
    COMBATSTRING_PotionBoom,// Potion exploded
    COMBATSTRING_SpellCant,// Spell Unavailable
    COMBATSTRING_SpellFailComponent,// Missing spell component
    COMBATSTRING_SpellFailTired,// Not enough ST to cast spell
    COMBATSTRING_SpellFail,// %s fails to cast the spell
    COMBATSTRING_SpellResist,// %s resists the spell
    COMBATSTRING_SpellXCastsY,// %s casts %s
    COMBATSTRING_SpellXCastOnY,// %s cast on %s
    COMBATSTRING_PlotPoison,// ...what happened? I can't see... it's just a scratch... but it burns...
    COMBATSTRING_XFlees,// %s flees
    COMBATSTRING_XJoins,// %s joins the battle
    COMBATSTRING_XShadow,// %s caught in the vortex of the Shadow
    COMBATSTRING_XRest,// %s rests
    COMBATSTRING_XWeaponSwap,// %s swaps weapons
    COMBATSTRING_Details0,// %s details:
    COMBATSTRING_Details1,// Level: %d
    COMBATSTRING_Details2,// Level: %d   Max HP: %d
    COMBATSTRING_Details3,// Current ST: %d   Current EN: %d
    COMBATSTRING_Details4,// Current DX: %d   Current PS: %d
    COMBATSTRING_Details5,// Current IN: %d   Current WL: %d
    COMBATSTRING_Details6,// Aspect: %s
    COMBATSTRING_Details7,// Total Protection: %d
    COMBATSTRING_Details8,// Spell Effects:
    COMBATSTRING_Details9,//    %s
    COMBATSTRING_DetailsA,// Morale: %d
    COMBATSTRING_DetailsB,// %s Resistance: %4.2f
    COMBATSTRING_DetailsC,// Magic School: %s
    COMBATSTRING_TroubAlready,// %s is already performing
    COMBATSTRING_TroubTired,// %s is too weak to perform
    COMBATSTRING_TroubFail,// %s fails to perform
    COMBATSTRING_TroubStart,// %s performs
    COMBATSTRING_TroubContinue,// %s continues to perform
    COMBATSTRING_PartyKO,// The party is incapacitated. The enemy is victorious.
    COMBATSTRING_FleeX,// flee%d
    COMBATSTRING_SUC,// %s%u%c
    COMBATSTRING_X,// %s
    COMBATSTRING_XFails,// %s fails
    COMBATSTRING_XBanished,// %s banished
    COMBATSTRING_ReinforceFlee,// Enemy reinforcements flee
    COMBATSTRING_ShadowVanish,// The Shadow dissipates
    COMBATSTRING_RefPoint0,// good
    COMBATSTRING_RefPoint1,// bad
    COMBATSTRING_CheatDeath,// %s cheats death
};