// by ALIAS
// Heavily modified by Bubbus

var_sparkyAnomaly_visibleDistance = 450;

private ["_obiect_orb","_mark_orig"];

_baseObj = _this select 0;
_radius = _this select 1;

if !(alive _baseObj) exitWith {};

_obiect_orb = objNull;
if (isServer) then
{
	_obiect_orb = "Sign_Sphere10cm_F" createVehicle (getPos _baseObj);
	[_obiect_orb, random [50, 75, 100], 0, 0, 0, 0, 0] call kyk_ew_fnc_broadcastJammerAdd;
}
else
{
	_obiect_orb = "Sign_Sphere10cm_F" createVehiclelocal (getPos _baseObj);
};

_obiect_orb hideObject true;

_posSmoother = "Land_HelipadEmpty_F" createVehiclelocal (getPos _baseObj);
_posSmoother hideObject true;




if (hasInterface) then
{
	[_obiect_orb] spawn
	{
		params ["_obiect_orb"];

		while {alive _obiect_orb} do
		{
			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb < var_sparkyAnomaly_visibleDistance}};

			if !(alive _obiect_orb) exitWith {};

			_ele = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_ele setParticleCircle [0, [0, 0, 0]];
			_ele setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_ele setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.3, 11, 7.9, 0.075, [0.003, 0.003, 0.003], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _obiect_orb];
			_ele setDropInterval 0.01;

/*
			_halo = "#particlesource" createVehicleLocal (getPosATL _obiect_orb);
			_halo setParticleCircle [0, [0, 0, 0]];
			_halo setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
			_halo setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_sparks_01.p3d", 1, 0, 1], "", "SpaceObject", 1, 0.1, [0, 0, 0], [0, 0, 0.75], 13, 10, 7.9, 0.075, [0.5, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obiect_orb];
			_halo setDropInterval 0.0033;
			*/

			_orb_lit = "#lightpoint" createVehiclelocal (getPosATL _obiect_orb);
			_orb_lit lightAttachObject [_obiect_orb, [0,0,0]];
			_orb_lit setLightColor [0.92,0.95,1];
			_orb_lit setLightIntensity 1500;
			_orb_lit setLightUseFlare false;
			_orb_lit setLightFlareSize 2;
			_orb_lit setLightFlareMaxDistance 500;
			_orb_lit setLightAttenuation [0.25, 0, 10, 0.3, 9, 20];
			_orb_lit setLightDayLight true;

			waitUntil {sleep 1; (!alive _obiect_orb) or {player distance _obiect_orb > var_sparkyAnomaly_visibleDistance}};

			deleteVehicle _ele;
			//deleteVehicle _halo;
			deleteVehicle _orb_lit;

			if !(alive _obiect_orb) exitWith {};

		};

	};



	[_obiect_orb] spawn
	{
		_orb_obj = _this select 0;

		while {!isNull _orb_obj} do
		{
			_orb_obj say3D ["magnetic_pulse", 300];
			sleep 12;

		};

	};

};




