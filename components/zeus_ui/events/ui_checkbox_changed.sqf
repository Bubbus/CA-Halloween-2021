// A checkbox was ticked/unticked
case "ui_checkbox_changed": {
	_eventExists = true;

	// Fetch our params
	_args params ["_ctrl", "_isChecked"];

	// Convert the checked status to a boolean (if it is a number)
	if (_isChecked isEqualType 0) then {
		_isChecked = (_isChecked > 0);
	};

	// Determine some variables
	private _ctrlSettingsCover = controlNull;

	// Determine which checkbox is affected
	switch (ctrlIDC _ctrl) do {
		case MACRO_IDC_PRESETS_GAI_CHECKBOX: {

			// Change the colour of the settings cover control
			_ctrlSettingsCover = _zeusUI_presetsCtrlGrp controlsGroupCtrl MACRO_IDC_PRESETS_GAI_SETTINGS_COVER;

			// Save the new value
			missionNamespace setVariable [MACRO_VARNAME_PRESET_GAI, _isChecked, false];

		};

		case MACRO_IDC_PRESETS_SAI_CHECKBOX: {

			// Change the colour of the settings cover control
			_ctrlSettingsCover = _zeusUI_presetsCtrlGrp controlsGroupCtrl MACRO_IDC_PRESETS_SAI_SETTINGS_COVER;

			// Save the new value
			missionNamespace setVariable [MACRO_VARNAME_PRESET_SAI, _isChecked, false];
		};

		case MACRO_IDC_PRESETS_ADVANCEDAI_CHECKBOX: {

			// Change the colour of the settings cover control
			_ctrlSettingsCover = _zeusUI_presetsCtrlGrp controlsGroupCtrl MACRO_IDC_PRESETS_ADVANCEDAI_SETTINGS_COVER;

			// Save the new value
			missionNamespace setVariable [MACRO_VARNAME_PRESET_ADVANCEDAI, _isChecked, false];
		};

		case MACRO_IDC_PRESETS_GAI_FLANKONLY_CHECKBOX: {

			// Save the new value
			missionNamespace setVariable [MACRO_VARNAME_PRESET_GAI_FLANKONLY, _isChecked, false];
		};

		case MACRO_IDC_PRESETS_SAI_USEANIMS_CHECKBOX: {

			// Save the new value
			missionNamespace setVariable [MACRO_VARNAME_PRESET_SAI_USEANIMS, _isChecked, false];
		};
	};

	// If we have a settings cover control, change its colour
	if (!isNull _ctrlSettingsCover) then {
		_ctrlSettingsCover ctrlSetBackgroundColor ([SQUARE(MACRO_COLOUR_RED_DIM), SQUARE(MACRO_COLOUR_GREEN_DIM)] select _isChecked);
	};

	// Set the focus onto the dummy control
	ctrlSetFocus (_zeusUI_presetsCtrlGrp controlsGroupCtrl MACRO_IDC_PRESETS_DUMMYCTRL);

	// Set the checkbox's status (enables calling this event remotely)
	_ctrl cbSetChecked _isChecked;
};
