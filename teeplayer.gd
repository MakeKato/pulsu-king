extends Node2D

export (PackedScene) var player_scene

func _ready():
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)
