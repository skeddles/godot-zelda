extends Camera2D

const TRANSITION_SPEED = 300.0

@onready var target_position = Vector2.ZERO

func _process(delta):
	if position != target_position:
		print("move from ",position," to ",target_position)
		position = position.move_toward(target_position, TRANSITION_SPEED * delta)

	
