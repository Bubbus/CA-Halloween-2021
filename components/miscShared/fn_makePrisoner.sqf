/* --------------------------------------------------------------------------------------------------------------------
	Author:	 Cre8or
	Description:
		Turns the given unit into a prisoner using ACE's captive system, and moves the unit into a custom
		sitting animation with their hands tied behind their back.

		NOTE: Must be run locally on the unit to be captured.
	Arguments:
		0:	<OBJECT>	The unit to be turned into a prisoner
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */
#define QUOTE(DATA)                                             #DATA
#define DOUBLE(DATA_1,DATA_2)                                   DATA_1##_##DATA_2
#define MACRO_PROJECT_PREFIX									f_
#define GVAR(VARNAME)                                           DOUBLE(MACRO_PROJECT_PREFIX,VARNAME)
#define QGVAR(VARNAME)                                          QUOTE(GVAR(VARNAME))

// Fetch our params
params [
	["_unit", objNull, [objNull]]
];

// If no live unit was provided, exit
if (!alive _unit or {!local _unit}) exitWith {};





// Start by handcuffing the unit
[_unit, true] call ACE_captives_fnc_setHandcuffed;
[_unit] joinSilent grpNull;

// Delay the remaining code (setHandcuffed sleeps for 0.01 seconds)
/*
[
	{
		params ["_unit"];

		if (!(_unit getVariable ["ace_captives_isHandcuffed", false])) exitWith {};

		// Next, remove the animation EH that was added
		private _EH = _unit getVariable ["ace_captives_handcuffAnimEHID", -1];
		if (_EH >= 0) then {
			_unit removeEventHandler ["AnimChanged", _EH];
			_unit setVariable ["ace_captives_handcuffAnimEHID", -1, false];
		};

		// Overwrite ACE's animation
		private _anim = animationState _unit;
		if (_anim == "ace_amovpercmstpscapwnondnon" or {_anim == "ace_amovpercmstpsnonwnondnon_amovpercmstpscapwnondnon"}) then {
			_unit switchMove "";
		};
		_unit playMoveNow format ["Acts_AidlPsitMstpSsurWnonDnon0%1", 1 + floor random 5];

		// Attach a custom EH to smooth out the freeing animation
		_EH = _unit getVariable [QGVAR(EH_makePrisoner), -1];
		if (_EH >= 0) then {
			_unit removeEventHandler ["AnimChanged", _EH];
		};
		_unit setVariable [QGVAR(EH_makePrisoner), _unit addEventHandler ["AnimChanged", {
			params ["_unit", "_anim"];

			private _validAnims = [
				"amovpercmstpsraswrfldnon",
				"amovpercmstpsraswpstdnon",
				"amovpercmstpsnonwnondnon"
			];

			if (_validAnims find _anim >= 0) then {
				_unit switchMove "Acts_AidlPsitMstpSsurWnonDnon01";
				_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";

				_unit removeEventHandler ["AnimChanged", _unit getVariable [QGVAR(EH_makePrisoner), -1]];
			};
		}], false];
	},
	[_unit],
	0.5
] call CBA_fnc_waitAndExecute;
//*/