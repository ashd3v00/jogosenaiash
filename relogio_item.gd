extends Area2D

@onready var player = $"../player"
@onready var control = $"../hud/control"

func _on_body_entered(body):
	if body.name == "player":
		control.segundos = control.segundos + 5
		$rel_anim.play("collected")
		await $rel_anim.animation_finished
		queue_free()
