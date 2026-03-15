/*
 * input_backend.cpp – SDL2 input backend.
 *
 * Maps SDL2 keyboard / gamepad events to N64 controller data that the game
 * reads through Controller::GetInput() → controller_aidyn.pressed / .held.
 *
 * The game uses Controller::proc() (a thread) which blocks on retrace
 * messages from the scheduler then reads osContGetReadData().  We intercept
 * at the OS level:
 *
 *   osContGetReadData() → calls InputBackend::GetContData() below
 *
 * Default keyboard mapping (player 1):
 *   Arrow keys / WASD  → D-pad / analogue stick
 *   Z/X               → A / B
 *   S                 → Start
 *   Q/E               → L / R trigger
 *   Space             → Z trigger
 *   F/G/H/V          → C-buttons (up/right/down/left)
 */

#include <cstdio>
#include <cstring>
#include <SDL2/SDL.h>

#include "../../ultra/include/2.0I/ultra64.h"

namespace InputBackend {

/* =========================================================================
 * Internal state
 * ========================================================================= */
static OSContPad sPad[MAXCONTROLLERS] = {};
static SDL_GameController *sGamepad[MAXCONTROLLERS] = {};
static int sGamepadConnected = 0;

/* =========================================================================
 * Init – open any connected gamepads
 * ========================================================================= */
void Init() {
    for (int i = 0; i < SDL_NumJoysticks() && i < MAXCONTROLLERS; i++) {
        if (SDL_IsGameController(i)) {
            sGamepad[i] = SDL_GameControllerOpen(i);
            if (sGamepad[i]) {
                fprintf(stderr, "[input] Gamepad %d: %s\n", i,
                        SDL_GameControllerName(sGamepad[i]));
                sGamepadConnected++;
            }
        }
    }
}

void Shutdown() {
    for (int i = 0; i < MAXCONTROLLERS; i++) {
        if (sGamepad[i]) { SDL_GameControllerClose(sGamepad[i]); sGamepad[i] = nullptr; }
    }
}

/* =========================================================================
 * ProcessEvent – call from the main event pump for each SDL_Event.
 * Returns true if the event was consumed.
 * ========================================================================= */
static const float STICK_SCALE = 80.0f / 32768.0f; /* N64 stick range ≈ ±80 */

bool ProcessEvent(const SDL_Event *ev) {
    switch (ev->type) {

    /* ----- Keyboard ----- */
    case SDL_KEYDOWN:
    case SDL_KEYUP: {
        bool down = (ev->type == SDL_KEYDOWN);
        u16  bit  = 0;
        s8   sx   = 0, sy = 0;
        switch (ev->key.keysym.sym) {
        /* D-pad */
        case SDLK_UP:    case SDLK_w: bit = CONT_UP;    break;
        case SDLK_DOWN:  case SDLK_s: bit = CONT_DOWN;  break;
        case SDLK_LEFT:  case SDLK_a: bit = CONT_LEFT;  break;
        case SDLK_RIGHT: case SDLK_d: bit = CONT_RIGHT; break;
        /* Buttons */
        case SDLK_z:     bit = CONT_A;     break;
        case SDLK_x:     bit = CONT_B;     break;
        case SDLK_RETURN: bit = CONT_START; break;
        case SDLK_SPACE:  bit = CONT_G;    break; /* Z-trigger */
        case SDLK_q:      bit = CONT_L;    break;
        case SDLK_e:      bit = CONT_R;    break;
        /* C-buttons */
        case SDLK_i: bit = U_CBUTTONS; break;
        case SDLK_k: bit = D_CBUTTONS; break;
        case SDLK_j: bit = L_CBUTTONS; break;
        case SDLK_l: bit = R_CBUTTONS; break;
        default: return false;
        }
        if (bit) {
            if (down) sPad[0].button |= bit;
            else      sPad[0].button &= ~bit;
        }
        /* Analogue from arrow/WASD */
        if (ev->key.keysym.sym == SDLK_LEFT  || ev->key.keysym.sym == SDLK_a)
            sPad[0].stick_x = down ? -80 : 0;
        if (ev->key.keysym.sym == SDLK_RIGHT || ev->key.keysym.sym == SDLK_d)
            sPad[0].stick_x = down ?  80 : 0;
        if (ev->key.keysym.sym == SDLK_UP    || ev->key.keysym.sym == SDLK_w)
            sPad[0].stick_y = down ?  80 : 0;
        if (ev->key.keysym.sym == SDLK_DOWN  || ev->key.keysym.sym == SDLK_s)
            sPad[0].stick_y = down ? -80 : 0;
        return true;
    }

    /* ----- Gamepad ----- */
    case SDL_CONTROLLERBUTTONDOWN:
    case SDL_CONTROLLERBUTTONUP: {
        bool down = (ev->type == SDL_CONTROLLERBUTTONDOWN);
        int  idx  = ev->cbutton.which;
        if (idx >= MAXCONTROLLERS) break;
        u16 bit = 0;
        switch (ev->cbutton.button) {
        case SDL_CONTROLLER_BUTTON_A:             bit = CONT_A;     break;
        case SDL_CONTROLLER_BUTTON_B:             bit = CONT_B;     break;
        case SDL_CONTROLLER_BUTTON_START:         bit = CONT_START; break;
        case SDL_CONTROLLER_BUTTON_DPAD_UP:       bit = CONT_UP;    break;
        case SDL_CONTROLLER_BUTTON_DPAD_DOWN:     bit = CONT_DOWN;  break;
        case SDL_CONTROLLER_BUTTON_DPAD_LEFT:     bit = CONT_LEFT;  break;
        case SDL_CONTROLLER_BUTTON_DPAD_RIGHT:    bit = CONT_RIGHT; break;
        case SDL_CONTROLLER_BUTTON_LEFTSHOULDER:  bit = CONT_L;     break;
        case SDL_CONTROLLER_BUTTON_RIGHTSHOULDER: bit = CONT_R;     break;
        case SDL_CONTROLLER_BUTTON_Y:             bit = U_CBUTTONS; break;
        case SDL_CONTROLLER_BUTTON_X:             bit = L_CBUTTONS; break;
        default: break;
        }
        if (bit) {
            if (down) sPad[idx].button |= bit;
            else      sPad[idx].button &= ~bit;
        }
        return true;
    }

    case SDL_CONTROLLERAXISMOTION: {
        int idx = ev->caxis.which;
        if (idx >= MAXCONTROLLERS) break;
        s16 val = ev->caxis.value;
        /* Apply dead zone */
        if (val > -4096 && val < 4096) val = 0;
        switch (ev->caxis.axis) {
        case SDL_CONTROLLER_AXIS_LEFTX:
            sPad[idx].stick_x = (s8)(val * STICK_SCALE);
            break;
        case SDL_CONTROLLER_AXIS_LEFTY:
            /* SDL Y-axis is inverted relative to N64 */
            sPad[idx].stick_y = (s8)(-val * STICK_SCALE);
            break;
        case SDL_CONTROLLER_AXIS_TRIGGERLEFT:
            if (val > 8192) sPad[idx].button |= CONT_L;
            else            sPad[idx].button &= ~CONT_L;
            break;
        case SDL_CONTROLLER_AXIS_TRIGGERRIGHT:
            if (val > 8192) sPad[idx].button |= CONT_R;
            else            sPad[idx].button &= ~CONT_R;
            break;
        case SDL_CONTROLLER_AXIS_RIGHTX:
            if      (val >  16384) sPad[idx].button |= R_CBUTTONS;
            else if (val < -16384) sPad[idx].button |= L_CBUTTONS;
            else { sPad[idx].button &= ~R_CBUTTONS; sPad[idx].button &= ~L_CBUTTONS; }
            break;
        case SDL_CONTROLLER_AXIS_RIGHTY:
            if      (val < -16384) sPad[idx].button |= U_CBUTTONS;
            else if (val >  16384) sPad[idx].button |= D_CBUTTONS;
            else { sPad[idx].button &= ~U_CBUTTONS; sPad[idx].button &= ~D_CBUTTONS; }
            break;
        default: break;
        }
        return true;
    }

    case SDL_CONTROLLERDEVICEADDED:
        for (int i = 0; i < MAXCONTROLLERS; i++) {
            if (!sGamepad[i]) {
                sGamepad[i] = SDL_GameControllerOpen(ev->cdevice.which);
                break;
            }
        }
        return true;

    case SDL_CONTROLLERDEVICEREMOVED:
        for (int i = 0; i < MAXCONTROLLERS; i++) {
            if (sGamepad[i] &&
                SDL_GameControllerGetJoystick(sGamepad[i]) ==
                SDL_JoystickFromInstanceID(ev->cdevice.which)) {
                SDL_GameControllerClose(sGamepad[i]);
                sGamepad[i] = nullptr;
            }
        }
        return true;

    default:
        break;
    }
    return false;
}

/* =========================================================================
 * GetContData – fills OSContPad array (replaces osContGetReadData)
 * ========================================================================= */
void GetContData(OSContPad *data) {
    memcpy(data, sPad, sizeof(OSContPad) * MAXCONTROLLERS);
}

} /* namespace InputBackend */

/* =========================================================================
 * OS-level override: forward osContGetReadData to the SDL2 backend.
 * ========================================================================= */
extern "C" void osContGetReadData(OSContPad *data) {
    InputBackend::GetContData(data);
}
