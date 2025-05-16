extends State

## This determines how long the player shows off the item above their head
@export var display_item_length:float = 1.0

var display_time_started:int

func start():
	%Sprite.play("got_weapon")
	display_time_started = Time.get_ticks_msec()
	player.get_node("HeldWeaponSprite").visible = true

func _process(delta):
	if display_time_started:
		var seconds_since_display_started = (Time.get_ticks_msec() - display_time_started) / 1000
		if seconds_since_display_started > display_item_length:
			display_time_started = -1
			player.change_state("Walk")
			player.get_node("HeldWeaponSprite").visible = false
	
