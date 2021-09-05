var_flamerAnomaly_visibleDistance = 400;


if (hasInterface) then
{
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

	eko_bomb = _soundPath + "sounds\eko_bomb.ogg";
	eko_sharp = _soundPath + "sounds\eko_sharp.ogg";

};



fnc_flamerAnomaly_find_target_flamer =
{
	params ["_flamer","_teritoriu"];
	private ["_neartargets","_teritoriu"];

	_neartargets = (ASLToAGL getPosASL _flamer) nearEntities ["CAManBase", _teritoriu];
	_zeuses = allPlayers select {_x getVariable ["f_var_isZeus", false]};
	_neartargets - [_flamer] - _zeuses

};




fnc_flamerAnomaly_avoid_flamer =
{
	params ["_flamer","_chased"];
	private ["_flamer","_chased"];

	if (isPlayer _chased) exitWith {};

	_relPos = _chased getPos [30, (_flamer getDir _chased) + (random 33) * (selectRandom [1,-1])];

	_chased doMove _relPos;
	_chased setSkill ["commanding", 1];

};




fnc_flamerAnomaly_attack_flamer =
{
	params ["_flamer","_tgt_casp","_damage_flamer"];
	private ["_flamer","_tgt_casp","_damage_flamer"];

	_shoot_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply 15;

	[_flamer getVariable "_cap_flamer", ["foc_initial",500]] remoteExec ["say3d"];
	[_flamer,_shoot_dir] remoteExec ["f_fnc_fxPlasmaBallFlamerAnomaly"];

	sleep 0.5;

	_tip = selectrandom ["04","burned","02","03"];
	_nearflamer = (ASLToAGL getPosASL _tgt_casp) nearEntities ["CAManBase",10];

	{
		[_x, 3, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
		[_x, [_tip,200]] remoteExec ["say3d"];

	} forEach (_nearflamer - [_flamer]);

	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],7,false];

	{
		_x setDamage (getdammage _x + _damage_flamer)

	} forEach _nearvik;

	sleep 4;

	_flamer setVariable ["atk",false];

};




fnc_flamerAnomaly_hide_flamer =
{
	_this setVariable ["vizibil",false,true];

	[_this getVariable "_cap_flamer", ["foc_initial",1000]] remoteExec ["say3d"];

	_this enableSimulationGlobal false;
	_this hideObjectGlobal true;

};




fnc_flamerAnomaly_show_flamer =
{
	params ["_flamer","_poz_orig_sc","_teritoriu","_damage_flamer"];
	private ["_flamer","_poz_orig_sc","_pos_strig","_teritoriu","_damage_flamer"];

	_pos_strig = [_poz_orig_sc, 1, 40, 3, 0, 20, 0] call BIS_fnc_findSafePos;

	_flamer setPos _pos_strig;
	_flamer setVariable ["vizibil",true,true];

	//[_flamer,_damage_flamer] remoteExec ["f_fnc_fxActorFlamerAnomaly",0];

	_flamer enableSimulationGlobal true;
	//_flamer hideObjectGlobal false;
	{
		_flamer reveal _x

	} forEach (_flamer nearEntities [["CAManBase"],100]);

	[_flamer getVariable "_cap_flamer",["foc_initial",1000]] remoteExec ["say3d"];

};




fnc_flamerAnomaly_jump_flamer =
{
	params ["_flamer","_tgt_casp","_cap_flamer"];
	private ["_jump_dir","_blast_dust","_flama","_li_fire","_bbb"];

	_priorState = _flamer getVariable ["flamerState", "targeting"];
	_flamer setVariable ["flamerState", "jumping", true];

	_jump_dir = (getposasl _flamer vectorFromTo getposasl _tgt_casp) vectorMultiply round (10+random 10);

	_salt_sunet= selectRandom ["01_blast_2","02_blast_2","03_blast_2"];

	_obj_veg = nearestTerrainObjects [position _flamer,["TREE","SMALL TREE","BUSH","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","FOREST"],20,false];
	_nearvik = nearestObjects [position _flamer,["CAR","TANK","PLANE","HELICOPTER","Motorcycle","Air"],20,false];

	[_cap_flamer,[_salt_sunet,200]] remoteExec ["say3d"];

	_flamer setvelocity [_jump_dir # 0,_jump_dir # 1,round (10+random 15)];

	{
		_x setDamage [1,false];
		_x hideObjectGlobal true;

	} foreach _obj_veg;

	{
		_x setDamage (getdammage _x + 0.05);

	} forEach _nearvik;

	sleep 0.5;

	waitUntil
	{
		sleep 0.1;
		((getPosATL _flamer) # 2) < 1
	};

	_flamer setVariable ["flamerState", _priorState, true];

};
