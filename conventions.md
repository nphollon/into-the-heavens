All models face towards z = -Inf

Time is in seconds.

GameState.nextId starts at 100.


6. Better particle effects
7. New enemy types!!
9. SpawnShips effect should be replaced with multiple calls to SpawnShip; pass placement info with effect info.
10. Fucking collision detection still doesn't work
12. Checkpoints activated by collisions
16. AI should try to avoid colliding with the player
19. Menus should be operated with keyboard?
20. Prettify menus
21. Document keyboard controls somewhere (maybe on pause menu?)
22. Tests for Frame.compose and Frame.composeDelta!
24. objects have materials
25. levels have unique backgrounds & light sources
26. objects can have multiple materials


. a level has one ai that is a director, controls scheduled events
. enemies flee sometimes
. non-combatants that try to run and hide
. floating mines that fire seeker missiles
. level has a platform with a weak point that must be destroyed


level 1 -
platform is undefended. when the weak point is destroyed, mission success.

level 2 -
same. when you approach platform, enemies move to intercept.

level 3 -
capital ship spawns enemies. destroy capital ship.

level 4 -
defend an artillery piece while it moves into position.