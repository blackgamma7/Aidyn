#include "globals.h"

Gfx * tick_and_render_widgets(Gfx *g) {
  RSPFUNC6(g);
  WHANDLE->Tick(gGlobals.delta);
  return WHANDLE->Render(g,FULL_SCREENSPACE);
}

