extends KinematicBody2D

onready var player_detector = $Area2D
onready var anim = $AnimatedSprite
onready var attack_sound = $AudioStreamPlayer2D
var has_played_attack_sound = false  

func _ready():
	anim.play("idle")
	
	if player_detector:
		if not player_detector.is_connected("body_entered", self, "_on_Area2D_body_entered"):
			player_detector.connect("body_entered", self, "_on_Area2D_body_entered")

		if not player_detector.is_connected("body_exited", self, "_on_Area2D_body_exited"):
			player_detector.connect("body_exited", self, "_on_Area2D_body_exited")

func _on_Area2D_body_entered(body):
	print("Pelaaja havaittu:", body.name)
	if body.is_in_group("Player"):  
		print("Animaation pitäisi vaihtua ATTACK")
		anim.play("attack")
		
		
		if attack_sound and !has_played_attack_sound:
			attack_sound.play()
			has_played_attack_sound = true
			
		body.die(1.5) 
			

func _on_Area2D_body_exited(body):
	print("Pelaaja poistui alueelta:", body.name)
	if body.is_in_group("Player"):  
		print("Pelaaja poistui alueelta, ei ääntä uudelleen")
		
		anim.play("idle")
		has_played_attack_sound = false

		
		if attack_sound.is_playing():
			attack_sound.stop()
