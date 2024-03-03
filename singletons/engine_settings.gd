extends Node

func _ready():
	Engine.max_fps = 60
	get_window().mode = Window.MODE_FULLSCREEN
