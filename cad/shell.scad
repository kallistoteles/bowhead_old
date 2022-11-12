/*
 bowhead keybord transportation box, created 2022-06-08
*/

/* translate([0,0,2*(h+t)]) */
// top();
bottom();
/* shell(); */
/* top_magnet(); */
/* bottom_magnet(); */

$fn=300;
g=0.5; // general gap
gm=0.1; // magnet gap press fit
sx=130; // board x
sy=95.56; // board y

t = 2; // thickness
/* h = 18; // height */
h = 24; // height
mh = 5; // magnet height
md = 5; // magnet diameter

m1=[126,-45,h+t+gm-mh]; // first magnet position
m2=[17,33,h+t+gm-mh]; // second
m3=[-5,-19,h+t+gm-mh]; // third
m4=[73,45,h+t+gm-mh]; // fourth




module top() {
  difference() {
    rotate([180,0,0])
    mirror([0,1,0])
    shell();
    translate([40,-40,-g])
    rotate([0,0,-10])
    linear_extrude(t)
    text("bowhead.", font="hack:style=bold");

    // magnet 1
    translate(m1)
    top_magnet();
    // magnet 2
    translate(m2)
    top_magnet();
    // magnet 3
    translate(m3)
    top_magnet();
    // magnet 4
    translate(m4)
    top_magnet();

  }
}


module bottom() {
  shell();

  // magnet 1
  translate(m1)
  bottom_magnet();
  // magnet 2
  translate(m2)
  bottom_magnet();
  // magnet 3
  translate(m3)
  bottom_magnet();
  // magnet 4
  translate(m4)
  bottom_magnet();
}

module shell() {
  difference() {
    linear_extrude(h+t)
    offset(delta=3*t, chamfer=true)
    hull() {
      base_form();
      translate([m1[0], m1[1],0])
      magnet();
      translate([m2[0], m2[1],0])
      magnet();
      translate([m3[0], m3[1],0])
      magnet();
      translate([m4[0], m4[1],0])
      magnet();
    }

    // board
    translate([0,0,t+g])
    left();

    // magnet 1
    translate(m1)
    linear_extrude(5)
    magnet();
    // magnet 2
    translate(m2)
    linear_extrude(5)
    magnet();
    // magnet 3
    translate(m3)
    linear_extrude(5)
    magnet();
    // magnet 4
    translate(m4)
    linear_extrude(5)
    magnet();

    // finger opening help
    fh=9;
    translate([sx, 30, h-fh])
    rotate([90,0,0])
    linear_extrude(65)
    offset(delta=t, chamfer=true)
    square(fh+t);

    // air ventilation or moisture let out
    for (i = [1:3]) {
      translate([15+2*(t*i),-sy/2-18,-sy])
      rotate([45,0,0])
      cube([t,sy,sy]);
    }

    // whale tail
    translate([60,-10,-t+g])
    linear_extrude(t)
    import("whale_tail.svg");

    }
}




module left() {
    // outer form
    linear_extrude(h)
    offset(delta=t+g, chamfer=true)
    base_form();
}


module base_form() {
  projection()
  import("bowhead_base.stl");
}

module magnet() {
    circle(d=md+gm);
  }

module top_magnet() {
    rotate([180,0,0])
    translate([0,0,2*h-2-md+g-gm]) {
	    translate([0,0,-1])
	    linear_extrude(md+1)
	    circle(d=md+gm);
	    translate([0,0,md-gm])
	    cylinder(d1=md+gm, d2=md+gm+2, h=1);
    }
  }

module bottom_magnet() {
    linear_extrude(1)
    circle(d=md+g);
  }
