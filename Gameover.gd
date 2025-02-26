extends Control

onready var start_button = $Uudestaan
onready var end_button = $Lopeta

func _ready():
	start_button.connect("pressed", self, "_on_start_button_pressed")
	end_button.connect("pressed", self, "_on_end_button_pressed")


	var music_to_play : AudioStream = get_music_for_scene(get_tree().current_scene.name)
	Audiomanager.play_music(music_to_play)

func get_music_for_scene(scene_name: String) -> AudioStream:
	match scene_name:
		"gameover":
			return preload("res://Game Over.ogg")
		"loser":
			return preload("res://Game Over.ogg")
		"mid":
			return preload("res://Happy.ogg")
		"big":
			return preload("res://Happy.ogg")
		_:
			return preload("res://Game Over.ogg")

func _on_start_button_pressed():
	Inventory.reset()
	TimeManager.reset()
	get_tree().change_scene("res://World0.tscn")

func _on_end_button_pressed():
	get_tree().quit()
