extends Control

onready var settings_panel = $SettingsPanel  
onready var volume_slider = $SettingsPanel/VolumeSlider  
onready var close_button = $SettingsPanel/CloseButton  
onready var start_button = $AloitaPeli  
onready var settings_button = $Asetukset  
onready var music_player = $Menumusic


func _ready():
	
	settings_panel.visible = false

	
	settings_button.connect("pressed", self, "_on_settings_button_pressed")
	close_button.connect("pressed", self, "_on_close_button_pressed")
	start_button.connect("pressed", self, "_on_start_button_pressed")

	
	volume_slider.value = 1 
	volume_slider.connect("value_changed", self, "_on_volume_slider_changed")

func _on_settings_button_pressed():
	settings_panel.visible = true  


func _on_close_button_pressed():
	settings_panel.visible = false  


func _on_volume_slider_changed(value):
	
	var new_volume = lerp(-40, 0, value)  
	music_player.volume_db = new_volume  
	
	music_player.volume_db = clamp(music_player.volume_db, -40, 0)
	
	print("Current Volume: ", music_player.volume_db)
	
func _apply_ui_style():
	
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)  
	style.border_color = Color(0.8, 0.8, 0.8)  
	style.border_width_all = 4  
	
	start_button.add_stylebox_override("normal", style)
	settings_button.add_stylebox_override("normal", style)
	close_button.add_stylebox_override("normal", style)

	
	
func _on_start_button_pressed():
	
	get_tree().change_scene("res://World0.tscn")  
