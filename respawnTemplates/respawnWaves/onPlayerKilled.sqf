// CA respawn system with wave respawns

#include "macros.hpp"

params ["_corpse", "_killer"];

DEBUG_PRINT_LOG("[RespawnWaves] Player was killed.")

LOCAL_ONLY(_corpse);

f_var_playerHasBeenKilled = true;

if !IS_TRUE(f_deathFadedIn) then
{
    systemChat "wot";
    f_deathFadedIn = true;
    "DeathFade" cutText ["", "BLACK OUT", 0.3, false];
    0.3 fadeSound 0;
};

_oldGroupId = groupId (group _corpse);

if !(_oldGroupId isEqualTo "Spectators") then
{
    f_var_playerOriginalGroupName = groupId (group _corpse);
};

[_corpse] joinSilent grpNull;
