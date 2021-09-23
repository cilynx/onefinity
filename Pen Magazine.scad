body_d1 = 11.4;
body_d2 = 11.15;
body_h1 = 64.9;
body_h2 = 20;
tip_d = 2.8; // Actual is 2.5 -- bigger for elephant-foot
height = body_h1;
//height = 5;
space = 1;

tip_r = tip_d/2;
r = body_d1/2;
p = sqrt(r^2-tip_r^2);

$fn = 40;

inch = 25.4;

bolt_x = 36;
bolt_z = 25;
bracket_x = 2*inch;
bracket_z = 1.5*inch;
bracket_y = 1/8*inch;
drop = 6*inch;

x = 4;
y = 2;

width = (x+3)*space+x*body_d1;
depth = (y+1)*space+y*body_d1;

difference() {
  cube([width, (y*body_d1)+(y+1)*space, height]);

  translate([body_d1/2+2*space, body_d1/2+space, p])
  for(i=[0:x-1]) {
    translate([i*(body_d1+space), 0, 0])
    for(j=[0:y-1]) {
      translate([0, j*(body_d1+space), 0]) {
        cylinder(h=height+1, d=body_d1);
        sphere(d=body_d1);
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
  cylinder(d=5, h=bracket_y+1);

  translate([center-bolt_x/2,-bracket_y-0.1,middle+bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=5, h=bracket_y+1);

  translate([center+bolt_x/2,-bracket_y-0.1,middle-bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=5, h=bracket_y+1);

  translate([center+bolt_x/2,-bracket_y-0.1,middle+bolt_z/2])
  rotate([-90,0,0])
  cylinder(d=5, h=bracket_y+1);  
}

difference() {
  translate([0, -bracket_y, 0])
  union() {
    cube([space, depth+bracket_y, drop]);
    translate([width-space,0,0])
    cube([space, depth+bracket_y, drop]);
  }
  translate([-10,depth,height])
  rotate([16.54,0,0])
  cube(100);
}

