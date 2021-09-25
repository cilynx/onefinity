pen_d = 12.7;   // 11.8 at the top
nib_d = 3.2;  // 2.5

scale = 1.1;

height = 1;

$fn=10;

pad = 5;
z = 22;
num = 5;
d = 11;
x = d+2*pad;
y = d*num + pad*(num+1);
dy = y/(num);

difference() {
  cube([x,y,z]);
  for(i=[0:num-1])
    translate([x/2, dy*i+d/2+pad]) cylinder(d=d+0.1*i,h=z);
}