extends State

@export var walk_state: State
@export var jump_state: State
@export var fall_state: State

func _enter() -> void:
	super()
	animator.set("parameters/movement_blend_space/blend_position", Vector2.ZERO)
	parent.velocity.x = 0
	parent.velocity.z = 0

func _process_input(event: InputEvent) -> State:
	if _get_jump() and parent.is_on_floor():
		return jump_state
	if _get_movement_input() != Vector2.ZERO:
		return walk_state
	return null

func _process_physics(delta: float) -> State:
	parent.velocity.y -= gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
