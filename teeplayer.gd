extends Node2D

export (PackedScene) var player_scene

func _ready():
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)
	
	
	var house_node = $House
	player.set_house_node(house_node)

	var game_music = preload("res://Long Away Home.wav")
	Audiomanager.play_music(game_music)
