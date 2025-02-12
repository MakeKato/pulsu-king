extends Control
 
onready var start_button = $Uudestaan
onready var end_button = $Lopeta 

func _ready():
	
	start_button.connect("pressed", self, "_on_start_button_pressed")
	end_button.connect("pressed", self, "_on_end_button_pressed")
	
func _on_start_button_pressed():
	
	get_tree().change_scene("res://World0.tscn") 

func _on_end_button_pressed():
	get_tree().quit()
