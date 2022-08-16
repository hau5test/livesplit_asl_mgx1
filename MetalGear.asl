/*********************************************************/
/* Metal Gear (PC/PS2) Autosplitter v1.1                */
/*                                                       */
/* Emulator Compatibility:                               */
/*  * PCXS2                                              */
/*                                                       */
/* Game Compatibility:                                   */
/*  * Metal Gear PC                                      */
/*  * Metal Gear PCXS2 PS2 PAL                           */
/*  * Metal Gear PCXS2 PS2 NTSC-U Subsistence Release    */
/*  * Metal Gear PCXS2 PS2 NTSC-J Subsistence Release    */
/*  * Metal Gear PCXS2 PS2 NTSC-J 20th Anniversary Disc  */
/*                                                       */
/* Created by Hau5test for Metal Gear Solid Speedrunners */
/*                                                       */
/* Thanks to BMN, NickRPGreen for their input and advice */
/*********************************************************/
state("MetalGear") {
	// timers
	uint GameTime:				0x145AC, 0xEB8;
	uint BSGameTimeSeconds: 	0x11854, 0x114;
    uint BSGameTimeMinutes: 	0x11854, 0x110;
	// variables for state and map location
	uint MainMenuState:			0x1D208, 0x214;
    uint BSState: 				0x11854, 0x120;
	uint FloorVal: 				0x11854, 0xCC;
	uint ScreenVal:				0x1183C, 0x4;
	uint SubFloorVal: 			0x1F108, 0xC8;
	uint AlertCountdown: 		0x11854, 0xD4;
	// snake relevant values
	uint ClassValue: 			0x113B8, 0xFB4;
	uint TotalPOWsaved: 		0x13B64, 0xF7C;
    uint Saves: 				0x1C51C, 0xFEC;
	uint Health: 				0x113B8, 0xFA4;
	// PC is the only version where the two positions are identical memories
	int SnakeXAxisNG:			0x5F388, 0x0, 0xF88;
	int SnakeFeetYAxisNG:		0x5F388, 0x30, 0x8C4;
	int SnakeHeadYAxisNG:		0x5F388, 0x18, 0xC28;
	int SnakeXAxisNGP:			0x5F388, 0x0, 0xF88;
	int SnakeFeetYAxisNGP:		0x5F388, 0x30, 0x8C4;
	int SnakeHeadYAxisNGP:		0x5F388, 0x18, 0xC28;
	// score screen
	uint Continues: 			0x145AC, 0xED0;
	uint ContPerCheckpoint: 	0x1EBC4, 0x0;
	uint Alerts: 				0x145AC, 0xEC4;
	uint Kills: 				0x145AC, 0xEC0;
	uint Rations: 				0x145AC, 0xEBC;
	// inventory values
	uint RationsHeld: 			0x13B64, 0xF68;
	uint PlasticExplosives: 	0x145AC, 0xEA0;
	uint Mines: 				0x145AC, 0xE9C;
	uint RemoteMissiles: 		0x145AC, 0xEA4;
	uint RocketLauncherAmmo: 	0x145AC, 0xEB0;
	uint GrenadeLauncherAmmo:	0x145AC, 0xEB4;
	uint SMGAmmo: 				0x145AC, 0xEAC;
	uint PistolAmmo: 			0x145AC, 0xEA8;
	// menu pointer position
	uint EquipmentPointX:		0x113B8, 0xF88;
	uint EquipmentPointY:		0x113B8, 0xF94;
	uint WeaponPointX:			0x113B8, 0xF8C;
	uint WeaponPointY:			0x113B8, 0xF98;
	// inventory slots
	uint InventorySlot11:		0x113B8, 0xFC0;
	uint InventorySlot12:		0x113B8, 0xFC4;
	uint InventorySlot13:		0x113B8, 0xFC8;
	uint InventorySlot14:		0x113B8, 0xFCC;
	uint InventorySlot15:		0x113B8, 0xFD0;
	uint InventorySlot21:		0x113B8, 0xFD4;
	uint InventorySlot22:		0x113B8, 0xFD8;
	uint InventorySlot23:		0x113B8, 0xFDC;
	uint InventorySlot24:		0x113B8, 0xFE0;
	uint InventorySlot25:		0x113B8, 0xFE4;
	uint InventorySlot31:		0x113B8, 0xFE8;
	uint InventorySlot32:		0x113B8, 0xFEC;
	uint InventorySlot33:		0x113B8, 0xFF0;
	uint InventorySlot34:		0x113B8, 0xFF4;
	uint InventorySlot35:		0x113B8, 0xFF8;
	uint InventorySlot41:		0x113B8, 0xFFC;
	uint InventorySlot42:		0x113E8, 0xFD4;
	uint InventorySlot43:		0x113E8, 0xFD8;
	uint InventorySlot44:		0x113E8, 0xFDC;
	uint InventorySlot45:		0x113E8, 0xFE0;
	uint InventorySlot51:		0x113E8, 0xFE4;
	uint InventorySlot52:		0x113E8, 0xFE8;
	uint InventorySlot53:		0x113E8, 0xFEC;
	uint InventorySlot54:		0x113E8, 0xFF0;
	uint InventorySlot55:		0x113E8, 0xFF4;
	uint MenuPointerPosition:	0x113E8, 0xF70;
	uint ActiveWeaponEquipped:	0x113E8, 0xF90;
	uint ActiveItemEquipped:	0x113E8, 0xF8C;
	uint WeaponsUpdate1:		0x12060, 0xFBC;
	uint WeaponsUpdate2:		0x12060, 0xFC0;
	uint PowChecklist1:			0x12060, 0xFC8;
	uint PowChecklist2:			0x12060, 0xFCC;
	uint PowChecklist3:			0x12060, 0xFD0;
	uint BossData1:				0x12060, 0xFFC;
	uint BossData2:				0x13B64, 0xFD8;
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
	uint J20A_MenuPointerPosition:	0x123E184, 0x87C;
	uint J20A_ActiveWeaponEquipped:	0x123E188, 0x50C;
	uint J20A_ActiveItemEquipped:	0x123E188, 0x10;
	uint J20A_WeaponsUpdate1:		0x123E184, 0x94C;
	uint J20A_WeaponsUpdate2:		0x123E184, 0x950;
	uint J20A_PowChecklist1:		0x123E184, 0x958;
	uint J20A_PowChecklist2:		0x123E184, 0x95C;
	uint J20A_PowChecklist3:		0x123E184, 0x960;
	uint J20A_BossData1:			0x123E184, 0x98C;
	uint J20A_BossData2:			0x123E184, 0x990;

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
	uint JSub_MenuPointerPosition:	0x123E184, 0x8FC;
	uint JSub_ActiveWeaponEquipped:	0x123E188, 0x58C;
	uint JSub_ActiveItemEquipped:	0x123E188, 0x590;
	uint JSub_WeaponsUpdate1:		0x123E184, 0x9CC;
	uint JSub_WeaponsUpdate2:		0x123E184, 0x9D0;
	uint JSub_PowChecklist1:		0x123E184, 0x9D8;
	uint JSub_PowChecklist2:		0x123E184, 0x9DC;
	uint JSub_PowChecklist3:		0x123E184, 0x9E0;
	uint JSub_BossData1:			0x123E184, 0xA0C;
	uint JSub_BossData2:			0x123E184, 0xA10;

	// US
	// timers
	uint US_GameTime: 				0x123E188, 0x388;
	uint US_BSGameTimeSeconds:		0x123E188, 0xA58;
	uint US_BSGameTimeMinutes:		0x123E188, 0xA54;
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
	uint US_MenuPointerPosition:	0x123E188, 0x214;
	uint US_ActiveWeaponEquipped:	0x123E188, 0x9B0;
	uint US_ActiveItemEquipped:		0x123E188, 0x9A8;
	uint US_WeaponsUpdate1:			0x123E188, 0x2E4;
	uint US_WeaponsUpdate2:			0x123E188, 0x2E8;
	uint US_PowChecklist1:			0x123E188, 0x2F0;
	uint US_PowChecklist2:			0x123E188, 0x2F4;
	uint US_PowChecklist3:			0x123E188, 0x2F8;
	uint US_BossData1:				0x123E188, 0x324;
	uint US_BossData2:				0x123E188, 0x328;

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
	uint EU_MenuPointerPosition:	0x123E190, 0xF4C;
	uint EU_ActiveWeaponEquipped:	0x123E194, 0x6E8;
	uint EU_ActiveItemEquipped:		0x123E194, 0x6E0;
	uint EU_WeaponsUpdate1:			0x123E194, 0x1C;
	uint EU_WeaponsUpdate2:			0x123E194, 0x20;
	uint EU_PowChecklist1:			0x123E194, 0x28;
	uint EU_PowChecklist2:			0x123E194, 0x2C;
	uint EU_PowChecklist3:			0x123E194, 0x30;
	uint EU_BossData1:				0x123E194, 0x5C;
	uint EU_BossData2:				0x123E194, 0x60;
}

