extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D": 
		print("Game Over: You tried to cross the river!")

		get_tree().reload_current_scene()  
