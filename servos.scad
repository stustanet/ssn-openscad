module servo_mg996r(screwlength = 0, preview = 0) {
	translate(-[10, 30, 36.5]) {
	// Box and ears
		fn = preview == 0? 30 : 7;
		cube([20.1, 39.9, 36.1], false);
		translate([1.1, -7.6, 26.6]) {
			difference() {
				cube([18, 7.6, 2.5]);

				if (screwlength == 0) {
					translate([4, 3.5, 0]) cylinder(100, 2, $fn=fn);
					translate([14, 3.5, 0]) cylinder(100, 2, $fn=fn);
				}
			}

			// Ear supports - far of axle
			translate([8, 0.2, 1.2])
			rotate([10, 0, 0])
			cube([1.5, 8, 1.5]);

			// Ear supports - near axle
			translate([8, 47, 2.4])
			rotate([-10, 0, 0])
			cube([1.5, 8, 1.5]);

			if (screwlength > 0) {
				translate([4, 3.5, -screwlength]) cylinder(h=screwlength, d=3, $fn=fn);
				translate([14, 3.5, -screwlength]) cylinder(h=screwlength, d=3, $fn=fn);
			}
			if (screwlength < 0) {
				translate([4, 3.5, 0]) cylinder(h=-screwlength, d=3, $fn=fn);
				translate([14, 3.5, 0]) cylinder(h=-screwlength, d=3, $fn=fn);
			}
		}

		translate([1.1, 39.9, 26.6]) {
			difference() {
				cube([18, 7.6, 2.5]);

				if (screwlength == 0) {
					translate([4, 4.5, 0]) cylinder(100, 2, $fn=fn);
					translate([14, 4.5, 0]) cylinder(100, 2, $fn=fn);
				}
			}
			if (screwlength > 0) {
				translate([4, 3.5, -screwlength]) cylinder(h=screwlength, d=3, $fn=fn);
				translate([14, 3.5, -screwlength]) cylinder(h=screwlength, d=3, $fn=fn);
			}
			if (screwlength < 0) {
				translate([4, 3.5, 0]) cylinder(h=-screwlength, d=3, $fn=fn);
				translate([14, 3.5, 0]) cylinder(h=-screwlength, d=3, $fn=fn);
			}
		}

		// Main axle
		translate([10, 30, 36.1]) {
			fn = preview == 0? 100 : 30;
			cylinder(r=6, h=0.4, $fn=fn);
			cylinder(r=2.5, h=4.9, $fn=fn);
		}
	}
}


module _servomount_leaver(num_ledges) {
	ledge_length_mapping = [
		[],     // 0
		[18.5], //1
		[19.5], //2
		[],     //3
		[18.5], //4
		[],     // 5
		[16],   // 6
		[]      // 7
	];

	//l = ledge_length_mapping[num_ledges];
	l = 19.5;

	hull()
	{
		translate([]) cylinder(d=11, h=2.5);
		translate([l - 5/2, 0, 0]) cylinder(d=5, h=2.5);
	}

}

module servomount(sides) {
	translate([0,0,3]) {
		if (sides==0) {
			cylinder(d=20.5, h=2);
		} else {
			for (i = [0:1:sides]) {
				rotate([0, 0, (360/sides)*i])
				_servomount_leaver(sides);
			}
		}
		translate([0,0,-4]) cylinder(d=9, h=4);
	}
}

module servomount_drills(sides, select=[1,2,3,4]) {
	if (sides==0) {
		// Too lazy to measure
		cylinder(d=20.5, h=2);
	} else {
		for (i = [0:1:sides]) {
			rotate([0, 0, (360/sides)*i])
			for (s = select) {
				translate([7.5 + s*2.2, 0, 0])
				cylinder(d=1.2, h=2.5);
			}
		}
	}
}
