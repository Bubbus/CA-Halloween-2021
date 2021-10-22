//by ALIAS
//["myfarty",1,50] execvm "AL_farty\ai_toxic.sqf";

private ["_location_mark","_damage_toxic","_radius_toxic","_list_ai_in_range_tox","_reldir","_fct","_op_dir","_avoid_poz","_farty_boss"];

_location_pos	= _this select 0;
_damage_toxic	= _this select 1;
_radius_toxic	= _this select 2;

while {true} do
{
	_list_ai_in_range_tox = _location_pos nearEntities [["CAManBase"], _radius_toxic - 5];
	_list_ai_in_range_tox = _list_ai_in_range_tox select {!(isPlayer _x)};

	if (count _list_ai_in_range_tox > 0) then
	{
		{
			if (isNil {_x getVariable "anomalie"}) then
			{
				[_x,_location_pos,_damage_toxic,_radius_toxic] remoteExec ["f_fnc_applyToxicDamageFartyAnomaly", _x, false];
			};

		} foreach _list_ai_in_range_tox;

	};

	sleep 4 + (random 4);

};
