#include "macros.hpp"

CLIENT_ONLY;

params ["_baseObj", ["_strength", 4], ["_doKnockout", false]];

// create sound source in near distance towards heart point

// start heat wave rolling - set drop interval to 10s in between beats for two-step wave.

// iter 1: static timings based on no movement
// iter 1: coordinate sound effect with visual pain effect - lub dub.

// if do knockout, special effect where 2nd visual is intense and leads to blackout.

// Begin Blastwaves

private _offset = 200;
private _velocity = 40;
private _soundDelay = (_offset / _velocity) - 0.5;
private _timings = f_arr_heartbeatTimings # (_strength - 1);
private _painTimings = f_arr_heartbeatPainTimings # (_strength - 1);
private _soundClass = "BUB_Heartbeat_heart" + (str _strength);

_attck_pos = (getposasl player) vectorAdd [0,_offset,0];
_voice_attk = "Land_HelipadEmpty_F" createVehiclelocal _attck_pos;
_voice_attk setPosAsL _attck_pos;

_bule_spark = "#particlesource" createVehicleLocal _attck_pos;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [_offset, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 20, [0, 0, 0], [0, -_velocity, 0.75], 0, 10, 7.7, 0, [15, 15, 15], [[0.75, 0.75, 0.75, 0], [0.75, 0.75, 0.75, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _voice_attk];
_bule_spark setDropInterval 0.0025;

_bule_spark2 = "#particlesource" createVehicleLocal _attck_pos;
_bule_spark2 setParticleCircle [0, [0, 0, 0]];
_bule_spark2 setParticleRandom [0, [_offset, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bule_spark2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 20, [0, 0, 0], [0, -_velocity, 0.75], 0, 10, 7.7, 0, [15, 15, 15], [[0.75, 0.75, 0.75, 0], [0.75, 0.75, 0.75, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _voice_attk];
_bule_spark2 setDropInterval 0.0025;

[{playSound _this}, _soundClass, _soundDelay] call CBA_fnc_waitAndExecute;

private _haltEffectDuration = 0.25;

[{(_this#0) setDropInterval (_this#1)}, [_bule_spark, _haltEffectDuration], _timings#0] call CBA_fnc_waitAndExecute;
[{_this setDropInterval 0.0025}, _bule_spark, _timings#1] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this}, _bule_spark, _timings#2] call CBA_fnc_waitAndExecute;

[{(_this#0) setDropInterval (_this#1)}, [_bule_spark2, _haltEffectDuration], _timings#0] call CBA_fnc_waitAndExecute;
[{_this setDropInterval 0.0025}, _bule_spark2, _timings#1] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this}, _bule_spark2, _timings#2] call CBA_fnc_waitAndExecute;

// End Blastwaves


// Begin Painwaves

private _painEffect = ppEffectCreate ["ChromAberration", 7182];
private _painFade = ppEffectCreate ["ColorCorrections", 7183];

private _chromIntensity = linearConversion [1, 4, _strength, 0.08, 0.32, true];
private _chromArray = [_chromIntensity, _chromIntensity, true];
private _emptyChromArray = [0, 0, true];

private _colIntensity = linearConversion [1, 4, _strength, 0.15, 1, true];
private _colArray = [1 - _colIntensity, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0.299, 0.587, 0.114, 0], [-1, -1, 0, 0, 0, 0, 0]];
private _emptyColArray = [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0.299, 0.587, 0.114, 0], [-1, -1, 0, 0, 0, 0, 0]];

[
    {
        (_this#0) ppEffectEnable true;
        (_this#0) ppEffectAdjust (_this#1);
        (_this#0) ppEffectCommit 0.2;

        (_this#2) ppEffectEnable true;
        (_this#2) ppEffectAdjust (_this#3);
        (_this#2) ppEffectCommit 0.2;
    },
    [_painEffect, _chromArray, _painFade, _colArray],
    _soundDelay + (_painTimings#0)

] call CBA_fnc_waitAndExecute;

[
    {
        (_this#0) ppEffectAdjust (_this#1);
        (_this#0) ppEffectCommit 1.5;

        (_this#2) ppEffectAdjust (_this#3);
        (_this#2) ppEffectCommit 1.5;
    },
    [_painEffect, _emptyChromArray, _painFade, _emptyColArray],
    _soundDelay + (_painTimings#0) + 0.3

] call CBA_fnc_waitAndExecute;

[
    {
        (_this#0) ppEffectAdjust (_this#1);
        (_this#0) ppEffectCommit 0.2;

        (_this#2) ppEffectAdjust (_this#3);
        (_this#2) ppEffectCommit 0.2;
    },
    [_painEffect, _chromArray, _painFade, _colArray],
    _soundDelay + (_painTimings#1)

] call CBA_fnc_waitAndExecute;

if (_doKnockout) then
{
    [
        {
            [] call f_fnc_doHeartbeatTeleport;
        },
        [_painEffect, _emptyChromArray, _painFade, _emptyColArray],
        _soundDelay + (_painTimings#1) + 0.3

    ] call CBA_fnc_waitAndExecute;

    [
        {
            (_this#0) ppEffectAdjust (_this#1);
            (_this#0) ppEffectCommit 5;

            (_this#2) ppEffectAdjust (_this#3);
            (_this#2) ppEffectCommit 5;
        },
        [_painEffect, _emptyChromArray, _painFade, _emptyColArray],
        _soundDelay + (_painTimings#1) + 10

    ] call CBA_fnc_waitAndExecute;

    [
        {
            ppEffectDestroy _this;
        },
        [_painEffect, _painFade],
        _soundDelay + (_painTimings#1) + 15.1

    ] call CBA_fnc_waitAndExecute;
}
else
{
    [
        {
            (_this#0) ppEffectAdjust (_this#1);
            (_this#0) ppEffectCommit 5;

            (_this#2) ppEffectAdjust (_this#3);
            (_this#2) ppEffectCommit 5;
        },
        [_painEffect, _emptyChromArray, _painFade, _emptyColArray],
        _soundDelay + (_painTimings#1) + 0.3

    ] call CBA_fnc_waitAndExecute;

    [
        {
            ppEffectDestroy _this;
        },
        [_painEffect, _painFade],
        _soundDelay + (_painTimings#1) + 5.4

    ] call CBA_fnc_waitAndExecute;
};

// End Painwaves


// Start Screenshakes

[_soundDelay, _painTimings, _strength] spawn
{
    params ["_soundDelay", "_painTimings", "_strength"];

    enableCamShake true;

    private _startTime = CBA_missionTime;
    private _maxTime = _startTime + (_painTimings#1) + _soundDelay;

    while {CBA_missionTime < _maxTime} do
    {
        private _intensity = linearConversion [_startTime, _maxTime, CBA_missionTime, 0, _strength, true];
        addCamShake [_intensity * 0.3, 2, 20+(random 10)];

        sleep 0.25;
    };

    _startTime = CBA_missionTime;
    _maxTime = _startTime + _strength;

    while {CBA_missionTime < _maxTime} do
    {
        private _intensity = linearConversion [_startTime, _maxTime, CBA_missionTime, 0, _strength, true];
        addCamShake [(1 - _intensity) * 0.3, 2, 20+(random 10)];

        sleep 0.25;
    };

};

[
    {
        addCamShake [_this, _this, 20+(random 10)];
    },
    _strength,
    _soundDelay + (_painTimings#0)

] call CBA_fnc_waitAndExecute;

[
    {
        addCamShake [_this, _this, 20+(random 10)];
    },
    _strength,
    _soundDelay + (_painTimings#1)

] call CBA_fnc_waitAndExecute;

// End Screenshakes
