struct Method { //  seem to have 4-u8 padding, for some reason
    u16 space[2]; //1st entry used as arg, i think
    ulong (* func)(void);
};
struct Widget_Methods { //methods based on type of widget
    u32 blank[2];
    struct Method freeWidget;
    struct Method getNumber;
    struct Method getHeight;
    struct Method GetWidth;
    struct Method handleSubstruct;
    struct Method link;
    struct Method unlink;
    struct Method Render;
    struct Method SetColor;
    struct Method Controlfunc;
    struct Method UpFunc;
    struct Method DownFunc;
    struct Method LeftFunc;
    struct Method RightFunc;
    struct Method AFunc;
    struct Method Bfunc;
    struct Method ZFunc;
    struct Method LFunc;
    struct Method RFunc;
    struct Method StartFunc;
    struct Method CUPFunc;
    struct Method CDownFunc;
    struct Method CLeftFunc;
    struct Method CRightFunc;
    struct Method unk0xc8;
};


struct widgetStruct { // Parent for all widgets
    void * ptr0;
    void * ptr0x4;
    ulong (* UpButtonFunc)(void);
    ulong (* DownButtonFunc)(void);
    ulong (* LeftButtonFunc)(void);
    ulong (* RightButtonFunc)(void);
    ulong (* AbuttonFunc)(void);
    ulong (* BButtonFunc)(void);
    ulong (* StartButtonFunc)(void);
    ulong (* LButtonFunc)(void);
    ulong (* RButtonFunc)(void);
    ulong (* ZButtonFunc)(void);
    ulong (* CUpFunc)(void);
    ulong (* CDownFunc)(void);
    ulong (* CLeftFunc)(void);
    ulong (* CRightFunc)(void);
    void * ptr0x40; // changes for each widget type
    struct widgetStruct * func_array_Arg;
    u32 unk0x48;
    struct widgetStruct * link0;
    struct widgetStruct * link1;
    struct widgetStruct * link2;
    struct color32 col;
    u8 unk0x5c;
    u8 unk0x5d;
    u16 unk0x5e;
    s16 x;
    s16 y;
    u16 unk0x64;
    u16 HMax;
    u16 unk0x68;
    u16 VMax;
    struct Borg_8_header * borg_8;
    u8 byte0x70;
    undefined unk0x71;
    u16 imgWidth;
    u16 imgHeight;
    u16 unk0x76;
    struct Widget_Methods * methods;
};

extern void widget_init(widgetStruct *);
extern void free_widget(widgetStruct *,u8);
extern void set_widget_coords(widgetStruct *,s16,s16);
extern void set_widgetHeight(widgetStruct *,s16);
