// Spindle bracket mount
bolt_d = 6.4;     // M5
bolt_width = 38;      // 38
bolt_height = 25;      // 25
bracket_width = 51.5; // 51
bracket_height = 38.5; // 38
bracket_depth = 3;

// Hemera
hb_width = 34;
hb_height = 34;
hb_d = 4.5;        // M3 bolts
h_drop = 100;
h_width = 40;
h_height = 43.25;

// Main body
width = bracket_width + 2*bolt_d;
depth = 10;
center = width/2;
h_center = center+5;
dx = (width-bracket_width)/2;
middle = dx + bracket_height/2;
h_middle = middle + h_drop;
height = h_middle + hb_height/2 + dx;

$fn = 100;


difference() {
   // Main body
   cube([width, height, depth]);
    
   // Spindle bracket mounting surface
   translate([dx, dx, depth-bracket_depth])
   cube([bracket_width, bracket_height, bracket_depth+1]);

   // Spindle bracket mounting bolts
   translate([center+bolt_width/2, middle+bolt_height/2, -1])
   cylinder(d=bolt_d, h=depth);
   translate([center-bolt_width/2, middle+bolt_height/2, -1])
   cylinder(d=bolt_d, h=depth);
   translate([center+bolt_width/2, middle-bolt_height/2, -1])
   cylinder(d=bolt_d, h=depth);
   translate([center-bolt_width/2, middle-bolt_height/2, -1])
   cylinder(d=bolt_d, h=depth);

   // Hemera mounting bolts
   translate([h_center+hb_width/2, h_middle+hb_height/2, -1])
   cylinder(d=hb_d, h=depth+2);
   translate([h_center+hb_width/2, h_middle-hb_height/2, -1])
   cylinder(d=hb_d, h=depth+2);
   translate([h_center-hb_width/2, h_middle+hb_height/2, -1])
   cylinder(d=hb_d, h=depth+2);
   translate([h_center-hb_width/2, h_middle-hb_height/2, -1])
   cylinder(d=hb_d, h=depth+2);
}