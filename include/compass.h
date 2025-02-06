#include "n64Borg.h"

typedef struct Compass_s{
  Borg8header* ring;
  u32 pad; //an unused pointer?
  Borg8header* N;
  Borg8header* E;
  Borg8header* S;
  Borg8header* W;
};
Compass_s* gCompass;

namespace Compass{
    void Init();
    Gfx* Draw(Gfx*,vec2f*);
    void Free();
};