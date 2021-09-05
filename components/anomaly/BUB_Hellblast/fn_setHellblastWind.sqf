#include "macros.hpp"

SERVER_ONLY;
params ["_isOn", "_time"];

_time = _time max 1;

if (isNil 'f_var_hellblastOriginalWind') then
{
    f_var_hellblastOriginalWind = wind;
};

if (_isOn) then
{
    _time spawn
    {
        _wind = 0;
        _time = _this;

        while {_wind > -100} do
        {
            sleep 1;
            _wind = _wind - (100 / _time);
            setWind [_wind, 0, true];
        };

    };

}
else
{
    _time spawn
    {
        _wind = -100;
        _time = _this;

        while {_wind < 0} do
        {
            sleep 1;
            _wind = _wind + (100 / _time);
            setWind [_wind, 0, true];
        };

        _wind = f_var_hellblastOriginalWind;
        setWind [_wind#0, _wind#1, false];
        f_var_hellblastOriginalWind = nil;

    };

};
