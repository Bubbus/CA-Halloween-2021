private ["_avoid_poz","_op_dir","_reldir"];

//if (!isServer) exitWith {};

_baseEnt = _this select 0;
_radius = _this select 1;

sleep 30;

while {alive _baseEnt} do
{

	_list_ai_in_range = (getPos _baseEnt) nearEntities ["Man", _radius];

	if (count _list_ai_in_range > 0) then
	{
		{
			if (local _x) then
			{
				_reldir = [_x, getPos _baseEnt] call BIS_fnc_dirTo;
				_fct = [30, -30] call BIS_fnc_selectRandom;
				_op_dir = if (_reldir<180) then {_reldir + 180 + _fct} else {_reldir - 180 + _fct};
				_avoid_poz = [getposATL _x, 100+random 500, _op_dir] call BIS_fnc_relPos;
				_x doMove _avoid_poz;
				_x setSkill ["commanding", 1];
			}

		} foreach _list_ai_in_range;

	};

	sleep 10;

};
