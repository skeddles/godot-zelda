extends State

@onready var SPEED = player.SPEED

var direction = "down"


func start():
	%Sprite.play("walk_"+direction)
	%Sprite.stop()


func _physics_process(_delta):
	var horizontal = Input.get_axis("Left", "Right")
	var vertical = Input.get_axis("Up", "Down")
	
	if vertical:
		player.velocity = Vector2(0,vertical * SPEED)
		direction = DIRECTION["vertical"][vertical]
		%Sprite.play("walk_"+direction)
		player.position.x = round(player.position.x/8.0) * 8.0
	elif horizontal:
		player.velocity = Vector2(horizontal * SPEED, 0)
		direction = DIRECTION["horizontal"][horizontal]
		%Sprite.play("walk_"+direction)
		player.position.y = round(player.position.y/8.0) * 8.0
	else: 
		player.velocity = Vector2.ZERO
		%Sprite.stop()

	player.move_and_slide()
	check_for_collisions()


func check_for_collisions():
	for i in player.get_slide_collision_count():
		var collision = player.get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "WorldBoundaries":
			world_boundary_collision(collision, collider)


func world_boundary_collision(collision, collider):
	if player.velocity == Vector2.ZERO: return
	
	var collider_shape_index = collision.get_collider_shape_index()
	var direction_boundary = collider.shape_owner_get_owner(collider_shape_index)
	var direction = direction_boundary.get_meta("direction_prefix")
	var current_room = player.world.current_room
	var target_room = current_room[direction+"_room_scene"]
	
	if target_room:
		var teleport_target = current_room[direction+"_teleport_target"]
		if teleport_target:
			player.world.teleport(target_room, teleport_target)
		else:
			player.world.transition(target_room, direction)
