$fn=64;

cart_y = 80; //cartridge height

//cartridge types here, comment all but your type
//NOT YET SUPPORTED cart_type = "Power Memory";  //Official Backup RAM aka Power memory by SEGA
//NOT YET SUPPORTED cart_type = "Action Replay";   //Action Replay by Datel, old black cart
//NOT YET SUPPORTED cart_type = "Pro Action Replay Old";  //Pro Action Replay by Datel, old black cart
//NOT YET SUPPORTED cart_type = "Pro Action Replay Karat";  //Pro Action Replay by Karat, same as old Datel?
//NOT YET SUPPORTED cart_type = "Pro Action Replay";  //Pro Action Replay by Datel, with comm link connector
//NOT YET SUPPORTED cart_type = "Pro Action Replay EMS";  //Pro ction Replay by EMS, with comm link connector
//NOT YET SUPPORTED cart_type = "Action Replay Plus";  //Action Replay Plus by EMS, with comm link connector
//NOT YET SUPPORTED cart_type = "Action Replay Plus Linkless";  //Action Replay Plus by EMS, without comm link
//NOT YET SUPPORTED cart_type = "Saturn USB Cart Rev 2";        //USB dev cart Rev 2 by antime
cart_type = "Saturn USB Cart Rev 3";        //USB dev cart Rev 3 by antime
//NOT YET SUPPORTED cart_type = "SD card reader & USB Rev 1b";  //SD card reader with USB dev Rev 1b by cafe-alpha and antime
//NOT YET SUPPORTED cart_type = "SD card reader & USB Rev 1c";  //SD card reader with USB dev Rev 1c by cafe-alpha and antime
//NOT YET SUPPORTED cart_type = "USB Dev Cart Rev 2e";          //SD card reader with USB dev Rev 2e by cafe-alpha and antime
//NOT YET SUPPORTED cart_type = "USB Dev Cart Rev 2f";          //SD card reader with USB dev Rev 2f by cafe-alpha and antime

//If you are 3d-printing with filament extrusion and
//without support material, some concaves will become
//unprintable. You can remove them here.
//Choose 0 for no action, 1 to remove big concaves,
// 2 to remove all concaves (flat surface)
remove_unprintable_concaves = 0;

//Central pillars can intersect with some parts.
//By default, they're enabled. Set to 0 remove them.
front_central_pillar = 1;
back_central_pillar = 1;