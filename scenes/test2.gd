extends KinematicBody2D

var velocity = Vector2.ZERO
const SPEED = 200

func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle")
	
	velocity = move_and_slide(velocity)  # Käytä tätä, jos hahmo käyttää KinematicBody2D:ta
