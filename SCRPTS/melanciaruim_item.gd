extends Area2D

@onready var player = $"../../player"
 #isso incrementa as informações do player 
#no outro item, sem isso ele n sabe qm e player

func _on_body_entered(body):
	if body.name == "player":
		player._levoudano()
		$melanciaruim_anim.play("collected")
		await $melanciaruim_anim.animation_finished
		Global.SPEED = Global.SPEED - 20
		Global.LIFE -= 1 
		queue_free()
