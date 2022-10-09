execute as @e[tag=SelfSwapGlobal] run scoreboard players add @s ss_count_since_swap 1
execute as @e[tag=SelfSwapGlobal] run scoreboard players add @s ss_ticks_since_swap 1
execute as @e[tag=SelfSwapGlobal] if score @s ss_ticks_since_swap matches 20 run scoreboard players add @s ss_secs_since_swap 1
execute as @e[tag=SelfSwapGlobal] if score @s ss_ticks_since_swap matches 20 run scoreboard players set @s ss_ticks_since_swap 0
execute as @e[tag=SelfSwapGlobal] if score @s ss_secs_since_swap matches 60 run scoreboard players add @s ss_mins_since_swap 1
execute as @e[tag=SelfSwapGlobal] if score @s ss_secs_since_swap matches 60 run scoreboard players set @s ss_secs_since_swap 0

execute as @e[tag=SelfSwapGlobal] if score @s ss_secs_since_swap matches 0 run scoreboard players set @s ss_secs_since_swap_zero 0
execute as @e[tag=SelfSwapGlobal] if score @s ss_secs_since_swap matches 10 run scoreboard players reset @s ss_secs_since_swap_zero
execute as @e[tag=SelfSwapGlobal] if score @s ss_mins_since_swap matches 0 run scoreboard players set @s ss_mins_since_swap_zero 0
execute as @e[tag=SelfSwapGlobal] if score @s ss_mins_since_swap matches 10 run scoreboard players reset @s ss_mins_since_swap_zero

execute as @e[tag=SelfSwapGlobal] run scoreboard players operation @s ss_warn_counter = @s ss_rnd
execute as @e[tag=SelfSwapGlobal] run scoreboard players operation @s ss_warn_counter -= @s ss_count_since_swap
execute as @e[tag=SelfSwapGlobal] if score @s ss_warn_counter < @s ss_warn_ticks run tag @a add SelfSwapWarn

execute as @e[tag=SelfSwapGlobal] unless entity @p[tag=SelfSwapWarn] if score @s ss_count_since_swap < @s ss_min_safe_ticks run title @a actionbar [{"text":"Time from last swap - [SAFE] ","color":"green"},{"score":{"objective":"ss_mins_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_mins_since_swap","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"text":":"},{"score":{"objective":"ss_secs_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_secs_since_swap","name":"@e[tag=SelfSwapGlobal,limit=1]"}}]
execute as @e[tag=SelfSwapGlobal] unless entity @p[tag=SelfSwapWarn] unless score @s ss_count_since_swap < @s ss_min_safe_ticks run title @a actionbar [{"text":"Time from last swap - [SWAPABLE] ","color":"orange"},{"score":{"objective":"ss_mins_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_mins_since_swap","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"text":":"},{"score":{"objective":"ss_secs_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_secs_since_swap","name":"@e[tag=SelfSwapGlobal,limit=1]"}}]
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapWarn] run title @a actionbar [{"text":"SWAP INCOMING IN - ","color":"red"},{"score":{"objective":"ss_warn_counter","name":"@e[tag=SelfSwapGlobal,limit=1]"}}]

execute as @e[tag=SelfSwapGlobal] if score @s ss_count_since_swap > @s ss_rnd run tag @a add SelfSwapMark

execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run summon minecraft:marker 0 64 0 {Tags:["SelfSwapRnd"]}
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] store result score @s ss_rnd run data get entity @e[tag=SelfSwapRnd,limit=1] UUID[0] 1
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run kill @e[tag=SelfSwapRnd]
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players operation @s ss_rnd %= @s ss_range
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players operation @s ss_rnd += @s ss_min_safe_secs

execute if entity @p[tag=SelfSwapMark] run tellraw @a [{"text":"Time from last swap - "},{"score":{"objective":"ss_mins_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_mins_since_swap","name":"@e#[tag=SelfSwapGlobal,limit=1]"}},{"text":":"},{"score":{"objective":"ss_secs_since_swap_zero","name":"@e[tag=SelfSwapGlobal,limit=1]"}},{"score":{"objective":"ss_secs_since_swap","name":"@e#[tag=SelfSwapGlobal,limit=1]"}}]
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players set @s ss_ticks_since_swap 0
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players set @s ss_secs_since_swap 0
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players set @s ss_mins_since_swap 0
execute as @e[tag=SelfSwapGlobal] if entity @p[tag=SelfSwapMark] run scoreboard players set @s ss_count_since_swap 0

execute as @a[tag=SelfSwapMark] run tp @s @e[limit=1,sort=random,type=!minecraft:item]
execute as @a[tag=SelfSwapMark] run tag @a remove SelfSwapWarn
execute as @a[tag=SelfSwapMark] run tag @a remove SelfSwapMark
