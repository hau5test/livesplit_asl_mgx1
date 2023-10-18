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
		emu.MakeString("Gamecode", 11, 0x20C0C8);		//SLES_820.43, SLUS_212.43
		emu.MakeString("AniGamecode", 11, 0x20BEC8);	//SLPM_667.95
		
		//These are for the PAL (European Eng, Fr) Version of the game
        emu.Make<byte>("PEF_GameState", 0x2759B4);
		
		
		//These are for the JPN (20th Anniversary) Version of the game
        emu.Make<byte>("JA_GameState", 0x2722E4);
		emu.Make<byte>("JA_Load", 0x2722EC);
		//Weapon Ammo
		emu.Make<uint>("JA_MineAmmo", 0x2719D4);
		emu.Make<uint>("JA_ExplAmmo", 0x2719D8);
		emu.Make<uint>("JA_RCAmmo", 0x2719DC);
		emu.Make<uint>("JA_HandAmmo", 0x2719E0);
		emu.Make<uint>("JA_SubAmmo", 0x2719E4);
		emu.Make<uint>("JA_RockAmmo", 0x2719E8);
		emu.Make<uint>("JA_GLAmmo", 0x2719EC);
		//Playthrough Info
		emu.Make<uint>("JA_IGT", 0x2719F0);
		emu.Make<uint>("JA_Ration", 0x2719F4);
		emu.Make<uint>("JA_Kills", 0x2719F8);
		emu.Make<uint>("JA_Alert", 0x2719FC);
		emu.Make<uint>("JA_Special", 0x271A00);
		emu.Make<uint>("JA_Save", 0x271A04);
		emu.Make<uint>("JA_Continue", 0x271A08);
		emu.Make<byte>("JA_Diff", 0x271AD4);
		//Items In Inventory Bits
		emu.Make<byte>("JA_EQ1", 0x271944);
		emu.Make<byte>("JA_EQ2", 0x271948);
		emu.Make<byte>("JA_EQ3", 0x27194C);
		emu.Make<byte>("JA_EQ4", 0x271950);
		emu.Make<byte>("JA_EQ5", 0x271954);
		//Rescued Prisoner Bits
		emu.Make<byte>("JA_PR1", 0x271958);
		emu.Make<byte>("JA_PR2", 0x27195C);
		emu.Make<byte>("JA_PR3", 0x271960);
		//Boss Kills
		emu.Make<byte>("JA_BO1", 0x271964);
		emu.Make<byte>("JA_BO2", 0x271968);
		
		
		//These are for the NTSCU (American) Version of the game
        emu.Make<byte>("U_GameState", 0x272C7C);
		emu.Make<byte>("U_Load", 0x272C84);
		//Weapon Ammo
		emu.Make<uint>("U_MineAmmo", 0x27236C);
		emu.Make<uint>("U_ExplAmmo", 0x272370);
		emu.Make<uint>("U_RCAmmo", 0x272374);
		emu.Make<uint>("U_HandAmmo", 0x272378);
		emu.Make<uint>("U_SubAmmo", 0x27237C);
		emu.Make<uint>("U_RockAmmo", 0x272380);
		emu.Make<uint>("U_GLAmmo", 0x272384);
		//Playthrough Info
		emu.Make<uint>("U_IGT", 0x272388);
		emu.Make<uint>("U_Ration", 0x27238C);
		emu.Make<uint>("U_Kills", 0x272390);
		emu.Make<uint>("U_Alert", 0x272394);
		emu.Make<uint>("U_Special", 0x272398);
		emu.Make<uint>("U_Save", 0x27239C);
		emu.Make<uint>("U_Continue", 0x2723A0);
		emu.Make<byte>("U_Diff", 0x27246C);
		//Items In Inventory Bits
		emu.Make<byte>("U_EQ1", 0x2722DC);
		emu.Make<byte>("U_EQ2", 0x2722E0);
		emu.Make<byte>("U_EQ3", 0x2722E4);
		emu.Make<byte>("U_EQ4", 0x2722E8);
		emu.Make<byte>("U_EQ5", 0x2722EC);
		//Rescued Prisoner Bits
		emu.Make<byte>("U_PR1", 0x2722F0);
		emu.Make<byte>("U_PR2", 0x2722F4);
		emu.Make<byte>("U_PR3", 0x2722F8);
		//Boss Kills
		emu.Make<byte>("U_BO1", 0x272324);
		emu.Make<byte>("U_BO2", 0x272328);
		return true;
    });
	
	settings.Add("Item", false, "Splits On Equipment & Weapons Entering Inventory");
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Key", false, "Key Cards");
	settings.CurrentDefaultParent = "Key";
	settings.Add("EQ3_1", false, "Card 1");
	settings.Add("EQ4_6", false, "Card 2");
	settings.Add("EQ4_7", false, "Card 3");
	settings.Add("EQ5_0", false, "Card 4");
	settings.Add("EQ5_1", false, "Card 5");
	settings.Add("EQ5_2", false, "Card 6");
	settings.Add("EQ5_3", false, "Card 7");
	settings.Add("EQ5_4", false, "Card 8");
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Gun", false, "Weapons");
	settings.CurrentDefaultParent = "Gun";
	settings.Add("EQ3_6", false, "Handgun");
	settings.Add("EQ3_3", false, "Land Mine");
	settings.Add("EQ3_4", false, "Plastic Explosives");
	settings.Add("EQ3_5", false, "RC Missiles");
	settings.Add("EQ4_2", false, "Suppressor");
	settings.Add("EQ3_7", false, "Submachine Gun");
	settings.Add("EQ4_1", false, "Grenade Launcher");
	settings.Add("EQ4_0", false, "Rocket Launcher");
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Items", false, "Items");
	settings.CurrentDefaultParent = "Items";
	settings.Add("EQ1_2", false, "Flashlight");
	settings.Add("EQ1_3", false, "Oxygen Cylinder");
	settings.Add("EQ1_5", false, "Compass");
	settings.Add("EQ1_6", false, "Binoculars");
	settings.Add("EQ1_7", false, "Bomb Blast Suit");
	settings.Add("EQ2_0", false, "Cardboard Box");
	settings.Add("EQ2_1", false, "Infrared Goggles");
	settings.Add("EQ2_2", false, "Transmitter");
	settings.Add("EQ2_3", false, "Enemy Uniform");
	settings.Add("EQ2_4", false, "Antenna");
	settings.Add("EQ2_5", false, "Mine Detector");
	settings.Add("EQ2_6", false, "Parachute");
	settings.Add("EQ2_7", false, "Gas Mask");
	settings.Add("EQ3_0", false, "Antidote");
	settings.Add("EQ4_5", false, "Body Armour");
	settings.CurrentDefaultParent = "Item";
	settings.CurrentDefaultParent = null;
	
	settings.Add("Hostage", false, "Splits On Hostage Rescues");
	settings.CurrentDefaultParent = "Hostage";
	settings.Add("PR1_0", false, "Gray Fox (Bldg 1, B1)");
	settings.Add("PR1_1", false, "Dr. Madnar (Bldg 2, 2F) (After Saving Ellen)");
	settings.Add("PR1_2", false, "Ellen (Bldg 1, B1)");
	settings.Add("PR1_3", false, "Prisoner 1 (Bldg 1: 3F)");
	settings.Add("PR1_4", false, "Prisoner 2 (Bldg 1, 3F)");
	settings.Add("PR1_5", false, "Prisoner 4 (Bldg 1, 3F)");
	settings.Add("PR1_6", false, "Prisoner 3 (Bldg 1, 3F)");
	settings.Add("PR1_7", false, "Prisoner 5 (Bldg 1, 1F)");
	settings.Add("PR2_0", false, "Prisoner 6 (Bldg 1, 1F)");
	settings.Add("PR2_1", false, "Prisoner 7 (Bldg 1, 2F)");
	settings.Add("PR2_2", false, "Prisoner 8 (Bldg 1, 2F)");
	settings.Add("PR2_3", false, "Prisoner 9 (Bldg 1, 2F)");
	settings.Add("PR2_4", false, "Prisoner 10 (Bldg 1, Roof)");
	settings.Add("PR2_5", false, "Prisoner 11 (Bldg 1, 1F Courtyard)");
	settings.Add("PR2_6", false, "Prisoner 12 (Bldg 2, Roof)");
	settings.Add("PR2_7", false, "Prisoner 13 (Bldg 2, B1)");
	settings.Add("PR3_0", false, "Prisoner 14 (Bldg 2, B1)");
	settings.Add("PR3_1", false, "Prisoner 17 (Bldg 2, 2F)");
	settings.Add("PR3_2", false, "Prisoner 16 (Bldg 2 2F)");
	settings.Add("PR3_3", false, "Prisoner 15 (Bldg 2, 1F)");
	settings.Add("PR3_4", false, "Prisoner 18 (Bldg 3, 1F Dirty Duck))");
	settings.Add("PR3_5", false, "Prisoner 19 (Bldg 3, 1F Dirty Duck)");
	settings.Add("PR3_6", false, "Prisoner 20 (Bldg 3, 1F Dirty Duck)");
	settings.Add("PR3_7", false, "Prisoner 21 (Bldg 3, B100)");
	settings.CurrentDefaultParent = null;
	
	settings.Add("Boss", false, "Splits On Boss Kills");
	settings.CurrentDefaultParent = "Boss";
	settings.Add("BO1_2", false, "Shotmaker");
	settings.Add("BO1_3", false, "Machine Gun Kid");
	settings.Add("BO1_4", false, "Tank");
	settings.Add("BO1_5", false, "Bulldozer");
	settings.Add("BO1_6", false, "Hind");
	settings.Add("BO1_7", false, "Fire Trooper");
	settings.Add("BO2_0", false, "Dirty Duck");
	settings.Add("BO2_1", false, "Big Boss");
	settings.Add("BO2_2", false, "Metal Gear");
	settings.CurrentDefaultParent = null;
	
	settings.Add("End", true, "Final Split (Always Active)");
}

