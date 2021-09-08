// by Bubbus, based on code by ALIAS

if (!hasInterface) exitWith {};

params ["_launcher", "_projLifetime"];

_firsound = selectRandom [firework11,firework22,firework33];
_launchSound = selectRandom ["fluier1","fluier2","fluier3","fluier4","fluier5","fluier6","fluier7"];

_rocket = "Land_BottlePlastic_V1_F" createVehicleLocal (getPos _launcher);
_rocket enableSimulation false;
_rocket setPosASL (getPosASL _launcher);

_rocketFlame = "#particlesource" createVehicleLocal (getPosASL _launcher);
_rocketFlame setParticleCircle [0, [0, 0, 0]];
_rocketFlame setParticleRandom [0, [0, 0, 0], [0, 0, 1], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_rocketFlame setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 0.2, [0, 0, 0], [0, 0, -4], 0, 10, 7.9, 0.1, [0.7, 0.4, 0.1], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _rocket, 0, false, 0, [[25500, 20000, 5000, 1], [25500, 20000, 5000, 1], [2550, 2000, 500, 1]]];
_rocketFlame setDropInterval 0.001;

_rocketSmoke = "#particlesource" createVehicleLocal (getPosASL _launcher);
_rocketSmoke setParticleCircle [0, [0, 0, 0]];
_rocketSmoke setParticleRandom [0, [0, 0, 0], [0, 0, 0.2], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_rocketSmoke setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, -4], 0, 10, 7.9, 0.6, [1, 2, 4], [[0.8, 0.8, 0.8, 0.3], [0.7, 0.7, 0.7, 0.15], [0.6, 0.6, 0.6, 0]], [0.08], 1, 0, "", "", _rocket];
_rocketSmoke setDropInterval 0.033;

_rocket say3d [_launchSound, 2000];


[_rocket, _projLifetime, _rocketFlame, _rocketSmoke] spawn
{
	params ["_rocket", "_projLifetime", "_rocketFlame", "_rocketSmoke"];

	_startTime = CBA_missionTime;
	_lastRun = CBA_missionTime;

	while {(CBA_missionTime - _startTime) < _projLifetime} do
	{
		_interval = CBA_missionTime - _lastRun;
		_movement = [0, 0, 200 * _interval];

		_rocket setPosASL (getPosASL _rocket vectorAdd _movement);

		_lastRun = CBA_missionTime;
		sleep 0.01666;

	};

	_blapPos = getPosASL _rocket;

	hideObject _rocket;

	deleteVehicle _rocketFlame;
	deleteVehicle _rocketSmoke;

	[_rocket] call f_fnc_fireworkExplosion;

	deleteVehicle _rocket;

};
