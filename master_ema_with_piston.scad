// Gundam Robotics Systems - Master Assembly + Piston Module
// -12 Dash Size (3/4") Prototype
// Power: 48V / 5A (240W)

$fn = 100;

// --- Parametric Variables ---
bore_id = 19.05;          // 3/4 inch ID (Fused Silica)
silica_wall = 4.76;       // Fused Silica wall thickness
liner_od = bore_id + (2 * silica_wall);

// Piston Parameters
piston_clearance = 0.1;   // Gap between piston and silica wall
piston_diameter = bore_id - (2 * piston_clearance);
piston_length = 40;
seal_width = 3.5;         // Carbon-filled PTFE seal width
piston_extension = 30;    // ADJUST THIS to visualize stroke (0 to 100)

// --- Modules ---

module fused_silica_liner() {
    color("cyan", 0.4)
    difference() {
        cylinder(h = 160, d = liner_od, center = true);
        cylinder(h = 162, d = bore_id, center = true);
        // UV Porting Slits for Solid Plasma Transition
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
            cube([liner_od + 5, 3, 140], center = true);
        }
    }
}

module moving_piston() {
    translate([0, 0, piston_extension - 60]) // Moves relative to chamber center
    union() {
        // Main Piston Body (Berry Compliant Titanium/Alloy)
        color("gray")
        difference() {
            cylinder(h = piston_length, d = piston_diameter, center = true);
            // Internal weight reduction or rod attachment point
            translate([0,0,10]) cylinder(h = piston_length, d = 10, center = true);
        }
        
        // Carbon-filled PTFE Seals (The "Solid Plasma" interface)
        color("black") {
            translate([0, 0, (piston_length/2) - 8])
            difference() {
                cylinder(h = seal_width, d = bore_id - 0.05, center = true);
                cylinder(h = seal_width + 1, d = piston_diameter - 2, center = true);
            }
            translate([0, 0, (-piston_length/2) + 8])
            difference() {
                cylinder(h = seal_width, d = bore_id - 0.05, center = true);
                cylinder(h = seal_width + 1, d = piston_diameter - 2, center = true);
            }
        }
    }
}

module bitter_stack_and_housing() {
    // Copper Bitter Stack (4-Layer, 14 AWG Equivalent)
    color("orange", 0.8)
    difference() {
        cylinder(h = 140, d = 42, center = true);
        cylinder(h = 142, d = liner_od + 0.2, center = true);
    }
    
    // Exoskeleton / Cooling Vanes
    color("silver", 0.2)
    difference() {
        cylinder(h = 160, d = 50.8, center = true);
        cylinder(h = 162, d = 42.5, center = true);
        // Vane-Axial Cooling Channels
        for (a = [0 : 30 : 359]) {
            rotate([0, 0, a]) translate([21, 0, 0])
            cylinder(h = 170, d = 5, center = true);
        }
    }
}

module connector_cap() {
    color("dimgray")
    translate([0, 0, 95])
    difference() {
        cylinder(h = 30, d = 50.8, center = true);
        cube([20, 15, 32], center = true); // 48V Power Port
    }
}

// --- Final Assembly ---
fused_silica_liner();
moving_piston();
bitter_stack_and_housing();
connector_cap();
