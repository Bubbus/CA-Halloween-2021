// by Bubbus, based on code by ALIAS

if (!isServer) exitWith {};

params ["_launcher","_duration"];

if (_launcher getVariable ["launchingFireworks", false]) exitWith {};

_launcher setVariable ["launchingFireworks", true, true];

[_launcher, _duration] spawn
{
	params ["_launcher", "_duration"];

	_startTime = time;

	while {(time - _startTime) < _duration} do
	{
		_projLife = random [1, 1.4, 1.9];
		[_launcher, _projLife] remoteExec ["f_fnc_createFireworkRocket"];

		sleep (2.5 + random 0.4);
	};

	_launcher setVariable ["launchingFireworks", nil, true];

};
