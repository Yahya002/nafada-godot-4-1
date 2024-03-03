extends StateMachine

func _init_fsm(parent: CharacterBody3D, animator: AnimationTree) -> void:
	for child in get_children():
		child.parent = parent
		child.animator = animator
