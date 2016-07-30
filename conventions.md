All models face down (towards z = -Inf)

Time is in seconds.


Waiting:
used to identify explosions, and draw the particle effect correctly.
(otherwise, same as dumb)

1. Split Engine based on AI type... each type of object has own module with update, spawn/init, and draw functions.
2. Decorations do not get rendered with Foreground engine.
3. Dumb => Scenery
4. Waiting => Explosion
5. Revisit Flight.Util
6. Missile expirations can have their own particle effect?
7. New enemy types!!
8. Positioning should be encapsulated.
9. SpawnShips effect should be replaced with multiple calls to SpawnShip; pass placement info with effect info.
10. Fucking collision detection still doesn't work