extends AudioStreamPlayer


var music_player

func _ready():
	if has_node("Menumusic"):
		music_player = get_node("Menumusic")
	elif has_node("Gameover"):
		music_player = get_node("Gameover")
		
func on_start_button_pressed():
	if music_player != null:
		music_player.stop()
		
		print("Control node: ", $Control)  
		print("Menumusic node: ", $Menumusic)
	
	get_tree().change_scene("res://World0.tscn")
