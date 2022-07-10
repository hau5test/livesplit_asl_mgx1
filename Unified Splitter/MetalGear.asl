/*********************************************************/
/* Metal Gear (PC/PS2) Autosplitter v1                  */
/*                                                       */
/* Emulator Compatibility:                               */
/*  * PCXS2                                              */
/*                                                       */
/* Game Compatibility:                                   */
/*  * Metal Gear PC                                      */
/*  * Metal Gear PS2 PAL                                 */
/*  * Metal Gear PS2 NTSC-U Subsistence Release          */
/*  * Metal Gear PS2 NTSC-J Subsistence Release          */
/*  * Metal Gear PS2 NTSC-J 20th Anniversary Disc        */
/*                                                       */
/* Created by Hau5test for Metal Gear Solid Speedrunners */
/*                                                       */
/* Thanks to BMN, NickRPGreen for their input and advice */
/*********************************************************/
state("MetalGear") {
	// timers
	uint GameTime:				0x5C698;
	uint BSGameTimeSeconds: 	0x60160;
    uint BSGameTimeMinutes: 	0x6015C;
	// variables for state and map location
	uint MainMenuState:			0x113B8, 0x72C;
    uint BSState: 				0x6016C;
	uint FloorVal: 				0x60118;
	uint ScreenVal:				0x5B584;
	uint SubFloorVal: 			0x5F09C;
	uint AlertCountdown: 		0x60120;
	// snake relevant values
	uint ClassValue: 			0x5C53C;
	uint TotalPOWsaved: 		0x5C5DC;
    uint Saves: 				0x5C6AC;
	uint Health: 				0x5C52C;
	int SnakeXAxisNG:			0x5F3D8, 0x0, 0x1C;
	int SnakeFeetYAxisNG:		0x5F3D8, 0x0, 0x1CC;
	int SnakeHeadYAxisNG:		0x5F3D8, 0x0, 0x1CC;
	int SnakeXAxisNGP:			0x62540, 0x0, 0x178;
	int SnakeFeetYAxisNGP:		0x62568, 0x0, 0x48;
	int SnakeHeadYAxisNGP:		0x62544, 0x0, 0x1CC;
	// score screen
	uint Continues: 			0x5C6B0;
	uint ContPerCheckpoint: 	0x5ED90;
	uint Alerts: 				0x5C6A4;
	uint Kills: 				0x5C6A0;
	uint Rations: 				0x5C69C;
	// inventory values
	uint RationsHeld: 			0x5C5C8;
	uint PlasticExplosives: 	0x5C680;
	uint Mines: 				0x5C67C;
	uint RemoteMissiles: 		0x5C684;
	uint RocketLauncherAmmo: 	0x5C690;
	uint GrenadeLauncherAmmo:	0x5C694;
	uint SMGAmmo: 				0x5C68C;
	uint PistolAmmo: 			0x5C688;
	// menu pointer position
	uint EquipmentPointX:		0x9DC510;
	uint EquipmentPointY:		0x9DC51C;
	uint WeaponPointX:			0x9DC520;
	uint WeaponPointY:			0x9DC514;
	// inventory slots
	uint InventorySlot11:		0x9DC548;
	uint InventorySlot12:		0x9DC54C;
	uint InventorySlot13:		0x9DC550;
	uint InventorySlot14:		0x9DC554;
	uint InventorySlot15:		0x9DC558;
	uint InventorySlot21:		0x9DC55C;
	uint InventorySlot22:		0x9DC560;
	uint InventorySlot23:		0x9DC564;
	uint InventorySlot24:		0x9DC568;
	uint InventorySlot25:		0x9DC56C;
	uint InventorySlot31:		0x9DC570;
	uint InventorySlot32:		0x9DC574;
	uint InventorySlot33:		0x9DC578;
	uint InventorySlot34:		0x9DC57C;
	uint InventorySlot35:		0x9DC580;
	uint InventorySlot41:		0x9DC584;
	uint InventorySlot42:		0x9DC588;
	uint InventorySlot43:		0x9DC58C;
	uint InventorySlot44:		0x9DC590;
	uint InventorySlot45:		0x9DC594;
	uint InventorySlot51:		0x9DC598;
	uint InventorySlot52:		0x9DC59C;
	uint InventorySlot53:		0x9DC5A0;
	uint InventorySlot54:		0x9DC5A4;
	uint InventorySlot55:		0x9DC5A8;
}

