#include "macros.hpp"

params ["_unit"];

LOCAL_ONLY(_unit);
RUN_AS_ASYNC(f_fnc_veryImportantPrisoner);

if (!alive _unit) exitWith {};

_unit setvariable ["f_cacheExcl", true, true];
[_unit, false] call f_fnc_allowGravestone;

_unit setVariable ["VCOM_NOAI", true, true];
_unit setVariable ["lambs_danger_disableAI", true, true];
_unit allowFleeing 0;
_unit forceSpeed 0;
_unit disableAI "PATH";
