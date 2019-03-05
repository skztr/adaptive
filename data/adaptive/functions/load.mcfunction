# triggers to set preferred difficulty
scoreboard objectives add adEasy trigger
scoreboard objectives add adNormal trigger
scoreboard objectives add adHard trigger
scoreboard objectives add adUnset trigger

# the difficulty itself
scoreboard objectives add adDiff dummy

# the "previous" difficulty (used to detect changes)
scoreboard objectives add adPrev dummy

# count of players for calculations
scoreboard objectives add adCount dummy

# detect players joining the server
scoreboard objectives add adJoin dummy
scoreboard objectives add adQuit minecraft.custom:minecraft.leave_game

# configuration options

# Inform players of the current difficulty when they join / when the difficulty
# changes.
scoreboard objectives add adNotify dummy

# Invite players to change their preferred difficulty when they join / when the
# difficulty changes.
scoreboard objectives add adAsk dummy

# Force a particular difficulty level, disabling adaptive difficulty
# 0 = adaptive, 1 = easy, 2 = normal, 3 = hard
scoreboard objectives add adForce dummy

execute unless score #adaptive_global adNotify matches 0.. run scoreboard players set #adaptive_global adNotify 1
execute unless score #adaptive_global adAsk matches 0.. run scoreboard players set #adaptive_global adAsk 1
execute unless score #adaptive_global adForce matches 0.. run scoreboard players set #adaptive_global adForce 0
