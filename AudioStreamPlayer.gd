extends AudioStreamPlayer

onready var music_player = get_node("Menumusic")

func _ready():
	if music_player != null:  # Varmistetaan, että music_player ei ole null
		# Jos musiikki ei ole käynnissä, soita se
		if not music_player.playing:
			music_player.play()
	else:
		print("Virhe: AudioStreamPlayer solmua ei löydy!")

func on_start_button_pressed():
	if music_player != null:  # Varmistetaan, että music_player on olemassa
		music_player.stop()  # Pysäytetään musiikki
	# Siirrytään peliin, esim. vaihtamalla scene
	get_tree().change_scene("res://World0.tscn")
