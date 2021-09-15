// by ALIAS
// Cleaned up and edited by Bubbus

// Makes all AI in an area around an object run away from it.

params ["_danger_close"];

private _chased_units = _danger_close nearEntities ["Man", 100];

{
	if (_x != _danger_close) then
	{
		private _reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
		private _fct = [30,-30] call BIS_fnc_selectRandom;
		private "_op_dir";

		if (_reldir < 180) then
		{
			_op_dir = _reldir + 180 + _fct;
		}
		else
		{
			_op_dir = _reldir - 180 + _fct;
		};

		private _avoid_poz = [getPosATL _x, 30 + (random 10), _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];

	};

} foreach _chased_units;
