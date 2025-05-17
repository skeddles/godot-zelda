@tool
extends ItemSlotEditor


func _ready():
	if not use_key or use_key.length() > 1:
		$UseKey.text = '?'
	else:
		$UseKey.text = use_key.to_upper()

func set_texture(texture):
	$ItemSprite.texture = texture
