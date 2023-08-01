/*
Module for adding tactical icons. Module only shows black pixels.
*/

#define BLACK [0, 0, 0, 1]
#define ICON_DIRECTORY "\APP6\images\icon\"

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

private _iconColour = BLACK;
private _iconColourCustom = _module getVariable ["iconColourCustom", "[]"];
if (_iconColourCustom isNotEqualTo "[]") then {
	_iconColour = parseSimpleArray _iconColourCustom;
};

private _iconType = _module getVariable ["iconType", ""];
private _markerName = _module getVariable ["markerName", ""];
private _iconWidth = _module getVariable ["iconWidth", ""];
private _iconHeight = _module getVariable ["iconHeight", ""];
private _iconRotation = _module getVariable ["iconRotation", ""];
private _iconText = _module getVariable ["iconText", ""];
private _iconTextShadow = _module getVariable ["iconTextShadow", ""];
private _iconTextSize = _module getVariable ["iconTextSize", ""];
private _iconTextFont = _module getVariable ["iconTextFont", ""];
private _iconTextPosition = _module getVariable ["iconTextPosition", ""];

_iconType = ICON_DIRECTORY + _iconType; //paa's for this module are within the mod

waitUntil {!isNil "APP6_markerArray"};
APP6_markerArray pushBack [_iconType, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, _iconText, _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];