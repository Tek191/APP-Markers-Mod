/*
Module for adding custom paa's. This module only has B/O/G/C colours selectable.
*/

private _module = _this select 0;

/*If icon is not supposed to be visible to player it is not added to APP6_markerArray*/
private _invisibleToPlayer = true;
switch (playerSide) do {
	case west: {
		if (_module getVariable ["iconVisibleBLUFOR", false]) then {_invisibleToPlayer = false;};
	};
	case east: {
		if (_module getVariable ["iconVisibleOPFOR", false]) then {_invisibleToPlayer = false;};
	};
	case resistance: {
		if (_module getVariable ["iconVisibleGREENFOR", false]) then {_invisibleToPlayer = false;};
	};
	case civilian: {
		if (_module getVariable ["iconVisibleCIVFOR", false]) then {_invisibleToPlayer = false;};
	};
	default {_invisibleToPlayer = true;};
};
if (_invisibleToPlayer) exitWith {};

private _fileInMissionFolder = _module getVariable ["fileInMissionFolder", ""];
private _fileName = _module getVariable ["fileName", ""];
private _markerName = _module getVariable ["markerName", ""];
private _iconColour = parseSimpleArray (_module getVariable ["iconColour", ""]); //Array input is STRING so converts STRING -> ARRAY
private _iconWidth = _module getVariable ["iconWidth", ""];
private _iconHeight = _module getVariable ["iconHeight", ""];
private _iconRotation = _module getVariable ["iconRotation", ""];
private _iconText = _module getVariable ["iconText", ""];
private _iconTextShadow = _module getVariable ["iconTextShadow", ""];
private _iconTextSize = _module getVariable ["iconTextSize", ""];
private _iconTextFont = _module getVariable ["iconTextFont", ""];
private _iconTextPosition = _module getVariable ["iconTextPosition", ""];

if (_fileInMissionFolder) then {
	_fileName = getMissionPath "" + _fileName; //getMissionPath "" -> "C:\Users\Username\Documents\Arma 3\missions\MissionName.Altis\" with the trailing \
};

waitUntil {!isNil "APP6_markerArray"};
APP6_markerArray pushBack [_fileName, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, _iconText, _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];