state("pcsx2") {
	// either PAL or NTSC
	string4 region: 0x2C797B9;

	//SLPM, SLES, SLUS
	string4 regCode: 0x2C79798;

	//disc numer
	// 662.21 - NTSC-J Subsistence release
	// 667.95 - NTSC-J 20th anniversary release
	// 212.43 - NTSC-U Subsistence release
	// 820.43 - PAL Subsistence release
	string6 discNumber: 0x2C7979D;

	// separate addresses for each version, with a version prefix

	// JP 20th Anniversary
	// timers
	uint J20A_GameTime: 			0x123E184, 0x9F0;
	uint J20A_BSGameTimeSeconds:	0x123E188, 0xC0;
	uint J20A_BSGameTimeMinutes:	0x123E188, 0xBC;
	// variables for state and map location
	uint J20A_MainMenuState:		0x123E188, 0x70C;
	uint J20A_BSState: 				0x123E188, 0xCC;
	uint J20A_FloorVal: 			0x123E188, 0x78;
	uint J20A_ScreenVal:			0x123E188, 0x2F4;
	uint J20A_SubFloorVal: 			0x11E540C, 0x684;
	uint J20A_AlertCountdown: 		0x123E188, 0x80;
	// snake relevant values
	uint J20A_ClassValue: 			0x123E184, 0x894;
	uint J20A_TotalPOWsaved: 		0x123E184, 0x934;
	uint J20A_Health: 				0x123E184, 0x884;
	int J20A_SnakeXAxisNG:			0x12427FC, 0xE48;
	int J20A_SnakeFeetYAxisNG:		0x12427FC, 0xD80;
	int J20A_SnakeHeadYAxisNG:		0x12427FC, 0xE48;
	int J20A_SnakeXAxisNGP:			0x12427FC, 0xF28;
	int J20A_SnakeFeetYAxisNGP:		0x12427FC, 0xE60;
	int J20A_SnakeHeadYAxisNGP:		0x12427FC, 0xF78;
	// score screen
    uint J20A_Saves: 				0x123E184, 0xA04;
	uint J20A_Continues: 			0x123E184, 0xA08;
	uint J20A_ContPerCheckpoint: 	0x123E184, 0xBD0;
	uint J20A_Alerts: 				0x123E184, 0x9FC;
	uint J20A_Kills: 				0x123E184, 0x9F8;
	uint J20A_Rations: 				0x123E184, 0x9F4;
	// inventory values
	uint J20A_RationsHeld: 			0x123E184, 0x920;
	uint J20A_PlasticExplosives: 	0x123E184, 0x9D8;
	uint J20A_Mines: 				0x123E184, 0x9D4;
	uint J20A_RemoteMissiles: 		0x123E184, 0x9DC;
	uint J20A_RocketLauncherAmmo: 	0x123E184, 0x9E8;
	uint J20A_GrenadeLauncherAmmo: 	0x123E184, 0x9EC;
	uint J20A_SMGAmmo: 				0x123E184, 0x9E4;
	uint J20A_PistolAmmo: 			0x123E184, 0x9E0;
	// menu pointer position
	uint J20A_EquipmentPointX:		0x123E184, 0x868;
	uint J20A_EquipmentPointY:		0x123E184, 0x874;
	uint J20A_WeaponPointX:			0x123E184, 0x86C;
	uint J20A_WeaponPointY:			0x123E184, 0x878;
	// inventory slots
	uint J20A_InventorySlot11:		0x123E184, 0x8A0;
	uint J20A_InventorySlot12:		0x123E184, 0x8A4;
	uint J20A_InventorySlot13:		0x123E184, 0x8A8;
	uint J20A_InventorySlot14:		0x123E184, 0x8AC;
	uint J20A_InventorySlot15:		0x123E184, 0x8B0;
	uint J20A_InventorySlot21:		0x123E184, 0x8B4;
	uint J20A_InventorySlot22:		0x123E184, 0x8B8;
	uint J20A_InventorySlot23:		0x123E184, 0x8BC;
	uint J20A_InventorySlot24:		0x123E184, 0x8C0;
	uint J20A_InventorySlot25:		0x123E184, 0x8C4;
	uint J20A_InventorySlot31:		0x123E184, 0x8C8;
	uint J20A_InventorySlot32:		0x123E184, 0x8CC;
	uint J20A_InventorySlot33:		0x123E184, 0x8D0;
	uint J20A_InventorySlot34:		0x123E184, 0x8D4;
	uint J20A_InventorySlot35:		0x123E184, 0x8D8;
	uint J20A_InventorySlot41:		0x123E184, 0x8DC;
	uint J20A_InventorySlot42:		0x123E184, 0x8E0;
	uint J20A_InventorySlot43:		0x123E184, 0x8E4;
	uint J20A_InventorySlot44:		0x123E184, 0x8E8;
	uint J20A_InventorySlot45:		0x123E184, 0x8EC;
	uint J20A_InventorySlot51:		0x123E184, 0x8F0;
	uint J20A_InventorySlot52:		0x123E184, 0x8F4;
	uint J20A_InventorySlot53:		0x123E184, 0x8F8;
	uint J20A_InventorySlot54:		0x123E184, 0x8FC;
	uint J20A_InventorySlot55:		0x123E184, 0x900;

    // JP Subsistence
	// timers
	uint JSub_GameTime: 			0x123E184, 0xA70;
	uint JSub_BSGameTimeSeconds:	0x123E188, 0x140;
	uint JSub_BSGameTimeMinutes:	0x123E188, 0x13C;
	// variables for state and map location
	uint JSub_MainMenuState:		0x123E188, 0x78C;
	uint JSub_BSState: 				0x123E188, 0x14C;
	uint JSub_FloorVal: 			0x123E188, 0x370;
	uint JSub_ScreenVal:			0x123E188, 0xCBC;
	uint JSub_SubFloorVal: 			0x123EB00, 0x784;
	uint JSub_AlertCountdown: 		0x123E188, 0x100;
	// snake relevant values
	uint JSub_ClassValue: 			0x123E184, 0x914;
	uint JSub_TotalPOWsaved: 		0x123E184, 0x9B4;
	uint JSub_Health: 				0x123E184, 0x904;
	int JSub_SnakeXAxisNG:			0x12427FC, 0xE48;
	int JSub_SnakeFeetYAxisNG:		0x12427FC, 0xD80;
	int JSub_SnakeHeadYAxisNG:		0x12427FC, 0xE98;
	int JSub_SnakeXAxisNGP:			0x12427FC, 0xF28;
	int JSub_SnakeFeetYAxisNGP:		0x12427FC, 0xE60;
	int JSub_SnakeHeadYAxisNGP:		0x12427FC, 0xF78;
	// score screen
    uint JSub_Saves: 				0x123E184, 0xA84;
	uint JSub_Continues: 			0x123E184, 0xA88;
	uint JSub_ContPerCheckpoint: 	0x123E184, 0xC50;
	uint JSub_Alerts: 				0x123E184, 0xA7C;
	uint JSub_Kills: 				0x123E184, 0xA78;
	uint JSub_Rations: 				0x123E184, 0xA74;
	// inventory values
	uint JSub_RationsHeld: 			0x123E184, 0x9A0;
	uint JSub_PlasticExplosives: 	0x123E184, 0xA58;
	uint JSub_Mines: 				0x123E184, 0xA54;
	uint JSub_RemoteMissiles: 		0x123E184, 0xA5C;
	uint JSub_RocketLauncherAmmo: 	0x123E184, 0xA68;
	uint JSub_GrenadeLauncherAmmo: 	0x123E184, 0xA6C;
	uint JSub_SMGAmmo: 				0x123E184, 0xA64;
	uint JSub_PistolAmmo: 			0x123E184, 0xA60;
	// menu pointer position
	uint JSub_EquipmentPointX:		0x123E184, 0x8E8;
	uint JSub_EquipmentPointY:		0x123E184, 0x8F4;
	uint JSub_WeaponPointX:			0x123E184, 0x8EC;
	uint JSub_WeaponPointY:			0x123E184, 0x8F8;
	// inventory slots
	uint JSub_InventorySlot11:		0x123E184, 0x920;
	uint JSub_InventorySlot12:		0x123E184, 0x924;
	uint JSub_InventorySlot13:		0x123E184, 0x928;
	uint JSub_InventorySlot14:		0x123E184, 0x92C;
	uint JSub_InventorySlot15:		0x123E184, 0x930;
	uint JSub_InventorySlot21:		0x123E184, 0x934;
	uint JSub_InventorySlot22:		0x123E184, 0x938;
	uint JSub_InventorySlot23:		0x123E184, 0x93C;
	uint JSub_InventorySlot24:		0x123E184, 0x940;
	uint JSub_InventorySlot25:		0x123E184, 0x944;
	uint JSub_InventorySlot31:		0x123E184, 0x948;
	uint JSub_InventorySlot32:		0x123E184, 0x94C;
	uint JSub_InventorySlot33:		0x123E184, 0x950;
	uint JSub_InventorySlot34:		0x123E184, 0x954;
	uint JSub_InventorySlot35:		0x123E184, 0x958;
	uint JSub_InventorySlot41:		0x123E184, 0x95C;
	uint JSub_InventorySlot42:		0x123E184, 0x960;
	uint JSub_InventorySlot43:		0x123E184, 0x964;
	uint JSub_InventorySlot44:		0x123E184, 0x968;
	uint JSub_InventorySlot45:		0x123E184, 0x96C;
	uint JSub_InventorySlot51:		0x123E184, 0x970;
	uint JSub_InventorySlot52:		0x123E184, 0x974;
	uint JSub_InventorySlot53:		0x123E184, 0x978;
	uint JSub_InventorySlot54:		0x123E184, 0x97C;
	uint JSub_InventorySlot55:		0x123E184, 0x980;

	// US
	// timers
	uint US_GameTime: 				0x123E188, 0x388;
	uint US_BSGameTimeSeconds:		0x123EB08, 0xC04;
	uint US_BSGameTimeMinutes:		0x123E188, 0xA10;
	// variables for state and map location
	uint US_MainMenuState:			0x123E18C, 0xA4;
	uint US_BSState: 				0x123E188, 0xA64;
	uint US_FloorVal: 				0x123E188, 0xA10;
	uint US_ScreenVal:				0x123E188, 0xCBC;
	uint US_SubFloorVal: 			0x123EB08, 0xC04;
	uint US_AlertCountdown: 		0x123E188, 0xA18;
	// snake relevant values
	uint US_ClassValue: 			0x123E188, 0x22C;
	uint US_TotalPOWsaved: 			0x123E188, 0x2CC;
	uint US_Health: 				0x123E188, 0x21C;
	int US_SnakeXAxisNG:			0x1243364, 0x5FC;
	int US_SnakeFeetYAxisNG:		0x1243364, 0x534;
	int US_SnakeHeadYAxisNG:		0x1243364, 0x64C;
	int US_SnakeXAxisNGP:			0x1243364, 0x6B4;
	int US_SnakeFeetYAxisNGP:		0x1243364, 0x5EC;
	int US_SnakeHeadYAxisNGP:		0x1243364, 0x704;
	// score screen
    uint US_Saves: 					0x123E188, 0x39C;
	uint US_Continues: 				0x123E188, 0x3A0;
	uint US_ContPerCheckpoint: 		0x123E188, 0x568;
	uint US_Alerts: 				0x123E188, 0x394;
	uint US_Kills: 					0x123E188, 0x390;
	uint US_Rations: 				0x123E188, 0x38C;
	// inventory values
	uint US_RationsHeld: 			0x123E188, 0x2B8;
	uint US_PlasticExplosives: 		0x123E188, 0x370;
	uint US_Mines: 					0x123E188, 0x36C;
	uint US_RemoteMissiles: 		0x123E188, 0x374;
	uint US_RocketLauncherAmmo: 	0x123E188, 0x380;
	uint US_GrenadeLauncherAmmo: 	0x123E188, 0x384;
	uint US_SMGAmmo: 				0x123E188, 0x37C;
	uint US_PistolAmmo: 			0x123E188, 0x378;
	// menu pointer position    0x00000;
	uint US_EquipmentPointX:		0x123E188, 0x200;
	uint US_EquipmentPointY:		0x123E188, 0x20C;
	uint US_WeaponPointX:			0x123E188, 0x204;
	uint US_WeaponPointY:			0x123E188, 0x210;
	// inventory slots
	uint US_InventorySlot11:		0x123E188, 0x238;
	uint US_InventorySlot12:		0x123E188, 0x23C;
	uint US_InventorySlot13:		0x123E188, 0x240;
	uint US_InventorySlot14:		0x123E188, 0x244;
	uint US_InventorySlot15:		0x123E188, 0x248;
	uint US_InventorySlot21:		0x123E188, 0x24C;
	uint US_InventorySlot22:		0x123E188, 0x250;
	uint US_InventorySlot23:		0x123E188, 0x254;
	uint US_InventorySlot24:		0x123E188, 0x258;
	uint US_InventorySlot25:		0x123E188, 0x25C;
	uint US_InventorySlot31:		0x123E188, 0x260;
	uint US_InventorySlot32:		0x123E188, 0x264;
	uint US_InventorySlot33:		0x123E188, 0x268;
	uint US_InventorySlot34:		0x123E188, 0x26C;
	uint US_InventorySlot35:		0x123E188, 0x270;
	uint US_InventorySlot41:		0x123E188, 0x274;
	uint US_InventorySlot42:		0x123E188, 0x278;
	uint US_InventorySlot43:		0x123E188, 0x27C;
	uint US_InventorySlot44:		0x123E188, 0x280;
	uint US_InventorySlot45:		0x123E188, 0x284;
	uint US_InventorySlot51:		0x123E188, 0x288;
	uint US_InventorySlot52:		0x123E188, 0x28C;
	uint US_InventorySlot53:		0x123E188, 0x290;
	uint US_InventorySlot54:		0x123E188, 0x294;
	uint US_InventorySlot55:		0x123E188, 0x298;

    // EU
	// timers
    uint EU_GameTime: 				0x123E194, 0xC0;
	uint EU_BSGameTimeSeconds:		0x123E194, 0x790;
	uint EU_BSGameTimeMinutes:		0x123E194, 0x78C;
	// variables for state and map location
	uint EU_MainMenuState:			0x123E194, 0xDDC;
	uint EU_BSState: 				0x123E194, 0x79C;
	uint EU_FloorVal: 				0x123E194, 0x9C0;
	uint EU_ScreenVal:				0x123E194, 0x9C4;
	uint EU_SubFloorVal: 			0x123EB14, 0xA84;
	uint EU_AlertCountdown: 		0x123E194, 0x750;
	// snake relevant values
	uint EU_ClassValue: 			0x123E190, 0xF64;
	uint EU_TotalPOWsaved: 			0x123E194, 0x4;
	uint EU_Health: 				0x123E190, 0xF54;
	int EU_SnakeXAxisNG:			0x1243368, 0xFE4;
	int EU_SnakeFeetYAxisNG:		0x1243368, 0xF1C;
	int EU_SnakeHeadYAxisNG:		0x124336C, 0x34;
	int EU_SnakeXAxisNGP:			0x124336C, 0x88;
	int EU_SnakeFeetYAxisNGP:		0x1243368, 0xFC0;
	int EU_SnakeHeadYAxisNGP:		0x124336C, 0xD8;
	// score screen
    uint EU_Saves: 					0x123E194, 0xD4;
	uint EU_Continues: 				0x123E194, 0xD8;
	uint EU_ContPerCheckpoint: 		0x123E194, 0x2A0;
	uint EU_Alerts: 				0x123E194, 0xCC;
	uint EU_Kills: 					0x123E194, 0xC8;
	uint EU_Rations: 				0x123E194, 0xC4;
	// inventory values
	uint EU_RationsHeld: 			0x123E190, 0xFF0;
	uint EU_PlasticExplosives: 		0x123E194, 0xA8;
	uint EU_Mines: 					0x123E194, 0xA4;
	uint EU_RemoteMissiles: 		0x123E194, 0xAC;
	uint EU_RocketLauncherAmmo: 	0x123E194, 0xB8;
	uint EU_GrenadeLauncherAmmo: 	0x123E194, 0xBC;
	uint EU_SMGAmmo: 				0x123E194, 0xB4;
	uint EU_PistolAmmo: 			0x123E194, 0xB0;
	// menu pointer position
	uint EU_EquipmentPointX:		0x123E190, 0xF38;
	uint EU_EquipmentPointY:		0x123E190, 0xF44;
	uint EU_WeaponPointX:			0x123E190, 0xF3C;
	uint EU_WeaponPointY:			0x123E190, 0xF48;
	// inventory slots
	uint EU_InventorySlot11:		0x123E190, 0xF70;
	uint EU_InventorySlot12:		0x123E190, 0xF74;
	uint EU_InventorySlot13:		0x123E190, 0xF78;
	uint EU_InventorySlot14:		0x123E190, 0xF7C;
	uint EU_InventorySlot15:		0x123E190, 0xF80;
	uint EU_InventorySlot21:		0x123E190, 0xF84;
	uint EU_InventorySlot22:		0x123E190, 0xF88;
	uint EU_InventorySlot23:		0x123E190, 0xF8C;
	uint EU_InventorySlot24:		0x123E190, 0xF90;
	uint EU_InventorySlot25:		0x123E190, 0xF94;
	uint EU_InventorySlot31:		0x123E190, 0xF98;
	uint EU_InventorySlot32:		0x123E190, 0xF9C;
	uint EU_InventorySlot33:		0x123E190, 0xFA0;
	uint EU_InventorySlot34:		0x123E190, 0xFA4;
	uint EU_InventorySlot35:		0x123E190, 0xFA8;
	uint EU_InventorySlot41:		0x123E190, 0xFAC;
	uint EU_InventorySlot42:		0x123E190, 0xFB0;
	uint EU_InventorySlot43:		0x123E190, 0xFB4;
	uint EU_InventorySlot44:		0x123E190, 0xFB8;
	uint EU_InventorySlot45:		0x123E190, 0xFBC;
	uint EU_InventorySlot51:		0x123E190, 0xFC0;
	uint EU_InventorySlot52:		0x123E190, 0xFC4;
	uint EU_InventorySlot53:		0x123E190, 0xFC8;
	uint EU_InventorySlot54:		0x123E190, 0xFCC;
	uint EU_InventorySlot55:		0x123E190, 0xFD0;
}

