include <saturn_cart_configuration.scad>
//PLEASE CHECK saturn_cart_configuration.scad BEFORE PRINTING !!!

cart_x = 112; //this is not a parameter, added here just for reference

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
    translate([0,0,1]) cube ([1.6,cart_y-7,8.5]);
	translate([8,cart_y-0.6,1]) cube ([cart_x/2-8,1.6,8.5]);
	translate([2,25,2]) cube([5.5,1,5.5]);
	translate([2,38,2]) cube([5.5,1,5.5]);
	translate([2,52,2]) cube([5.5,1,5.5]);
    translate([-0.5,1.5,0])union()
    {
        if (cart_type == "Saturn USB Cart Rev 3")
            translate([6.5,40,2]) cube([1.5,7.5,9.5]);
        else
            translate([5.5,40,2]) cube([1,7.5,9.5]);        
        translate([2,40,2]) cube([4.5,1,6.5]);
        translate([2,46.5,2]) cube([4.5,1,6.5]);
        translate([4,40,2]) cube([2.5,1,9.5]);
        translate([4,46.5,2]) cube([2.5,1,9.5]);
    }
	translate([2,12,2]) cube([6.5,1,6.5]);
	translate([13.5,11.5,2]) cube([cart_x/2-13.5,1,5.5]);
	translate([13.5,11.5,2]) cube([4.5,1,6.5]);
	translate([11,0,2]) cube([1,2.5,7]);
	translate([1,-1,1]) cube([10,1,8]);
	translate([4.5,0,1]) cube([4,0.5,8.5]);
	translate([6.5,6.5,2])cylinder(r=2.5,h=8);
	translate([1,67,2]) cube([6,1,5.5]);
	translate([13,cart_y-6,2]) cube([1,6,5]);
    if (use_locks > 0)
    {
        translate([16,cart_y-2.5,2]) cube([12,2,11.5]);
	}
    translate([1,0,1])rotate([0,0,180])quarter_tube(1,0,8);
	translate([11,0,1])rotate([0,0,270])quarter_tube(1,0,8);
	translate([8,cart_y-7,1])rotate([0,0,90])quarter_tube(8,6.4,8.5);
	translate([1,0,1])rotate([0,90,90])quarter_tube(1,0,73);
	translate([8,cart_y,1])rotate([0,90,0])quarter_tube(1,0,cart_x/2-8);
    translate([8,cart_y-7,1])rotate([0,180,0])quarter_tore(7,1);
    translate([37/2,24,2])rotate([90,0,180])linear_extrude(height = cart_y-33)polygon(points=[[0,0],[0,1],[6,0]]);
    translate([11,0,1])rotate([0,90,180])quarter_tube(1,0,10);
    translate([1,0,0])cube([10,10,2]);
    translate([1,0,1])sphere(r=1);
    translate([11,0,1])sphere(r=1);
    //guides to connect top and bottom
    if (use_guides > 0)
    {
        translate([15.5,cart_y-2.5,2]) cube([12,2,11.5]);
	}
}

module cartback_layout_holes() {
    translate([6.5,6.5,1])cylinder(r=1,h=15);
    translate([-1,-1,9]) cube ([2,cart_y-6,2]);
    translate([8,cart_y,9]) cube ([cart_x/2-8,1,1]);
    translate([8,cart_y-7,9])rotate([0,0,90])quarter_tube(9,7,1);
    if (use_locks > 0)
    {
        translate([19,cart_y-3,9]) cube([6,4,2]);
    }
    if (remove_unprintable_concaves < 1)
    {
        translate([37/2,24,0])rotate([90,0,180])linear_extrude(height = cart_y-33)polygon(points=[[0,0],[0,1],[6,0]]);
    }
    if (remove_unprintable_concaves < 2)
    {
        translate([0,cart_y-14.5,-1]) cube([9,3,1.5]);
        translate([-1,cart_y-14.5,0]) cube([1.5,3,6]);
        translate([-0.5,cart_y-14.5,0.5])rotate([0,45,0])cube([1,3,1]);
        translate([0,cart_y-20.5,-1]) cube([9,3,1.5]);
        translate([-1,cart_y-20.5,0]) cube([1.5,3,6]);
        translate([-0.5,cart_y-20.5,0.5])rotate([0,45,0])cube([1,3,1]);
        translate([0,cart_y-26.5,-1]) cube([9,3,1.5]);
        translate([-1,cart_y-26.5,0]) cube([1.5,3,6]);
        translate([-0.5,cart_y-26.5,0.5])rotate([0,45,0])cube([1,3,1]);
        translate([0,cart_y-32.5,-1]) cube([9,3,1.5]);
        translate([-1,cart_y-32.5,0]) cube([1.5,3,6]);
        translate([-0.5,cart_y-32.5,0.5])rotate([0,45,0])cube([1,3,1]);
    }
    //antiedge
    translate([4,-10,4])rotate([0,90,90])difference()
    {
        cube([4,4,100]);
        quarter_tube(4,0,100);
    }
}

union()
{
	difference(){
		union(){
			translate([1,0,0]) oblong (cart_x-2,cart_y,2,7);
            translate([37/2,24,1.5]) cube ([cart_x-37,cart_y-30,1.5]);
            cartback_layout();
			translate([cart_x,0,0])mirror()cartback_layout();
            if (front_central_pillar)
                translate([cart_x/2-7,cart_y/2,3])cylinder(r=2.5,h=5.5);
            translate([51.5,11.5,2]) cube([4.5,1,6.5]);
		}
		union(){
            if (remove_unprintable_concaves < 1)
            {
                translate([37/2,24,0]) cube ([cart_x-37,cart_y-33,1]);
            }
			if (remove_unprintable_concaves < 2)
            {
                translate([cart_x/2-5.5,6,0])linear_extrude(height = 0.5)polygon(points=[[0,9.5],[11,9.5],[5.5,0]]);
            }
            cartback_layout_holes();
            translate([cart_x,0,0])mirror()cartback_layout_holes();
            translate([cart_x/2-7,cart_y/2,3])cylinder(r=1.5,h=6);
            if (cart_type == "Saturn USB Cart Rev 3")
                translate([cart_x-9,56.5,2]) cube([10,12,10]); //usb hole
            if (cart_type == "wasca v1.1")
            {
                translate([20,45,-5]) cube ([50,100,50]); //connectors cutout
                translate([-10,62,2]) cube ([20,10,50]);  //usb hole     
            }
            if (cart_type == "wasca v1.4")
            {
                translate([20,65,-5]) cube ([30,100,50]); //sd cutout
                translate([57,69.5,-5]) cube ([20,10,50]); //debug cutout
                translate([103,50,-5]) cube ([10,50,50]); //esp32 cutout
                translate([10,75.5,-5]) cylinder(r=2,h=10); //led cutout
                translate([81,75.5,-5]) cylinder(r=2,h=10); //led2 cutout
                translate([19,27,-5]) cube ([5,13,50]); //dfu cutout
                translate([7,51.5,-5]) cube ([7,7,50]); //stm32 debug cutout
                translate([-10,60.5,2]) cube ([20,10,50]);  //usb hole 
                //translate([cart_x/2-28.5,70.5,7]) cube ([57,10,1.5]);  //pcb hole      
                //translate([cart_x/2-50,70.5,7]) cube ([9,10,1.5]);  //pcb hole  
                //translate([cart_x/2-55,70.5,3]) cube ([9,10,10]);  //pcb hole2  
                translate([cart_x/2-12,cart_y/2-5,3]) cube ([10,10,10]);  //remove pillar                  
            }
        }
	}

}

