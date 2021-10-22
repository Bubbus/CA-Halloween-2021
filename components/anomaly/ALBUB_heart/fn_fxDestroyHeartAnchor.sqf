#include "..\macros.hpp"

RUN_AS_ASYNC(f_fnc_fxDestroyHeartAnchor);

params ["_posAsl"];

_work_sfx_sec = "Land_HelipadEmpty_F" createVehicle _posAsl;
_work_sfx_sec setPosASL _posAsl;

if (player distance _work_sfx_sec < 100) then
{
	enableCamShake true;
	addCamShake [4,4,13 + (random 33)];
};

_work_sfx_sec say3D ["uwboom", 500];

_fire = "#particlesource" createVehicleLocal (getpos _work_sfx_sec);
_fire setParticleCircle [0, [0, 0, 0]];
_fire setParticleRandom [0, [0, 0, 0], [12, 12, 6], 1, 0.25, [0, 0, 0, 0.1], 0, 0];
_fire setParticleParams [["\A3\Rocks_F_Enoch\Bare_boulder_02_F.p3d", 0, 0, 0], "", "SpaceObject", 1, 5, [0, 0, 0.5], [0,0,15], 1, 20, 7.9, 0, [0.125, 0.125, 0.125], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _work_sfx_sec];
_fire setDropInterval 0.005;

_bule_space = "#particlesource" createVehicleLocal (getpos _work_sfx_sec);
_bule_space setParticleCircle [0, [0, 0, 0]];
_bule_space setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bule_space setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.25, [0, 0, 0.5], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1, 15], [[1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _work_sfx_sec];
_bule_space setDropInterval 0.005;

sleep 0.1;

deleteVehicle _bule_space;

sleep 0.4;

deleteVehicle _fire;

sleep 4;

deleteVehicle _work_sfx_sec;
