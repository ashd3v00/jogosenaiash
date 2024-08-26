extends Area2D

@onready var player = $"../../player"

 #isso incrementa as informações do player 
#no outro item, sem isso ele n sabe qm e player

func _on_body_entered(body):
	if body.name == "player":
		player._levoudano()
		Global.LIFE -= 1 
		
