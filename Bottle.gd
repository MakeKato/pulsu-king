extends KinematicBody2D

onready var player_detector = $Area2D
onready var anim = $AnimatedSprite

func _ready():
	anim.play("Idle")
	
	if player_detector:
		if not player_detector.is_connected("body_entered", self, "_on_Area2D_body_entered"):
			player_detector.connect("body_entered", self, "_on_Area2D_body_entered")

		if not player_detector.is_connected("body_exited", self, "_on_Area2D_body_exited"):
			player_detector.connect("body_exited", self, "_on_Area2D_body_exited")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		anim.play("Bottle")
		


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):  
		anim.play("Idle")
