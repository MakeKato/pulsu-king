extends KinematicBody2D

export var speed := 90  # Movement speed

# Define movement boundaries
export var min_x := 0
export var max_x := 1000
export var min_y := 225
export var max_y := 600

onready var animated_sprite := $AnimatedSprite
onready var detection_area := $DetectionArea
onready var navigation_agent := $NavigationAgent
var player: Node2D = null  # Store player reference

func _ready():
	if detection_area:
		detection_area.connect("body_entered", self, "_on_DetectionArea_body_entered")
		detection_area.connect("body_exited", self, "_on_DetectionArea_body_exited")
	else:
		print("❌ Error: DetectionArea is missing!")

	if navigation_agent:
		navigation_agent.max_speed = speed
	else:
		print("❌ Error: NavigationAgent2D is missing!")

func _physics_process(delta):
	if player and navigation_agent:
		# Update path to player's position
		navigation_agent.set_target_location(player.global_position)

		# Retrieve next position
		var next_position = navigation_agent.get_next_location()

		# Debugging info
		print("📌 Next position from NavigationAgent2D:", next_position)

		# If the next position is (0,0), it means pathfinding failed
		if next_position == Vector2.ZERO:
			print("❌ NavigationAgent2D is NOT calculating a path!")
			return  # No movement

		var direction = (next_position - global_position).normalized()
		var velocity = direction * speed

		# Move the enemy
		move_and_slide(velocity)

		# Keep enemy inside bounds
		global_position.x = clamp(global_position.x, min_x, max_x)
		global_position.y = clamp(global_position.y, min_y, max_y)

		# Update animations
		update_animation(direction)
	else:
		animated_sprite.play("idle")

func update_animation(direction: Vector2):
	if direction.length() > 0:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("oikea")  # Right
			elif direction.x < 0:
				animated_sprite.play("vasen")  # Left
		else:
			if direction.y > 0:
				animated_sprite.play("alas")  # Down
			elif direction.y < 0:
				animated_sprite.play("ylös")  # Up

func _on_DetectionArea_body_entered(body):
	if body.is_in_group("Player"):
		print("🎯 Player detected!")
		player = body
		navigation_agent.set_target_location(player.global_position)

func _on_DetectionArea_body_exited(body):
	if body == player:
		print("❌ Player lost!")
		player = null
		animated_sprite.play("idle")

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		print("💀 Player hit!")
		body.queue_free()  # Replace with a death function if needed
