#include "typedefs.h"

enum BUTTON_aidyn{ //same as standard enum, but with 4 extra bits for analog joystick
	C_RIGHT=R_CBUTTONS,
	C_LEFT=L_CBUTTONS,
	C_DOWN=D_CBUTTONS,
	C_UP=U_CBUTTONS,
	R_BUTTON=CONT_R,
	L_BUTTON=CONT_L,
	D_RIGHT=CONT_RIGHT,
	D_LEFT=CONT_LEFT,
	D_DOWN=CONT_DOWN,
	D_UP=CONT_UP,
	//START_BUTTON=0X1000,
	Z_BUTTON=CONT_G,
	//B_BUTTON=0X4000,
	//A_BUTTON=0X8000,
	ANA_LEFT=0X10000, //analog stick left
	ANA_RIGHT=0X20000,//analog stick right
	ANA_DOWN=0X40000,//analog stick up
	ANA_UP=0X80000, //analog stick down
};

struct controller_aidyn { /* Controller input used by game */
    float joy_x;
    float joy_y;
    u32 input;
    u32 input_2;
};

struct ControllerFull { /* Add held button times */
    struct controller_aidyn contAidyn;
    u16 holdTime_DUp;
    u16 holdTime_DDown;
    u16 holdTime_DLeft;
    u16 holdTime_Dright;
    u16 holdTime_AUp;
    u16 holdTime_ADown;
    u16 holdTime_ALeft;
    u16 holdTime_ARight;
    u16 holdTime_CUp;
    u16 holdTime_CDown;
    u16 holdTime_CLeft;
    u16 holdTime_CRight;
    u16 holdTime_Start;
    u16 holdTime_AButton;
    u16 holdTime_BButton;
    u16 holdTime_ZButton;
    u16 holdTime_LButton;
    u16 holdTime_RButton;
};

struct controllerBuffer { /* buffer of controller inputs */
    ControllerFull *inputlog;
    OSPfs pfs;
    float hori;
    float vert;
    u8 latest;
    u8 next;
    u8 ContGet;
    u8 ContRead;
};

#define THQCompCode 0x3738 //"78"
#if 0 //European version
#define AidynGameCode 0x4e415950 //"NAYP"
#else
#define AidynGameCode 0x4e415945 //"NAYE"
#endif

typedef struct{
	u16 filesize;
	u16 comp_code;
	u32 game_code;
	char game_name[17];
	char ext_name[4];
	u8 align[3];
}fileState_aidyn;



typedef struct{
	void* thread_stack;
	OSMesg* osmesgPointer;
	OSSched* ossched;
	controllerBuffer* BufferPointer;
	OSThread Thread;
	OSScClient client;
	OSMesg mesg0;
	OSMesg mesg1;
	OSMesgQueue mesgClient;
	OSMesgQueue SIMesgQ;
	OSMesgQueue contMesgQ;
	u32 Timer;
	u8 ports;
}ContManageStruct;
namespace Controller{
  void Init(OSSched *sc,u8 ports,u8 pri,u8 id);
  void proc(void* p);
  void InitBuffer();
  void ReadInput();
  u8 GetQuerey(u8 port);
  u8 CheckStatus(u8 port);
  u8 GetContRead(u8 port);
  u8 InitPak(u8 port);
  u8 InitRumble(u8 port);
  u8 InitGBPak(u8 port);
  u8 GetPSFERR(u8 port);
  u8 RepairPak(u8 port);
  u8 GetPakFreeBlocks16(u16 *b,u8 port);
  u8 GetPakFreeBlocks8(u8 *b,u8 port);
  u8 NewPakSave(u8 *fileno,char *filename,char *filecode,u16 compCode,u32 GameCode, u16 EXTName,u8 port);
  u8 GetPakSave(u8 *fileno,char* filename,char* filecode,u16 compCode, u32 GameCode,u8 port);
  u8 GetPakSaveState(fileState_aidyn *FS,u8 file_no,u8 port);
  u8 WritePakSave(u8 *buff,u8 filenum,u16 offset,u16 size,u8 port);
  u8 ReadPakSave(u8 *buff,s16 filenum,u16 offset,u16 size,u8 port);
  u8 ErasePakSave(u8 fileno,u8 port);
  u32 GetPakPort(u8 port);
  u8 GetStatus(u8 port,u8 *statOut);
  u8 GetStatus2(u8 port);
  s32 SetJoystick(float H,float V,u8 port);
  u8 GetInput(controller_aidyn** input,u8 port);
  void DecodeString(char *ascii,u8 *pfs,u8 len);
  void EncodeString(u8 *pfs,char *ascii,u8 len);
  u16 GetDelay(u8 port);
};

#define ContThreadStack 0x448

//delta is between 1/60 and 1/10(6/60) second
#define DeltaCap(delta)\
if(delta==0)delta=1;\
if(delta>6)delta=6

//used to get delta from controller querries.
#define ContDelta(cont,delta)\
delta=0;\
while(Controller::GetInput(&cont,0)){delta++;}\
DeltaCap(delta)

//double-checks the PFS error value if returns PFS_ERR_BAD_DATA.
#define Pfs2xCheck(val,func) val=func;\
if(val==PFS_ERR_BAD_DATA)val=func

//Initalize Transfer Pak. not in libreultra.
extern s32 osGbpakInit(OSMesgQueue *siMessegeQ,OSPfs *pfs,int channel);