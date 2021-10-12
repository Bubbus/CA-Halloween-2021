#include "macros.hpp"

params ["_unit", ["_removeRadios", false]];
RUN_LOCAL_TO(_unit,_this,f_fnc_removeAllWeapons);

private _loadout = getUnitLoadout player;

_loadout set [0, []];
_loadout set [1, []];

private _sidearm = _loadout#2;
if ((count _sidearm < 1) or {_sidearm#0 isNotEqualTo "vn_m_hammer"}) then
{
	_loadout set [2, []];
};

private _uniform = _loadout#3;
private _uniformContent = _uniform#1;

private _vest = _loadout#4;
private _vestContent = _vest#1;

private _backpack = _loadout#5;
private _backpackContent = _backpack#1;

private _disallowedBaseClasses = 
[
	"RifleCore",
	"GrenadeCore",
	"PistolCore",
	"LauncherCore"
];

if (_removeRadios) then
{
	_disallowedBaseClasses pushBack "ACRE_BaseRadio";
};

private _removeAllWeapons = 
{
	params ["_content", "_disallowedWeaponClasses"];

	private _returnArray = [];
	private _configMags = configFile >> "CfgMagazines";
	private _configWeapons = configFile >> "CfgWeapons";

	{
		private _originalX = _x;
		private _name = _x#0;

		while {_name isEqualType []} do
		{
			_x = _name;
			_name = _x#0;
		};

		if !(isNull (_configMags >> _name)) then {continue};
		if !(isNull (_configWeapons >> _name)) then 
		{
			if ((_disallowedBaseClasses findIf {_name isKindOf [_x, _configWeapons]}) >= 0) then 
			{
				if (_name isNotEqualTo "vn_m_hammer") then {continue};				
			};
		};
		
		_returnArray pushBack _originalX;

	} forEach _content;

	_returnArray
};

private _cleanUniformContent = [_uniformContent, _disallowedBaseClasses] call _removeAllWeapons;
private _cleanVestContent = [_vestContent, _disallowedBaseClasses] call _removeAllWeapons;
private _cleanBackpackContent = [_backpackContent, _disallowedBaseClasses] call _removeAllWeapons;

_uniform set [1, _cleanUniformContent];
_vest set [1, _cleanVestContent];
_backpack set [1, _cleanBackpackContent];

_unit setUnitLoadout _loadout;