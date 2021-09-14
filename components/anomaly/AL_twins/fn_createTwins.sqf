//null=[object_anomaly,tracking_distance,electric_sparks,damage_range,effect_on_AI] execvm "AL_twins\sparky.sqf"

private ["_track_dist","_poz_spark"];

if (!isServer) exitWith {};

_spark_pos_asl  = _this select 0;
_track_dist		= _this select 1;
_spark_effect	= _this select 2;
_damage_range	= _this select 3;
_effect_on_AI	= _this select 4;

_spark_obj = "Land_AncientHead_01_F" createVehicle (ASLToAGL _spark_pos_asl);

if (_spark_effect) then
{
	_poz_spark = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	[_poz_spark, true] remoteExec ["hideObjectGlobal",0,true]
};

if (_effect_on_AI) then
{
	[_spark_obj, _damage_range] remoteExec ["f_fnc_twinsAiDamageLoop", 2];
};

_pauza = 5;

[_spark_obj,_damage_range] remoteExec ["f_fnc_twinsClientDamageLoop", 0, _spark_obj];

_spark_obj setVariable ["vizibil", 0, true];

[_spark_obj,_track_dist,_damage_range] spawn
{
	_spark_move = _this select 0;
	_tracking_p	= _this select 1;
	_dam_range	= _this select 2;

	_allow_move = 15;
	_closest_units = [];
	_incr = 0;

	_vizibil = true;

	while {alive _spark_move} do
	{
		_closest_units = (position _spark_move) nearEntities ["CAManBase", _tracking_p];
		_closest_units = _closest_units select {(isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])}};

		if (_spark_move getVariable "vizibil" < 1) then
		{
			if ((count _closest_units > 0) and (_allow_move > 10)) then
			{
				_closer_un = _closest_units select 0;

				if ((_closer_un distance _spark_move) > _dam_range) then
				{
					_dir_depl = [_closer_un, _spark_move] call BIS_fnc_dirTo;
					_pos_umbla = [getPosATL _spark_move, _incr, _dir_depl] call BIS_fnc_relPos;
					_spark_move setPosATL _pos_umbla;
					_spark_move setDir _dir_depl;
					_incr = _incr - (15 + floor (random 11));
					_allow_move = 0;

				};

			};

			_allow_move = _allow_move + 3;

		}
		else
		{
			_allow_move = 0
		};

		sleep 2;
	};

	deleteVehicle _spark_move;

};

if (_spark_effect) then
{
	while {alive _spark_obj} do
	{
		_spark_poz_rel = ["st","dr","ct"] call BIS_fnc_selectRandom;

		if (_spark_poz_rel=="st") then {_poz_spark attachTo [_spark_obj,[-12,0,12.35]]};
		if (_spark_poz_rel=="dr") then {_poz_spark attachTo [_spark_obj,[11.5,0,12.35]]};
		if (_spark_poz_rel=="ct") then {_poz_spark attachTo [_spark_obj,[-0.3,0,12.2]]};

		_spark_obj setDamage 0;
		_sclipiri = 1+ floor (random 5);

		sleep _pauza;

		_nr = 0;

		while {_nr<_sclipiri} do
		{
			_pauza_intre_sclipiri = 0.1 + (random 2);
			[_poz_spark, _pauza_intre_sclipiri] remoteExec ["f_fnc_twinsSparkEffect"];
			sleep _pauza_intre_sclipiri;

			_nr=_nr+1;
		};

	};

	deleteVehicle _poz_spark;

};
