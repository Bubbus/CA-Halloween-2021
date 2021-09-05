// by ALIAS

#define IS_UNCONSCIOUS(UNIT)        ((UNIT getVariable ["ACE_isUnconscious", false]) and {alive UNIT})
#define IS_INCAPACITATED(UNIT)        ((UNIT getVariable ["ACE_isUnconscious", false]) or {!(alive UNIT)})

if (!isServer) exitWith {};

params ["_poz_orig_sc", "_teritoriu", "_damage_flamer", "_hp_flamer"];


_origin_flamer = "Land_ClutterCutter_large_F" createVehicle _poz_orig_sc;
_origin_flamer setPosASL _poz_orig_sc;

_flamer = createAgent ["O_Soldier_VR_F", _poz_orig_sc, [], 0, "NONE"];
_flamer setVariable ["ace_medical_allowDamage", false, true];
_flamer setVariable ["originProp", _origin_flamer, true];

_flamer setVariable ["BIS_fnc_animalBehaviour_disable", true];
_flamer setSpeaker "NoVoice";
_flamer disableConversation true;
_flamer addRating -10000;
_flamer setBehaviour "CARELESS";
_flamer enableFatigue false;
_flamer setSkill ["courage", 1];
_flamer setUnitPos "UP";
_flamer disableAI "ALL";
_flamer setMass 7000;
_flamer setVariable ["flamerState", "waiting", true];
_flamer setAnimSpeedCoef 1.5;

{
	_flamer enableAI _x;

} forEach ["MOVE","ANIM","TEAMSWITCH","PATH"];

_flamer setVariable ["flamerHp", _hp_flamer ,true];





[_origin_flamer, _flamer] spawn
{
	params ["_origin_flamer", "_flamer"];

	_originPos = getPos _origin_flamer;

	while {(alive _origin_flamer) and {alive _flamer}} do
	{
		waitUntil {sleep 1; !(getPos _origin_flamer isEqualTo _originPos)};
		waitUntil {sleep 1; _flamer getVariable ["flamerState", ""] isEqualTo "waiting"};

		_originPos = (getPos _origin_flamer);
		_flamer setPos _originPos;

	};

	deleteVehicle _origin_flamer;
	deleteVehicle _flamer;

};




_flamer removeAllEventHandlers "hit";
_flamer addEventHandler ["Hit", { [_this select 0] remoteExec ["f_fnc_fxSplashHitFlamerAnomaly"] }];




_flamerKilledHandler =
{
	params ["_flamer", "_killer"];

	if (isNull (_flamer getVariable ["originProp", objNull])) exitWith {deleteVehicle _flamer};

	_flamer hideObjectGlobal true;
	_killer addRating 2000;

	_boom = "rhs_rpg7v2_tbg7v" createVehicle (getPos _flamer vectorAdd [0,0,0.5]);
	_boom setVelocity [0, 0, -100];
	_boom setDamage 1;

	[_flamer] remoteExec ["f_fnc_fxDeathFlamerAnomaly"];

	_burn_grnd_last = "Crater" createVehicle [getPosASL _flamer select 0, getPosASL _flamer select 1, 0];
	_burn_grnd_last say3D ["close_bomb",300];

	_obj_veg = nearestTerrainObjects [position _flamer,["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"],20,false];
	_obj_man = _flamer nearEntities ["CAManBase",20];
	_obj_build = nearestObjects [position _flamer,["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER","Land_fs_roof_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_LampStreet_small_F","CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air","Ship"],20,false];

	{_x setDamage [1,false]} foreach (_obj_build - [_burn_grnd_last]);
	{_x setDamage [1,false]} foreach _obj_veg;

};

_flamer addEventHandler ["Killed", _flamerKilledHandler];




_flamer removeAllEventHandlers "HandleDamage";

_flamerDamageHandler =
{
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

	_curHp = _unit getVariable ["flamerHp", 0];
	_curHp = _curHp - _damage;

	if !((_instigator isEqualTo objNull) or {_instigator isEqualTo _unit}) then
	{
		_unit setVariable ["flamerHp", _curHp, true];

		if (_curHp <= 0) then {_unit setDamage 1};

	};

};

_flamer addEventhandler ["HandleDamage", _flamerDamageHandler];





_cap_flamer = "Land_HelipadEmpty_F" createVehicle [0,0,0];
_cap_flamer attachto [_flamer, [0,0,0.2], "neck"];
_flamer setVariable ["_cap_flamer", _cap_flamer, true];

for "_i" from 0 to 5 do
{
	_flamer setObjectMaterialGlobal [_i, "A3\Structures_F\Data\Windows\window_set.rvmat"];
	_flamer setObjectTextureglobal [_i, "#(argb,8,8,3)color(0,0,0,0)"];
};

_flamer setVariable ["atk",false];
_flamer call fnc_flamerAnomaly_hide_flamer;

[_flamer] remoteExec ["f_fnc_fxOrbFlamerAnomaly"];




