extends Area2D

var overlapping_body: CharacterBody2D = null
@onready var area_shape: CollisionShape2D = $CollisionShape2D 
	
func _on_body_entered(body: Node):
	if body is Player:
		print('overlapping player',self)
		overlapping_body = body
		set_physics_process(true)

func _on_body_exited(body: Node):
	if body == overlapping_body:
		print('left player',self)
		overlapping_body = null
		set_physics_process(false)

func _physics_process(_delta):
	if overlapping_body != null and check_fully_inside(overlapping_body):
		EventBus.emit_signal("door_entered", self)
		set_physics_process(false)  # Stop checking

func check_fully_inside(body: CharacterBody2D) -> bool:
	var body_shape: CollisionShape2D = body.get_node("CollisionShape2D")  # Adjust path
	if !(area_shape.shape is RectangleShape2D) or !(body_shape.shape is RectangleShape2D):
		return false  # Handle other shapes if needed

	var area_rect = get_area_bounds_rect(area_shape)
	var body_rect = get_area_bounds_rect(body_shape)
	return area_rect.encloses(body_rect)
	
func get_area_bounds_rect(area):
	var area_pos = area.global_position
	var area_extents = area.shape.size / 2
	return Rect2(area_pos - area_extents, area.shape.size)
