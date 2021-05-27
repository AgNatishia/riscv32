restart

add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/clock} -radix hex {1 0ns} {0 5000ps} -repeat_every 10000ps
run 10000 ns

add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/interconnect_reset} -radix hex {0 0ns}
add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/peripheral_reset} -radix hex {0 0ns}
add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/neo_reset} -radix hex {0 0ns}
run 10000 ns

add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/interconnect_reset} -radix hex {1 0ns}
run 100 ns
add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/peripheral_reset} -radix hex {1 0ns}
run 100 ns
add_force {/rv32i_overlay_sim_wrapper/rv32i_overlay_sim_i/neo_reset} -radix hex {1 0ns}
run 100 ns


run 50000 ns
