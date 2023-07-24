/*
Does not run on dedicated server or headless client.
Adds Event Handlers to manage:
-Briefing map
-Ingame map
-Zeus map (see fn_mainPostBriefing)
-Spectator map (see fn_mainPostBriefing)
-Team Switch map (see fn_mainPostBriefing)

PARAMETERS:
	None	

RETURNS:
	None
*/

#define NO_DEFINED_MARKERS count APP6_markerArray isEqualTo 0

if (!hasInterface) exitWith {};

/*
APP6_markerArray <ELEMENT:ARRAY>
0  FILE NAME 		   - File name with file directory
1  MARKER NAME 	       - Marker name of marker used ingame
2  ICON COLOUR		   - RGBA
3  ICON WIDTH	       - Size in meters
4  ICON HEIGHT 	       - Size in meters
5  ICON ROTATION       - 0 -> Upright, any other value rotates the image [0, 360]
6  ICON TEXT 		   - Text to be overlayed with icon
7  ICON TEXT SHADOW	   - 0 -> None, 1 -> Text Shadow, 2 -> Text Shadow and Icon Outline if ICON_ROTATION is 0
8  ICON TEXT SIZE 	   - Recommend 0.03
9  ICON TEXT FONT 	   - https://community.bistudio.com/wiki/FXY_File_Format#Available_Fonts
10 ICON TEXT POSITION  - Position of text with reference to icon -> ("left", "center", "right")
*/
APP6_markerArray = [];

call APP6_fnc_drawImagesAsIconsInBriefing;

[] spawn {
	call APP6_fnc_drawImagesAsIconsIngame;
	call APP6_fnc_drawImagesAsIconsInGPS;
	[] spawn {call APP6_fnc_drawImagesAsIconsInSpectator;};  
	[] spawn {call APP6_fnc_drawImagesAsIconsInZeus;};       
	[] spawn {call APP6_fnc_drawImagesAsIconsInTeamSwitch;}; 
	[] spawn {call APP6_fnc_drawImagesAsIconsInCamera;};     
}; //SPAWN REQUIRED FOR DISPLAYS TO EXIST