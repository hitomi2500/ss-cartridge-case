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
    *translate([1,0,0]) oblong (12,57,2,1);
	translate([0,0,1]) cube ([1.6,cart_y-7,8.5]);
	translate([8,cart_y-0.6,1]) cube ([cart_x/2-8,1.6,8.5]);
	translate([2,25,2]) cube([4.5,1,6.5]);
	translate([2,38,2]) cube([4.5,1,6.5]);
	translate([2,52,2]) cube([4.5,1,6.5]);
	translate([2,12,2]) cube([6.5,1,6.5]);
	translate([13.5,11.5,2]) cube([cart_x/2-13.5,1,5.5]);
	translate([13.5,11.5,2]) cube([4.5,1,6.5]);
	translate([11,0,2]) cube([1,2.5,7]);
	translate([1,-1,1]) cube([10,1,8]);
	translate([4.5,0,1]) cube([4,0.5,8.5]);
	translate([6.5,6.5,2])cylinder(r=2.5,h=9);
	translate([1,67,2]) cube([6,1,5]);
	translate([13,cart_y-6,2]) cube([1,6,5]);
	translate([1,0,1])rotate([0,0,180])quarter_tube(1,0,8);
	translate([11,0,1])rotate([0,0,270])quarter_tube(1,0,8);
	translate([8,cart_y-7,1])rotate([0,0,90])quarter_tube(8,6.4,8.5);
	translate([1,0,1])rotate([0,90,90])quarter_tube(1,0,73);
	translate([8,cart_y,1])rotate([0,90,0])quarter_tube(1,0,cart_x/2-8);
    translate([8,cart_y-7,1])rotate([0,180,0])quarter_tore(7,1);
    translate([37/2,24,2])rotate([90,0,180])linear_extrude(height = cart_y-33)polygon(points=[[0,0],[0,1],[6,0]]);
    
}

module cartback_layout_holes() {
    translate([6.5,6.5,1])cylinder(r=1,h=15);
	translate([-1,-1,9]) cube ([2,cart_y-6,2]);
    translate([8,cart_y,9]) cube ([cart_x/2-8,1,1]);
    translate([8,cart_y-7,9])rotate([0,0,90])quarter_tube(9,7,1);
    translate([37/2,24,0])rotate([90,0,180])linear_extrude(height = cart_y-33)polygon(points=[[0,0],[0,1],[6,0]]);
 }

union()
{
	difference(){
		union(){
			translate([1,0,0]) oblong (cart_x-2,cart_y,2,7);
            translate([37/2,24,1.5]) cube ([cart_x-37,cart_y-30,1.5]);
            cartback_layout();
			translate([cart_x,0,0])mirror()cartback_layout();
            translate([cart_x/2,cart_y/2,3])cylinder(r=2.5,h=5.5);
            translate([51.5,11.5,2]) cube([4.5,1,6.5]);
		}
		union(){
            
            translate([37/2,24,0]) cube ([cart_x-37,cart_y-33,1]);
			cartback_layout_holes();
            translate([cart_x,0,0])mirror()cartback_layout_holes();
            translate([cart_x/2,cart_y/2,3])cylinder(r=1.5,h=6);
		}
	}

}

