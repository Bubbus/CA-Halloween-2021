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
[_unit, true] call ace_captives_fnc_setHandcuffed;

// Delay the remaining code (setHandcuffed sleeps for 0.01 seconds)
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
		private _prisonerAnim = format ["Acts_AidlPsitMstpSsurWnonDnon0%1", 1 + floor random 5];
		switch (_anim) do {
			case "ace_amovpercmstpsnonwnondnon_amovpercmstpscapwnondnon";
			case "ace_amovpercmstpscapwnondnon": {
				[_unit, ""] remoteExecCall ["switchMove", 0, false];
				_unit playMoveNow _prisonerAnim;
			};

			default {
				if (_unit getVariable ["ace_isunconscious", false] or {lifeState _unit == "INCAPACITATED"}) then {
					[_unit, _prisonerAnim] remoteExecCall ["switchMove", 0, false];
				} else {
					_unit playMoveNow _prisonerAnim;
				}
			};
		};
		_unit setVariable [QGVAR(prisonerAnim), _prisonerAnim, false];

		// Attach a custom EH to smooth out the freeing animation
		_EH = _unit getVariable [QGVAR(EH_makePrisoner), -1];
		if (_EH >= 0) then {
			_unit removeEventHandler ["AnimChanged", _EH];
		};
		_unit setVariable [QGVAR(EH_makePrisoner), _unit addEventHandler ["AnimChanged", {
			params ["_unit", "_anim"];

			private _prisonerAnim = _unit getVariable [QGVAR(prisonerAnim), ""];

			switch (_anim) do {

				// Handle unconsciousness
				case "ace_amovpercmstpscapwnondnon": {
					[_unit, _prisonerAnim] remoteExecCall ["switchMove", 0, false];
					_unit playMoveNow _prisonerAnim;
				};

				// Outro animation
				case "amovpercmstpsraswrfldnon";
				case "amovpercmstpsraswpstdnon";
				case "amovpercmstpsnonwnondnon_turnl";	// Only used by AI, but I needed this for testing
				case "amovpercmstpsnonwnondnon_turnr";	// Same as above
				case "amovppnemstpsnonwnondnon";
				case "amovpercmstpsnonwnondnon": {

					[_unit, _prisonerAnim] remoteExecCall ["switchMove", 0, false];

					if (_unit getVariable ["ace_captives_isHandcuffed", false]) then {
						_unit playMoveNow _prisonerAnim;

					} else {
						_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";

						_unit removeEventHandler ["AnimChanged", _unit getVariable [QGVAR(EH_makePrisoner), -1]];
					};
				};
			};

		}], false];
	},
	[_unit],
	0.5
] call CBA_fnc_waitAndExecute;
