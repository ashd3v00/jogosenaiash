extends CanvasLayer

@onready var level = $".."
	
func  _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		visible = true
	
func _on_bt_quit_pressed():
	get_tree().quit()
	
func _on_bt_voltar_pressed():
	get_tree().paused = false
	visible = false

func _on_bt_reiniciar_pressed():
	Global.LIFE = 3 #por algm motivo tava bugando fora daqui
	get_tree().paused = false
	level._reset()
