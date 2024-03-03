class_name AiStateMachine
extends Node

var current_state: AiState

@export var starting_state: AiState
@export var other_machine: AiStateMachine

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(player: Player, parent: CharacterBody3D, animator: AnimationTree, decision_component) -> void:
	for child in get_children():
		child.parent = parent
		child.animator = animator
		child.decision_component = decision_component
		child.player = player

	# Initialize to the default state
	change_state(starting_state)

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state._exit()

	current_state = new_state
	current_state._enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state._process_physics(delta)
	if new_state:
		change_state(new_state)

func process_decision() -> void:
	var new_state = current_state._process_decison()
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state._process_frame(delta)
	if new_state:
		change_state(new_state)