init
{
	//This is used for our splits
	vars.completedSplits = new bool[64];
}

update
{
	//Checks what version you are on via the regional gamecode, then casts the correct information for that version
	if(current.Gamecode == "SLES_820.43"){

	}
	else if(current.Gamecode == "SLUS_212.43"){
		current.GameState = current.U_GameState;
		
		current.MineAmmo = current.U_MineAmmo;
		current.ExplAmmo = current.U_ExplAmmo;
		current.RCAmmo = current.U_RCAmmo;
		current.HandAmmo = current.U_HandAmmo;
		current.SubAmmo = current.U_SubAmmo;
		current.RockAmmo = current.U_RockAmmo;
		current.GLAmmo = current.U_GLAmmo;
		
		current.IGT = current.U_IGT;
		current.Ration = current.U_Ration;
		current.Kills = current.U_Kills;
		current.Alert = current.U_Alert;
		current.Special = current.U_Special;
		current.Save = current.U_Save;
		current.Continue = current.U_Continue;
		current.Diff = current.U_Diff;
		current.Load = current.U_Load;
		
		current.EQ1 = current.U_EQ1;
		current.EQ2 = current.U_EQ2;
		current.EQ3 = current.U_EQ3;
		current.EQ4 = current.U_EQ4;
		current.EQ5 = current.U_EQ5;
		current.PR1 = current.U_PR1;
		current.PR2 = current.U_PR2;
		current.PR3 = current.U_PR3;
		current.BO1 = current.U_BO1;
		current.BO2 = current.U_BO2;
	}
	else if(current.AniGamecode == "SLPM_667.95"){
		current.GameState = current.JA_GameState;
		
		current.MineAmmo = current.JA_MineAmmo;
		current.ExplAmmo = current.JA_ExplAmmo;
		current.RCAmmo = current.JA_RCAmmo;
		current.HandAmmo = current.JA_HandAmmo;
		current.SubAmmo = current.JA_SubAmmo;
		current.RockAmmo = current.JA_RockAmmo;
		current.GLAmmo = current.JA_GLAmmo;
		
		current.IGT = current.JA_IGT;
		current.Ration = current.JA_Ration;
		current.Kills = current.JA_Kills;
		current.Alert = current.JA_Alert;
		current.Special = current.JA_Special;
		current.Save = current.JA_Save;
		current.Continue = current.JA_Continue;
		current.Diff = current.JA_Diff;
		current.Load = current.JA_Load;
		
		current.EQ1 = current.JA_EQ1;
		current.EQ2 = current.JA_EQ2;
		current.EQ3 = current.JA_EQ3;
		current.EQ4 = current.JA_EQ4;
		current.EQ5 = current.JA_EQ5;
		current.PR1 = current.JA_PR1;
		current.PR2 = current.JA_PR2;
		current.PR3 = current.JA_PR3;
		current.BO1 = current.JA_BO1;
		current.BO2 = current.JA_BO2;
	}
}

