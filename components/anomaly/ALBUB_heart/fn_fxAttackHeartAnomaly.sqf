
if (!hasInterface) exitWith {};

_attck_pos = _this select 0;
_voice_attk = "Land_HelipadEmpty_F" createVehiclelocal _attck_pos;
_voice_attk setPosATL _attck_pos;

enableCamShake true;

private _playerDistanceFactor = (_voice_attk distance2D player) - 200;
private _distanceFactor = 4 - (ceil (_playerDistanceFactor / 100));

if (_distanceFactor >= 1) then
{
    private _blastStrength = 1 max _distanceFactor min 4;
    private _doKnockout = (_blastStrength >= 4);
    [_voice_attk, _blastStrength, _doKnockout, true, false, 160] call f_fnc_doHeartbeatPulse;
};

_attack_spark = ["01_atak_mega","04_atak_mega"] call BIS_fnc_selectRandom;
_attack_rumble = ["Earthquake_01","Earthquake_02","Earthquake_03","Earthquake_04"] call BIS_fnc_selectRandom;
//_attack_after = ["after_01_mega","after_02_mega"] call BIS_fnc_selectRandom;
//_voice_attk say3d [_attack_spark, 2000, 0.7];
_voice_attk say3d [_attack_rumble, 2000];
//hint str _attack_spark;
sleep 0.2;

_doi_lum = "#lightpoint" createVehicle _attck_pos;
_doi_lum setLightUseFlare false;
_doi_lum setLightFlareSize 50;
_doi_lum setLightFlareMaxDistance 1500;
_doi_lum setLightAttenuation [12, 0, 80, 0, 15, 300];
_doi_lum setLightColor [0.95,0.97,1];
_doi_lum setLightAmbient [0.47,0.49,0.51];
_doi_lum setLightDayLight true;
_doi_lum setLightBrightness 100;

_doi_lum spawn
{
    _bright = 100;

    while {_bright > 0} do
    {
        sleep 0.016;
        _bright = _bright - 2;
        _this setLightBrightness _bright + random (_bright * 0.5);

    };

    deletevehicle _this;

};

_bule_spark = "#particlesource" createVehicleLocal _attck_pos;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 20], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _voice_attk];
_bule_spark setDropInterval 0.01;

_gasBlast = "#particlesource" createVehicleLocal (ASLToATL _attck_pos);
_gasBlast setPosASL _attck_pos;
_gasBlast setParticleCircle [0, [0, 0, 0]];
_gasBlast setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast setDropInterval 0.01;

_gasBlast2 = "#particlesource" createVehicleLocal (ASLToATL _attck_pos);
_gasBlast2 setPosASL _attck_pos;
_gasBlast2 setParticleCircle [0, [0, 0, 0]];
_gasBlast2 setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast2 setDropInterval 0.001;

_plyDistance = (player distance _attck_pos);
_shake = 1 / ((_plyDistance * 0.005) max 0.5);
addCamShake [_shake, 10, 20+(random 10)];

uisleep 0.6;

deletevehicle _bule_spark;
deleteVehicle _gasBlast;
deleteVehicle _gasBlast2;

uisleep (1.9 - 0.6);

_bule_spark = "#particlesource" createVehicleLocal _attck_pos;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 20], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _voice_attk];
_bule_spark setDropInterval 0.015;

_gasBlast = "#particlesource" createVehicleLocal (ASLToATL _attck_pos);
_gasBlast setPosASL _attck_pos;
_gasBlast setParticleCircle [0, [0, 0, 0]];
_gasBlast setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast setDropInterval 0.015;

_gasBlast2 = "#particlesource" createVehicleLocal (ASLToATL _attck_pos);
_gasBlast2 setPosASL _attck_pos;
_gasBlast2 setParticleCircle [0, [0, 0, 0]];
_gasBlast2 setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast2 setDropInterval 0.001;

_plyDistance = (player distance _attck_pos);
_shake = 1 / ((_plyDistance * 0.005) max 0.5);
addCamShake [_shake, 10, 20+(random 10)];

uisleep 0.6;

deletevehicle _bule_spark;
deleteVehicle _gasBlast;
deleteVehicle _gasBlast2;

sleep 10;

deletevehicle _voice_attk;
