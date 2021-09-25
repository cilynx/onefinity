bolt_d = 5.5; // M5 + tolerance
bolt_x = 19;
post_y = 160;
post_x = 89;
post_z = 100;
post_d = 10;
cup_d = 6;
cup_z = 5;
pad = 3;
thickness = 10;

x_0 = pad+bolt_d/2+bolt_x;
y_0 = post_y+post_d/2+pad;

$fn=100;

w = bolt_d+bolt_x+2*pad;
r = post_x+bolt_x+post_d/2+bolt_d/2+2*pad-w-post_d/2;

echo(w);

translate([r+w,r+w-7,0]) {
  rotate([0,0,180])
  rotate_extrude(angle=90)
  translate([r,0,0])
  square(w);

  translate([0,-r-w/2,0])
  cylinder(h=w, d=w);
}


translate([0,172.5,0])
cube([w, 10, w]);

difference() {
  // Y-Body
  height = post_y+bolt_d/2+post_d/2+2*pad;
  part = 64;
  translate([0,height-part,0])
  cube([w, part, w]);
   
  // Mounting holes
  translate([x_0, y_0, -0.1]) {
    cylinder(d=bolt_d, h=w+1);
    translate([0,0,w-5]) cylinder(d=9, h=10);
  }

  translate([x_0-bolt_x, y_0, -0.1]) {
    cylinder(d=bolt_d, h=w+1);
    translate([0,0,w-5]) cylinder(d=9, h=10);
  }
}

// Post
cup = 3*post_d;
translate([x_0+post_x, y_0-post_y, -post_z]) {
  difference() {
    cylinder(d=post_d, h=post_z);
    translate([0,0,1-cup/2])
    sphere(d=cup);
  }
}

