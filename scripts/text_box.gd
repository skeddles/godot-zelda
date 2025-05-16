extends Label

@export var text_reveal_speed = 0.3

func _ready() -> void:
	visible_ratio = 0.0

func _process(delta: float) -> void:
	visible_ratio += text_reveal_speed * delta
	