startup {
	vars.D = new ExpandoObject();
	var D = vars.D;
	D.Vars = new ExpandoObject(); // Splitter-specific variables
	D.Names = new ExpandoObject(); // Sets of friendly names

	D.Names.Location = new Dictionary<string, string>() {
		{ "0",  "Docks" },
		{ "1",  "B1 - Ground Floor" },
		{ "2",  "B1 - First Floor" },
		{ "3",  "B1 - Second Floor" },
		{ "4",  "B1 - Underground" },
		{ "5",  "Desert 1" },
		{ "6",  "B1 - Elevator" },
		{ "7",  "B1 - Roof" },
		{ "8",  "B2 - Ground Floor" },
		{ "9",  "B2 - First Floor" },
		{ "10",  "B2 - Underground" },
		{ "11",  "Desert 2" },
		{ "12",  "B2 - Elevator" },
		{ "13",  "B2 - Hellroof" },
		{ "14",  "B3 - Ground Floor" },
		{ "15",  "B3 - Underground" },
		{ "16",  "B2 - Elevator" },
		{ "17",  "B3 - Escape" }
	};

	D.Names.SubLocation = new Dictionary<string, string>() {
		{ "1",  "Docks" },
		{ "2",  "B1 - Ground Floor" },
		{ "3",  "B1 - First Floor" },
		{ "4",  "B1 - Second Floor" },
		{ "5",  "B1 - UG Cells" },
		{ "49",  "B1 - UG Maze" },
		{ "6",  "Desert 1" },
		{ "51",  "Tank / Uniform Check" },
		{ "7",  "B1 - Elevator" },
		{ "8",  "B1 - Roof" },
		{ "53",  "B1 - Hind D + Drop" },
		{ "9",  "B2 - Ground Floor" },
		{ "52",  "B2 - Bulldozer" },
		{ "10",  "B2 - First Floor" },
		{ "54",  "B2 - Underground" },
		{ "12",  "Desert 2" },
		{ "13",  "B2 - Elevator" },
		{ "14",  "B2 - Hellroof" },
		{ "15",  "B3 - Ground Floor" },
		{ "55",  "Dirty Duck Area" },
		{ "16",  "B3 - Underground" },
		{ "17",  "B2 - Elevator" },
		{ "57",  "TX-55" },
		{ "56",  "Big Boss" },
		{ "18",  "B3 - Escape" },
		{ "61",  "Credits" }
	};

	vars.Rank = "";
	vars.Class = "";
	vars.SnakeYAxisHead = "";
	vars.SnakeYAxisFeet = "";
	vars.SnakeXAxis = "";
}

