extends Node2D

export (PackedScene) var player_scene

func _ready():
	# Instantiate and set up the player
	var player = player_scene.instance()
	player.position = GameManager.spawn_position
	add_child(player)


	# Play the game music
	var game_music = preload("res://Long Away Home.wav")
	Audiomanager.play_music(game_music)  # Direct reference to AudioManager (autoload)


func _on_Area2D_body_entered(body):
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	pass # Replace with function body.
