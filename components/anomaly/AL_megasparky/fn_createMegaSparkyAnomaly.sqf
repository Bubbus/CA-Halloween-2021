// by ALIAS
// Sparky DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

private ["_basePos"];

if (!isServer) exitWith {};

_basePos = _this select 0;
_radius = _this select 1;
_AI_see_spark= _this select 2;

_baseObj = "Land_HelipadEmpty_F" createVehicle _basePos;
_baseObj setPosASL _basePos;

[_baseObj, _radius] remoteExec ["f_fnc_moveMegaSparkyAnomaly", 0, true];

if (_AI_see_spark) then
{
    [_baseObj, _radius] spawn f_fnc_avoidMegaSparkyAnomaly;
};

_baseObj
