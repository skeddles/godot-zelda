extends State

@onready var SPEED = player.SPEED

func _physics_process(delta):
	var horizontal = Input.get_axis("Left", "Right")
	var vertical = Input.get_axis("Up", "Down")
	
	if vertical:
		player.velocity = Vector2(0,vertical * SPEED)
		animate("walk", "vertical", vertical)
	elif horizontal:
		player.velocity = Vector2(horizontal * SPEED, 0)
		animate("walk", "horizontal", horizontal)
	else: 
		player.velocity = Vector2.ZERO
		%Sprite.stop()

	player.move_and_slide()
