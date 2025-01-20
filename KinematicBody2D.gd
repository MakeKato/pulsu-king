extends KinematicBody2D  

onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO  
const SPEED = 200  

func _ready():
	animated_sprite.play("idle")
	add_to_group("Player")

func _physics_process(_delta):
	velocity = Vector2.ZERO  

	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		animated_sprite.flip_h = false
		animated_sprite.play("Runright")  
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		animated_sprite.flip_h = false
		animated_sprite.play("Runleft")  
	else:
		animated_sprite.play("idle")  

	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED  
		animated_sprite.play("Runup")  
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED  
		animated_sprite.play("Rundown") 
	else:
		if velocity.x == 0:
			animated_sprite.play("idle")

	velocity = move_and_slide(velocity)
	

