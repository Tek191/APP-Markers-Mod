/*
Draws each of the icons defined in APP6_markerArray to the map during the initial briefing.
In Singleplayer the IDD differs from a self hosted server and when playing on a dedicated server.
Global 2D Array required to overcome parameters in a function->eventHandler

PARAMETERS:
	None	

RETURNS:
	NUMBER - 0: Successful execution
		   - -1: Failure to execute
*/	

#include <DEFINE_MARKER_PARAMETERS.sqf>
#define BRIEFING_EXISTS !isNull (findDisplay _displayIDD)
#define BRIEFING_MAP (findDisplay _displayIDD displayCtrl 51) 

private _displayIDD = 0;
if (!isMultiplayer) then {
	_displayIDD = 37;
}
else {
	if (isServer) then {_displayIDD = 52;} else {_displayIDD = 53;};
};

waitUntil {BRIEFING_EXISTS;};

BRIEFING_MAP ctrlAddEventHandler ["Draw", {
	{
		(_this # 0) drawIcon [
			MARKER_DIRECTORY,
			MARKER_COLOUR, 
			MARKER_POSITION,
			MARKER_SIZE_X,
			MARKER_SIZE_Y,
			MARKER_ROTATION, 
			MARKER_TEXT, 
			MARKER_TEXT_SHADOW,
			MARKER_TEXT_SIZE, 
			MARKER_TEXT_FONT, 
			MARKER_TEXT_POSITION];
	} forEach APP6_markerArray;
}];