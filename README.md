# Godot Zelda

This is a recreation of the original Legend of Zelda for the Nintendo Entertainment System (NES) using the Godot game engine. 

![Gif recording of initial gameplay](/repo/example-gif.gif)

Our intention is to not be 100% accurate, but rather to make a very similar engine that could be used as a base to create a similar game with relative ease.

We want to keep the source easy to understand and modify.

# Status

Barely Started!

## Completed

- Character movement
- Tiles and tile collision
- Door transitions
- Overworld transitions

## To Do

- UI
- Weapons
- Attacking Player State
- Enemies
- Items
- Overworld Maps (4 / 128)
- Dungeons

## Map Completion Status

- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛🟨🟨⬛⬛⬛⬛⬛⬛⬛
- ⬛⬛⬛⬛⬛⬛⬛🟨🟨⬛⬛⬛⬛⬛⬛⬛

#### Key

- ⬛ - Not Started
- ⬜ - Scene Made
- 🟨 - Tiles Mapped
- 🟩 - All Connections Done
- 🟧 - All Enemies Done
- 🟥 - All Events Done

# Contributing

Contributions are welcome! 

This project is currently on Godot 4.4.1

### Adding Rooms

Right click on `res://scenes/room.tscn` and select `New Inherited Scene`. Add a `TileMapLayer` child node to the scene, and use the tileset in `res://tilesets/tileset.tres`. Draw a 16x11 tile scene (4 tiles shorter than the full screen size)

Set the nearby maps by clicking on the root node and set the room scenes under Neighboring Rooms. By default it will use the sliding overworld transition, but if you want it to be a door, just set the name of the target Marker2D/Door node in the target scene.

Add a door by dragging `res://scenes/door.tscn` into the scene. Set the target room by clicking on the root node and set its `target_room` and `target_marker` properties.

Drag NPCs from `res://scenes/NPC` into the scene.