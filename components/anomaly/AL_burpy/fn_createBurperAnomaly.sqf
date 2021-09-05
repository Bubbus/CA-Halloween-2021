private ["_markern","_nm","_object_anom_burp","_markerstr","_damage_protect"];

if (!isServer) exitwith {};

_anomaly_pos = _this select 0;
_mobile_anomaly = _this select 1;

_object_anom_burp = "Land_ClutterCutter_large_F" createVehicle _anomaly_pos;
_object_anom_burp setPosASL _anomaly_pos;

_balta_sang = "BloodSplatter_01_Medium_New_F" createVehicle _anomaly_pos;
_balta_sang setdir (random 360);
_balta_sang setVectorUp surfaceNormal position _balta_sang;

[_object_anom_burp] spawn f_fnc_aiAvoidBurperAnomaly;

[_object_anom_burp] spawn f_fnc_damageLoopBurperAnomaly;
[_object_anom_burp] remoteExec ["f_fnc_fxBurperAnomaly",0,true];

if (_mobile_anomaly) then
{
	_object_anom_burp spawn
	{
		while {alive _this} do
		{
			_poz_ini_burp = getposatl _this;
			_new_poz = [_poz_ini_burp,0.1,1,1,0,-1,0] call BIS_fnc_findSafePos;
			_this setPos [_new_poz select 0,_new_poz select 1, _poz_ini_burp select 2];
			sleep 60 + random 60;
		};

	};

};

_object_anom_burp
