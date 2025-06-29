onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fsm_controller/uut/clock
add wave -noupdate /tb_fsm_controller/uut/counter
add wave -noupdate /tb_fsm_controller/uut/enable
add wave -noupdate /tb_fsm_controller/uut/fire_request_when_FSM_idle*
add wave -noupdate /tb_fsm_controller/uut/next_state
add wave -noupdate /tb_fsm_controller/uut/rd_en
add wave -noupdate /tb_fsm_controller/uut/req
add wave -noupdate /tb_fsm_controller/uut/reset
add wave -noupdate /tb_fsm_controller/uut/state
add wave -noupdate /tb_fsm_controller/uut/wr_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {83056 ps} {100892 ps}
run 2us
