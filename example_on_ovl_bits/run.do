onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_my_design/dut/clk
add wave -noupdate /tb_my_design/dut/fire_id_sel_bits
add wave -noupdate /tb_my_design/dut/id_ok
add wave -noupdate /tb_my_design/dut/id_sel
add wave -noupdate /tb_my_design/dut/id_sel_out
add wave -noupdate /tb_my_design/dut/resetn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22015 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {23940 ns}
run 2us;
