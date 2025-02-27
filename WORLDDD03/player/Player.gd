extends KinematicBody2D

# Constants
const GRAVITY = 1000
const WALK_SPEED = 150
const RUN_SPEED = 250
const JUMP_FORCE = -400
const FLOOR_NORMAL = Vector2.UP

# Variables
var velocity = Vector2.ZERO
var is_running = false
var move_direction = 0

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Handle movement input
	var move_direction = 0
	if Input.is_action_pressed("move_left"):
		move_direction = -1
		$AnimatedSprite.flip_h = true
		print("Moving left")
	elif Input.is_action_pressed("move_right"):
		move_direction = 1
		$AnimatedSprite.flip_h = false
		print("Moving right")

	# Check if the run key is pressed
	is_running = Input.is_action_pressed("run")
	print("Running key pressed:", is_running)

	# Update velocity
	var speed = RUN_SPEED if is_running else WALK_SPEED
	velocity.x = move_direction * speed

	# Play the correct animation
	if move_direction != 0:  # Moving
		if is_running:
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")
	else:  # Not moving
		$AnimatedSprite.play("idle")

	# Handle jumping
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE
		print("JUMPING!")

	# Move the player
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
