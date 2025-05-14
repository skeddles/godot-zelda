class_name Player
extends CharacterBody2D

const SPEED = 100
@onready var state = $State/Walk


func _ready():
	EventBus.connect("door_entered", _on_door_entered)

func change_state(state_name):
	if state.has_method("end"): 
		state.end()
	state.process_mode = Node.PROCESS_MODE_DISABLED
	
	var new_state = $State.get_node(state_name)
	if new_state.has_method("start"): 
		new_state.start()
	new_state.process_mode = Node.PROCESS_MODE_PAUSABLE
	print("changed state", state_name)
	
func _on_door_entered(area: Area2D):
	change_state("Stairs")
