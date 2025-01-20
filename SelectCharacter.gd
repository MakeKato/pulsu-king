extends Button

func _on_character_button_pressed(character_name):
	Globals.selected_character = character_name
	get_tree().change_scene("res://Game.tscn")
