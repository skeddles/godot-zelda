@tool
extends Area2D
class_name EditorArea


var _time_accumulator: float = 0.0
var _update_interval: float = 0.5

func _enter_tree() -> void:
	if Engine.is_editor_hint():
		set_process(true)

func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		return
	
	_time_accumulator += delta
	if _time_accumulator >= _update_interval:
		_time_accumulator = 0.0
		_editor_update()


func _exit_tree() -> void:
	if Engine.is_editor_hint():
		set_process(false)


# Override in child classes 
func _editor_update() -> void:
	queue_redraw()
