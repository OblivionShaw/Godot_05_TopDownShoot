extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprited2D
@onready var gun = $Gun

const SPEED = 100
const JUMP_VELOCITY = -400

var direction:Vector2

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	direction.x = Input.get_axis("move_left" , "move_right")
	direction.y = Input.get_axis("move_up" , "move_down")
	
	if Input.is_action_just_pressed("attack"):
		gun.shoot();
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x , 0 , SPEED)
		velocity.y = move_toward(velocity.x , 0 , SPEED)
		
	if direction != Vector2.ZERO:
		gun.setup_direction(direction)
		
	#animation()
	
	#move_and_slide()
	

