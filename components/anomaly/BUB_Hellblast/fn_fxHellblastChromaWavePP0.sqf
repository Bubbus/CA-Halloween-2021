#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_fxHellblastChromaWavePP);

[] spawn
{
    _chromPP = ppEffectCreate ["ChromAberration",2823];
    _chromPP ppEffectEnable true;
    _chromPP ppEffectAdjust [0.09,-0.25,true];
    _chromPP ppEffectCommit 0.5;

    uiSleep 0.5;

    _chromPP ppEffectAdjust [0,0,true];
    _chromPP ppEffectCommit 3;
    uiSleep 3;

    ppEffectDestroy _chromPP;

}
