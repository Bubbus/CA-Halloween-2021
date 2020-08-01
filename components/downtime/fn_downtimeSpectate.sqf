#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

_whenGhost =
{
    player allowDamage false;
    player setVariable ["ace_medical_allowDamage", false];

    [player, "CA2_Downtime"] call ace_common_fnc_hideUnit;
    [player, "CA2_Downtime"] call ace_common_fnc_muteUnit;

    [] spawn
    {
        uiSleep 1;

        if (PLAYER_IS_GHOST) then
        {
            "CA2_CutDowntime" cutRsc ["CA2_DowntimeDead", "PLAIN", -1, false];
        };

    };

};


_whenAlive =
{
    player allowDamage true;
    player setVariable ["ace_medical_allowDamage", true];

    [player, "CA2_Downtime"] call ace_common_fnc_unhideUnit;
    [player, "CA2_Downtime"] call ace_common_fnc_unmuteUnit;

    [] spawn
    {
        uiSleep 1;

        if (IS_UNCONSCIOUS(player)) then
        {
            "CA2_CutDowntime" cutRsc ["CA2_DowntimeUnconscious", "PLAIN", -1, false];
        };

    };

};


_whenDone =
{
    player allowDamage true;
    player setVariable ["ace_medical_allowDamage", true];

    [player, "CA2_Downtime"] call ace_common_fnc_unhideUnit;
    [player, "CA2_Downtime"] call ace_common_fnc_unmuteUnit;

    "CA2_CutDowntime" cutFadeOut 0;

};


if !(SHOULD_CONTINUE) exitWith {};

// Can't move around in spectator while unconscious unless we do this...
["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;

[true, true, false] call ace_spectator_fnc_setSpectator;

_isGhost = PLAYER_IS_GHOST;
[] call (if (PLAYER_IS_GHOST) then {_whenGhost} else {_whenAlive});

waitUntil
{
    if !(PLAYER_IS_GHOST isEqualTo _isGhost) then
    {
        [] call (if (PLAYER_IS_GHOST) then {_whenGhost} else {_whenAlive});
        _isGhost = PLAYER_IS_GHOST;
    };

    sleep 0.1;
    !SHOULD_CONTINUE
};


[] call _whenDone;

[false, true, false] call ace_spectator_fnc_setSpectator;
