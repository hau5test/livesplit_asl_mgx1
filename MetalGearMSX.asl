/*********************************************************/
/* Metal Gear MSX Autosplitter beta                      */
/*                                                       */
/* Emulator Compatibility:                               */
/*  * openMSX                                            */
/*                                                       */
/* Game Compatibility:                                   */
/*  * Metal Gear openMSX                                 */
/*                                                       */
/* Created by Hau5test for Metal Gear Solid Speedrunners */
/*********************************************************/
state("openMSX") {
	byte GameState: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x111;
	byte SnakeYAxis: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x182;
	byte SnakeXAxis: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x184;
	byte SnakeHealth: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x131;
	byte ScreenValue: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x130;
	byte GameFinished: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x124;
	// Equipment Inventory
	byte Card1Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5AD;
	byte Card2Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5AE;
	byte Card3Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5AF;
	byte Card4Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5B0;
	byte Card5Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5B1;
	byte Card6Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5B2;
	byte Card7Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5B3;
	byte Card8Acquired: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x5B4;
	byte RationsInInventory: 	0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x539;
	// Weapon Inventory
	byte PExplosivesPickedUp: 	0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x504;
	byte SMGPickedUp: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x522;
	byte PistolPickedUp: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x142;
	// Ammunition Reserve
	byte RCMissileAmmo: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x511;
	byte SMGAmmo: 				0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x50D;
	byte PExplosivesAmmo: 		0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x505;
	byte PistolAmmo: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x501;
	// POW Checklist
	byte POW1Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x640;
	byte POW2Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x641;
	byte POW3Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x642;
	byte POW4Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x643;
	byte POW5Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x644;
	byte POW6Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x645;
	byte POW7Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x646;
	byte POW8Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x647;
	byte POW9Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x648;
	byte POW10Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x649;
	byte POW11Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64A;
	byte POW12Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64B;
	byte POW13Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64C;
	byte POW14Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64D;
	byte POW15Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64E;
	byte POW16Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x64F;
	byte POW17Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x650;
	byte POW18Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x651;
	byte POW19Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x652;
	byte GrayFoxSaved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x653;
	byte EllenSaved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x654;
	byte MadnarSaved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x655;
	byte POW20Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x656;
	byte POW21Saved: 			0x8658F8, 0x28, 0xD0, 0x0, 0x48, 0x657;
}

