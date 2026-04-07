

read_hdl mux4_1.v
elaborate mux4_1
create_clock -period 10
synthesize

report area > area.rpt
report timing > timing.rpt
write_hdl > encoder_netlist.v
