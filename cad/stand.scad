/*
bowhead desk stand, created 2022-06-03
*/
include <bowhead.scad>;
$fn=30;
g=0.01;
up=15;
depth=75;
round=40;
height=95;

xa=40; // x angle
ya=70; // y angle
za=10; // z angle
part=60; // half space between
cut=[70,70]; // cut between
t=2;

union() {

	hull() {

		intersection() {
			translate([0,-part,up])
			rotate([90-xa,-ya,za])
			linear_extrude(g)
			offset(r=t)
			base_form();
			/* left(); */
			n();
		}

		linear_extrude(g)
		offset(delta=round, chamfer=true)
		polygon([[0,-part+round], [depth-round,0], [0,part-round]]);

	}


	hull() {

		intersection() {
			translate([0,part,up])
			rotate([90+xa,-ya,-za])
			linear_extrude(g)
			offset(r=t)
			base_form();
			/* right(); */
			n();
		}


		linear_extrude(g)
		offset(delta=round, chamfer=true)
		polygon([[0,-part+round], [depth-round,0], [0,part-round]]);

	}
}

		translate([0,-part,up])
		rotate([90-xa,-ya,za])
		/* linear_extrude(g) */
		/* offset(r=t) */
		/* base_form(); */
		left();

		translate([0,part,up])
		rotate([90+xa,-ya,-za])
		/* linear_extrude(g) */
		/* offset(r=t) */
		/* base_form(); */
		translate([0,0,-6])
		right();

module n() {
	translate([-2*part, -depth,0])
	cube([4*part, 2*depth,height]);
}
