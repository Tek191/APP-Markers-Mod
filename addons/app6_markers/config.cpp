class CfgPatches {
    class APP6_Modules {
        units[] = {
            "APP6_Add_Custom_Icon",
            "APP6_Add_Icon",
            "APP6_Add_Unit_Icon"
        };
        weapons[] = {};
        requiredVersion = 2.10;
        requiredAddons[] = {};
        author = "Tek";
        authorUrl = "https://steamcommunity.com/id/tekb191/";
    };
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class APP6_Modules: NO_CATEGORY
	{
		displayName= "APP6";
	};
};

class CfgFunctions {
    class APP6 {
        class functions {
            file = "\APP6\functions";
            class addAPP6Briefing {};
			class main {postInit = 1;};
			class drawImagesAsIconsInBriefing {};
			class drawImagesAsIconsIngame {};
			class drawImagesAsIconsInGPS {};
			class drawImagesAsIconsInSpectator {};
			class drawImagesAsIconsInZeus {};
			class drawImagesAsIconsInTeamSwitch {};
			class drawImagesAsIconsInCamera {};
            class getSideColour {};
        };
        class Modules {
            class addCustomIconModule {
                description = "Add Custom Icon";
                file = "\APP6\modules\addCustomIconModule.sqf";
            };

            class addIconModule {
                description = "Add Icon";
                file = "\APP6\modules\addIconModule.sqf";
            };

            class addUnitIconModule {
                description = "Add Unit Icon";
                file = "\APP6\modules\addUnitIconModule.sqf";
            };
        };
    };
};

class CfgVehicles {
	class Logic;
	class Module_F: Logic {
        class Default;
        class ArgumentsBaseUnits {};
	};

