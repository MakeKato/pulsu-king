extends KinematicBody2D

# Speed of the character
var speed = 200

# Reference to the AnimatedSprite node
onready var animated_sprite = $AnimatedSprite

func _process(_delta):
	var velocity = Vector2.ZERO  # Default velocity
	
	# Handle movement input
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animated_sprite.play("walk")
		animated_sprite.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -1
		animated_sprite.play("walk")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")  # Stop animation if no input
	
	# Normalize velocity to prevent faster diagonal movement and apply speed
	velocity = velocity.normalized() * speed
	
	# Move the character
	move_and_slide(velocity)
