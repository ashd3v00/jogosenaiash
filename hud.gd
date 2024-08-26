extends Control

@onready var vidatext = $LIfeContainer/vida/vidatext as Label


func _process(delta):
	vidatext.text = str(Global.LIFE)


