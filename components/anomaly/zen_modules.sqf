call
{
    _createBurper =
    {
    	params ["_pos"];

    	[_pos] remoteExec ["fnc_zen_createBurper", 2];
    };

    ["[CA-BOO] Anomalies", "Burper", _createBurper] call zen_custom_modules_fnc_register;

    _createScreamer =
    {
    	params ["_pos"];

    	[_pos] remoteExec ["f_fnc_createScreamer", 2];
    };

    ["[CA-BOO] Anomalies", "Screamer", _createScreamer] call zen_custom_modules_fnc_register;

    _createSwarmer =
    {
    	params ["_pos"];

        if EXISTS(swarmer_public) exitWith
        {
            ["A Swarmer already exists."] call zen_common_fnc_showMessage;
        };

    	[_pos, 50, "", 0.51] remoteExec ["f_fnc_createSwarmer", 2];
    };

    ["[CA-BOO] Anomalies", "Swarmer", _createSwarmer] call zen_custom_modules_fnc_register;

    _createFartySmall =
    {
    	params ["_pos"];

    	[_pos, 10, 3] remoteExec ["fnc_zen_createFarty", 2];
    };

    ["[CA-BOO] Anomalies", "Farty (20m)", _createFartySmall] call zen_custom_modules_fnc_register;


    _createFartyNormal =
    {
    	params ["_pos"];

    	[_pos, 25, 7] remoteExec ["fnc_zen_createFarty", 2];
    };

    ["[CA-BOO] Anomalies", "Farty (50m)", _createFartyNormal] call zen_custom_modules_fnc_register;


    _createFartyHuge =
    {
    	params ["_pos"];

    	[_pos, 37.5, 16] remoteExec ["fnc_zen_createFarty", 2];
    };

    ["[CA-BOO] Anomalies", "Farty (75m)", _createFartyHuge] call zen_custom_modules_fnc_register;


    _createFlamer50 =
    {
    	params ["_pos"];

    	[_pos, 50] remoteExec ["fnc_zen_createFlamer", 2];
    };

    ["[CA-BOO] Anomalies", "Flamer (100m)", _createFlamer50] call zen_custom_modules_fnc_register;


    _createFlamer75 =
    {
    	params ["_pos"];

    	[_pos, 75] remoteExec ["fnc_zen_createFlamer", 2];
    };

    ["[CA-BOO] Anomalies", "Flamer (150m)", _createFlamer75] call zen_custom_modules_fnc_register;


    _createFlamer100 =
    {
    	params ["_pos"];

    	[_pos, 100] remoteExec ["fnc_zen_createFlamer", 2];
    };

    ["[CA-BOO] Anomalies", "Flamer (200m)", _createFlamer100] call zen_custom_modules_fnc_register;


    _createFlamer150 =
    {
    	params ["_pos"];

    	[_pos, 150] remoteExec ["fnc_zen_createFlamer", 2];
    };

    ["[CA-BOO] Anomalies", "Flamer (300m)", _createFlamer150] call zen_custom_modules_fnc_register;


    _createFlamer200 =
    {
    	params ["_pos"];

    	[_pos, 200] remoteExec ["fnc_zen_createFlamer", 2];
    };

    ["[CA-BOO] Anomalies", "Flamer (400m)", _createFlamer200] call zen_custom_modules_fnc_register;


    _createSparky1 =
    {
        params ["_pos"];

        [_pos, 0.5] remoteExec ["fnc_zen_createSparky", 2];
    };

    ["[CA-BOO] Anomalies", "Sparky (1m)", _createSparky1] call zen_custom_modules_fnc_register;

    _createSparky10 =
    {
    	params ["_pos"];

    	[_pos, 10] remoteExec ["fnc_zen_createSparky", 2];
    };

    ["[CA-BOO] Anomalies", "Sparky (20m)", _createSparky10] call zen_custom_modules_fnc_register;


    _createSparky20 =
    {
    	params ["_pos"];

    	[_pos, 20] remoteExec ["fnc_zen_createSparky", 2];
    };

    ["[CA-BOO] Anomalies", "Sparky (40m)", _createSparky20] call zen_custom_modules_fnc_register;


    _createSparky40 =
    {
    	params ["_pos"];

    	[_pos, 40] remoteExec ["fnc_zen_createSparky", 2];
    };

    ["[CA-BOO] Anomalies", "Sparky (80m)", _createSparky40] call zen_custom_modules_fnc_register;


    _createSparky100 =
    {
    	params ["_pos"];

    	[_pos, 100] remoteExec ["fnc_zen_createSparky", 2];
    };

    ["[CA-BOO] Anomalies", "Sparky (200m)", _createSparky100] call zen_custom_modules_fnc_register;


    _createMegaSparky100 =
    {
    	params ["_pos"];

    	[_pos, 100] remoteExec ["fnc_zen_createMegaSparky", 2];
    };

    ["[CA-BOO] Anomalies", "MEGA Sparky (200m)", _createMegaSparky100] call zen_custom_modules_fnc_register;


    _createMegaSparky1 =
    {
    	params ["_pos"];

    	[_pos, 1] remoteExec ["fnc_zen_createMegaSparky", 2];
    };

    ["[CA-BOO] Anomalies", "MEGA Sparky (static)", _createMegaSparky1] call zen_custom_modules_fnc_register;


    // Sounds

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\creepy_sound_01.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Creepy Sound 01", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\creepy_sound_02.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Creepy Sound 02", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\creepy_sound_03.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Creepy Sound 03", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\creepy_sound_04.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Creepy Sound 04", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\creepy_sound_05.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Creepy Sound 05", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\demonic_noise_01.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Demonic Noise 01", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\demonic_noise_02.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Demonic Noise 02", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\ghost_01.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Ghost 01", _creepySound] call zen_custom_modules_fnc_register;

    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\heartbeat_01.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Heartbeat 01", _creepySound] call zen_custom_modules_fnc_register;


    _creepySound =
    {
        params ["_pos"];

        _object = "Land_HelipadEmpty_F" createVehicle _pos;

        playSound3D [getMissionPath "\sounds\wind_noise_01.ogg", _object];

    	_object spawn {sleep 20; deleteVehicle _this};

    };

    ["[CA-BOO] Sounds", "Wind Noise 01", _creepySound] call zen_custom_modules_fnc_register;


};
