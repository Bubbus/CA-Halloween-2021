#include "macros.hpp"

SERVER_ONLY;

// Let's only have one heartbeat running at a time.
if !(isNull (missionNamespace getVariable ["heartbeat_trackingObj", objNull])) exitWith {};

RUN_AS_ASYNC(f_fnc_createHeartbeat);

params ["_pos"];

_baseObj = "Land_HelipadEmpty_F" createVehicle _pos;
_baseObj setPosASL _pos;
missionNamespace setVariable ["heartbeat_trackingObj", _baseObj, true];

[true, 15] call f_fnc_setHeartbeatWind;

//[true, 15] remoteExec ["f_fnc_fxSetHeartbeatWindParticles"];

uiSleep 15;

[objNull, 1, false, true] remoteExec ["f_fnc_doHeartbeatPulse"];

uiSleep 12;

[objNull, 2] remoteExec ["f_fnc_doHeartbeatPulse"];

uiSleep 12.5;

[objNull, 3] remoteExec ["f_fnc_doHeartbeatPulse"];

uiSleep 13.5;

[objNull, 4, true] remoteExec ["f_fnc_doHeartbeatPulse"];

uiSleep 10;

[false, 5] call f_fnc_setHeartbeatWind;

//[false, 5] remoteExec ["f_fnc_fxSetHeartbeatWindParticles"];

sleep 6;

deleteVehicle _baseObj;
missionNamespace setVariable ["heartbeat_trackingObj", nil, true];
