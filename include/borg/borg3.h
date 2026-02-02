#include "borg/borgHead.h"

//contains perspective data. Only 5 items, with the only 3 distinct changes being the clipping planes.
struct Borg3Data{
    float unk0; //unused(?) apart from an orphaned getter/setter. always 0
    float fovy; //always 45
    float nearplane;
    float farplane;
    float unk10; //unused(?) apart from an orphaned getter/setter. always 1
    float aspect; // always 1.3333334 (4:3)
    Vp *viewportP; //unused(?) apart from an orphaned setter
    Mtx *mtx_;
    Vp viewport;
};

//Headered perspective data
struct Borg3Header {
    borgHeader head;
    u16 perspnorm[2];
    int *unkc;
    Borg3Data dat;
};