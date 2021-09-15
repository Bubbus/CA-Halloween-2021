// by ALIAS

if (!hasInterface) exitWith {};

params ["_stup"];

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
roi_mor = _soundPath + "sounds\roi_mort.ogg";
_roi_SFX = "#particlesource" createVehicleLocal (getPos _stup);
_roi_SFX setParticleCircle [0,[0.1,0.1,0]];
_roi_SFX setParticleRandom [0,[1,1,1],[-0.1,-0.1,0.5],0,0.2,[0,0,0,1],0.5,0.5];
_roi_SFX setParticleParams [["\A3\animals_f\fly.p3d",1,0,1,1],"","SpaceObject",1,30,[0,0,3],[0.1,0.1,1],0,10.5,7.9,0,[5,10,10],[[1,1,1,1],[1,1,1,1],[1,1,1,1]],[1],0.5,0.5,"","",_stup,0,true,0];
_roi_SFX setDropInterval 0.05;
_hive_poz = getPosATL _stup;

playSound3D [roi_mor,"",false,[_hive_poz # 0,_hive_poz # 1,10],5,1,300];
sleep 5;

_decr = 10;
_drop_var = 0.01;
while {_decr >0} do
{
	_roi_SFX setDropInterval _drop_var;
	sleep 1;
	_drop_var = _drop_var+0.05;
	_decr = _decr-1;
};

deleteVehicle _roi_SFX;
