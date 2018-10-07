// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Set up the radio presets according to side.
_presetName = switch (side player) do
{
	case west: {"default2"};
	case east: {"default3"};
	case resistance: {"default4"};
	default {"default"};

};


if (f_radios_settings_acre2_disableFrequencySplit) then
{
	_presetName = "default";
};


_ret = ["ACRE_PRC343", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC148", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC152", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC117F", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ItemRadio", _presetName ] call acre_api_fnc_setPreset;


// if dead, set spectator and exit
if (!alive player) exitWith
{
	[true] call acre_api_fnc_setSpectator;
};

_unit = player;

// ====================================================================================

// Set language of the units depending on side (BABEL API)

_languages = switch (side _unit) do
{
	case blufor: {f_radios_settings_acre2_language_blufor};
	case opfor: {f_radios_settings_acre2_language_opfor};
	case independent: {f_radios_settings_acre2_language_indfor};
	default {f_radios_settings_acre2_language_indfor};
};


_languages call acre_api_fnc_babelSetSpokenLanguages;
[_languages select 0] call acre_api_fnc_babelSetSpeakingLanguage;


// ====================================================================================

// RADIO ASSIGNMENT

// BUB 2018-09-24 TODO :: Decouple radios from gearscript.
_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];


// REMOVE ALL RADIOS
// Wait for ACRE2 to initialise any radios the unit has in their inventory, and then
// remove them to ensure that duplicate radios aren't added by accident.
waitUntil
{
	uiSleep 1;
	!("ItemRadio" in (items _unit + assignedItems _unit))
};

uiSleep 1;


waitUntil
{
	[] call acre_api_fnc_isInitialized
};


{
	_unit removeItem _x;

} forEach ([] call acre_api_fnc_getCurrentRadioList);

// ====================================================================================

// ASSIGN RADIOS TO UNITS
// Depending on the loadout used in the assignGear component, each unit is assigned
// a set of radios.

if (_typeOfUnit != "NIL") then
{
	// If radios are enabled in the settings
	if (!f_radios_settings_acre2_disableRadios) then
	{
		// Everyone gets a short-range radio by default
		if (isnil "f_radios_settings_acre2_shortRange") then
		{
			if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
			{
				_unit addItem f_radios_settings_acre2_standardSHRadio;
			}
			else
			{
				f_radios_settings_acre2_standardSHRadio call f_fnc_giveRadioAction;
			};
		}
		else
		{
			if (_typeOfUnit in f_radios_settings_acre2_shortRange) then
			{
				if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
				{
					_unit addItem f_radios_settings_acre2_standardSHRadio;
				}
				else
				{
					f_radios_settings_acre2_standardSHRadio call f_fnc_giveRadioAction;
				};

			};

		};

		// If unit is in the above list, add a 148
		if (_typeOfUnit in f_radios_settings_acre2_longRange) then
		{
			if (_unit canAdd f_radios_settings_acre2_standardLRRadio) then
			{
				_unit addItem f_radios_settings_acre2_standardLRRadio;
			}
			else
			{
				f_radios_settings_acre2_standardLRRadio call f_fnc_giveRadioAction;
			};

		};
			// If unit is in the list of units that receive an extra long-range radio, add another 148
		if (_typeOfUnit in f_radios_settings_acre2_extraRadios) then
		{
			if (_unit canAdd f_radios_settings_acre2_extraRadio) then
			{
				_unit addItem f_radios_settings_acre2_extraRadio;
			}
			else
			{
				f_radios_settings_acre2_extraRadio call f_fnc_giveRadioAction;
			};

		};
			// If unit is in the list of units that receive a backpack radio, then add a 117F
		if (_typeOfUnit in f_radios_settings_acre2_BackpackRadios) then
		{
			if (_unit canAdd f_radios_settings_acre2_BackpackRadio) then
			{
				_unit addItem f_radios_settings_acre2_BackpackRadio;
			}
			else
			{
				f_radios_settings_acre2_BackpackRadio call f_fnc_giveRadioAction;
			};

		};

	};

};

// ====================================================================================

