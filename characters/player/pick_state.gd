extends State

var frame_overriden: bool = false

@export var idle_state: State

func _enter() -> void:
	super()
	animator.set("parameters/action_blend_space/blend_position", -1)
	animator.set("parameters/action/request", 1)
	#animator.set("parameters/action/active", true)
	
func _process_physics(delta: float) -> State:
	if not animator.get("parameters/one_shot/active"):
		frame_overriden = true
		print("overridden")
	if frame_overriden and not animator.get("parameters/one_shot/active"):
		return idle_state
	return null
