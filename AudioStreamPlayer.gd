extends AudioStreamPlayer


var music_player

func _ready():
	music_player = get_node("/root/Control/Menumusic")
	music_player = get_node("/root/Control/Gameover")
	
	if music_player != null:
		print("Menumusic node found!")
	else:
		print("Menumusic node NOT found!")
		
func on_start_button_pressed():
	if music_player != null:  
		music_player.stop()  
		
		print("Control node: ", $Control)
		print("Menumusic node: ", $Menumusic)
	
	get_tree().change_scene("res://World0.tscn")