// ASSIGN DEFAULT CHANNELS TO RADIOS
// Depending on the squad joined, each radio is assigned a default starting channel

if (!f_radios_settings_acre2_disableRadios) then
{

	private ["_presetArray","_presetLRArray","_radioSR","_radioLR","_radioExtra","_hasSR","_hasLR","_hasExtra","_groupID","_groupChannelIndex","_groupLRChannelIndex"];

	waitUntil
	{
		uiSleep 0.1; [] call acre_api_fnc_isInitialized
	};

	_presetArray = switch (side _unit) do
	{
  		case blufor: {f_radios_settings_acre2_sr_groups_blufor};
	  	case opfor: {f_radios_settings_acre2_sr_groups_opfor};
	  	case independent: {f_radios_settings_acre2_sr_groups_indfor};
	  	default {f_radios_settings_acre2_sr_groups_indfor};
	};

	_presetLRArray = switch (side _unit) do
	{
		case blufor: {f_radios_settings_acre2_lr_groups_blufor};
	  	case opfor: {f_radios_settings_acre2_lr_groups_opfor};
	  	case independent: {f_radios_settings_acre2_lr_groups_indfor};
		default {f_radios_settings_acre2_lr_groups_indfor};
	};

	_radioSR = [f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_getRadioByType;
	_radioLR = [f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_getRadioByType;
	_radioExtra = [f_radios_settings_acre2_extraRadio] call acre_api_fnc_getRadioByType;
	_radioBackpack = [f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_getRadioByType;

	_hasSR = ((!isNil "_radioSR") && {_radioSR != ""});
	_hasLR = ((!isNil "_radioLR") && {_radioLR != ""});
	_hasExtra = ((!isNil "_radioExtra") && {_radioExtra != ""});
	_hasBackpack = ((!isNil "_radioBackpack") && {_radioBackpack != ""});

	_groupID = groupID (group _unit);

	_groupChannelIndex = -1;
  	_groupLRChannelIndex = -1;


	if (_hasSR) then
	{
	  	{
	  		if (_groupID in (_x select 1)) exitWith
			{
				 _groupChannelIndex = _forEachIndex;
			};

	  	} forEach _presetArray;

  	};


  	if (_hasLR || _hasExtra) then
	{
	  	{
	  		if (_groupID in (_x select 1)) exitWith
			{
				_groupLRChannelIndex = _forEachIndex;
			};

	  	} forEach _presetLRArray;

  	};


	if (_groupChannelIndex == -1 && {_hasSR}) then
	{
		player sideChat format ["[F3 ACRE2] Warning: Unknown group for short-range channel defaults (%1)", _groupID];
		_groupChannelIndex = 0;
	};


	if (_groupLRChannelIndex == -1 && {(_hasLR || _hasExtra)}) then
	{
  		player sideChat format ["[F3 ACRE2] Warning: Unknown group for long-range channel defaults (%1)", _groupID];
	  	_groupLRChannelIndex = 0;
	};


	if (_hasSR) then
	{
		if (f_var_debugMode == 1) then
		{
			player sideChat format ["DEBUG (f\radios\acre2\acre2_clientInit.sqf): Setting radio channel for '%1' to %2", _radioSR, _groupChannelIndex + 1];
		};

	    [_radioSR, (_groupChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasLR) then
	{
		if (f_var_debugMode == 1) then
		{
			player sideChat format ["DEBUG (f\radios\acre2\acre2_clientInit.sqf): Setting radio channel for '%1' to %2", _radioLR, _groupLRChannelIndex + 1];
		};

	    [_radioLR, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasExtra) then
	{
		if (f_var_debugMode == 1) then
		{
			player sideChat format ["DEBUG (f\radios\acre2\acre2_clientInit.sqf): Setting radio channel for '%1' to %2", _radioExtra, _groupLRChannelIndex + 1];
		};

	    [_radioExtra, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasBackpack) then
	{
		if (f_var_debugMode == 1) then
		{
			player sideChat format ["DEBUG (f\radios\acre2\acre2_clientInit.sqf): Setting radio channel for '%1' to %2", _radioExtra, _groupLRChannelIndex + 1];
		};

	    [_radioBackpack, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};

};