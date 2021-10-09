#include "..\macros.hpp"

SERVER_ONLY;

params ["_anchor"];

if !(alive _anchor) exitWith {};

[getPosASL _anchor] remoteExec ["f_fnc_fxDestroyHeartAnchor"];

deleteVehicle _anchor;

[
	{
		private _anchors = 
		[
			missionNamespace getVariable ["anchor_1", objNull],
			missionNamespace getVariable ["anchor_2", objNull],
			missionNamespace getVariable ["anchor_3", objNull]
		];

		if ((_anchors findIf {!isNull _x} < 0) and {!(missionNamespace getVariable ["destroyingHeart", false])}) then
		{
			[] call f_fnc_destroyHeart;
		};
	},
	[],
	1
] call CBA_fnc_waitAndExecute;