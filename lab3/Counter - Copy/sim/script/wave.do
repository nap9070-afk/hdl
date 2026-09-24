onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /seven_seg_tb/uut/clk
add wave -noupdate /seven_seg_tb/uut/reset
add wave -noupdate /seven_seg_tb/uut/bcd
add wave -noupdate -radix States /seven_seg_tb/uut/seven_seg_out
add wave -noupdate /seven_seg_tb/uut1/output
add wave -noupdate /seven_seg_tb/uut2/output
add wave -noupdate -expand -group uut /seven_seg_tb/uut/clk
add wave -noupdate -expand -group uut /seven_seg_tb/uut/reset
add wave -noupdate -expand -group uut /seven_seg_tb/uut/bcd
add wave -noupdate -expand -group uut /seven_seg_tb/uut/seven_seg_out
add wave -noupdate -expand -group uut1 /seven_seg_tb/uut1/max_count
add wave -noupdate -expand -group uut1 /seven_seg_tb/uut1/clk
add wave -noupdate -expand -group uut1 /seven_seg_tb/uut1/reset
add wave -noupdate -expand -group uut1 /seven_seg_tb/uut1/output
add wave -noupdate -expand -group uut1 /seven_seg_tb/uut1/count_sig
add wave -noupdate -expand -group uut2 /seven_seg_tb/uut2/max_count
add wave -noupdate -expand -group uut2 /seven_seg_tb/uut2/clk
add wave -noupdate -expand -group uut2 /seven_seg_tb/uut2/reset
add wave -noupdate -expand -group uut2 /seven_seg_tb/uut2/output
add wave -noupdate -expand -group uut2 /seven_seg_tb/uut2/count_sig
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/a
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/b
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/cin
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/sum
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/cout
add wave -noupdate -expand -group uut3 /seven_seg_tb/uut3/sum_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {499487 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {499298 ns} {500037 ns}
