extends Area2D

@onready var player = $"../player"

func _ready():
	pass

var SPEED = 1
var direction = -0.8
func _process(delta):
	position.x += SPEED
	$inimigo_anim.scale.x = direction 

func _on_area_entered(area):
	if area.name == "mudadir" or area.name == "mudadir2":
		SPEED = SPEED * -1
		direction = direction * -1

func _on_body_entered(body):
	if body.name == "player":
		player._levoudano()
		Global.LIFE -= 2 
		
