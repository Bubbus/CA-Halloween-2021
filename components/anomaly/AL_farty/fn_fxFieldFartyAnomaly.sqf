// by ALIAS

private ["_toxic_center","_damage_toxic","_radius_toxic","_farty_on","_fog_toxic","_farty_loc"];

if (!hasInterface) exitWith {};

var_fartyAnomaly_visibleDistance = 300;

_toxic_center	= _this select 0;
_radius_toxic	= _this select 1;
_damage_toxic	= _this select 2;
_farty_on		= _this select 3;
_farty_loc		= _this select 4;

_obj_tox = _farty_loc;

[_farty_loc,_radius_toxic,_damage_toxic] spawn f_fnc_fxPlayerToxicFartyAnomaly;


[_obj_tox,_radius_toxic] spawn
{
    private ["_puf","_radius_toxic"];

    _puf = _this select 0;
    _radius_toxic = _this select 1;

	while {alive _puf} do
	{
    	_puf say3D ["toxic_field", 10 * _radius_toxic];
    	sleep 6.5;
	};

};


while {alive _obj_tox} do
{
	waitUntil {sleep 5; (player distance _obj_tox) < var_fartyAnomaly_visibleDistance};

    private "_fog_toxic";
	if (sunOrMoon==1) then
	{
    	 _fog_toxic = "#particlesource" createVehicleLocal (getPosATL _obj_tox);
    	 _fog_toxic setParticleCircle [_radius_toxic / 2 - 1, [0, 0, 0]];
    	 _fog_toxic setParticleRandom [0, [_radius_toxic / 2, _radius_toxic / 2, -0.3], [0.175, 0.175, 0], 0, 1, [0, 0, 0, 0.1], 1, 0];
    	 _fog_toxic setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 13, 10.2, 7.9, 0.0001, [5, 5, 10], [[0.3, 0.5, 0.1, 0], [0.3, 0.5, 0.1, 0.2], [0.1, 0.3, 0.1, 0]], [0.08], 1, 0, "", "", _obj_tox];
    	 _fog_toxic setDropInterval 0.02;
	}
    else
	{
    	 _fog_toxic = "#particlesource" createVehicleLocal (getPosATL _obj_tox);
    	 _fog_toxic setParticleCircle [_radius_toxic / 2 - 1, [0, 0, 0]];
    	 _fog_toxic setParticleRandom [0, [_radius_toxic / 2, _radius_toxic / 2, -0.3], [0.175, 0.175, 0], 0, 1, [0, 0, 0, 0.1], 1, 0];
    	 _fog_toxic setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 13, 10.2, 7.9, 0.0001, [10,15,20], [[0.3, 0.5, 0.1, 0.3], [0.3, 0.5, 0.1, 1], [0.1, 0.4, 0.1, 0]], [0.08], 1, 0, "", "", _obj_tox];
    	 _fog_toxic setDropInterval 0.02;
	};

	waitUntil {sleep 5; (player distance _obj_tox) > var_fartyAnomaly_visibleDistance};

	deleteVehicle _fog_toxic;

};
