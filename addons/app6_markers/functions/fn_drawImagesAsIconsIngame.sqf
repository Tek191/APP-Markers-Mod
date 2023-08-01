/*
Draws each of the icons defined in APP6_markerArray to the map past the initial briefing.
Global 2D Array required to overcome parameters in a function->eventHandler

PARAMETERS:
	None	

RETURNS:
	NUMBER - 0: Successful execution
		   - -1: Failure to execute
*/

#include <DEFINE_MARKER_PARAMETERS.sqf>
#define DISPLAY_EXISTS !isNull (findDisplay 12)
#define INGAME_MAP (findDisplay 12 displayCtrl 51) 

waitUntil {DISPLAY_EXISTS;};

INGAME_MAP ctrlAddEventHandler ["Draw", {
	if (APP6_showMarkers) then {
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
	};
}];