(_this + [_flamer, _cap_flamer, _origin_flamer]) spawn
{
	params ["_poz_orig_sc", "_teritoriu", "_damage_flamer", "_hp_flamer", "_flamer", "_cap_flamer", "_origin_flamer"];

	_list_unit_range_flamer = [];

	while {alive _flamer} do
	{
		private _tgt_flamer = objNull;

		waitUntil
		{
			_result = selectRandom ([_flamer, _teritoriu] call fnc_flamerAnomaly_find_target_flamer);

			if !((isNil '_result') or {isNull _result}) exitWith { _tgt_flamer = _result; true };

			_players = allPlayers select {!(_x getVariable ["f_var_isZeus", false])};
			_distances = (allPlayers apply {_x distance _origin_flamer}) + [1000];
			_closest = selectMin _distances;

			sleep ((_closest / 100) min 10) max 2;
			false
		};

		if !(isNull _tgt_flamer) then
		{
			_flamer setVariable ["atk",false];
			_flamer call fnc_flamerAnomaly_hide_flamer;
			_flamer setVariable ["flamerState", "hiding", true];

			sleep 10;

			_showPos = 0.5 bezierInterpolation [(getPos _origin_flamer), (getPos _tgt_flamer)];
			[_flamer, _showPos, _teritoriu, _damage_flamer] call fnc_flamerAnomaly_show_flamer;

			while {(!(isNil "_tgt_flamer")) and {(alive _flamer) and {(_tgt_flamer distance _origin_flamer) < _teritoriu}}} do
			{
				_flamer setVariable ["flamerState", "targeting", true];
				_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5];

				{
					[_x, 5, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
					_tip = selectrandom ["04","burned","02","03"];
					[_x, [_tip,200]] remoteExec ["say3d"];

				} forEach (_nearflamer - [_flamer]);


				if (selectRandom [true,false,true,true,false]) then
				{
					_flamer moveTo AGLToASL (_tgt_flamer getRelPos [10,180]);
					[_flamer, _tgt_flamer] call fnc_flamerAnomaly_avoid_flamer
				}
				else
				{
					_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",7];

					_didHurt = false;
					{
						[_x, 5, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
						_tip = selectrandom ["04","burned","02","03"];
						[_x, [_tip,200]] remoteExec ["say3d"];
						_didHurt = true;

					} forEach (_nearflamer - [_flamer]);

					if (_didHurt) then
					{
						[_flamer] remoteExec ["f_fnc_fxJumpFlamerAnomaly"];
						[_flamer, _tgt_flamer, _cap_flamer] call fnc_flamerAnomaly_jump_flamer;

						waitUntil {sleep 0.1; !(_flamer getVariable ["flamerState", ""] isEqualTo "jumping")};

					};

				};


				_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",5];
				{
					[_x, 5, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
					_tip = selectrandom ["04","burned","02","03"];
					[_x, [_tip,200]] remoteExec ["say3d"];

				} forEach (_nearflamer - [_flamer]);

				if ((_flamer distance _tgt_flamer < 15) && !(_flamer getVariable "atk")) then
				{
					_flamer setVariable ["atk",true];
					[_flamer, _tgt_flamer, _damage_flamer] spawn fnc_flamerAnomaly_attack_flamer;

					sleep 0.5;

					[_tgt_flamer] remoteExec ["f_fnc_fxAttackFlamerAnomaly"];

					[_flamer] remoteExec ["f_fnc_fxJumpFlamerAnomaly"];
					[_flamer, _tgt_flamer, _cap_flamer] call fnc_flamerAnomaly_jump_flamer;

					waitUntil {sleep 0.1; !(_flamer getVariable ["flamerState", ""] isEqualTo "jumping")};

				};

				sleep 1;

				_nearflamer = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase",7];

				_didHurt = false;
				{
					[_x, 5, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
					_tip = selectrandom ["04","burned","02","03"];
					[_x, [_tip,200]] remoteExec ["say3d"];
					_didHurt = true;

				} forEach (_nearflamer - [_flamer]);

				if (_didHurt) then
				{
					[_flamer] remoteExec ["f_fnc_fxJumpFlamerAnomaly"];
					[_flamer, _tgt_flamer, _cap_flamer] call fnc_flamerAnomaly_jump_flamer;

					waitUntil {sleep 0.1; !(_flamer getVariable ["flamerState", ""] isEqualTo "jumping")};

				};


				if (IS_INCAPACITATED(_tgt_flamer) or {_tgt_flamer distance _poz_orig_sc > _teritoriu}) then
				{
					_list_unit_range_flamer = [_flamer, _teritoriu] call fnc_flamerAnomaly_find_target_flamer;

					if !(count _list_unit_range_flamer isEqualTo 0) then
					{
						_tgt_flamer = selectRandom _list_unit_range_flamer
					}
					else
					{
						_tgt_flamer = nil
					}

				};

			};

		};

		_flamer setVariable ["flamerState", "hiding", true];
		_flamer call fnc_flamerAnomaly_hide_flamer;

		sleep 5;

		_flamer setPos (getPos _origin_flamer);
		_flamer setVariable ["flamerState", "waiting", true];

		_tgt_flamer = nil;
		_list_unit_range_flamer = [];

		sleep 5;

	};

	detach _cap_flamer;
	deleteVehicle _cap_flamer;

	sleep 5;

	deleteVehicle _origin_flamer;
	deleteVehicle _flamer;

};


_origin_flamer
