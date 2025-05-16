@tool
extends Item_Editor
class_name Item

## When this item is collected, this NPC will disappear
@export var related_npc:NPC

func _ready():
	$Sprite.texture = texture


func _on_body_entered(player: Player) -> void:
	if related_npc:
		related_npc.disappear()
		visible = false
		player.change_state("GotItem")
