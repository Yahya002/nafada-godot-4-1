class_name Player
extends CharacterBody3D

@onready var visuals = $Visuals
@onready var animator: AnimationTree = $AnimationTree
@onready var msm = $MovementStateMachine
@onready var asm = $ActionStateMachine
@onready var move_component = $MoveComponent
@onready var action_component = $ActionComponent

func _ready() -> void:
	msm.init(self, animator, move_component, action_component)
	asm.init(self, animator, move_component, action_component)

func _unhandled_input(event: InputEvent) -> void:
	msm.process_input(event)
	asm.process_input(event)

func _physics_process(delta: float) -> void:
	msm.process_physics(delta)
	asm.process_physics(delta)

func _process(delta: float) -> void:
	msm.process_frame(delta)
	asm.process_frame(delta)
