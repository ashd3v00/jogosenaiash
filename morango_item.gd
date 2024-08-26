extends Area2D

var pointadd = 3

func _on_body_entered(body):
	if body.name == "player":
		Global.points += pointadd
		$morango_anim.play("collected") #roda a animacao
		await $morango_anim.animation_finished #qnd ela acabar...
		Global.LIFE += 1
		queue_free() #deleta a instancia
