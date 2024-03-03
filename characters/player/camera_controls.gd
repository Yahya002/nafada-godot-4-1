extends Node3D

@export var mouse_sens_v: float = 0.005
@export var mouse_sens_h: float = 0.005

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_x(-event.relative.y * mouse_sens_v)
		get_parent().rotate_y(-event.relative.x * mouse_sens_h)
	rotation.x = clamp(rotation.x, -PI/2, PI/2)
