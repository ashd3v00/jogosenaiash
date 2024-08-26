extends CanvasLayer

@onready var player = $"../player"
@onready var level = $".."
@onready var text = $VBoxContainer/text

func _on_player_morristo():
	visible = true 
	get_tree().paused = true
	text.text =  "Morreu, otario "

func _on_bt_tentar_nvmt_pressed():
	get_tree().paused = false
	Global.LIFE = 3
	visible = false
	level._reset()
	
func _on_control_tempo_acabou():
	visible = true 
	get_tree().paused = true
	text.text =  "Acabou o tempo, lento pra porra"
