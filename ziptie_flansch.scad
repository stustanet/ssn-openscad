$fn=30;

module ziptie_flansch(h=0) {
	scale([2, 1, 1])
	if (h > 0) {
		cylinder(d=6, h=h);
	}

	translate([0,0,0])
	rotate([90, 0, 0])
	difference() {
		cylinder(d=9, h=2, center=true);
		cylinder(d=6, h=2.1, $fn=6, center=true);
		translate([-5, -10, -5]) cube([10, 10, 10]);
	}
}

ziptie_flansch(h=1);
