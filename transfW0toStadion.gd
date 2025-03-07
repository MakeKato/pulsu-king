extends Area2D

export(String, FILE, "*.tscn") var next_scene_path = "res://stadion.tscn"
export(Vector2) var player_spawn_position = Vector2(528, 544)

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		GameManager.spawn_position = player_spawn_position
		print("Transitioning to:", next_scene_path)
		get_tree().change_scene(next_scene_path)
