// Hemera
hemera_depth = 44;
hemera_height = 44;

// Bolt Holes
hb_w = 34;
hb_h = 34;

// Body Parameters
spindle_d = 64;
channel_d = 20;
height = 150;

$fn=100;

module bolt_hole() {
    thread_d = 4;   // M3 bolts
    head_d = 6;   // Allen head
    depth = 4.5;  // How much meat to leave
    hole_h = 20;     // Keep plenty of clearance

    cylinder(h=hole_h, d=thread_d);
    translate([0, 0, depth])
    cylinder(h=hole_h, d=head_d);
}

difference() {
    
    // Main Body
    cylinder(h=height, d=spindle_d);
    
    // Wiring Channel
    cylinder(h=height, d=channel_d);
    
    // Rounded Top Chamfer
    translate([0,0,height-channel_d])
    rotate_extrude() {
        translate([channel_d/2-0.001,0,0])
        difference() {
            square(20);
            translate([20,0,0])
            circle(20);
        }
    }

    // Slot for Hemera
    translate([-hemera_depth/2, -spindle_d/2])
    cube([hemera_depth, spindle_d, hemera_height+hb_h/2]);

    // Bottom Chamfer to Make it Printable
    translate([0, -spindle_d/2, hemera_height-hemera_depth/2+hb_h/2])
    rotate([0, -45, 0])
    cube([hemera_depth/sqrt(2), spindle_d, hemera_depth/sqrt(2)]);
 
    translate([0, 0, hemera_height+hb_h/2])
    cylinder(h=150, d1=hemera_depth, d2=0);
    
    // Bolt Holes
    hb_m = hemera_height/2;
    hd2 = hemera_depth/2;
    
    translate([hd2, hb_w/2, hb_m-hb_h/2]) rotate([0, 90, 0]) bolt_hole();
    translate([hd2, -hb_w/2, hb_m-hb_h/2]) rotate([0, 90, 0]) bolt_hole();
    translate([hd2, hb_w/2, hb_m+hb_h/2]) rotate([0, 90, 0]) bolt_hole();
    translate([hd2, -hb_w/2, hb_m+hb_h/2]) rotate([0, 90, 0]) bolt_hole();

    translate([-hd2, hb_w/2, hb_m-hb_h/2]) rotate([0, -90, 0]) bolt_hole();
    translate([-hd2, -hb_w/2, hb_m-hb_h/2]) rotate([0, -90, 0]) bolt_hole();
    translate([-hd2, hb_w/2, hb_m+hb_h/2]) rotate([0, -90, 0]) bolt_hole();
    translate([-hd2, -hb_w/2, hb_m+hb_h/2]) rotate([0, -90, 0]) bolt_hole();


}