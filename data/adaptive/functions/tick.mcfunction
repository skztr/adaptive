# Detect new players
scoreboard players set @a adJoin 0
scoreboard players set @a[scores={adQuit=1..}] adJoin 1
scoreboard players set @a[scores={adQuit=1..}] adQuit 0

# Enable triggers for all players
scoreboard players enable @a adEasy
scoreboard players enable @a adNormal
scoreboard players enable @a adHard
scoreboard players enable @a adUnset

# Set preferred difficulty based on triggers
execute as @a run scoreboard players operation @s adPrev = @s adDiff
scoreboard players set @a[scores={adEasy=1..}] adDiff 1
scoreboard players set @a[scores={adNormal=1..}] adDiff 2
scoreboard players set @a[scores={adHard=1..}] adDiff 3
scoreboard players set @a[scores={adUnset=1..}] adDiff 4
scoreboard players set @a adEasy 0
scoreboard players set @a adNormal 0
scoreboard players set @a adHard 0
scoreboard players set @a adUnset 0

# Calculate Difficulty
scoreboard players set #adaptive_global adPrev -1
execute if score #adaptive_global adDiff matches 0.. run scoreboard players operation #adaptive_global adPrev = #adaptive_global adDiff
scoreboard players set #adaptive_global adCount 0
scoreboard players set #adaptive_global adDiff 0
execute as @a[scores={adDiff=1..3}] run scoreboard players add #adaptive_global adCount 1
execute as @a[scores={adDiff=1..3}] run scoreboard players operation #adaptive_global adDiff = @s adDiff
execute unless score #adaptive_global adCount matches 0 run scoreboard players operation #adaptive_global adDiff /= #adaptive_global adCount
execute if score #adaptive_global adCount matches 0 run scoreboard players set #adaptive_global adDiff 2

execute if score #adaptive_global adDiff matches 1 run difficulty easy
execute if score #adaptive_global adDiff matches 2 run difficulty normal
execute if score #adaptive_global adDiff matches 3 run difficulty hard

# Who to Notify
scoreboard players set @a adNotify 0
execute if score #adaptive_global adNotify matches 1 unless score #adaptive_global adDiff = #adaptive_global adPrev run scoreboard players set @a adNotify 1
execute if score #adaptive_global adNotify matches 1 run scoreboard players set @a[scores={adJoin=1}] adNotify 1

# Who to Ask
scoreboard players set @a adAsk 0
execute if score #adaptive_global adAsk matches 1 unless score #adaptive_global adDiff = #adaptive_global adPrev run scoreboard players set @a adAsk 1
execute if score #adaptive_global adAsk matches 1 run scoreboard players set @a[scores={adJoin=1}] adAsk 1
execute if score #adaptive_global adAsk matches 1 as @a run execute unless score @s adDiff = @s adPrev run scoreboard players set @s adAsk 1

# Notify players of the new difficulty
execute if score #adaptive_global adDiff matches 1 run tellraw @a[scores={adNotify=1}] [{"text":"Difficulty has been updated to ", "color": "reset"}, {"text": "[Easy]", "color": "green"}]
execute if score #adaptive_global adDiff matches 2 run tellraw @a[scores={adNotify=1}] [{"text":"Difficulty has been updated to ", "color": "reset"}, {"text": "[Normal]", "color": "blue"}]
execute if score #adaptive_global adDiff matches 3 run tellraw @a[scores={adNotify=1}] [{"text":"Difficulty has been updated to ", "color": "reset"}, {"text": "[Hard]", "color": "red"}]

# Ask players if they want to change their preference
execute as @a[scores={adAsk=1}] run execute if score @s adDiff matches 1 run tellraw @s [{"text":"Set Preferred Difficulty: ", "color": "reset"}, {"text": ">Easy< ", "color": "gray", "clickEvent":{"action":"run_command","value":"/trigger adEasy set 1"}}, {"text": "[Normal] ", "color": "blue", "clickEvent":{"action":"run_command","value":"/trigger adNormal set 1"}}, {"text": "[Hard] ", "color": "red", "clickEvent":{"action":"run_command","value":"/trigger adHard set 1"}}, {"text": "[Unset]", "color": "aqua", "clickEvent":{"action":"run_command","value":"/trigger adUnset set 1"}}]
execute as @a[scores={adAsk=1}] run execute if score @s adDiff matches 2 run tellraw @s [{"text":"Set Preferred Difficulty: ", "color": "reset"}, {"text": "[Easy] ", "color": "green", "clickEvent":{"action":"run_command","value":"/trigger adEasy set 1"}}, {"text": ">Normal< ", "color": "gray", "clickEvent":{"action":"run_command","value":"/trigger adNormal set 1"}}, {"text": "[Hard] ", "color": "red", "clickEvent":{"action":"run_command","value":"/trigger adHard set 1"}}, {"text": "[Unset]", "color": "aqua", "clickEvent":{"action":"run_command","value":"/trigger adUnset set 1"}}]
execute as @a[scores={adAsk=1}] run execute if score @s adDiff matches 3 run tellraw @s [{"text":"Set Preferred Difficulty: ", "color": "reset"}, {"text": "[Easy] ", "color": "green", "clickEvent":{"action":"run_command","value":"/trigger adEasy set 1"}}, {"text": "[Normal] ", "color": "blue", "clickEvent":{"action":"run_command","value":"/trigger adNormal set 1"}}, {"text": ">Hard< ", "color": "gray", "clickEvent":{"action":"run_command","value":"/trigger adHard set 1"}}, {"text": "[Unset]", "color": "aqua", "clickEvent":{"action":"run_command","value":"/trigger adUnset set 1"}}]
execute as @a[scores={adAsk=1}] run execute unless score @s adDiff matches 1..3 run tellraw @s [{"text":"Set Preferred Difficulty: ", "color": "reset"}, {"text": "[Easy] ", "color": "green", "clickEvent":{"action":"run_command","value":"/trigger adEasy set 1"}}, {"text": "[Normal] ", "color": "blue", "clickEvent":{"action":"run_command","value":"/trigger adNormal set 1"}}, {"text": "[Hard] ", "color": "red", "clickEvent":{"action":"run_command","value":"/trigger adHard set 1"}}, {"text": ">Unset<", "color": "gray", "clickEvent":{"action":"run_command","value":"/trigger adUnset set 1"}}]
