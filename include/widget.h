struct Method { //  seem to have 4-byte padding, for some reason
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
    struct Method unk_func_8;
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
    struct Method field_0xc8;
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
    uint field_0x48;
    struct widgetStruct * link0;
    struct widgetStruct * link1;
    struct widgetStruct * link2;
    struct color col;
    byte field_0x5c;
    byte field_0x5d;
    ushort field_0x5e;
    short x;
    short y;
    ushort field_0x64;
    ushort HMax;
    ushort field_0x68;
    ushort VMax;
    struct Borg_8_header * borg_8;
    byte byte0x70;
    undefined field_0x71;
    ushort imgWidth;
    ushort imgHeight;
    ushort field_0x76;
    struct Widget_Methods * methods;
};

extern void widget_init(widgetStruct *);
extern void free_widget(widgetStruct *,byte);
extern void set_widget_coords(widgetStruct *,short,short);
extern void set_widgetHeight(widgetStruct *,short);
