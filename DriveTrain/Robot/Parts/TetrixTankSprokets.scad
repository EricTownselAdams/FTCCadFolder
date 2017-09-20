
nTeeth=12;

hubWidth=7.5;
tetrixWidth = 2; // actually 2, but 3 is a little stronger in plastic
tetrixScrewHoleRad = 2.25; // extra margin for bottom printing smear
tetrixScrewHeadRad = 3.0;  // extra margin for bottom printing smear
holeSpacing = 8;
technicHoleRad = 2.63;
technicNubRad = 3.1;
holeTol = 0.35;

difference() {
	union() {
 		cylinder(h=hubWidth, r=30*nTeeth/20+2.5, $fn=80);
		translate([0,0,hubWidth-1])
 		cylinder(h=4.5, r1=30*nTeeth/20+2.5-6, r2=30*nTeeth/20+2.5-8, $fn=80);	
	}

	// technic hole, center
	translate([0,0,-1])
	cylinder(h=hubWidth+3.5+2, r=8.5/2, $fn=40);

	// tetrix screw holes
	for (x=[0:90:270]) {
		rotate(x,[0,0,1]) 
		translate([0,8,0]) {
			translate([0,0,-1])
			cylinder(h=hubWidth+3.5+2, r=tetrixScrewHoleRad, $fn=40);
			translate([0,0,-4])
			cylinder(h=hubWidth+3.5, r=tetrixScrewHeadRad, $fn=40);
			translate([0,0,hubWidth+3.5-4.05])
			cylinder(h=2, r1=tetrixScrewHeadRad, r2=tetrixScrewHoleRad,$fn=40);
		}
	}

	for (i=[1:nTeeth]) {
		rotate(360*i/nTeeth)
		translate([30*nTeeth/20+2.5,0,0])
		toothCut(nTeeth);
	}

}

module toothCut(numTeeth) {
	translate([-5/2,0,-1])
	hull() {
	translate([0,0,0])
	cylinder(h=hubWidth+2, r=4.5/2, $fn=20);
	translate([7.5,0,0])
	cylinder(h=hubWidth+2, r=6, $fn=20);
	}
}
/*
difference() {
	union() {
	hull() {
 		cylinder(h=tetrixWidth, r=2*holeSpacing-2*tetrixWidth, $fn=40);

		translate([4*holeSpacing,0,0])
 		cylinder(h=tetrixWidth, r=2*holeSpacing-2*tetrixWidth, $fn=40);
	}
 	cylinder(h=technicBeamWidth, r=2*holeSpacing-tetrixWidth, $fn=40);	
	}

	// technic hole pattern
//	translate([0,0,-1])
//	cylinder(h=technicBeamWidth+2, r=technicNubRad, $fn=40);
	translate([0,0,-1])
	for (i=[45:90:360-45]) {
  		rotate(a=i) translate([holeSpacing, 0, 0]) {
			cylinder(h=technicBeamWidth+2, r=technicHoleRad, $fn=40);
			cylinder(h=technicBeamWidth+2, r1=technicHoleRad+2, r2=technicHoleRad-2, $fn=40);
			translate([0, 0, technicBeamWidth])
			cylinder(h=2, r=technicNubRad, $fn=40);
		}
 	}

	// tetrix hole pattern
	translate([4*holeSpacing, 0, -1]) 
	cylinder(h=tetrixWidth+2, r=4.38, $fn=40);
	translate([4*holeSpacing, 0, -1]) 
	for (i=[0:45:360]) {
  		rotate(a=i) translate([holeSpacing, 0, 0]) 
			cylinder(h=tetrixWidth+2, r=2.25, $fn=40);
 	}

}
*/
