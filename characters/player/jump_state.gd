extends State

# TODO
# chop-up and fix jump

var jump_intensity: float = 100.0

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State

func _enter() -> void:
	super()

func _exit() -> void:
	super()
	parent.visuals.position.y = 0

func _process_physics(delta: float) -> State:
	if animator.current_animation_position > 0.5 and animator.current_animation_position < 0.55:
		parent.velocity.y += jump_intensity * delta
	if animator.current_animation_position > 0.5:
		parent.velocity.y -= gravity * delta
	if not animator.is_playing():
		if parent.is_on_floor():
			return idle_state
	parent.move_and_slide()
	return null
