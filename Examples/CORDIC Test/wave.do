onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider kordic.v
add wave -noupdate -format Literal -radix decimal /cordic_test/Yin
add wave -noupdate -format Literal -radix hexadecimal /cordic_test/frequency
add wave -noupdate -format Literal -radix decimal /cordic_test/Xout
add wave -noupdate -format Literal -radix decimal /cordic_test/Yout
add wave -noupdate -format Logic /cordic_test/kord/clock
add wave -noupdate -format Literal -radix hexadecimal /cordic_test/kord/phase_step
add wave -noupdate -format Literal /cordic_test/kord/Xin
add wave -noupdate -format Literal /cordic_test/kord/Yin
add wave -noupdate -format Literal /cordic_test/kord/Xout
add wave -noupdate -format Literal /cordic_test/kord/Yout
add wave -noupdate -format Literal -radix hexadecimal /cordic_test/kord/atan_table
add wave -noupdate -format Literal -radix decimal /cordic_test/kord/X
add wave -noupdate -format Literal /cordic_test/kord/Y
add wave -noupdate -format Literal -radix hexadecimal /cordic_test/kord/Z
add wave -noupdate -format Literal -radix hexadecimal /cordic_test/kord/phase_acc
add wave -noupdate -format Literal /cordic_test/kord/quadrant
add wave -noupdate -format Literal /cordic_test/orig/quadrant
add wave -noupdate -divider cordic.v
add wave -noupdate -format Literal /cordic_test/orig/out_data_Q
add wave -noupdate -format Literal /cordic_test/orig/out_data_I
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 171
configure wave -valuecolwidth 42
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {10306130 ps}
