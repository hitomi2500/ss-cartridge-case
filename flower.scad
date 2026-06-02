module flower() {
flower_unit = 5; // Y size of a sticker cutout

for (i = [0 : 3]) {
    rotate([0, 0, i * 90])      // rotate around Z axis
        translate([flower_unit/2, -flower_unit/2, 0])         // move outward from center
            union() {
                cube ([flower_unit,flower_unit,10]);
                translate([0,flower_unit,0])cube ([flower_unit,flower_unit,10]);
                
                translate([flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([flower_unit,6*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                
                translate([2*flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([3*flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([5*flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([6*flower_unit,2*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                
                translate([2*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([2*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([2*flower_unit,6*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([2*flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([2*flower_unit,8*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([3*flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([5*flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([6*flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([7*flower_unit,3*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([3*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([3*flower_unit,6*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([3*flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([3*flower_unit,8*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([3*flower_unit,9*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([4*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([5*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([6*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([7*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([8*flower_unit,4*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([4*flower_unit,6*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,8*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,9*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([4*flower_unit,10*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([5*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([6*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([7*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([8*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([9*flower_unit,5*flower_unit,0])cube ([flower_unit,flower_unit,10]);

                translate([6*flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([7*flower_unit,7*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([6*flower_unit,8*flower_unit,0])cube ([flower_unit,flower_unit,10]);
                translate([8*flower_unit,9*flower_unit,0])cube ([flower_unit,flower_unit,10]);
            }
}
}