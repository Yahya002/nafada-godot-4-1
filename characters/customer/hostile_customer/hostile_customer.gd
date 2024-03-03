extends CharacterBody3D

var hostile: bool = true

@onready var visuals = $Visuals
@onready var animator: AnimationTree = $AnimationTree
@onready var msm = $MovementStateMachine
@onready var asm = $ActionStateMachine
@onready var decision_component = $DecisionComponent

func _ready() -> void:
	msm.init(get_tree().get_first_node_in_group("Players"),self, animator, decision_component)
	#asm.init(self, animator)

func _physics_process(delta: float) -> void:
	msm.process_physics(delta)
	#asm.process_physics(delta)
	
	msm.process_decision()

func _process(delta: float) -> void:
	msm.process_frame(delta)
	#asm.process_frame(delta)
