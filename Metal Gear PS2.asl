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
		emu.MakeString("Gamecode", 13, 0x20C0C8);		//SLES_820.43;1, SLUS_212.43;1
		
		//These are for the PAL (European Eng, Fr) Version of the game
        emu.Make<byte>("PAL_MGGameState", 0x2759B4);



		//These are for the NTSCU (American) Version of the game
        emu.Make<byte>("NTSCU_MGGameState", 0x272C7C);
		emu.Make<uint>("NTSCU_MGIGT", 0x272388);
		//Items In Inventory Bits
		emu.Make<byte>("NTSCU_MGEQ1", 0x2722DC);
		emu.Make<byte>("NTSCU_MGEQ2", 0x2722E0);
		emu.Make<byte>("NTSCU_MGEQ3", 0x2722E4);
		emu.Make<byte>("NTSCU_MGEQ4", 0x2722E8);
		emu.Make<byte>("NTSCU_MGEQ5", 0x2722EC);
		//Rescued Prisoner Bits
		emu.Make<byte>("NTSCU_MGPR1", 0x2722F0);
		emu.Make<byte>("NTSCU_MGPR2", 0x2722F4);
		emu.Make<byte>("NTSCU_MGPR3", 0x2722F8);
		//Boss Kills
		emu.Make<byte>("NTSCU_MGBO1", 0x272324);
		emu.Make<byte>("NTSCU_MGBO2", 0x272328);
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
	settings.Add("EQ4_2", false, "Suppressor");
	settings.Add("EQ4_5", false, "Body Armour");
	settings.CurrentDefaultParent = "Item";
	settings.CurrentDefaultParent = null;
	
	settings.Add("Hostage", false, "Splits On Hostage Rescues");
	settings.CurrentDefaultParent = "Hostage";
	settings.Add("PR1_0", false, "Gray Fox (Bldg 1, B1)");
	settings.Add("PR1_1", false, "Dr. Madnar (Bldg 2, 2F)");
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
}

init
{
	//This is used for our splits
	vars.completedSplits = new bool[61];

}

update
{
	//Checks what version you are on via the regional gamecode, then casts the correct information for that version
	if(current.Gamecode == "SLES_820.43;1"){
		current.MGGameState = current.PAL_MGGameState;
		current.MGIGT = current.PAL_MGIGT;
		current.MGEQ1 = current.PAL_MGEQ1;
		current.MGEQ2 = current.PAL_MGEQ2;
		current.MGEQ3 = current.PAL_MGEQ3;
		current.MGEQ4 = current.PAL_MGEQ4;
		current.MGEQ5 = current.PAL_MGEQ5;
		current.MGPR1 = current.PAL_MGPR1;
		current.MGPR2 = current.PAL_MGPR2;
		current.MGPR3 = current.PAL_MGPR3;
		current.MGBO1 = current.PAL_MGBO1;
		current.MGBO2 = current.PAL_MGBO2;
	}
	else if(current.Gamecode == "SLUS_212.43;1"){
		current.MGGameState = current.NTSCU_MGGameState;
		current.MGIGT = current.NTSCU_MGIGT;
		current.MGEQ1 = current.NTSCU_MGEQ1;
		current.MGEQ2 = current.NTSCU_MGEQ2;
		current.MGEQ3 = current.NTSCU_MGEQ3;
		current.MGEQ4 = current.NTSCU_MGEQ4;
		current.MGEQ5 = current.NTSCU_MGEQ5;
		current.MGPR1 = current.NTSCU_MGPR1;
		current.MGPR2 = current.NTSCU_MGPR2;
		current.MGPR3 = current.NTSCU_MGPR3;
		current.MGBO1 = current.NTSCU_MGBO1;
		current.MGBO2 = current.NTSCU_MGBO2;
	}
}

onStart
{
	//resets the splits bools when a new run starts
	vars.completedSplits = new bool[61];
}

start
{
	return current.MGGameState != 10 && old.MGGameState == 10 && current.MGIGT > old.MGIGT;
}

