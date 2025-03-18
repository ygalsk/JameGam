extends CharacterBody2D

const SPEED = 100
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_direction = Vector2.ZERO #Player movement vector
	
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
	if Input.is_action_pressed("down"):
		input_direction.y += 1
		
	velocity = input_direction.normalized() * SPEED
	if input_direction.length() > 0:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")
		
	if input_direction.x != 0:
		$AnimatedSprite2D.animation = "Walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = input_direction.x < 0
	elif input_direction.y != 0:
		$AnimatedSprite2D.animation = "Walk"
	elif input_direction.x == 0 && input_direction.y == 0:
		$AnimatedSprite2D.animation = "Idle"
	move_and_slide()