    class APP6_Add_Custom_Icon : Module_F {
        scope = 2;
        displayName = "Add Custom Icon Module";
        author = "Tek";
        vehicleClass = "Modules";
        category = "APP6_Modules";
        function = "APP6_fnc_addCustomIconModule";
        functionPriority = 2;
        isGlobal = 2;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
            class fileInMissionFolder {
                displayName = "Is File within Mission Folder";
                description = "If true adds mission directory with trailing backslash to file name.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class fileName {
                displayName = "File Name";
                description = "File name with file directory.";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconColour { 
                displayName = "Icon Side";
                description = "Side name, changes colour of icon";
                typeName = "ARRAY";
                defaultValue = "[0.49, 0.88, 1, 1]";
                class values {
                    class BLUFOR {name = "BLUFOR"; value = [0.49, 0.88, 1, 1];};
                    class OPFOR {name = "OPFOR"; value = [1, 0.5, 0.5, 1];};
                    class GREENFOR {name = "GREENFOR"; value = [0.67, 1, 0.67, 1];};
                    class UNKNOWN {name = "UNKNOWN"; value = [1, 1, 0.5, 1];};
                };
            };
            class iconColourCustom {
                displayName = "Icon Side Custom (Optional)";
                description = "Overwrites Icon Side - [Red, Green, Blue, Alpha] where each value is 0-1 inclusively. Leave as [] otherwise.";
                typeName = "ARRAY";
                defaultValue = "[]";                
            };
            class iconVisibleBLUFOR {
                displayName = "Is the icon visible to BLUFOR?";
                description = "Changes visibility for BLUFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleOPFOR {
                displayName = "Is the icon visible to OPFOR?";
                description = "Changes visibility for OPFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleGREENFOR {
                displayName = "Is the icon visible to GREENFOR?";
                description = "Changes visibility for GREENFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleCIVFOR {
                displayName = "Is the icon visible to CIVFOR?";
                description = "Changes visibility for CIVFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class markerName {
                displayName = "Marker Name";
                description = "Variable name of the marker at which the icon will be drawn.";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconWidth {
                displayName = "Icon Width";
                description = "Width of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconHeight {
                displayName = "Icon Height";
                description = "Height of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconRotation {
                displayName = "Icon Rotation";
                description = "Rotation of the icon";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconText {
                displayName = "Icon Text";
                description = "Text next to icon";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconTextShadow {
                displayName = "Icon Text Shadow";
                description = "0 -> None, 1 -> Text Shadow, 2 -> Text Shadow and Icon Outline if icon rotation is 0";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconTextSize {
                displayName = "Icon Text Size";
                description = "Size of the text if text is used, recommend to keep at 0.03";
                typeName = "NUMBER";
                defaultValue = "0.03";
            };
            class iconTextFont {
                displayName = "Icon Text Font";
                description = "See Bohemia Interactive Wiki : FXY_File_Format#Available_Fonts";
                typeName = "STRING";
                defaultValue = "PuristaBold";
            };
            class iconTextPosition {
                displayName = "Icon Text Position";
                description = "Position of text with reference to icon -> ('left', 'center', 'right')";
                typeName = "STRING";
                defaultValue = "right";
            };
        };
    };

    //----------------------------------------MODULE BREAK---------------------------------------------

    class APP6_Add_Icon : Module_F {
        scope = 2;
        displayName = "Add Icon Module";
        author = "Tek";
        vehicleClass = "Modules";
        category = "APP6_Modules";
        function = "APP6_fnc_addIconModule";
        functionPriority = 2;
        isGlobal = 2;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
            class iconType {
                displayName = "Icon Type";
                description = "Type of Icon to render";
                typeName = "STRING";
                class values {
                    class AFP {
                        name =  "Attack By Fire";
                        value = "AFP.paa";
                    };
                    class Block {
                        name =  "Block";
                        value = "Block.paa";
                    };
                    class CATK {
                        name =  "Counterattack";
                        value = "CATK.paa";
                    };
                    class CBF {
                        name =  "Counterattack By Fire";
                        value = "CBF.paa";
                    };
                    class CCP {
                        name =  "Casualty Collection Point";
                        value = "CCP.paa";
                    };
                    class CP {
                        name =  "Checkpoint";
                        value = "CP.paa";
                    };
                    class CP1 {
                        name =  "Contact Point";
                        value = "CP1.paa";
                    };
                    class DS {
                        name =  "Destroy";
                        value = "DS.paa";
                    };
                    class DZ {
                        name =  "Drop Zone";
                        value = "DZ.paa";
                    };
                    class EZ {
                        name =  "Extraction Zone";
                        value = "EZ.paa";
                    };
                    class FD {
                        name =  "Friendly Ground Axis of Decisive Operations";
                        value = "FD.paa";
                    };
                    class FS {
                        name =  "Friendly Ground Axis of Shaping Operations";
                        value = "FH.paa";
                    };
                    class FIX {
                        name =  "Fix";
                        value = "FIX.paa";
                    };
                    class FUP {
                        name =  "Forming Up Position";
                        value = "FUP.paa";
                    };
                    class LU {
                        name =  "Linkup Point";
                        value = "LU.paa";
                    };
                    class LZ {
                        name =  "Landing Zone";
                        value = "LZ.paa";
                    };
                    class LOA {
                        name =  "Limit of Advance";
                        value = "LOA.paa";
                    };
                    class NT {
                        name =  "Neutralize";
                        value = "NT.paa";
                    };
                    class OP {
                        name =  "Observation Point";
                        value = "OP.paa";
                    };
                    class PN {
                        name =  "Penetration";
                        value = "PN.paa";
                    };
                    class POI {
                        name =  "Point of Interest";
                        value = "POI.paa";
                    };
                    class PP {
                        name =  "Passage Point";
                        value = "PP.paa";
                    };
                    class PZ {
                        name =  "Pickup Point";
                        value = "PZ.paa";
                    };
                    class RLY {
                        name =  "Rally Point";
                        value = "RLY.paa";
                    };
                    class RP {
                        name =  "Release Point";
                        value = "RP.paa";
                    };
                    class SFP {
                        name =  "Support By Fire";
                        value = "SFP.paa";
                    };
                    class SP {
                        name =  "Start Point";
                        value = "SP.paa";
                    };
                    class WP {
                        name =  "Way Point";
                        value = "WP.paa";
                    };
                };
            };
            class iconColourCustom {
                displayName = "Icon Custom (Optional)";
                description = "Overwrites the default colour of Black - [Red, Green, Blue, Alpha] where each value is 0-1 inclusively. Leave as [] otherwise.";
                typeName = "ARRAY";
                defaultValue = "[]";                
            };
            class iconVisibleBLUFOR {
                displayName = "Is the icon visible to BLUFOR?";
                description = "Changes visibility for BLUFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleOPFOR {
                displayName = "Is the icon visible to OPFOR?";
                description = "Changes visibility for OPFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleGREENFOR {
                displayName = "Is the icon visible to GREENFOR?";
                description = "Changes visibility for GREENFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleCIVFOR {
                displayName = "Is the icon visible to CIVFOR?";
                description = "Changes visibility for CIVFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class markerName {
                displayName = "Marker Name";
                description = "Variable name of the marker to render on";
                typeName = "STRING";
                defaultValue = "";
            };

            class iconWidth {
                displayName = "Icon Width";
                description = "Width of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconHeight {

                displayName = "Icon Height";
                description = "Height of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconRotation {
                displayName = "Icon Rotation";
                description = "Rotation of the icon";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconText {
                displayName = "Icon Text";
                description = "Text next to icon";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconTextShadow {
                displayName = "Icon Text Shadow";
                description = "0 -> None, 1 -> Text Shadow, 2 -> Text Shadow and Icon Outline if icon rotation is 0";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconTextSize {
                displayName = "Icon Text Size";
                description = "Size of the text if text is used, recommend to keep at 0.03";
                typeName = "NUMBER";
                defaultValue = "0.03";
            };
            class iconTextFont {
                displayName = "Icon Text Font";
                description = "See Bohemia Interactive Wiki : FXY_File_Format#Available_Fonts";
                typeName = "STRING";
                defaultValue = "PuristaBold";
            };
            class iconTextPosition {
                displayName = "Icon Text Position";
                description = "Position of text with reference to icon -> ('left', 'center', 'right')";
                typeName = "STRING";
                defaultValue = "right";
            };
        };
    };

    //----------------------------------------MODULE BREAK---------------------------------------------

    class APP6_Add_Unit_Icon : Module_F {
        scope = 2;
        displayName = "Add Unit Icon Module";
        author = "Tek";
        vehicleClass = "Modules";
        category = "APP6_Modules";
        function = "APP6_fnc_addUnitIconModule";
        functionPriority = 2;
        isGlobal = 2;
        isTriggerActivated = 1;
        isDisposable = 1;
        is3DEN = 0;

        class Arguments {
            class iconSide { 
                displayName = "Icon Side";
                description = "Side of Icon to render";
                typeName = "NUMBER";
                class values {
                    class BLUFOR {
                        name =  "BLUFOR";
                        value = 0;
                    };
                    class OPFOR {
                        name =  "OPFOR";
                        value = 1;
                    };
                    class GREENFOR {
                        name =  "GREENFOR";
                        value = 2;
                    };
                };
            };
            class iconColourCustom {
                displayName = "Icon Side Custom (Optional)";
                description = "Overwrites the default colour of the Icon Side - [Red, Green, Blue, Alpha] where each value is 0-1 inclusively. Leave as [] otherwise.";
                typeName = "ARRAY";
                defaultValue = "[]";                
            };
            class iconType {
                displayName = "Icon Type";
                description = "The type of element.";
                typeName = "STRING";
                class values {
                    class NONE {
                        name = "NONE";
                        value = "none";
                    };
                    class AIR_DEFENSE {
                        name =  "AIR DEFENSE";
                        value = "airdefense.paa";    
                    };
                    class ARTILLERY {
                        name =  "ARTILLERY";
                        value = "artillery.paa";    
                    };
                    class ARMOUR {
                        name =  "ARMOUR";
                        value = "armour.paa";
                    };
                    class FIXED_WING {
                        name =  "FIXED WING";
                        value = "fixedwing.paa";
                    };
                    class INFANTRY {
                        name =  "INFANTRY";
                        value = "infantry.paa";
                    };
                    class MECHANIZED_INFANTRY {
                        name =  "MECHANIZED INFANTRY";
                        value = "mechanized.paa";
                    };
                    class MOTORIZED_INFANTRY {
                        name =  "MOTORIZED INFANTRY";
                        value = "motorized.paa";
                    };
                    class MORTAR {
                        name =  "MORTAR";
                        value = "mortar.paa";    
                    };
                    class RECON {
                        name =  "RECON";
                        value = "recon.paa";    
                    };
                    class ROTARY_WING {
                        name =  "ROTARY WING";
                        value = "rotarywing.paa";
                    };
                };
            };
            class iconEchelon {
                displayName = "Icon Echelon";
                description = "Echelon of Icon to render";
                typeName = "STRING";
                class values {
                    class NONE {
                        name =  "NONE";
                        value = "none";
                    };
                    class FIRETEAM {
                        name =  "FIRETEAM";
                        value = "fireteam";
                    };
                    class SQUAD {
                        name =  "SQUAD";
                        value = "squad";
                    };
                    class SECTION {
                        name =  "SECTION";
                        value = "section";
                    };
                    class PLATOON {
                        name =  "PLATOON";
                        value = "platoon";
                    };
                    class COMPANY {
                        name =  "COMPANY";
                        value = "company";
                    };
                    class BATTALION {
                        name =  "BATTALION";
                        value = "battalion";
                    };
                };
            };
            class iconExtra {
                displayName = "Reinforced/Reduced";
                description = "Is the unit reinforced, reduced or both?";
                typeName = "NUMBER";
                class values {
                    class NONE {
                        name = "NONE";
                        value = 0;
                    };
                    class REDUCED {
                        name = "REDUCED";
                        value = 1;
                    };
                    class REINFORCED {
                        name = "REINFORCED";
                        value = 2;
                    };
                    class BOTH {
                        name = "BOTH";
                        value = 3;
                    };
                };
            };
            class iconStatus {
                displayName = "Status";
                description = "What is the unit status?";
                typeName = "NUMBER";
                class values {
                    class PRESENT {
                        name = "PRESENT/NONE";
                        value = 0;
                    };
                    class FULLYCAPABLE {
                        name = "FULLY CAPABLE";
                        value = 1;
                    };
                    class DAMAGED {
                        name = "DAMAGED";
                        value = 2;
                    };
                    class DESTROYED {
                        name = "DESTROYED";
                        value = 3;
                    };
                    class FULLTOCAPACITY {
                        name = "FULL TO CAPACITY";
                        value = 4;
                    };
                };
            };
            class iconSuspected {
                displayName = "Is the unit suspected/assumed?";
                description = "Changes status to suspected/assumed.";
                typeName = "BOOL";
                defaultValue = "false";
            };
            class iconVisibleBLUFOR {
                displayName = "Is the icon visible to BLUFOR?";
                description = "Changes visibility for BLUFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleOPFOR {
                displayName = "Is the icon visible to OPFOR?";
                description = "Changes visibility for OPFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleGREENFOR {
                displayName = "Is the icon visible to GREENFOR?";
                description = "Changes visibility for GREENFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class iconVisibleCIVFOR {
                displayName = "Is the icon visible to CIVFOR?";
                description = "Changes visibility for CIVFOR.";
                typeName = "BOOL";
                defaultValue = "true";
            };
            class markerName {
                displayName = "Marker Name";
                description = "Variable name of the marker to render on";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconWidth {
                displayName = "Icon Width";
                description = "Width of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconHeight {

                displayName = "Icon Height";
                description = "Height of the icon";
                typeName = "NUMBER";
                defaultValue = "100";
            };
            class iconRotation {
                displayName = "Icon Rotation";
                description = "Rotation of the icon";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconText {
                displayName = "Icon Text";
                description = "Text next to icon";
                typeName = "STRING";
                defaultValue = "";
            };
            class iconTextShadow {
                displayName = "Icon Text Shadow";
                description = "0 -> None, 1 -> Text Shadow, 2 -> Text Shadow and Icon Outline if icon rotation is 0";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class iconTextSize {
                displayName = "Icon Text Size";
                description = "Size of the text if text is used, recommend to keep at 0.03";
                typeName = "NUMBER";
                defaultValue = "0.03";
            };
            class iconTextFont {
                displayName = "Icon Text Font";
                description = "See Bohemia Interactive Wiki : FXY_File_Format#Available_Fonts";
                typeName = "STRING";
                defaultValue = "PuristaBold";
            };
            class iconTextPosition {
                displayName = "Icon Text Position";
                description = "Position of text with reference to icon -> ('left', 'center', 'right')";
                typeName = "STRING";
                defaultValue = "right";
            };
        };
    };
};