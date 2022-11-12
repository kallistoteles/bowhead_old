$fn=100;
g=0.7;
angle=15;
t=3;
height=4+1.5*sin(angle);
x=17.2-2*t;
y=16.4-2*t;


pins();
tilt();

module tilt() {
    hull() {
      plate(0);
      translate([0,0,height])
      rotate([angle,0,0])
      plate(3);
    }
  }

module plate(s) {
    translate([-x/2+s/2,-y/2,0])
    linear_extrude(g)
    offset(delta=t, chamfer=true)
    polygon([[0,0], [x-s,0], [x-s,y-s], [0,y-s]]);
    // 17.2, 16.4
    /* square(8); */
  }

module pins(inner=false) {
    gap = inner ? g : 0.0001;
    translate([-3,0,-3]) {
      pin(gap);
      translate([6,0,0])
      pin(gap);
    }
  }

module pin(gap) {
    size = [1+gap,3+gap,3+gap];
    translate([-(1+gap)/2, -(3+gap)/2,0])
    cube(size);
  }
