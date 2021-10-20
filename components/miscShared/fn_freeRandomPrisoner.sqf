/* --------------------------------------------------------------------------------------------------------------------
	Author:	 Cre8or
	Description:
		Searches for captured players within an sphere around the given position, and randomly frees one of
		them. The selected prisoner receives a random melee weapon, picked from a list.
	Arguments:
		0:	<ARRAY>		The position around which to search for prisoners, in format posWorld
		1:	<NUMBER>	The maximum search radius, in meters (optional, default: 20)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */
#include "macros.hpp"

#define QUOTE(DATA)                                             #DATA
#define DOUBLE(DATA_1,DATA_2)                                   DATA_1##_##DATA_2
#define MACRO_PROJECT_PREFIX									f_
#define GVAR(VARNAME)                                           DOUBLE(MACRO_PROJECT_PREFIX,VARNAME)
#define QGVAR(VARNAME)                                          QUOTE(GVAR(VARNAME))

SERVER_ONLY;

// Fetch our params
params [
	["_pos", [], [[]], 3],
	["_maxDist", 20, [0]]
];

// If no position was provided, exit
if (_pos isEqualTo []) exitWith {};





// Set up some constants
private _const_weapons = [
/*	Format:
	[
		0:	classWeapon
		1:	classMagazine (optional)
	]
*/
	["Knife_m3"],
	["WBK_survival_weapon_3"],
	["Knife_kukri"]
];





// Find a random player
private _candidates = allPlayers select {
	(getPos _x) distance2D _pos < _maxDist
	and {_x getVariable ["ace_captives_isHandcuffed", false]}
};

if (_candidates isEqualTo []) exitWith {
	//systemChat "ERROR: Could not find any nearby prisoners";
};
private _unit = selectRandom _candidates;

// Remove their handcuffs
[_unit, false] remoteExecCall ["ace_captives_fnc_setHandcuffed", owner _unit, false];

// Give them a weapon
private _weapon = selectRandom _const_weapons;
private _magazine = _weapon param [1, ""];
if (_magazine != "") then {
	[_unit, _magazine] remoteExecCall ["addMagazine", owner _unit, false];
};
[_unit, _weapon # 0] remoteExecCall ["addWeapon", owner _unit, false];

//systemChat format ["Freed %1", name _unit];
