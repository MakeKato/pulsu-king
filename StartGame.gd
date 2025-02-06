extends Button

func _pressed():
	# Siirrytään seuraavaan kohtaukseen (esim. peliin)
	get_tree().change_scene("res://World0.tscn")

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)  # Taustaväri
	style.border_color = Color(0.78, 0.78, 0.78)  # Reunaväri
	style.border_width_top = 2  # Yläreunan paksuus
	style.border_width_bottom = 2  # Alareunan paksuus
	style.border_width_left = 2  # Vasemman reunan paksuus
	style.border_width_right = 2  # Oikean reunan paksuus
	
	# Asetetaan tyylit painikkeelle
	self.add_stylebox_override("normal", style)  # Normal-tila
	self.add_stylebox_override("hover", style)   # Hover-tila (hiiren päällä)
	self.add_stylebox_override("pressed", style) # Pressed-tila (painettuna)
	
