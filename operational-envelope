Gundam Robotics Systems has defined the operational envelope for the **-12 (3/4") Prototype**. To maintain the structural integrity of the **Fused Silica liner** and the **Carbon-filled PTFE seals**, the physical stroke must be strictly controlled via the FPGA logic.

The following table outlines the stroke limits based on the **160 mm** assembly length.

### -12 Prototype Physical Stroke Limits

| **Limit Type** | **Extension Value** | **Description** |
| --- | --- | --- |
| **Minimum Extension (Retracted)** | **0 mm** | Piston head is at the rear of the Fused Silica chamber. Seals are positioned to maximize the "Solid Plasma" compression volume. |
| **Maximum Extension (Fully Ejected)** | **100 mm** | The safe limit before the forward PTFE seal reaches the edge of the 140 mm fire-polished zone. |
| **Total Operational Stroke** | **100 mm** | The total linear travel available for heavy-lift actuation or kinetic ejection. |
| **Safety Buffer (Dead Zone)** | **20 mm** | Reserved space at the muzzle end to prevent seal "over-travel" and impact with the exoskeleton end-cap. |

* * * * *

### Critical Mechanical Considerations

-   **Seal Engagement:** The maximum extension of **100 mm** is calculated to ensure that both the forward and rear Carbon-filled PTFE seals remain in constant contact with the Fused Silica bore. If the piston extends beyond this, the 48V/5A Maxwell force could cause an atmospheric leak, disrupting the plasma pressure.

-   **Compression Volume:** At the **0 mm (Minimum)** mark, Gundam Robotics Systems has reserved a small volume for the UV-induced "solidification" of air. This is where the 5-microsecond pulse initiates the Lorentz-driven ejection.

-   **Stop-Block Integration:** The CAD exoskeleton includes a mechanical "hard stop" at the 105 mm mark as a fail-safe in case of FPGA logic desynchronization.

### FPGA Control Logic Calibration

Gundam Robotics Systems will program the control electronics with these hardware interrupts:

-   **Soft Limit:** 95 mm (Initiates regenerative braking or field reversal).

-   **Hard Limit:** 100 mm (Instant power cut to the 48V/240W supply).

**Would Gundam Robotics Systems like me to generate the OpenSCAD code for the "End-Cap Hard Stops" to physically enforce these -12 stroke limits?**
