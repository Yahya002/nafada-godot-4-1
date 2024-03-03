extends Node

# Return the desired direction of movement for the character
func get_movement_direction() -> Vector2:
	return Input.get_vector("left", "right", "forwards", "backwards")

# Return a boolean indicating if the character wants to jump
func wants_jump() -> bool:
	return Input.is_action_just_pressed('jump')
