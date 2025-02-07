extends Area2D

onready var npc_fwknife_instance = preload("res://Npc_FWknife.tscn").instance()  # Instansioidaan NPC
onready var animated_sprite = npc_fwknife_instance.get_node("AnimatedSprite")  # Haetaan AnimatedSprite

func _ready():
	# Instansioidaan NPC ja lisätään se nykyiseen solmuun
	add_child(npc_fwknife_instance)
	
	# Animaatio pysäytetään ja asetetaan idle-tilaan heti alussa
	if animated_sprite:
		print("Animaatio pysäytettiin ja asetetaan idle-tilaan.")
		animated_sprite.stop()  # Pysäytetään animaatio heti
		animated_sprite.play("idle")  # Asetetaan animaatio idle-tilaan

# Tapahtuma, kun pelaaja menee alueelle
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):  # Tarkistetaan, onko kyseessä pelaaja
		print("Pelaaja meni alueelle")
		if animated_sprite:
			print("Aloitetaan 'default' animaatio.")
			animated_sprite.play("default")  # Aloita animaatio "default" (liikkuva animaatio)

# Tapahtuma, kun pelaaja poistuu alueelta
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):  # Tarkistetaan, onko kyseessä pelaaja
		print("Pelaaja poistui alueelta")
		if animated_sprite:
			print("Palautetaan 'idle' animaatio.")
			animated_sprite.play("idle")  # Palauta animaatio idle-tilaan (paikallaan oleva animaatio)
