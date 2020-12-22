# Zombie's-Hordes-an-8-bit-game
Zombie's Hordes is an 8-bit game that is created using old 8- bit technologies. This project is link to my Honour's Year in BSc Computer Games Technology at the University of the West of Scotland.

The game is build with the Z80 language, it will be developed on ColecoVision and MSX (using blueMSX) and by using the Macro assembler tniASM:
http://www.tni.nl/products/tniasm.html

Also, to  to create sprites and backgrounds, this project will use the MSX/Coleco Sprite & Tile Set Editor from Electric Adventure:
https://www.electricadventures.net/Pages/Article/108


## Game Design Document
Here's a small GDD of the game to help to understand what kind of game it will be developed. The purpose of this project isn't to create a great game with a revolutionary game design and level design but to use the development of a game to explore old technologies and assemblers. 

### Zombie’s Hordes – Game Design Document

#### High Level Concept:
This is a 2D, top view, adventure / shooter game. The action take place in a post-apocalypse world where humans are, little by little, transformed into zombies and the society has been collapsed. The player plays one of the last survivors in this world. The game is a succession of levels where the player is confronting zombies and must kill them one by one. It may also have to manage his own camp be make it a safer place.

##### Look and Feel:
Visual style:
The visual of this game will be directly inspired by big environment games such as Zelda or Metal Gear 1 and 2. It could have inside environment, cities, bases or outside environment such as forest of plains…

##### Level design:
The way enemies move and the level design is inspired by games like Pacman. Create a sort of labyrinth where the enemies will have to find a particular path to eat the player. The map fit the whole screen and no scrolling has been planned for now.
 
#### Gameplay:
##### Core mechanics:
The player will evolve in a short map where zombies are there to eat him. The player can move freely on this map and can also shoot the zombies to kill them and finished the level. If he has been eaten, it’s game over.
This is the main purpose of the player in every levels. Of course, some other kind of mission, maps and game over conditions could be added to the game later such as (save your friend, find a particular object in a particular house etc…).

##### Enemies:
In this game, enemies are zombies. They are slower than the player, but they kill the player in one hit, on the contrary they do not die by being hitting by one bullet. Such as the levels, other types of enemies can be added to the game later (bosses, human with fire weapons …)
Other kind of gameplay:
The game could also have different kind of gameplay by adding the management of a camp where the player can loot items in the different levels (or experience points) where they can be used to improve his camp, skills or buy weapons, ammunitions, consumables etc…

##### Progression:
The progression in the game can have few forms, by finishing the different levels, improving the camps, and improving player’s equipment and characteristics.
More the player is evolving in the different levels, more those levels will be difficult.

##### One level gameplay exemple:
On a classic level of the game, the player spawn at the middle of the map and the zombies spawn on different locations on the map too. First, the player can move freely without being attacked. It’s only when a zombie sees him that he will have to defend himself and kill the enemy.
The player can move on eight different directions and he will face those directions, which means that he will shoot on the last direction that was pressed. On the first version of the game, the player will have only one weapon without ammunition limit. That’s also mean that the zombies aren’t dropping any ammunition or consumables.
When the player did kill all the zombies that were on the map, he wins, and the level’s is finished. On the contrary if a zombie reaches him he lose.
