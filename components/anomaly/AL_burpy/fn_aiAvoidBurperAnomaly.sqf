private ["_avoid_poz","_op_dir","_reldir"];

//if (!isServer) exitWith {};

_obj_teleporter = _this select 0;

while {alive _obj_teleporter} do
{

	_list_ai_in_range = (position _obj_teleporter) nearEntities ["CAManBase",20];

	{
		if (local _x) then
		{
			_reldir = [_x, getPos _obj_teleporter] call BIS_fnc_dirTo;
			_fct = [30,-30] call BIS_fnc_selectRandom;
			_op_dir = if (_reldir < 180) then {_reldir + 180 +_fct} else {_reldir - 180 + _fct};
			_avoid_poz = [getposATL _x,100+random 500, _op_dir] call BIS_fnc_relPos;
			_x doMove _avoid_poz;
			_x setSkill ["commanding", 1];
		}

	} foreach _list_ai_in_range;

	sleep 10;

};
