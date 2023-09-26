$fn=64;

cart_y = 80; //cartridge height

//cartridge types here, comment all but your type
//please be aware about the comment after the type definition
// NOT YET SUPPORTED - cart might be supported later, but no actual support yet
// ALPHA SUPPORT - cart is supported, but still is not checked or have some bugs
// NO COMMENT - cart is checked and fits well for most testers
//If you happen to own a cart that is either not supported or in alpha stage
//(even if not from the list), please consider helping the project to support it.
//You will need a 3d printer or 3d printing services access to do so.
//Just open the issue on the github ss-cartridge-case project.

//cart_type = "Power Memory";  //ALPHA SUPPORT //Official Backup RAM aka Power memory by SEGA
//cart_type = "RAM 1M";  //NOT YET SUPPORTED //RAM 1M expansion by SEGA
//cart_type = "RAM 4M";  //NOT YET SUPPORTED //RAM 4M expansion by SEGA
//cart_type = "Action Replay"; //NOT YET SUPPORTED //AR by Datel, old black type
//cart_type = "Pro Action Replay Old";  //NOT YET SUPPORTED //Pro AR by Datel, old black type
//cart_type = "Pro Action Replay Karat"; //NOT YET SUPPORTED //Pro AR by Karat, same as old Datel?
//cart_type = "Pro Action Replay"; //NOT YET SUPPORTED //Pro AR by Datel, with comm link connector
//cart_type = "Pro Action Replay EMS"; //NOT YET SUPPORTED //Pro AR by EMS, with comm link connector
//cart_type = "Action Replay Plus"; //NOT YET SUPPORTED //AR Plus by EMS, with comm link connector
//cart_type = "Action Replay Plus Linkless"; //NOT YET SUPPORTED //AR Plus by EMS, without comm link
//cart_type = "Saturn USB Cart Rev 2"; //NOT YET SUPPORTED //USB dev cart Rev 2 by antime
//cart_type = "Saturn USB Cart Rev 3"; //ALPHA SUPPORT //USB dev cart Rev 3 by antime
//cart_type = "SD card reader & USB Rev 1b"; //NOT YET SUPPORTED //SD card reader with USB dev Rev 1b by cafe-alpha and antime
//cart_type = "SD card reader & USB Rev 1c"; //NOT YET SUPPORTED //SD card reader with USB dev Rev 1c by cafe-alpha and antime
//cart_type = "USB Dev Cart Rev 2e"; //NOT YET SUPPORTED //SD card reader with USB dev Rev 2e by cafe-alpha and antime
//cart_type = "USB Dev Cart Rev 2f"; //NOT YET SUPPORTED //SD card reader with USB dev Rev 2f by cafe-alpha and antime
//cart_type = "wasca v1.1"; //ALPHA SUPPORT  //wasca cart v1.1 by hitomi2500
//cart_type = "wasca v1.4"; //ALPHA SUPPORT  //wasca cart v1.4 by cafe-alpha and hitomi2500
cart_type = "wasca v1.7"; //ALPHA SUPPORT  //wasca cart v1.7 by cafe-alpha and hitomi2500

//If you are 3d-printing with filament extrusion and
//without support material, some concaves will become
//unprintable. You can remove them here.
//Choose 0 for no action, 1 to remove big concaves,
// 2 to remove all concaves (flat surface)
remove_unprintable_concaves = 0;

//Locks are unprintable without support, and could fail
//to actually lock without mechanical adaptation
//0 - locks are disabled, 1 - locks are enabled
//GUIDES AND LOCKS DON'T WORK TOGETHER, DON'T ENABLE BOTH
use_locks = 0;

//Guides are easy-printable. they let top and bottom parts connect
//without any shift, and even can hold'em together a bit if
//printed precisely enough.
//GUIDES AND LOCKS DON'T WORK TOGETHER, DON'T ENABLE BOTH
use_guides = 1;

//to facilitate your printer inaccuracy, you can set additional
//gap between the guides (in mm). Increase this if your slides are
//too tight, and decrease if they're loose. Negative values
//are possible.
guides_gap = 0.0;

//Central pillars can intersect with some parts.
//By default, they're enabled. Set to 0 remove them.
front_central_pillar = 1;
back_central_pillar = 1;
