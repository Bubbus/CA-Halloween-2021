#include "..\macros.hpp"

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_destroyHeartAnchor);

params ["_player", "_anchor"];

if !(alive _anchor) exitWith {};
if (_anchor getVariable ["destroying", false]) exitWith {};
_anchor setVariable ["destroying", true];

[_player, "hammersing"] remoteExecCall ["say3D"];

uiSleep 4.9;

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