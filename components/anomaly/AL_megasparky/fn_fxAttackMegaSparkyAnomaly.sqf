
if (!hasInterface) exitWith {};

private _objPosASL = _this select 0;
private _voice_attk = "Land_HelipadEmpty_F" createVehiclelocal _objPosASL;
_voice_attk setPosATL _objPosASL;

enableCamShake true;

private _attack_spark = ["01_atak_mega","04_atak_mega"] call BIS_fnc_selectRandom;
private _attack_rumble = ["Earthquake_01","Earthquake_02","Earthquake_03","Earthquake_04"] call BIS_fnc_selectRandom;
private _attack_after = ["after_01_mega","after_02_mega"] call BIS_fnc_selectRandom;

_voice_attk say3d [_attack_spark, 2000, 0.7];
_voice_attk say3d [_attack_rumble, 2000];

sleep 0.2;

private _doi_lum = "#lightpoint" createVehicle _objPosASL;
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

    deletevehicle _this;

};

private _bule_spark = "#particlesource" createVehicleLocal _objPosASL;
_bule_spark setPosASL _objPosASL;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 160], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark setDropInterval 0.001;

private _bule_spark_2 = "#particlesource" createVehicleLocal _objPosASL;
_bule_spark_2 setPosASL _objPosASL;
_bule_spark_2 setParticleCircle [0, [0, 0, 0]];
_bule_spark_2 setParticleRandom [0, [0.25, 0.25, 0], [160, 160, 160], 180, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark_2 setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.48, 0.04], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark_2 setDropInterval 0.001;

sleep random 0.1;
sleep 0.1;

private _plyDistance = (player distance _objPosASL);
private _shake = 1 / ((_plyDistance * 0.01) max 0.5);
addCamShake [_shake, 10, 20+(random 10)];

deleteVehicle _bule_spark;
deleteVehicle _bule_spark_2;

sleep 10;

deleteVehicle _voice_attk;
enableCamShake false;
