@tool
extends Node2D
class_name Room

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
