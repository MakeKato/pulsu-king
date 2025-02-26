extends Area2D  # ✅ Root node must be Area2D

signal collected

func _ready():
	# Ensure this doesn't try to connect again if already connected in the editor
	if not is_connected("body_entered", self, "_on_Bottle_body_entered"):
		connect("body_entered", self, "_on_Bottle_body_entered")

func _on_Bottle_body_entered(body):
	if body.is_in_group("Player"):  # ✅ Use "Player" group instead of name
		print("Player detected!")
		emit_signal("collected")
		collect()
	else:
		print("Non-player body detected:", body)

func collect():
	print("Bottle collected!")  # Debug message
	Inventory.add_bottles(1)
	queue_free()  # Removes the bottle from the scene
