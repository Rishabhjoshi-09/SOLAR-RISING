extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 200
const GRAVITY = 900
const JUMP_FORCE = -400

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	
	velocity.x = direction * SPEED

	
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE

	move_and_slide()



	if not is_on_floor():
		sprite.play("jump")  
	elif direction != 0:
		sprite.play("run")
		sprite.flip_h = direction < 0
	else:
		sprite.play("idle")
