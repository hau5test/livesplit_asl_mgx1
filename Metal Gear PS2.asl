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
		emu.MakeString("UGamecode", 11, 0x20C0C8);        //SLUS_212.43, SLUS_213.59
		emu.MakeString("PGamecode", 11, 0x20C0C8);        //SLES_820.43,
		emu.MakeString("JGamecode", 11, 0x20BE0C);        //SLPM_662.21
		emu.MakeString("AniGamecode", 11, 0x20BEC8);    //SLPM_667.95

		//These are for the PAL (European Eng, Fr) Version of the game
        emu.Make<byte>("PAL_EN_GameState", 0x2759B4);
		emu.Make<byte>("PAL_EN_Load", 0x2759BC);
		emu.Make<byte>("PAL_EN_FloorVal", 0x2759C0);
		emu.Make<byte>("PAL_EN_ScreenVal", 0x2759C4);
		emu.Make<byte>("PAL_EN_OnElevator", 0x2759C8);
		//Weapon Ammo
		emu.Make<uint>("PAL_EN_MineAmmo", 0x2750A4);
		emu.Make<uint>("PAL_EN_ExplAmmo", 0x2750A8);
		emu.Make<uint>("PAL_EN_RCAmmo", 0x2750AC);
		emu.Make<uint>("PAL_EN_HandAmmo", 0x2750B0);
		emu.Make<uint>("PAL_EN_SubAmmo", 0x2750B4);
		emu.Make<uint>("PAL_EN_RockAmmo", 0x2750B8);
		emu.Make<uint>("PAL_EN_GLAmmo", 0x2750BC);
		emu.Make<uint>("PAL_EN_RationsHeld", 0x274FF0);
		emu.Make<uint>("PAL_EN_Health", 0x274F54);
		//Playthrough Info
		emu.Make<uint>("PAL_EN_IGT", 0x2750C0);
		emu.Make<uint>("PAL_EN_Ration", 0x2750C4);
		emu.Make<uint>("PAL_EN_Kills", 0x2750C8);
		emu.Make<uint>("PAL_EN_Alert", 0x2750CC);
		emu.Make<uint>("PAL_EN_Special", 0x2750D0);
		emu.Make<uint>("PAL_EN_Save", 0x2750D4);
		emu.Make<uint>("PAL_EN_Continue", 0x2750D8);
		emu.Make<uint>("PAL_EN_ContPerCheckpoint", 0x2752A0);
		emu.Make<byte>("PAL_EN_Diff", 0x2751A4);
		//Items In Inventory Bits
		emu.Make<byte>("PAL_EN_EQ1", 0x275014);
		emu.Make<byte>("PAL_EN_EQ2", 0x275018);
		emu.Make<byte>("PAL_EN_EQ3", 0x27501C);
		emu.Make<byte>("PAL_EN_EQ4", 0x275020);
		emu.Make<byte>("PAL_EN_EQ5", 0x275024);
		//Rescued Prisoner Bits
		emu.Make<byte>("PAL_EN_PR1", 0x275028);
		emu.Make<byte>("PAL_EN_PR2", 0x27502C);
		emu.Make<byte>("PAL_EN_PR3", 0x275030);
		//Boss Kills
		emu.Make<byte>("PAL_EN_BO1", 0x27505C);
		emu.Make<byte>("PAL_EN_BO2", 0x275060);
		
		//These are for the JPN (20th Anniversary) Version of the game
        emu.Make<byte>("JA_GameState", 0x2722E4);
		emu.Make<byte>("JA_Load", 0x2722EC);
		emu.Make<byte>("JA_FloorVal", 0x2722F0);
		emu.Make<byte>("JA_ScreenVal", 0x2722F4);
		emu.Make<byte>("JA_OnElevator", 0x27232C);
		//Weapon Ammo
		emu.Make<uint>("JA_MineAmmo", 0x2719D4);
		emu.Make<uint>("JA_ExplAmmo", 0x2719D8);
		emu.Make<uint>("JA_RCAmmo", 0x2719DC);
		emu.Make<uint>("JA_HandAmmo", 0x2719E0);
		emu.Make<uint>("JA_SubAmmo", 0x2719E4);
		emu.Make<uint>("JA_RockAmmo", 0x2719E8);
		emu.Make<uint>("JA_GLAmmo", 0x2719EC);
		emu.Make<uint>("JA_RationsHeld", 0x271920);
		emu.Make<uint>("JA_Health", 0x271884);
		//Playthrough Info
		emu.Make<uint>("JA_IGT", 0x2719F0);
		emu.Make<uint>("JA_Ration", 0x2719F4);
		emu.Make<uint>("JA_Kills", 0x2719F8);
		emu.Make<uint>("JA_Alert", 0x2719FC);
		emu.Make<uint>("JA_Special", 0x271A00);
		emu.Make<uint>("JA_Save", 0x271A04);
		emu.Make<uint>("JA_Continue", 0x271A08);
		emu.Make<uint>("JA_ContPerCheckpoint", 0x272BD0);
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
		emu.Make<byte>("JA_BO1", 0x27198C);
		emu.Make<byte>("JA_BO2", 0x271990);

		//These are for the JPN Version of the game
        emu.Make<byte>("J_GameState", 0x271364);
		emu.Make<byte>("J_Load", 0x27136C);
		emu.Make<byte>("J_FloorVal", 0x272370);
		emu.Make<byte>("J_ScreenVal", 0x272374);
		emu.Make<byte>("J_OnElevator", 0x2723AC);
		//Weapon Ammo
		emu.Make<uint>("J_MineAmmo", 0x271A54);
		emu.Make<uint>("J_ExplAmmo", 0x271A58);
		emu.Make<uint>("J_RCAmmo", 0x271A5C);
		emu.Make<uint>("J_HandAmmo", 0x271A60);
		emu.Make<uint>("J_SubAmmo", 0x271A64);
		emu.Make<uint>("J_RockAmmo", 0x271A68);
		emu.Make<uint>("J_GLAmmo", 0x271A6C);
		emu.Make<uint>("J_RationsHeld", 0x2719A0);
		emu.Make<uint>("J_Health", 0x271904);
		emu.Make<uint>("J_ContPerCheckpoint", 0x271C50);
		emu.Make<byte>("J_Diff", 0x271B54); 
		//Items In Inventory Bits
		emu.Make<byte>("J_EQ1", 0x2719C4);
		emu.Make<byte>("J_EQ2", 0x2719C8);
		emu.Make<byte>("J_EQ3", 0x2719CC);
		emu.Make<byte>("J_EQ4", 0x2719D0);
		emu.Make<byte>("J_EQ5", 0x2719D4);
		//Rescued Prisoner Bits
		emu.Make<byte>("J_PR1", 0x2719D8);
		emu.Make<byte>("J_PR2", 0x2719DC);
		emu.Make<byte>("J_PR3", 0x2719E0);
		
		//Boss Kills
		emu.Make<byte>("J_BO1", 0x271A0C);
		emu.Make<byte>("J_BO2", 0x271A10);

		//Playthrough Info
		emu.Make<uint>("J_IGT", 0x271A70);
		emu.Make<uint>("J_Ration", 0x271A74);
		emu.Make<uint>("J_Kills", 0x271A78);
		emu.Make<uint>("J_Alert", 0x271A7C);
		emu.Make<uint>("J_Special", 0x271A80);
		emu.Make<uint>("J_Save", 0x271A84);
		emu.Make<uint>("J_Continue", 0x271A88);
		
		
		//These are for the NTSCU (American) Version of the game
        emu.Make<byte>("U_GameState", 0x272C7C);
		emu.Make<byte>("U_Load", 0x272C84);
		emu.Make<byte>("U_FloorVal", 0x272C88);
		emu.Make<byte>("U_ScreenVal", 0x272C8C);
		emu.Make<byte>("U_OnElevator", 0x272CC4);
		//Weapon Ammo
		emu.Make<uint>("U_MineAmmo", 0x27236C);
		emu.Make<uint>("U_ExplAmmo", 0x272370);
		emu.Make<uint>("U_RCAmmo", 0x272374);
		emu.Make<uint>("U_HandAmmo", 0x272378);
		emu.Make<uint>("U_SubAmmo", 0x27237C);
		emu.Make<uint>("U_RockAmmo", 0x272380);
		emu.Make<uint>("U_GLAmmo", 0x272384);
		emu.Make<uint>("U_RationsHeld", 0x2722B8);
		emu.Make<uint>("U_Health", 0x27221C);
		//Playthrough Info
		emu.Make<uint>("U_IGT", 0x272388);
		emu.Make<uint>("U_Ration", 0x27238C);
		emu.Make<uint>("U_Kills", 0x272390);
		emu.Make<uint>("U_Alert", 0x272394);
		emu.Make<uint>("U_Special", 0x272398);
		emu.Make<uint>("U_Save", 0x27239C);
		emu.Make<uint>("U_Continue", 0x2723A0);
		emu.Make<uint>("U_ContPerCheckpoint", 0x272568);
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
	settings.Add("b3_enter_tx55_room", false, "Enter TX-55 Room" , "building3_finished");
	
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
	settings.Add("PR3_4", false, "Prisoner 18 (Bldg 3, 1F Dirty Duck)");
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

	// define all variables in start up so they can be set before an active run is going on
	vars.Rank = "";
	vars.Class = "";
	vars.Location = "";
	vars.SubLocation = "";
	vars.Difficulty = "";
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

