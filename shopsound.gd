extends Area2D


onready var sound_player = $AudioStreamPlayer




func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)
	if body.is_in_group("Player"):
		if not sound_player.playing: 
			sound_player.play()


func _on_Area2D_body_exited(body):
	print("Body exited:", body.name)
