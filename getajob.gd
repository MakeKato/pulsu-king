extends Area2D

onready var speech_bubble = $AnimatedSprite  # Ensure the path is correct

func _ready():
	speech_bubble.visible = false  # Hide the bubble initially

func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)  # Debugging
	if body.name == "Hero":  # Ensure the player's node name is "Hero"
		speech_bubble.visible = true
		speech_bubble.play("default")  # Replace "default" with your animation name

func _on_Area2D_body_exited(body):
	print("Body exited:", body.name)  # Debugging
	if body.name == "Hero":
		speech_bubble.stop()
		speech_bubble.visible = false
