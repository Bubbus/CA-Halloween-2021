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




[
	{(player distance theheart) < 500},
	{
		{
			private _particles = "#particlesource" createVehicleLocal (getPos _x);
			_particles setPosASL (getPosASL _x);

			private _beamDir = (vectorNormalized ((getpos _x) vectorFromTo (getpos theheart))) vectorMultiply 10;

			_particles setParticleCircle [0, [0, 0, 0]];
			_particles setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 1, 0];
			_particles setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 4, [0,0,0], _beamDir, 0, 1.195, 1, 0, [1, 2, 4], [[0.75, 0, 0, 0.5], [0.6, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0], 0, 0, "", "", _x];
			_particles setDropInterval 1;
			
		} forEach 
		[
			anchor_1,
			anchor_2,
			anchor_3
		];
	}
] call CBA_fnc_waitUntilAndExecute;



private _trackHammer =
{
	params ["_thisFunction"];

	private _sidearm = handgunWeapon player;
	private _hasHammer = (_sidearm isEqualTo "vn_m_hammer");

	player setVariable ["hasHammer", _hasHammer, true];

	[_thisFunction, _this, 2] call CBA_fnc_waitAndExecute;
};

[_trackHammer, [_trackHammer], 2] call CBA_fnc_waitAndExecute;




private _checkIfUnconscious = 
{
	((player getVariable ["ACE_isUnconscious", false]) and {alive player})
};

[_checkIfUnconscious] spawn
{
	params ["_checkIfUnconscious"];

	while {true} do
	{
		waitUntil {[] call _checkIfUnconscious};

		private _unconAtTime = CBA_missionTime;

		waitUntil 
		{
			(!([] call _checkIfUnconscious)) or {CBA_missionTime > (_unconAtTime + 12)}
		};

		if ([] call _checkIfUnconscious) then
		{
			if !IS_TRUE(f_deathFadedIn) then
			{
				f_deathFadedIn = true;
				"DeathFade" cutText ["", "BLACK OUT", 3, false];
				3 fadeSound 0;
			};

			uiSleep 3.5;

			player setDamage 1;
		};
	};
};




[
	{time > 10},
	{
		if ((player getVariable ["f_var_assignGear", ""]) isEqualTo "miller") then
		{
			f_playerIsMiller = true;
		};
	}
] call CBA_fnc_waitUntilAndExecute;







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



// Show mission titles (and play music if configured).

_musicBreach = { ["Pt2AfterTheHeartbeat"] remoteExecCall ["playMusic"] };

["[CA-BOO] Music", "Music: After the heartbeats", _musicBreach] call zen_custom_modules_fnc_register;

// Show mission titles (and play music if configured).

_musicHill = { ["Pt2SummonMegaSparky"] remoteExecCall ["playMusic"] };

["[CA-BOO] Music", "Music: Summon mega sparky", _musicHill] call zen_custom_modules_fnc_register;

// Show mission titles (and play music if configured).

_musicContact = { ["Pt2TheTempleOfTheHeart"] remoteExecCall ["playMusic"] };

["[CA-BOO] Music", "Music: Temple of the Heart", _musicContact] call zen_custom_modules_fnc_register;

// Show mission titles (and play music if configured).

_musicContact2 = { ["Pt2TheTempleReveal"] remoteExecCall ["playMusic"] };

["[CA-BOO] Music", "Music: Temple reveal", _musicContact] call zen_custom_modules_fnc_register;