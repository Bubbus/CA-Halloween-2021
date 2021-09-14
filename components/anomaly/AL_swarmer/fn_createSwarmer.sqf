// by ALIAS
// Cleaned up by Bubbus

#include "../macros.hpp"

if (!isServer) exitWith {};

if EXISTS(swarmer_public) exitWith {};

fnc_avoid_hive =
{
	params ["_hiver","_chased"];
	if (isPlayer _chased) exitWith {};
	_relPos = _chased getPos [50, (_hiver getDir _chased) + (random 33)*(selectRandom [1,-1])];
	_chased doMove _relPos;
	_chased setSkill ["commanding", 1];
};

fnc_find_target_hiv =
{
	params ["_hiver", "_teritoriu"];

	private _neartargets = (ASLToAGL getPosASL _hiver) nearEntities ["CAManBase", _teritoriu];
	_neartargets = _neartargets select {!(_x getVariable ["anomalyIgnore", false])};

	_neartargets
};

fnc_move_swarm =
{
	params ["_swarmerAgent","_tgt_hiv"];
	private ["_swarmerAgent","_tgt_hiv"];
	_swarmerAgent setdir ([_swarmerAgent,_tgt_hiv] call BIS_fnc_dirTo);
	_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,7,0])
};

fnc_ajust_poz =
{
	params ["_swarmerAgent","_tgt_hiv"];
	private ["_swarmerAgent","_tgt_hiv"];
	_swarmerAgent setdir ([_swarmerAgent,_tgt_hiv] call BIS_fnc_dirTo);
	_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0])
};

private ["_tgt_hiv"];


_startingPositionASL = _this select 0;
_territoryRadius = _this select 1;
_insecticideClass = _this select 2;
_damageToDeal = _this select 3;

insecticid = _insecticideClass;
publicVariable "insecticid";

_swarmerAgent = createAgent ["C_Soldier_VR_F", ASLToAGL _startingPositionASL, [], 0, "NONE"];
_swarmerAgent hideObjectGlobal true;
_swarmerAgent setVariable ["BIS_fnc_animalBehaviour_disable", true];
_swarmerAgent setSpeaker "NoVoice";
_swarmerAgent disableConversation true;
_swarmerAgent setBehaviour "CARELESS";
_swarmerAgent allowDamage false;
_swarmerAgent enableFatigue false;
_swarmerAgent setSkill ["courage", 1];
_swarmerAgent setUnitPos "UP";
_swarmerAgent disableAI "ALL";
{ _swarmerAgent enableAI _x } forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];
_swarmerAgent setAnimSpeedCoef 1.1;
_swarmerAgent setVariable ["isHive", false, true];
_swarmerAgent setVariable ["anomalyIgnore", true, true];
_swarmerAgent setVariable ["ace_medical_allowDamage", false, true];

[_swarmerAgent] remoteExec ["f_fnc_fxSwarmerSounds"];
[_swarmerAgent] remoteExec ["f_fnc_fxSwarmerFlies"];
//[_swarmerAgent] execVM "AL_swarmer\smoke_detect.sqf";

swarmer_public = _swarmerAgent;
publicVariable "swarmer_public";

atak_swarmer = false;
publicVariable "atak_swarmer";

while {alive _swarmerAgent} do
{
	while {!(_swarmerAgent getVariable "isHive")} do
	{
		{
			if (_x distance getPos _swarmerAgent < 1000) then
			{
				_swarmerAgent setVariable ["isHive",true,true]
			}

		} foreach allPlayers;

		sleep 10;

	};

	_swarmerAgent setVariable ["tgt", nil, true];
	_list_unit_range_hiv = [_swarmerAgent, _territoryRadius] call fnc_find_target_hiv;

	if (count _list_unit_range_hiv > 0) then
	{
		_tgt_hiv = selectRandom _list_unit_range_hiv;
		_swarmerAgent setVariable ["tgt",_tgt_hiv,true];

		{
			[_swarmerAgent,_x] spawn fnc_avoid_hive

		} foreach _list_unit_range_hiv;

		_swarmerAgent disableCollisionWith _tgt_hiv;

		while {(alive _tgt_hiv) and (_tgt_hiv distance _swarmerAgent < _territoryRadius)} do
		{
			if (_tgt_hiv distance _swarmerAgent > 10) then
			{
				_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,7,0])
			};

			sleep 4;

			if ((_tgt_hiv distance _swarmerAgent <= 10) and (alive _swarmerAgent)) then
			{
				atak_swarmer = true;
				publicVariable "atak_swarmer";// hint str atak_swarmer;

				_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]);

				atinge=false;
				publicVariable "atinge";

				waitUntil {atinge};

				_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]);

				if (alive _swarmerAgent) then
				{
					[_tgt_hiv, _swarmerAgent] remoteExec ["f_fnc_fxSwarmerEating"];
					_tgt_hiv setdamage ((damage _tgt_hiv) + _damageToDeal);
				};

				//_swarmerAgent moveTo AGLToASL (_tgt_hiv modelToWorld [0,0,0]);
				{[_swarmerAgent,_x] spawn fnc_avoid_hive} foreach _list_unit_range_hiv;

				//for "_i" from 0 to 3 do	{[_swarmerAgent,_tgt_hiv] spawn fnc_ajust_poz; sleep 3};
				sleep 10;

				atinge=false;
				publicVariable "atinge";

				atak_swarmer = false;
				publicVariable "atak_swarmer";// hint str atak_swarmer;

				//{[_swarmerAgent,_x] spawn fnc_avoid_hive} foreach _list_unit_range_hiv;
				_balta_sange = createVehicle [selectrandom ["BloodPool_01_Large_New_F","BloodSplatter_01_Large_New_F"], [0,0,0], [], 0, "CAN_COLLIDE"];
				_balta_sange setDir (round (random 360));
				_balta_sange setposATL [getPosATL _tgt_hiv # 0,getPosATL _tgt_hiv # 1,0];
				_balta_sange setVectorUp surfaceNormal getPosASL _balta_sange;

				_swarmerAgent setpos (position _balta_sange);
				_swarmerAgent stop true;

				[_balta_sange, ["AL_swarmer_roi_atk_01", 300]] remoteExec ["say3d"];
				sleep 5;

				_swarmerAgent stop false;

				{
					[_swarmerAgent,_x] spawn fnc_avoid_hive

				} foreach _list_unit_range_hiv;

			};

		};

		if (!alive _tgt_hiv) then
		{
			[_swarmerAgent,_tgt_hiv] spawn fnc_ajust_poz;
			sleep 2;

			_swarmerAgent stop true;
			[_tgt_hiv, _swarmerAgent] remoteExec ["f_fnc_fxSwarmerEating"];

			_tgt_hiv hideObjectGlobal true;
			_oase = createVehicle ["Land_HumanSkeleton_F", getposATL _tgt_hiv, [], 0, "CAN_COLLIDE"];
			_oase setDir (round (random 360));

			_swarmerAgent setVariable ["tgt",nil,true];

			atak_swarmer = false;
			publicVariable "atak_swarmer";

			sleep 12;

			_swarmerAgent stop false;

		};

	}
	else
	{
		_swarmerAgent setVariable ["isHive",false,true];
		atak_swarmer = false;
		publicVariable "atak_swarmer";
		sleep 5;

	};

};

sleep 30;
deleteVehicle _swarmerAgent;
