
if (!hasInterface) exitWith {};

private _objPosASL = _this select 0;

private _voice_attk = "Land_HelipadEmpty_F" createVehiclelocal _objPosASL;
_voice_attk setPosASL _objPosASL;

enableCamShake true;

//lumina 1
private _unu_lum = "#lightpoint" createVehicle _objPosASL;
_unu_lum setPosASL _objPosASL;
_unu_lum setLightUseFlare false;
_unu_lum setLightFlareSize 1;
_unu_lum setLightFlareMaxDistance 1500;
_unu_lum setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 50, /*quadratic*/ 1000, /*hardlimitstart*/1,/* hardlimitend*/50];
_unu_lum setLightColor [1,1,1];
_unu_lum setLightAmbient [0.8,0.6,0.9];
_unu_lum setLightDayLight true;
_unu_lum setLightBrightness 30+random 30;

private _attack_spark = ["01_atak","02_atak","03_atak","04_atak","05_atak"] call BIS_fnc_selectRandom;
private _attack_after = ["after_01","after_02"] call BIS_fnc_selectRandom;

_voice_attk say3d [_attack_spark, 600];

sleep 0.2;

private _bule_spark = "#particlesource" createVehicleLocal _objPosASL;
_bule_spark setPosASL _objPosASL;
_bule_spark setParticleCircle [0, [0, 0, 0]];
_bule_spark setParticleRandom [0, [0.25, 0.25, 0], [20,20,20], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
_bule_spark setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.3, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.03, 0.01], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_spark setDropInterval 0.001;

sleep random 0.1;
deletevehicle _unu_lum;
sleep 0.1;

private _bule_space = "#particlesource" createVehicleLocal _objPosASL;
_bule_space setPosASL _objPosASL;
_bule_space setParticleCircle [0, [0, 0, 0]];
_bule_space setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_bule_space setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1,20], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", nil];
_bule_space setDropInterval 0.1;

sleep 0.1;
addCamShake [1,4,13+(random 33)];

private _doi_lum = "#lightpoint" createVehicle _objPosASL;
_doi_lum setPosASL _objPosASL;
_doi_lum setLightUseFlare false;
_doi_lum setLightFlareSize 1;
_doi_lum setLightFlareMaxDistance 1500;
_doi_lum setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 50, /*quadratic*/ 1000, /*hardlimitstart*/1,/* hardlimitend*/50];
_doi_lum setLightColor [1,1,1];
_doi_lum setLightAmbient [0.8,0.6,0.9];
_doi_lum setLightDayLight true;
_doi_lum setLightBrightness 80+random 40;

deleteVehicle _bule_spark;

sleep 0.1;
deleteVehicle _bule_space;

sleep random 0.2;
deleteVehicle _doi_lum;

sleep 1;

if ((player distance _voice_attk) < 500) then 
{
	playSound _attack_after;
};

deleteVehicle _voice_attk;
