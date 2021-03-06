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
