-- Gundam Robotics Systems: 5-Microsecond Pulse Synchronizer
-- Targets: -12 Dash Size Electromagnetic Actuator Prototype
-- Logic: 50MHz Clock (1 tick = 20ns)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GRS_PulseController is
    Port (
        clk           : in  STD_LOGIC;  -- 50MHz Input
        reset         : in  STD_LOGIC;  -- Active High
        trigger       : in  STD_LOGIC;  -- Launch Command
        uv_gate       : out STD_LOGIC;  -- To UV SiC MOSFET
        magnetic_gate : out STD_LOGIC;  -- To Bitter-Stack IGBT
        cooling_fan   : out STD_LOGIC   -- To 48V Fan Controller
    );
end GRS_PulseController;
