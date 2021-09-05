// by ALIAS

var_burperAnomaly_visibleDistance = 300;

fnc_burperAnomaly_sfx_primar =
{
	private ["_obj_sfx_princ","_work_primar","_source_burp","_spot_lit","_r_col_burp","_g_col_burp","_b_col_burp","_brit_burp"];

	_work_primar	= _this select 0;
	_obj_sfx_princ	= _this select 1;

	[_obj_sfx_princ] spawn
	{
		_burper_obj_sec_sound=_this select 0;

		while {!isNull _burper_obj_sec_sound} do
		{
			_burper_obj_sec_sound say3D ["vortex", 50];
			sleep 8;
		};

	};

	_source_burp = "#particlesource" createVehicleLocal (getPosATL _obj_sfx_princ);
	_source_burp setParticleCircle [0, [0, 0, 0]];
	_source_burp setParticleRandom [0, [0.25, 0.25, 0], [5, 5, 5], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_source_burp setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.3, [0, 0, 2], [0, 0, 0], 17, 10, 7.9, 0.007, [4,0.5], [[0, 0, 0, 1],[0, 0, 0, 1]], [0.08], 1, 0, "", "", _obj_sfx_princ];
	_source_burp setDropInterval 0.01;

	_spot_lit = "#lightpoint" createVehicle (getPosATL _obj_sfx_princ);
	_spot_lit lightAttachObject [_obj_sfx_princ, [0.1,0.1,3]];
	_spot_lit setLightUseFlare false;
	_spot_lit setLightFlareSize 1;
	_spot_lit setLightFlareMaxDistance 1500;
	_spot_lit setLightAttenuation [0,0,50,1000,1,50];

	while {(alive _work_primar) and {(player distance _work_primar) < 1500}} do
	{
		_r_col_burp=random 1;
		_g_col_burp=random 1;
		_b_col_burp=random 1;

		_brit_burp =10+random 30;

		_spot_lit setLightColor [_r_col_burp,_g_col_burp,_b_col_burp];
		_spot_lit setLightAmbient [_g_col_burp,_r_col_burp,_b_col_burp];
		_spot_lit setLightDayLight true;

		sleep 0.5;

		_spot_lit setLightBrightness _brit_burp;

		sleep 0.5;

		while {_brit_burp>8} do
		{
			_spot_lit setLightBrightness _brit_burp;
			_brit_burp=_brit_burp-0.5;

			sleep 0.1;
		};

		sleep 1+ random 5;
	};

	deleteVehicle _source_burp;
	deleteVehicle _spot_lit;

};




