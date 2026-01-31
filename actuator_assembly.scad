// Gundam Robotics Systems - Assembly & Cooling Chassis
// Features Vane-Axial channels for 48V Fan System

$fn = 60;

// Assembly Constants
total_od = 50.8; // 2-inch outer envelope
length = 160;

difference() {
    // Main Exoskeleton (Berry Compliant Aluminum/Carbon Fiber)
    cylinder(h = length, d = total_od, center = true);
    
    // Internal Core Void (Fits Liner + 4 Coil Layers)
    cylinder(h = length + 5, d = 42, center = true);
    
    // Vane-Axial Cooling Channels
    for (a = [0 : 45 : 359]) {
        rotate([0, 0, a])
        translate([18, 0, 0])
        cylinder(h = length + 10, d = 4, center = true);
    }
}
