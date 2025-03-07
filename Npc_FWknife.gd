extends Node2D

onready var area2d = $Area2D
onready var npc_women2 = $Area2D/NPCwomen2
onready var animated_sprite = $Area2D/NPCwomen2/AnimatedSprite

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
	
	
	animated_sprite.stop()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		animated_sprite.play("run")

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		animated_sprite.stop()
