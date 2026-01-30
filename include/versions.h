//list of versions of game

/* early builds (listed for posterity)
VER_00_02_10 // Earliest-found build of game.
VER_00_05_09
VER_00_12_05
*/

#define VER_01_02_01 1 //Final Debug Build aka "02.01d-PRERELEASE"
#define VER_01_02_02 2 //NA 1.0 Release aka "02.02a-LOT-CHECK"
#define VER_01_02_16 3 //NA 1.1 Release aka "02.16a-LOT-CHECK"
#define VER_01_03_02 4 //"03.02a-LC-PAL"
#define VER_01_04_10 5 //"04.10a-LC-PAL"
#define VER_01_04_27 6 //EU Release aka "04.27a-LC-PAL"

#if GAME_VERSION == VER_01_02_01
#define DEBUGVER 1
#else
#define DEBUGVER 0
#endif


#if GAME_VERSION == VER_01_02_02
#define VER_NA10 1
#else
#define VER_NA10 0
#endif

#if GAME_VERSION == VER_01_02_16
#define VER_NA11 1
#else
#define VER_NA11 0
#endif

#if GAME_VERSION == VER_01_03_02 || GAME_VERSION == VER_01_04_10 || GAME_VERSION == VER_01_04_27
#define EUVER 1
#else
#define EUVER 0
#endif