extends CharacterBody2D

const SPEED = 100

const ANIMATION = {
	"horizontal": {
		-1.0: "walk_left",
		1.0: "walk_right"
	},
	"vertical": {
		-1.0: "walk_up",
		1.0: "walk_down"
	},
	
}

func _physics_process(delta):
	
	var horizontal = Input.get_axis("Left", "Right")
	var vertical = Input.get_axis("Up", "Down")
	
	if vertical:
		velocity = Vector2(0,vertical * SPEED)
		$Sprite.animation = ANIMATION["vertical"][vertical]
		$Sprite.play()
	elif horizontal:
		velocity = Vector2(horizontal * SPEED, 0)
		$Sprite.animation = ANIMATION["horizontal"][horizontal]
		$Sprite.play()
	else: 
		$Sprite.stop()
		velocity = Vector2.ZERO
		
	move_and_slide()
