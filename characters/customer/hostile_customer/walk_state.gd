extends AiState

@export var idle_state: AiState
@export var nav_agent: NavigationAgent3D

func _enter() -> void:
	super()
	animator.set("parameters/simple_movement_blendspace/blend_position", 1)

	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	nav_agent.path_desired_distance = 0.5
	nav_agent.target_desired_distance = 0.5

	# Make sure to not await during _ready.
	call_deferred("actor_setup")

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(player.position)

func set_movement_target(movement_target: Vector3):
	nav_agent.set_target_position(movement_target)

func _process_physics(delta: float) -> State:
	if nav_agent.is_navigation_finished():
		set_movement_target(player.position)

	var current_agent_position: Vector3 = parent.global_position
	
	var next_path_position: Vector3 = nav_agent.get_next_path_position()
	parent.look_at(next_path_position)
	var new_velocity: Vector3 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * move_speed

	parent.velocity = new_velocity
	if not parent.is_on_floor():
		parent.velocity.y -= gravity * delta
	parent.move_and_slide()
	return null
