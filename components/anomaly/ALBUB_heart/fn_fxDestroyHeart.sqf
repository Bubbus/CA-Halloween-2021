#include "..\macros.hpp"

params ["_posAsl"];

_work_sfx_sec = "Land_HelipadEmpty_F" createVehicle _posAsl;
_work_sfx_sec setPosASL _posAsl;

//_work_sfx_sec say3D ["uwboom", 500];

_fire = "#particlesource" createVehicleLocal (getpos _work_sfx_sec);
_fire setParticleCircle [0, [0, 0, 0]];
_fire setParticleRandom [0, [10, 10, 10], [25, 25, 12], 1, 0.25, [0, 0, 0, 0.1], 0, 0];
_fire setParticleParams [["\A3\Rocks_F_Enoch\Bare_boulder_02_F.p3d", 0, 0, 0], "", "SpaceObject", 1, 15, [0, 0, 0.5], [0,0,15], 1, 20, 7.9, 0, [4, 4, 4], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _work_sfx_sec];
_fire setDropInterval 0.005;

_bule_spark = "#particlesource" createVehicleLocal _posAsl;
_bule_spark setPosASL _posAsl;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 20], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark setDropInterval 0.01;

_gasBlast = "#particlesource" createVehicleLocal (ASLToATL _posAsl);
_gasBlast setPosASL _posAsl;
_gasBlast setParticleCircle [0, [0, 0, 0]];
_gasBlast setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast setDropInterval 0.01;

_gasBlast2 = "#particlesource" createVehicleLocal (ASLToATL _posAsl);
_gasBlast2 setPosASL _posAsl;
_gasBlast2 setParticleCircle [0, [0, 0, 0]];
_gasBlast2 setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast2 setDropInterval 0.001;

_plyDistance = (player distance _work_sfx_sec);
_shake = 1 / ((_plyDistance * 0.005) max 0.5);
addCamShake [_shake * 3, 10, 20+(random 10)];

uisleep 0.6;

deletevehicle _bule_spark;
deleteVehicle _gasBlast;
deleteVehicle _gasBlast2;
deleteVehicle _fire;

sleep 4;

deleteVehicle _work_sfx_sec;