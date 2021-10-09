#include "..\macros.hpp"

SERVER_ONLY;

missionNamespace setVariable ["destroyingHeart", true, true];

{
	[_x] remoteExec ["f_fnc_giveUnitGodmode", _x];	
} forEach ([] call BIS_fnc_listPlayers);

[objNull, 4, 2] remoteExec ["f_fnc_doHeartbeatPulse"];

private _delay = (200 / 40);

[
	{
		private _heartPos = getPosASL theheart;		
		[_heartPos] remoteExec ["f_fnc_fxDestroyHeart"];

		_heartPos spawn
		{
			_boom = "Sh_155mm_AMOS" createVehicle _this;
			_boom setPosASL _this;
			_boom setVectorDir [0, 0, -1];
			_boom setVelocity [0, 0, -1000];
			_boom setDamage 1;
		};

		deleteVehicle theheart;
	},
	[], 
	_delay

] call CBA_fnc_waitAndExecute;

[
	{
		"END2" remoteExecCall ["endMission"];
	},
	[], 
	8 + _delay

] call CBA_fnc_waitAndExecute;

