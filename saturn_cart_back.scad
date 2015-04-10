$fn=64;

cart_x = 112;
cart_y = 80;
backlabel_x = 81;
backlabel_y = 25.5;

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
    translate([0,-1,2]) oblong (12,57,3,1);
	translate([0,54,1]) cube ([1.6,19,7.5]);
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
	translate([1,50,1])rotate([0,90,90])quarter_tube(1,0,23);
	translate([8,cart_y,1])rotate([0,90,0])quarter_tube(1,0,cart_x/2-8);
    translate([8,cart_y-7,1])rotate([0,180,0])quarter_tore(7,1);
    translate([18,cart_y-1.6,7.5]) cube ([8,1.5,1]);
}

module cartback_layout_holes() {
    translate([-1,-2,-1]) oblong (12,56,4,1);
	translate([6.5,6.5,1])cylinder(r=1.5,h=7);
	translate([6.5,6.5,1])cylinder(r=3.5,h=3);
    translate([1,0,8]) cube ([1,cart_y-7,1]);
    translate([8,cart_y-1,8]) cube ([10,1,1]);
    translate([26,cart_y-1,8]) cube ([cart_x/2-26,1,1]);
    translate([8,cart_y-7,8])rotate([0,0,90])quarter_tube(7,6,1);
    translate([16,cart_y-1,6.5]) cube ([12,1,1]);
    translate([16,cart_y-1,7]) cube ([2,1,1]);
    translate([26,cart_y-1,7]) cube ([2,1,1]);
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
			translate([(cart_x-backlabel_x)/2,7,-1]) oblong (backlabel_x,backlabel_y,2,2.5);
			cartback_layout_holes();
            translate([cart_x,0,0])mirror()cartback_layout_holes();
            translate([cart_x/2,cart_y/2,2])cylinder(r=1.5,h=6);
		}
	}

}

