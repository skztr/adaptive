### Adaptive

Adaptive is a datapack for Minecraft 1.13+

It sets the difficulty automatically depending on which players are online.

It allows players to set their "preferred" difficulty. The server will
periodically calculate an average difficulty among those players who are online,
and set the difficulty accordingly.

This allows small/low-activity servers with a community with differing
preferences regarding difficulty levels, to automatically choose the best
compromise based on who is currently playing. eg: If only players who prefer
"hard"-mode are online, then the difficulty will be "hard". If only players who
prefer "easy"-mode are online, then the difficulty will be "easy". If a mix of
players who prefer "easy" and "hard" are online, then the difficulty will be
either "easy" or "normal", depending on the specific mix.

Averages are calculated as integers, ie, "always rounding down", so lower
difficulties are always favoured. This means that the only way to see a "hard"
difficulty would be if *all* players prefer hard-mode.

Players who have no set difficulty are not counted towards averages. When no
players have a preferred difficulty set, the difficulty will be set to "normal".

"peaceful" difficulty is not supported, as this can result in the deletion of
captured mobs, which can ruin zoos and break farms.

When a player joins the server, they will be presented with a menu of difficulty
preference settings, also indicating their current preferred difficulty, and the
server's current difficulty.

When the difficulty is updated, all players are notified.
