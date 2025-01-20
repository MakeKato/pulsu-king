extends KinematicBody2D  # Käytä Node2D:tä, jos hahmo ei tarvitse fysiikkaa

var velocity = Vector2.ZERO
const SPEED = 200

func _process(delta):
	rotation = 0  # Estä hahmon pyöriminen
	
	velocity = Vector2.ZERO  # Nollaa nopeus jokaisessa framessa
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false  # Ei käännetä vaakasuunnassa
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true  # Käännetään vaakasuunnassa
	
	move_and_slide(velocity)  # Liikuta hahmoa
