extends Panel


#extends Button

onready var settings_panel = $Control/SettingsPanel  # Oikea polku
onready var volume_slider = $Control/SettingsPanel/VolumeSlider  # Oikea polku Sliderille
onready var close_button = $Control/SettingsPanel/CloseButton  # Oikea polku CloseButtonille
onready var music_player = $Menumusic  # Viittaa musiikkisoittimeen
onready var start_button = $Control/AloitaPeli  # Viittaa "Aloita peli" -painikkeeseen (oikea polku)

func _ready():
	# Asetetaan tyylit painikkeelle
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)  # Taustaväri
	style.border_color = Color(0.78, 0.78, 0.78)  # Reunaväri
	style.border_width_top = 2  # Yläreunan paksuus
	style.border_width_bottom = 2  # Alareunan paksuus
	style.border_width_left = 2  # Vasemman reunan paksuus
	style.border_width_right = 2  # Oikean reunan paksuus
	self.add_stylebox_override("normal", style)  # Normal-tila
	self.add_stylebox_override("hover", style)   # Hover-tila (hiiren päällä)
	self.add_stylebox_override("pressed", style) # Pressed-tila (painettuna)

	# Piilotetaan asetuspaneeli aluksi
	settings_panel.visible = false

	# Aseta volume sliderin alkuarvo
	volume_slider.value = music_player.volume_db

	# Liitä sliderin arvo musiikin äänenvoimakkuuteen
	volume_slider.connect("value_changed", self, "_on_volume_slider_changed")

	# Liitä sulkupainike
	close_button.connect("pressed", self, "_on_close_button_pressed")

	# Varmistetaan, että "Aloita peli" -painike on näkyvissä
	start_button.visible = true

# Asetuspainikkeen toiminto
func _on_settings_button_pressed():
	settings_panel.visible = true  # Näytä asetuspaneeli

# Sulkeepainikkeen toiminto, joka piilottaa asetuspaneelin
func _on_close_button_pressed():
	settings_panel.visible = false  # Piilota asetuspaneeli

# Tämä funktio päivittää äänenvoimakkuuden sliderin arvon mukaan
func _on_volume_slider_changed(value):
	music_player.volume_db = lerp(-80, 0, value)  # Skaalataan arvo oikealle alueelle
