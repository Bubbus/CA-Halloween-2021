
private _baseEnt = _this select 0;
private _radius = _this select 1;

sleep 30;

while {alive _baseEnt} do
{
	private _list_ai_in_range = _baseEnt nearEntities ["CAManBase", _radius];
	_list_ai_in_range = _list_ai_in_range select {local _x};
	
	{
		private _reldir = _x getDir _baseEnt;
		private _fct = selectRandom [30, -30];

		private _op_dir = if (_reldir < 180) then 
		{
			_reldir + 180 + _fct
		} 
		else 
		{
			_reldir - 180 + _fct
		};

		private _avoid_poz = _x getPos [100 + random 500, _op_dir];

		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];

	} foreach _list_ai_in_range;

	sleep 10;

};