startup {
	// add D shorthand to context
	vars.D = new ExpandoObject();
	var D = vars.D;
	
	D.BaseAddress = IntPtr.Zero;
	D.Watch = new MemoryWatcherList();

	D.Location = new Dictionary<short, string>() {
		{ 0,  "Docks" },
		{ 121,  "Docks" },
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

	D.Bosses = new Dictionary<uint, string>() {
		{ 2,  "shotmaker"},
		{ 3,  "mgk"},
		{ 4,  "tank"},
		{ 5,  "bulldozer"},
		{ 6,  "hindd"},
		{ 7,  "firetrooper"},
		{ 8,  "dirtyduck"},
		{ 9,  "bigboss"},
		{ 10,  "tx55"}
	};

	D.SpecialPOWs = new Dictionary<uint, string>() {
		{ 0, "grayfox"},
		{ 1, "ellen"},
		{ 2, "madnar"}
	};

	// define all variables in start up so they can be set before an active run is going on
	vars.Class = "";
	vars.Location = "";
	vars.SubLocation = "";
	vars.CalledBigBoss = false;
	vars.CalledDiane = false;
	vars.CalledSchneider = false;
	vars.CalledJennifer = false;
	vars.CardsCompletion = "0 out of 8";
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
	settings.Add("scuba_swim_south_started", false, "Scuba Swim South Started", "building2_splits");
	// add splits on Scuba Swim
	settings.Add("scuba_swim_splits", true, "Scuba Swim Splits", "building2_splits");
	settings.Add("scuba_swim_north_finished", true, "Scuba Swim North Finished", "scuba_swim_splits");
	settings.Add("scuba_swim_south_finished", true, "Scuba Swim South Finished", "scuba_swim_splits");
	settings.SetToolTip("scuba_swim_south_started", "on returning back to Building 2 Ground Floor after having visited Building 3 (post Dirty Duck)");
	settings.Add("building2_finished", true, "End of Building 2 - start of Desert 2", "building2_splits");
	// add splits based on being checkpoints in the third building
	settings.Add("building3_finished", true, "Building 3 Split", "checkpoint_splits");
	settings.Add("b3_enter", true, "Entering Building 3", "building3_finished");
	settings.Add("b3_exit_to_desert_2", true, "Exiting Building 3 to Desert 2", "building3_finished");
	settings.Add("b3_gf_to_elevator", true, "Ground Floor to Elevator", "building3_finished");
	settings.Add("b3_ug_to_elevator", true, "Underground Floor to Elevator", "building3_finished");
	settings.Add("b3_enter_tx55_room", false, "Enter TX-55 Room" , "building3_finished");
	settings.Add("b3_enter_bb_room", false, "Enter Big Boss Room", "building3_finished");
	settings.Add("b3_enter_ladder_map", false, "Room Change Big Boss to Ladders", "building3_finished");

	// add settings block
	settings.Add("stop_timer", true, "Stop Timer on Finishing the Game");
}

update {
	// add D shorthand to context
  	var D = vars.D;

	vars.CardsCompletion = (current.Card1Acquired +
							current.Card2Acquired +
							current.Card3Acquired +
							current.Card4Acquired +
							current.Card5Acquired +
							current.Card6Acquired +
							current.Card7Acquired +
							current.Card8Acquired).ToString() + " out of 8";

	vars.POWsCompletion = (current.POW1Saved +
							current.POW2Saved +
							current.POW3Saved +
							current.POW4Saved +
							current.POW5Saved +
							current.POW6Saved +
							current.POW7Saved +
							current.POW8Saved +
							current.POW9Saved +
							current.POW10Saved +
							current.POW11Saved +
							current.POW12Saved +
							current.POW13Saved +
							current.POW14Saved +
							current.POW15Saved +
							current.POW16Saved +
							current.POW17Saved +
							current.POW18Saved +
							current.POW19Saved +
							current.POW20Saved +
							current.POW21Saved +
							current.EllenSaved +
							current.MadnarSaved +
							current.GrayFoxSaved).ToString() + " out of 24";
} 

/*
gameTime {
    return TimeSpan.FromMilliseconds(current.Ticker);
}

isLoading {
    return current.Paused == 1;
}
*/

start {
	if(current.GameState != 0 && old.GameState == 0) return true;	
}

split {
	// add D shorthand to context
  	var D = vars.D;

        //on entering the elevator on building 1
        if (current.ScreenValue == 240) {
            if (old.ScreenValue == 3) {
				//if previous map was Building 1 - Ground Floor
				if (settings["b1_gf_to_elevator"]) return true;
            }
        }

        if (current.ScreenValue == 242) {
            if (old.ScreenValue == 39) {
            	//if previous map was Building 1 - Second Floor
				if (settings["b1_2f_to_elevator"]) return true;
        	}
        }

        if (current.ScreenValue == 241) {
            if (old.ScreenValue == 63) {
            	//if previous map was Building 1 - Underground
				if (settings["b1_ug_to_elevator"]) return true;
            } else if (old.ScreenValue == 27) {
            	//if previous map was Building 1 - First Floor
				if (settings["b1_1f_to_elevator"]) return true;
        	}
        }

        //on capture on B1 Ground Floor to being put in the underground
        if ((current.ScreenValue == 165) && (old.ScreenValue == 8) && settings["b1_captured"]) return true;

        //on switching from Building 1 - Roof to Building 1 - Ground Floor via parachute drop
        if ((current.ScreenValue == 10) && (old.ScreenValue == 204) && settings["b1_roof_to_ground"]) return true;

        //on entering Desert between Building 1 to Building 2 with B1 - GF as previous map
        if ((current.ScreenValue == 64) && (old.ScreenValue == 11) && settings["building1_finished"]) return true;

        //on entering Building 2 with connecting desert as previous map
        if ((current.ScreenValue == 73) && (old.ScreenValue == 69) && settings["b2_enter_from_B1_desert"]) return true;

        //on entering the elevator on building 2
        if (current.ScreenValue == 243) {
            if (old.ScreenValue == 72) {
				//if previous map was Building 2 - Ground Floor
				if (settings["b2_gf_to_elevator"]) return true;
            } else if (old.ScreenValue == 95) {
				//if previous map was Building 2 - Underground
				if (settings["b2_ug_to_elevator"]) return true;
            }
        }

        if (current.ScreenValue == 246) {
            if (old.ScreenValue == 154) {
				//if previous map was Building 2 - Hell Roof
				if (settings["b2_roof_to_elevator"]) return true;
        	}
        }

        if (current.ScreenValue == 245) {
            if (old.ScreenValue == 205) {
				//if previous map was Building 2 - Hell Roof
				if (settings["b2_roof_to_elevator"]) return true;
        	}
        }

        // on reaching Building 3
        if (current.ScreenValue == 108 && old.ScreenValue == 104) {
			// if previous map was Connecting Desert between Building 2 and Building 3
			if (settings["b3_enter"]) return true;
		}

        // on leaving Building 3
        if (current.ScreenValue == 104 && old.ScreenValue == 108) {
			// if previous map was Connecting Desert between Building 2 and Building 3
			if (settings["b3_exit_to_desert_2"]) return true;
		}

        if (current.ScreenValue == 107 && old.ScreenValue == 212) {
            // if previous map was B2 Ground Floor
			if (settings["scuba_swim_north_finished"]) return true;
        }

        // on returning back to Building 2 Ground Floor after having visited Building 3 (post Dirty Duck)
        if ((current.ScreenValue == 212) && (old.ScreenValue == 107) && settings["scuba_swim_south_started"]) return true;

        // going from Buildin 2 Ground Floor into the connecting desert between Building 2 and Building 3
        if ((current.ScreenValue == 102) && (old.ScreenValue == 75) && settings["building2_finished"]) return true;
        
        // going from Desert between B2 and B3 into Building 2 Ground Floor
        if ((current.ScreenValue == 75) && (old.ScreenValue == 102) && settings["b2_enter_from_B3_desert"]) return true;
        
        // on entering Building 3 elevator after having visited Building 3 Ground Floor
        if ((current.ScreenValue == 247) && (old.ScreenValue == 109) && settings["b3_gf_to_elevator"]) return true;

        // on entering Building 3 elevator after having visited Building 3 Ground Floor
        if ((current.ScreenValue == 250) && (old.ScreenValue == 115) && settings["b3_ug_to_elevator"]) return true;

		// after map has switched from underground to TX-55 boss room
		if ((old.SubScreenValue == 118) && (current.SubScreenValue == 116) && settings["b3_enter_tx55_room"]) return true;
		
		// after map has switched from TX-55 boss room to Big Boss Boss fight room
		if ((old.SubScreenValue == 119) && (current.SubScreenValue == 118) && settings["b3_enter_bb_room"]) return true;

        // on entering the final map
        if ((current.ScreenValue == 224) && (old.ScreenValue == 119) && settings["b3_enter_ladder_map"]) return true;

	// if on final game screen and the main menu state changes, split
	if ((old.GameFinished == 0 && current.GameFinished == 1) && settings["stop_timer"]) return true;
}

reset {
	if(current.GameState == 0 && old.GameState != 0) return true;
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
	vars.CardsCompletion = "0 out of 8";
	vars.CodecCompletion = "0 out of 4";
	vars.WeaponsCompletion = "0 out of 8";
	vars.POWsCompletion = "0 out of 24";
	vars.BossesCompletion = "0 out of 10";
}