width = 28;
base_height = width;
screw_1 = 10;
screw_2 = 30;
screw_3 = 50;
screw_d = 6.5;  // M5
screw_h = 10;
screw_s = 5;
length = 65;
height = 80;
rise = height-2*base_height;
arm = 155;
post_d = 10;
post_h = 23;
cut_x = width-4;
cut_y = length-width;

$fn = 100;

// Screw Holes
module screw() {
  translate([0,0,-1]) cylinder(h=base_height+2, d=screw_d);
  translate([0,0,base_height-screw_s]) cylinder(h=height, d=screw_h);
}

// Base
difference() {
  union() {
    translate([-width/2, 0, 0]) cube([width, length, 2*base_height+rise]);
  }
  translate([0, screw_1, 0]) screw();
  translate([0, screw_2, 0]) screw();
  translate([0, screw_3, 0]) screw();
//  translate([-cut_x/2, -1, base_height]) cube([cut_x, cut_y+1, base_height+rise+1]);
}

// Riser
//translate([-width/2, length-width, base_height])
//cube([width, width, rise]);

// Post
translate([arm-width/2-post_d, length-width/2, base_height+rise-post_h]) 
post();

module post() {
  cup = 3*post_d;
  difference() {
    cylinder(d=post_d, h=post_h);
    translate([0,0,1-cup/2])
    sphere(d=cup);
  }
}  

//translate([0, 0, 22]) {
//  difference() {
//    union() {
//      rotate([0, 45, 0]) cube([20, length, 20]);
//      rotate([0, -135, 0]) cube([20, length, 20]);
//    }      
//    #translate([width/2, 0, -15]) cube([30, length, 30]);
//    #translate([-30-width/2, 0, -15]) cube([30, length, 30]);
//    #translate([-5, 0, -15]) cube([10, length, 30]);
//  }
//}