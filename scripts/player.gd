class_name Player
extends CharacterBody2D

const SPEED = 100

@onready var state
@onready var world = get_parent()

func _ready():
	EventBus.connect("door_entered", _on_door_entered)
	for state in $State.get_children():
		state.process_mode = Node.PROCESS_MODE_DISABLED
	change_state("Walk")

func change_state(state_name):
	if state: 
		if state.has_method("end"): 
			state.end()
		state.process_mode = Node.PROCESS_MODE_DISABLED
	
	var new_state = $State.get_node(state_name)
	if new_state.has_method("start"): 
		new_state.start()
	new_state.process_mode = Node.PROCESS_MODE_PAUSABLE
	
	state = new_state
	print("changed state", state_name)

func _on_door_entered(door: Door):
	change_state("Stairs")
	state.target_room = door.target_room
	state.target_marker = door.target_marker
