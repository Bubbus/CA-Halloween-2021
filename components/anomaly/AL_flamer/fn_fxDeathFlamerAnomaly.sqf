// by ALIAS

if (!hasInterface) exitWith {};

_deleteAfterSecs =
{
	params ["_toDelete", "_time"];

	sleep _time;
	deleteVehicle _toDelete;

};

params ["_flamer"];
_poz_final = getPosATL _flamer;
_part_surs = "Land_HelipadEmpty_F" createVehiclelocal _poz_final;

enableCamShake true;

[getposATL _part_surs] spawn
{
	params ["_coord"];

	sleep 2;
	playSound3D [eko_sharp, "", false, [_coord select 0, _coord select 1, 500], 8, 1, 3000, 0, true];

	sleep 1.5;
	playSound3D [eko_bomb, "", false, [_coord select 0, _coord select 1, 500], 4, 1, 3000, 0, true];

};

if (player distance _part_surs > var_flamerAnomaly_visibleDistance) then {};

_li_exp = "#lightpoint" createVehicle getPosATL _part_surs;
_li_exp lightAttachObject [_part_surs, [0,0,3]];
_li_exp setLightAttenuation [0,0,0,0,0,300];
_li_exp setLightIntensity 1000;
_li_exp setLightBrightness 6;
_li_exp setLightDayLight true;
_li_exp setLightFlareSize 150;
_li_exp setLightFlareMaxDistance 2000;
_li_exp setLightAmbient [1,0.2,0.1];
_li_exp setLightColor [1,0.2,0.1];



if (player distance _part_surs < 100) then
{
	[] spawn
	{
		cutText ["", "WHITE OUT", 1];

		sleep 0.1;

		titleCut ["", "WHITE IN", 1];
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [1];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 5;

		sleep 5;

		"dynamicBlur" ppEffectEnable false;
	};

	addCamShake [5,3,10]
};

if (player distance _part_surs < 10) then
{
	playsound "burned";
	addCamShake [5,2,5];
	call BIS_fnc_flamesEffect;
	[10] call BIS_fnc_bloodEffect;
	call BIS_fnc_indicateBleeding
};


sleep 0.1;

_alias_local_fog = "#particlesource" createVehicleLocal (getpos _part_surs);
_alias_local_fog setParticleCircle [50,[0,0,0]];
_alias_local_fog setParticleRandom [1,[50,50,0],[0,0,0],1,0.1,[0,0,0,0.1],0,0];
_alias_local_fog setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,10,[0,0,1],[0,0,0],3,10.1,7.9,0.01,[1,10,20],[[0.1,0.09,0.09,0],[0.1,0.09,0.09,0.5],[0.1,0.09,0.09,0]],[1],1,0,"","",_part_surs];
_alias_local_fog setDropInterval 0.01;

[_alias_local_fog, 3] spawn _deleteAfterSecs;


sleep 2;

_flama = "#particlesource" createVehicleLocal (getPosATL _part_surs);
_flama setParticleCircle [10,[0,0,0]];
_flama setParticleRandom [1,[10,10,0],[0,0,0],0,0.1,[0,0,0,0],1,0];
_flama setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,5,[0,0,0],[0,0,0],0,10.07,7.9,0,[1,5,1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.8],0, 0, "", "", _part_surs,0,true];
_flama setDropInterval 0.02;

[_flama, 30] spawn _deleteAfterSecs;


_brit = 5;

while {_brit>0} do
{
	_li_exp setLightBrightness _brit;
	_brit = _brit-0.1;
	sleep 0.1;
};


deleteVehicle _li_exp;
sleep 5;
deleteVehicle _part_surs;
