bolt_d = 5;
bolt_x = 20;
post_y = 160;
post_x = 89;
post_z = 84;
post_d = 10;
cup_d = 6;
cup_z = 5;
pad = 1;
thickness = 1;

x_0 = pad+bolt_d/2+bolt_x;
y_0 = post_y+post_d/2+pad;

$fn=100;

difference() {
  // Y-Body
  cube([bolt_x+bolt_d+2*pad, post_y+bolt_d/2+post_d/2+2*pad, thickness]);
 
  // Mounting holes
  translate([x_0, y_0, -0.1])
  cylinder(d=bolt_d, h=thickness+1);

  translate([x_0-bolt_x, y_0, -0.1])
  cylinder(d=bolt_d, h=thickness+1);
  
}

// X-Body
cube([post_x+bolt_x+post_d/2+bolt_d/2+2*pad, post_d+2*pad, thickness]);

// Post
translate([x_0+post_x, y_0-post_y, -post_z])
cylinder(d=post_d, h=post_z);

// Cup
translate([x_0+post_x, y_0-post_y, -post_z-cup_z])
difference() {
  cylinder(d=post_d, h=cup_z);
  cylinder(d2=cup_d, d1=post_d, h=cup_z);
}