startup {
	// add D shorthand to context
	vars.D = new ExpandoObject();
	var D = vars.D;

	D.Location = new Dictionary<uint, string>() {
		{ 0,  "Docks" },
		{ 1,  "B1 - Ground Floor" },
		{ 2,  "B1 - First Floor" },
		{ 3,  "B1 - Second Floor" },
		{ 4,  "B1 - Underground" },
		{ 5,  "Desert 1" },
		{ 6,  "B1 - Elevator" },
		{ 7,  "B1 - Roof" },
		{ 8,  "B2 - Ground Floor" },
		{ 9,  "B2 - First Floor" },
		{ 10,  "B2 - Underground" },
		{ 11,  "Desert 2" },
		{ 12,  "B2 - Elevator" },
		{ 13,  "B2 - Hellroof" },
		{ 14,  "B3 - Ground Floor" },
		{ 15,  "B3 - Underground" },
		{ 16,  "B2 - Elevator" },
		{ 17,  "B3 - Escape" }
	};

	D.SubLocation = new Dictionary<uint, string>() {
		{ 1,  "Docks" },
		{ 2,  "B1 - Ground Floor" },
		{ 3,  "B1 - First Floor" },
		{ 4,  "B1 - Second Floor" },
		{ 5,  "B1 - UG Cells" },
		{ 6,  "Desert 1" },
		{ 7,  "B1 - Elevator" },
		{ 8,  "B1 - Roof" },
		{ 9,  "B2 - Ground Floor" },
		{ 10,  "B2 - First Floor" },
		{ 12,  "Desert 2" },
		{ 13,  "B2 - Elevator" },
		{ 14,  "B2 - Hellroof" },
		{ 15,  "B3 - Ground Floor" },
		{ 16,  "B3 - Underground" },
		{ 17,  "B2 - Elevator" },
		{ 18,  "B3 - Escape" },
		{ 49,  "B1 - UG Maze" },
		{ 51,  "Tank / Uniform Check" },
		{ 52,  "B2 - Bulldozer" },
		{ 53,  "B1 - Hind D + Drop" },
		{ 54,  "B2 - Underground" },
		{ 55,  "Dirty Duck Area" },
		{ 56,  "Big Boss" },
		{ 57,  "TX-55" },
		{ 61,  "Credits" }
	};

	D.ItemList = new Dictionary<uint, string>() {
		{ 0,  "Cigs"},
		{ 1,  "Flashlight"},
		{ 2,  "Oxygen Zylinder"},
		{ 3,  "Rations"},
		{ 4,  "Compass"},
		{ 5,  "Scope"},
		{ 6,  "Bomb Blast Suit"},
		{ 7,  "Cardboard Box"},
		{ 8,  "Infrared Goggles"},
		{ 9,  "Transmitter"},
		{ 10,  "Enemy Uniform"},
		{ 11,  "Antenna"},
		{ 12,  "Mine Detector"},
		{ 13,  "Parachute"},
		{ 14,  "Gas Mask"},
		{ 15,  "Antidote"},
		{ 16,  "Cards"},
		{ 21,  "Emtpy Slot"},
		{ 27,  "Bandana"},
		{ 28,  "Body Armor"}
	};

	D.WeaponList = new Dictionary<uint, string>() {
		{ 18,  "Mines"},
		{ 19,  "Explosives"},
		{ 20,  "RC Missiles"},
		{ 21,  "Pistol"},
		{ 22,  "Submachine Gun"},
		{ 23,  "Rocket Launcher"},
		{ 24,  "Grenade Launcher"}
	};

	// define all variables in start up so they can be set before an active run is going on
	vars.Rank = "";
	vars.Class = "";
	vars.SnakeYAxisHead = "";
	vars.SnakeYAxisFeet = "";
	vars.SnakeXAxis = "";
	vars.NGorNGP = "";
	vars.Location = "";
	vars.SubLocation = "";
	vars.Difficulty = "";
	vars.ActiveItem = "";
	vars.ActiveWeapon = "";
	vars.CalledBigBoss = false;
	vars.CalledDiane = false;
	vars.CalledSchneider = false;
	vars.CalledJennifer = false;
	vars.InventoryCompletion = "0 out of 24";
	vars.CodecCompletion = "0 out of 4";
	vars.WeaponsCompletion = "0 out of 8";
	vars.POWsCompletion = "0 out of 24";
	vars.BossesCompletion = "0 out of 10";

	// add splits based on checkpoints
	settings.Add("checkpoint_splits", true, "Checkpoint Splits");
	// add splits based on being checkpoints in the first building
	settings.Add("building1_splits", true, "Building 1 Split", "checkpoint_splits");
	settings.Add("b1_gf_to_elevator", true, "Ground Floor to Elevator", "building1_splits");
	settings.Add("b1_1f_to_elevator", true, "First Floor to Elevator", "building1_splits");
	settings.Add("b1_captured", true, "Getting Captured", "building1_splits");
	settings.Add("b1_2f_to_elevator", true, "Second Floor to Elevator", "building1_splits");
	settings.Add("b1_ug_to_elevator", true, "UnderGround to Elevator", "building1_splits");
	settings.Add("b1_roof_to_ground", true, "Roof to Central Courtyard", "building1_splits");
	settings.Add("building1_finished", true, "End of Building 1 - start of Desert 1", "building1_splits");
	// add splits based on being checkpoints in the second building
	settings.Add("building2_splits", true, "Building 2 Split", "checkpoint_splits");
	settings.Add("b2_enter_from_B1_desert", true, "Entering Building 2 from Building 1 Desert", "building2_splits");
	settings.Add("b2_enter_from_B3_desert", true, "Entering Building 2 from Building 3 Desert", "building2_splits");
	settings.Add("b2_gf_to_elevator", true, "Ground Floor to Elevator", "building2_splits");
	settings.Add("b2_1f_to_elevator", true, "First Floor to Elevator", "building2_splits");
	settings.SetToolTip("b2_1f_to_elevator", "Splits only if deaths on this checkpoint are 0 or have not increased between map changes to avoid splitting during death farming.");
	settings.Add("b2_roof_to_elevator", true, "Hell Roof to Elevator", "building2_splits");
	settings.Add("b2_ug_to_elevator", true, "UnderGround to Elevator", "building2_splits");
	settings.Add("building2_finished", true, "End of Building 2 - start of Desert 2", "building2_splits");
	// add splits based on being checkpoints in the third building
	settings.Add("building3_finished", true, "Building 3 Split", "checkpoint_splits");
	settings.Add("b3_enter", true, "Entering Building 3", "building3_finished");
	settings.Add("b3_gf_to_elevator", true, "Ground Floor to Elevator", "building3_finished");
	settings.Add("b3_ug_to_elevator", true, "Ground Floor to Elevator", "building3_finished");

	// add settings block
	settings.Add("stop_timer", true, "Stop Timer on Finishing the Game");

	// add bonus splits outside of checkpoints
	settings.Add("boss_splits", true, "Boss Splits");
	settings.Add("shotmaker_split", true, "Shotmaker Split", "boss_splits");
	settings.Add("mgk_split", true, "MGK Split", "boss_splits");
	settings.Add("hindd_split", true, "Hind D Split", "boss_splits");
	settings.Add("tank_split", true, "Tank Split", "boss_splits");
	settings.Add("bulldozer_split", true, "Bulldozer Split", "boss_splits");
	settings.Add("firetrooper_split", true, "Firetrooper Split", "boss_splits");
	settings.Add("dirtyduck_split", true, "Dirty Duck Split", "boss_splits");
	settings.Add("tx-55_split", true, "TX-55 Split", "boss_splits");
	settings.Add("bigboss_split", true, "Big Boss Split", "boss_splits");

	// add bonus splits outside of checkpoints
	settings.Add("bonus_splits", true, "Bonus Splits");

	// add splits on class change
	settings.Add("class_upgrade", false, "Class Upgrade", "bonus_splits");
	settings.Add("class2_upgrade", false, "Upgrade to Class 2", "class_upgrade");
	settings.Add("class3_upgrade", false, "Upgrade to Class 3", "class_upgrade");
	settings.Add("class4_upgrade", false, "Upgrade to Class 4", "class_upgrade");

	// add splits on death farm success
	settings.Add("death_farm", true, "Death Farm Completed", "bonus_splits");

	// add splits on Scuba Swim
	settings.Add("scuba_swim_splits", true, "Scuba Swim Splits", "bonus_splits");
	settings.Add("scuba_swim_north_finished", true, "Scuba Swim North Finished", "scuba_swim_splits");
	settings.Add("scuba_swim_south_finished", true, "Scuba Swim South Finished", "scuba_swim_splits");

	// add splits for special POWs
	settings.Add("pow_splits", true, "Special POW Splits", "bonus_splits");
	settings.Add("gray_fox_saved", true, "Gray Fox Saved", "pow_splits");
	settings.Add("dr_madnar_saved", true, "Dr. Madnar Saved", "pow_splits");
	settings.Add("ellen_saved", true, "Ellen Saved", "pow_splits");

	// add Boss Survival spliting behaviour
	settings.Add("bossrush_splits", true, "Boss Survival Splits");
	settings.Add("bossrush_split", true, "Boss Survival Split", "bossrush_splits");
	settings.Add("bossrush_stop", true, "Boss Survival Finish", "bossrush_splits");

	// add legacy splits
	settings.Add("legacy_splits", false, "Legacy Split Definitions");
	settings.Add("scuba_swim_south_started", false, "Scuba Swim South Started", "legacy_splits");
	settings.SetToolTip("scuba_swim_south_started", "on returning back to Building 2 Ground Floor after having visited Building 3 (post Dirty Duck)");
	settings.Add("b3_enter_tx55_room", false, "Enter TX-55 Room" , "legacy_splits");
	settings.Add("b3_enter_bb_room", false, "Enter Big Boss Room", "legacy_splits");
	settings.Add("b3_enter_ladder_map", false, "Room Change Big Boss to Ladders", "legacy_splits");
}

