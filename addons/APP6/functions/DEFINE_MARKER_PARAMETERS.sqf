#define MARKER_DIRECTORY _x select 0
#define MARKER_SIZE_X (_x select 3) / (6.4 * worldSize / 8192 * ctrlMapScale (_this select 0))
#define MARKER_SIZE_Y (_x select 4) / (6.4 * worldSize / 8192 * ctrlMapScale (_this select 0))
#define MARKER_POSITION getMarkerPos (_x select 1)
#define MARKER_COLOUR _x select 2
#define MARKER_ROTATION _x select 5
#define MARKER_TEXT _x select 6
#define MARKER_TEXT_SHADOW _x select 7
#define MARKER_TEXT_SIZE _x select 8
#define MARKER_TEXT_FONT _x select 9
#define MARKER_TEXT_POSITION _x select 10