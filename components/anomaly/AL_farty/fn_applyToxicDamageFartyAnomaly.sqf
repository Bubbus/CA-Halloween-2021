//by ALIAS
private ["_unit","_location_mark","_damage_toxic","_radius_toxic","_reldir","_fct","_op_dir","_avoid_poz","_sick"];

_unit = _this select 0;
_location_pos = _this select 1;
_damage_toxic = _this select 2;
_radius_toxic = _this select 3;

_reldir = [_unit, _location_pos] call BIS_fnc_dirTo;
_fct = [30,-30] call BIS_fnc_selectRandom;
_op_dir = if (_reldir<180) then {_reldir+180 +_fct} else {_reldir-180+_fct};
_avoid_poz = [getposATL _unit,(_radius_toxic+10)+random 100, _op_dir] call BIS_fnc_relPos;

_unit setSkill ["commanding", 1];
_unit doMove _avoid_poz;
[_unit, 3, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;

_sick = ["02_breat_toxic","03_breat_toxic","tuse_1","tuse_2","tuse_3"] call BIS_fnc_selectRandom;
[_unit,[_sick,100]] remoteExec ["say3d"];
