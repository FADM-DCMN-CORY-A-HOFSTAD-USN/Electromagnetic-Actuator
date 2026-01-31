// Gundam Robotics Systems - End-Cap Hard Stops\
// Physically enforces the 100mm stroke limit for -12 Prototype

$fn = 100;

// Parameters from Master Assembly\
housing_od = 50.8;\
bore_id = 19.05;\
stop_thickness = 15; // Thick enough to absorb 48V/5A kinetic energy\
mounting_bolt_d = 4.5; // For M4 Berry-compliant bolts

module end_cap_stop(is_muzzle = true) {\
    color("darkred")\
    difference() {\
        // Main Disc\
        cylinder(h = stop_thickness, d = housing_od, center = true);

        if (is_muzzle) {\
            // Muzzle exit hole (slightly larger than piston rod, smaller than piston head)\
            cylinder(h = stop_thickness + 2, d = 12, center = true);\
        } else {\
            // Rear cap wiring conduit for 48V/240W feed\
            cylinder(h = stop_thickness + 2, d = 8, center = true);\
        }

        // Mounting Bolt Pattern (4-bolt circular array)\
        for (a = [45 : 90 : 359]) {\
            rotate([0, 0, a])\
            translate([housing_od/2 - 6, 0, 0])\
            cylinder(h = stop_thickness + 2, d = mounting_bolt_d, center = true);\
        }

        // Relief for the Fused Silica liner edge\
        translate([0,0, is_muzzle ? -5 : 5])\
        cylinder(h = 6, d = 29, center = true);\
    }\
}

// Visualization in the Master Assembly\
translate([0, 0, 80 + stop_thickness/2]) end_cap_stop(is_muzzle = true);  // Muzzle Stop\
translate([0, 0, -80 - stop_thickness/2]) end_cap_stop(is_muzzle = false); // Rear Stop
