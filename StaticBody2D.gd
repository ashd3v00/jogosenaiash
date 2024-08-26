extends StaticBody2D

@onready var player = $"../player"

var SPEED = 1

func _process(delta):
	position.x += SPEED


	if area.name == "mudadir":
		SPEED = SPEED * -1
		
