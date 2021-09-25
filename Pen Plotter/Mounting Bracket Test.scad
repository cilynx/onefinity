bolt_d = 6.4;     // M5
bolt_x = 38;      // 38
bolt_z = 25;      // 25
bracket_x = 51.5; // 51
bracket_z = 38.5; // 38
bracket_y = 6;
pad = 1;
width = bracket_x+2*pad;
height = bracket_z+2*pad;

$fn=100;

difference() {
  cube([width, height, bracket_y]);
  
  translate([pad, pad, bracket_y/2]) cube([bracket_x, bracket_z, bracket_y]);
  
  translate([width/2+bolt_x/2, height/2+bolt_z/2]) cylinder(d=bolt_d, h=bracket_z);
  translate([width/2+bolt_x/2, height/2-bolt_z/2]) cylinder(d=bolt_d, h=bracket_z);
  translate([width/2-bolt_x/2, height/2+bolt_z/2]) cylinder(d=bolt_d, h=bracket_z);
  translate([width/2-bolt_x/2, height/2-bolt_z/2]) cylinder(d=bolt_d, h=bracket_z);
}