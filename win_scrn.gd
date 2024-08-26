extends CanvasLayer

@onready var h_box_container = $HBoxContainer
@onready var level = $".."
@onready var wintext = $wintext

@onready var control = $"../hud/control"

func _physics_process(delta):
	wintext.text = "Você venceu com " + str("%02d" % Global.points) + " pontos restando " + str("%02d" % control.minutos) + ":" + str("%02d" % control.segundos) + "!!! Joga muito!"

func _on_reiniciar_pressed():
	get_tree().paused = false
	Global.LIFE = 3
	visible = false
	level._reset()

func _on_fechar_pressed():
	get_tree().quit()
	
	
	
