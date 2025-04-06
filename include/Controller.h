#include "typedefs.h"

enum BUTTON_aidyn{ //same as standard enum, but with 32 bits for analog joystick
	C_RIGHT=1,
	C_LEFT=2,
	C_DOWN=4,
	C_UP=8,
	R_BUTTON=0X10,
	L_BUTTON=0X20,
	D_RIGHT=0X100,
	D_LEFT=0X200,
	D_DOWN=0X400,
	D_UP=0X800,
	//START_BUTTON=0X1000,
	Z_BUTTON=0X2000,
	//B_BUTTON=0X4000,
	//A_BUTTON=0X8000,
	ANA_LEFT=0X10000,
	ANA_RIGHT=0X20000,
	ANA_DOWN=0X40000,
	ANA_UP=0X80000,
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

//Initalize Transfer Pak. not in libreultra.
extern s32 osGbpakInit(OSMesgQueue *siMessegeQ,OSPfs *pfs,int channel);