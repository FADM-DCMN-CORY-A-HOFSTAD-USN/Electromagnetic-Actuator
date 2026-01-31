// Gundam Robotics Systems - Fused Silica Liner
// Standardized for -12 Dash Size

$fn = 100;

// Parameters
bore_id = 19.05;      // 3/4 inch ID
wall_thickness = 4.76; // Initial simulation thickness
length = 150;
uv_port_width = 3;     // Width of UV access slits
uv_port_count = 6;     // Number of radial windows

difference() {
    // Main Tube Body
    cylinder(h = length, d = bore_id + (2 * wall_thickness), center = true);
    
    // Internal Bore (The Plasma Chamber)
    cylinder(h = length + 2, d = bore_id, center = true);
    
    // UV Access Windows
    for (i = [0 : uv_port_count - 1]) {
        rotate([0, 0, i * (360 / uv_port_count)])
        translate([0, 0, 0])
        cube([bore_id + 15, uv_port_width, length - 20], center = true);
    }
}
