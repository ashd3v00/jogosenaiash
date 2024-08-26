extends CanvasLayer

func _on_texture_button_pressed():
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://level.tscn")
