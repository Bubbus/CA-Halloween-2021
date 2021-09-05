#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_fxStartHellblastWind);

params ["_baseObj"];


_source = "#particlesource" createVehicleLocal (getpos _baseObj);

_baseObj setVariable ["windGenerator", _source];


_source spawn
{
    _startPos = (getPosASL player vectorAdd [4000,0,150]);
    _progress = 0;

    while {alive _this} do
    {
        _pos = _progress bezierInterpolation ([_startPos, (getPosASL player vectorAdd [0,0,150])]);
        _this setPosASL _pos;
        _progress = _progress + 0.025;
        _progress = _progress min 1;
        sleep 0.1;
    };

};

_source spawn
{
    sleep 2;

    _this setParticleRandom [10 / 4, [0.15 * 10000, 0.15 * 10000, 0], [0.2, 0.2, 0], 0.4, 0, [0, 0, 0, 0], 0, 0, 0.2];
    _this setDropInterval (1 / 1000);

    _red = 0;

    while {_red < 0.45} do
    {
        _this setParticleParams
        [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
            "",
            "billboard",
            1,
            10,
            [0, 0, 0],
            [0, 0, 0.4 * 1000],
            0,
            0.0565,
            0.05,
            0.03,
            [0.9 * 300, 0],
            [
                [_red, 0, 0, 0],
                [_red, 0, 0, -1],
                [_red, 0, 0, -1],
                [_red, 0, 0, -1],
                [_red, 0, 0, -1],
                [_red, 0, 0, 0]
            ],
            [1],
            0.01,
            0.02,
            "",
            "",
            "",
            0,
            false,
            -1,
            [[3, 3, 3, 0]]
        ];

        _red = _red + 0.05;

        sleep 2;

    };

};

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


[_source, _baseObj] spawn
{
    params ["_source", "_baseObj"];

    waitUntil {sleep 1; !(alive _baseObj)};

    deleteVehicle _source;
};
