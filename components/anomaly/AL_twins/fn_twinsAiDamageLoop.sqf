// by ALIAS

if (!isServer) exitWith {};

_electr_viz		= _this select 0;
_AI_dam_range	= _this select 1;

while {alive _electr_viz} do
{
	_AI_units = [];
	_AI_units = (position _electr_viz) nearEntities ["CAManBase", _AI_dam_range];
	_AI_units = _AI_units select {!isPlayer _x};
	_pos_run = [getPosATL _electr_viz, 1000, random 360] call BIS_fnc_relPos;

	{
		[_x, 2, nil, nil, [0.3, 0.4, 0.6]] call f_fnc_woundUnitRandomly;

		_x doMove _pos_run;
		_x setSkill ["commanding", 1];
		sleep 0.1;

	} forEach _AI_units;

	sleep 30;
};
