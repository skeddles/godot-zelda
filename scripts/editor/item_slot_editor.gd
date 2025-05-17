@tool
extends Node
class_name ItemSlotEditor

@export var use_key:String = "X"


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	if not use_key:
		warnings.append("You need to specify a use key for this slot!")
	elif use_key.length() > 1:
		warnings.append("Use key must be a single letter!")
	elif use_key != use_key.to_upper():
		warnings.append("Use key must be uppercase!")
	
	return warnings
