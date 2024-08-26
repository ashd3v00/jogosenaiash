extends Node2D

@onready var player = $player

func _ready():
	Global.points = 0
	Global.SPEED = 50.0
	
func _reset():
	get_tree().reload_current_scene()
	
