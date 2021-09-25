barrel_top_d = 12.7; // 11.8 at 65;
barrel_top_h = 65;
barrel_bot_d = 11;
nib_d = 3.2;  // 2.5

height = 1;

$fn=100;

pad = 5;
z = 20;
num = 5;
d = 11;
x = d+2*pad;
y = d*num + pad*(num+1);
dy = y/(num);

difference() {
  cube([x,y,z]);
  for(i=[0:num-1])
    translate([x/2, dy*i+d/2+pad/2, 0]) {
      translate([0,0,1]) 
#        cylinder(h=barrel_top_h+1, d2=barrel_top_d, d1=barrel_bot_d-0.1*i);
      echo(barrel_bot_d-0.1*i)
#     cylinder(d=nib_d,h=z);
    }
}