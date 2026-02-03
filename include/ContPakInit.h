#include "widgets/ContPakData.h"

//Runs during boot if there are issues with Controller Pak
//(Unformatted, damaged, not present, etc.)

typedef Gfx*(*ContPakFunc)(Gfx*);
typedef void(*ContPakErrFunc)(u8);

u32 appState_ContPakCheck(Gfx **GG);
Gfx * load_controller_romstring(Gfx *g);
Gfx * Start_opens_mempak_menu(Gfx *g);
Gfx * check_cont_error(Gfx *g);
Gfx * check_mempak_freespace(Gfx *g);
Gfx * check_controller_filestate(Gfx *g);
Gfx * func_checking_controller(Gfx *g);
Gfx * ret_a0_8008bd80(Gfx *g);
void clear_controller_romstring();
void FUN_8008bdc8();
void set_contCheckSwitch_to_6();
void FUN_8008be48();
Gfx * appState3_TickWidgets(Gfx *g);
void run_cont_err_func(u8 err);
BaseWidget* continue_without_saving_(BaseWidget*,BaseWidget*);
BaseWidget * FUN_8008c15c(BaseWidget*,BaseWidget*);
BaseWidget * FUN_8008c1b0(BaseWidget *,BaseWidget *);
BaseWidget * ret0_8008c1bc(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_8008c1c4(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_8008c228(BaseWidget *w0,BaseWidget *w1);
void pfs_err_new_pak(u8 err);
void pfs_err_Nopak(u8 err);
void psf_err_contrfail(u8 err);
void pfs_err_err_device(u8 err);
void pfs_err_id_fatal(u8 err);
void FUN_8008c558(char *txt,u8 err);
void pfs_err_data_full(u8 err);
void not_enough_freespace(u8 err);
void FUN_8008c688(char *txt,u8 err);
void FUN_8008c73c(u8 err);
void psf_err_inconsistent(u8 err);
void contpakwidget_repairOk(u8 err);
void FUN_8008c80c(u8 err);

//possible file break?

int appState_4(Gfx **gg);
bool check_for_controller(void);
Gfx * ret_a0_8008C9BC(Gfx *g);
bool no_controller_warning(void);

s32 contCheckSwitch=0;
u32 init_controller_data=3;
char** controller_romstring=NULL; //TODO: create enums and macro Id'ing strings.
u8 init_controller_flag=0;

//Placeholder struct for romstrings. to replace with char** and enums.
/*
struct RomstringController {
    char *continue w/o saving;
    char *cont pak full;
    char *not enough pages;
    char *error reading;
    char *retry;
    char *insert new controllerpak;
    char *game needs cont pak;
    char *cont w/o saving;
    char *retry new pak;
    char *manage cont pak;
    char *new cont pak detected;
    char *continue;
    char *contpak corrupt;
    char *contpak damaged;
    char *insert new pak(retry);
    char *repair;
    char *repair ok;
    char *repair fail;
    char *insert new pak;
    char *unsupported device;
    char *insert cont pak;
};
*/