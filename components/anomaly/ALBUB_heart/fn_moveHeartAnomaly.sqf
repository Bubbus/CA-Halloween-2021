#include "..\macros.hpp"

RUN_AS_ASYNC(f_fnc_moveHeartAnomaly);

WAIT_UNTIL_MISSION_STARTED();

// by ALIAS
var_heartAnomaly_visibleDistance = 1000;

_baseObj = _this select 0;

if !(alive _baseObj) exitWith {};

private _obiect_orb = (typeOf _baseObj) createVehicle (getPos _baseObj);
_obiect_orb enableSimulation false;
missionNamespace setVariable ["heart_floater_obj", _obiect_orb];

if (isServer) then
{
    _baseObj hideObjectGlobal true;
	_obiect_orb hideObjectGlobal true;

	if !(isNil 'kyk_ew_fnc_broadcastJammerAdd') then
	{
		[_obiect_orb, random [400, 500, 600], 0, 0, 0, 0, 0] call kyk_ew_fnc_broadcastJammerAdd;
	};
};

if (hasInterface) then
{	
	_obiect_orb hideObject false;
    _obiect_orb setVectorDirAndUp [vectorDir _baseObj, vectorUp _baseObj];

    [_obiect_orb, _baseObj] spawn
    {
        params ["_obiect_orb", "_baseObj"];

        private _xMod = 8;
        private _yMod = 8;
        private _zMod = 12;
        private _ang = 0;

		private _basePosASL = getPosASL _baseObj;

        while {alive _baseObj} do
        {            
            _obiect_orb setPosASL [_basePosASL#0 + (sin (CBA_missionTime * _xMod)) * 1.5, _basePosASL#1 + (cos (CBA_missionTime * _yMod)) * 1.5, _basePosASL#2 + (sin (CBA_missionTime * _zMod)) * 1.5];

            _dir = [cos _ang, sin _ang, 0];
            _ang = (CBA_missionTime * 2) mod 360;
            _obiect_orb setVectorDir _dir;

            _distance = _obiect_orb distance player;
            sleep ((((_distance - 150) * 0.001666) max 0.0333) min 2);
        };

    };

};



if (hasInterface) then
{
	[_obiect_orb] spawn
	{
		params ["_obiect_orb"];

		while {alive _obiect_orb} do
		{
			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb < var_heartAnomaly_visibleDistance}};

			if !(alive _obiect_orb) exitWith {};

			private _ele = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_ele setParticleCircle [0, [0, 0, 0]];
			_ele setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_ele setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.6, [0, 0, 0], [0, 0, 0], 0.15, 11, 7.9, 0.075, [0.16, 0.20, 0.12], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiect_orb];
			_ele setDropInterval 0.015;

			private _glow = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_glow setParticleCircle [0, [0, 0, 0]];
			_glow setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_glow setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [30, 30, 20], [[0.8, 0.02, 0.015, 0.3], [1, 0.12, 0.1, 0.2], [1, 0.24, 0.2, 0]], [0.08], 1, 0, "", "", _obiect_orb];
			_glow setDropInterval 0.3;

			private _heat = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_heat setParticleCircle [0, [0, 0, 0]];
			_heat setParticleRandom [0, [11, 11, 11], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_heat setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.25], 0, 14.6, 11, 0, [4, 6, 8], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 1], [0.5, 0.5, 0.5, 0.5]], [0.08], 1, 0, "", "", _obiect_orb];
			_heat setDropInterval 0.015;

			private _orb_lit = "#lightpoint" createVehiclelocal (getPosATL _obiect_orb);
			_orb_lit lightAttachObject [_obiect_orb, [0,0,0]];
			_orb_lit setLightColor [1,0.61,0.55];
			_orb_lit setLightAmbient [1,0.31,0.27];
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
					_this setLightIntensity (1000 + ((sin (CBA_missionTime * 45)) * 500) + random 250);
					sleep 0.016;
				};

			};

			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb > var_heartAnomaly_visibleDistance}};

			deleteVehicle _ele;
			deleteVehicle _glow;
			deleteVehicle _heat;
			deleteVehicle _orb_lit;

			if !(alive _obiect_orb) exitWith {};

		};

	};

};



_sparkyAttack =
{
	params ["_units", "_objPosASL"];

	[_objPosASL] remoteExec ["f_fnc_fxAttackHeartAnomaly", 0];

	sleep 0.2;

	{
		private _distance = floor ((getPosASL _x) vectorDistance _objPosASL) / 10;

		if (_x isKindOf "CAManBase") then
		{
			[_x, 12 - _distance, nil, nil, [0.5, 0.6, 0.7]] call f_fnc_woundUnitRandomly;
		}
		else
		{
			private _damage = damage _x;
			_x setDamage _damage + (1 - _distance * 0.05);
		};

	} forEach _units;

};



if (isServer) then
{
	[_obiect_orb, _sparkyAttack] spawn
	{
		sleep 12;

		params ["_obiect_orb", "_sparkyAttack"];

		while {alive _obiect_orb} do
		{
			private _list_units_in_range = _obiect_orb nearEntities [["CAManBase", "Air", "Car", "Motorcycle", "Tank"], 69];
			_list_units_in_range = _list_units_in_range select {(isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])} and {!(_x getVariable ["hasHammer", false])}};

			if (count _list_units_in_range > 0) then
			{
				[_list_units_in_range, (getPosASL _obiect_orb)] call _sparkyAttack;
				sleep 20;
			};

			sleep 2;

		};

	};

};


private _lastPos = getPosASL _obiect_orb;

waitUntil
{
	if (alive _obiect_orb) then {_lastPos = getPosASL _obiect_orb;};

	sleep 1;

	(!(alive _baseObj)) or {!(alive _obiect_orb)}

};



if (isServer) then
{
	[[], _lastPos] call _sparkyAttack;
};



deleteVehicle _baseObj;
deleteVehicle _obiect_orb;