update {
	// get a casted (to dictionary) reference to current
	// so we can manipulate it using dynamic keynames
	var cur = current as IDictionary<string, object>;

	// if we're in the emu...
	if (game.ProcessName.Equals("pcsx2", StringComparison.InvariantCultureIgnoreCase)) {

		// list of pc address names to be recreated when on emu
		var names = new List<string>() { 
			"GameTime",
			"BSGameTimeSeconds",
			"BSGameTimeMinutes",
			"MainMenuState",
			"BSState",
			"FloorVal",
			"ScreenVal",
			"SubFloorVal",
			"AlertCountdown",
			"ClassValue",
			"TotalPOWsaved",
			"Health",
			"SnakeXAxisNG",
			"SnakeFeetYAxisNG",
			"SnakeHeadYAxisNG",
			"SnakeXAxisNGP",
			"SnakeFeetYAxisNGP",
			"SnakeHeadYAxisNGP",
			"Saves",
			"Continues",
			"ContPerCheckpoint",
			"Alerts",
			"Kills",
			"Rations",
			"RationsHeld",
			"PlasticExplosives",
			"Mines",
			"RemoteMissiles",
			"RocketLauncherAmmo",
			"GrenadeLauncherAmmo",
			"SMGAmmo",
			"PistolAmmo",
			"EquipmentPointX",
			"EquipmentPointY",
			"WeaponPointX",
			"WeaponPointY",
			"InventorySlot11",
			"InventorySlot12",
			"InventorySlot13",
			"InventorySlot14",
			"InventorySlot15",
			"InventorySlot21",
			"InventorySlot22",
			"InventorySlot23",
			"InventorySlot24",
			"InventorySlot25",
			"InventorySlot31",
			"InventorySlot32",
			"InventorySlot33",
			"InventorySlot34",
			"InventorySlot35",
			"InventorySlot41",
			"InventorySlot42",
			"InventorySlot43",
			"InventorySlot44",
			"InventorySlot45",
			"InventorySlot51",
			"InventorySlot52",
			"InventorySlot53",
			"InventorySlot54",
			"InventorySlot55"
			};

		// (placeholder) have some logic to work out the version and create the prefix
		string ver = null;

		// check the basics
		//either PAL or another version
		//if (current.region == "PAL") ver = "EU_"; <- not working for some reason
		if (current.regCode == "SLES") ver = "EU_";
		//either NTSC-US or NTSC-JP
		else if (current.regCode == "SLUS") ver = "US_";
		//either NTSC-J Subsistence or 20th Anniversary release
		else if (current.discNumber == "662.21") ver = "JSub_";
		else if (current.discNumber == "667.95") ver = "J20A_";

		// if in a supported version of the game...
		if (ver == null) return false;
		// loop through each desired address...
		foreach(string name in names) {
			// set e.g. current.GameTime to the value at e.g. current.US_GameTime
			cur[name] = cur[ver + name];
		}
	}

	// any more code for update goes here
		//function to display the current rank
	if(current.GameTime>1079999) {
		vars.Rank = "Chicken";
	} else if ((current.GameTime>863999)&&(current.GameTime<1080000)) {
		vars.Rank = "Turtle";
	} else if ((current.GameTime>647999)&&(current.GameTime<864000)) {
		vars.Rank = "Hippopotamus";
	} else if ((current.GameTime>431999)&&(current.GameTime<648000)) {
		vars.Rank = "Elephant";
	} else if ((current.GameTime>215999)&&(current.GameTime<1080000)) {
		vars.Rank = "Deer";
	} else if (current.Kills > 3) {
		vars.Rank = "Deer";
	} else if (current.Kills < 4) {
		if ((current.GameTime>108000)&&(current.GameTime<432000)) {
			vars.Rank = "Zebra";
		} else if ((current.GameTime>81000)&&(current.GameTime<1080000)) {
			vars.Rank = "Jackal";
		} else if ((current.GameTime>45000)&&(current.GameTime<1080000)) {
			vars.Rank = "Panther";
		} else if ((current.Kills > 0) ||(current.Continues > 0) || (current.Alerts > 9) ||(current.Rations > 1)) {
			vars.Rank = "Eagle";
		} else {
			vars.Rank = "Fox";
		}
	}

	vars.Class = current.ClassValue + 1;
	
	vars.Location = "";

	vars.SnakeYAxisHead = current.SnakeHeadYAxisNG + current.SnakeHeadYAxisNGP;
	vars.SnakeYAxisFeet = current.SnakeFeetYAxisNG + current.SnakeFeetYAxisNGP;
	vars.SnakeXAxis = current.SnakeXAxisNG + current.SnakeXAxisNGP;
}

