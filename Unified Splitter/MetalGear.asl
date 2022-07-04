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
    uint BSState: 				0x601BC;
	uint FloorVal: 				0x60118;
	uint SubFloorVal: 			0x5F09C;
	uint AlertCountdown: 		0x60120;
	// snake relevant values
	// uint SnakeYCoord:		0x5F4D8;
	uint ClassValue: 			0x5C53C;
	uint TotalPOWsaved: 		0x5C5DC;
    uint Saves: 				0x5C6AC;
	uint Health: 				0x5C52C;
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
	uint J20A_BSState: 				0x123E188, 0x11C;
	uint J20A_FloorVal: 			0x123E188, 0x78;
	uint J20A_SubFloorVal: 			0x11E540C, 0x684;
	uint J20A_AlertCountdown: 		0x123E188, 0x80;
	// snake relevant values
	uint J20A_ClassValue: 			0x123E184, 0x894;
	uint J20A_TotalPOWsaved: 		0x123E184, 0x934;
	uint J20A_Health: 				0x123E184, 0x884;
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

    // JP Subsistence
	// timers
	uint JSub_GameTime: 			0x123E184, 0xA70;
	uint JSub_BSGameTimeSeconds:	0x123EB00, 0x784;
	uint JSub_BSGameTimeMinutes:	0x123E188, 0x370;
	// variables for state and map location
	uint JSub_BSState: 				0x123E188, 0x19C;
	uint JSub_FloorVal: 			0x123E188, 0x370;
	uint JSub_SubFloorVal: 			0x123EB00, 0x784;
	uint JSub_AlertCountdown: 		0x123E188, 0x100;
	// snake relevant values
	uint JSub_ClassValue: 			0x123E184, 0x914;
	uint JSub_TotalPOWsaved: 		0x123E184, 0x9B4;
	uint JSub_Health: 				0x123E184, 0x904;
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

	// US
	// timers
	uint US_GameTime: 				0x123E188, 0x388;
	uint US_BSGameTimeSeconds:		0x123EB08, 0xC04;
	uint US_BSGameTimeMinutes:		0x123E188, 0xA10;
	// variables for state and map location
	uint US_BSState: 				0x123E188, 0xAB4;
	uint US_FloorVal: 				0x123E188, 0xA10;
	uint US_SubFloorVal: 			0x123EB08, 0xC04;
	uint US_AlertCountdown: 		0x123E188, 0xA18;
	// snake relevant values
	uint US_ClassValue: 			0x123E188, 0x22C;
	uint US_TotalPOWsaved: 			0x123E188, 0x2CC;
	uint US_Health: 				0x123E188, 0x21C;
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

    // EU
	// timers
    uint EU_GameTime: 				0x123E194, 0xC0;
	uint EU_BSGameTimeSeconds:		0x123E194, 0x790;
	uint EU_BSGameTimeMinutes:		0x123E194, 0x78C;
	// variables for state and map location
	uint EU_BSState: 				0x123E194, 0x7EC;
	uint EU_FloorVal: 				0x123E194, 0x9C0;
	uint EU_SubFloorVal: 			0x123EB14, 0xA84;
	uint EU_AlertCountdown: 		0x123E194, 0x750;
	// snake relevant values
	uint EU_ClassValue: 			0x123E190, 0xF64;
	uint EU_TotalPOWsaved: 			0x123E194, 0x4;
	uint EU_Health: 				0x123E190, 0xF54;
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
			"BSState",
			"FloorVal",
			"SubFloorVal",
			"AlertCountdown",
			"ClassValue",
			"TotalPOWsaved",
			"Health",
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
			"PistolAmmo"
			};

		// (placeholder) have some logic to work out the version and create the prefix
		string ver = null;

		// check the basics
		//either PAL or another version
//		if (current.region == "PAL") ver = "EU_"; <- not working for some reason
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
}

gameTime {
	return current.BSState == 0?TimeSpan.FromMilliseconds(current.GameTime * 1000 / (current.regCode == "SLES"?16.667:15)):TimeSpan.FromMilliseconds((current.BSGameTimeMinutes * 60 + current.BSGameTimeSeconds) * 1000);
}

isLoading {
	return true;
}

start {
    if ((current.BSState == 0) && ((current.GameTime != 0) && (current.GameTime != old.GameTime))) {
        return  true;
    } else if ((old.BSState == 3) && (current.BSState == 9 )) return true;
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
        if (current.FloorVal == 17) {
            // if before map was B3 Underground
            if (old.FloorVal == 15) return true;
            // if before map was ladder selection and transitioning into credits
            // this marks the final split of every run
            else if ((old.SubFloorVal == 18) && (current.SubFloorVal == 61)) return true;
        }
    }

    // during Boss Survival
    if (current.BSGameTimeMinutes + current.BSGameTimeSeconds > 0) {
        // moving from Shotmaker Map to Machine Gun Kid Map
        if ((current.FloorVal == 2) && (old.FloorVal == 4)) return true;
        // moving from Machine Gun Kid Map to Hind-D Map
        if ((current.FloorVal == 7) && (old.FloorVal == 2)) return true;
        // moving from Hind-D Map to Tank Map
        if ((current.FloorVal == 5) && (old.FloorVal == 7)) return true;
        // moving from Tank Map to Firetrooper Map
        if ((current.FloorVal == 10) && (old.FloorVal == 5)) return true;
        // moving from Firetrooper Map to Dirty Duck Map
        if ((current.FloorVal == 14) && (old.FloorVal == 10)) return true;
        // moving from Dirty Duck Map to Building 3 Underground
        if ((current.FloorVal == 15) && (old.FloorVal == 14)) return true;
        // moving from Metal Gear TX-55 Map to Big Boss Fight Map
        if (current.FloorVal == 15) {
            if ((old.SubFloorVal != 56) && (current.SubFloorVal == 56)) return true;
            if((current.BSState == 2) && (old.BSState != 1)) return true;
        }
    }
}

reset {
	if((current.GameTime == 0) && (old.GameTime == 0))
	{
        return true;
    }
    if((current.BSState == 3) &&(current.BSGameTimeSeconds == 0)) {
        return true;
    }
    if((current.BSState == 3) && (old.BSState == 2) && (current.BSGameTimeSeconds != current.BSState)) {
        return true;
    }
}