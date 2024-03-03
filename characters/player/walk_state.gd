extends State

var movement: Vector2

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State


func _process_frame(delta: float) -> State:
	animator.set("parameters/movement_blend_space/blend_position", movement)
	return null

func _process_physics(delta: float) -> State:
	parent.velocity.y -= gravity * delta

	if _get_jump() and parent.is_on_floor():
		return jump_state
		
	movement = _get_movement_input()
	if movement == Vector2.ZERO:
		return idle_state
	var direction = (parent.transform.basis * Vector3(movement.x, 0, movement.y)).normalized()
	
	parent.velocity.x = direction.x * move_speed
	parent.velocity.z = direction.z * move_speed
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
