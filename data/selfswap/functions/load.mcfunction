tellraw @a "Loading SelfSwap"

scoreboard objectives add ss_range dummy
scoreboard objectives add ss_min_safe_ticks dummy
scoreboard objectives add ss_warn_ticks dummy

scoreboard objectives add ss_count_since_swap dummy
scoreboard objectives add ss_ticks_since_swap dummy
scoreboard objectives add ss_secs_since_swap dummy
scoreboard objectives add ss_secs_since_swap_zero dummy
scoreboard objectives add ss_mins_since_swap dummy
scoreboard objectives add ss_mins_since_swap_zero dummy
scoreboard objectives add ss_rnd dummy
scoreboard objectives add ss_warn_counter dummy

execute unless entity @e[tag=SelfSwapGlobal] run summon minecraft:marker 0 64 0 {Tags:["SelfSwapGlobal", "init"]}

execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_range 5400
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_min_safe_ticks 600
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_warn_ticks 100

execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_count_since_swap 0
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_ticks_since_swap 0
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_secs_since_swap 0
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players set @s ss_mins_since_swap 0

execute as @e[tag=SelfSwapGlobal,tag=init] run summon minecraft:marker 0 64 0 {Tags:["SelfSwapRnd"]}
execute as @e[tag=SelfSwapGlobal,tag=init] store result score @s ss_rnd run data get entity @e[tag=SelfSwapRnd,limit=1] UUID[0] 1
execute as @e[tag=SelfSwapGlobal,tag=init] run kill @e[tag=SelfSwapRnd]

execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players operation @s ss_rnd %= @s ss_range
execute as @e[tag=SelfSwapGlobal,tag=init] run scoreboard players operation @s ss_rnd += @s ss_min_safe_secs

execute as @e[tag=SelfSwapGlobal,tag=init] run tag @s remove init
