#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_fxHellblastOrb);

params ["_baseObj"];


_source = "#particlesource" createVehicleLocal (getpos _baseObj);
_bule_spark = "#particlesource" createVehicleLocal (getpos _baseObj);

_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 160], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", objNull];
_bule_spark setDropInterval 0.005;


_baseObj setVariable ["orb", _source];


[_source, _bule_spark] spawn
{
    params ["_source", "_spark"];
    _startPos = (getPosASL player vectorAdd [4000,0,150]);
    _progress = 0;
    _trippedEffect = false;

    while {_progress < 1} do
    {
        _pos = _progress bezierInterpolation ([_startPos, (getPosASL player vectorAdd [-4000,0,150])]);
        _source setPosASL _pos;
        _spark setPosASL _pos;
        _progress = _progress + 0.003;
        _progress = _progress min 1;

        if (_progress > 0.4 and {!_trippedEffect}) then
        {
            _trippedEffect = true;
            [_source] call f_fnc_fxHellblastKillPlayer;
        };

        sleep 0.1;
    };

    deleteVehicle _source;
    deleteVehicle _spark;

};


_source spawn
{
    while {alive _this} do
    {
        _scream = selectRandom ["strigat_1", "strigat_2", "strigat_3", "strigat_4", "strigat_5", "strigat_6", "strigat_7", "strigat_91"];

        _this say3D [_scream, 4000, 0.2 + random 0.1];

        sleep 0.5;
    };

};



_source spawn
{
    while {alive _this} do
    {
        _attack_spark = ["01_atak_mega","04_atak_mega"] call BIS_fnc_selectRandom;

        _this say3D [_attack_spark, 6000, 0.6 + random 0.2];

        sleep 0.5;
    };

};


_source setParticleRandom [10 / 4, [0.15, 0.15, 0], [0.2, 0.2, 0], 0.4, 0, [0, 0, 0, 0], 0, 0, 360];
_source setDropInterval (1 / 200);

_source setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
    "",
    "billboard",
    1,
    5,
    [0, 0, 0],
    [0, 0, 0.4 * 1],
    0,
    0.0565,
    0.05,
    0.03,
    [0.9 * 100, 0],
    [
        [0, 1, 0, 0],
        [0, 1, 0, -1],
        [0, 1, 0, -1],
        [0, 1, 0, -1],
        [0, 1, 0, -1],
        [0, 1, 0, 0]
    ],
    [1],
    0.01,
    0.02,
    "",
    "",
    "",
    360,
    false,
    -1,
    [[3, 3, 3, 0]]
];


_source spawn
{
    enableCamShake true;

	while {alive _this} do
    {
        _attack_rumble = ["Earthquake_01","Earthquake_02","Earthquake_03","Earthquake_04"] call BIS_fnc_selectRandom;
        playSound _attack_rumble;
        addCamShake [1, 15, 20+(random 10)];
        sleep 3;
	};

};
