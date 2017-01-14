/*
 * Author: Poulern
 * Spawns a group that attacks a location or area.
 *
 * Arguments:
 * 0: array of units
 * 1: start position
 * 2: side of group
 * 3: marker, position or location to attack. If marker is type of area, then it will use that instead.
 *
 * Return Value:
 * Group.
 *
 * Example:
 * [["ftl","r","m","rat","ar","aar"],"spawnmarker","attackmarker",independent] call ca_fnc_spawnattack;
 *
 */
_ishc = !hasInterface && !isDedicated;
//Use headless instead?
if (ca_hc && !_ishc) exitwith {	[_this,_fnc_scriptName] spawn ca_fnc_hcexec;};
//if no headless, and is player, spawn on server instead
if (!ca_hc && hasInterface) then {
	if (!isServer) exitWith {	[_this,_fnc_scriptName] spawn ca_fnc_hcexec;};
};

params ["_unitarray","_position","_attackposition",["_side", ca_defaultside]];
private ["_group"];
_group = [_unitarray,_position,_side] call ca_fnc_spawngroup;
_posdir = _attackposition call ca_fnc_getdirpos;
_attackpos = _posdir select 0;

if ((markerShape _attackposition ==  "RECTANGLE") || (markerShape _attackposition == "ELLIPSE")) then {
  [_group,_attackposition] call CBA_fnc_taskSearchArea;
}else{
  [_group,_attackpos,50,true] call CBA_fnc_taskAttack;
};

_group