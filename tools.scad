function multiply_elements(a, b) = [a[0] * b[0], a[1] * b[1], a[2] * b[2]];

// Create 4 Elements by shifting the children elements to the 4 corner points described by x/y of the center
module squareUp(center) {
	for (i = [0:1:$children-1]) {
		translate(multiply_elements(center, [1, 1, 1])) children(i);
		translate(multiply_elements(center, [-1, 1, 1])) children(i);
		translate(multiply_elements(center, [1, -1, 1])) children(i);
		translate(multiply_elements(center, [-1, -1, 1])) children(i);
	}
}

// Translate only in Z direction
module tZ(z) {
	translate([0,0,z])
	for (i = [0:1:$children-1]) {
		children(i);
	}
}


// Create a cube with rounded corners in x/y plane 
module rounded_cube_flat(p, r, center=false) {

	mov = center? [0,0,0] : [p[0]/2, p[1]/2];

	translate(mov) {
		hull() {
			squareUp([p[0]/2-r, p[1]/2-r, 0])
			cylinder(r=r, h=p[2], center=center);
		}
	}
}
