extends RigidBody3D

var impulse: Vector3

func _ready():
	reparent(get_parent().get_parent())
	apply_central_impulse(impulse)

func _process(delta):
	pass


func _on_destruction_timer_timeout():
	queue_free()
