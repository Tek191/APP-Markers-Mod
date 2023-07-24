/*
Gets RGBA values for BLUFOR/REDFOR/GREENFOR/UNKNOWN

PARAMETERS:
	STRING _sideName - Any of the defined ways to name a side

RETURNS:
	ARRAY<NUMBER> - [RGBA] if successful
	NUMBER -1 - if unsuccessful
*/

params ["_sideName"];

#define F _blufor
#define H _opfor
#define N _greenfor
#define U _unknown

_sideName = toLower _sideName;
private _blufor = [0.49, 0.88, 1, 1];
private _opfor = [1, 0.5, 0.5, 1];
private _greenfor = [0.67, 1, 0.67, 1];
private _unknown = [1, 1, 0.5, 1];

private _sideMap = createHashMapFromArray [
												["blufor", F], ["nato", F], ["west", F], ["friend", F],
												["opfor", H], ["redfor", H], ["op4", H], ["east", H], ["hostile", H],
												["resistance", N], ["greenfor", N], ["independent", N], ["neutral", N],
												["unknown", U]
											];

_sideMap getOrDefault [_sideName, -1];