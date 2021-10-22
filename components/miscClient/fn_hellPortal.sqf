/* --------------------------------------------------------------------------------------------------------------------
	Author:	 Cre8or
	Description:
		Creates a hell portal visual effect using an emissive particle emitter.

		The provided object determines the position and orientation to be used for the portal effect, and is
		hidden locally upon execution.

		NOTE: Calling this function multiple times on the same object will simply override the previous effect.
		Furthermore, upon object deletion, the effect is deleted alongside it.
	Arguments:
		0:	<OBJECT>	The object on which to spawn the effect
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
	["_obj", objNull, [objNull]],
	["_subType", 0, [0]]
];

// If no object was provided, exit
if (isNull _obj) exitWith {};





// Set up some macro functions
#define MACRO_RGB_MULTIPLY(R,G,B,NUM) [R*NUM, G*NUM, B*NUM, 0]

// Set up some variables
private _dir = getDir _obj;
private _dirVec = [sin _dir, cos _dir, 0];
private _sourceSmoke = _obj getVariable [QGVAR(spk_hellPortal_sourceSmoke), objNull];
private "_smokeParams";

// Set up some constants
private _const_subTypes = [
/*
	[
		position offset,
		setParticleCircle,
		setParticleRandom,
		setParticleParams,
		setDropInterval
	]
*/
	[	// Main entrance
		[0, 0, 1.2] vectorAdd (_dirVec vectorMultiply -1),
		[0, [0, 0, 0]],
		[0.5, [0.25, 0.25, 1.3], [0.4, 0.4, 0], 0, 0.1, [0.25, 0, 0, 0.1], 0, 0, 1000],
		[
			["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], _dirVec vectorAdd [0, 0, 0.5], 0, 10, 7.6, 0.01, [1.25, 1.25, 1.75, 3],
			[	// Colour
				[0.8, 0.33, 0.3, 0],
				[0.8, 0.33, 0.3, 0.8],
				[0.8, 0.33, 0.3, 0.2],
				[0.8, 0.33, 0.3, 0]
			],
			[0, 0.01, 0.2, 1], 1, 0, "", "", objNull, 0, false, -1,
			[	// Emissive
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 50),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 20),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 5),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 1)
			]
		],
		0.075
	],

	[	// Side entrance
		[0, 0, 1.5] vectorAdd (_dirVec vectorMultiply -1),
		[0, [0, 0, 0]],
		[0.5, [0.4, 0.4, 1.3], [0.2, 0.2, 0], 0, 0.1, [0.25, 0, 0, 0.1], 0, 0, 1000],
		[
			["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], _dirVec vectorAdd [0, 0, 0.2], 0, 10, 7.8, 0.01, [1.5, 1.5, 2, 3.5],
			[	// Colour
				[0.8, 0.33, 0.3, 0],
				[0.8, 0.33, 0.3, 0.8],
				[0.8, 0.33, 0.3, 0.2],
				[0.8, 0.33, 0.3, 0]
			],
			[0, 0.01, 0.2, 1], 1, 0, "", "", objNull, 0, false, -1,
			[	// Emissive
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 50),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 20),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 5),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 1)
			]
		],
		0.075
	],

	[	// Interior
		[0, 0, 1.5],
		[0.5, [0, 0.5, 0]],
		[0.5, [1.0, 1.0, 1.3], [0.1, 0.1, 0.1], 0, 0.1, [0.25, 0, 0, 0.1], 0, 0, 1000],
		[
			["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.2], 0, 10, 7.8, 0.01, [2.0, 2.0, 2.5, 4],
			[	// Colour
				[0.8, 0.33, 0.3, 0],
				[0.8, 0.33, 0.3, 0.8],
				[0.8, 0.33, 0.3, 0.2],
				[0.8, 0.33, 0.3, 0]
			],
			[0, 0.01, 0.2, 1], 1, 0, "", "", objNull, 0, false, -1,
			[	// Emissive
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 50),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 20),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 5),
				MACRO_RGB_MULTIPLY(0.8, 0.33, 0.3, 1)
			]
		],
		0.04
	]
];





// Spawn the smoke particle source
deleteVehicle _sourceSmoke;

_sourceSmoke = "#particlesource" createVehicleLocal getPosATL _obj;
_smokeParams = _const_subTypes # _subType;
(_smokeParams # 3) set [18, _sourceSmoke];	// Add the smoke source back into the array (this is dumb, but necessary)

_sourceSmoke setPosWorld (getPosWorld _obj vectorAdd (_smokeParams # 0));
_sourceSmoke setParticleCircle (_smokeParams # 1);
_sourceSmoke setParticleRandom (_smokeParams # 2);
_sourceSmoke setParticleParams (_smokeParams # 3);
_sourceSmoke setDropInterval (_smokeParams # 4);

_obj setVariable [QGVAR(spk_hellPortal_sourceSmoke), _sourceSmoke, false];
_obj hideObject true;





// Remove up the emitter when the object is deleted
private _EH = _obj getVariable [QGVAR(EH_spk_hellPortal), -1];

if (_EH >= 0) then {
	_obj removeEventHandler ["Deleted", _EH];
};
_obj setVariable [QGVAR(EH_spk_hellPortal), _obj addEventHandler ["Deleted", {
	params ["_obj"];

	deleteVehicle (_obj getVariable [QGVAR(spk_hellPortal_sourceSmoke), objNull]);
}], false];