update {
	// add D shorthand to context
  	var D = vars.D;
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
			"InventorySlot55",
			"MenuPointerPosition",
			"ActiveWeaponEquipped",
			"ActiveItemEquipped",
			"WeaponsUpdate1",
			"WeaponsUpdate2",
			"PowChecklist1",
			"PowChecklist2",
			"PowChecklist3",
			"BossData1",
			"BossData2"
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
		} else if ((current.Kills > 0) ||(current.Continues > 0) || (current.Alerts > (8 + current.MenuPointerPosition)) ||(current.Rations > 1)) {
			vars.Rank = "Eagle";
		} else {
			vars.Rank = current.MenuPointerPosition==0?"Big Boss":"Fox";
		}
	}

	// Set Class according to human counting now machine counting
	vars.Class = current.ClassValue + 1;

	// define string that can contain the value based on dictionary key
	string loc = null;
	// look up map name based on floor value
	if (D.Location.TryGetValue(current.FloorVal, out loc)) {
		vars.Location = loc;
	}

	// define string that can contain the value based on dictionary key
	string loc2 = null;	
	// look up map name based on floor value
	if (D.SubLocation.TryGetValue(current.SubFloorVal, out loc2)) {
		vars.SubLocation = loc2;
	}

	// define string that can contain the value based on dictionary key
	string loc3 = null;	
	// look up Item name based on active item value
	if (D.ItemList.TryGetValue(current.ActiveItemEquipped, out loc3)) {
		vars.ActiveItem = loc3;
	} else { vars.ActiveItem =  "Empty"; }

	// define string that can contain the value based on dictionary key
	string loc4 = null;	
	// look up Weapon name based on active weapon value
	if (D.WeaponList.TryGetValue(current.ActiveWeaponEquipped, out loc4)) {
		vars.ActiveWeapon = loc4;
	} else { vars.ActiveWeapon =  "Empty"; }

	// if Item 27 (bandana) is in equipment slot 1 horizontal 2 vertical, use New Game Plus, if not use New Game data
	vars.SnakeYAxisHead = current.InventorySlot12 != 27?current.SnakeHeadYAxisNG:current.SnakeHeadYAxisNGP;
	vars.SnakeYAxisFeet = current.InventorySlot12 != 27?current.SnakeFeetYAxisNG:current.SnakeFeetYAxisNGP;
	vars.SnakeXAxis = current.InventorySlot12 != 27?current.SnakeXAxisNG:current.SnakeXAxisNGP;
	vars.NGorNGP = current.InventorySlot12 != 27?"New Game":"New Game Plus";
	vars.Difficulty = current.MenuPointerPosition==0?"Original":"Easy";

	// count all items in the euipment inventory when value is higher than 0
	D.sumOfInventory = (new []{
		current.InventorySlot11,
		current.InventorySlot12,
		current.InventorySlot13,
		current.InventorySlot14,
		current.InventorySlot15,
		current.InventorySlot21,
		current.InventorySlot22,
		current.InventorySlot23,
		current.InventorySlot24,
		current.InventorySlot25,
		current.InventorySlot31,
		current.InventorySlot32,
		current.InventorySlot33,
		current.InventorySlot34,
		current.InventorySlot35,
		current.InventorySlot41,
		current.InventorySlot42,
		current.InventorySlot43,
		current.InventorySlot44,
		current.InventorySlot45,
		current.InventorySlot51,
		current.InventorySlot52,
		current.InventorySlot53,
		current.InventorySlot54,
		current.InventorySlot55
	}).Count(x => x > 0);

	// remove bandana from count since it is irrelevant to 100% completion
	D.sumOfInventory = current.InventorySlot12 == 27? D.sumOfInventory--:D.sumOfInventory;

	// count all saved codecs in the codec viewer	
	vars.CalledBigBoss = (current.BossData2 & (1 << 4-1)) != 0;
	vars.CalledSchneider = (current.BossData2 & (1 << 6-1)) != 0;
	vars.CalledDiane = (current.BossData2 & (1 << 7-1)) != 0;
	vars.CalledJennifer = (current.BossData2 & (1 << 8-1)) != 0;

	D.CodecCompleted = (new []{
		vars.CalledBigBoss,
		vars.CalledSchneider,
		vars.CalledDiane,
		vars.CalledJennifer
	}).Count(x=>x);

	// Weapon Update Checker
	D.MinePickedUp = (current.WeaponsUpdate1 & (1 << 4-1)) != 0;
	D.PExplosivesPickedUp = (current.WeaponsUpdate1 & (1 << 5-1)) != 0;
	D.RCMissilePickedUp = (current.WeaponsUpdate1 & (1 << 6-1)) != 0;
	D.PistolPickedUp = (current.WeaponsUpdate1 & (1 << 7-1)) != 0;
	D.SMGPickedUp = (current.WeaponsUpdate1 & (1 << 8-1)) != 0;

	D.GrenadeLPickedUp = (current.WeaponsUpdate2 & (1 << 2-1)) != 0;
	D.SilencerPickedUp = (current.WeaponsUpdate2 & (1 << 3-1)) != 0;
	D.RocketLPickedUp = (current.WeaponsUpdate2 & (1 << 1-1)) != 0;

	// count all bools for weapon pick ups
	D.WeaponsPickedUp = (new []{
		D.MinePickedUp,
		D.PistolPickedUp,
		D.PExplosivesPickedUp, 
		D.RCMissilePickedUp, 
		D.SMGPickedUp, 
		D.GrenadeLPickedUp, 
		D.SilencerPickedUp, 
		D.RocketLPickedUp
	}).Count(x=>x);

	// check the three main int variables for the individual bits
	D.GrayFoxSaved = (current.PowChecklist1 & (1 << 1-1)) != 0;
	D.MadnarSaved = (current.PowChecklist1 & (1 << 2-1)) != 0;
	D.EllenSaved = (current.PowChecklist1 & (1 << 3-1)) != 0;
	D.POW1Saved = (current.PowChecklist1 & (1 << 4-1)) != 0;
	D.POW2Saved = (current.PowChecklist1 & (1 << 5-1)) != 0;
	D.POW3Saved = (current.PowChecklist1 & (1 << 6-1)) != 0;
	D.POW4Saved = (current.PowChecklist1 & (1 << 7-1)) != 0;
	D.POW5Saved = (current.PowChecklist1 & (1 << 8-1)) != 0;
	
	D.POW6Saved = (current.PowChecklist2 & (1 << 1-1)) != 0;
	D.POW7Saved = (current.PowChecklist2 & (1 << 2-1)) != 0;
	D.POW8Saved = (current.PowChecklist2 & (1 << 3-1)) != 0;
	D.POW9Saved = (current.PowChecklist2 & (1 << 4-1)) != 0;
	D.POW10Saved = (current.PowChecklist2 & (1 << 5-1)) != 0;
	D.POW11Saved = (current.PowChecklist2 & (1 << 6-1)) != 0;
	D.POW12Saved = (current.PowChecklist2 & (1 << 7-1)) != 0;
	D.POW13Saved = (current.PowChecklist2 & (1 << 8-1)) != 0;

	D.POW14Saved = (current.PowChecklist3 & (1 << 1-1)) != 0;
	D.POW15Saved = (current.PowChecklist3 & (1 << 2-1)) != 0;
	D.POW16Saved = (current.PowChecklist3 & (1 << 3-1)) != 0;
	D.POW17Saved = (current.PowChecklist3 & (1 << 4-1)) != 0;
	D.POW18Saved = (current.PowChecklist3 & (1 << 5-1)) != 0;
	D.POW19Saved = (current.PowChecklist3 & (1 << 6-1)) != 0;
	D.POW20Saved = (current.PowChecklist3 & (1 << 7-1)) != 0;
	D.POW21Saved = (current.PowChecklist3 & (1 << 8-1)) != 0;

	// count all saved POWs including Gray Fox, Madnar and Ellen
	D.POWsPickedUp = (new []{
		D.GrayFoxSaved, 
		D.MadnarSaved, 
		D.EllenSaved, 
		D.POW1Saved, 
		D.POW2Saved, 
		D.POW3Saved, 
		D.POW4Saved, 
		D.POW5Saved, 
		D.POW6Saved, 
		D.POW7Saved, 
		D.POW8Saved, 
		D.POW9Saved, 
		D.POW10Saved, 
		D.POW11Saved, 
		D.POW12Saved, 
		D.POW13Saved, 
		D.POW14Saved, 
		D.POW15Saved, 
		D.POW16Saved, 
		D.POW17Saved, 
		D.POW18Saved, 
		D.POW19Saved, 
		D.POW20Saved,
		D.POW21Saved
	}).Count(x=>x);

	// boss data
	D.FHMFought = (current.BossData1 & (1 << 2-1)) != 0;
	D.ShotmakerFought = (current.BossData1 & (1 << 3-1)) != 0;
	D.MGKFought = (current.BossData1 & (1 << 4-1)) != 0;
	D.TankFought = (current.BossData1 & (1 << 5-1)) != 0;
	D.BulldozerFought = (current.BossData1 & (1 << 6-1)) != 0;
	D.HindFought = (current.BossData1 & (1 << 7-1)) != 0;
	D.FiretrooperFought = (current.BossData1 & (1 << 8-1)) != 0;

	D.DirtyDuckFought = (current.BossData2 & (1 << 1-1)) != 0;
	D.BigBossFought = (current.BossData2 & (1 << 2-1)) != 0;
	D.TX55Fought = (current.BossData2 & (1 << 3-1)) != 0;

	D.BossesFought = (new []{
	D.FHMFought,
	D.ShotmakerFought,
	D.MGKFought,
	D.HindFought,
	D.TankFought,
	D.BulldozerFought,
	D.FiretrooperFought,
	D.DirtyDuckFought,
	D.TX55Fought,
	D.BigBossFought,
	}).Count(x=>x);

	// calculate percentage of all colectibles
	vars.HundredPercentCompletion = (
	(
		Math.Floor((
			(D.sumOfInventory + D.CodecCompleted + D.WeaponsPickedUp + D.POWsPickedUp + D.BossesFought + current.ClassValue)
			 / 72f) * 100)
	)
	).ToString()
	+ "%";

	// completion of individual categories
	// Inventory completion
	vars.InventoryCompletion = (D.sumOfInventory + 1) + " out of 24";
	// Codec completion
	vars.CodecCompletion = D.CodecCompleted + " out of 4";
	// Weapons completion
	vars.WeaponsCompletion = D.WeaponsPickedUp + " out of 8";
	// POWs completion
	vars.POWsCompletion = D.POWsPickedUp + " out of 24";
	// Bosses completion
	vars.BossesCompletion = D.BossesFought + " out of 10";
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
	// if currently the Boss Survival State is 0, listen to the main menu state for change
    if ((current.BSState == 0) && (current.MainMenuState == 0 && current.MainMenuState != old.MainMenuState)) {
        return  true;
    } else if ((old.BSState == 0) && (current.BSState == 8)) return true;
	// start splitting once the Boss Survival state goes from 0 to 8 (loading game mode after selecting difficulty)
}

