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
	START_BUTTON=0X1000,
	Z_BUTTON=0X2000,
	B_BUTTON=0X4000,
	A_BUTTON=0X8000,
	ANA_LEFT=0X10000,
	ANA_RIGHT=0X20000,
	ANA_DOWN=0X40000,
	ANA_UP=0X80000,
};


struct{
	float joyX;
	float joyY;
	uint input;
	uint input2; //tap vs hold?
}controllerAidyn;
//and a version that holds the button hold times
struct{
	controllerAidyn cont;
	ushort D_up;
	ushort D_down;
	ushort D_Left;
	ushort D_right;
	ushort A_up;
	ushort A_down;
	ushort A_left;
	ushort A_right;
	ushort C_up;
	ushort C_down;
	ushort C_left;
	ushort C_right;
	ushort Start;
	ushort A;
	ushort B;
	ushort Z;
	ushort L;
	ushort R;
}  Button_hold; //hold times seem largely irrelevant, only cares about smaller struct.

struct{
	Button_hold[128]* inputlog; //cycles through 128 controller entries
	OSpfs pfs; //For memory pak stuff
	byte align[2];
	float X; //looks to be thresholds for if joypad is a "button press"
	float Y;
	byte latest; //which entry from inputlog input getts use
	byte next; //which inputlog is written
	byte ContGet;
	byte ContRead;
}ControllerBuffer;

struct{
	ushort filesize;
	u16 comp_code;
	u32 game_name;
	byte pad;
	char ext_name[4];
	byte align[3];
}fileState_aidyn;

struct{
	void* thread_stack;
	OSMesg* osmesgPointer;
	OSSched* ossched;
	ControllerBuffer* BufferPointer;
	OSThread Thread;
	OSScClient client;
	OSMesg mesg0;
	OSMesg mesg1;
	OSMesgQueue controller_queue_2;
	OSMesgQueue si_MesgQ;
	OSMesgQueue ContMesgQ;
	uint Timer;
	u8 ports;
}ContManageStruct;