library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SINE_CALCULATOR is
    Port(
        angle : in std_logic_vector(8 downto 0);
        sine  : out std_logic_vector(9 downto 0)
    );
end SINE_CALCULATOR;

architecture Structural of SINE_CALCULATOR is

    component RCA is
        Port(
            A    : in  std_logic_vector(9 downto 0);
            B    : in  std_logic_vector(9 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(9 downto 0);
            COUT : out std_logic
        );
    end component;

    component LUT is
        Port(
            ANGLE : in std_logic_vector(6 downto 0);
            SINE  : out std_logic_vector(9 downto 0)
        );
    end component;

    component INTERP is
        Port(
            ANGLE             : in  std_logic_vector(6 downto 0);
            SINE1             : in  signed(9 downto 0);
            SINE2             : in  signed(9 downto 0);
            INTERPOLATED_SINE : out signed(9 downto 0)
        );
    end component;

    signal theta          : std_logic_vector(8 downto 0);
    signal idx            : std_logic_vector(6 downto 0);
    signal angle_adjusted : std_logic_vector(8 downto 0);
    signal sine1, sine2  : signed(9 downto 0);
    signal sine_val      : signed(9 downto 0);

begin
    theta <= angle;

    process(theta)
    begin
        if unsigned(theta) <= 90 then
            idx <= theta(6 downto 0);
            LUT1: LUT port map(angle => idx, sine => std_logic_vector(sine1));
            LUT2: LUT port map(angle => std_logic_vector(unsigned(idx) + 1), sine => std_logic_vector(sine2));
            INTERP1: INTERP port map(angle => theta(6 downto 0), sine1 => sine1, sine2 => sine2, interpolated_sine => sine_val);
        elsif unsigned(theta) <= 180 then
            angle_adjusted <= std_logic_vector(to_unsigned(180, 9) - unsigned(theta));
            idx <= angle_adjusted(6 downto 0);
            LUT1: LUT port map(angle => idx, sine => std_logic_vector(sine1));
            LUT2: LUT port map(angle => std_logic_vector(unsigned(idx) + 1), sine => std_logic_vector(sine2));
            INTERP1: INTERP port map(angle => angle_adjusted(6 downto 0), sine1 => sine1, sine2 => sine2, interpolated_sine => sine_val);
        elsif unsigned(theta) <= 270 then
            angle_adjusted <= std_logic_vector(unsigned(theta) - to_unsigned(180, 9));
            idx <= angle_adjusted(6 downto 0);
            LUT1: LUT port map(angle => idx, sine => std_logic_vector(sine1));
            LUT2: LUT port map(angle => std_logic_vector(unsigned(idx) + 1), sine => std_logic_vector(sine2));
            INTERP1: INTERP port map(angle => angle_adjusted(6 downto 0), sine1 => sine1, sine2 => sine2, interpolated_sine => sine_val);
            sine_val <= -sine_val;
        else
            angle_adjusted <= std_logic_vector(to_unsigned(360, 9) - unsigned(theta));
            idx <= angle_adjusted(6 downto 0);
            LUT1: LUT port map(angle => idx, sine => std_logic_vector(sine1));
            LUT2: LUT port map(angle => std_logic_vector(unsigned(idx) + 1), sine => std_logic_vector(sine2));
            INTERP1: INTERP port map(angle => angle_adjusted(6 downto 0), sine1 => sine1, sine2 => sine2, interpolated_sine => sine_val);
            sine_val <= -sine_val;
        end if;
    end process;

    sine <= std_logic_vector(sine_val);

end Structural;
