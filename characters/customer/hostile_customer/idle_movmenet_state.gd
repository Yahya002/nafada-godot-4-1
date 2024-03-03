extends AiState

@export var walk_state: AiState

func _enter() -> void:
	super()
	animator.set("parameters/simple_movement_blendspace/blend_position", -1)

func _process_decision() -> State:
	if parent.hostile:
		if abs(parent.position - player.position).length() > 5.0:
			print("chase")
			return walk_state
		else:
			parent.look_at(player.position)
			print("attack")
	return null

func _process_physics(delta: float) -> State:
	if not parent.is_on_floor():
		parent.velocity.y -= gravity * delta
	
	parent.move_and_slide()
	return null
