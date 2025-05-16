@tool
extends EditorArea
class_name Item_Editor

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
	if $Sprite.texture != texture:
		$Sprite.texture = texture

var _current_texture: Texture2D = null
@export var texture: Texture2D:
	set(value): set_texture(value)
	get: return _current_texture
	

func set_texture(value):
	# texture added
	if _current_texture: 
		_current_texture.changed.disconnect(_update_warnings)
	
	# update stored texture
	_current_texture = value
	
	# connect new signals
	if _current_texture: 
		_current_texture.changed.connect(_update_warnings)

	update_configuration_warnings()


func _update_warnings() -> void: update_configuration_warnings()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	if !texture:
		warnings.append("You should add a Texture to this item to define it looks like! Use an AtlasTexture for sprite sheets, or a Texture2D for a single sprite.")

	return warnings
