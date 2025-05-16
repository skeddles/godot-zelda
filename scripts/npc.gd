@tool
extends NPC_Editor
class_name NPC

@onready var default_sprite_frames:SpriteFrames = load("res://art/smoke_sprite_frames.tres")

var disappearing_start_time:int

func _ready():
	if not Engine.is_editor_hint():
		$Sprite.sprite_frames = default_sprite_frames
		$Sprite.frame = 0
		$Sprite.play("spawn")


func _on_sprite_animation_finished():
	if $Sprite.animation == "spawn":
		print("done")
		if sprite_frames:
			if sprite_frames.has_animation("default"):
				$Sprite.sprite_frames = sprite_frames
				$Sprite.play("default")
			else:
				visible = false
				print("Warning: sprite \"", name, "\"'s Sprite Frames does not have an animation named \"default\"!")
		else:
			visible = false
			print("Warning: sprite \"", name, "\" does not have Sprite Frames defined!")

func _process(_delta):
	if disappearing_start_time:
		var time_since_started = Time.get_ticks_msec() - disappearing_start_time
		visible = time_since_started % 50 > 25
		if time_since_started > 1000:
			queue_free()

func disappear():
	disappearing_start_time = Time.get_ticks_msec()