gameTime {
	if (game.ProcessName.Equals("pcsx2", StringComparison.InvariantCultureIgnoreCase)) {
		if (current.BSState == 0) {	
			return TimeSpan.FromMilliseconds(current.GameTime * 1000 / (current.regCode == "SLES"?16.667:15));
 		} else {
			return TimeSpan.FromMilliseconds((current.BSGameTimeMinutes * 60 + current.BSGameTimeSeconds) * 1000);
		}
	} else {
		if (current.BSState == 0) {	
			return TimeSpan.FromMilliseconds(current.GameTime * 1000 / 15);
 		} else {
			return TimeSpan.FromMilliseconds((current.BSGameTimeMinutes * 60 + current.BSGameTimeSeconds) * 1000);
		}
	}
}

isLoading {
	if(current.BSState == 0 || current.BSState == 4) return false;
	else return true;
}

start {
	// various start texts and values
	// J-SUB: 	19351456 NG		19351408 NGP
	// J20A: 	19351408 NG		19351408 NGP
	// US: 		22288032 NG 	22287840 NGP
	// PAL:		22294496 NG		22294520 NGP	22294304 BS
	// PC:		192593504 NG	192593528 NGP 192593864

    if ((current.BSState == 0) && (current.MainMenuState == 0 && current.MainMenuState != old.MainMenuState)) {
        return  true;
    } else if ((old.BSState == 8) && (current.BSState == 1)) return true;
}

