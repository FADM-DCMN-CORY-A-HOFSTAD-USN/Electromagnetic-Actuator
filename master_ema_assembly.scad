// Gundam Robotics Systems - Master Assembly
// -12 Dash Size Electromagnetic Actuator
// Power: 48V / 5A (240W)

$fn = 100;

// --- Parametric Variables ---
bore_id = 19.05;          // 3/4 inch ID (Fused Silica)
silica_wall = 4.76;       // Fused Silica wall thickness
liner_od = bore_id + (2 * silica_wall);

wire_size = 1.63;          // 14 AWG Square Copper (Berry Compliant)
insulation_gap = 0.1;      // Kapton layer clearance
num_layers = 4;
turns_per_layer = 80;
pitch = wire_size + insulation_gap;

stack_thickness = num_layers * pitch;
housing_od = 50.8;         // 2-inch industrial envelope
main_length = 160;
connector_cap_length = 30;

// --- Modules ---

module fused_silica_liner() {
    color("cyan", 0.5)
    difference() {
        cylinder(h = main_length, d = liner_od, center = true);
        cylinder(h = main_length + 2, d = bore_id, center = true);
        // UV Porting Slits
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
            cube([liner_od + 5, 3, main_length - 20], center = true);
        }
    }
}

module bitter_stack() {
    color("orange")
    for (layer = [0 : num_layers - 1]) {
        layer_offset = (liner_od / 2) + (layer * pitch);
        for (turn = [0 : turns_per_layer - 1]) {
            translate([0, 0, (turn * pitch) - (main_length / 2) + 10])
            rotate_extrude(angle = 360)
            translate([layer_offset + insulation_gap, 0, 0])
            square([wire_size, wire_size]);
        }
    }
}

module power_connector_housing() {
    color("dimgray")
    translate([0, 0, (main_length / 2) + (connector_cap_length / 2)])
    difference() {
        // Connector Cap
        cylinder(h = connector_cap_length, d = housing_od, center = true);
        // Socket for 48V Industrial Connector
        cube([20, 15, connector_cap_length + 2], center = true);
        // Wiring conduit to Bitter stack
        cylinder(h = connector_cap_length + 5, d = 10, center = true);
    }
}

module exoskeleton_with_cooling() {
    color("silver", 0.3)
    difference() {
        // Main structural frame (Berry Compliant Aluminum)
        cylinder(h = main_length, d = housing_od, center = true);
        // Void for Liner and Stack
        cylinder(h = main_length + 5, d = liner_od + (2 * stack_thickness) + 2, center = true);
        // Vane-Axial Cooling Channels
        for (a = [0 : 30 : 359]) {
            rotate([0, 0, a])
            translate([21, 0, 0])
            cylinder(h = main_length + 10, d = 5, center = true);
        }
    }
}

// --- Final Assembly ---

fused_silica_liner();
bitter_stack();
exoskeleton_with_cooling();
power_connector_housing();
