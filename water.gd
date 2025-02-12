extends Area2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):  
		print("Game Over: You tried to cross the river!")
		body.die()
		
		yield(get_tree().create_timer(1.5), "timeout")
		
		get_tree().reload_current_scene()

func _on_Area2D2_body_entered(body):
	_on_Area2D_body_entered(body)
