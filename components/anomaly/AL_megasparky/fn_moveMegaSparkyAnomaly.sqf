// by ALIAS
var_megaSparkyAnomaly_visibleDistance = 2500;

#include "..\macros.hpp"

RUN_AS_ASYNC(f_fnc_moveMegaSparkyAnomaly);

WAIT_UNTIL_MISSION_STARTED();

private ["_obiect_orb","_mark_orig"];

private _baseObj = _this select 0;
private _radius = _this select 1;

if !(alive _baseObj) exitWith {};

private _obiect_orb = objNull;

if (isServer) then
{
	_obiect_orb = "Sign_Sphere10cm_F" createVehicle (getPos _baseObj);
	_obiect_orb hideObjectGlobal true;

	if !(isNil 'kyk_ew_fnc_broadcastJammerAdd') then
	{
		[_obiect_orb, random [400, 500, 600], 0, 0, 0, 0, 0] call kyk_ew_fnc_broadcastJammerAdd;
	};
}
else
{
	_obiect_orb = "Sign_Sphere10cm_F" createVehiclelocal (getPos _baseObj);
	_obiect_orb hideObject true;
};

_posSmoother = "Land_HelipadEmpty_F" createVehiclelocal (getPos _baseObj);
_posSmoother hideObject true;


if (hasInterface) then
{
	[_obiect_orb] spawn
	{
		params ["_obiect_orb"];

		while {alive _obiect_orb} do
		{
			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb < var_megaSparkyAnomaly_visibleDistance}};

			if !(alive _obiect_orb) exitWith {};

			private _ele = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_ele setParticleCircle [0, [0, 0, 0]];
			_ele setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_ele setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.3, 11, 7.9, 0.075, [0.11, 0.12, 0.13], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiect_orb];
			_ele setDropInterval 0.005;

			private _ele2 = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_ele2 setParticleCircle [0, [0, 0, 0]];
			_ele2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_ele2 setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.3, 11, 7.9, 0.075, [0.11, 0.12, 0.13], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiect_orb];
			_ele2 setDropInterval 0.005;

			private _orb_lit = "#lightpoint" createVehiclelocal (getPosATL _obiect_orb);
			_orb_lit lightAttachObject [_obiect_orb, [0,0,0]];
			_orb_lit setLightColor [0.92,0.95,1];
			_orb_lit setLightIntensity 1500;
			_orb_lit setLightUseFlare true;
			_orb_lit setLightFlareSize 20;
			_orb_lit setLightFlareMaxDistance 500;
			_orb_lit setLightAttenuation [4, 0, 0.03, 0, 6, 200];
			_orb_lit setLightDayLight true;

			_orb_lit spawn
			{
				while {alive _this} do
				{
					_this setLightIntensity (1000 + random 500);
					sleep 0.016;
				};

			};

			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb > var_megaSparkyAnomaly_visibleDistance}};

			deleteVehicle _ele;
			deleteVehicle _ele2;
			deleteVehicle _orb_lit;

			if !(alive _obiect_orb) exitWith {};

		};

	};

	[_obiect_orb] spawn
	{
		_orb_obj = _this select 0;

		while {!isNull _orb_obj} do
		{
			_orb_obj say3D ["magnetic_pulse_mega", 2500, 0.7];
			sleep 12;

		};

	};

};