split {	
    if (current.GameTime > 0 && current.BSState == 0) {
        //on entering the elevator on building 1
        if (current.FloorVal == 6) {
            if (old.FloorVal == 1) {
            //if previous map was Building 1 - Ground Floor
                return true;
            } else if (old.FloorVal == 3) {
            //if previous map was Building 1 - First Floor
                return true;
            } else if (old.FloorVal == 4) {
            //if previous map was Building 1 - Underground
                return true;
            } else if (old.FloorVal == 2) {
            //if previous map was Building 1 - MGK Floor
                return true;
            }
        }
        //on capture on B1 Ground Floor to being put in the underground
        if ((current.FloorVal == 4) && (old.FloorVal == 1)) return true;

        //on switching from Building 1 - Roof to Building 1 - Ground Floor via parachute drop
        if ((current.FloorVal == 1) && (old.FloorVal == 7)) return true;

        //on entering Desert between Building 1 to Building 2 with B1 - GF as previous map
        if ((current.FloorVal == 5) && (old.FloorVal == 1)) return true;

        //on entering Building 2 with connecting desert as previous map
        if ((current.FloorVal == 8) && (old.FloorVal == 5)) return true;

        //on entering the elevator on building 2
        if (current.FloorVal == 12) {
            if (old.FloorVal == 8) {
            //if previous map was Building 2 - Ground Floor
                return true;
            } else if (old.FloorVal == 13) {
            //if previous map was Building 2 - Hell Roof
                return true;
            } else if (old.FloorVal == 10) {
            //if previous map was Building 2 - Underground
                return true;
            }
        }

        //on ranking up from Rank 3 to Rank 4
        // if ((current.ClassValue == 3) && (old.ClassValue == 2)) return true;

        //on entering the B2 elevator, but only if the amount of continues for a single checkpoint 5 (reaching death abuse)
        //and on transitioning between B2 Elevator and going back into Building 2 - First Floor again
        // marking the end of the death abuse segment
        if ((current.ClassValue == 3) && (current.ContPerCheckpoint == 5) && (current.FloorVal == 9) && (old.FloorVal == 12)) return true;

        //on entering the B2 elevator, but only if the amount of continues for a single checkpoint is higher than 4
        //and on transitioning between Building 2 - First Floor going into the B2 Elevator
        if ((current.ClassValue == 3) && (current.ContPerCheckpoint > 4) && (current.FloorVal == 12) && (old.FloorVal == 9)) return true;

        // for big boss, the above check will be accepted if the continues per checkpoint are exactly 0
        // for an intended Big Boss rank run
        if ((current.ClassValue == 3) && (current.ContPerCheckpoint == 0) && (current.FloorVal == 12) && (old.FloorVal == 9)) return true;

        // on reaching Building 3
        if (current.FloorVal == 14) {
            if (old.FloorVal == 8) {
            // if previous map was B2 Ground Floor
                return true;
            } else if (old.FloorVal == 11) {
            // if previous map was Connecting Desert between Building 2 and Building 3
                return true;
            }
        }

        // on returning back to Building 2 Ground Floor after having visited Building 3 (post Dirty Duck)
        if ((current.FloorVal == 8) && (old.FloorVal == 14)) return true;

        // going from Buildin 2 Ground Floor into the connecting desert between Building 2 and Building 3
        if ((current.FloorVal == 11) && (old.FloorVal == 8)) return true;
        
        // going from Desert between B2 and B3 into Building 2 Ground Floor
        if ((current.FloorVal == 8) && (old.FloorVal == 11)) return true;
        
        // on entering Building 3 elevator after having visited Building 3 Ground Floor
        if ((current.FloorVal == 16) && (old.FloorVal == 14)) return true;

        // on entering Building 3 Underground
        if (current.FloorVal == 15) {
            // after map has switched from underground to TX-55 boss room
            if ((old.SubFloorVal == 16) && (current.SubFloorVal == 57)) return true;
            // after map has switched from TX-55 boss room to Big Boss Boss fight room
            if ((old.SubFloorVal == 57) && (current.SubFloorVal == 56)) return true;
        }
        // on entering the final map
        if ((current.FloorVal == 17) && (old.FloorVal == 15)) return true;
        
    }

    // during Boss Survival
    if ((old.BSState == 4) && (current.BSState == 6)) return true;

	// NTSC-U main menu state to define end of run
	if ((current.MainMenuState == 22288560) && (current.MainMenuState != old.MainMenuState)) return true;

	// NTSC-J (both) main menu state to define end of run
	if ((current.MainMenuState == 19351936) && (current.MainMenuState != old.MainMenuState)) return true;

	// PAL main menu state to define end of run
	if ((current.MainMenuState == 22295024) && (current.MainMenuState != old.MainMenuState)) return true;

	// PC main menu state to define end of run
	if ((current.MainMenuState == 192594032) && (current.MainMenuState != old.MainMenuState)) return true;
}

