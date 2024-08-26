extends CharacterBody2D


const SPEED = 200.0 # determina a velocidade horizontal
const JUMP_VELOCITY = -400.0 #determina a velocidade vertical 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta): 
	
	if not is_on_floor(): # se n tiver no chao
		velocity.y += gravity * delta  #adiciona valor positivo ao Y ate ficar no chao (cai)

	if Input.is_action_just_pressed("pulo") and is_on_floor():
		#se uma tecla esta pressionada, a velocidade vertical recebe a variavel da forca do pulo
		velocity.y = JUMP_VELOCITY

#confere se uma das teclas direita ou esquerda esta pressionada
	var direction = Input.get_axis("ui_left", "ui_right") 
	if direction != 0: #se estiver 
		$AnimatedSprite2D.scale.x = direction
		$AnimatedSprite2D.play("RUN")
		velocity.x = direction * SPEED #a velocidade horizontal recebe a direcao 
		#(tecla direita ou esquerda pressionada) multiplicado pela velocidade 
	else:
		$AnimatedSprite2D.play("IDLE")
		velocity.x = move_toward(velocity.x, 0, SPEED)
#senao vai desacelerand

	if Input.is_action_pressed("pulo"):
		$AnimatedSprite2D.play("JUMP")
	
	if !is_on_floor() and !Input.is_action_pressed("pulo"):
		$AnimatedSprite2D.play("FALL")
		
	move_and_slide()
