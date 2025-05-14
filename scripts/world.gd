extends Node2D

@onready var current_room = $Room

var current_door:Door

const ROOM_POSITION = Vector2(0.0, 48.0)

func _ready():
	EventBus.connect("door_entered", _on_door_entered)

func _on_door_entered(door: Door):
	current_door = door

func teleport(target_room:PackedScene, targetPositionMarkerName:String):
	var new_room = target_room.instantiate()
	current_room.queue_free()
	get_parent().add_child(new_room)
	get_parent().move_child(new_room, 0)
	new_room.position = ROOM_POSITION
	current_room = new_room
	
	$Player.position = ROOM_POSITION + new_room.get_node(targetPositionMarkerName).position
