/*
Draws each of the icons defined in APP6_markerArray on the spectator map.
Global 2D Array required to overcome parameters in a function->eventHandler
After closing the Spectator interface the display is lost hence the use of recursion
to reinitiate the Event Handler.

PARAMETERS:
	None	

RETURNS:
	NUMBER - 0: Successful execution
		   - -1: Failure to execute
*/

#include <DEFINE_MARKER_PARAMETERS.sqf>
#define DISPLAY_EXISTS !isNull (uiNamespace getVariable ["RscDisplayEGSpectator", displayNull])
#define SPECTATOR_MAP ((uiNamespace getVariable ["RscDisplayEGSpectator", displayNull]) displayCtrl 62609)

waitUntil {DISPLAY_EXISTS;};

SPECTATOR_MAP ctrlAddEventHandler ["Draw", {
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

waitUntil {!(DISPLAY_EXISTS)};
call APP6_fnc_drawImagesAsIconsInSpectator;