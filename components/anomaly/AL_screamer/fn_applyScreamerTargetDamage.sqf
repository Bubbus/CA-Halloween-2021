// by Bubbus

params ["_unit", "_screamerPos"];

private _unitPos = getPosASL _unit;

private _distance = _unitPos distance _screamerPos;
private _maxHarmRange = 60;
private _harmCoefficient = 0 max (1 - (_distance / _maxHarmRange)) min 1;

private _woundCount = (ceil (_harmCoefficient * 4)) max 1;
private _harmDistribution = [0.5, 0.6, 0.9] vectorMultiply (_harmCoefficient max 0.3);

[_unit, _woundCount, nil, nil, _harmDistribution] call f_fnc_woundUnitRandomly;

if (_harmCoefficient > 0.15) then
{
	private _forceDir = (_screamerPos vectorFromTo _unitPos) vectorAdd [0, 0, 0.1];
	private _forceVector = _forceDir vectorMultiply (_harmCoefficient * 4000);
	private _modelLocalForcePos = _unit selectionPosition "pelvis";

	_unit addForce [_forceVector, _modelLocalForcePos];
	[{_this setUnconscious false}, _unit, 3] call CBA_fnc_waitAndExecute;
};
