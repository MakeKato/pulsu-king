extends Control

onready var settings_panel = $SettingsPanel
onready var volume_slider = $SettingsPanel/VolumeSlider
onready var start_button = $AloitaPeli
onready var settings_button = $Asetukset
onready var music_player = $Menumusic
onready var end_button = $Lopeta


var default_end_game_position

func _ready():
	settings_panel.visible = false


	default_end_game_position = end_button.rect_position


	settings_button.connect("pressed", self, "_on_settings_button_pressed")
	start_button.connect("pressed", self, "_on_start_button_pressed")
	end_button.connect("pressed", self, "_on_end_button_pressed")

	
	volume_slider.value = Settings.volume
	volume_slider.connect("value_changed", self, "_on_volume_slider_changed")

func _on_settings_button_pressed():
	if settings_panel.visible:
		settings_panel.visible = false
		end_button.rect_position = default_end_game_position
	else:
		settings_panel.visible = true
		var panel_height = settings_panel.rect_size.y
		end_button.rect_position.y = default_end_game_position.y + panel_height + 10

func _on_close_button_pressed():
	_on_settings_button_pressed()

func _on_volume_slider_changed(value):
	var new_volume = lerp(-80, 0, value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), new_volume)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), new_volume <= -79)
	print("Current Master Volume: ", new_volume)

func _apply_ui_style():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)
	style.border_color = Color(0.8, 0.8, 0.8)
	style.border_width_all = 4

	start_button.add_stylebox_override("normal", style)
	settings_button.add_stylebox_override("normal", style)

func _on_start_button_pressed():
	get_tree().change_scene("res://World0.tscn")

func _on_end_button_pressed():
	get_tree().quit()
