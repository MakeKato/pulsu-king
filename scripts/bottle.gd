extends Area2D  # ✅ Root node must be Area2D

func _on_Bottle_body_entered(body):
	if body.is_in_group("Player"):  # ✅ Use "Player" group instead of name
		print("Player detected!")
		collect()

func collect():
	print("Bottle collected!")  # Debug message
	queue_free()  # Removes the bottle from the scene
