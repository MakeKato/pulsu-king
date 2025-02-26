extends Area2D

onready var speech_bubble = $AnimatedSprite  # Ensure the path is correct

func _ready():
	speech_bubble.visible = false  # Hide the bubble initially

func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)  # Debugging

	if body.is_in_group("Player"):  # Detect by group, not by name
		speech_bubble.visible = true
		speech_bubble.play("default")  # Replace with your animation name

func _on_Area2D_body_exited(body):
	print("Body exited:", body.name)  # Debugging

	if body.is_in_group("Player"):  # Detect by group, not by name
		speech_bubble.stop()
		speech_bubble.visible = false
