extends CharacterBody2D

@onready var cogumelo = $"../cogumelo"
const JUMP_VELOCITY = -400.0 #determina a velocidade vertical 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var control = $"../hud/control"
var dano = false
var pulando = false

signal morristo

func _physics_process(delta): 
	
	if not is_on_floor(): # se n tiver no chao
		velocity.y += gravity * delta  #adiciona valor positivo ao Y ate ficar no chao (cai)

	if Input.is_action_just_pressed("pulo") and is_on_floor()  and !dano:
		#se uma tecla esta pressionada, a velocidade vertical recebe a variavel da forca do pulo
		velocity.y = JUMP_VELOCITY
		var pulando = true
		
	elif is_on_floor():
		var pulando = false
	

#confere se uma das teclas direita ou esquerda esta pressionada
	var direction = Input.get_axis("esquerda", "direita")
	if direction && !dano:
		$AnimatedSprite2D.scale.x = direction
		velocity.x = direction * Global.SPEED #a velocidade horizontal recebe a direcao 
			#(tecla direita ou esquerda pressionada) multiplicado pela velocidade
	else:
		velocity.x = move_toward(velocity.x, 0, Global.SPEED * 0.9)
	if !dano:
		if is_on_floor():
			if pulando:
				$AnimatedSprite2D.play("JUMP")
			elif direction != 0: #se estiver e n tiver tomando dano				
				$AnimatedSprite2D.play("RUN")				 
			elif direction == 0:
				$AnimatedSprite2D.play("IDLE")				
		#senao vai desacelerand
		else: #não esta no chao
			if velocity.y <0:
				$AnimatedSprite2D.play("JUMP")
			else:
					$AnimatedSprite2D.play("FALL")
		
	move_and_slide() 
	
	if Global.LIFE <= 0:
		Global.LIFE = 3
		emit_signal("morristo")
		
	
func _levoudano():
	dano = true
	$AnimatedSprite2D.play("HIT")
	await $AnimatedSprite2D.animation_finished
	dano = false



func _on_cogumelo_body_entered(body):
	if body.name == "player":
		pulando = true 
		velocity.y += JUMP_VELOCITY -100
		


func _on_cogumelo_body_exited(body):
	pulando = false 
	
