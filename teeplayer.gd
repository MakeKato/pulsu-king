extends Node2D

export (PackedScene) var player_scene

onready var house = $House
var player = null

func _ready():
	# Instantiate and set up the player
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)


	# Play the game music
	var game_music = preload("res://Long Away Home.wav")
	Audiomanager.play_music(game_music)  # Direct reference to AudioManager (autoload)