reset {
	// various start texts and values
	// J-SUB: 	19351456 NG		19351408 NGP
	// J20A: 	19351408
	// US: 		22288032 NG 	22287840 NGP
	// PAL:		22294496 NG		22294520 NGP
	// PC:		192593504 NG	192593528 NGP 192594032 BS 192593312

	if(current.BSState == 0) {
		if((current.MainMenuState == 19351456) && (old.MainMenuState != 19351456)) return true;
		else if((current.MainMenuState == 19351408) && (old.MainMenuState != 19351408)) return true;
		else if((current.MainMenuState == 22288032) && (old.MainMenuState != 22288032)) return true;
		else if((current.MainMenuState == 22287840) && (old.MainMenuState != 22287840)) return true;
		else if((current.MainMenuState == 22294496) && (old.MainMenuState != 22294496)) return true;
		else if((current.MainMenuState == 22294520) && (old.MainMenuState != 22294520)) return true;
		else if((current.MainMenuState == 192593504) && (old.MainMenuState != 192593504)) return true;
		else if((current.MainMenuState == 192593528) && (old.MainMenuState != 192593528)) return true;
		else if((current.MainMenuState == 192593312) && (old.MainMenuState != 192593312)) return true;
	}

    if ( old.BSState == 5 || (current.BSState != 0 && current.BSState == 0)) {
        return true;
    }
}