extends State

const DESCEND_SPEED = 15

var target_room
var target_marker

func start():
	%Sprite.play("walk_up")
	pass

func end():
	%Sprite.position = Vector2.ZERO

func _process(delta):
	center_sprite_horizontally()
	%Sprite.position.y += delta * DESCEND_SPEED
	
	if %Sprite.position.y > 16:
		player.change_state("Walk")
		player.world.teleport(target_room, target_marker)
		
	
func center_sprite_horizontally():
	var current_x = %Sprite.global_position.x
	var target_x = round((current_x) / 16.0) * 16.0
	%Sprite.global_position.x = lerp(current_x, target_x, 0.1)
