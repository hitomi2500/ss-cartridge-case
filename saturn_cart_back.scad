include <saturn_cart_configuration.scad>
//PLEASE CHECK THAN CONFIGURATION IN saturn_cart_configuration.scad
//FITS YOUR CART BEFORE PRINTING

cart_x = 112; //this is not a parameter, added here just for reference
backlabel_x = 81; // X size of a sticker cutout
backlabel_y = 25.5; // Y size of a sticker cutout

module oblong(x, y, z, r) {
	minkowski()
	{
		translate([r,r,0])cube([x-2*r,y-2*r,z/2]);
		cylinder(r=r,h=z/2);
	}
 }

module quarter_tube(r1, r2, h) {
	intersection()
	{
		cube([r1,r1,h]);
		difference(){
			cylinder(r=r1,h=h);
			translate([0,0,-0.1])cylinder(r=r2,h=h+0.2);
		}
	}
}

module quarter_tore(r1, r2) {
    difference(){
        intersection()
        {
            rotate_extrude()translate([r1,0,0])circle(r2);
            cube([r1+r2,r1+r2,r2]);
        }
    }
}

module cartback_layout() {
    difference()
    {
        translate([0,-1,0]) oblong (12,57,5,1);
        translate([0,0,0]) cube ([1,70,1]);
    }
	translate([0,54,1]) cube ([1.6,cart_y-61,7.5]);
	translate([0,0,5]) cube ([1.6,55,3.5]);
	translate([8,cart_y-0.6,1]) cube ([cart_x/2-8,1.6,7.5]);
	translate([1,25,5]) cube([6,1,2]);
	translate([1,38,5]) cube([6,1,2]);
	translate([1,51,5]) cube([6,1,2]);
	translate([1,12,5]) cube([11,1,2]);
	translate([3,12,5]) cube([6,1,3.5]);
	translate([11,11.5,2]) cube([cart_x/2-11,1,5.5]);
	translate([11,1,2]) cube([1,11,5.5]);
	translate([11,0,2]) cube([1,2.5,6.5]);
	translate([1,-1,3]) cube([10,1,5.5]);
	translate([6.5,6.5,5])cylinder(r=4,h=2);
	translate([1,67,2]) cube([6,1,5]);
	translate([13,cart_y-6,2]) cube([1,6,5]);
	translate([1,0,4.5])rotate([0,0,180])quarter_tube(1,0,4);
	translate([11,0,4.5])rotate([0,0,270])quarter_tube(1,0,4);
	translate([8,cart_y-7,1])rotate([0,0,90])quarter_tube(8,6.4,7.5);
	translate([1,0,1])rotate([0,90,90])quarter_tube(1,0,73);
	translate([8,cart_y,1])rotate([0,90,0])quarter_tube(1,0,cart_x/2-8);
    translate([8,cart_y-7,1])rotate([0,180,0])quarter_tore(7,1);
    if (use_locks > 0)
    {
        translate([19.2,cart_y-3.6,6.7]) cube ([5.6,3.5,1.8]);
    }
    //guides to connect top and bottom
    if (use_guides > 0)
    {
        if (cart_type == "wasca v1.1")
        {
        }
        else if (cart_type == "wasca v1.4")
        {
        }
        else
        {
            translate([cart_x/2-14-guides_gap,cart_y-2.5,2]) cube([7,2,6]);
            translate([cart_x/2-14-guides_gap,cart_y-2.5,8]) cube([7,1.5,5.5]);
        }
        translate([-0.5,1.5,0])union()
        {
            translate([1.5,42.5+guides_gap,5]) cube([2,5.5-guides_gap*2,3]);
            translate([2,42.5+guides_gap,5]) cube([1.6,5.5-guides_gap*2,8]);
        }
    }
}

module cartback_layout_holes() {
    if (remove_unprintable_concaves < 1)
    {
        translate([-1,-2,-1]) oblong (12,56,4,1);	
    }
    if (remove_unprintable_concaves < 2)
    {
        translate([20,cart_y-10,-1]) cube ([cart_x/2-20,1,2]);
        translate([28,cart_y-14,-1]) cube ([cart_x/2-28,1,2]);
        translate([36,cart_y-18,-1]) cube ([cart_x/2-36,1,2]);
        translate([42,cart_y-22,-1]) cube ([cart_x/2-42,1,2]);
        translate([50,cart_y-26,-1]) cube ([cart_x/2-50,1,2]);
        translate([6.5,6.5,-9])cylinder(r=3.5,h=13);
    }    
    translate([6.5,6.5,-8])cylinder(r=1.5,h=17);
    translate([1,0,8]) cube ([1,cart_y-7,1]);
    translate([8,cart_y-1,8]) cube ([11.2,1,1]);
    translate([24.8,cart_y-1,8]) cube ([cart_x/2-24.8,1,1]);
    translate([8,cart_y-7,8])rotate([0,0,90])quarter_tube(7,6,1);
    if (use_locks < 1)
    {
        translate([8,cart_y-1,8]) cube ([19,1,1]);
    }
    if (cart_type == "wasca v1.1")
    {
        translate([-1,-2,-1]) oblong (12,56,4,1);
    }
    if (cart_type == "wasca v1.4")
    {
        translate([-10,62,5]) cube ([20,10,50]);  //usb hole 
        translate([cart_x/2-1,cart_y/2-5,2]) cube ([10,10,10]);  //remove pillar                  
    }
}

union()
{
	difference(){
		union(){
			translate([1,0,0]) oblong (cart_x-2,cart_y,2,7);
            cartback_layout();
			translate([cart_x,0,0])mirror()cartback_layout();
            if (back_central_pillar)
                translate([cart_x/2,cart_y/2,2])cylinder(r=2.5,h=5);
		}
		union(){
			if (remove_unprintable_concaves < 1)
            {
                translate([(cart_x-backlabel_x)/2,cart_y/2-33,-1]) oblong (backlabel_x,backlabel_y,2,2.5);
            }
			cartback_layout_holes();
            translate([cart_x,0,0])mirror()cartback_layout_holes();
            translate([cart_x/2,cart_y/2,2])cylinder(r=1.5,h=6);
            if (cart_type == "Saturn USB Cart Rev 3")
                translate([-5,56.5,6.5]) cube([20,12,10]); //usb hole
            if (cart_type == "wasca v1.1")
            {
                translate([cart_x/2+3,cart_y+5,8])rotate([90,0,0])cylinder(r=3,h=15);//led cutout
                translate([64,77,2]) cube([29,5,10]);//sd card cutout

            }
		}
	}

}

