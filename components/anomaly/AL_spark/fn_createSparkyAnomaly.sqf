// by ALIAS
// Sparky DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

if (!isServer) exitWith {};

private _basePosASL = _this select 0;
private _radius = _this select 1;
private _AI_see_spark = _this select 2;

private _baseObj = "Land_HelipadEmpty_F" createVehicle _basePosASL;
_baseObj setPosASL _basePosASL;

[_baseObj, _radius] remoteExec ["f_fnc_moveSparkyAnomaly", 0, true];

if (_AI_see_spark) then
{
    [_baseObj, _radius * 2] spawn f_fnc_avoidSparkyAnomaly;
};

_baseObj
