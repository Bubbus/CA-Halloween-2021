
_object_burp_damage = _this select 0;

while {alive _object_burp_damage} do
{
	//_list_units_in_range = (position _object_burp_damage) nearEntities [["Man","LandVehicle"],9];
	_list_units_in_range = (position _object_burp_damage) nearEntities ["CAManBase",9];
	_list_units_in_range = _list_units_in_range select {(isDamageAllowed _x) and {!(_x getVariable ["f_var_isZeus", false])}};

	{
		_tipat= ["strigat_1","strigat_2","strigat_3","strigat_4","strigat_5","strigat_6","strigat_7","strigat_8","strigat_9","strigat_91","strigat_92"] call BIS_fnc_selectRandom;
		[_x,[_tipat,100]] remoteExec ["say3d",0];

		sleep 0.5 + (random 0.5);

		_pos = getPosATL _x;

		if (isPlayer _x) then
		{
			_x setPos [0,0,0];
			_x spawn {sleep 1; _this setDamage 1; deleteVehicle _this;}
		}
		else
		{
			_x setDamage 1;
			_x hideObjectGlobal true;
			deleteVehicle _x;
		};

		_oase = createVehicle ["Land_HumanSkeleton_F", [_pos#0, _pos#1, 1.5], [], 0, "CAN_COLLIDE"];
		[_oase] remoteExec ["f_fnc_fxSplashBurperAnomaly",0];
		_oase setVectorUp [0,-1,1];

		_balta_sange = createVehicle ["BloodSplatter_01_Medium_New_F", [_pos#0, _pos#1, 0], [], 0, "CAN_COLLIDE"];
		_balta_sange setVectorUp surfaceNormal position _balta_sange;

		[_object_burp_damage,["blood_splash",100]] remoteExec ["say3d",0];

		sleep 0.3;

		[_balta_sange,["bones_drop",100]] remoteExec ["say3d",0];

	} foreach _list_units_in_range;

	sleep 1;

};
