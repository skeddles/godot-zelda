@tool
extends Node2D
class_name Room

@export_category("Neighboring Rooms")

@export_category("Neighboring Rooms")
@export_subgroup("Room to North", "north_")
## Drag a Room scene from your FileSystem here
@export_file("*.tscn") var north_room_scene
## If this transition should teleport you (instead of a typical slide tranisition where the character stays in place), enter the name of the Marker2D or Door node in that scene where the player should end up
@export var north_teleport_target:String

@export_subgroup("Room to East", "east_")
## Drag a Room scene from your FileSystem here
@export_file("*.tscn") var east_room_scene
## If this transition should teleport you (instead of a typical slide tranisition where the character stays in place), enter the name of the Marker2D or Door node in that scene where the player should end up
@export var east_teleport_target:String

@export_subgroup("Room to South", "south_")
## Drag a Room scene from your FileSystem here
@export_file("*.tscn") var south_room_scene
## If this transition should teleport you (instead of a typical slide tranisition where the character stays in place), enter the name of the Marker2D or Door node in that scene where the player should end up
@export var south_teleport_target:String

@export_subgroup("Room to West", "west_")
## Drag a Room scene from your FileSystem here
@export_file("*.tscn") var west_room_scene
## If this transition should teleport you (instead of a typical slide tranisition where the character stays in place), enter the name of the Marker2D or Door node in that scene where the player should end up
@export var west_teleport_target:String


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	var has_tile_map := false
	for child in get_children():
		if child is TileMapLayer:
			has_tile_map = true
			break
			
	if not has_tile_map:
		warnings.append("Rooms requires a TileMapLayer node")
	elif get_children()[0] is not TileMapLayer:
		warnings.append("TileMapLayer must be the first child in your room scene")
	
	return warnings
