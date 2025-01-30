extends Area2D

export(String, FILE, "*.tscn") var next_scene_path = "res://World1.tscn"

func _ready():
	connect("body_entered", self, "_on_body_entered")  # Ensures signal is connected

func _on_body_entered(body):
	if body.is_in_group("Player"):  # Hero.tscn must be in the "Player" group
		print("Transitioning to:", next_scene_path)  # Debugging
		get_tree().change_scene(next_scene_path)  # Load World1.tscn
