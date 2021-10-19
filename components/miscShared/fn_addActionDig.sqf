/* --------------------------------------------------------------------------------------------------------------------
	Author:	 Cre8or
	Description:
		Adds an ACE3 action to the given object, enabling players to remove it by digging.

		If a varname is passed for the second argument, this function will create the variable on all machines
		if it is not yet defined. As such, you may either initialise it yourself (as an empty array), or leave
		it uninitialised (and let the function handle it for you).

		NOTE: This function requires ACE3 and GRAD Trenches.
	Arguments:
		0:	<OBJECT>	The object that should receive the action
		1:	<STRING>	The missionNamespace varname of the array into which the object should be
					inserted (can be used to track the archaeology team's uncovering progress)
					(optional, default: "")
		2:	<ARRAY>		The offset from the model's origin for the action's 3D position (optional,
					default: [0,0,0])
		3:	<NUMBER>	The maximum distance from which the action can be seen (optional, default: 3)
	Returns:
		(nothing)
	Example:
		[this, "objective_1_props", [0, 0, 2], 3] call f_fnc_addActionDig
-------------------------------------------------------------------------------------------------------------------- */
#define QUOTE(DATA)                                             #DATA
#define DOUBLE(DATA_1,DATA_2)                                   DATA_1##_##DATA_2
#define MACRO_PROJECT_PREFIX									f_
#define GVAR(VARNAME)                                           DOUBLE(MACRO_PROJECT_PREFIX,VARNAME)
#define QGVAR(VARNAME)                                          QUOTE(GVAR(VARNAME))

// Fetch our params
params [
	["_obj", objNull, [objNull]],
	["_arrayVarName", "", [""]],
	["_offset", [0,0,0], [[]], 3],
	["_distance", 3, [0]]
];

// If no object was provided, exit
if (isNull _obj) exitWith {};





// Set up some macro functions
// --------------------------------------------------------------------------------------------------------------------
#define MACRO_ADD_ACTION(MYOBJ,MYACTIONNAME,MYPARENTPATH,MYACTIONARRAY) \
	private _actionPath = MYOBJ getVariable [QGVAR(actionPath_#MYACTIONNAME), []]; \
 	\
	if (_actionPath isNotEqualTo []) then { \
		[MYOBJ, 0, _actionPath] call ace_interact_menu_fnc_removeActionFromObject; \
	}; \
 	\
 	_actionPath = [MYOBJ, 0, MYPARENTPATH, MYACTIONARRAY] call ace_interact_menu_fnc_addActionToObject; \
	MYOBJ setVariable [QGVAR(actionPath_#MYACTIONNAME), _actionPath, false];
// --------------------------------------------------------------------------------------------------------------------





if (hasInterface) then {

	// Define our ACE actions and attach them to the object
	private _actionParent = [
		QGVAR(actionParent),
		"Archaeology",
		"",
		{nil},		// Must not be {}, otherwise the category is hidden
		{true},
		{},
		[],
		_offset,	// Model offset
		_distance,	// Distance
		[false, false, false, false, true]
	] call ace_interact_menu_fnc_createAction;

	private _action_excavate = [
		QGVAR(action_excavate),
		"Excavate",
		"",
		{[_target, _player] call grad_trenches_functions_fnc_removeTrench},
		{[_target, _player] call ace_trenches_fnc_canContinueDiggingTrench}
	] call ace_interact_menu_fnc_createAction;

	private _action_helpExcavate = [
		QGVAR(action_helpExcavate),
		"Help excavate",
		"",
		{[_target, _player] call grad_trenches_functions_fnc_addDigger},
		{[_target, _player] call grad_trenches_functions_fnc_canHelpDiggingTrench}
	] call ace_interact_menu_fnc_createAction;

	// Attach our ACE actions to the object (and overwrite the existing ones, if necessary - useful for testing)
	MACRO_ADD_ACTION(_obj,parent,[],_actionParent);
	MACRO_ADD_ACTION(_obj,excavate,[QGVAR(actionParent)],_action_excavate);
	MACRO_ADD_ACTION(_obj,helpExcavate,[QGVAR(actionParent)],_action_helpExcavate);
};





if (isServer) then {

	// Add this object to the specified missionNamespace array
	if (_arrayVarName isNotEqualTo "") then {
		private _array = missionNamespace getVariable [_arrayVarName, []];
		_array pushBackUnique _obj;
		missionNamespace setVariable [_arrayVarName, _array, false];

		publicVariable _arrayVarName;
	};

	// Store the necessary data
	_obj setVariable ["ace_trenches_progress", 0.999, true];	// Must be less than 1
	_obj setVariable [QGVAR(arrayVarName), _arrayVarName, false];

	// Keep track of the archaeology team's progress (object deletion should be broadcast)
	private _EH = _obj getVariable [QGVAR(EH_spk_addActionDig), -1];

	if (_EH >= 0) then {
		_obj removeEventHandler ["Deleted", _EH];
	};
	_obj setVariable [QGVAR(EH_spk_addActionDig), _obj addEventHandler ["Deleted", {
		params ["_obj"];

		private _arrayVarName = _obj getVariable [QGVAR(arrayVarName), ""];

		if (_arrayVarName isNotEqualTo "") then {
			private _array = missionNamespace getVariable [_arrayVarName, []];
			_array = _array - [_obj];
			missionNamespace setVariable [_arrayVarName, _array, false];

			publicVariable _arrayVarName;
		};
	}], false];
};
