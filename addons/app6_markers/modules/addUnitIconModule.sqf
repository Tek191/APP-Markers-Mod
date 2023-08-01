/*
Module for adding APP6 unit style paa's. This module only has B/O colours selectable.
*/

#define UNIT_ICON_DIRECTORY "APP6\images\unitIcon\"

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

private _iconColour = [];
private _iconExtra = "";
private _iconStatus = "";
private _iconStatusColour = [];
private _iconBase = "";
private _fileSideName = UNIT_ICON_DIRECTORY; //paa's for this module are all within the mod

/*SET ICON COLOUR*/
switch (_module getVariable ["iconSide", ""]) do {
	case 0: {_iconColour = [0.49, 0.88, 1, 1]; _fileSideName = _fileSideName + "blufor_";}; 
	case 1: {_iconColour = [1, 0.5, 0.5, 1]; _fileSideName = _fileSideName + "opfor_";}; 
	case 2: {_iconColour = [0.67, 1, 0.67, 1]; _fileSideName = _fileSideName + "greenfor_";}; 
	default {_iconColour = [0.49, 0.88, 1, 1]; _fileSideName = _fileSideName + "blufor_";};
};
private _iconColourCustom = _module getVariable ["iconColourCustom", "[]"];
if (_iconColourCustom isNotEqualTo "[]") then {
	_iconColour = parseSimpleArray _iconColourCustom;
};

/*SET IF UNIT REDUCED/REINFORCED*/
switch (_module getVariable ["iconExtra", ""]) do {
	case 0: {_iconExtra = 0;};
	case 1: {_iconExtra = _fileSideName + "reduced.paa";};
	case 2: {_iconExtra = _fileSideName + "reinforced.paa";};
	case 3: {_iconExtra = _fileSideName + "reinforcedreduced.paa";};
	default {_iconExtra = 0;};
};

/*SET ICON STATUS*/
switch (_module getVariable ["iconStatus", ""]) do {
	case 0: {_iconStatus = 0;};
	case 1: {_iconStatus = _fileSideName + "fullycapable.paa"; _iconStatusColour = [0, 1, 0, 1];};
	case 2: {_iconStatus = _fileSideName + "damaged.paa"; _iconStatusColour = [1, 1, 0, 1];};
	case 3: {_iconStatus = _fileSideName + "destroyed.paa"; _iconStatusColour = [1, 0, 0, 1];};
	case 4: {_iconStatus = _fileSideName + "fulltocapacity.paa"; _iconStatusColour = [0, 0.70588235294, 0.94117647058, 1];};
	default {_iconStatus = 0;};
};

private _iconType = _fileSideName + (_module getVariable ["iconType", ""]);
private _markerName = _module getVariable ["markerName", ""];
private _iconWidth = _module getVariable ["iconWidth", ""];
private _iconHeight = _module getVariable ["iconHeight", ""];
private _iconRotation = _module getVariable ["iconRotation", ""];
private _iconText = _module getVariable ["iconText", ""];
private _iconTextShadow = _module getVariable ["iconTextShadow", ""];
private _iconTextSize = _module getVariable ["iconTextSize", ""];
private _iconTextFont = _module getVariable ["iconTextFont", ""];
private _iconTextPosition = _module getVariable ["iconTextPosition", ""];

waitUntil {!isNil "APP6_markerArray"};

/*BASE LAYER - SUSPECTED/PRESENT*/
if (_module getVariable ["iconSuspected", false]) then {
	_iconBase = _fileSideName + "suspected.paa";
} else {
	_iconBase = _fileSideName + "present.paa"; 
};
APP6_markerArray pushBack [_iconBase, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, _iconText, _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];

/*TYPE OF UNIT LAYER - NONE/INF/MECH ETC, WHEN NONE NOT RENDERED SINCE COVERED BY BASE LAYER*/
if (_module getVariable ["iconType", ""] isNotEqualTo "none") then {
	APP6_markerArray pushBack [_iconType, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, "", _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];
};

/*UNIT ECHELON LAYER - NONE/FIRETEAM/PLATOON ETC, WHEN NONE NOT RENDERED*/
private _iconEchelon = _module getVariable ["iconEchelon", ""];
if (_iconEchelon isNotEqualTo "none") then {
	_iconEchelon = _fileSideName + _iconEchelon;
	APP6_markerArray pushBack [_iconEchelon, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, "", _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];
};

/*UNIT REDUCED/REINFORCED, WHEN NONE NOT RENDERED*/
if (_iconExtra isNotEqualTo 0) then {
	APP6_markerArray pushBack [_iconExtra, _markerName, _iconColour, _iconWidth, _iconHeight, _iconRotation, "", _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];
};

/*UNIT STATUS - NONE/DESTROYED/DAMAGED ETC, WHEN NONE NOT RENDERED*/
if (_iconStatus isNotEqualTo 0) then {
	APP6_markerArray pushBack [_iconStatus, _markerName, _iconStatusColour, _iconWidth, _iconHeight, _iconRotation, "", _iconTextShadow, _iconTextSize, _iconTextFont, _iconTextPosition];
};