class_name State
extends Node

var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")

var animator: AnimationTree
var move_component
var action_component
var parent: CharacterBody3D

@export var move_speed: float = 2.0

func _enter() -> void:
	pass

func _exit() -> void:
	pass

func _process_input(event: InputEvent) -> State:
	return null

func _process_frame(delta: float) -> State:
	return null

func _process_physics(delta: float) -> State:
	return null

func _get_movement_input() -> Vector2:
	return move_component.get_movement_direction()

func _get_jump() -> bool:
	return move_component.wants_jump()

func _get_action() -> Array:
	return action_component.get_action()
