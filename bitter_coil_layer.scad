// Gundam Robotics Systems - Bitter Coil Layer
// Optimized for 14 AWG Equivalent Square Copper

$fn = 50;

// Parameters
liner_od = 28.57;     // Matches silica liner OD
wire_size = 1.63;      // 14 AWG Square (mm)
insulation_gap = 0.1;  // Kapton coating allowance
turns = 80;
pitch = wire_size + insulation_gap;

module square_helical_coil() {
    for (i = [0 : turns - 1]) {
        translate([0, 0, i * pitch])
        rotate_extrude(angle = 360, convexity = 10)
        translate([liner_od / 2 + insulation_gap, 0, 0])
        square([wire_size, wire_size]);
    }
}

color("orange") square_helical_coil();
