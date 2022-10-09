title @a clear

kill @e[tag=SelfSwapRnd]
kill @e[tag=SelfSwapGlobal]

tag @a remove SelfSwapWarn
tag @a remove SelfSwapMark

scoreboard objectives remove ss_range
scoreboard objectives remove ss_min_safe_ticks
scoreboard objectives remove ss_warn_ticks

scoreboard objectives remove ss_count_since_swap
scoreboard objectives remove ss_ticks_since_swap
scoreboard objectives remove ss_secs_since_swap
scoreboard objectives remove ss_secs_since_swap_zero
scoreboard objectives remove ss_mins_since_swap
scoreboard objectives remove ss_mins_since_swap_zero
scoreboard objectives remove ss_rnd
scoreboard objectives remove ss_warn_counter
