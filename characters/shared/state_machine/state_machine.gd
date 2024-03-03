class_name StateMachine
extends Node

var current_state: State

@export var starting_state: State
@export var other_machine: StateMachine

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: CharacterBody3D, animator: AnimationTree, move_component, action_component) -> void:
	for child in get_children():
		child.parent = parent
		child.animator = animator
		child.move_component = move_component
		child.action_component = action_component

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

func process_input(event: InputEvent) -> void:
	var new_state = current_state._process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state._process_frame(delta)
	if new_state:
		change_state(new_state)
