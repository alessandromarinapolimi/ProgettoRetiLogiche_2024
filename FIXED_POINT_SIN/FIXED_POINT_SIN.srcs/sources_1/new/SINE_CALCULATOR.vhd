library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity SINE_CALCULATOR is
    Port(
        clk   : in  std_logic;
        reset : in  std_logic;
        angle : in  std_logic_vector(8 downto 0);
        sine  : out std_logic_vector(9 downto 0)
    );
end SINE_CALCULATOR;
architecture Structural of SINE_CALCULATOR is
    component LUT is
        Port (
            ANGLE : in  std_logic_vector(6 downto 0);
            SINE  : out std_logic_vector(9 downto 0)
        );
    end component;
    component INTERP is
        Port (
            ANGLE             : in  std_logic_vector(2 downto 0);
            SINE1             : in  std_logic_vector(9 downto 0);
            SINE2             : in  std_logic_vector(9 downto 0);
            INTERPOLATED_SINE : out std_logic_vector(9 downto 0)
        );
    end component;
    component SUB is
        Port (
            X    : in  std_logic_vector(9 downto 0);
            Y    : in  std_logic_vector(9 downto 0);
            DIFF : out std_logic_vector(9 downto 0)
        );
    end component;
    component RCA is
        Port(
            A    : in  std_logic_vector(9 downto 0);
            B    : in  std_logic_vector(9 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(9 downto 0);
            COUT : out std_logic
        );
    end component;
    signal theta                          : std_logic_vector(8 downto 0);
    signal idx                            : std_logic_vector(6 downto 0);
    signal lut1_out                       : std_logic_vector(9 downto 0) := (others => '0');
    signal lut2_out                       : std_logic_vector(9 downto 0) := (others => '0');
    signal interp_out                     : std_logic_vector(9 downto 0);
    signal neg_flag                       : std_logic; 
    signal lut1_addr, lut2_addr           : std_logic_vector(6 downto 0);
    signal lut1_addr_ext                  : std_logic_vector(9 downto 0);
    signal angle_90, angle_180, angle_270 : std_logic_vector(8 downto 0);
    signal sub_result                     : std_logic_vector(9 downto 0);
    signal add_result                     : std_logic_vector(6 downto 0);
    
    signal unused_bits : std_logic_vector(2 downto 0);  -- Segnale fittizio per i bit inutilizzati
    attribute keep : boolean;
    attribute keep of unused_bits : signal is true;


begin
    angle_90 <= "001011010";  -- 90 in binario
    angle_180 <= "010110100";  -- 180 in binario
    angle_270 <= "100001110";  -- 270 in binario
    process(clk, reset)
    begin
        if reset = '1' then
            theta <= (others => '0');
            idx <= (others => '0');
            neg_flag <= '0';
        elsif rising_edge(clk) then
            theta <= angle;
            if unsigned(theta) < unsigned(angle_90) then  -- 0-89
                idx <= theta(6 downto 0);
                neg_flag <= '0';
            elsif unsigned(theta) < unsigned(angle_180) then  -- 90-179
                idx <= std_logic_vector(unsigned(not theta(6 downto 0)) + 1);
                neg_flag <= '0';
            elsif unsigned(theta) < unsigned(angle_270) then  -- 180-269
                idx <= theta(6 downto 0);
                neg_flag <= '1';
            else  -- 270-359
                idx <= std_logic_vector(unsigned(not theta(6 downto 0)) + 1);
                neg_flag <= '1';
            end if;
        end if;
    end process;
    lut1_addr <= idx(6 downto 3) & "000";
    lut1_addr_ext <= "000" & lut1_addr;
    


    ADD_8: RCA port map (
        A => lut1_addr_ext,
        B => "0000001000",  -- 8 in binario
        CIN => '0',
        SUM(6 downto 0) => add_result,
        SUM(9 downto 7) => unused_bits,  -- Utilizzo del segnale fittizio
        COUT => open
    );
    lut2_addr <= add_result;
    LUT1: entity work.LUT port map (ANGLE => lut1_addr, SINE => lut1_out);
    LUT2: entity work.LUT port map (ANGLE => lut2_addr, SINE => lut2_out);
    INTERP1: entity work.INTERP port map (
        ANGLE => idx(2 downto 0),
        SINE1 => lut1_out,
        SINE2 => lut2_out,
        INTERPOLATED_SINE => interp_out
    );
    -- Negazione del seno se necessario
    NEG_SINE: entity work.SUB port map (
        X => "0000000000",
        Y => interp_out,
        DIFF => sub_result
    );
    sine <= sub_result when neg_flag = '1' else interp_out;
end Structural;