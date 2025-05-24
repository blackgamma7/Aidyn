#include "n64Borg.h"

typedef struct Compass_s{
  Borg8Header* ring;
  u32 pad; //an unused pointer?
  Borg8Header* N;
  Borg8Header* E;
  Borg8Header* S;
  Borg8Header* W;
};
Compass_s* gCompass;

namespace Compass{
    void Init();
    Gfx* Draw(Gfx*,vec2f*);
    void Free();
};