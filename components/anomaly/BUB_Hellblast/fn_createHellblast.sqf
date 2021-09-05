#include "macros.hpp"

SERVER_ONLY;

// Let's only have one hellblast running at a time.
if !(isNull (missionNamespace getVariable ["hellblast_trackingObj", objNull])) exitWith {};

RUN_AS_ASYNC(f_fnc_createHellblast);

params ["_pos"];

_baseObj = "Land_HelipadEmpty_F" createVehicle _pos;
_baseObj setPosASL _pos;
missionNamespace setVariable ["hellblast_trackingObj", _baseObj, true];

[true, 60] call f_fnc_setHellblastWind;

uiSleep 40;

[30] remoteExec ["f_fnc_fxStartHellblastPP"];

uiSleep 13;

[_baseObj] remoteExec ["f_fnc_fxStartHellblastWind"];

uiSleep 2;

[] remoteExec ["f_fnc_fxHellblastChromaWavePP"];

uiSleep 30;

[_baseObj] remoteExec ["f_fnc_fxHellblastOrb"];

uiSleep 20;

[_baseObj] remoteExec ["f_fnc_fxEndHellblastWind"];

[false, 60] call f_fnc_setHellblastWind;

sleep 20;

deleteVehicle _baseObj;
missionNamespace setVariable ["hellblast_trackingObj", nil, true];