[_baseObj, _obiect_orb, _posSmoother, _radius] spawn
{
	params ["_baseObj", "_obiect_orb", "_posSmoother", "_radius"];

	if (isServer) then
	{
		private _xMod = 3 + random 3;
		private _yMod = 3 + random 3;
		private _zMod = random 10;

		_baseObj setVariable ["spark_xMod", _xMod, true];
		_baseObj setVariable ["spark_yMod", _yMod, true];
		_baseObj setVariable ["spark_zMod", _zMod, true];

	};

	private _xyFreqSkew = 8;

	if (hasInterface) then
	{
		waitUntil
		{
			sleep 0.25;
			(!(alive _baseObj)) or {(_baseObj getVariable ["spark_zMod", -1]) >= 0}
		};

		private _xMod = _baseObj getVariable ["spark_xMod", 0];
		private _yMod = _baseObj getVariable ["spark_yMod", 0];
		private _zMod = _baseObj getVariable ["spark_zMod", 0];

		while {alive _posSmoother and {alive _obiect_orb}} do
		{
			private _time = CBA_missionTime;
			private _curXFreqSkew = ((sin _time) * _xyFreqSkew) / _time;
			private _curYFreqSkew = ((cos _time) * _xyFreqSkew) / _time;
			private _xCycle = sin (_time * (_xMod + _curXFreqSkew));
			private _yCycle = cos (_time * (_yMod + _curYFreqSkew));

			private _basePos = getPosATL _posSmoother;
			_obiect_orb setPosATL [(_basePos#0) + (_xCycle * _radius), (_basePos#1) + (_yCycle * _radius), (_basePos#2) + (sin (_time * _zMod)) + 60];

			private _distance = _obiect_orb distance player;
			sleep ((((_distance - var_megaSparkyAnomaly_visibleDistance) * 0.01666) max 0.0333) min 2);

		};
	}
	else
	{
		private _xMod = _baseObj getVariable ["spark_xMod", 0];
		private _yMod = _baseObj getVariable ["spark_yMod", 0];
		private _zMod = _baseObj getVariable ["spark_zMod", 0];

		while {alive _posSmoother and {alive _obiect_orb}} do
		{
			private _time = CBA_missionTime;
			private _curXFreqSkew = ((sin _time) * _xyFreqSkew) / _time;
			private _curYFreqSkew = ((cos _time) * _xyFreqSkew) / _time;
			private _xCycle = sin (_time * (_xMod + _curXFreqSkew));
			private _yCycle = cos (_time * (_yMod + _curYFreqSkew));

			private _basePos = getPosATL _posSmoother;
			_obiect_orb setPosATL [(_basePos#0) + (_xCycle * _radius), (_basePos#1) + (_yCycle * _radius), (_basePos#2) + (sin (_time * _zMod)) + 60];

			sleep 0.5;

		};

	};

};




[_baseObj, _posSmoother, _radius] spawn
{
	params ["_baseObj", "_posSmoother", "_radius"];

	private _lastRun = CBA_missionTime;
	private _maxVel = _radius * 0.25;

	if (hasInterface) then
	{
		while {alive _baseObj and {alive _posSmoother}} do
		{
			private _movement = _maxVel * (CBA_missionTime - _lastRun);
			private _smootherPos = getPosASL _posSmoother;
			private _dirVec = _smootherPos vectorFromTo (getPosASL _baseObj);
			private _distance = (_posSmoother distance _baseObj) min _movement;
			private _moveVec = _dirVec vectorMultiply _distance;

			_posSmoother setPosASL (_smootherPos vectorAdd _moveVec);

			_lastRun = CBA_missionTime;
			private _plyDist = _posSmoother distance player;
			sleep (((_plyDist * 0.0004) max 0.0333) min 2);

		};

	}
	else
	{
		while {alive _baseObj and {alive _posSmoother}} do
		{
			private _movement = _maxVel * (CBA_missionTime - _lastRun);
			private _smootherPos = getPosASL _posSmoother;
			private _dirVec = _smootherPos vectorFromTo (getPosASL _baseObj);
			private _distance = (_posSmoother distance _baseObj) min _movement;
			private _moveVec = _dirVec vectorMultiply _distance;

			_posSmoother setPosASL (_smootherPos vectorAdd _moveVec);

			_lastRun = CBA_missionTime;
			sleep 0.5;

		};

	};

};




_sparkyAttack =
{
	params ["_units", "_objPosASL"];

	[_objPosASL] remoteExec ["f_fnc_fxAttackMegaSparkyAnomaly", 0];

	sleep 0.2;

	{
		_distance = floor ((getPosASL _x) vectorDistance _objPosASL) / 10;

		if (_x isKindOf "CAManBase") then
		{
			[_x, (18 - _distance), nil, nil, [0.6, 0.7, 0.9]] remoteExec ["f_fnc_woundUnitRandomly", _x, false];
		}
		else
		{
			_damage = damage _x;
			_x setDamage _damage + (1 - _distance * 0.05);
		};

	} forEach _units;

	(ASLToAGL _objPosASL) spawn
	{
		sleep 0.3;
		_boom = "Sh_155mm_AMOS" createVehicle [_this#0, _this#1, 0];
		_boom setVectorDir [0, 0, -1];
		_boom setVelocity [0, 0, -1000];
		_boom setDamage 1;
	};

};



if (isServer) then
{
	[_obiect_orb, _sparkyAttack] spawn
	{
		sleep 12;

		params ["_obiect_orb", "_sparkyAttack"];

		while {alive _obiect_orb} do
		{
			_list_units_in_range = (getPosATL _obiect_orb) nearEntities [["CAManBase", "Air", "Car", "Motorcycle", "Tank"], 90];
			_list_units_in_range = _list_units_in_range select {(isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])}};

			if (count _list_units_in_range > 0) then
			{
				[_list_units_in_range, (getPosASL _obiect_orb)] call _sparkyAttack;
				sleep 7;
			};

			sleep 2;

		};

	};

};




if (isServer) then
{
	waitUntil { sleep 0.5; _baseObj distance _obiect_orb > 5; };
	[[], getPosASL _obiect_orb] call _sparkyAttack;
};



_lastPos = getPosASL _obiect_orb;

waitUntil
{
	if (alive _obiect_orb) then {_lastPos = getPosASL _obiect_orb;};

	sleep 1;

	(!(alive _baseObj)) or {!(alive _obiect_orb)} or {!(alive _posSmoother)}

};



if (isServer) then
{
	[[], _lastPos] call _sparkyAttack;
};



deleteVehicle _baseObj;
deleteVehicle _obiect_orb;
deleteVehicle _posSmoother;
