extends Node2D

onready var music_player = $AudioStreamPlayer
var current_track = null

func _ready():
	music_player.connect("finished", self, "_on_music_finished")


func play_music(music_stream: AudioStream):
	if current_track == music_stream:
		return

	current_track = music_stream
	music_player.stop()
	music_player.stream = music_stream
	music_player.play()

func stop_music():
	music_player.stop()
	current_track = null

func _on_music_finished():
	if current_track:
		music_player.play()
