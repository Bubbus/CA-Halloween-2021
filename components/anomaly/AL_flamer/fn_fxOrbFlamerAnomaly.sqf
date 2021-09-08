// by ALIAS

if (!hasInterface) exitWith {};

params ["_flamer"];

_orb = "Sign_Sphere100cm_F" createVehicleLocal (getPosATL _flamer);
_orb setObjectMaterial [0, "A3\Structures_F\Data\Windows\window_set.rvmat"];
_orb setObjectTexture [0, "res\01_burper.jpg"];


[_orb, _flamer] spawn
{
	params ["_orb", "_flamer"];

	while {alive _flamer} do
	{
		_orb setVariable ["distant", ((_orb distance player) > var_flamerAnomaly_visibleDistance)];

		_orbPos = getPos _orb;
		_flamerPos = getPosVisual _flamer;

		_spinMul = (_orb getVariable ["spinMultiplier", 45]);
		_wiggle = (0.25 * (45 / _spinMul)) min 0.25;
		_height = 0.95 + (cos (CBA_missionTime * (_spinMul * 4))) * _wiggle;

		_orb setPos [_flamerPos#0, _flamerPos#1, (_flamerPos#2) + _height];
		_orb setDir (CBA_missionTime mod 360) * _spinMul;

		sleep 0.016;
	};

	deleteVehicle _orb;
};


while {alive _flamer} do
{
	_state = _flamer getVariable ["flamerState", "none"];

	if !(_orb getVariable ["distant", false]) then
	{
		switch (_state) do
		{
			case ("hiding"):
			{
				_orb setVariable ["spinMultiplier", 1];
				[_orb, _flamer, "hiding"] spawn fnc_flamerAnomaly_orb_hidingFx;

		    };


			case ("jumping"):
			{
				_orb setVariable ["spinMultiplier", 1];
				[_orb, _flamer, "jumping"] spawn fnc_flamerAnomaly_orb_hidingFx;

		    };


		    case ("targeting"):
			{
				_orb setVariable ["spinMultiplier", 720];
				[_orb, _flamer, "targeting"] spawn fnc_flamerAnomaly_orb_targetingFx;

		    };

			case ("waiting"):
			{
				_orb setVariable ["spinMultiplier", 45];
				[_orb, _flamer, "waiting"] spawn fnc_flamerAnomaly_orb_waitingFx;

			};

		};

		waitUntil
		{
			if !((alive _flamer) and {alive _orb}) exitWith {true};

			_isDistant = _orb getVariable ["distant", false];
			_isWaiting = (_flamer getVariable ["flamerState", "none"] isEqualTo _state);

			(!_isWaiting) or {_isDistant}

		};

		sleep 0.016;

	}
	else
	{
		_orb setVariable ["spinMultiplier", 45];
		sleep 2;
	};

};
