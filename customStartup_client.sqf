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


{
	_x addEventHandler ["HandleDamage", 
	{
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

		_unit setDamage 0;

		if !(isPlayer _instigator) exitWith {0};

		if !(currentWeapon _instigator isEqualTo "vn_m_hammer") exitWith {0};

		[_unit] remoteExec ["f_fnc_destroyHeartAnchor", 2];

		0
	}];
	
} forEach 
[
	anchor_1,
	anchor_2,
	anchor_3
];

private _trackHammer =
{
	params ["_thisFunction"];

	private _sidearm = handgunWeapon player;
	private _hasHammer = (_sidearm isEqualTo "vn_m_hammer");

	player setVariable ["hasHammer", _hasHammer, true];

	[_thisFunction, _this, 2] call CBA_fnc_waitAndExecute;
};

[_trackHammer, [_trackHammer], 2] call CBA_fnc_waitAndExecute;