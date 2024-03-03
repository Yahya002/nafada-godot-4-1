extends Node

# Return the desired direction of movement for the character
func get_action() -> Array:
	return [Input.is_action_just_pressed("throw")]
