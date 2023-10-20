//emu-help tool created by jujstme - https://github.com/Jujstme

state("LiveSplit") {}

startup
{
	//Creates a persistent instance of the PS2 class (for PS2 emulators)
	//If you want to change it to another emulator type, change the "PS2" to say "PS1" if the splitter is for a PS1 Emu game
	Assembly.Load(File.ReadAllBytes("Components/emu-help-v2")).CreateInstance("PS2");
	
	//This allows is to look through a bitmask in order to get split information
	vars.bitCheck = new Func<byte, int, bool>((byte val, int b) => (val & (1 << b)) != 0);
	
	// You can look up for known IDs on https://psxdatacenter.com/
	vars.Helper.Load = (Func<dynamic, bool>)(emu => 
    {
		//Address of Gamecode (This can be multiple addresses in some cases but it seems this is all 1 for the Subsistence disks)
		emu.MakeString("Gamecode", 11, 0x20C0C8);		//SLES_820.43, SLUS_212.43, SLUS_213.59
		emu.MakeString("AniGamecode", 11, 0x20BEC8);	//SLPM_667.95
		emu.MakeString("JGamecode", 11, 0x20BE0C);		//SLPM_662.21
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the PAL (European Eng, Fr) Version of the game
        emu.Make<byte>("PEF_MGGameState", 0x2759B4);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the JPN (20th Anniversary) Version of the game
        emu.Make<byte>("JA_MGGameState", 0x2722E4);
		emu.Make<byte>("JA_MGLoad", 0x2722EC);
		//Weapon Ammo
		emu.Make<uint>("JA_MGMineAmmo", 0x2719D4);
		emu.Make<uint>("JA_MGExplAmmo", 0x2719D8);
		emu.Make<uint>("JA_MGRCAmmo", 0x2719DC);
		emu.Make<uint>("JA_MGHandAmmo", 0x2719E0);
		emu.Make<uint>("JA_MGSubAmmo", 0x2719E4);
		emu.Make<uint>("JA_MGRockAmmo", 0x2719E8);
		emu.Make<uint>("JA_MGGLAmmo", 0x2719EC);
		//Playthrough Info
		emu.Make<uint>("JA_MGIGT", 0x2719F0);
		emu.Make<uint>("JA_MGRation", 0x2719F4);
		emu.Make<uint>("JA_MGKills", 0x2719F8);
		emu.Make<uint>("JA_MGAlert", 0x2719FC);
		emu.Make<uint>("JA_MGSpecial", 0x271A00);
		emu.Make<uint>("JA_MGSave", 0x271A04);
		emu.Make<uint>("JA_MGContinue", 0x271A08);
		emu.Make<byte>("JA_MGDiff", 0x271AD4);
		//Items In Inventory Bits
		emu.Make<byte>("JA_MGEQ1", 0x271944);
		emu.Make<byte>("JA_MGEQ2", 0x271948);
		emu.Make<byte>("JA_MGEQ3", 0x27194C);
		emu.Make<byte>("JA_MGEQ4", 0x271950);
		emu.Make<byte>("JA_MGEQ5", 0x271954);
		//Rescued Prisoner Bits
		emu.Make<byte>("JA_MGPR1", 0x271958);
		emu.Make<byte>("JA_MGPR2", 0x27195C);
		emu.Make<byte>("JA_MGPR3", 0x271960);
		//Boss Kills
		emu.Make<byte>("JA_MGBO1", 0x271964);
		emu.Make<byte>("JA_MGBO2", 0x271968);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the NTSCU (American) Version of the game
		//Metal Gear Solid 3
		emu.Make<uint>("U_IGT", 0x1d5b38, 0x4C);
		emu.MakeString("U_Map", 5, 0x1d5b38, 0x24);
		emu.Make<byte>("U_Diff", 0x1d5b38, 0x06);
		emu.Make<uint>("U_KE1", 0x1d5b40, 0x242);
		emu.Make<uint>("U_KE2", 0x1d5b40, 0x243);
		emu.Make<uint>("U_KE3", 0x1d5b40, 0x244);
		emu.Make<uint>("U_KE4", 0x1d5b40, 0x245);
		emu.Make<uint>("U_KE5", 0x1d5b40, 0x246);
		emu.Make<uint>("U_KE6", 0x1d5b40, 0x247);
		emu.Make<uint>("U_KE7", 0x1d5b40, 0x248);
		emu.Make<uint>("U_KE8", 0x1d5b40, 0x249);
		emu.Make<uint>("U_KE9", 0x1d5b40, 0x24A);
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//Metal Gear
        emu.Make<byte>("U_MGGameState", 0x272C7C);
		emu.Make<byte>("U_MGLoad", 0x272C84);
		//Weapon Ammo
		emu.Make<uint>("U_MGMineAmmo", 0x27236C);
		emu.Make<uint>("U_MGExplAmmo", 0x272370);
		emu.Make<uint>("U_MGRCAmmo", 0x272374);
		emu.Make<uint>("U_MGHandAmmo", 0x272378);
		emu.Make<uint>("U_MGSubAmmo", 0x27237C);
		emu.Make<uint>("U_MGRockAmmo", 0x272380);
		emu.Make<uint>("U_MGGLAmmo", 0x272384);
		//Playthrough Info
		emu.Make<uint>("U_MGIGT", 0x272388);
		emu.Make<uint>("U_MGRation", 0x27238C);
		emu.Make<uint>("U_MGKills", 0x272390);
		emu.Make<uint>("U_MGAlert", 0x272394);
		emu.Make<uint>("U_MGSpecial", 0x272398);
		emu.Make<uint>("U_MGSave", 0x27239C);
		emu.Make<uint>("U_MGContinue", 0x2723A0);
		emu.Make<byte>("U_MGDiff", 0x27246C);
		//Items In Inventory Bits
		emu.Make<byte>("U_MGEQ1", 0x2722DC);
		emu.Make<byte>("U_MGEQ2", 0x2722E0);
		emu.Make<byte>("U_MGEQ3", 0x2722E4);
		emu.Make<byte>("U_MGEQ4", 0x2722E8);
		emu.Make<byte>("U_MGEQ5", 0x2722EC);
		//Rescued Prisoner Bits
		emu.Make<byte>("U_MGPR1", 0x2722F0);
		emu.Make<byte>("U_MGPR2", 0x2722F4);
		emu.Make<byte>("U_MGPR3", 0x2722F8);
		//Boss Kills
		emu.Make<byte>("U_MGBO1", 0x272324);
		emu.Make<byte>("U_MGBO2", 0x272328);
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("U_MG2GameState", 0x26AF94);
		//Playthrough Info
		emu.Make<uint>("U_MG2IGT", 0x26ADF0);
		emu.Make<uint>("U_MG2Ration", 0x26ADF4);
		emu.Make<uint>("U_MG2Kills", 0x26ADF8);
		emu.Make<uint>("U_MG2Alert", 0x26ADFC);
		emu.Make<uint>("U_MG2Special", 0x26AE00);
		emu.Make<uint>("U_MG2Save", 0x26AE04);
		emu.Make<uint>("U_MG2Continue", 0x26AE08);
		emu.Make<byte>("U_MG2Diff", 0x17A6BE4);
		//Items In Inventory Bits
		emu.Make<byte>("U_MG2EQ1", 0x17A6B80);
		emu.Make<byte>("U_MG2EQ2", 0x17A6B81);
		emu.Make<byte>("U_MG2EQ3", 0x17A6B84);
		emu.Make<byte>("U_MG2EQ4", 0x17A6B85);
		emu.Make<byte>("U_MG2EQ5", 0x17A6B86);
		emu.Make<byte>("U_MG2EQ6", 0x17A6B87);
		//Event Flags for Bosses
		emu.Make<byte>("U_MG2EV2", 0x26B361);
		emu.Make<byte>("U_MG2EV3", 0x26B362);
		emu.Make<byte>("U_MG2EV4", 0x26B363);
		emu.Make<byte>("U_MG2EV7", 0x26B366);
		emu.Make<byte>("U_MG2EV8", 0x26B367);
		emu.Make<byte>("U_MG2EV9", 0x26B368);
		emu.Make<byte>("U_MG2EV10", 0x26B369);
		emu.Make<byte>("U_MG2EV11", 0x26B36A);
		return true;
    });
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear variables we can make settings from
	vars.mgKeyID = new List<string>(){
	"MGEQ3_1", "MGEQ4_6", "MGEQ4_7", "MGEQ5_0", "MGEQ5_1", "MGEQ5_2", "MGEQ5_3", "EMGQ5_4"};
	
	vars.mgKeySet = new List<string>(){
	"Card 1", "Card 2", "Card 3", "Card 4", "Card 5", "Card 6", "Card 7", "Card 8"};
	
	vars.mgGunID = new List<string>(){
	"MGEQ3_6", "MGEQ3_3", "MGEQ3_4", "MGEQ3_5", "MGEQ4_2", "MGEQ3_7", "MGEQ4_1", "MGEQ4_0"};
	
	vars.mgGunSet = new List<string>(){
	"Handgun", "Land Mine", "Plastic Explosives", "RC Missiles", "Suppressor", "Submachine Gun", "Grenade Launcher", "Rocket Launcher"};
	
	vars.mgItemID = new List<string>(){
	"MGEQ1_2", "MGEQ1_3", "MGEQ1_5", "MGEQ1_6", "MGEQ1_7", "MGEQ2_0", "MGEQ2_1", "MGEQ2_2", "MGEQ2_3", "MGEQ2_4", "MGEQ2_5", "MGEQ2_6", "MGEQ2_7", "MGEQ3_0", "MGEQ4_5"};
	
	vars.mgItemSet = new List<string>(){
	"Flashlight", "Oxygen Cylinder", "Compass", "Binoculars", "Bomb Blast Suit", "Cardboard Box", "Infrared Goggles", 
	"Transmitter", "Enemy Uniform", "Antenna", "Mine Detector", "Parachute", "Gas Mask", "Antidote", "Body Armour"};
	
	vars.mgHostID = new List<string>(){
	"MGPR1_0", "MGPR1_1", "MGPR1_2", "MGPR1_3", "MGPR1_4", "MGPR1_5", "MGPR1_6", "MGPR1_7", "MGPR2_0", "MGPR2_1", "MGPR2_2", "MGPR2_3", 
	"MGPR2_4", "MGPR2_5", "MGPR2_6", "MGPR2_7", "MGPR3_0", "MGPR3_1", "MGPR3_2", "MGPR3_3", "MGPR3_4", "MGPR3_5", "MGPR3_6", "MGPR3_7"};
	
	vars.mgHostSet = new List<string>(){
	"Gray Fox (Bldg 1, B1)", "Dr. Madnar (Bldg 2, 2F) (After Saving Ellen)", "Ellen (Bldg 1, B1)", "Prisoner 1 (Bldg 1: 3F)", "Prisoner 2 (Bldg 1, 3F", "Prisoner 4 (Bldg 1, 3F)", 
	"Prisoner 3 (Bldg 1, 3F)", "Prisoner 5 (Bldg 1, 1F)", "Prisoner 6 (Bldg 1, 1F)", "Prisoner 7 (Bldg 1, 2F)", "Prisoner 8 (Bldg 1, 2F)", "Prisoner 9 (Bldg 1, 2F)", "Prisoner 10 (Bldg 1, Roof)",
	"Prisoner 11 (Bldg 1, 1F Courtyard)", "Prisoner 12 (Bldg 2, Roof)", "Prisoner 13 (Bldg 2, B1)", "Prisoner 14 (Bldg 2, B1)", "Prisoner 17 (Bldg 2, 2F)", "Prisoner 16 (Bldg 2 2F)",
	"Prisoner 15 (Bldg 2, 1F)", "Prisoner 18 (Bldg 3, 1F Dirty Duck))", "Prisoner 19 (Bldg 3, 1F Dirty Duck)", "Prisoner 20 (Bldg 3, 1F Dirty Duck)", "Prisoner 21 (Bldg 3, B100)"};
	 
	vars.mgBossID = new List<string>(){
	"MGBO1_2", "MGBO1_3", "MGBO1_4", "MGBO1_5", "MGBO1_6", "MGBO1_7", "MGBO2_0", "MGBO2_1", "MGBO2_2"};
	
	vars.mgBossSet = new List<string>(){
	"Shotmaker", "Machine Gun Kid", "Tank", "Bulldozer", "Hind", "Fire Trooper", "Dirty Duck", "Big Boss", "Metal Gear"};
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear 2: Solic Snake variables we can make settings from
	vars.mg2KeyID = new List<string>(){
	"MG2EQ5_1", "MG2EQ5_2", "MG2EQ5_3", "MG2EQ5_4", "MG2EQ5_5", "MG2EQ5_6", "MG2EQ5_7", "MG2EQ6_0", "MG2EQ6_1", "MG2EQ6_2", "MG2EQ6_3", "MG2EQ6_4"};
	
	vars.mg2KeySet = new List<string>(){
	"Card 1", "Card 2", "Card 3", "Card 4", "Card 5", "Card 6", "Card 7", "Card 8", "Card 9", "Red Card (1-3)", "Blue Card (4-6", "Green Card (7-9)"};
	
	vars.mg2GunID = new List<string>(){
	"MG2EQ1_0", "MG2EQ1_1", "MG2EQ1_2", "MG2EQ1_3", "MG2EQ1_4", "MG2EQ1_5", "MG2EQ1_6", "MG2EQ1_7", "MG2EQ2_0", "MG2EQ2_1", "MG2EQ2_2", "MG2EQ2_4"};
	
	vars.mg2GunSet = new List<string>(){
	"Handgun", "Submachine Gun", "Grenades", "Stinger Missiles", "RC Missiles", "Plastic Explosives", "Land Mines", "Camoflage Mat", "Gas Grenade", "Mouse", "Lighter", "Suppressor"};
	
	vars.mg2ItemID = new List<string>(){
	"MG2EQ3_2", "MG2EQ3_3", "MG2EQ3_4", "MG2EQ3_5", "MG2EQ3_6", "MG2EQ3_7", "MG2EQ4_0", "MG2EQ4_1", 
	"MG2EQ4_2", "MG2EQ4_3", "MG2EQ4_4", "MG2EQ4_5", "MG2EQ4_6", "MG2EQ4_7", "MG2EQ5_0", "MG2EQ6_5", "MG2EQ6_6"};
	
	vars.mg2ItemSet = new List<string>(){
	"Binoculars", "Night-Vision Goggles", "Infrared Goggles", "Gas Mask", "Body Armour", "Oxygen Tank", "Mine Detector", 
	"Hang Glider", "Cardboard Box", "Bucket", "Cold Medicine", "Cassette Tape", "Egg (Snake)", "Egg (Owl)", "Brooch", "Spray", "Cartridge"};
	
	vars.mg2BossID = new List<string>(){
	"MG2BEV2_1", "MG2BEV3_0", "MG2BEV3_5", "MG2BEV4_4", "MG2BEV7_3", "MG2BEV7_7", "MG2BEV8_7", "MG2BEV9_5", "MG2BEV10_4", "MG2BEV10_7", "MG2BEV11_2"};
	
	vars.mg2BossSet = new List<string>(){
	"Black Ninja", "Running Man", "Hind D", "Red Blaster", "Four Horsemen", "Jungle Evil", "Night Fright", "Drago Pettrovich Madnar", "Metal Gear D", "Gray Fox", "Big Boss"};
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear Solid 3 variable we can make settings from
	vars.mgs3AreaID = new List<string>(){
	"v001a", "v003a", "v004a", "v005a", "v006a", "v006b", "v007a", "s001a", "s002a", "s003a", "s004a", "s005a", "s006a", "s006b", "s012a", "s021a", "s022a", "s023a", "s031a",
	"s032a", "s032b", "s033a", "s041a", "s042a", "s043a", "s044a", "s045a", "s051a", "s051b", "s052a", "s052b", "s053a", "s055a", "s056a", "s061a", "s062a", "s063a", "s063b",
	"s064a", "s064b", "s065a", "s065b", "s066a", "s071a", "s072a", "s072b", "s073a", "s073b", "s074a", "s075a", "s081a", "s091a", "s091b", "s091c", "s092a", "s092b", "s092c",
	"s093a", "s093b", "s093c", "s094a", "s094b", "s094c", "s101a", "s101b", "s111a", "s112a", "s113a", "s121a", "s122a", "s141a", "s151a", "s152a", "s161a", "s162a", "s163a",
	"s163b", "s171a", "s171b", "s181a", "s182a", "s183a", "s191a", "s191b", "s192a", "s201a", "s211a"};
	
	vars.mgs3AreaSet = new List<string>(){
	"Dremuchij South (VM)", "Dremuchij Swampland (VM)", "Dremuchij North (VM)", "Dolinovodno (VM)", "Rassvet (VM)", "Rassvet - After Sokolov (VM)", "Dolinovodno Riverbank", "Dremuchij South",
	"Dremuchij East", "Dremuchij Swampland", "Dremuchij North", "Dolinovodno", "Rassvet", "Rassvet (after EVA)", "Chyornyj Prud", "Bolshaya Past South", "Bolshaya Past Base", "Bolshaya Past Crevice",
    "Chyornaya Peschera Cave Branch", "Chyornaya Peschera Cave", "Chyornaya Peschera Cave (The Pain fight)", "Chyornaya Peschera Cave Entrance", "Ponizovje South", "Ponizovje West",
	"Ponizovje Warehouse: Exterior", "Ponizovje Warehouse", "Svyatogornyj South", "Graniny Gorki South", "Graniny Gorki South (The Fear fight)", "Graniny Gorki Lab Exterior: Outside Walls",
	"Graniny Gorki Lab Exterior: Inside Walls", "Graniny Gorki Lab 1F", "Graniny Gorki Lab B1 East", "Graniny Gorki Lab B1 West", "Svyatogornyj West", "Svyatogornyj East", "Sokrovenno South",
    "Sokrovenno South (Ocelot Unit)", "Sokrovenno West", "Sokrovenno West (Ocelot Unit)", "Sokrovenno North", "Sokrovenno North (Ocelot Unit)", "Krasnogorje Tunnel", "Krasnogorje Mountain Base",
	"Krasnogorje Mountainside (Flying Platforms)", "Krasnogorje Mountainside (Hind)", "Krasnogorje Mountaintop", "Krasnogorje Mountaintop (Sunset)", "Krasnogorje Mountaintop Ruins",
    "Krasnogorje Mountaintop: Behind Ruins", "Groznyj Grad Underground Tunnel", "Groznyj Grad Southwest", "Groznyj Grad Southwest (After torture)", "Groznyj Grad Southwest (After waterfall)",
    "Groznyj Grad Northwest", "Groznyj Grad Northwest (After torture)", "Groznyj Grad Northwest (After waterfall)", "Groznyj Grad Northeast", "Groznyj Grad Northeast (After torture)",
    "Groznyj Grad Northeast (After waterfall)", "Groznyj Grad Southeast", "Groznyj Grad Southeast (After torture)", "Groznyj Grad Southeast (After waterfall)", "Groznyj Grad Weapons Lab: East Wing",
    "Groznyj Grad Weapons Lab: East Wing (After Raikov)", "Groznyj Grad Weapons Lab: West Wing Corridor", "Groznyj Grad Torture Room", "Groznyj Grad Sewers", "Groznyj Grad Weapons Lab: Main Wing",
    "Groznyj Grad Weapons Lab: Main Wing B1", "??? (The Sorrow fight)", "Tikhogornyj", "Tikhogornyj: Behind Waterfall", "Groznyj Grad", "Groznyj Grad Runway South", "Groznyj Grad Runway",
	"Groznyj Grad Runway (Shagohod chase)", "Groznyj Grad Rail Bridge", "Groznyj Grad Rail Bridge (Shagohod fight)", "Groznyj Grad Rail Bridge North", "Lazorevo South", "Lazorevo North",
    "Zaozyorje West", "Zaozyorje West (Pursuit)", "Zaozyorje East", "Rokovoj Bereg", "WIG: Interior"};
	
	vars.mgs3KeroID = new List<string>(){
	"KE1_1", "KE1_2", "KE1_3", "KE1_4", "KE1_5", "KE1_6", "KE1_7", "KE2_0", "KE2_1", "KE2_2", "KE2_3", "KE2_4", "KE2_5", "KE2_6", "KE2_7",
	"KE3_0", "KE3_1", "KE3_2", "KE3_3", "KE3_4", "KE3_5", "KE3_6", "KE3_7", "KE4_0", "KE4_1", "KE4_2", "KE4_3", "KE4_4", "KE4_5", "KE4_6", "KE4_7",
	"KE5_0", "KE5_1", "KE5_2", "KE5_3", "KE5_4", "KE5_5", "KE5_6", "KE5_7", "KE6_0", "KE6_1", "KE6_2", "KE6_3", "KE6_4", "KE6_5", "KE6_6", "KE6_7",
	"KE7_0", "KE7_1", "KE7_2", "KE7_3", "KE7_4", "KE7_5", "KE7_6", "KE7_7", "KE8_0", "KE8_1", "KE8_2", "KE8_3", "KE8_4", "KE8_5", "KE8_6", "KE8_7", "KE9_0"};
	
	vars.mgs3KeroSet = new List<string>(){
	"Dremuchij South (Vrtuous Mission)", "Dremuchij Swampland (Virtuous Mission)", "Dremuchij North (Virtuous Mission)", "Dolinovodno (Virtuous Mission)", "Rassvet (Virtuous Mission)", "Dremuchij South (Snake Eater)", 
	"Dremuchij East (Snake Eater)", "Dremuchij Swampland (Snake Eater)", "Dremuchij North (Snake Eater)", "Dolinovodno (Snake Eater)", "Rassvet (Snake Eater)", "Chornyj Prud", "Bolshaya Past South", "Bolshaya Past Base", 
	"Bolshaya Past Crevice", "Chyornaya Peschera Cave Branch", "Chyornaya Peschera Cave", "Chyornaya Peschera Cave Entrance", "Ponizovje South", "Ponizovje West", "Ponizovje Warehouse: Exterior", "Ponizovje Warehouse", 
	"Svyatogornyj South", "Graniny Gorki South", "Graniny Gorki Lab Exterior: Outside Walls", "Graniny Gorki Lab Exterior: Inside Walls", "Graniny Gorki Lab 1F", "Graniny Gorki Lab B1 (Cells)", "Graniny Gorki Lab B1 West", 
	"Svatogornyj West", "Svyatogornyj East 1F", "Sokrovenno South", "Sokrovenno West", "Sokrovenno North", "Krasnogorje Tunnel", "Krasnogorje Mountain Base", "Krasnogorje Mountainside", "Krasnogorje Mountaintop", 
	"Krasnogorje Mountaintop Ruins", "Krasnogorje Mountaintop: Behind Ruins", "Groznyj Grad Underground Tunnel", "Groznyj Grad Southwest", "Groznyj Grad Northwest", "Groznyj Grad Northeast", "Groznyj Grad Southeast", 
	"Groznyj Grad Weapons Lab: East Wing", "Groznyj Grad Weapons Lab: West Wing Corridor", "Groanyj Grad Torture Room", "Groznyj Grad Weapons Lab: Main Wing", "Groznyj Grad Weapons Lab: Main Wing B1", "Tikhogornyj", 
	"Tikhogornyj: Behind Waterfall", "Groznyj Grad (Bike Chase 1)", "Groznyj Grad Runway South (Bike Chase 2)", "Groznyj Grad Runway (Bike Chase 3)", "Groznyj Grad Runway (Bike Chase 4)", "Groznyj Grad Rail Bridge (C3 Sniping)",
	"Groznyj Grad Rail Bridge (Shagohod Battle)", "Groznyj Grad Rail Bridge North (Bike Chase 5)", "Lazorevo South (Bike Chase 6)", "Lazorevo North (Bike Chase 7)", "Zaozyorje West", "Zaozyorje East", "Rokov Bereg"};
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear Splits
	settings.Add("mg1", false, "Metal Gear Autosplitter");
	settings.CurrentDefaultParent = "mg1";
	settings.Add("MGItem", false, "Splits On Equipment & Weapons Entering Inventory");
	settings.CurrentDefaultParent = "MGItem";
	
	//Creates splits for Keycards
	settings.Add("MGKey", false, "Key Cards");
		settings.CurrentDefaultParent = "MGKey";
		for(int i = 0; i < 8; i++){
        	settings.Add("" + vars.mgKeyID[i].ToString(), false, "" + vars.mgKeySet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MGItem";
	
	//Creates splits for Weapons
	settings.Add("MGGun", false, "Weapons");
		settings.CurrentDefaultParent = "MGGun";
		for(int i = 0; i < 8; i++){
        	settings.Add("" + vars.mgGunID[i].ToString(), false, "" + vars.mgGunSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MGItem";
	
	//Creates splits for General Items
	settings.Add("MGItems", false, "General Items");
		settings.CurrentDefaultParent = "MGItems";
		for(int i = 0; i < 15; i++){
        	settings.Add("" + vars.mgItemID[i].ToString(), false, "" + vars.mgItemSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MGItem";
	settings.CurrentDefaultParent = "mg1";
	
	settings.Add("MGHost", false, "Splits On Saving Hostages");
		settings.CurrentDefaultParent = "MGHost";
		for(int i = 0; i < 24; i++){
        	settings.Add("" + vars.mgHostID[i].ToString(), false, "" + vars.mgHostSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mg1";
	
	settings.Add("MGBoss", false, "Splits On Boss Kills");
		settings.CurrentDefaultParent = "MGBoss";
		for(int i = 0; i < 9; i++){
        	settings.Add("" + vars.mgBossID[i].ToString(), false, "" + vars.mgBossSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mg1";
	
	settings.Add("End", true, "Final Split (Alway Active)");
	settings.CurrentDefaultParent = null;
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear 2: Solid Snake Splits
	settings.Add("mg2", false, "Metal Gear 2: Solid Snake Autosplitter");
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("MG2Item", false, "Splits On Equipment & Weapons Entering Inventory");
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Key", false, "Key Cards");
		settings.CurrentDefaultParent = "MG2Key";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.mg2KeyID[i].ToString(), false, "" + vars.mg2KeySet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Gun", false, "Weapons");
		settings.CurrentDefaultParent = "MG2Gun";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.mg2GunID[i].ToString(), false, "" + vars.mg2GunSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Items", false, "General Items");
		settings.CurrentDefaultParent = "MG2Items";
		for(int i = 0; i < 17; i++){
        	settings.Add("" + vars.mg2ItemID[i].ToString(), false, "" + vars.mg2ItemSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("MG2Boss", false, "Splits On Boss Kills");
		settings.CurrentDefaultParent = "MG2Boss";
		for(int i = 0; i < 11; i++){
        	settings.Add("" + vars.mg2BossID[i].ToString(), false, "" + vars.mg2BossSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("End2", true, "Final Split (Alway Active)");
	settings.CurrentDefaultParent = null;
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear Solid 3 Splits
	settings.Add("mgs3", false, "Metal Gear Solid 3 Autosplitter");
	settings.CurrentDefaultParent = "mgs3";
	
	settings.Add("Area", false, "Splits On Every Area Transition");
	settings.CurrentDefaultParent = "mgs3";
	
	settings.Add("Map", false, "Splits On Entering An Area For the First Time");
		settings.CurrentDefaultParent = "Map";
		for(int i = 0; i < 87; i++){
        	settings.Add("" + vars.mgs3AreaID[i].ToString(), false, "" + vars.mgs3AreaSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mgs3";
	
	settings.Add("Kero", false, "Splits On Shooting Specific Kerotin Frog");
		settings.CurrentDefaultParent = "Kero";
		for(int i = 0; i < 64; i++){
        	settings.Add("" + vars.mgs3KeroID[i].ToString(), false, "" + vars.mgs3KeroSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mgs3";

}

init
{
	//This is used for our splits
	vars.mgcompletedSplits = new bool[80];
	vars.mg2completedSplits = new bool[80];
	vars.mgs3completedSplits = new bool[86];
	vars.mgs3KeroSplits = new bool[71];
}

update
{
	//Checks what version you are on via the regional gamecode, then casts the correct information for that version
	if(current.Gamecode == "SLES_820.43"){

	}
	//US Subsistence Disc 2
	else if(current.Gamecode == "SLUS_212.43"){
		//Metal Gear
		current.MGGameState = current.U_MGGameState;
			
		current.MGMineAmmo = current.U_MGMineAmmo;
		current.MGExplAmmo = current.U_MGExplAmmo;
		current.MGRCAmmo = current.U_MGRCAmmo;
		current.MGHandAmmo = current.U_MGHandAmmo;
		current.MGSubAmmo = current.U_MGSubAmmo;
		current.MGRockAmmo = current.U_MGRockAmmo;
		current.MGGLAmmo = current.U_MGGLAmmo;
			
		current.MGIGT = current.U_MGIGT;
		current.MGRation = current.U_MGRation;
		current.MGKills = current.U_MGKills;
		current.MGAlert = current.U_MGAlert;
		current.MGSpecial = current.U_MGSpecial;
		current.MGSave = current.U_MGSave;
		current.MGContinue = current.U_MGContinue;
		current.MGDiff = current.U_MGDiff;
		current.MGLoad = current.U_MGLoad;
			
		current.MGEQ1 = current.U_MGEQ1;
		current.MGEQ2 = current.U_MGEQ2;
		current.MGEQ3 = current.U_MGEQ3;
		current.MGEQ4 = current.U_MGEQ4;
		current.MGEQ5 = current.U_MGEQ5;
		current.MGPR1 = current.U_MGPR1;
		current.MGPR2 = current.U_MGPR2;
		current.MGPR3 = current.U_MGPR3;
		current.MGBO1 = current.U_MGBO1;
		current.MGBO2 = current.U_MGBO2;
		
		//Metal Gear 2
		current.MG2GameState = current.U_MG2GameState;
	
		current.MG2IGT = current.U_MG2IGT;
		current.MG2Ration = current.U_MG2Ration;
		current.MG2Kills = current.U_MG2Kills;
		current.MG2Alert = current.U_MG2Alert;
		current.MG2Special = current.U_MG2Special;
		current.MG2Save = current.U_MG2Save;
		current.MG2Continue = current.U_MG2Continue;
		current.MG2Diff = current.U_MG2Diff;
			
		current.MG2EQ1 = current.U_MG2EQ1;
		current.MG2EQ2 = current.U_MG2EQ2;
		current.MG2EQ3 = current.U_MG2EQ3;
		current.MG2EQ4 = current.U_MG2EQ4;
		current.MG2EQ5 = current.U_MG2EQ5;
		current.MG2EQ6 = current.U_MG2EQ6;
		
		current.MG2EV2 = current.U_MG2EV2;
		current.MG2EV3 = current.U_MG2EV3;
		current.MG2EV4 = current.U_MG2EV4;
		current.MG2EV7 = current.U_MG2EV7;
		current.MG2EV8 = current.U_MG2EV8;
		current.MG2EV9 = current.U_MG2EV9;
		current.MG2EV10 = current.U_MG2EV10;
		current.MG2EV11 = current.U_MG2EV11;
	}
	
	//JPN 20th Anniversary Disc 2
	else if(current.AniGamecode == "SLPM_667.95"){
		current.GameState = current.JA_MGGameState;
		
		current.MineAmmo = current.JA_MGMineAmmo;
		current.ExplAmmo = current.JA_MGExplAmmo;
		current.RCAmmo = current.JA_MGRCAmmo;
		current.HandAmmo = current.JA_MGHandAmmo;
		current.SubAmmo = current.JA_MGSubAmmo;
		current.RockAmmo = current.JA_MGRockAmmo;
		current.GLAmmo = current.JA_MGGLAmmo;
		
		current.IGT = current.JA_MGIGT;
		current.Ration = current.JA_MGRation;
		current.Kills = current.JA_MGKills;
		current.Alert = current.JA_MGAlert;
		current.Special = current.JA_MGSpecial;
		current.Save = current.JA_MGSave;
		current.Continue = current.JA_MGContinue;
		current.Diff = current.JA_MGDiff;
		current.Load = current.JA_MGLoad;
		
		current.EQ1 = current.JA_MGEQ1;
		current.EQ2 = current.JA_MGEQ2;
		current.EQ3 = current.JA_MGEQ3;
		current.EQ4 = current.JA_MGEQ4;
		current.EQ5 = current.JA_MGEQ5;
		current.PR1 = current.JA_MGPR1;
		current.PR2 = current.JA_MGPR2;
		current.PR3 = current.JA_MGPR3;
		current.BO1 = current.JA_MGBO1;
		current.BO2 = current.JA_MGBO2;
	}
	
	//US Subsistence Disc 2
	else if(current.Gamecode == "SLUS_213.59"){
		current.IGT = current.U_IGT;
		current.Map = current.U_Map;
		
		current.KE1 = current.U_KE1;
		current.KE2 = current.U_KE2;
		current.KE3 = current.U_KE3;
		current.KE4 = current.U_KE4;
		current.KE5 = current.U_KE5;
		current.KE6 = current.U_KE6;
		current.KE7 = current.U_KE7;
		current.KE8 = current.U_KE8;
		current.KE9 = current.U_KE9;
	}
}

onStart
{
	//resets the splits bools when a new run starts
	vars.mgcompletedSplits = new bool[80];
	vars.mg2completedSplits = new bool[112];
	vars.mgs3AreaSplits = new bool[86];
	vars.mgs3KeroSplits = new bool[71];
}

start
{
	if(settings["mg1"]){
		return current.MGGameState != 10 && old.MGGameState == 10 && current.MGIGT > old.MGIGT;
	}
	
	if(settings["mg1"]){
		return current.MG2GameState != 8 && old.MG2GameState == 8 && current.MG2IGT > old.MG2IGT;
	}
	
	if(settings["mgs3"]){
		return current.Map == "v000a" && current.IGT > old.IGT;;
	}
}

split
{
	//Metal Gear 1 Splits
	//Iterates through our splits and checks the bitmask for each one
	if(settings["mg1"]){
		for(int i = 0; i < 8; i++){
			if(settings["MGEQ1_" + i] && vars.bitCheck(current.MGEQ1, i) && !vars.mgcompletedSplits[0 + i]){
				return vars.mgcompletedSplits[0 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGEQ2_" + i] && vars.bitCheck(current.MGEQ2, i) && !vars.mgcompletedSplits[8 + i]){
				return vars.mgcompletedSplits[8 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGEQ3_" + i] && vars.bitCheck(current.MGEQ3, i) && !vars.mgcompletedSplits[16 + i]){
				return vars.mgcompletedSplits[16 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGEQ4_" + i] && vars.bitCheck(current.MGEQ4, i) && !vars.mgcompletedSplits[24 + i]){
				return vars.mgcompletedSplits[24 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGEQ5_" + i] && vars.bitCheck(current.MGEQ5, i) && !vars.mgcompletedSplits[32 + i]){
				return vars.mgcompletedSplits[32 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGPR1_" + i] && vars.bitCheck(current.MGPR1, i) && !vars.mgcompletedSplits[40 + i]){
				return vars.mgcompletedSplits[40 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGPR2_" + i] && vars.bitCheck(current.MGPR2, i) && !vars.mgcompletedSplits[48 + i]){
				return vars.mgcompletedSplits[48 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGPR3_" + i] && vars.bitCheck(current.MGPR3, i) && !vars.mgcompletedSplits[56 + i]){
				return vars.mgcompletedSplits[56 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGBO1_" + i] && vars.bitCheck(current.MGBO1, i) && !vars.mgcompletedSplits[64 + i]){
				return vars.mgcompletedSplits[64 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MGBO2_" + i] && vars.bitCheck(current.MGBO2, i) && !vars.mgcompletedSplits[72 + i]){
				return vars.mgcompletedSplits[72 + i]  = true;
			}
		}
		
		//Final Split On Results Screen
		if(current.MGGameState == 21 && current.MGLoad == 0 && old.MGLoad == 1 && !vars.mgcompletedSplits[80])		{return vars.mgcompletedSplits[80]  = true;}
	}
	
	//Metal Gear 2: Solid Snake Splits
	if(settings["mg2"]){
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ1_" + i] && vars.bitCheck(current.MG2EQ1, i) && !vars.mg2completedSplits[0 + i]){
				return vars.mg2completedSplits[0 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ2_" + i] && vars.bitCheck(current.MG2EQ2, i) && !vars.mg2completedSplits[8 + i]){
				return vars.mg2completedSplits[8 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ3_" + i] && vars.bitCheck(current.MG2EQ3, i) && !vars.mg2completedSplits[16 + i]){
				return vars.mg2completedSplits[16 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ4_" + i] && vars.bitCheck(current.MG2EQ4, i) && !vars.mg2completedSplits[24 + i]){
				return vars.mg2completedSplits[24 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ5_" + i] && vars.bitCheck(current.MG2EQ5, i) && !vars.mg2completedSplits[32 + i]){
				return vars.mg2completedSplits[32 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ6_" + i] && vars.bitCheck(current.MG2EQ6, i) && !vars.mg2completedSplits[40 + i]){
				return vars.mg2completedSplits[40 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV2_" + i] && vars.bitCheck(current.MG2EV2, i) && !vars.mg2completedSplits[48 + i]){
				return vars.mg2completedSplits[48 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV3_" + i] && vars.bitCheck(current.MG2EV3, i) && !vars.mg2completedSplits[56 + i]){
				return vars.mg2completedSplits[56 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV4_" + i] && vars.bitCheck(current.MG2EV4, i) && !vars.mg2completedSplits[64 + i]){
				return vars.mg2completedSplits[64 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV7_" + i] && vars.bitCheck(current.MG2EV7, i) && !vars.mg2completedSplits[72 + i]){
				return vars.mg2completedSplits[72 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV8_" + i] && vars.bitCheck(current.MG2EV8, i) && !vars.mg2completedSplits[80 + i]){
				return vars.mg2completedSplits[80 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV9_" + i] && vars.bitCheck(current.MG2EV9, i) && !vars.mg2completedSplits[88 + i]){
				return vars.mg2completedSplits[88 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV10_" + i] && vars.bitCheck(current.MG2EV10, i) && !vars.mg2completedSplits[96 + i]){
				return vars.mg2completedSplits[96 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV11_" + i] && vars.bitCheck(current.MG2EV11, i) && !vars.mg2completedSplits[104 + i]){
				return vars.mg2completedSplits[104 + i]  = true;
			}
		}
		
		if(current.MG2GameState == 24 && old.MG2GameState != 24 && !vars.mgcompletedSplits[112])		{return vars.mgcompletedSplits[112]  = true;}
	}
	
	//Metal Gear Solid 3 Splits
	if(settings["mgs3"]){
		if(settings["Area"]){
			return current.Map != old.Map && vars.mgs3AreaID.Contains(current.Map);
		}
		
		if(settings["Map"]){
			for(int i = 0; i < 87; i++){
				if(settings["" + current.Map] && !vars.mgs3AreaSplits[0 + i]){
					return vars.mgs3AreaSplits[0 + i]  = true;;
				}
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE1_" + i] && vars.bitCheck(current.KE1, i) && !vars.mgs3KeroSplits[0 + i]){
				return vars.mgs3KeroSplits[0 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE2_" + i] && vars.bitCheck(current.KE2, i) && !vars.mgs3KeroSplits[8 + i]){
				return vars.mgs3KeroSplits[8 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE3_" + i] && vars.bitCheck(current.KE3, i) && !vars.mgs3KeroSplits[16 + i]){
				return vars.mgs3KeroSplits[16 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE4_" + i] && vars.bitCheck(current.KE4, i) && !vars.mgs3KeroSplits[24 + i]){
				return vars.mgs3KeroSplits[24 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE5_" + i] && vars.bitCheck(current.KE5, i) && !vars.mgs3KeroSplits[32 + i]){
				return vars.mgs3KeroSplits[32 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE6_" + i] && vars.bitCheck(current.KE6, i) && !vars.mgs3KeroSplits[40 + i]){
				return vars.mgs3KeroSplits[40 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE7_" + i] && vars.bitCheck(current.KE7, i) && !vars.mgs3KeroSplits[48 + i]){
				return vars.mgs3KeroSplits[48 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE8_" + i] && vars.bitCheck(current.KE8, i) && !vars.mgs3KeroSplits[56 + i]){
				return vars.mgs3KeroSplits[56 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["KE9_" + i] && vars.bitCheck(current.KE9, i) && !vars.mgs3KeroSplits[64 + i]){
				return vars.mgs3KeroSplits[64 + i]  = true;
			}
		}
	}
}

gameTime
{
	//Sets the game time address depending on what setting is enabled
	if(settings["mg1"]){
	//Game Time is 15fps so divide by 15
	return TimeSpan.FromSeconds(current.MGIGT / 15.0);
	}
	
	if(settings["mgs3"]){
	return TimeSpan.FromSeconds(current.IGT / 60.0);
	}
	
	if(settings["mg2"]){
	//Game Time is 15fps so divide by 15
	return TimeSpan.FromSeconds(current.MG2IGT / 15.0);
	}
}

isLoading
{
	return true;
}

reset
{
	if(settings["mg1"]){
		return current.MGGameState != 10 && old.MGGameState == 10;
	}
	
	if(settings["mg2"]){
		return current.MG2GameState != 8 && old.MG2GameState == 8;
	}
	
	if(settings["mgs3"]){
		return current.Map == "title" && old.Map != "title";
	}
}
