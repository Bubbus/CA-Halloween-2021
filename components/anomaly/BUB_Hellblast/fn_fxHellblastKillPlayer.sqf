#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_fxHellblastKillPlayer);

[] spawn
{
    _scream = selectRandom ["strigat_1", "strigat_2", "strigat_3", "strigat_4", "strigat_5", "strigat_6", "strigat_7", "strigat_91"];

    _chromPP = ppEffectCreate ["ChromAberration",2823];
    _chromPP ppEffectEnable true;
    _chromPP ppEffectAdjust [0.09,-0.25,true];
    _chromPP ppEffectCommit 0.5;

    _redPP = ppEffectCreate ["ColorCorrections",1500];
    _redPP ppEffectEnable true;
    _redPP ppEffectAdjust [1,0.39,0,[-2,0,0,-1],[5,1,1,-1],[0.8,0.33,0.33,0],[0,0,0,0,0,0,4]];
    _redPP ppEffectCommit 1;

    uiSleep (random 0.5);

    [player, _scream] remoteExec ["say3D"];

    _chromPP ppEffectAdjust [0,0,true];
    _chromPP ppEffectCommit 3;

    uiSleep 3;

    player setDamage 1;

    uiSleep 1;

    _redPP ppEffectEnable false;
    _redPP ppEffectCommit 1;

    uiSleep 1;

    ppEffectDestroy _redPP;
    ppEffectDestroy _chromPP;

}
