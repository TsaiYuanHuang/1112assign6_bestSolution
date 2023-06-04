[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ka2oKKEt)
# Level C
- Design a Boss class that inherits from the Enemy class.
- The Boss' constructor has two parameters: x,y
- The boss' initial hp: 5, damage: -20, xSpeed: 2
(Remember to uncomment the corresponding code for the boss in the EnemyMgr class.)

# Level B
- Complete addBullet() method in BulletMgr class.
(Note that at any given time, there can be a maximum of 5 bullets on the screen.)
- Complete draw() method in BulletMgr class.
-- check all enemies on the screen.
-- If there is a collision, the enemy will lose health and the bullet will disappear.
-- If the enemy's health is depleted, the enemy will disappear and an explosion effect(Level A) will be added at that location.

# Level A
- Design the Flame and FlameMgr classes to generate explosion animations upon collision. 
- The animation should consist of five images named flame1, flame2, flame3, flame4, and flame5, played sequentially before disappearing.
- The FlameMgr class should use an ArrayList to manage multiple explosions. (Please refer to bulletMgr class)
