extends Node
class_name State

@onready var player = get_parent().get_parent()

const DIRECTION = {
	"horizontal": {
		-1.0: "left",
		1.0: "right"
	},
	"vertical": {
		-1.0: "up",
		1.0: "down"
	},
}

func animate(animation, axis, direction):
	%Sprite.play(animation + "_" + DIRECTION[axis][direction])
	