init
{
	//This is used for our splits
	vars.completedSplits = new bool[65];
}

update
{
	//Checks what version you are on via the regional gamecode, then casts the correct information for that version
	if(current.PGamecode == "SLES_820.43"){
		current.GameState = current.PAL_EN_GameState;
		current.FloorVal = current.PAL_EN_FloorVal;
		current.ScreenVal = current.PAL_EN_ScreenVal;
		current.OnElevator = current.PAL_EN_OnElevator;
		
		current.MineAmmo = current.PAL_EN_MineAmmo;
		current.ExplAmmo = current.PAL_EN_ExplAmmo;
		current.RCAmmo = current.PAL_EN_RCAmmo;
		current.HandAmmo = current.PAL_EN_HandAmmo;
		current.SubAmmo = current.PAL_EN_SubAmmo;
		current.RockAmmo = current.PAL_EN_RockAmmo;
		current.GLAmmo = current.PAL_EN_GLAmmo;
		current.RationsHeld = current.PAL_EN_RationsHeld;
		current.Health = current.PAL_EN_Health;
		
		current.IGT = current.PAL_EN_IGT;
		current.Rations = current.PAL_EN_Ration;
		current.Kills = current.PAL_EN_Kills;
		current.Alerts = current.PAL_EN_Alert;
		current.Special = current.PAL_EN_Special;
		current.Saves = current.PAL_EN_Save;
		current.Continues = current.PAL_EN_Continue;
		current.ContPerCheckpoint = current.PAL_EN_ContPerCheckpoint;
		current.Diff = current.PAL_EN_Diff;
		current.Load = current.PAL_EN_Load;
		
		current.EQ1 = current.PAL_EN_EQ1;
		current.EQ2 = current.PAL_EN_EQ2;
		current.EQ3 = current.PAL_EN_EQ3;
		current.EQ4 = current.PAL_EN_EQ4;
		current.EQ5 = current.PAL_EN_EQ5;
		current.PR1 = current.PAL_EN_PR1;
		current.PR2 = current.PAL_EN_PR2;
		current.PR3 = current.PAL_EN_PR3;
		current.BO1 = current.PAL_EN_BO1;
		current.BO2 = current.PAL_EN_BO2;
	}
	else if(current.UGamecode == "SLUS_212.43"){
		current.GameState = current.U_GameState;
		current.FloorVal = current.U_FloorVal;
		current.ScreenVal = current.U_ScreenVal;
		current.OnElevator = current.U_OnElevator;
		
		current.MineAmmo = current.U_MineAmmo;
		current.ExplAmmo = current.U_ExplAmmo;
		current.RCAmmo = current.U_RCAmmo;
		current.HandAmmo = current.U_HandAmmo;
		current.SubAmmo = current.U_SubAmmo;
		current.RockAmmo = current.U_RockAmmo;
		current.GLAmmo = current.U_GLAmmo;
		current.RationsHeld = current.U_RationsHeld;
		current.Health = current.U_Health;
		
		current.IGT = current.U_IGT;
		current.Rations = current.U_Ration;
		current.Kills = current.U_Kills;
		current.Alerts = current.U_Alert;
		current.Special = current.U_Special;
		current.Saves = current.U_Save;
		current.Continues = current.U_Continue;
		current.ContPerCheckpoint = current.U_ContPerCheckpoint;
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
		current.FloorVal = current.JA_FloorVal;
		current.ScreenVal = current.JA_ScreenVal;
		current.OnElevator = current.JA_OnElevator;
		
		current.MineAmmo = current.JA_MineAmmo;
		current.ExplAmmo = current.JA_ExplAmmo;
		current.RCAmmo = current.JA_RCAmmo;
		current.HandAmmo = current.JA_HandAmmo;
		current.SubAmmo = current.JA_SubAmmo;
		current.RockAmmo = current.JA_RockAmmo;
		current.GLAmmo = current.JA_GLAmmo;
		current.RationsHeld = current.JA_RationsHeld;
		current.Health = current.JA_Health;
		
		current.IGT = current.JA_IGT;
		current.Rations = current.JA_Ration;
		current.Kills = current.JA_Kills;
		current.Alerts = current.JA_Alert;
		current.Special = current.JA_Special;
		current.Saves = current.JA_Save;
		current.Continues = current.JA_Continue;
		current.ContPerCheckpoint = current.JA_ContPerCheckpoint;
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
	else if(current.JGamecode == "SLPM_662.21"){
		current.GameState = current.J_GameState;
		current.FloorVal = current.J_FloorVal;
		current.ScreenVal = current.J_ScreenVal;
		current.OnElevator = current.J_OnElevator;
		
		current.MineAmmo = current.J_MineAmmo;
		current.ExplAmmo = current.J_ExplAmmo;
		current.RCAmmo = current.J_RCAmmo;
		current.HandAmmo = current.J_HandAmmo;
		current.SubAmmo = current.J_SubAmmo;
		current.RockAmmo = current.J_RockAmmo;
		current.GLAmmo = current.J_GLAmmo;
		current.RationsHeld = current.J_RationsHeld;
		current.Health = current.J_Health;
		
		current.IGT = current.J_IGT;
		current.Rations = current.J_Ration;
		current.Kills = current.J_Kills;
		current.Alerts = current.J_Alert;
		current.Special = current.J_Special;
		current.Saves = current.J_Save;
		current.Continues = current.J_Continue;
		current.ContPerCheckpoint = current.J_ContPerCheckpoint;
		current.Diff = current.J_Diff;
		current.Load = current.J_Load;
		
		current.EQ1 = current.J_EQ1;
		current.EQ2 = current.J_EQ2;
		current.EQ3 = current.J_EQ3;
		current.EQ4 = current.J_EQ4;
		current.EQ5 = current.J_EQ5;
		current.PR1 = current.J_PR1;
		current.PR2 = current.J_PR2;
		current.PR3 = current.J_PR3;
		current.BO1 = current.J_BO1;
		current.BO2 = current.J_BO2;
	}
	/*
	// Set Var Viewer Variable for Difficulty
	if(current.Diff == 1) {
		vars.Difficulty = "Original";
	} else {
		vars.Difficulty = "Easy";
	}

	// any more code for update goes here
		//function to display the current rank
	if(current.IGT>1079999) {
		vars.Rank = "Chicken";
	} else if ((current.IGT>863999)&&(current.IGT<1080000)) {
		vars.Rank = "Turtle";
	} else if ((current.IGT>647999)&&(current.IGT<864000)) {
		vars.Rank = "Hippopotamus";
	} else if ((current.IGT>431999)&&(current.IGT<648000)) {
		vars.Rank = "Elephant";
	} else if ((current.IGT>215999)&&(current.IGT<1080000)) {
		vars.Rank = "Deer";
	} else if (current.Kills > 3) {
		vars.Rank = "Deer";
	} else if (current.Kills < 4) {
		if ((current.IGT>108000)&&(current.IGT<432000)) {
			vars.Rank = "Zebra";
		} else if ((current.IGT>81000)&&(current.IGT<1080000)) {
			vars.Rank = "Jackal";
		} else if ((current.IGT>45000)&&(current.IGT<1080000)) {
			vars.Rank = "Panther";
		} else if ((current.Kills > 0) ||(current.Continues > 0) || (current.Alerts > (8 + current.Diff)) ||(current.Rations > 1)) {
			vars.Rank = "Eagle";
		} else {
			vars.Rank = current.Diff==1?"Big Boss":"Fox";
		}
	}
	*/
}

onStart
{
	//resets the splits bools when a new run starts
	vars.completedSplits = new bool[65];
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
            if ((old.ScreenVal == 5) && (current.ScreenVal == 6) && settings["b3_enter_tx55_room"]) return true;        }
        // on entering the final map

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
	return (current.GameState == 10 && old.GameState != 10);
}

onReset {
	vars.Rank = "";
	vars.Class = "";
	vars.Location = "";
	vars.SubLocation = "";
	vars.Difficulty = "";
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