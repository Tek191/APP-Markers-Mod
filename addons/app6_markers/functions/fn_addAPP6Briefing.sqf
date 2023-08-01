/*
Adds briefing to allow player to toggle markers.
*/

player createDiarySubject ["APP6Markers","APP6 Markers"];

player createDiaryRecord ["APP6Markers", ["Toggle Markers", "
<execute expression='APP6_showMarkers = !APP6_showMarkers;'>Toggle Showing/Hiding Markers</execute>
"]];