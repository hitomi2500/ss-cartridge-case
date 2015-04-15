$fn=64;

cart_x = 112;
cart_y = 80;

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
        //translate([0,0,-r2])cylinder(r=r1,h=r2*1);
    }
}

module cartback_layout() {
    translate([1,0,0]) oblong (12,57,2,1);
	translate([0,0,1]) cube ([1.6,cart_y-7,7.5]);
	translate([8,cart_y-0.6,1]) cube ([cart_x/2-8,1.6,7.5]);
	translate([1,25,5]) cube([6,1,2]);
	translate([1,38,5]) cube([6,1,2]);
	translate([1,51,5]) cube([6,1,2]);
	translate([1,12,5]) cube([11,1,2]);
	translate([3,12,5]) cube([6,1,3.5]);
	translate([11,11.5,2]) cube([cart_x/2-11,1,5.5]);
	translate([11,0,2]) cube([1,2.5,6]);
	translate([1,-1,1]) cube([10,1,7]);
	translate([6.5,6.5,2])cylinder(r=2.5,h=9);
	translate([1,67,2]) cube([6,1,5]);
	translate([13,cart_y-6,2]) cube([1,6,5]);
	translate([1,0,1])rotate([0,0,180])quarter_tube(1,0,7);
	translate([11,0,1.5])rotate([0,0,270])quarter_tube(1,0,6.5);
	translate([8,cart_y-7,1])rotate([0,0,90])quarter_tube(8,6.4,7.5);
	translate([1,0,1])rotate([0,90,90])quarter_tube(1,0,73);
	translate([8,cart_y,1])rotate([0,90,0])quarter_tube(1,0,cart_x/2-8);
    translate([8,cart_y-7,1])rotate([0,180,0])quarter_tore(7,1);
}

module cartback_layout_holes() {
    translate([6.5,6.5,1])cylinder(r=1,h=15);
	translate([-1,-1,8]) cube ([2,cart_y-6,2]);
    translate([8,cart_y,8]) cube ([cart_x/2-8,1,1]);
    translate([8,cart_y-7,8])rotate([0,0,90])quarter_tube(9,7,1);
 }

union()
{
	difference(){
		union(){
			translate([1,0,0]) oblong (cart_x-2,cart_y,2,7);
            cartback_layout();
			translate([cart_x,0,0])mirror()cartback_layout();
            translate([cart_x/2,cart_y/2,2])cylinder(r=2.5,h=5);
		}
		union(){
			cartback_layout_holes();
            translate([cart_x,0,0])mirror()cartback_layout_holes();
            translate([cart_x/2,cart_y/2,2])cylinder(r=1.5,h=6);
		}
	}

}

