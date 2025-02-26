extends Node2D

onready var area2d = $Area2D  # Viittaa suoraan Area2D solmuun
onready var npc_women2 = $Area2D/NPCwomen2  # Viittaa NPCwomen2 solmuun (Node2D)
onready var animated_sprite = $Area2D/NPCwomen2/AnimatedSprite  # Animaatiolle oikea polku

# Varmistetaan, että animaatio pysähtyy heti alussa
func _ready():
	if area2d == null:
		print("Area2D ei löytynyt!")
	else:
		print("Area2D löytyi.")
	
	if npc_women2 == null:
		print("NPCwomen2 ei löytynyt!")
	else:
		print("NPCwomen2 löytyi.")
	
	if animated_sprite == null:
		print("AnimatedSprite ei löytynyt!")
	else:
		print("AnimatedSprite löytyi.")
	
	# Pysäytä animaatio heti alussa
	animated_sprite.stop()

# Tapahtuma, kun pelaaja menee lähelle Area2D:tä
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):  # Varmistetaan, että pelaaja menee alueelle
		animated_sprite.play("run")  # Aloita animaatio, kun pelaaja astuu alueelle

# Tapahtuma, kun pelaaja poistuu alueelta
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):  # Varmistetaan, että pelaaja poistuu alueelta
		animated_sprite.stop()  # Pysäyttää animaation, kun pelaaja poistuu alueelta
