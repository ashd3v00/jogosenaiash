extends Area2D

var pointadd = 1

func _on_body_entered(body):
	if body.name == "player":
		Global.points += pointadd
		$melanciaboa_anim.play("collected") #roda a animacao
		await $melanciaboa_anim.animation_finished #qnd ela acabar...
		Global.SPEED = Global.SPEED + 50
		queue_free() #deleta a instancia