split
{

	//Key Cards
	if (settings["EQ3_1"] && vars.bitCheck(current.MGEQ3, 1) && !vars.completedSplits[0])		{return vars.completedSplits[0]  = true;}
	if (settings["EQ4_6"] && vars.bitCheck(current.MGEQ4, 6) && !vars.completedSplits[1])		{return vars.completedSplits[1]  = true;}
	if (settings["EQ4_7"] && vars.bitCheck(current.MGEQ4, 7) && !vars.completedSplits[2])		{return vars.completedSplits[2]  = true;}
	if (settings["EQ5_0"] && vars.bitCheck(current.MGEQ5, 0) && !vars.completedSplits[3])		{return vars.completedSplits[3]  = true;}
	if (settings["EQ5_1"] && vars.bitCheck(current.MGEQ5, 1) && !vars.completedSplits[4])		{return vars.completedSplits[4]  = true;}
	if (settings["EQ5_2"] && vars.bitCheck(current.MGEQ5, 2) && !vars.completedSplits[5])		{return vars.completedSplits[5]  = true;}
	if (settings["EQ5_3"] && vars.bitCheck(current.MGEQ5, 3) && !vars.completedSplits[6])		{return vars.completedSplits[6]  = true;}
	if (settings["EQ5_4"] && vars.bitCheck(current.MGEQ5, 4) && !vars.completedSplits[7])		{return vars.completedSplits[7]  = true;}
	//Weapons
	if (settings["EQ3_6"] && vars.bitCheck(current.MGEQ3, 6) && !vars.completedSplits[8])		{return vars.completedSplits[8]  = true;}
	if (settings["EQ3_7"] && vars.bitCheck(current.MGEQ3, 7) && !vars.completedSplits[9])		{return vars.completedSplits[9]  = true;}
	if (settings["EQ4_1"] && vars.bitCheck(current.MGEQ4, 1) && !vars.completedSplits[10])		{return vars.completedSplits[10]  = true;}
	if (settings["EQ4_0"] && vars.bitCheck(current.MGEQ4, 0) && !vars.completedSplits[11])		{return vars.completedSplits[11]  = true;}
	//Misc Items
	if (settings["EQ1_2"] && vars.bitCheck(current.MGEQ1, 2) && !vars.completedSplits[12])		{return vars.completedSplits[12]  = true;}
	if (settings["EQ1_3"] && vars.bitCheck(current.MGEQ1, 3) && !vars.completedSplits[13])		{return vars.completedSplits[13]  = true;}
	if (settings["EQ1_5"] && vars.bitCheck(current.MGEQ1, 5) && !vars.completedSplits[14])		{return vars.completedSplits[14]  = true;}
	if (settings["EQ1_6"] && vars.bitCheck(current.MGEQ1, 6) && !vars.completedSplits[15])		{return vars.completedSplits[15]  = true;}
	if (settings["EQ1_7"] && vars.bitCheck(current.MGEQ1, 7) && !vars.completedSplits[16])		{return vars.completedSplits[16]  = true;}
	if (settings["EQ2_0"] && vars.bitCheck(current.MGEQ2, 0) && !vars.completedSplits[17])		{return vars.completedSplits[17]  = true;}
	if (settings["EQ2_1"] && vars.bitCheck(current.MGEQ2, 1) && !vars.completedSplits[18])		{return vars.completedSplits[18]  = true;}
	if (settings["EQ2_2"] && vars.bitCheck(current.MGEQ2, 2) && !vars.completedSplits[19])		{return vars.completedSplits[19]  = true;}
	if (settings["EQ2_3"] && vars.bitCheck(current.MGEQ2, 3) && !vars.completedSplits[20])		{return vars.completedSplits[20]  = true;}
	if (settings["EQ2_4"] && vars.bitCheck(current.MGEQ2, 4) && !vars.completedSplits[21])		{return vars.completedSplits[21]  = true;}
	if (settings["EQ2_5"] && vars.bitCheck(current.MGEQ2, 5) && !vars.completedSplits[22])		{return vars.completedSplits[22]  = true;}
	if (settings["EQ2_6"] && vars.bitCheck(current.MGEQ2, 6) && !vars.completedSplits[23])		{return vars.completedSplits[23]  = true;}
	if (settings["EQ2_7"] && vars.bitCheck(current.MGEQ2, 7) && !vars.completedSplits[24])		{return vars.completedSplits[24]  = true;}
	if (settings["EQ3_0"] && vars.bitCheck(current.MGEQ3, 0) && !vars.completedSplits[25])		{return vars.completedSplits[25]  = true;}
	if (settings["EQ4_2"] && vars.bitCheck(current.MGEQ4, 2) && !vars.completedSplits[26])		{return vars.completedSplits[26]  = true;}
	if (settings["EQ4_5"] && vars.bitCheck(current.MGEQ4, 5) && !vars.completedSplits[27])		{return vars.completedSplits[27]  = true;}
	//Prisoners
	if (settings["PR1_0"] && vars.bitCheck(current.MGPR1, 0) && !vars.completedSplits[28])		{return vars.completedSplits[28]  = true;}
	if (settings["PR1_1"] && vars.bitCheck(current.MGPR1, 1) && !vars.completedSplits[29])		{return vars.completedSplits[29]  = true;}
	if (settings["PR1_2"] && vars.bitCheck(current.MGPR1, 2) && !vars.completedSplits[30])		{return vars.completedSplits[30]  = true;}
	if (settings["PR1_3"] && vars.bitCheck(current.MGPR1, 3) && !vars.completedSplits[31])		{return vars.completedSplits[31]  = true;}
	if (settings["PR1_4"] && vars.bitCheck(current.MGPR1, 4) && !vars.completedSplits[32])		{return vars.completedSplits[32]  = true;}
	if (settings["PR1_5"] && vars.bitCheck(current.MGPR1, 5) && !vars.completedSplits[33])		{return vars.completedSplits[33]  = true;}
	if (settings["PR1_6"] && vars.bitCheck(current.MGPR1, 6) && !vars.completedSplits[34])		{return vars.completedSplits[34]  = true;}
	if (settings["PR1_7"] && vars.bitCheck(current.MGPR1, 7) && !vars.completedSplits[35])		{return vars.completedSplits[35]  = true;}
	if (settings["PR2_0"] && vars.bitCheck(current.MGPR2, 0) && !vars.completedSplits[36])		{return vars.completedSplits[36]  = true;}
	if (settings["PR2_1"] && vars.bitCheck(current.MGPR2, 1) && !vars.completedSplits[37])		{return vars.completedSplits[37]  = true;}
	if (settings["PR2_2"] && vars.bitCheck(current.MGPR2, 2) && !vars.completedSplits[38])		{return vars.completedSplits[38]  = true;}
	if (settings["PR2_3"] && vars.bitCheck(current.MGPR2, 3) && !vars.completedSplits[39])		{return vars.completedSplits[39]  = true;}
	if (settings["PR2_4"] && vars.bitCheck(current.MGPR2, 4) && !vars.completedSplits[40])		{return vars.completedSplits[40]  = true;}
	if (settings["PR2_5"] && vars.bitCheck(current.MGPR2, 5) && !vars.completedSplits[41])		{return vars.completedSplits[41]  = true;}
	if (settings["PR2_6"] && vars.bitCheck(current.MGPR2, 6) && !vars.completedSplits[42])		{return vars.completedSplits[42]  = true;}
	if (settings["PR2_7"] && vars.bitCheck(current.MGPR2, 7) && !vars.completedSplits[43])		{return vars.completedSplits[43]  = true;}
	if (settings["PR3_0"] && vars.bitCheck(current.MGPR3, 0) && !vars.completedSplits[44])		{return vars.completedSplits[44]  = true;}
	if (settings["PR3_1"] && vars.bitCheck(current.MGPR3, 1) && !vars.completedSplits[45])		{return vars.completedSplits[45]  = true;}
	if (settings["PR3_2"] && vars.bitCheck(current.MGPR3, 2) && !vars.completedSplits[46])		{return vars.completedSplits[46]  = true;}
	if (settings["PR3_3"] && vars.bitCheck(current.MGPR3, 3) && !vars.completedSplits[47])		{return vars.completedSplits[47]  = true;}
	if (settings["PR3_4"] && vars.bitCheck(current.MGPR3, 4) && !vars.completedSplits[48])		{return vars.completedSplits[48]  = true;}
	if (settings["PR3_5"] && vars.bitCheck(current.MGPR3, 5) && !vars.completedSplits[49])		{return vars.completedSplits[49]  = true;}
	if (settings["PR3_6"] && vars.bitCheck(current.MGPR3, 6) && !vars.completedSplits[50])		{return vars.completedSplits[50]  = true;}
	if (settings["PR3_7"] && vars.bitCheck(current.MGPR3, 7) && !vars.completedSplits[51])		{return vars.completedSplits[51]  = true;}
	//Bosses
	if (settings["BO1_2"] && vars.bitCheck(current.MGBO1, 2) && !vars.completedSplits[52])		{return vars.completedSplits[52]  = true;}
	if (settings["BO1_3"] && vars.bitCheck(current.MGBO1, 3) && !vars.completedSplits[53])		{return vars.completedSplits[53]  = true;}
	if (settings["BO1_4"] && vars.bitCheck(current.MGBO1, 4) && !vars.completedSplits[54])		{return vars.completedSplits[54]  = true;}
	if (settings["BO1_5"] && vars.bitCheck(current.MGBO1, 5) && !vars.completedSplits[55])		{return vars.completedSplits[55]  = true;}
	if (settings["BO1_6"] && vars.bitCheck(current.MGBO1, 6) && !vars.completedSplits[56])		{return vars.completedSplits[56]  = true;}
	if (settings["BO1_7"] && vars.bitCheck(current.MGBO1, 7) && !vars.completedSplits[57])		{return vars.completedSplits[57]  = true;}
	if (settings["BO2_0"] && vars.bitCheck(current.MGBO2, 0) && !vars.completedSplits[58])		{return vars.completedSplits[58]  = true;}
	if (settings["BO2_1"] && vars.bitCheck(current.MGBO2, 1) && !vars.completedSplits[59])		{return vars.completedSplits[59]  = true;}
	if (settings["BO1_2"] && vars.bitCheck(current.MGBO1, 2) && !vars.completedSplits[60])		{return vars.completedSplits[60]  = true;}

	//Final Split On Results Screen
	if(current.MGGameState == 15 && !vars.completedSplits[61])		{return vars.completedSplits[61]  = true;}
}

gameTime
{
	//Game Time for Metal Gear is at 15fps so to get the correct time we must take the current uint GameTime and divide it by 15
	return TimeSpan.FromSeconds(current.MGIGT / 15.0);
}

isLoading
{
	return true;
}

reset
{
	return current.MGGameState != 10 && old.MGGameState == 10;
}
