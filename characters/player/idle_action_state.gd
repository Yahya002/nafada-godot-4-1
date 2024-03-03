extends State

@export var pick_state: State
@export var throw_state: State

func _enter() -> void:
	super()
	print("idle")

func _process_input(event: InputEvent) -> State:
	if _get_action()[0]:
		print("throw")
		return pick_state
	return null
