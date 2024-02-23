/////////////////////////////////////////////////////////////
// Fine Point Sharpies 12-Pack
// https://amzn.to/3BqGQeS
/////////////////////////////////////////////////////////////

nib_d = 5.5;            // 4.6 at the collar
slot_d = 13.5;          // 12.5 at 65
slot_h = 80;
height = 160;
spindle_d = 64;
space = 1;
wall = 2;
key = 6;

shift = slot_d + space;

$fn=100;

pop = [[0,1,1,0],
       [1,1,1,1],
       [1,1,1,1],
       [0,1,1,0]];

difference() {
    cylinder(d=spindle_d, h=height);
    translate([0, 0, slot_h])
    cylinder(d=spindle_d-2*wall, h=height);
    translate([-3/2*shift, -3/2*shift, 0])
    for(i=[0:3]) {
        for(j=[0:3]) {
            if(pop[i][j]) {
                translate([shift*i, shift*j, 0.5])
                cylinder(d=slot_d, h=slot_h);
                translate([shift*i, shift*j, -1])
                cylinder(d=nib_d, h=2);
            }
        }
    }
}

translate([-key/2, spindle_d/2-wall])
cube([key, 2/3*key, height]);