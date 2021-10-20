
if (!hasInterface) exitWith {};

_objPosASL = _this select 0;
_voice_attk = "Land_HelipadEmpty_F" createVehicleLocal _objPosASL;
_voice_attk setPosASL _objPosASL;

enableCamShake true;

private _playerDistance = (_voice_attk distance2D player);
private _distanceFactor = round (1 / ((_playerDistance*0.0007) + (1/4.499)));

if (_distanceFactor >= 1 and {_playerDistance <= 1500}) then
{
    private _blastStrength = 1 max _distanceFactor min 4;

    if (_playerDistance > 70) then 
    {
        _blastStrength = 1 max _blastStrength min 3;
    };

    private _doKnockout = (_blastStrength >= 4);
    [_voice_attk, _blastStrength, _doKnockout, true, false, 160] call f_fnc_doHeartbeatPulse;
};

_attack_spark = ["01_atak_mega","04_atak_mega"] call BIS_fnc_selectRandom;
_attack_rumble = ["Earthquake_01","Earthquake_02","Earthquake_03","Earthquake_04"] call BIS_fnc_selectRandom;

_voice_attk say3d [_attack_rumble, 2000];

sleep 0.2;

_doi_lum = "#lightpoint" createVehicle _objPosASL;
_doi_lum setPosASL _objPosASL;
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

    deleteVehicle _this;

};

_bule_spark = "#particlesource" createVehicleLocal _objPosASL;
_bule_spark setPosASL _objPosASL;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 20], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark setDropInterval 0.01;

_gasBlast = "#particlesource" createVehicleLocal (ASLToATL _objPosASL);
_gasBlast setPosASL _objPosASL;
_gasBlast setParticleCircle [0, [0, 0, 0]];
_gasBlast setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast setDropInterval 0.01;

_gasBlast2 = "#particlesource" createVehicleLocal (ASLToATL _objPosASL);
_gasBlast2 setPosASL _objPosASL;
_gasBlast2 setParticleCircle [0, [0, 0, 0]];
_gasBlast2 setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast2 setDropInterval 0.001;

_plyDistance = (player distance _objPosASL);
_shake = 1 / ((_plyDistance * 0.005) max 0.5);
addCamShake [_shake, 10, 20+(random 10)];

uisleep 0.6;

deleteVehicle _bule_spark;
deleteVehicle _gasBlast;
deleteVehicle _gasBlast2;

uisleep (1.9 - 0.6);

_bule_spark = "#particlesource" createVehicleLocal _objPosASL;
_bule_spark setPosASL _objPosASL;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 20], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark setDropInterval 0.015;

_gasBlast = "#particlesource" createVehicleLocal (ASLToATL _objPosASL);
_gasBlast setPosASL _objPosASL;
_gasBlast setParticleCircle [0, [0, 0, 0]];
_gasBlast setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast setDropInterval 0.015;

_gasBlast2 = "#particlesource" createVehicleLocal (ASLToATL _objPosASL);
_gasBlast2 setPosASL _objPosASL;
_gasBlast2 setParticleCircle [0, [0, 0, 0]];
_gasBlast2 setParticleRandom [0, [15, 15, 0], [160, 160, 2], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_gasBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0, [5, 15, 25], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0.08], 1, 0, "", "", nil];
_gasBlast2 setDropInterval 0.001;

_plyDistance = (player distance _objPosASL);
_shake = 1 / ((_plyDistance * 0.005) max 0.5);
addCamShake [_shake, 10, 20+(random 10)];

uisleep 0.6;

deleteVehicle _bule_spark;
deleteVehicle _gasBlast;
deleteVehicle _gasBlast2;

sleep 10;

deleteVehicle _voice_attk;
