extends Node2D

@onready var current_room = $start

const TRANSITION_SPEED = 300.0
var transition_position = Vector2.ZERO
@onready var transition_to_room:Room = current_room

const TILES = 16.0

var current_door:Door
const ROOM_POSITION = Vector2(0.0, 4*TILES)
const ROOM_DIRECTIONAL_OFFSET = {
	"north": Vector2(0.0,       -11*TILES),
	"east":  Vector2(16*TILES,  0.0),
	"south": Vector2(0.0,       11*TILES),
	"west":  Vector2(-16*TILES, 0.0),
}

func _ready():
	EventBus.connect("door_entered", _on_door_entered)

func _on_door_entered(door: Door):	current_door = door


func _process(delta):
	if $Camera.position != transition_position:
		$Camera.position = $Camera.position.move_toward(transition_position, TRANSITION_SPEED * delta)
		$WorldBoundaries.position = $Camera.position + ROOM_POSITION
	elif transition_to_room && current_room != transition_to_room:
		print(current_room ," != ", transition_to_room)
		current_room.queue_free()
		current_room = transition_to_room
		print("compled transition to ",transition_to_room )
		transition_to_room = null


# transition() is how the player travels between rooms normally in the overworld,
# where the screen scrolls over to the new room
func transition(target_room_path:String, direction:String):
	var target_room = load(target_room_path)
	var new_room = target_room.instantiate()
	get_parent().add_child(new_room)
	get_parent().move_child(new_room, 0)
	var new_room_position = current_room.position + ROOM_DIRECTIONAL_OFFSET[direction]
	new_room.position = new_room_position
	transition_position = new_room_position - ROOM_POSITION
	transition_to_room = new_room
	$Player.change_state("Transitioning")
	print("starting transition to ", transition_to_room)

	
# teleport() is a secondary method of moving to a new room, where the new room
# simply appears and the player is placed at a specific point inside the room
func teleport(target_room_path:String, targetPositionNodeName:String):
	var target_room = load(target_room_path)
	var new_room = target_room.instantiate()
	current_room.queue_free()
	get_parent().add_child(new_room)
	get_parent().move_child(new_room, 0)
	new_room.position = ROOM_POSITION
	current_room = new_room
	
	var target_position_node = new_room.get_node(targetPositionNodeName)
	if target_position_node is Door:
		$Player.position = ROOM_POSITION + target_position_node.position + target_position_node.get_node("PlayerSpawn").position
	else:
		$Player.position = ROOM_POSITION + target_position_node.position
