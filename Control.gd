extends Control

@onready var contador_item = $MarginContainer/VBoxContainer/contador_item
@onready var contador_timer = $MarginContainer/VBoxContainer/contador_timer
@onready var contador_vida = $MarginContainer/VBoxContainer/contador_vida
@onready var contador_vel = $MarginContainer/VBoxContainer/contador_vel

@onready var timer = $Timer as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0

@export_range(0,2) var minpadrao = 1
@export_range(0,59) var segpadrao = 0

func _ready():
	contador_item.text = "   Pontos:" + str("%02d" % Global.points) 
	contador_vida.text = "   Vida: " + str("%02d" % Global.LIFE) 
	contador_vel.text = "   Velocidade: " + str("%03d" % Global.SPEED) 
	contador_timer.text = "   Timer " + str("%02d" % minpadrao) + ":" + str("%02d" % segpadrao) 
	minutos = minpadrao
	segundos = segpadrao
	

func _process(delta):
	contador_item.text =  "   pontos: " + str("%02d" % Global.points) 
	contador_vida.text = "   Vida: " + str("%02d" % Global.LIFE) 
	contador_vel.text = "   Velocidade: " + str("%03d" % Global.SPEED) 
	
	if minutos <= 0 && segundos <= 0:
		emit_signal("tempo_acabou")
		

func _on_timer_timeout():
	if segundos == 0:
		if minutos >0: 
			minutos -= 1
			segundos = 60
	segundos -= 1
	contador_timer.text = "   timer " + str("%02d" % minutos) + ":" + str("%02d" % segundos) 


