extends Node

const CONFIG_PATH = "user://settings.cfg"
var volume = 1.0

func _ready():
	load_settings()

func set_volume(value):
	volume = value
	var new_volume = lerp(-80, 0, volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), new_volume)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), new_volume <= -79)
	save_settings()

func save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "volume", volume)
	config.save(CONFIG_PATH)

func load_settings():
	var config = ConfigFile.new()
	if config.load(CONFIG_PATH) == OK:
		volume = config.get_value("audio", "volume", 1.0)
		set_volume(volume)
