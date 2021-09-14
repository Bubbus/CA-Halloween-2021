// by ALIAS

if (!hasinterface) exitWith {};

waitUntil {time > 0};

_obj_emit = _this select 0;
_dist_damage = _this select 1;

_sun_ini= "none";

_token = 13;

[_obj_emit,_dist_damage] spawn
{
	_electromagnetic_anom 	= _this select 0;
	_dist_damage_w			= _this select 1;

	private ["_aberat","_dist_damage_w"];
	_play_sunet = true;

	while {alive _electromagnetic_anom} do
	{
		waitUntil {(player distance _electromagnetic_anom < _dist_damage_w) and {(isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])}};

		_damage_p = getDammage player;

		[_electromagnetic_anom,_dist_damage_w] spawn
		{
			_electr_viz = _this select 0;
			_dist_dam_w	= _this select 1;

			_aberat = ppEffectCreate ["ChromAberration", 250];
			_aberat ppEffectEnable true;
			enableCamShake true;

			while {player distance _electr_viz < _dist_dam_w} do
			{
				addCamShake [1,4,33];
				_aberat ppEffectAdjust[1, 0.8, true];
				_aberat ppEffectCommit 3;

				sleep 3;

				addCamShake [1,4,33];
				_aberat ppEffectAdjust[0, 0, true];
				_aberat ppEffectCommit 3;

				sleep 3;
			};

			_aberat ppEffectEnable false;
			ppEffectDestroy _aberat;
			enableCamShake false;

		};

		if (_play_sunet) then
		{
			_play_sunet = false;
			playSound "AL_twins_sound_twin";

			[player, 3, nil, nil, [0.5, 0.6, 0.9]] call f_fnc_woundUnitRandomly;

			sleep 9;

			_play_sunet = true;
		};

	};

};

_viz_fct=0;

while {alive _obj_emit} do
{
	waitUntil {(player distance _obj_emit) < 1500};
	_dir_rel = [player, _obj_emit] call BIS_fnc_dirTo;
	_cam_dir = [0,0,0] getdir getCameraViewDirection player;

	if ((abs (_dir_rel - _cam_dir) <= 46) or (abs (_dir_rel - _cam_dir) >= 314)) then
	{
		if (_viz_fct < 1) then
		{
			_viz_fct = _viz_fct + 1;
			_total_viz = _obj_emit getVariable "vizibil";
			_total_viz = _total_viz + 1;
			_obj_emit setVariable ["vizibil", _total_viz, true];
		};

	}
	else
	{
		_main_obj_sun = ["AL_twins_metalic1","AL_twins_metalic2","AL_twins_metalic3","AL_twins_metalic4","AL_twins_metalic5"] call BIS_fnc_selectRandom;

		if ((_sun_ini!=_main_obj_sun) and (_token>12)) then
		{
			_obj_emit say3D [_main_obj_sun, 1500];
			_token = 0
		};

		_token= _token + 0.2;
		_sun_ini = _main_obj_sun;

		if (_viz_fct > 0) then
		{
			_viz_fct = _viz_fct - 1;
			_total_viz = _obj_emit getVariable "vizibil";
			_total_viz=_total_viz - 1;
			_obj_emit setVariable ["vizibil", _total_viz, true];
		};

	};

	sleep 0.2;

};
