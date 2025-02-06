extends AudioStreamPlayer


var music_player

func _ready():
	# Yritetään hakea Menumusic solmu täällä
	music_player = get_node("/root/Control/Menumusic")
	
	if music_player != null:
		print("Menumusic node found!")
	else:
		print("Menumusic node NOT found!")
		
func on_start_button_pressed():
	if music_player != null:  
		music_player.stop()  
		
		print("Control node: ", $Control)  # Varmista, että Control-solmu löytyy
		print("Menumusic node: ", $Menumusic)  # Varmista, että Menumusic löytyy
	
	get_tree().change_scene("res://World0.tscn")
