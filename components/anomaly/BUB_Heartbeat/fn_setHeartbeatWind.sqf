#include "macros.hpp"

SERVER_ONLY;
params ["_isOn", "_time"];

_time = _time max 1;

if (isNil 'f_var_heartbeatOriginalWind') then
{
    f_var_heartbeatOriginalWind = wind;
};

if (_isOn) then
{
    _time spawn
    {
        _wind = 0;
        _time = _this;

        while {_wind > -100} do
        {
            sleep 0.15;
            _wind = _wind - (15 / _time);
            setWind [0, _wind, true];
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
            sleep 0.15;
            _wind = _wind + (15 / _time);
            setWind [0, _wind, true];
        };

        _wind = f_var_heartbeatOriginalWind;
        setWind [_wind#0, _wind#1, false];
        f_var_heartbeatOriginalWind = nil;

    };

};
