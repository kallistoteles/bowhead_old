/*
  bowhead bottom shell, created 2022-06-03
*/


/* left(); */
/* right(); */
/* base_form(); */



$fn=100;
g=0.1;
sx=130;
sy=95.56;

t = 2; // thickness
h = 3.6+t; // height


module right() {
  difference() {
    // outer form
    linear_extrude(h)
    offset(delta=t, chamfer=true)
    base_form();

    // board
    translate([0,0,-t]) // right
    linear_extrude(h)
    offset(delta=g, chamfer=true)
    base_form();

    // power button cut out
    translate([sx/2,-sy/4,-t]) // right
    cube([sx, sy/2, h]);
  }
}

module left() {
  difference() {
    // outer form
    linear_extrude(h)
    offset(delta=t, chamfer=true)
    base_form();

    // board
    translate([0,0,t]) // left
    /* translate([0,0,-t]) // right */
    linear_extrude(h)
    offset(delta=g, chamfer=true)
    base_form();

    // power button cut out
    translate([sx/2,-sy/4,t]) // left
    /* translate([sx/2,-sy/4,-t]) // right */
    cube([sx, sy/2, h]);
    translate([sx-25,-sy/6,-g]) // left
    linear_extrude(h)
    offset(delta=t, chamfer=true)
    square(20, 20);
  }
}


module base_form() {
  projection()
  import("bowhead_base.stl");
}

