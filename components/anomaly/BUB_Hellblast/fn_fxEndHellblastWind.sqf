#include "macros.hpp"

CLIENT_ONLY;
params ["_baseObj"];

_source = _baseObj getVariable ["windGenerator", objNull];
deleteVehicle _source;
