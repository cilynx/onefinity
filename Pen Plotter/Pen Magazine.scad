/////////////////////////////////////////////////////////////
// Ultra-Fine Tip Sharpies 8-Pack
// https://amzn.to/3M6t3z6
/////////////////////////////////////////////////////////////

//nib_d = 3.2;  // 2.5
//barrel_top_d = 12.7; // 11.8 at 65;
//barrel_top_h = 65;
//barrel_bot_d = 12;   // 11 at 20;
//x = 4;
//y = 2;
//space = 1;

/////////////////////////////////////////////////////////////
// Fine Point Sharpies 12-Pack
// https://amzn.to/3BqGQeS
/////////////////////////////////////////////////////////////

nib_d = 5.5;            // 4.6 at the collar
barrel_top_d = 13.5;    // 12.5 at 65
barrel_top_h = 65;
barrel_bot_d = 13.5;    // 12 at 20;
x = 4 ;
y = 3;
space = 2;

/////////////////////////////////////////////////////////////


bolt_d = 6.4;     // M5
bolt_x = 38;      // 38
bolt_z = 25;      // 25
bracket_x = 51.5; // 51
bracket_z = 38.5; // 38
bracket_y = 3;

$fn = 100;

inch = 25.4;
drop = 6*inch;

width = (x+3)*space+x*barrel_top_d;
depth = (y+1)*space+y*barrel_top_d;

difference() {
  cube([width, (y*barrel_top_d)+(y+1)*space, barrel_top_h]);

  translate([barrel_top_d/2+2*space, barrel_top_d/2+space, space])
  for(i=[0:x-1]) {
    translate([i*(barrel_top_d+space), 0, 0])
    for(j=[0:y-1]) {
      translate([0, j*(barrel_top_d+space), 0]) {
        cylinder(h=barrel_top_h+1, d2=barrel_top_d, d1=barrel_bot_d);
        translate([0,0,-space-1])
        cylinder(h=barrel_top_h, d=nib_d);
      }
    }
  }
}

top = drop-space;
bottom = drop-bracket_z-space;
middle = (top+bottom)/2;
center = width/2;

difference() {
  translate([0, -2*bracket_y, 0])
  cube([width, 2*bracket_y, drop]);

  translate([(width-bracket_x)/2,-2*bracket_y-0.01,drop-bracket_z-space]) {
    cube([bracket_x, bracket_y, bracket_z]);
  }

  translate([center-bolt_x/2,-bracket_y-0.1,middle-bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=bolt_d, h=bracket_y+1);

  translate([center-bolt_x/2,-bracket_y-0.1,middle+bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=bolt_d, h=bracket_y+1);

  translate([center+bolt_x/2,-bracket_y-0.1,middle-bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=bolt_d, h=bracket_y+1);

  translate([center+bolt_x/2,-bracket_y-0.1,middle+bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=bolt_d, h=bracket_y+1);  
}

difference() {
  translate([0, -bracket_y, 0])
  union() {
    cube([space, depth+bracket_y, drop]);
    translate([width-space,0,0])
    cube([space, depth+bracket_y, drop]);
  }
  translate([-10,depth,barrel_top_h])
  rotate([16.54,0,0])
  cube(100);
}

