// CA respawn system with wave respawns

#include "macros.hpp"

params ["_unit", "_corpse"];

DEBUG_PRINT_LOG("[RespawnWaves] Player respawning...")

CLIENT_ONLY;
LOCAL_ONLY(_unit);

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();
waitUntil {local player};

#include "..\parts\tryTeleport.sqf"
#include "..\parts\applyOldLoadout.sqf"


// Set language of the units depending on side (BABEL API)
[_unit] spawn f_fnc_clientSetLanguages;




_doRespawn =
{
    params ["_unit", "_corpse", "_isJip"];

    if ((_isJip and IS_TRUE(f_var_JIPTeleport)) or ((!_isJip) and IS_TRUE(f_var_RespawnTeleport))) then
    {
        player setVariable ["f_var_mayTeleportToGroup", true, true];
    };

    f_deathFadedIn = false;
    "DeathFade" cutFadeOut 3;
    3 fadeSound 1;

    [_unit, true] call f_fnc_activatePlayer;
    f_var_playerHasBeenKilled = false;

};




if (time < 30) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Time < 30, skipping respawn wave...")

    [_unit, _corpse] spawn _applyOldLoadout;
    [_unit, _corpse, false] call _doRespawn;
}; // Apply a grace period at mission start.




_hasBeenKilled = missionNamespace getVariable ["f_var_playerHasBeenKilled", false];

DEBUG_FORMAT1_LOG("[RespawnWaves] Player has been killed?: %1",_hasBeenKilled)




// Join in progress and instant respawn handling
if (!_hasBeenKilled) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was not killed, handling as JIP...")

    [_unit, _corpse] spawn _applyOldLoadout;    
    [_unit, _corpse, true] call _doRespawn;
};




if (_hasBeenKilled) then
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was killed.")
    [_unit] joinSilent grpNull;

    if (missionNamespace getVariable ["missionPhase2", false]) then
    {
        ["pistol", _unit] spawn f_fnc_assignGear;

        private _telePoint = selectRandom ["tele_1","tele_2","tele_3","tele_4","tele_5","tele_6","tele_7","tele_8","tele_9"];

        player setPos (getMarkerPos _telePoint);
        player setVariable ["heartbeat_telePoint", _telePoint, true];
    }
    else
    {
        [_unit, _corpse] spawn _applyOldLoadout;
        
        player setPos (getMarkerPos "respawn_west");
    };

    [_unit, _corpse, true] call _doRespawn;

    DEBUG_PRINT_LOG("[RespawnWaves] All done.")

}
