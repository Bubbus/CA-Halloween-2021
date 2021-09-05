#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_fxStartHellblastPP);

params ["_time"];

_time spawn
{
    _time = _this;

    _hellblastPP = ppEffectCreate ["ColorCorrections",1384];
    _hellblastPP ppEffectEnable true;
    _hellblastPP ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.33,0.33,0.33,0],[1,1,0,0,0,0,4]];
    _hellblastPP ppEffectCommit 0;

    _hellblastPP ppEffectAdjust [1,0.87,-0.02,[0.71,0,0,-0.14],[-1.31,1,1,1.22],[1.46,0.33,0.33,0.43],[0.33,0.3,0,0,0,0,4]];
    _hellblastPP ppEffectCommit _time;

    uiSleep (_time + 60);

    ppEffectDestroy _hellblastPP;

}
