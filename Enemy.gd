extends KinematicBody2D

export var speed := 100  # Movement speed

# Define movement boundaries
export var min_x := 100
export var max_x := 500
export var min_y := 100
export var max_y := 500

onready var animated_sprite := $AnimatedSprite
var player: Node2D = null  # Store player reference

func _ready():
	$DetectionArea.connect("body_entered", self, "_on_DetectionArea_body_entered")
	$DetectionArea.connect("body_exited", self, "_on_DetectionArea_body_exited")
	$Hitbox.connect("body_entered", self, "_on_Hitbox_body_entered")  # Detect collision with player

func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		
		# Move towards the player
		var velocity = direction * speed
		velocity = move_and_slide(velocity)

		# Clamp position to keep enemy inside boundaries
		global_position.x = clamp(global_position.x, min_x, max_x)
		global_position.y = clamp(global_position.y, min_y, max_y)

		update_animation(direction)
	else:
		animated_sprite.play("idle")

func update_animation(direction: Vector2):
	if direction.length() > 0:  # Only change animation when actually moving
		if abs(direction.x) > abs(direction.y):  
			if direction.x > 0 and animated_sprite.animation != "oikea":
				animated_sprite.play("oikea")  # Right
			elif direction.x < 0 and animated_sprite.animation != "vasen":
				animated_sprite.play("vasen")  # Left
		else:
			if direction.y > 0 and animated_sprite.animation != "alas":
				animated_sprite.play("alas")  # Down
			elif direction.y < 0 and animated_sprite.animation != "ylös":
				animated_sprite.play("ylös")  # Up

func _on_DetectionArea_body_entered(body):
	if body.is_in_group("Player"):  
		print("🎯 Player detected!")
		player = body  # Start chasing

func _on_DetectionArea_body_exited(body):
	if body == player:
		print("❌ Player lost!")
		player = null
		animated_sprite.play("idle")

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		print("💀 Player hit! Loading Game Over screen...")
		get_tree().change_scene("res://Gameover.tscn")  # Load Game Over scene
