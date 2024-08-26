extends Area2D

@onready var win_scrn = $"../win_scrn"

func _on_body_entered(body):
	get_tree().paused = true
	win_scrn.visible = true
