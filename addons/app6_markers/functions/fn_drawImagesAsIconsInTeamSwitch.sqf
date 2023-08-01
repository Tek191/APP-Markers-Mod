/*
Draws each of the icons defined in APP6_markerArray on the team switch map.
Global 2D Array required to overcome parameters in a function->eventHandler
After closing the Team Switch interface the display is lost hence the use of recursion
to reinitiate the Event Handler.

PARAMETERS:
	None	

RETURNS:
	NUMBER - 0: Successful execution
		   - -1: Failure to execute
*/

#include <DEFINE_MARKER_PARAMETERS.sqf>
#define DISPLAY_EXISTS !isNull (findDisplay 632)
#define TEAMSWITCH_MAP (findDisplay 632 displayCtrl 561) 

waitUntil {DISPLAY_EXISTS;};

TEAMSWITCH_MAP ctrlAddEventHandler ["Draw", {
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

waitUntil {!(DISPLAY_EXISTS)};
call APP6_fnc_drawImagesAsIconsInTeamSwitch;