[_baseObj, _obiect_orb, _posSmoother, _radius] spawn
{
	params ["_baseObj", "_obiect_orb", "_posSmoother", "_radius"];

	if (isServer) then
	{
		private _xMod = 3 + random 3;
		private _yMod = 3 + random 3;
		private _zMod = 0.5 + random 0.25;

		_baseObj setVariable ["spark_xMod", _xMod, true];
		_baseObj setVariable ["spark_yMod", _yMod, true];
		_baseObj setVariable ["spark_zMod", _zMod, true];

	};

	private _xyFreqSkew = 8;

	if (hasInterface) then
	{
		waitUntil
		{
			sleep 0.25;
			(!(alive _baseObj)) or {(_baseObj getVariable ["spark_zMod", -1]) >= 0}
		};

		private _xMod = _baseObj getVariable ["spark_xMod", 0];
		private _yMod = _baseObj getVariable ["spark_yMod", 0];
		private _zMod = _baseObj getVariable ["spark_zMod", 0];

		while {alive _posSmoother and {alive _obiect_orb}} do
		{
			private _time = CBA_missionTime;
			private _curXFreqSkew = ((sin _time) * _xyFreqSkew) / _time;
			private _curYFreqSkew = ((cos _time) * _xyFreqSkew) / _time;
			private _xCycle = sin (_time * (_xMod + _curXFreqSkew));
			private _yCycle = cos (_time * (_yMod + _curYFreqSkew));

			private _basePos = getPosATL _posSmoother;
			_obiect_orb setPosATL [(_basePos#0) + (_xCycle * _radius), (_basePos#1) + (_yCycle * _radius), (_basePos#2) + (sin (_time * _zMod)) + 1.25];

			private _distance = _obiect_orb distance player;
			sleep ((((_distance - var_sparkyAnomaly_visibleDistance) * 0.01666) max 0.0333) min 2);

		};
	}
	else
	{
		private _xMod = _baseObj getVariable ["spark_xMod", 0];
		private _yMod = _baseObj getVariable ["spark_yMod", 0];
		private _zMod = _baseObj getVariable ["spark_zMod", 0];

		while {alive _posSmoother and {alive _obiect_orb}} do
		{
			private _time = CBA_missionTime;
			private _curFreqSkew = (sin _time) * _xyFreqSkew;
			private _xCycle = sin (_time * (_xMod + _curFreqSkew));
			private _yCycle = cos (_time * (_yMod + _curFreqSkew));

			private _basePos = getPosASL _posSmoother;
			_obiect_orb setPosASL [(_basePos#0) + (_xCycle * _radius), (_basePos#1) + (_yCycle * _radius), (_basePos#2) + sin (_time * _zMod)];

			sleep 0.5;

		};

	};

};




[_baseObj, _posSmoother, _radius] spawn
{
	params ["_baseObj", "_posSmoother", "_radius"];

	_lastRun = CBA_missionTime;
	_maxVel = _radius * 0.1;

	if (hasInterface) then
	{
		while {alive _baseObj and {alive _posSmoother}} do
		{
			_movement = _maxVel * (CBA_missionTime - _lastRun);
			_smootherPos = getPosASL _posSmoother;
			_dirVec = _smootherPos vectorFromTo (getPosASL _baseObj);
			_distance = (_posSmoother distance _baseObj) min _movement;
			_moveVec = _dirVec vectorMultiply _distance;

			_posSmoother setPosASL (_smootherPos vectorAdd _moveVec);

			_lastRun = CBA_missionTime;
			_plyDist = _posSmoother distance player;
			sleep ((((_plyDist - var_sparkyAnomaly_visibleDistance) * 0.01666) max 0.0333) min 2);

		};

	}
	else
	{
		while {alive _baseObj and {alive _posSmoother}} do
		{
			_movement = _maxVel * (CBA_missionTime - _lastRun);
			_smootherPos = getPosASL _posSmoother;
			_dirVec = _smootherPos vectorFromTo (getPosASL _baseObj);
			_distance = (_posSmoother distance _baseObj) min _movement;
			_moveVec = _dirVec vectorMultiply _distance;

			_posSmoother setPosASL (_smootherPos vectorAdd _moveVec);

			_lastRun = CBA_missionTime;
			sleep 0.5;

		};

	};

};



sleep 3;



_sparkyAttack =
{
	params ["_units", "_objPos"];

	{
	    [_x, 3, nil, nil, [0.2, 0.4, 0.6]] call f_fnc_woundUnitRandomly;
	} forEach _units;

	[_objPos] remoteExec ["f_fnc_fxAttackSparkyAnomaly", 0];

};



if (hasInterface) then
{
	[_obiect_orb, _sparkyAttack, _baseObj] spawn
	{
		params ["_obiect_orb", "_sparkyAttack", "_baseObj"];

		while {alive _obiect_orb} do
	    {
	        _distance = (player distance _obiect_orb);
	        waitUntil
	        {
	            sleep (_distance / 100) max 0.1;
	            _distance = (player distance _obiect_orb);
	            (_distance < 8)
	        };

	        if (((isDamageAllowed player) and {!(player getVariable ["anomalyIgnore", false])}) and {(uniform player) isNotEqualTo "U_B_CBRN_Suit_01_MTP_F"}) then
	        {
				_baseObj setVariable ["playerTriggeredAttack", true, true];
	        };

	        sleep 2;

	    };

	};

};



if (isServer) then
{
	[_obiect_orb, _sparkyAttack, _baseObj] spawn
	{
		params ["_obiect_orb", "_sparkyAttack", "_baseObj"];

		while {(alive _obiect_orb) and {alive _baseObj}} do
		{			
			private _attackWasTriggered = _baseObj getVariable ["playerTriggeredAttack", false];
			_baseObj setVariable ["playerTriggeredAttack", false, true];

			_list_units_in_range = (getPos _obiect_orb) nearEntities ["CAManBase", 10];
			_list_units_in_range = _list_units_in_range select {((isDamageAllowed _x) and {!(_x getVariable ["anomalyIgnore", false])}) and {(uniform _x) isNotEqualTo "U_B_CBRN_Suit_01_MTP_F"}};

			private _attackOccurred = false;
			if (_attackWasTriggered or {count _list_units_in_range > 0}) then
			{
				[_list_units_in_range, (getpos _obiect_orb)] call _sparkyAttack;
				_attackOccurred = true;
			};

			if (_attackOccurred) then
			{
				sleep 3;
			}
			else
			{
				private _nextIterTime = CBA_missionTime + 3;
				waitUntil
				{
					(CBA_missionTime > _nextIterTime) or {(alive _baseObj) and {_baseObj getVariable ["playerTriggeredAttack", false]}}
				};
			};		

		};

	};

};



waitUntil
{
	sleep 1;
	(!(alive _baseObj)) or {!(alive _obiect_orb)} or {!(alive _posSmoother)}
};

deleteVehicle _baseObj;
deleteVehicle _obiect_orb;
deleteVehicle _posSmoother;
