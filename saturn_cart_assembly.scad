include <saturn_cart_configuration.scad>
include <saturn_cart_back.scad>
include <saturn_cart_front.scad>
//PLEASE CHECK THAN CONFIGURATION IN saturn_cart_configuration.scad
//FITS YOUR CART BEFORE PRINTING

module pcb() {
	color("green")linear_extrude(height = 1.6)
    polygon(points=[[26.85,80.95],[35.9,80.95],[35.9,87.3],[48.85,87.3],
    [48.85,80.95],[105.4,80.95],[105.4,87.3],[117.9,87.3],
    [117.9,80.95],[126.9,80.95],[126.9,109.8],[125.35,109.8],
    [125.35,117.8],[126.9,117.8],[126.9,136.3],[122.35,136.3],
    [122.35,146.3],[114.85,146.3],[114.85,158.3],[82.85,158.3],
    [82.85,146.3],[76.85,146.3],[76.85,158.3],[39.85,158.3],
    [39.85,146.3],[32.35,146.3],[32.35,136.3],[26.85,136.3],
    [26.85,117.8],[28.35,117.8],[28.35,109.8],[26.85,109.8]
    ]);
    //led
    translate([66.7,85.25,0])difference() { sphere(r=3); translate([-10,-10,0])cube([20,20,20]);};
    //sd card
    color("silver")translate([0,0,-1.5])linear_extrude(height = 1.5)
     polygon(points=[[77,81.5],[103.85,81.5],[103.85,98.25],[79.3,98.25],
    [79.3,93.85],[77,92.05] ]);
    //esp32
    color("black")translate([0,0,-10])linear_extrude(height = 10)
     polygon(points=[[28.15,82],[30.65,82],[30.65,106.35],[28.15,106.35] ]);
    //sodimm
    color("blue")translate([0,0,0])linear_extrude(height = 7)
     polygon(points=[[36,90],[108,90],[108,128.5],[36,128.5] ]);
}

difference()
{
    union()
    {
        translate([62,-50,10])rotate([0,180,0])cart_front();
        translate([-50,-50,-7.5])cart_back();
        translate([-70.8,109,2.5])rotate([180,0,0])pcb();
    }
    //translate([-27,-80,-40])cube([200,200,100]);//cut for left lock
    //translate([15,-80,-40])cube([200,200,100]);//cut for left lock
}

//front and pcb check
/*intersection()
{
        translate([62,-50,10])rotate([0,180,0])cart_front();
        translate([-70.8,109,2.5])rotate([180,0,0])pcb();
}*/

//back and pcb check
/*intersection()
{
        translate([-50,-50,-7.5])cart_back();
        translate([-70.8,109,2.5])rotate([180,0,0])pcb();
}*/

//front and back check
/*intersection()
{
        translate([62,-50,10])rotate([0,180,0])cart_front();
        translate([-50,-50,-7.5])cart_back();
}*/
