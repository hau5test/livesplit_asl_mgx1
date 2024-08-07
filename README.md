# livesplit_asl_mgx1 (PS2 ASL deprecated)
Development of the PS2 Emulator support PCXS2 has been succeeded by TheDementedSalad here:

https://github.com/TheDementedSalad/Metal-Gear-PS2-Emu-Autosplitter

A set of Livesplit autosplitters for Metal Gear (MSX) from 1987 the PS2 and PC ports.

Supports the PC version (GOG release) and PCXS2 emulator version 1.6.0.

For the PCXS2 emulator the following releases are supported:
- Metal Gear Solid 3: Subsistence PAL (SLES-820.43)
- Metal Gear Solid 3: Subsistence NTSC-U (SLUS-212.43)
- Metal Gear Solid 3: Subsistence NTSC-J (SLPM-662.21)
- Metal Gear 20th Anniversary Collection NTSC-J (SLPM-667.95)

Setup video tutorial:
https://www.youtube.com/watch?v=vuQAJS0_XGk

The following ASL Var Viewer Variables are available:
- Rank              - shows the current rank name
- Class             - shows the current class level
- NGorNGP           - shows if the game is run in New Game or New Game + mode
- SnakeXAxis        - shows current Snake X position on the screen
- SnakeYAxisHead    - shows current Snake Y position on screen for head hitbox
- SnakeYAxisFeet    - shows current Snake Y position on screen for feet hitbox
- Location          - shows map name for location
- SubLocation       - shows map name based on sub-location (few more locations)

The following and more ASL Var Viewer States are available:
- FloorVal          - lists number of current map loaded
- ScreenVal         - lists number of current screen loaded from map
- AlertCountdown    - shows the alert countdown from the final section of the game

- POWs Collected     - lists how many POWs have been saved
- Weapons Collected  - lists how many weapons have been collected
- Items Collected    - lists how many items have been collected
- Codecs Collected   - lists how many codecs have been saved
- Bosses Beated      - lists how many bosses in total have been beaten
- Health             - lists Snake's health

All key variables for the score screen
- Saves
- Continues
- ContPerCheckpoint
- Alerts
- Kills
- Rations

All inventory variables
- RationsHeld
- PlasticExplosives
- Mines
- RemoteMissiles
- RocketLauncherAmmo
- GrenadeLauncherAmmo
- SMGAmmo
- PistolAmmo

Current pointer position for Equipment and Weapon Inventory
- Active Weapon
- Active Item
