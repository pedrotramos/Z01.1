-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
        instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
        zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
        muxALUI_A                   : out STD_LOGIC;                -- mux que seleciona entre instrução e ALU para reg. A
        muxAM                   : out STD_LOGIC;                 -- mux que seleciona entre reg. A e Mem. RAM para ALU
        muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
        muxAMD_ALU                  : out STD_LOGIC;
        zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
        loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
                                                                     -- Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is
begin

-- Sinais de controle
zx <= instruction(12);
nx <= instruction(11);
zy <= instruction(10);
ny <= instruction(9);
f <= instruction(8);
no <= instruction(7);

-- Seletores dos mux
muxALUI_A <= not instruction(17);
muxAM <= instruction(14) and not instruction(15);
muxSD_ALU <= not instruction(13) and not instruction(15);
muxAMD_ALU <= not instruction(15);

-- Instrucoes pro load
loadA <= instruction(6) or (not instruction(17));
loadS <= instruction(5) and instruction(17);
loadD <= instruction(4) and instruction(17);
loadM <= instruction(3) and instruction(17);
loadPC <= (instruction(17) and ((instruction(2) and ng and (not zr)) or (instruction(1) and zr) or (instruction(0) and (not zr) and (not ng))));

end architecture;
