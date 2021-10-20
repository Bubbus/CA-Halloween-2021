//null=[object_anomaly,tracking_distance,electric_sparks,damage_range,effect_on_AI] execvm "AL_twins\sparky.sqf"

private ["_poz_spark"];

if (!isServer) exitWith {};

private _spark_pos_asl  = _this select 0;
private _track_dist		= _this select 1;
private _damage_range	= _this select 2;
private _effect_on_AI	= _this select 3;

private _spark_obj = "Land_AncientHead_01_F" createVehicle (ASLToAGL _spark_pos_asl);

if (_effect_on_AI) then
{
	[_spark_obj, _damage_range] remoteExec ["f_fnc_twinsAiDamageLoop", 2];
};

private _pauza = 5;

[_spark_obj, _damage_range] remoteExec ["f_fnc_twinsClientDamageLoop", 0, _spark_obj];

_spark_obj setVariable ["visibleToPlayersCount", 0, true];

[_spark_obj, _track_dist, _damage_range] spawn
{
	private _spark_move = _this select 0;
	private _tracking_p	= _this select 1;
	private _dam_range	= _this select 2;

	private _allow_move = 15;
	private _closest_units = [];
	private _incr = 0;

	while {alive _spark_move} do
	{
		private _closest_units = (position _spark_move) nearEntities ["CAManBase", _tracking_p];
		_closest_units = _closest_units select {(isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])}};

		private _visibleToPlayersCount = _spark_move getVariable ["visibleToPlayersCount", 0];
		if (_visibleToPlayersCount <= 0) then
		{
			if ((count _closest_units > 0) and (_allow_move > 10)) then
			{
				private _closer_un = _closest_units select 0;

				if ((_closer_un distance _spark_move) > _dam_range) then
				{
					private _dir_depl = [_closer_un, _spark_move] call BIS_fnc_dirTo;
					private _pos_umbla = [getPosATL _spark_move, _incr, _dir_depl] call BIS_fnc_relPos;

					_spark_move setPosATL _pos_umbla;
					_spark_move setDir _dir_depl;

					_incr = _incr - (5 + floor (random 6));
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

