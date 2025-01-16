extends KinematicBody2D

# Declare member variables
var speed: float = 200.0
var velocity: Vector2 = Vector2.ZERO
var collected_bottles: int = 0

func _process(_delta: float):
	# Input handling for movement
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalize direction and calculate velocity
	velocity = direction.normalized() * speed

	# Apply movement
	velocity = move_and_slide(velocity)
