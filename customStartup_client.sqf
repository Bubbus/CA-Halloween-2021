_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
firework11= _soundPath + "sounds\firework1.ogg";
firework22= _soundPath + "sounds\firework2.ogg";
firework33= _soundPath + "sounds\firework3.ogg";


private _naughtyHats =
[
	"NWTS_Deer",
	"NWTS_Deer_bloody",
	"NWTS_Deer_glow",
	"NWTS_Deer_Mossy",
	"NWTS_Human_simple",
	"NWTS_Human_bloody",
	"NWTS_Human_bloody_glow",
	"NWTS_Human_simple_glow"
];

private _naughtyHatMap = _naughtyHats createHashMapFromArray (_naughtyHats apply {true});

private _removeNaughtyHat =
{
	params ["_naughtyHatMap", "_thisFunction"];

	private _currentPlayerHat = headgear player;

	if (_naughtyHatMap getOrDefault [_currentPlayerHat, false]) then
	{
		removeHeadgear player;
	};

	[_thisFunction, _this, 1] call CBA_fnc_waitAndExecute;
};

[_removeNaughtyHat, [_naughtyHatMap, _removeNaughtyHat], 1] call CBA_fnc_waitAndExecute;



_spawnLootbox =
{
    params ["_pos"];

    _object = "vn_b_ammobox_full_07" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_armoury"] spawn f_fnc_assignLoot;
};

["[CA-BOO] Lootboxes (Military)", "Armoury", _spawnLootbox] call zen_custom_modules_fnc_register;

_spawnLootbox =
{
    params ["_pos"];

    _object = "vn_b_ammobox_full_07" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_armoury"] spawn f_fnc_assignLoot;
	[_object, "mil_armoury"] spawn f_fnc_assignLoot;

};

["[CA-BOO] Lootboxes (Military)", "Armoury (Large)", _spawnLootbox] call zen_custom_modules_fnc_register;

_spawnLootbox =
{
    params ["_pos"];

    _object = "Box_Syndicate_Ammo_F" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_uniforms_small"] spawn f_fnc_assignLoot;
};

["[CA-BOO] Lootboxes (Military)", "Uniforms (Small)", _spawnLootbox] call zen_custom_modules_fnc_register;

_spawnLootbox =
{
    params ["_pos"];

    _object = "Box_Syndicate_Ammo_F" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_uniforms_big"] spawn f_fnc_assignLoot;
};

["[CA-BOO] Lootboxes (Military)", "Uniforms (Large)", _spawnLootbox] call zen_custom_modules_fnc_register;

_spawnLootbox =
{
    params ["_pos"];

    _object = "Box_Syndicate_Wps_F" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_gunbox_small"] spawn f_fnc_assignLoot;
};

["[CA-BOO] Lootboxes (Military)", "Guns (Small)", _spawnLootbox] call zen_custom_modules_fnc_register;

_spawnLootbox =
{
    params ["_pos"];

    _object = "Box_Syndicate_Wps_F" createVehicle _pos;
	[_object] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

    [_object, "mil_gunbox_large"] spawn f_fnc_assignLoot;
};

["[CA-BOO] Lootboxes (Military)", "Guns (Large)", _spawnLootbox] call zen_custom_modules_fnc_register;

