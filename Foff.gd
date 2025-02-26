extends Area2D

onready var speech_bubble = $AnimatedSprite
onready var sound_player = $AudioStreamPlayer2D  # Ensure the path is correct

func _ready():
	speech_bubble.visible = false  # Hide the bubble initially

func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):
		speech_bubble.visible = true  
		speech_bubble.play("default") 
		if not sound_player.playing: 
			sound_player.play()

func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"):  # Tarkistetaan, että pelaaja poistuu alueelta
		speech_bubble.stop()  # Pysäytetään animaatio
		speech_bubble.visible = false  # Piilotetaan puhekupla
