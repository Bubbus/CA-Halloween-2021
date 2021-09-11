// by ALIAS
// Cleaned up and edited by Bubbus

#include "../macros.hpp"

if (!isServer) exitWith {};

params ["_poz_orig_sc"];

private _grp = createGroup CIVILIAN;
private _entitate = _grp createUnit ["B_Soldier_VR_F", ASLToAGL _poz_orig_sc, [], 0, "NONE"];

_entitate setSpeaker "NoVoice";
_entitate disableConversation true;
_entitate setCaptive true;
_entitate addRating -10000;

removeAllItems _entitate;
removeUniform _entitate;
removeVest _entitate;
removeHeadgear _entitate;
removeAllWeapons _entitate;

_entitate unassignItem "NVGoggles";
_entitate removeItem "NVGoggles";

_entitate setBehaviour "CARELESS";
_entitate enableFatigue false;
_entitate setSkill ["courage", 1];
_entitate setUnitPos "UP";

_entitate allowDamage false;
_entitate addEventHandler ["HandleDamage", {0}];

// vizibility
[_entitate, true] remoteExec ["hideObject", 0, _entitate];

// apparence
private _screamer_anomally = createVehicle ["Land_AncientStatue_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_screamer_anomally attachTo [_entitate, [0, 0.5, 0.5], "spine3"];
_screamer_anomally setVectorDirAndUp [[0,-1,0], [0,0,1]];
_screamer_anomally setMass 1;

private _bob1 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
private _bob2 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
private _bob3 = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];

[_bob1, true] remoteExec ["hideObject", 0, _bob1];
[_bob2, true] remoteExec ["hideObject", 0, _bob2];
[_bob3, true] remoteExec ["hideObject", 0, _bob3];

_bob1 attachTo [_screamer_anomally, [0, -6, 0.5]];
_bob2 attachTo [_screamer_anomally, [0, -19, 0.5]];
_bob3 attachTo [_screamer_anomally, [0, -42, 0.5]];

sleep 3;

while {alive _entitate} do
{
	if ((count (_entitate nearEntities ["Man", 100])) > 1) then
	{
		private _teleport = false;

		while {!_teleport and (alive _entitate)} do
		{
			private ["_press_implicit_y","_press_implicit_x"];
			_teleport = (count (_entitate nearEntities ["Man", 150]) < 2);

			private _pot_tgt = _entitate nearEntities ["Man", 100];
			private _poz = getPos (_pot_tgt call BIS_fnc_selectRandom);

			private _wave_obj = createVehicle ["Land_Battery_F", getPos _screamer_anomally, [], 0, "CAN_COLLIDE"];
			_wave_obj setMass 10;
			_entitate doMove _poz;
			[_screamer_anomally, ["miscare_screamer",300]] remoteExec ["say3d"];
			sleep 5;

			_entitate lookAt _poz;
			doStop _entitate;
			sleep 2;

			_wave_obj attachTo [_screamer_anomally, [0,-1,1.5]];
			detach _wave_obj;

			//effect
			if (alive _entitate) then
			{
				[_wave_obj,_screamer_anomally] remoteExec ["f_fnc_fxScreamerAttack"];
			};

			private _dir_blast = getDir _entitate;

			private _al_pressure = 90;

			if (_dir_blast <= 90) then
			{
				_press_implicit_x = linearConversion [0, 90, _dir_blast, 0, 1, true];
				_press_implicit_y = 1 - _press_implicit_x;
			};

			if ((_dir_blast > 90) and (_dir_blast < 180)) then
			{
				_dir_blast = _dir_blast - 90;
				_press_implicit_x = linearConversion [0, 90, _dir_blast, 1, 0, true];
				_press_implicit_y = _press_implicit_x - 1;
			};

			if ((_dir_blast > 180) and (_dir_blast < 270)) then
			{
				_dir_blast = _dir_blast - 180;
				_press_implicit_x = linearConversion [0, 90, _dir_blast, 0, -1, true];
				_press_implicit_y = (-1 * _press_implicit_x) - 1;
			};

			if ((_dir_blast > 270) and (_dir_blast < 360)) then
			{
				_dir_blast = _dir_blast - 270;
				_press_implicit_x = linearConversion [0, 90, _dir_blast, -1, 0, true];
				_press_implicit_y = 1 + _press_implicit_x;
			};

			[_entitate] call f_fnc_aiFleeObject;

			private _unitHarmedSet = createHashMap;
			private _screamerPos = getPosASL _entitate;

			private _units_range_1 = (getPos _bob1) nearEntities ["CAManBase", 5];
			{
				private _objectUID = _x call f_fnc_getObjectUID;
				if (_unitHarmedSet getOrDefault [_objectUID, false]) then { continue };

				[_x, _screamerPos] remoteExec ["f_fnc_applyScreamerTargetDamage", _x];
				_unitHarmedSet set [_objectUID, true];

			} foreach _units_range_1;

			sleep 0.2;

			private _units_range_2 = (getPos _bob2) nearEntities ["CAManBase", 10];
			{
				private _objectUID = _x call f_fnc_getObjectUID;
				if (_unitHarmedSet getOrDefault [_objectUID, false]) then { continue };

				[_x, _screamerPos] remoteExec ["f_fnc_applyScreamerTargetDamage", _x];
				_unitHarmedSet set [_objectUID, true];

			} foreach _units_range_2;

			sleep 0.2;

			private _units_range_3 = (getPos _bob3) nearEntities ["CAManBase", 15];
			{
				private _objectUID = _x call f_fnc_getObjectUID;
				if (_unitHarmedSet getOrDefault [_objectUID, false]) then { continue };

				[_x, _screamerPos] remoteExec ["f_fnc_applyScreamerTargetDamage", _x];
				_unitHarmedSet set [_objectUID, true];

			} foreach _units_range_3;

			_wave_obj setVelocity ([_press_implicit_x, _press_implicit_y, 0] vectorMultiply _al_pressure);

			sleep 1;
			deleteVehicle _wave_obj;
			sleep 1;

		};

	};

	sleep 5;

};

deleteVehicle _entitate;
[_screamer_anomally] remoteExec ["f_fnc_fxScreamerTeleport"];

sleep 4;

deleteVehicle _screamer_anomally;
