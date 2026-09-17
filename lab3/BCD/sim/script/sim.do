vlib work
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../src/seven_seg_tb.vhd
vcom -93 -work work ../../src/generic_adder_beh.vhd
vcom -93 -work work ../../src/generic_adder.vhd
vsim -voptargs=+acc -msgmode both seven_seg_tb
do wave.do
run 500 us