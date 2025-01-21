extends KinematicBody2D

# Speed at which the player moves
var speed = 200

# The movement direction vector
var velocity = Vector2()

func _ready():
	# Initialize any necessary values if needed
	pass

func _process(delta):
	# Reset velocity to (0, 0) at the start of each frame
	velocity = Vector2()

	# Get input for movement (WASD or arrow keys)
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1

	# Normalize the velocity to ensure consistent speed in all directions
	velocity = velocity.normalized() * speed

	# Move the character using KinematicBody2D's move_and_slide method
	move_and_slide(velocity)