onStart
{
	//resets the splits bools when a new run starts
	vars.completedSplits = new bool[64];
}

start
{
	return current.GameState != 10 && old.GameState == 10 && current.IGT > old.IGT;
}

split
{
	//Key Cards
	if (settings["EQ3_1"] && vars.bitCheck(current.EQ3, 1) && !vars.completedSplits[0])		{return vars.completedSplits[0]  = true;}
	if (settings["EQ4_6"] && vars.bitCheck(current.EQ4, 6) && !vars.completedSplits[1])		{return vars.completedSplits[1]  = true;}
	if (settings["EQ4_7"] && vars.bitCheck(current.EQ4, 7) && !vars.completedSplits[2])		{return vars.completedSplits[2]  = true;}
	if (settings["EQ5_0"] && vars.bitCheck(current.EQ5, 0) && !vars.completedSplits[3])		{return vars.completedSplits[3]  = true;}
	if (settings["EQ5_1"] && vars.bitCheck(current.EQ5, 1) && !vars.completedSplits[4])		{return vars.completedSplits[4]  = true;}
	if (settings["EQ5_2"] && vars.bitCheck(current.EQ5, 2) && !vars.completedSplits[5])		{return vars.completedSplits[5]  = true;}
	if (settings["EQ5_3"] && vars.bitCheck(current.EQ5, 3) && !vars.completedSplits[6])		{return vars.completedSplits[6]  = true;}
	if (settings["EQ5_4"] && vars.bitCheck(current.EQ5, 4) && !vars.completedSplits[7])		{return vars.completedSplits[7]  = true;}
	//Weapons
	if (settings["EQ3_6"] && vars.bitCheck(current.EQ3, 6) && !vars.completedSplits[8])		{return vars.completedSplits[8]  = true;}
	if (settings["EQ3_7"] && vars.bitCheck(current.EQ3, 7) && !vars.completedSplits[9])		{return vars.completedSplits[9]  = true;}
	if (settings["EQ4_1"] && vars.bitCheck(current.EQ4, 1) && !vars.completedSplits[10])		{return vars.completedSplits[10]  = true;}
	if (settings["EQ4_0"] && vars.bitCheck(current.EQ4, 0) && !vars.completedSplits[11])		{return vars.completedSplits[11]  = true;}
	if (settings["EQ4_2"] && vars.bitCheck(current.EQ4, 2) && !vars.completedSplits[26])		{return vars.completedSplits[26]  = true;}
	if (settings["EQ3_3"] && vars.bitCheck(current.EQ3, 3) && !vars.completedSplits[62])		{return vars.completedSplits[62]  = true;}
	if (settings["EQ3_4"] && vars.bitCheck(current.EQ3, 4) && !vars.completedSplits[63])		{return vars.completedSplits[63]  = true;}
	if (settings["EQ3_5"] && vars.bitCheck(current.EQ3, 5) && !vars.completedSplits[64])		{return vars.completedSplits[64]  = true;}
	//Misc Items
	if (settings["EQ1_2"] && vars.bitCheck(current.EQ1, 2) && !vars.completedSplits[12])		{return vars.completedSplits[12]  = true;}
	if (settings["EQ1_3"] && vars.bitCheck(current.EQ1, 3) && !vars.completedSplits[13])		{return vars.completedSplits[13]  = true;}
	if (settings["EQ1_5"] && vars.bitCheck(current.EQ1, 5) && !vars.completedSplits[14])		{return vars.completedSplits[14]  = true;}
	if (settings["EQ1_6"] && vars.bitCheck(current.EQ1, 6) && !vars.completedSplits[15])		{return vars.completedSplits[15]  = true;}
	if (settings["EQ1_7"] && vars.bitCheck(current.EQ1, 7) && !vars.completedSplits[16])		{return vars.completedSplits[16]  = true;}
	if (settings["EQ2_0"] && vars.bitCheck(current.EQ2, 0) && !vars.completedSplits[17])		{return vars.completedSplits[17]  = true;}
	if (settings["EQ2_1"] && vars.bitCheck(current.EQ2, 1) && !vars.completedSplits[18])		{return vars.completedSplits[18]  = true;}
	if (settings["EQ2_2"] && vars.bitCheck(current.EQ2, 2) && !vars.completedSplits[19])		{return vars.completedSplits[19]  = true;}
	if (settings["EQ2_3"] && vars.bitCheck(current.EQ2, 3) && !vars.completedSplits[20])		{return vars.completedSplits[20]  = true;}
	if (settings["EQ2_4"] && vars.bitCheck(current.EQ2, 4) && !vars.completedSplits[21])		{return vars.completedSplits[21]  = true;}
	if (settings["EQ2_5"] && vars.bitCheck(current.EQ2, 5) && !vars.completedSplits[22])		{return vars.completedSplits[22]  = true;}
	if (settings["EQ2_6"] && vars.bitCheck(current.EQ2, 6) && !vars.completedSplits[23])		{return vars.completedSplits[23]  = true;}
	if (settings["EQ2_7"] && vars.bitCheck(current.EQ2, 7) && !vars.completedSplits[24])		{return vars.completedSplits[24]  = true;}
	if (settings["EQ3_0"] && vars.bitCheck(current.EQ3, 0) && !vars.completedSplits[25])		{return vars.completedSplits[25]  = true;}
	if (settings["EQ4_5"] && vars.bitCheck(current.EQ4, 5) && !vars.completedSplits[27])		{return vars.completedSplits[27]  = true;}
	//Prisoners
	if (settings["PR1_0"] && vars.bitCheck(current.PR1, 0) && !vars.completedSplits[28])		{return vars.completedSplits[28]  = true;}
	if (settings["PR1_1"] && vars.bitCheck(current.PR1, 1) && vars.bitCheck(current.PR1, 2) && !vars.completedSplits[29])		{return vars.completedSplits[29]  = true;}
	if (settings["PR1_2"] && vars.bitCheck(current.PR1, 2) && !vars.completedSplits[30])		{return vars.completedSplits[30]  = true;}
	if (settings["PR1_3"] && vars.bitCheck(current.PR1, 3) && !vars.completedSplits[31])		{return vars.completedSplits[31]  = true;}
	if (settings["PR1_4"] && vars.bitCheck(current.PR1, 4) && !vars.completedSplits[32])		{return vars.completedSplits[32]  = true;}
	if (settings["PR1_5"] && vars.bitCheck(current.PR1, 5) && !vars.completedSplits[33])		{return vars.completedSplits[33]  = true;}
	if (settings["PR1_6"] && vars.bitCheck(current.PR1, 6) && !vars.completedSplits[34])		{return vars.completedSplits[34]  = true;}
	if (settings["PR1_7"] && vars.bitCheck(current.PR1, 7) && !vars.completedSplits[35])		{return vars.completedSplits[35]  = true;}
	if (settings["PR2_0"] && vars.bitCheck(current.PR2, 0) && !vars.completedSplits[36])		{return vars.completedSplits[36]  = true;}
	if (settings["PR2_1"] && vars.bitCheck(current.PR2, 1) && !vars.completedSplits[37])		{return vars.completedSplits[37]  = true;}
	if (settings["PR2_2"] && vars.bitCheck(current.PR2, 2) && !vars.completedSplits[38])		{return vars.completedSplits[38]  = true;}
	if (settings["PR2_3"] && vars.bitCheck(current.PR2, 3) && !vars.completedSplits[39])		{return vars.completedSplits[39]  = true;}
	if (settings["PR2_4"] && vars.bitCheck(current.PR2, 4) && !vars.completedSplits[40])		{return vars.completedSplits[40]  = true;}
	if (settings["PR2_5"] && vars.bitCheck(current.PR2, 5) && !vars.completedSplits[41])		{return vars.completedSplits[41]  = true;}
	if (settings["PR2_6"] && vars.bitCheck(current.PR2, 6) && !vars.completedSplits[42])		{return vars.completedSplits[42]  = true;}
	if (settings["PR2_7"] && vars.bitCheck(current.PR2, 7) && !vars.completedSplits[43])		{return vars.completedSplits[43]  = true;}
	if (settings["PR3_0"] && vars.bitCheck(current.PR3, 0) && !vars.completedSplits[44])		{return vars.completedSplits[44]  = true;}
	if (settings["PR3_1"] && vars.bitCheck(current.PR3, 1) && !vars.completedSplits[45])		{return vars.completedSplits[45]  = true;}
	if (settings["PR3_2"] && vars.bitCheck(current.PR3, 2) && !vars.completedSplits[46])		{return vars.completedSplits[46]  = true;}
	if (settings["PR3_3"] && vars.bitCheck(current.PR3, 3) && !vars.completedSplits[47])		{return vars.completedSplits[47]  = true;}
	if (settings["PR3_4"] && vars.bitCheck(current.PR3, 4) && !vars.completedSplits[48])		{return vars.completedSplits[48]  = true;}
	if (settings["PR3_5"] && vars.bitCheck(current.PR3, 5) && !vars.completedSplits[49])		{return vars.completedSplits[49]  = true;}
	if (settings["PR3_6"] && vars.bitCheck(current.PR3, 6) && !vars.completedSplits[50])		{return vars.completedSplits[50]  = true;}
	if (settings["PR3_7"] && vars.bitCheck(current.PR3, 7) && !vars.completedSplits[51])		{return vars.completedSplits[51]  = true;}
	//Bosses
	if (settings["BO1_2"] && vars.bitCheck(current.BO1, 2) && !vars.completedSplits[52])		{return vars.completedSplits[52]  = true;}
	if (settings["BO1_3"] && vars.bitCheck(current.BO1, 3) && !vars.completedSplits[53])		{return vars.completedSplits[53]  = true;}
	if (settings["BO1_4"] && vars.bitCheck(current.BO1, 4) && !vars.completedSplits[54])		{return vars.completedSplits[54]  = true;}
	if (settings["BO1_5"] && vars.bitCheck(current.BO1, 5) && !vars.completedSplits[55])		{return vars.completedSplits[55]  = true;}
	if (settings["BO1_6"] && vars.bitCheck(current.BO1, 6) && !vars.completedSplits[56])		{return vars.completedSplits[56]  = true;}
	if (settings["BO1_7"] && vars.bitCheck(current.BO1, 7) && !vars.completedSplits[57])		{return vars.completedSplits[57]  = true;}
	if (settings["BO2_0"] && vars.bitCheck(current.BO2, 0) && !vars.completedSplits[58])		{return vars.completedSplits[58]  = true;}
	if (settings["BO2_1"] && vars.bitCheck(current.BO2, 1) && !vars.completedSplits[59])		{return vars.completedSplits[59]  = true;}
	if (settings["BO2_2"] && vars.bitCheck(current.BO2, 2) && !vars.completedSplits[60])		{return vars.completedSplits[60]  = true;}
	
	//Final Split On Results Screen
	if(current.GameState == 21 && current.Load == 0 && old.Load == 1 && !vars.completedSplits[61])		{return vars.completedSplits[61]  = true;}
}

gameTime
{
	//Game Time for Metal Gear is at 15fps so to get the correct time we must take the current uint GameTime and divide it by 15
	return TimeSpan.FromSeconds(current.IGT / 15.0);
}

isLoading
{
	return true;
}

reset
{
	return current.GameState != 10 && old.GameState == 10;
}