split {
	// add D shorthand to context
  	var D = vars.D;

    if (current.GameTime > 0 && current.BSState == 0) {
        //on entering the elevator on building 1
        if (current.FloorVal == 6) {
            if (old.FloorVal == 1) {
            //if previous map was Building 1 - Ground Floor
			if (settings["b1_gf_to_elevator"]) return true;
            } else if (old.FloorVal == 3) {
            //if previous map was Building 1 - Second Floor
			if (settings["b1_2f_to_elevator"]) return true;
            } else if (old.FloorVal == 4) {
            //if previous map was Building 1 - Underground
			if (settings["b1_ug_to_elevator"]) return true;
            } else if (old.FloorVal == 2) {
            //if previous map was Building 1 - First Floor
			if (settings["b1_1f_to_elevator"]) return true;
            }
        }
        //on capture on B1 Ground Floor to being put in the underground
        if ((current.FloorVal == 4) && (old.FloorVal == 1) && settings["b1_captured"]) return true;

        //on switching from Building 1 - Roof to Building 1 - Ground Floor via parachute drop
        if ((current.FloorVal == 1) && (old.FloorVal == 7) && settings["b1_roof_to_ground"]) return true;

        //on entering Desert between Building 1 to Building 2 with B1 - GF as previous map
        if ((current.FloorVal == 5) && (old.FloorVal == 1) && settings["building1_finished"]) return true;

        //on entering Building 2 with connecting desert as previous map
        if ((current.FloorVal == 8) && (old.FloorVal == 5) && settings["b2_enter_from_B1_desert"]) return true;

        //on entering the elevator on building 2
        if (current.FloorVal == 12) {
            if (old.FloorVal == 8) {
            //if previous map was Building 2 - Ground Floor
			if (settings["b2_gf_to_elevator"]) return true;
            } else if (old.FloorVal == 13) {
            //if previous map was Building 2 - Hell Roof
			if (settings["b2_roof_to_elevator"]) return true;
            } else if (old.FloorVal == 10) {
            //if previous map was Building 2 - Underground
			if (settings["b2_ug_to_elevator"]) return true;
            }
        }

        //split on successful death abuse first time only
        if (current.ContPerCheckpoint == 5 && old.ContPerCheckpoint == 4 && (settings["death_farm"])) return true;

        //on entering the B2 elevator, but only if the amount of continues for a single checkpoint is higher than 4
        //and on transitioning between Building 2 - First Floor going into the B2 Elevator
        if (((current.ContPerCheckpoint == 0) || (current.ContPerCheckpoint == old.ContPerCheckpoint)) && (current.FloorVal == 12) && (old.FloorVal == 9) && settings["b2_1f_to_elevator"]) return true;

        // on reaching Building 3
        if (current.FloorVal == 14) {
            if (old.FloorVal == 8) {
            // if previous map was B2 Ground Floor
			if (settings["scuba_swim_north_finished"]) return true;
            } else if (old.FloorVal == 11) {
            // if previous map was Connecting Desert between Building 2 and Building 3
			if (settings["b3_enter"]) return true;
            }
        }

        // on returning back to Building 2 Ground Floor after having visited Building 3 (post Dirty Duck)
        if ((current.FloorVal == 8) && (old.FloorVal == 14) && settings["scuba_swim_south_started"]) return true;

        // going from Buildin 2 Ground Floor into the connecting desert between Building 2 and Building 3
        if ((current.FloorVal == 11) && (old.FloorVal == 8) && settings["building2_finished"]) return true;
        
        // going from Desert between B2 and B3 into Building 2 Ground Floor
        if ((current.FloorVal == 8) && (old.FloorVal == 11) && settings["b2_enter_from_B3_desert"]) return true;
        
        // on entering Building 3 elevator after having visited Building 3 Ground Floor
        if ((current.FloorVal == 16) && (old.FloorVal == 14) && settings["b3_gf_to_elevator"]) return true;

        // on entering Building 3 elevator after having visited Building 3 Ground Floor
        if ((current.FloorVal == 16) && (old.FloorVal == 15) && settings["b3_ug_to_elevator"]) return true;

        // on entering Building 3 Underground
        if (current.FloorVal == 15) {
            // after map has switched from underground to TX-55 boss room
            if ((old.SubFloorVal == 16) && (current.SubFloorVal == 57) && settings["b3_enter_tx55_room"]) return true;
            // after map has switched from TX-55 boss room to Big Boss Boss fight room
            if ((old.SubFloorVal == 57) && (current.SubFloorVal == 56) && settings["b3_enter_bb_room"]) return true;
        }
        // on entering the final map
        if ((current.FloorVal == 17) && (old.FloorVal == 15) && settings["b3_enter_ladder_map"]) return true;
        
    }

    // during Boss Survival
    if ((old.BSState == 6) && (current.BSState == 1) && settings["bossrush_split"]) return true;
	if ((old.BSState == 6) && (current.BSState == 0) && settings["bossrush_stop"]) return true;

	// if on final game screen and the main menu state changes, split
	if ((old.FloorVal == 17 && old.ScreenVal == 2) && (current.MainMenuState != old.MainMenuState && old.MainMenuState == 0) && settings["stop_timer"]) return true;

// Boss Kill Splits
if (current.BossData1 != old.BossData1) {
	if(D.ShotmakerFought && settings["shotmaker_split"]) return true;
	if(D.MGKFought && settings["mgk_split"]) return true;
	if(D.TankFought && settings["tank_split"]) return true;
	if(D.BulldozerFought && settings["bulldozer_split"]) return true;
	if(D.HindFought && settings["hindd_split"]) return true;
	if(D.FiretrooperFought && settings["firetrooper_split"]) return true;
}
if (current.BossData2 != old.BossData2) {
	if(D.DirtyDuckFought && settings["dirtyduck_split"]) return true;
	if(D.BigBossFought && settings["55_split"]) return true;
	if(D.TX55Fought && settings["bigboss_split"]) return true;
}

// class change splits
if (current.ClassValue != old.ClassValue) {
	if(current.ClassValue == 1 && settings["class2_upgrade"]) return true;
	if(current.ClassValue == 2 && settings["class3_upgrade"]) return true;
	if(current.ClassValue == 3 && settings["class4_upgrade"]) return true;
}

// special POW splits
if (current.PowChecklist1 != old.PowChecklist1) {
	if(D.GrayFoxSaved && settings["gray_fox_saved"]) return true;
	if(D.MadnarSaved && settings["dr_madnar_saved"]) return true;
	if(D.EllenSaved && settings["ellen_saved"]) return true;
}

}

reset {
	if((current.BSState == 0) && (current.GameTime == 0) && (current.GameTime != old.GameTime))
	{
		return true;
	}

    if ( old.BSState == 5 || (current.BSState != 0 && current.BSState == 0)) {
		return true;
    }
}

onReset {
	vars.Rank = "";
	vars.Class = "";
	vars.SnakeYAxisHead = "";
	vars.SnakeYAxisFeet = "";
	vars.SnakeXAxis = "";
	vars.NGorNGP = "";
	vars.Location = "";
	vars.SubLocation = "";
	vars.Difficulty = "";
	vars.ActiveItem = "";
	vars.ActiveWeapon = "";
	vars.CalledBigBoss = false;
	vars.CalledDiane = false;
	vars.CalledSchneider = false;
	vars.CalledJennifer = false;
	vars.InventoryCompletion = "0 out of 24";
	vars.CodecCompletion = "0 out of 4";
	vars.WeaponsCompletion = "0 out of 8";
	vars.POWsCompletion = "0 out of 24";
	vars.BossesCompletion = "0 out of 10";
}