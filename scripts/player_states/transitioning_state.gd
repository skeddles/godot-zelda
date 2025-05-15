extends State


func start():
	%Sprite.stop()
	pass


func _process(delta):
	if camera.position == world.transition_position:
		player.change_state("Walk")
