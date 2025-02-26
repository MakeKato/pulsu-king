extends Area2D

# Tämä varmistaa, että Area2D seuraa törmäyksiä
func _ready():
	monitoring = true  # Varmistaa, että alue tarkkailee törmäyksiä

# Tämä funktio kutsutaan, kun joku objekti menee Area2D:hen
func _on_Area2D_body_entered(body):
	if body.is_in_group("KinematicBody2D"):  # Tarkistaa, onko törmäävä objekti pelihahmo
		print("Pelaaja törmäsi alueeseen!")
