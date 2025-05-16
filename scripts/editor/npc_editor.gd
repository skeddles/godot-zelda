@tool
extends EditorClass
class_name NPC_Editor

# This script only adds functionality to the editor, such as warnings and
# showing the proper sprite

func _enter_tree():
	super._enter_tree()
	if Engine.is_editor_hint():
		update_editor_sprite()
		

func _editor_update() -> void:
	update_editor_sprite()
	update_configuration_warnings()


func update_editor_sprite():
	if $Sprite.sprite_frames != sprite_frames:
		$Sprite.sprite_frames = sprite_frames
		
	if sprite_frames and sprite_frames.has_animation("default"):
		$Sprite.play("default")

var _current_sprite_frames: SpriteFrames = null
@export var sprite_frames: SpriteFrames:
	set(value): set_sprite_frames(value)
	get: return _current_sprite_frames
	

func set_sprite_frames(value):
	# sprite_frames added
	if _current_sprite_frames: 
		_current_sprite_frames.changed.disconnect(_update_warnings)
	
	# update stored sprite_frames
	_current_sprite_frames = value
	
	# connect new signals
	if _current_sprite_frames: 
		_current_sprite_frames.changed.connect(_update_warnings)

	update_configuration_warnings()


func _update_warnings() -> void: update_configuration_warnings()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	if !sprite_frames:
		warnings.append("You should add SpriteFrames to this NPC to define what they look like! Make sure they have an animation named \"default\" which will play after they spawn (even if it's just one frame)")
	elif not sprite_frames.has_animation("default"):
		warnings.append("The SpriteFrames you provided to this NPC does not contain an animation named \"default\"")
	elif sprite_frames.get_frame_count("default") == 0:
		warnings.append("The \"default\" animation in your Sprite Frames does not have any frames. Make sure to add one or more frames or your NPC will be invisible!")
	
	return warnings
