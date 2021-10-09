// by ALIAS

private ["_obj_sursa","_mark_sursa","_toxic_center","_toxic_rad","_toxic_dam","_d_pre","_center_toxic","_amplificat_effect"];

if (!hasInterface) exitWith {};

_obj_sursa	= _this select 0;
_toxic_rad	= _this select 1;
_toxic_dam	= _this select 2;

_center_toxic = getPosATL _obj_sursa;

while {alive _obj_sursa} do
{
	waitUntil {alive player};

	private "_isInRadius";
	waitUntil
	{
		sleep 1;
		_isInRadius = (player distance _center_toxic) < _toxic_rad;
		_isInRadius
	};

	player setVariable ["inFartyAnomaly", true, true];
	player setVariable ["lastOkInFarty", CBA_missionTime, true];

	while {_isInRadius and {alive _obj_sursa}} do
	{
		if !((isDamageAllowed player) and {!(player getVariable ["anomalyIgnore", false])}) then
		{
			player setVariable ["lastOkInFarty", CBA_missionTime, true];
			sleep (1.2 + random 1)
		}
		else
		{
			["DynamicBlur", 400, [1]] spawn
			{
				params ["_name", "_priority", "_effect", "_handle"];
				while
				{
					_handle = ppEffectCreate [_name, _priority];
					_handle < 0
				}
				do
				{
					_priority = _priority + 1;
					sleep 0.01;
				};

				_handle ppEffectEnable true;
				_handle ppEffectAdjust _effect;
				_handle ppEffectCommit 1;


				enableCamShake true;
				addCamShake [0.5, 3, 17];

				_afect = ["NoSound","NoSound","01_breat_toxic","NoSound","NoSound","02_breat_toxic","NoSound","NoSound","03_breat_toxic","NoSound","NoSound","04_breat_toxic"] call BIS_fnc_selectRandom;
				playsound _afect;
				playsound "puls_1";

				if (_afect isNotEqualTo "NoSound") then
				{					
					[player, 1, nil, ["body"], [0.2, 0.3, 0.5]] call f_fnc_woundUnitRandomly;
				};

				waitUntil {ppEffectCommitted _handle};
				uiSleep 1;

				_handle ppEffectAdjust [0];
				_handle ppEffectCommit 1;

				uiSleep 2;

				_handle ppEffectEnable false;
				ppEffectDestroy _handle;

			};

			if ((CBA_missionTime - (player getVariable ["lastOkInFarty", CBA_missionTime])) > (random [20, 25, 30])) then
			{
				[player, true, 20, true] call ace_medical_fnc_setUnconscious;
				player setVariable ["lastOkInFarty", CBA_missionTime + 20, true];
			};

			sleep 4;

		};

		_isInRadius = (player distance _center_toxic) < _toxic_rad;

	};

	player setVariable ["inFartyAnomaly", false, true];

	sleep 0.1;
};