fnc_burperAnomaly_sfx_secundar =
{
	private ["_obj_sfx_sec","_work_sfx_sec","_effect_sp_dist","_dust_eff","_blast_blurp","_blast_dust"];
	_work_sfx_sec = _this select 0;
	_obj_sfx_sec = _this select 1;

	while {(alive _work_sfx_sec) and {(player distance _work_sfx_sec) < var_burperAnomaly_visibleDistance}} do
	{
		if ((player distance _work_sfx_sec) < 100) then
		{
			_sunet_blast = ["01_blast","02_blast","03_blast"] call BIS_fnc_selectRandom;
			enableCamShake true;
			addCamShake [1,4,13+(random 33)];
			_work_sfx_sec say3D [_sunet_blast, 100]
		};

		if ((player distance _work_sfx_sec) > 100) then
		{
			_far_sunet_blast = ["01_far_blast","02_far_blast","03_far_blast"] call BIS_fnc_selectRandom;
			_work_sfx_sec say3D [_far_sunet_blast, 500]
		};

		_blast_blurp = "#particlesource" createVehicleLocal (getPosATL _obj_sfx_sec);
		_blast_blurp setParticleCircle [5, [-3, -3, 0]];
		_blast_blurp setParticleRandom [2, [6, 6, 0], [-7, -7, 0], 5, 1, [0, 0, 0, 1], 1, 1];
		_blast_blurp setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [2, 2, 2], 0, 12, 7.9, 0.075, [2, 2, 2], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_sfx_sec];
		_blast_blurp setDropInterval 0.005;

		_blast_dust = "#particlesource" createVehicleLocal (getPosATL _obj_sfx_sec);
		_blast_dust setParticleCircle [3, [-3, -3, 0]];
		_blast_dust setParticleRandom [2, [2, 2, 0], [-7, -7, 0], 5, 1, [0, 0, 0, 1], 1, 1];
		_blast_dust setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [0, 0, 0.1], 0, 10, 7.9, 0.075, [1, 3, 5], [[0.3, 0.27, 0.15, 0.1], [0.3, 0.27, 0.15, 0.01], [0.3, 0.27, 0.15, 0]], [0.08], 1, 0, "", "", _obj_sfx_sec];
		_blast_dust setDropInterval 0.01;

		_effect_sp_dist = "#particlesource" createVehicleLocal (getPosATL _obj_sfx_sec);
		_effect_sp_dist setParticleCircle [0, [0, 0, 0]];
		_effect_sp_dist setParticleRandom [0, [0,0, 0], [0,0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_effect_sp_dist setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 1.5, [0, 0, 0], [0, 0, 0], 7, 10, 7.9, 0.007, [2, 2, 30, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj_sfx_sec];
		_effect_sp_dist setDropInterval 0.4;

		_dust_eff = "#particlesource" createVehicleLocal (getPosATL _obj_sfx_sec);
		_dust_eff setParticleCircle [0, [0, 0, 0]];
		_dust_eff setParticleRandom [0, [0,0, 0], [0,0, 0], 0,0, [0, 0, 0, 0], 0, 0];
		_dust_eff setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.75], 15, 10, 7.9, 0.001, [5, 10, 1], [[1, 1, 1, 0.01], [1, 1, 1, 0.05], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _obj_sfx_sec];
		_dust_eff setDropInterval 0.5;

		sleep 0.5+(random 1);
		deleteVehicle _blast_dust;
		deleteVehicle _blast_blurp;
		deleteVehicle _effect_sp_dist;
		deleteVehicle _dust_eff;
		sleep 5+(random 3);

	};

};




fnc_burperAnomaly_anim_burp =
{
	private ["_obj_anim","_b_dir","_h_bounce","_sus","_chek","_curr_chek","_fly_chek","_work_obj"];

	_obj_anim = _this select 0;
	_work_obj = _this select 1;
	_b_dir=0;

	while {(alive _work_obj) and {(player distance _obj_anim) < var_burperAnomaly_visibleDistance}} do
	{
		_b_dir = _b_dir+2;
		_obj_anim setdir _b_dir;

		_height = 1 + (cos (time * 180)) * 0.3;
		_obj_anim setPosATL [getposATL _work_obj select 0, getposATL _work_obj select 1, _height];
		sleep 0.01;
	};

};


private ["_work_obj"];

if (!hasInterface) exitWith {};

_work_obj = _this select 0;

while {alive _work_obj} do
{
	waitUntil {sleep 2; (player distance _work_obj) < var_burperAnomaly_visibleDistance};

	_burper_obj_sec = "Sign_Sphere25cm_F" createVehicleLocal [getposATL _work_obj select 0, getposATL _work_obj select 1, 0];
	_burper_obj_sec setPosATL [getposATL _work_obj select 0, getposATL _work_obj select 1, 0];
	_burper_obj_sec setObjectMaterial [0,"A3\Structures_F\Data\Windows\window_set.rvmat"];
	_burper_obj_sec setObjectTextureglobal [0, "res\01_burper.jpg"];

	[_work_obj,_burper_obj_sec] spawn fnc_burperAnomaly_sfx_primar;
	[_work_obj,_burper_obj_sec] spawn fnc_burperAnomaly_sfx_secundar;

	[_burper_obj_sec,_work_obj] call fnc_burperAnomaly_anim_burp;

	deleteVehicle _burper_obj_sec;

};
