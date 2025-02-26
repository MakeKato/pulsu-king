extends TextureRect

func _ready():
	# Asetetaan venytys, joka säilyttää kuvan mittasuhteet
	stretch_mode = TextureRect.STRETCH_MODE_KEEP_ASPECT

	# Täytetään koko ruutu
	rect_size = get_viewport().size  # Tämä asettaa TextureRectin koon näytön koon mukaan
