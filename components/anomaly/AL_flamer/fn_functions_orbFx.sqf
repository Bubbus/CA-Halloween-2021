
fnc_flamerAnomaly_orb_waitingFx =
{
	params ["_orb", "_flamer", "_state"];

	_orb setObjectMaterial [0, "A3\Structures_F\Data\Windows\window_set.rvmat"];
	_orb setObjectTexture [0, "res\01_burper.jpg"];

	_part_gost = "#particlesource" createVehicleLocal (getPosATL _orb);
	//_part_gost attachTo [_orb, [0,0,0]];
	_part_gost setParticleCircle [5, [0, -3, -0.5]];
	_part_gost setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 200, 0.25, [0, 0, 0, 0.1], 0, 0];
	_part_gost setParticleParams [["\A3\data_f\missileSmoke", 1, 0, 1], "", "Billboard", 1, 1.8, [0, 0, 0], [0, 0, 0.75], 0, 9.6, 7.9, 0.3, [0.5, 1, 1], [[0.2, 0.2, 0.2, 0], [0.3, 0.3, 0.3, 1], [0.1, 0.1, 0.1, 0.5]], [0.08], 1, 0, "", "", _flamer];
	_part_gost setDropInterval 0.05;

	_part_gost_1 = "#particlesource" createVehicleLocal (getPosATL _orb);
	//_part_gost_1 attachTo [_orb, [0,0,0]];
	_part_gost_1 setParticleCircle [0,[0,0,0]];
	_part_gost_1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_part_gost_1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 0, 9, 7.9, 0.075, [2, 1], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _orb];
	_part_gost_1 setDropInterval 0.1;

	waitUntil
	{
		sleep 0.016;

		if !((alive _flamer) and {alive _orb}) exitWith {true};

		_isDistant = _orb getVariable ["distant", false];
		_isState = (_flamer getVariable ["flamerState", "none"] isEqualTo _state);

		(!_isState) or {_isDistant}

	};

	deleteVehicle _part_gost_1;
	deleteVehicle _part_gost;

};




fnc_flamerAnomaly_orb_hidingFx =
{
	params ["_orb", "_flamer", "_state"];

	_orb hideObject true;

	waitUntil
	{
		sleep 0.016;

		if !((alive _flamer) and {alive _orb}) exitWith {true};

		_isDistant = _orb getVariable ["distant", false];
		_isState = (_flamer getVariable ["flamerState", "none"] isEqualTo _state);

		(!_isState) or {_isDistant}

	};

	if (alive _orb) then {_orb hideObject false};

};




fnc_flamerAnomaly_orb_targetingFx =
{
	params ["_orb", "_flamer", "_state"];

	//_orb hideObject true;

	_part_gost_1 = "#particlesource" createVehicleLocal (getPosATL _orb);
	//_part_gost_1 attachTo [_orb, [0,0,0]];
	_part_gost_1 setParticleCircle [0, [1, 0, 0]];
	_part_gost_1 setParticleRandom [0.3, [0.5, 0.5, 0.5], [0, 0, 0], 0, 0.1, [0, 0, 0, 0.3], 0, 0];
	_part_gost_1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard", 0.375, 1.5, [0, 0, 0.5], [0, 0, 0], 0, 5, 7.9, 0, [4, 2, 0, 0], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 0], [1, 1, 1, 0]], [0.8], 0, 0, "", "", _orb, 0, false, -1, [[512, 255, 255, 0],[512, 255, 255, 0],[512, 255, 255, 0]]];
	_part_gost_1 setDropInterval 0.03;

	_part_gost = "#particlesource" createVehicleLocal (getPosATL _orb);
	//_part_gost attachTo [_orb, [0,0,0]];
	_part_gost setParticleCircle [0,[0,0,0]];
	_part_gost setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_part_gost setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 0, 9, 7.9, 0.075, [2, 1], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _orb];
	_part_gost setDropInterval 0.1;

	_li_fire = "#lightpoint" createVehicle getPosATL _flamer;
	_li_fire lightAttachObject [_orb, [0,0,0]];
	_li_fire setLightAttenuation [0,0,0,0,0.1,75];
	_li_fire setLightBrightness 2;
	_li_fire setLightDayLight true;
	_li_fire setLightAmbient [1,0.2,0.1];
	_li_fire setLightColor [1,0.5,0.4];

	_speakerHandle = [_orb] spawn
	{
		params ["_orb"];

		_speaker = "#particlesource" createVehicleLocal (getposatl _orb);
		_speaker attachTo [_orb, [0,0,0]];

		_orb setVariable ["orbSpeaker", _speaker];

		while {alive _orb} do
		{
			_salt_sunet = selectRandom ["01_blast_2","02_blast_2","03_blast_2"];
			_speaker say3d [_salt_sunet, 200];
			sleep 0.7;
		};

	};

	waitUntil
	{
		sleep 0.016;

		if !((alive _flamer) and {alive _orb}) exitWith {true};

		_isDistant = _orb getVariable ["distant", false];
		_isState = (_flamer getVariable ["flamerState", "none"] isEqualTo _state);

		(!_isState) or {_isDistant}

	};

	terminate _speakerHandle;

	_speaker = (_orb getVariable ["orbSpeaker", objNull]);
	deleteVehicle _speaker;

	deleteVehicle _li_fire;
	deleteVehicle _part_gost_1;
	deleteVehicle _part_gost;

	//if (alive _orb) then {_orb hideObject false};

};
