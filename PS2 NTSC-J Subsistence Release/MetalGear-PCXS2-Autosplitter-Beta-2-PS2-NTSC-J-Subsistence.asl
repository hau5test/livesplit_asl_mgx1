state("pcsx2") {
	uint GameTime: 0x123E184, 0xA70;
	uint BSGameTimeSeconds: 0x123E188, 0x140;
    uint BSGameTimeMinutes: 0x123E188, 0x13C;
    uint BSState: 0x123E188, 0x19C;
	uint FloorVal: 0x123E188, 0x370;
	uint SubFloorVal: 0x123EB00, 0x784;
	uint RankVal: 0x123E184, 0x914;
	uint ContPerCheckpoint: 0x123E184, 0xC50;
	uint Continues: 0x123E184, 0xA88;
	uint Alerts: 0x123E184, 0xA7C;
	uint Kills: 0x123E184, 0xA78;
	uint Rations: 0x123E184, 0xA74;
	uint TotalPOWsaved: 0x123E184, 0x9B4;
	uint RationsHeld: 0x123E184, 0x9A0;
	uint AlertCountdown: 0x123E188, 0x100;
	uint Health: 0x123E184, 0x904;
	uint PlasticExplosives: 0x123E184, 0xA58;
	uint Mines: 0x123E184, 0xA54;
	uint RemoteMissiles: 0x123E184, 0xA5C;
	uint RocketLauncherAmmo: 0x123E184, 0xA68;
	uint GrenadeLauncherAmmo: 0x123E184, 0xA6C;
	uint SMGAmmo: 0x123E184, 0xA64;
	uint PistolAmmo: 0x123E184, 0xA60;
}

gameTime {
	return current.BSGameTimeSeconds == 0?TimeSpan.FromMilliseconds(current.GameTime * 1000 / 15):TimeSpan.FromMilliseconds((current.BSGameTimeMinutes * 60 + current.BSGameTimeSeconds) * 1000);
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
    if (current.GameTime > 0 && current.BSGameTimeSeconds == 0) {
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
        // if ((current.RankVal == 3) && (old.RankVal == 2)) return true;

        //on entering the B2 elevator, but only if the amount of continues for a single checkpoint 5 (reaching death abuse)
        //and on transitioning between B2 Elevator and going back into Building 2 - First Floor again
        // marking the end of the death abuse segment
        if ((current.RankVal == 3) && (current.ContPerCheckpoint == 5) && (current.FloorVal == 9) && (old.FloorVal == 12)) return true;

        //on entering the B2 elevator, but only if the amount of continues for a single checkpoint is higher than 4
        //and on transitioning between Building 2 - First Floor going into the B2 Elevator
        if ((current.RankVal == 3) && (current.ContPerCheckpoint > 4) && (current.FloorVal == 12) && (old.FloorVal == 9)) return true;

        // for big boss, the above check will be accepted if the continues per checkpoint are exactly 0
        // for an intended Big Boss rank run
        if ((current.RankVal == 3) && (current.ContPerCheckpoint == 0) && (current.FloorVal == 12) && (old.FloorVal == 9)) return true;

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
            else if ((old.AlertCountdown != 0) && (current.AlertCountdown == 0)) return true;
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