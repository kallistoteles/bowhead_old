$fn=100;
g=0.7;
angle=25;
t=1;
height=2+1.5*sin(angle);

difference() {
  union () {
    tilt();
    translate([0,0,height+g])
    rotate([angle,0,0])
    pins();
  }
  translate([0,0,-g])
  pins(inner=true);
}


module tilt() {
    hull() {
      plate();
      translate([0,0,height])
      rotate([angle,0,0])
      plate();
    }
  }

module plate() {
    translate([-t/2,-4,0])
    linear_extrude(g)
    offset(delta=t, chamfer=true)
    square(8);
  }

module pins(inner=false) {
    gap = inner ? g : 0.0001;
    translate([0,-3/2-gap/2,0]) {
      translate([-gap/2,0,0])
      pin(gap);
      translate([6-gap/2,0,0])
      pin(gap);
    }
  }

module pin(gap) {
    size = [1+gap,3+gap,3+gap];
    cube(size);
  }
